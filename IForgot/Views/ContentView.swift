import SwiftUI


struct ContentView: View {
    @State var results = [NasaAPIModel]();
    @State var nasaData: NasaAPIModel?
    
    var body: some View {
        VStack{
        Text("a")
        }.onAppear(perform: LoadData)
    }
     
    
    func LoadData() {
        guard let url = URL (string: "https://api.nasa.gov/planetary/apod?api_key=itcCI2jHfrVY3pbsghGsaSzPIhsgpvsuM5pcdBao&count=5") else {
            print("Invalid url")
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request)
        {
            data, response, error in
            var newResults = results
            if let error = error {
                print("Error: fetch failed: \(error.localizedDescription)")
                return
            }
         
            guard let data = data else {
                print("ERROR: failed to get data form URLSession")
                return
            }
            do {
                newResults = try JSONDecoder().decode([NasaAPIModel].self, from:data)
                print(newResults[0].url)
            }
            catch{
                print("woopsie")
            }
            DispatchQueue.main.async {
            self.results = newResults

            }
        }
        task.resume()
    }
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
