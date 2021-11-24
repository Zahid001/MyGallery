//
//  GalleryView.swift
//  MyGallery
//
//  Created by Md Zahidul Islam Mazumder on 22/11/21.
//

import SwiftUI

struct GalleryView: View {
    
    @StateObject var galleryVM = GalleryVM()
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()) , count: 5)
    
    var body: some View {
        NavigationView{
            ScrollView {
             
                LazyVGrid(columns: columns,spacing: 5) {
                    ForEach(galleryVM.imageInformations ?? [], id: \.id) { info in
                        
                        NavigationLink(destination: ImageDetailsView(url: info.download_url ?? "")) {
                            UrlImageView(urlString: info.download_url ?? "")
                                .frame( height: 70)
                                .scaledToFit()
                        }
                        .buttonStyle(PlainButtonStyle())
                        

                    }

                
                }
                .padding(.horizontal)
             
            }
            .navigationTitle(Text("Gallery"))
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
