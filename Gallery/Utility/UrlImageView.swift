//
//  UrlImageView.swift
//  MyGallery
//
//  Created by Md Zahidul Islam Mazumder on 22/11/21.
//

import Foundation
import SwiftUI

struct UrlImageView: View {
    @ObservedObject var urlImageModel: UrlImageModel
    
    init(urlString: String?) {
        urlImageModel = UrlImageModel(urlString: urlString)
    }
    
    var body: some View {
        if let url = urlImageModel.image{
            Image(uiImage: url)
                .resizable()
                
//                .frame(width: 70, height: 70)
//                .scaledToFit()
        }
        else{
            ProgressView()
        }
        
    }
    
    static var defaultImage = UIImage(named: "NewsIcon")
}

struct UrlImageView_Previews: PreviewProvider {
    static var previews: some View {
        UrlImageView(urlString: nil)
    }
}
