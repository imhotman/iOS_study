//
//  ContentView.swift
//  imageSwitcher
//
//  Created by 홍길동 on 2023/07/10.
//

import SwiftUI
struct TopButton View{
    var isLeft: Bool
    var body: some View{
        Button {
        } label: {
            Image(systemName: "arrow.left.circle.fill")
        }
    }
}

struct ContentView: View {
    @State var page = 1
    var body: some View {
        VStack {
            HStack{
                TopButton()
                Text("\(page) / 5").frame(maxWidth: .infinity)
                Button{
                    print("Right clicked")
                    if(page == 5){
                        page = 1
                        page += 1
                    }
                }label: {
                    Image(systemName: "arrow.right.circle.fill")
                }//.disabled(page == 5)
            }.font(.largeTitle)
            Image("cat\(page)").resizable().frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
