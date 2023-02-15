//
//  ContentView.swift
//  IForgot
//
//  Created by Marijn van den Bos on 15/02/2023.
//

import SwiftUI


struct ContentView: View {
    @State var results = [NasaAPIModel]();
    var body: some View {
        Text("AAAA")
            .task {
                await LoadData()
            }
    }
    func LoadData() async{
            guard let url = URL (string: "https://api.nasa.gov/planetary/apod?api_key=itcCI2jHfrVY3pbsghGsaSzPIhsgpvsuM5pcdBao") else {
            print("Invalid ur")
            return
        }
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from:  data){
                    results = decodedResponse.NasaAPIModels
                    print(results)	
                }
                
        }
        catch{
            print("datafromURL failed")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
