//
//  NetworkError.swift
//  albumsCoreData
//
//  Created by Kirk Abbott on 11/25/22.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badData
    case decodeFailure(DecodingError)
    case badStatusCode(Int)
    case serverError(Error)
    case other(Error)
    
}

extension NetworkError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .badURL:
            return NSLocalizedString("Invalid URL request OOOOOPS.", comment: "bad URL")
            
        case .badData:
            return NSLocalizedString("bad data OOOOOPS.", comment: "corruption")
            
        case .decodeFailure:
            return NSLocalizedString("Unable to decode page", comment: "decode bigtime fail")
            
        case .badStatusCode(let statCode):
            return NSLocalizedString("Data could not be found or permission is illegal. Status code: \(statCode)", comment: "bad status code")
            
        case .serverError:
            return NSLocalizedString("Server fail", comment: "server error")
            
        case .other:
            return NSLocalizedString("problemas", comment: "unknown error")
        }
    }
}
