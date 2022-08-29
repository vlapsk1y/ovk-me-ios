//
//  APIService.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 29.07.2022.
//

import Foundation
import Combine

protocol APIService {
    func request<T: Decodable>(with builder: RequestBuilder) -> AnyPublisher<T, APIError>
}
