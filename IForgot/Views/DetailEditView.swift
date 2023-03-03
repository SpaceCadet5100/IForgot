//
//  DetailEditView.swift
//  IForgot
//
//  Created by Jedrek Haberka-Dawidek on 02/03/2023.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var nasaAPIModel:NasaAPIModel
    
    
    var body: some View {
        Form {
            
            Section(header: Text("Title")) {
                TextField("Title", text: $nasaAPIModel.title)
                TextField("explanation", text: $nasaAPIModel.explanation)
                
            }
            
        }

    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        let thingToPreview = NasaAPIModel(date: "", explanation: "", hdurl: "", mediaType: "", serviceVersion: "", title: "", url: "")
          
        DetailEditView(nasaAPIModel: .constant(thingToPreview))
    }
}
