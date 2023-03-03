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
                    
                        .onDelete { indexSet in
                            nasaData.nasaList.remove(atOffsets: indexSet)

                }
            }.toolbar {
                       //    EditButton()
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
        NasaList()
            .environmentObject(storage)
    }
}
