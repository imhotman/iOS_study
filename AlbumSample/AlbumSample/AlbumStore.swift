//
//  AlbumStore.swift
//  AlbumSample
//
//  Created by 홍길동 on 2023/07/13.
//
//꿀팁? url뒤쪽에 "slow php"하면 느리게 로드함(환경이 좋아도 2~3초 느리게 로드)

import Foundation

struct Album: Decodable{ //옛날에 이것 저것 해서 디코더 해야 했던 신세에서 자동으로 되는지 검사도 해주는것
    let artistName: String
    let albumTitle: String
    let image: String
}

struct AlbumResponse: Decodable{
    let album: [Album]
}

class AlbumStore: ObservableObject{//    엘범스토어 객체는 하나만 만들어져요 (싱글턴 패턴)
    private static let instance = AlbumStore()
    static func get() -> AlbumStore{ instance }
    @Published var albums = [Album]()
    
    private init() {}   //싱글턴으로 생성하기 때문에 엘범스토어를 객체로 만들어버림 그리고 프라이베이트 써서 다른 곳에서 쓰는걸 막아버림
    
    func load() {
        guard let url = Bundle.main.url(forResource: "res/Albums.json", withExtension: "") else {
            print("여기에요 여기 문제가 있어요")
            return
        }
        //원래는 이렇게 해야 한다
//        do{
//            data = try Data(contentsOf: URL)
//        } catch{
//
//        }
        
        guard let data = try? Data(contentsOf: url) else {//이렇게 해도 가능하다.
                print("data load failed")
                return
        }
        let decoder = JSONDecoder()
        guard let albumResp = try? decoder.decode(AlbumResponse.self, from: data) else{
            print("Invalid json")
            return
        }
        albums = albumResp.albums
    }
    func loadRemote(){
        let url = URL(string: "http://scgyong.net/thumbs/index.php")!
        URLSession.shared.dataTask(with: url) { data, resp, err Int
            guard let data = data else { return }
            let decoder = JSONDecoder()
            guard let albumResp = try? decoder.decode(AlbumResponse.self, from: data) else{
                print("Invalid json")
                return
            }
            OperationQueue.main.addOperation {
                self.albums = albumResp.albums
            }
        }.resume()
    }
}
