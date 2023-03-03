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
    @State var nasaAPIModel:NasaAPIModel
  
    @EnvironmentObject var nasaData: Storage

    
    @State private var isPresentingEditView = false
    
    var body: some View {
        ScrollView {
            VStack{
                AsyncImage(url: URL(string: nasaAPIModel.url)){ image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }

                Text(nasaAPIModel.explanation)
                    .font(.system(size: 16))
                    .padding(3)
                    .fixedSize(horizontal: false, vertical: true)
                Text("This picture was taken on: \(nasaAPIModel.date)")
                    .font(.system(size: 16))
                  
                Text("The service number of this photo is: \(nasaAPIModel.serviceVersion)")
                    .font(.system(size: 16))
                
            }.frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height + 500) }
                .navigationTitle(nasaAPIModel.title)
                .toolbar {
                    Button("Edit") {
                        isPresentingEditView = true
                        
                        
                    }

                 }
                .sheet(isPresented: $isPresentingEditView) {
                    
                    
                    
                    
                    NavigationView {
                        
                        DetailEditView(nasaAPIModel: $nasaAPIModel)
                        
                            .navigationTitle("Edit")
                        
                            .toolbar {
                                
                                ToolbarItem(placement: .cancellationAction) {
                                    
                                    Button("Cancel") {
                                        
                                        isPresentingEditView = false
                                        
                                    }
                                    
                                }
                                
                                ToolbarItem(placement: .confirmationAction) {
                                    
                                    Button("Done") {
                                        
                                        isPresentingEditView = false
                                        print(nasaAPIModel.title)
                                        nasaData.nasaList.insert(nasaAPIModel, at: 1)
                                    }
                                    
                                }
                                
                            }
                    }
                }

    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {

        let thingToPreview = NasaAPIModel(date: "", explanation: "", hdurl: "", mediaType: "", serviceVersion: "", title: "", url: "")
        //DetailView(nasaAPIModel: .constant(thingToPreview))
        DetailView(nasaAPIModel: thingToPreview)

    }
}
