//
//  TapGestureView.swift
//  GestureSample
//
//  Created by 홍길동 on 2023/07/12.
//

import SwiftUI

struct TapGestureView: View {
    @State var touchCount = 0
    var title: String { //이게 바로 computing property다!
        if touchCount == 0{ return ""}
        return "\(touchCount)"
    }
    var body: some View {
        //원래는 제스쳐를 주는 방법은 3가지가 있었다.
        //touchesBegan(), touchesMoved(), touchesEnded()만 있었는데 더 많이 생겼다(TapGestureRecognize).
        //터치해서 하는 동작은 터치, 드래그(풀링), 플릭(스크롤 날리는거), 스와이프, 탭 등이 있다.
        //플릭은 사용할때 스크롤 남은 정도, 속도 이런걸 조절해야 한다.
        //멀티 터치는 핀치(줌 인, 줌 아웃(위치상관x, 시작됐다 끝났다만 알고싶음)), 로테이션(두 개를 잡고 돌리는것(각도가 궁금행))
        VStack {
            Text("Tap Me! \(touchCount == 0 ? "" : "\(touchCount)")")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.yellow)
                .onTapGesture { //이거 쓰는게 .gesture. 쓰는 것 보다 더 편한듯
                    touchCount += 1
                }
            Text("Long Press Me! \(title)")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.orange)
                .onLongPressGesture{
                    touchCount += 10
                }
//                .gesture(
//                    LongPressGesture()
//                        .onEnded{ _ in
//                            touchCount += 10
//                        }
//                )
        }
//            .gesture( ---->>> 퇴물인듯?
//                TapGesture()
//                    .onEnded{ //onEnded를 호출해서 동작을 만들어야 한다.
//                        print("Tapped")
//                        touchCount += 1
//                    }
//            )탭 제스쳐 객체를 만들어서 쥐어줘야 한다.
    }
}

struct TapGestureView_Previews: PreviewProvider {
    static var previews: some View {
        TapGestureView()
    }
}
