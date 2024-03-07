//
//  CryptoViewModel.swift
//  CryptoCrazySwiftUI
//
//  Created by Ümit Türkmen on 7.03.2024.
//

import Foundation

class CryptoListViewMode : ObservableObject {
   
    
    
    @Published var cryptoList = [CryptoViewModel]()
    let websService = WebService()
    
    func downloadCryptos(url : URL) {
        websService.downloadCurrency(url: url) { result in
            
            switch result {
                case .failure(let error):
                    print(error)
                case .success(let cryptos):
                    if let cryptos = cryptos {
                        DispatchQueue.main.async {
                            self.cryptoList = cryptos.map(CryptoViewModel.init)
                        }
                }
            }
        }
    }    
}



struct CryptoViewModel {
    
    
    let crypto : CryptoCurrency
    
    var id : UUID? {
        crypto.id
    }
    var currency : String {
        crypto.currency
    }
    var price : String {
        crypto.price
    }
    
    
}
