//
//
//  DetailView.swift
//  IForgot
//
//  Created by Marijn van den Bos on 15/02/2023.
//

import SwiftUI
import MapKit
import WrappingHStack
import AVFoundation

struct TodaysView: View {
    @EnvironmentObject var nasaData: Storage
    @Binding var nasaAPIModel:NasaAPIModel

    let speechSynthesizer = AVSpeechSynthesizer()
    
    var body: some View {
        NavigationView{
        ScrollView {
            VStack{
                Button("read the text out loud"){
                    //make the speach synthesiser talk
                    let utterance = AVSpeechUtterance(string:  nasaAPIModel.explanation)
                    utterance.pitchMultiplier = 1.0
                    utterance.rate = 0.5
                    utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                    speechSynthesizer.speak(utterance)
                    
                    if(speechSynthesizer.isSpeaking){
                        speechSynthesizer.pauseSpeaking(at: .immediate)
                        
                    }
                    if(speechSynthesizer.isPaused){
                        speechSynthesizer.continueSpeaking()
                        
                    }
                }
                // this loads in a detail view image ASYNC from the rest of the content
                //to make the loading process not impact the application preformance
                AsyncImage(url: URL(string: nasaAPIModel.url)){ image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                
                Text(nasaAPIModel.explanation)
                    .font(.system(size: 16))
                    .padding(3)
                    .fixedSize(horizontal: false, vertical: true)
                Text("This picture was taken on: \(nasaAPIModel.date)")
                    .font(.system(size: 16))
                
                Text("The service number of this photo is: \(nasaAPIModel.serviceVersion)")
                    .font(.system(size: 16))
                
            }.frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height + 500) }
        //.navigationTitle(nasaAPIModel.title, displayMode: .inline)
        .navigationTitle("Today's Image")
        .toolbar {
            NavigationLink(destination: NasaList()) {
                Text("Favorites")
            }
           
        }
        }
    }
}

struct TodaysView_Previews: PreviewProvider {
    static var storage = Storage()
    
    static var previews: some View {
        let thingToPreview = NasaAPIModel(date: "", explanation: "", hdurl: "", mediaType: "", serviceVersion: "", title: "", url: "")
        TodaysView(nasaAPIModel: .constant(thingToPreview))
            .environmentObject(storage)
        
    }
}
