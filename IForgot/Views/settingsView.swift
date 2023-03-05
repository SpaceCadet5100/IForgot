//
//  settingsView.swift
//  IForgot
//
//  Created by Marijn van den Bos on 03/03/2023.
//

import SwiftUI

struct settingsView: View {
    @Environment(\.dismiss) var dismiss
    @State private var reminder = false
    
    var body: some View {
        NavigationView{
            Form{
                Button("Set Reminder") {
                    sendNotification()
                }
                Button("Grant notification permission") {
                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                        if success {
                            print("All set!")
                        } else if let error = error {
                            print(error.localizedDescription)
                        }
                    }
                }
            }.navigationTitle("Settings")
        }
    }
    
    func sendNotification()  {
        let content = UNMutableNotificationContent()
        content.title = "New daily photo uploaded"
        content.subtitle = "Specialy for you in the Iforgetapp \(NSFullUserName())"
        content.sound = UNNotificationSound.default
        
        // show this notification five seconds from now
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        // choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        // add our notification request
        UNUserNotificationCenter.current().add(request)
        
    }
}

