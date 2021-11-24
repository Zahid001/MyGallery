//
//  ApiEndPoint.swift
//  MyGallery
//
//  Created by Md Zahidul Islam Mazumder on 22/11/21.
//

import Foundation

struct ApiEndPoint {
    public var BASE_URL: String  = "https://picsum.photos/v2/"
    
    public var  GET_PHOTOS : String =  "list?page=2&limit=300"
    
    //Headers
    public var KEY_CONTENT_TYPE: String = "Content-Type"
    public var KEY_ACCEPT: String = "Accept"
    public var KEY_AUTHORIZATION:String = "Authorization"

    //Header Values
    public var VALUE_JSON: String = "application/json"
    public var VALUE_BEARER: String = "Bearer "
    public var VALUE_MULTI_PART: String = "multipart/form-data"
}
