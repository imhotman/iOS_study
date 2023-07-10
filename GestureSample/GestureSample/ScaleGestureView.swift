//
//  ScaleGestureView.swift
//  GestureSample
//
//  Created by 홍길동 on 2023/07/12.
//

import SwiftUI

struct ScaleGestureView: View {
    @State var finalScale = 1.0
        @State var currScale = 1.0
        var body: some View {
            VStack {
                Image("cat1")
                    .resizable()
                    .aspectRatio(1.0, contentMode: .fit)
                    .scaleEffect(finalScale * currScale) //줌 인 줌 아웃은 곱 연산으로 해야 한다.
                    .gesture(
                        MagnificationGesture()
                            .onChanged { scale in
                                currScale = scale
                            }
                            .onEnded { scale in
                                finalScale *= currScale
                                currScale = 1.0
                            }
                    )
            }
            .navigationTitle("Scale Gesture")
        }
}

struct ScaleGestureView_Previews: PreviewProvider {
    static var previews: some View {
        ScaleGestureView()
    }
}
