//
//  ContentView.swift
//  Flags
//
//  Created by 홍길동 on 2023/07/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(Region.all, id: \.title){ region in
                    Section(region.title){
                        ForEach(region.countries, id:\.name){
                            country in
                            HStack{
                                Image(country.file)
                                VStack{
                                    Text(country.name)
                                        .font(.title)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text("\(country.name.count) million people")
                                        .foregroundColor(.gray)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                        }
                    }
                }
    //            Section("Group2")   {
    //                Text("Korea0")
    //                Text("Korea1")
    //                Text("Korea2")
    //                Text("Korea3")
    //                Text("Korea4")
    //                Text("Korea5")
    //                Text("Korea6")
    //            }//섹션으로 나누면 그룹이 생김
            }
            .onAppear{}//화면에 나타날 때 {}안의 내용이 실행되는 코드
            .listStyle(.plain)//그룹이 바뀔때 타이틀이 바뀌는 것
            .navigationTitle("iTunes Country")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
