//
//  ContentView.swift
//  CryptoCrazySwiftUI
//
//  Created by Ümit Türkmen on 7.03.2024.
//

import SwiftUI

struct MainView: View {
    
    let url = "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json"
    @ObservedObject var cryptoLVM : CryptoListViewMode
    init() {
        self.cryptoLVM = CryptoListViewMode()
    }
    
    var body: some View {
        NavigationView {
            List(cryptoLVM.cryptoList, id:\.id) {crypto in
                VStack{
                    Text(crypto.currency)
                        .font(.title3)
                        .foregroundStyle(.blue)
                        .frame(maxWidth: .infinity,alignment: .leading)
                    Text(crypto.price)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity,alignment: .leading)
                }
            }.navigationTitle("Crypto Crazy")
        }.onAppear {
            cryptoLVM.downloadCryptos(url: URL(string: url)!)
        }.preferredColorScheme(.light)
    }
}

#Preview {
    MainView()
}
