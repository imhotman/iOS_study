//
//  GridStack.swift
//  MakeGame
//
//  Created by 홍길동 on 2023/07/13.
//

import SwiftUI

struct GridStack<Content: View>: View { //클래스에서 <~>를 써서 뭔가 추가해줬다
    let cols: Int
    let rows: Int
    let content: (_ row: Int, _ col: Int) -> Content
    var body: some View {
        VStack{
            ForEach(0 ..< rows, id: \.self){row in
                HStack{
                    ForEach(0 ..< cols, id: \.self) { col in
                        self.content(row, col)
                    }
                }
            }
        }
    }
}

struct GridStack_Previews: PreviewProvider {
    static var previews: some View {
        GridStack(cols: 5, rows: 6) { row, col in
            Text("\(row).\(col)")
                .font(.largeTitle)
                .padding(12)
                .border(Color.red)
        }
    }
}
