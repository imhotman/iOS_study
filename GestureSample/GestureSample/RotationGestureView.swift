//
//  RotationGestureView.swift
//  GestureSample
//
//  Created by 홍길동 on 2023/07/12.
//

import SwiftUI

//String(format: "%.1f", 10.2222222999999) // 요러면 C언어의 print동작과 같음

struct RotationGestureView: View {
    @State var angle = Angle.zero
    var body: some View {
        VStack {
            Text("Angle \(String(format: "%.1f", angle.degrees))")
            Spacer()
            VStack{
                Image(systemName: "arrow.right.circle")
                    .font(.largeTitle)
                    .scaleEffect(5.0)
                    .foregroundColor(.brown)
                    .padding()
                Text("Rotation!")
                    .font(.largeTitle)
                    .padding()
            }
            .foregroundColor(.purple)
            .background(Color.orange.opacity(0.3))
        }
        .background(Color.blue.opacity(0.2))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle("Rotation")
        .gesture(
            RotationGesture()
                .onChanged{value in
                    angle = value
                }
                .onEnded{_ in
                    angle = .zero
                }
        )
        Spacer()
    }
}

struct RotationGestureView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RotationGestureView()
        }
    }
}

