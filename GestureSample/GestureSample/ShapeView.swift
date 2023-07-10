//
//  ShapeView.swift
//  GestureSample
//
//  Created by 홍길동 on 2023/07/12.
//

import SwiftUI

struct ShapeView: View {
    var body: some View {
        VStack{
                Color.red
                    .frame(width: 200, height: 50)
                Rectangle()
                    .stroke(lineWidth: 30) //stroke -> 선 따라 그리는 것, fill -> 채우는 것
                    .fill(
                        LinearGradient(
                            colors: [.red, .blue],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(height: 50)
                    .cornerRadius(10)
                    //.padding()
                RoundedRectangle(cornerRadius: 20)
                    //.stroke(lineWidth: 20)
                    .fill(
                        RadialGradient(
                            colors: [.yellow, .red],
                            center: .center,
                            startRadius: 0,
                            endRadius: 150
                        )
                    )
                    .padding()
                Capsule()
                    .stroke(lineWidth: 30)
                    .frame(height: 50)
                    //.padding(.top)
                Circle()
                    .frame(width: 50)
                    //.padding()
                Ellipse()
                    .frame(width: 50, height: 100)
                GeometryReader{ gr in
                    Path { g in
                        let rect = CGRect(origin: .zero, size: gr.size)
                        g.move(to: CGPoint(x: rect.size.width / 2, y: 0))
                        g.addQuadCurve(//곡선을 그리는 커브
                            to: CGPoint(x: rect.width / 2, y: rect.height),
                            control: CGPoint(x: rect.width, y: rect.height)
                        )
                        g.addQuadCurve(//곡선을 그리는 커브
                            to: CGPoint(x: rect.width / 2, y: 0),
                            control: CGPoint(x: 0 / 2, y: rect.height)
                        )
                    }
                    .fill(
                        LinearGradient(
                        colors: [.white, .green],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                        )
                    )
                    //.padding(20)
                }
                .frame(width: 200)
            Path{ g in
                g.move(to: .zero)
                g.addLine(to: CGPoint(x: 100, y: 200))
                g.addLine(to: CGPoint(x: 200, y: 100))
                g.addLine(to: CGPoint(x: 150, y: 50))
                g.closeSubpath()
            }
            .stroke(style: StrokeStyle(
                lineWidth: 30,
                lineCap: .round,
                lineJoin: .bevel
            ))
        }
            .navigationTitle("Shapes")
    }
}

struct ShapeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ShapeView()
        }
    }
}
