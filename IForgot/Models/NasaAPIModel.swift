//
//  NasaAPIModel.swift
//  IForgot
//
//  Created by Marijn van den Bos on 15/02/2023.
//

import Foundation


 var getAllObjects: [NasaAPIModel] {
      var defaultObject = NasaAPIModel()
      if let objects = UserDefaults.standard.value(forKey: "user_objects") as? Data {
         let decoder = JSONDecoder()
         if let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [NasaAPIModel] {
            return objectsDecoded
         } else {
            return [defaultObject]
         }
      } else {
         return [defaultObject]
      }
   }

func saveAllObjects(allObjects: [NasaAPIModel]) {
      let encoder = JSONEncoder()
      if let encoded = try? encoder.encode(allObjects){
         UserDefaults.standard.set(encoded, forKey: "user_objects")
      }
 }





var apiKey = "itcCI2jHfrVY3pbsghGsaSzPIhsgpvsuM5pcdBao"
var apiString = ""

var nasaDatas = [NasaAPIModel]()

struct NasaAPIModel: Hashable, Codable, Identifiable{
    var date, explanation: String
    var hdurl: String
    var mediaType, serviceVersion, title: String
    var url: String
    
    enum CodingKeys: String, CodingKey {
        case date,
             explanation,
             hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title,
             url
    }
    var id: String {
        date
    }
}


