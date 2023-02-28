//
//  DetailView.swift
//  IForgot
//
//  Created by Marijn van den Bos on 15/02/2023.
//


import SwiftUI
import MapKit
struct DetailView: View {
    let  nasaAPIModel:NasaAPIModel
    var body: some View {

        ScrollView {
            VStack{
                Text(nasaAPIModel.title)
                    .font(.system(size: 60))
                    .padding(20)
                AsyncImage(url: URL(string: nasaAPIModel.url))
                Text(nasaAPIModel.explanation)
                    .font(.system(size: 16))
                    .padding(20)
                Text(nasaAPIModel.copyright)
                    .font(.system(size: 16))
                    .padding(20)
            }}
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(nasaAPIModel:NasaAPIModel(
            copyright: "me",
            date: "2010-09-19",
            explanation: "Known as Seyfert's Sexte…next few billion years.",
            hdurl: "https://apod.nasa.gov/apod/image/0301/sextet_hst_full.jpg",
            mediaType: "image",
            serviceVersion: "v1",
            title: "Seyfert's",
            url: "https://apod.nasa.gov/apod/image/0301/sextet_hst_c1.jpg"
        ))
    }
}
