//
//  ContentView.swift
//  IForgot
//
//  Created by Jedrek Haberka-Dawidek on 31/01/2023.
//

import SwiftUI
import UserNotifications
struct SplashView: View {
    @State private var isRotating = 0.0
    
    var body: some View {
        VStack {
            // A text element that displays a loading message.
            Text("loading our application")
            // An image element that displays a loading image.
            Image("loading")
                .imageScale(.small)
                .foregroundColor(.accentColor)
                .rotationEffect(.degrees(isRotating))
            // A SwiftUI animation that continuously rotates the image.
                            .onAppear {
                                withAnimation(.linear(duration: 1)
                                        .speed(0.1).repeatForever(autoreverses: false)) {
                                    isRotating = 360.0
                                }
                            }
                .padding()
        }
        
        
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            SplashView()
        }
    }}
