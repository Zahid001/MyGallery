//
//  ImageInformation.swift
//  MyGallery
//
//  Created by Md Zahidul Islam Mazumder on 22/11/21.
//

import Foundation

struct ImageInformation : Codable,Identifiable {
    let id : String?
    let author : String?
    let width : Int?
    let height : Int?
    let url : String?
    let download_url : String?
}
