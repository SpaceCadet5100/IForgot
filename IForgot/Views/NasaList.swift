//
//  NasaList.swift
//  IForgot
//
//  Created by Marijn van den Bos on 28/02/2023.
//

import SwiftUI

struct NasaList: View {
    
    @Binding var nasaDatas:[NasaAPIModel]
    var body: some View {
        
        
        NavigationView{
            List {
                ForEach(nasaDatas,
                        id: \NasaAPIModel.date) {
                    nasaData in
                    NavigationLink(
                        destination: DetailView(nasaAPIModel: nasaData)
                    )
                    {
                        Text(nasaData.date)
                    }
                }
                        .onMove { from, to in
                            nasaDatas.move(fromOffsets: from, toOffset: to)

                        }
                        .onDelete { indexSet in
                            nasaDatas.remove(atOffsets: indexSet)

                }
            }.toolbar {
                           EditButton()
            }
            .overlay(Group {
                           if nasaDatas.isEmpty {
                               
                               SplashView()
                           }
                       })
            .navigationTitle("Entries")
        }
       
    }
}

struct NasaList_Previews: PreviewProvider {
    static var previews: some View {
        //let thingToPreview = NasaAPIModel(date: "", explanation: "", hdurl: "", mediaType: "", serviceVersion: "", title: "", url: "")
        let thingToPreview = [NasaAPIModel]()
        
        NasaList(nasaDatas: .constant(thingToPreview))
    }
}
