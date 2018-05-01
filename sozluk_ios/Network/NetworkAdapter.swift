//
//  NetworkManager.swift
//  sozluk_ios
//
//  Created by mahmut akyol on 30.04.2018.
//  Copyright © 2018 mahmut akyol. All rights reserved.
//

import Foundation
import Moya
import ObjectMapper

struct NetworkAdapter {
    static let provider = MoyaProvider<ServerAPI>()
    
    static func request(
        target: ServerAPI,
        success successCallback: @escaping (Response) -> Void,
        error errorCallback: @escaping (Swift.Error) -> Void,
        failure failureCallback: @escaping (MoyaError) -> Void
    ){
        provider.request(target) { (result) in
            switch result {
            case let .success(response):
                if response.statusCode >= 200 && response.statusCode <= 300 {
                    successCallback(response)
                } else {
                    let error = NSError(domain:"com.sozluk_ios.networkLayer", code:0, userInfo:[NSLocalizedDescriptionKey: "Parsing Error"])
                    errorCallback(error)
                }
            case .failure(let error):
                failureCallback(error)
            }
        }
    }
}
