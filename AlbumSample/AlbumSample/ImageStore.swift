//
//  ImageStore.swift
//  AlbumSample
//
//  Created by 홍길동 on 2023/07/14.
//

import SwiftUI//그냥 Image 하면 얘가 뭔 말인지 못알아먹으니깐 이 클래스를 임포트 한다

class ImageStore{//객체를 만들지 않고 ImageStore.~~요런 식으로만 사용 가능하게 만들기
    private static var cache = [String: Image]()
    static func load(urlString: String, callback: @escaping(Image) -> Void){//이미지를 그냥 반환하게 하면 너무 느려질 수가 있으므로 이미지를 callback하고 그 뒤를 수행하게 한다, 쓰레드를 넘나드는 함수들은 @escaping을 사용해야 한다
        if let img = cache[urlString]{
            callback(img)
            return
            
        }
            OperationQueue().addOperation {
                guard let url = URL(string: urlString) else { return }
                guard let data = try? Data(contentsOf: url) else { return }
                guard let uiImg = UIImage(data: data) else { return }
                let img = Image(uiImage: uiImg)
                OperationQueue.main.addOperation {
                    cache[urlString] = img
                    callback(img)
                    
                }
            }
        }
    }
