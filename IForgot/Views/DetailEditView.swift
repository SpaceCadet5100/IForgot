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
                //This creates a new section within the form with a header labeled "Title". It contains a text field control that displays the title property of the nasaAPIModel object, and allows the user to modify the property.
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
    
//This creates a new section within the form with a header labeled "version". It contains a text field control that displays the serviceVersion property of the nasaAPIModel object, and allows the user to modify the property.
    
struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        let thingToPreview = NasaAPIModel(date: "", explanation: "", hdurl: "", mediaType: "", serviceVersion: "", title: "", url: "")
          
        DetailEditView(nasaAPIModel: .constant(thingToPreview))
    }
}
