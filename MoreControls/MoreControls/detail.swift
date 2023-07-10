//
//  detail.swift
//  MoreControls
//
//  Created by 홍길동 on 2023/07/11.
//

import SwiftUI

struct detail: View {
    var item: String
    var body: some View {
        VStack{
            Image(systemName: "globe")
                .resizable()
                .frame(width: 100, height: 100)
            
            Text("Hello \(item)!").font(.largeTitle)
        }
        .navigationTitle(item)
    }
}

struct detail_Previews: PreviewProvider {
    static var previews: some View {
        detail(item: "Test")
    }
}
