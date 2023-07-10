//
//  DragGestureView.swift
//  GestureSample
//
//  Created by 홍길동 on 2023/07/12.
//

import SwiftUI

func +(a: CGSize, b: CGSize) -> CGSize{
    CGSize(
        width: a.width + b.width,
        height: a.height + b.height
    )
}

struct DragGestureView: View {
    @State var globePosition = CGSize.zero//(width: 0, height: 0) zero는 이거랑 똑같다.
    @State var globeFinal = CGSize.zero
    var body: some View {
        VStack{
            Image(systemName: "globe")
                .font(.largeTitle)
                .scaleEffect(5.0)
                .offset(globePosition + globeFinal)
                .foregroundColor(.green)
                .gesture(
                    DragGesture()
                        .onChanged{ value in //continuous gesture같은 경우에 onChanged 사용
                            globePosition = value.translation
                            print("Dragging")
                        }
                        .onEnded{ _ in
                            globeFinal = globePosition + globeFinal
                            //globePosition = .zero //이거는 드래그 하다가 놓으면 x와 y가 초기화되어서 가운데로 감
                            globePosition = CGSize.zero
                        }
                )
        }
        .navigationTitle("Moving Globe")
    }
}

struct DragGestureView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            DragGestureView()
        }
    }
}
