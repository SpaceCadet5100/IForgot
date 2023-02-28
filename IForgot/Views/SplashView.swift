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
            Button("Notification permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                    
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }                }
    
            Text("loading our application")
            Image("loading")
                .imageScale(.small)
                .foregroundColor(.accentColor)
                .rotationEffect(.degrees(isRotating))
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
