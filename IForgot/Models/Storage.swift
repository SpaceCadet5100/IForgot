//
//  Storage.swift
//  IForgot
//
//  Created by Jedrek Haberka-Dawidek on 03/03/2023.
//

import Foundation

class Storage: ObservableObject {
    
    private let datakey = "appdata"
    
    @Published var nasaList: [NasaAPIModel] = []
    
    init()
    {
        recieveData()
    }
    
    
    func recieveData()
    {
        if let data = UserDefaults.standard.data(forKey: datakey) {
            do {
                let obj = try JSONDecoder().decode([NasaAPIModel].self, from: data)
                self.nasaList = obj
            }
            catch {
                print(error.localizedDescription)
            }
  
        }
        
    }
    
    func saveData(incomingData: [NasaAPIModel])
    {
            do {
                let data = try JSONEncoder().encode(incomingData)
                UserDefaults.standard.set(data, forKey: datakey)
            }
            catch {
                print(error.localizedDescription)

            
        }
    }
}
