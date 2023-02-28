//
//  NasaAPIModel.swift
//  IForgot
//
//  Created by Marijn van den Bos on 15/02/2023.
//

import Foundation


var apiKey = "itcCI2jHfrVY3pbsghGsaSzPIhsgpvsuM5pcdBao"
var apiString = ""

var nasaDatas = [NasaAPIModel]()

struct NasaAPIModel: Codable{
    var copyright, date, explanation: String
    var hdurl: String
    var mediaType, serviceVersion, title: String
    var url: String
    
    enum CodingKeys: String, CodingKey {
        case copyright,
             date,
             explanation,
             hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title,
             url
    }
}

