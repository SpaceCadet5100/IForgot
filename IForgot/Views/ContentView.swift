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
        List{
            ForEach(results, id: \.date){ results in
                VStack{
                    Text(results.url)
                }
            }
        }.onAppear(perform: LoadData)
        
        func LoadData() {
            guard let url = URL (string: "https://api.nasa.gov/planetary/apod?api_key=itcCI2jHfrVY3pbsghGsaSzPIhsgpvsuM5pcdBao&count=5") else {
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
                
                do {
                    results = try JSONDecoder().decode([NasaAPIModel].self, from:data)
                }
                //todo moet nog gefixed worden
                
                catch{
                    print("woopsie")
                }
                
                
                DispatchQueue.main.async {
                    self.results = results
                    
                }
                
            }
            
            task.resume()
            return
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
