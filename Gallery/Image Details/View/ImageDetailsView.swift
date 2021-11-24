//
//  ImageDetailsView.swift
//  MyGallery
//
//  Created by Md Zahidul Islam Mazumder on 22/11/21.
//

import SwiftUI

struct ImageDetailsView: View {
    
    @StateObject var imageDetailsVM = ImageDetailsVM()
    
    @State private var scale: CGFloat = 1.0
    
    @State var showShareSheet = false
    
    let url:String
    
    var mainImageView: some View {
        UrlImageView(urlString: url)
            .scaledToFit()
            .scaleEffect(self.scale)
            .gesture(
                MagnificationGesture()
                    .onChanged { value in
                        // Anything with value
                        print("\(value)")
                        scale = value
                    }.onEnded { value in
                        scale = 1.0
                    })
    }
    
    var body: some View {
        //  ScrollView{
        VStack {
            Spacer()
            
            mainImageView
            
            Button(action: {
              
                imageDetailsVM.downloadImage(from: url)
                
            }, label: {
                
                
                
                HStack{
                    Image(systemName: "square.and.arrow.down")
                        .foregroundColor(.gray)
                    Text(imageDetailsVM.isSaved ? "Photo Saved Succesfully!!!" : "Save Photo")
                }
                .foregroundColor(.black)
                
            })
                .disabled(imageDetailsVM.isSaved)
                .padding()
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                                            
                          Button(action: {
                              
                            
                              
                              share(items: [ mainImageView
                                                .asImage()
                                           ]
                              )
                              
                          }) {
                              Image(systemName: "square.and.arrow.up")
                              
                           }
                          
                                             
                     }
                }
        
        //  }
    }
}

//struct ImageDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ImageDetailsView()
//    }
//}
