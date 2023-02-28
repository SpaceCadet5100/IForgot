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
        if let nasaData = results {
            string = nasaData[0].url
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
            
            var newNasaData: [NasaAPIModel]?
            do {
                newNasaData = try JSONDecoder().decode([NasaAPIModel].self, from:data)
            }
            
            catch let error as NSError{
                print("woopsie \(error.domain), description= \(error.localizedDescription)")
            }
            
            catch DecodingError.keyNotFound(let key, let context){
                print("Error: could not find key \(key) in JSON \(context.debugDescription)")
            }
            catch DecodingError.valueNotFound(let type, let context){
                print("Error: could not find type \(type) in JSON: \(context.debugDescription)")
            }
            catch DecodingError.typeMismatch(let type, let context){
                print("Error: type mismatch for typ \(type) in JSON: \(context.debugDescription)")
            }
            catch DecodingError.dataCorrupted(let context){
                print("ERROR: data found to be corrupted in JSON \(context.debugDescription)")
            }
            if newNasaData == nil {
                print("woopsie failed to read or decode the data")
                return
            }
            
            DispatchQueue.main.async {
                if let value = newNasaData{
                    self.results = value
                }
                else{
                    print("value be nill")
                }
            

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
