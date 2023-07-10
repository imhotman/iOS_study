//
//  MenuView.swift
//  MakeGame
//
//  Created by 홍길동 on 2023/07/13.
//

import SwiftUI

struct MenuView: View {
    let prefixes = ["f", "t"]
    var body: some View {
        NavigationView{
            ScrollView(.vertical)
            List{
                ForEach(prefixes, id: \.self){ prefix in
                    NavigationLink{
                        GameView(prefix: prefix)
                        } label: {
                            MenuItemView()
                        }
                }
            }
            .navigationTitle("Card Game")
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

struct MenuItemView_Previews: PreviewProvider {
    let prefix: String
    static var previews: some View {
        HStack {
            Image("\(prefix)_back")
            Spacer()
            NavigationLink{
                GameView(prefix: prefix)
            }label: {
                Text("Start Game")
                    .padding()
                    .background(
                        Capsule()
                            .stroke(lineWidth: 5)
                    )
            }
        }
        .frame(height: 300)
        .background(
            ZStack{
                Color.blue
                    .cornerRadius(30)
                    .padding(20)
                Image("\(prefix)_bg")
                    .resizable()
                    .padding(40)
            }
                .rotation3DEffect(
                    .degrees(30), import SwiftUI
                    
                    struct MenuView: View {
                        let prefixes = [ "z", "l", "f", "t" ]
                        var body: some View {
                            NavigationView {
                                ScrollView(.vertical) {
                                    ForEach(prefixes, id: \.self) { prefix in
                                        MenuItemView(prefix: prefix)
                                    }
                                }
                                .background(
                                    LinearGradient(
                                        colors: [.white, .orange.opacity(0.5)],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                )
                                .navigationTitle("Memory Game")
                            }
                        }
                    }

                    struct MenuView_Previews: PreviewProvider {
                        static var previews: some View {
                            MenuView()
                        }
                    }

                    struct MenuItemView: View {
                        let prefix: String
                        var body: some View {
                            HStack {
                                Spacer()
                                Image("\(prefix)_back")
                                Spacer()
                                NavigationLink {
                                    GameView(prefix: prefix)
                                } label: {
                                    Text("Start Game")
                                        .padding()
                                        .background(
                                            Capsule()
                                                .stroke(lineWidth: 5)
                                        )
                                }
                                Spacer()
                            }
                            .frame(height: 300)
                            .background(
                                ZStack {
                                    Color.white
                                        .cornerRadius(30)
                                        .padding(20)
                                    Image("\(prefix)_bg")
                                        .resizable()
                                        .padding(40)
                                }
                                .rotation3DEffect(
                                    .degrees(30),
                                    axis: (x: 0, y: -1, z: 0))
                                .opacity(0.3)
                            )
                        }
                    }
                    axis: (x: 0, y: 0, z: 0)
                )
                .opacity(0.3)
        )
    }
}
