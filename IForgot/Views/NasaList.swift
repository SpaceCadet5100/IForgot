//
//  NasaList.swift
//  IForgot
//
//  Created by Marijn van den Bos on 28/02/2023.
//

import SwiftUI

struct NasaList: View {
    
    @State var data = nasaDatas

    var body: some View {
        
        
        NavigationView{
            List {
                ForEach(nasaDatas,
                        id: \NasaAPIModel.date) {
                    nasaData in
                    NavigationLink(
                        destination: DetailView()
                    )
                    {
                        Text(nasaData.date)
                    }
                }
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
        NasaList()
    }
}
