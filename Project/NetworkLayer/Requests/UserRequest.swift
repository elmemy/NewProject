//
//  UserRequest.swift
//  Project
//
//  Created by Ahmed Elmemy on 10/07/2022.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestBuilder,APIRequestHandler {
    
    
    case login(userType: String, phone: String,password:String,deviceID:String,deviceType:String)
  
    // MARK: - Path
    internal var path: String {
        switch self {
        case .login:
            return "sign-in"
        }
        
    }
    
    
    // MARK: - Parameters
    internal var parameters: Parameters {
        var params = Parameters.init()
        switch self {
        case .login(let userType, let phone, let password, let deviceID, let deviceType):
            params["user_type"] = userType
            params["phone"] = phone
            params["password"] = password
            params["device_id"] = deviceID
            params["device_type"] = deviceType
            
      
         
        default:
            break
        }
        
        
        return params
        
        
    }
    
    
    
    
    // MARK: - Methods
    internal var method: HTTPMethod {
        switch self {
        case .login:
            return .post
            
        default:
            return .get
            
       
        
        }
        
    }
    
    
    
    
    
}
