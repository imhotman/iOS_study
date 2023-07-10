//
//  ContentView.swift
//  AlbumSample
//
//  Created by 홍길동 on 2023/07/13.
//

import SwiftUI

struct AlbumListview: View {
    @ObservedObject var albumStore = AlbumStore.get()
    var body: some View {
        VStack {
            albumImage()
            List{
                ForEach(albumStore.albums, id: \.albumTitle){   album in
                    Text(album.albumTitle)
                }
            }
            .navigationTitle("Album")
        }
        .onAppear{
            //albumStore.load()//ATS policy에러가 나는데 http, https의 차이에 따라 나는 오류다 http는 일단은 허용하지 않는데 봐줘라!를 시전할 수 있다
        }//properties에 들어가서 info에 시큐리티 세팅에 들어가고 속성을 예스로 바꿔준다 이건 검색해서 그때그때 적용하자
    }
    @State var image: Image?
    func albumImage() -> Image {//로드가 호출되고 난 후에 이미지가 로드되는 함수
        if image != nil { return image! }
        ImageStore.load(urlString: album.image) { img in
            image = img
        }
        return Image(systemName: "music.note.list")
    }
}

struct AlbumListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListview()
    }
}

struct AlbumItemView: View{
    let album: Album
    var body: some View{
        HStack{
            Image(systemName: "music.note.list")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 64)
            VStack(alignment: .leading){
                Text(album.albumTitle)
                    .font(.headline)
                    .lineLimit(2)
                    .foregroundColor(Color("AlbumTitleColor"))
                Text(album.artistName)
                    .font(.footnote)
                    .foregroundColor(Color("artistColor"))
                    .padding(.top, 4)
            }
        }
    }
}
