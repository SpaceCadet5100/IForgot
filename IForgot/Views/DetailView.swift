//
//  DetailView.swift
//  IForgot
//
//  Created by Marijn van den Bos on 15/02/2023.
//


import SwiftUI
import MapKit
import WrappingHStack
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
                    .padding(3)
                    .fixedSize(horizontal: false, vertical: true)
                Text("The copyright goes out towards: \(nasaAPIModel.copyright)")
                    .font(.system(size: 16))
                    .padding(3)
                    .fixedSize(horizontal: false, vertical: true)
                Text("This picture was taken on: \(nasaAPIModel.date)")
                    .font(.system(size: 16))
                  
                Text("The service number of this photo is: \(nasaAPIModel.serviceVersion)")
                    .font(.system(size: 16))
                    
            }.frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height + 500) }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(nasaAPIModel:NasaAPIModel(
            copyright: "Marijn van den Bos en Jedrek Dawidek",
            date: "2010-09-19",
            explanation: "This cluster of stars, known as G1, is the brightest globular cluster in the whole Local Group of galaxies. Also called Mayall II, it orbits the center of the largest nearby galaxy: M31.  G1 contains over 300,000 stars and is almost as old as the entire universe.  In fact, observations of this globular star cluster show it to be as old as the oldest of the roughly 250 known globular clusters in our own Milky Way Galaxy.  Two bright foreground stars appear in this image of G1 taken with the orbiting Hubble Space Telescope in July of 1994.  It shows detail in the distant cluster comparable to ground-based telescopic views of globular star clusters in our own Galaxy. ",
            hdurl: "https://apod.nasa.gov/apod/image/0301/sextet_hst_full.jpg",
            mediaType: "image",
            serviceVersion: "v1",
            title: "Seyfert's",
            url: "https://apod.nasa.gov/apod/image/0301/sextet_hst_c1.jpg"
        ))
    }
}
