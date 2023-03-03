//
//  NasaList.swift
//  IForgot
//
//  Created by Marijn van den Bos on 28/02/2023.
//

import SwiftUI

struct NasaList: View {
    
    @EnvironmentObject var nasaData: Storage
    var body: some View {
        
        NavigationView{
            List {
                ForEach(nasaData.nasaList,
                        id: \NasaAPIModel.date) {
                    nasaData in
                    NavigationLink(
                        destination: DetailView(nasaAPIModel: nasaData)
                    )
                    {
                        Text(nasaData.date)
                    }
                }
                      //  .onMove { from, to in
                       //     nasaData.nasaList.move(fromOffsets: from, toOffset: to)

                      //  }
                        .onDelete { indexSet in
                            nasaData.nasaList.remove(atOffsets: indexSet)
                            nasaData.saveData(incomingData: nasaData.nasaList)

                }
            }
            .overlay(Group {
                if nasaData.nasaList.isEmpty {

                               SplashView()
                           }
                       })
            .navigationTitle("Entries")
        }
       
    }
}

struct NasaList_Previews: PreviewProvider {
    static var storage = Storage()

    static var previews: some View {
        //let thingToPreview = NasaAPIModel(date: "", explanation: "", hdurl: "", mediaType: "", serviceVersion: "", title: "", url: "")
    
        NasaList()
            .environmentObject(storage)
    }
}
