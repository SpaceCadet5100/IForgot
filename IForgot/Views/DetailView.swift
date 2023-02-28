//
//  DetailView.swift
//  IForgot
//
//  Created by Marijn van den Bos on 15/02/2023.
//


import SwiftUI
import MapKit
struct DetailView: View {
    var body: some View {
        var nasaAPIModel:NasaAPIModel
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
        DetailView(nasaAPIModel:responseList.NasaAPIModels)
    }
}
