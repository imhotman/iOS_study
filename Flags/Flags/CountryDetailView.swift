//
//  CountryDetailView.swift
//  Flags
//
//  Created by 홍길동 on 2023/07/11.
//

import SwiftUI

struct CountryDetailView: View {
    let country: Country
    var body: some View {
        List{
            
            Text("\(country.name)")
        }
        .navigationTitle(country.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CountryDetailView(country: Country(name: "대한민국🇰🇷", file: "south_korea"))
        }
    }
}
