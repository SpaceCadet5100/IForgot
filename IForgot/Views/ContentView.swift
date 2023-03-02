//
//  ContentView.swift
//  IForgot
//
//  Created by Marijn van den Bos on 15/02/2023.
//
import SwiftUI


struct ContentView: View {
    @State var response: NasaAPIModel?
    @State var nasaData = nasaDatas
    var body: some View {
        self.saveResponse()
        return VStack{
            NasaList(nasaDatas: $nasaData).onAppear{
                tryLoadDataForToday()
            
                UserDefaults.standard.set(nasaDatas, forKey: "nasa")
            }
            
            HStack{
                
                Button {
                    LoadData()
                } label: {
                    Text("Random picture")
                }
                .buttonStyle(.bordered)
                
                
                
                Button("Set Reminder") {
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
                .buttonStyle(.bordered)
            }
        }
    }

    func tryLoadDataForToday(){
        //check if todays date exist
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: date)
        
        let hasTodaysData = nasaDatas.contains (where: { $0.id == dateString })
        
        if (!hasTodaysData){
            LoadData(todaysDate: true)
        }
    }
    
    func saveResponse() {
        if let response = response {
            nasaDatas.append(response)
        }
        return
    }
    
    


    func LoadData(todaysDate: Bool? = false) {
        
        let todaysDateUnwrapped = todaysDate ?? false
        
        let apiString = (todaysDateUnwrapped) ? "https://api.nasa.gov/planetary/apod?api_key=itcCI2jHfrVY3pbsghGsaSzPIhsgpvsuM5pcdBao" : "https://api.nasa.gov/planetary/apod?api_key=itcCI2jHfrVY3pbsghGsaSzPIhsgpvsuM5pcdBao&count=1"
        
        guard let url = URL (string: apiString) else {
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
            
            guard var data = data else {
                print("ERROR: failed to get data form URLSession")
                return
            }
            
            //UTF8 for left square
            if let i = data.firstIndex(of: 91) {
                data.remove(at: i)
            }
            //UTF8 for right square
            if let i = data.lastIndex(of: 93) {
                data.remove(at: i)
            }

            var newNasaData: NasaAPIModel?
            do {
                newNasaData = try JSONDecoder().decode(NasaAPIModel.self, from: data)
            }

            catch let error as NSError{
                print("Error: \(error.domain), description= \(error.localizedDescription)")
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
                print("Error: data found to be corrupted in JSON \(context.debugDescription)")
            }
            if newNasaData == nil {
                print("Error: failed to read or decode the data")
                return
            }
            
            DispatchQueue.main.async {
                //self.results.append(newNasaData ?? default value)
                self.response = newNasaData
                
                
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
