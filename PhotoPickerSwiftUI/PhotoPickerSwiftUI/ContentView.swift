//
//  ContentView.swift
//  PhotoPickerSwiftUI
//
//  Created by Ümit Türkmen on 11.03.2024.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    
    @State var selectedItem : [PhotosPickerItem] = []
    @State var data : Data?
    var body: some View {
        VStack {
            
            if let data = data {
                if let selectedImage = UIImage(data: data) {
                    Spacer()
                    Image(uiImage: selectedImage)
                        .resizable()
                        .frame(width: 300,height: 250,alignment: .center)
                }
            }
            Spacer()
            PhotosPicker(selection: $selectedItem, maxSelectionCount: 1, selectionBehavior: .default, matching: .images) {
                Text("Select Image")
            }.onChange(of: selectedItem) { newValue in
                guard let item = selectedItem.first else {
                    return
                }
                item.loadTransferable(type: Data.self) { result in
                    switch result {
                    case .success(let data):
                        if let data = data {
                            self.data = data
                        }
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
