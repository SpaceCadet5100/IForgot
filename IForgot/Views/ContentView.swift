//
//  ContentView.swift
//  IForgot
//
//  Created by Marijn van den Bos on 15/02/2023.
//

import SwiftUI


struct ContentView: View {
    @State var results = [NasaAPIModel]();
    @State var nasaData: NasaAPIModel?
    var body: some View {
        Text(getString()).onAppear(perform: LoadData)
        
         
    }
    
    func getString() -> String{
        var string = "Not found lol"
        if let nasaData = nasaData {
            string = nasaData.url
        }
        return string
    }
    
    func LoadData() {
        guard let url = URL (string: "https://api.nasa.gov/planetary/apod?api_key=itcCI2jHfrVY3pbsghGsaSzPIhsgpvsuM5pcdBao") else {
            print("Invalid url")
            return
        }
        
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request)
        {
            data, response, error in
            
            if let error = error {
                print("Error: fetch failed: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("ERROR: failed to get data form URLSession")
                return
            }
            
            var newNasaData: NasaAPIModel?
            do {
                newNasaData = try JSONDecoder().decode(NasaAPIModel.self, from:data)
            }
            //todo moet nog gefixed worden 
            
            catch{
                print("woopsie")
            }
            
            if newNasaData == nil {
                print("woopsie 2")
                return
            }
            
            DispatchQueue.main.async {
                self.nasaData = newNasaData

            }
            
        }
        
        task.resume()
    
        }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
