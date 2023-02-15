//
//  NListView.swift
//  IForgot
//
//  Created by Marijn van den Bos on 15/02/2023.
//

import SwiftUI

struct NListView: View {
    var body: some View {
        NavigationView{
            List {
                ForEach(seriesDataList, id: \Series.id){ series in
                    NavigationLink(destination: SeriesDetail(series: series)){
                        BingeRow(series: series)
                    }
                }.onDelete(perform: delete)
            }
            .toolbar {
                EditButton()
            }
            
        }
        
    }
}

struct NListView_Previews: PreviewProvider {
    static var previews: some View {
        NListView()
    }
}
