//
//  ContentView.swift
//  MoreControls
//
//  Created by 홍길동 on 2023/07/11.
//

import SwiftUI

struct ContentView: View {
    var names = [
        "Hello1", "World2", "Hello3", "World4", "Hello5", "World6",
        "Hello7", "World8", "Hello9", "World10", "Hello11", "World12"
    ]
    @State var rotDegrees = 0.0
    @State var large = false
    var body: some View {
        VStack {
            List{
                ForEach(names, id: \.self){ row in
                    NavigationLink{
                        
                    } {
                        <#code#>
                    }
                    Text(row)
                }
            }//스크롤이 가능한 리스트(하지만 리스트 안에 지정할 수 있는건 10개 까지만 가능)
            Image(systemName: "arrow.right.circle")
                .resizable()
                .aspectRatio(1.0, contentMode: .fit) //안 찌그러지게 해주는 것
                //.frame(width: large ? 200 : 100, height: 200)
                .scaleEffect(large ? 1.0 : 0.5)
                .animation(.linear(duration: 0.3), value: large)
                .foregroundColor(Color.yellow)//컴파일러가 .yellow하면 Color.yellow인거 아니깐 .yellow가능
                .rotationEffect(.degrees(rotDegrees * 360))
                .shadow(color:.red, radius: 10, x: 10, y:10)
            HStack{
                //TextEditor(text: \{rotDegrees})
                Slider(value: $rotDegrees).frame(width: 200)
            }
            Toggle(isOn: $large) {
                Text("Shows large Circle")
            }.padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(colors: [.white, .cyan, .red], startPoint: .topLeading, endPoint: .bottomTrailing)//그라데이션
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
