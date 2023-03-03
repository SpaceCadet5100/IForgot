//
//  DetailEditView.swift
//  IForgot
//
//  Created by Jedrek Haberka-Dawidek on 02/03/2023.
//
	
import SwiftUI

struct DetailEditView: View {
    @Binding var  nasaAPIModel:NasaAPIModel

    
    var body: some View {
        Form {
                    Section(header: Text("Title")) {
                        TextField("Title", text: $nasaAPIModel.title)
                    }.padding(.horizontal, 16)
                    Section(header: Text("explanation")) {
                        TextField("explanation", text: $nasaAPIModel.explanation)}.padding(.horizontal, 16)
            Section(header: Text("date")) {
                TextField("date", text: $nasaAPIModel.date)}.padding(.horizontal, 16)
                }
        Section(header: Text("version")) {
            TextField("version", text: $nasaAPIModel.serviceVersion)}.padding(.horizontal, 16)
            }
    }
    

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        let thingToPreview = NasaAPIModel(date: "", explanation: "", hdurl: "", mediaType: "", serviceVersion: "", title: "", url: "")
          
        DetailEditView(nasaAPIModel: .constant(thingToPreview))
    }
}
