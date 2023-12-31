//
//  ContentView.swift
//  GestureSample
//
//  Created by 홍길동 on 2023/07/12.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView{
            List{
                NavigationLink{
                    TapGestureView()
                }label: {
                    Text("Tap & LongPress(Tap)")
                }
                NavigationLink{
                    DragGestureView()
                }label: {
                    Text("Tap & LongPress(Drag)")
                }
                NavigationLink{
                    RotationGestureView()
                }label: {
                    Text("Tap & LongPress(Rotation)")
                }
                NavigationLink{
                    ScaleGestureView()
                }label: {
                    Text("Scale")
                }
                NavigationLink{
                    AnimationView()
                }label: {
                    Text("Animation")
                }
            }
            .navigationTitle("Gestures Test")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
