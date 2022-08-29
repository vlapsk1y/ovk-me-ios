//
//  APIError.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 29.07.2022.
//

import Foundation

enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}

extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .httpError(let code):
            return NSLocalizedString("\(code)", comment: "")
        case .decodingError:
            return NSLocalizedString("", comment: "")
        case .unknown:
            return NSLocalizedString("Check internet connection", comment: "")
        }
    }
}
