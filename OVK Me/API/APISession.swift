//
//  APISession.swift
//  OVK Me
//
//  Created by Vladimir Lapskiy on 29.07.2022.
//

import Foundation
import Combine

struct APISession: APIService {
    func request<T>(with builder: RequestBuilder) -> AnyPublisher<T, APIError> where T : Decodable {
        let decoder = JSONDecoder()
        
        return URLSession.shared
            .dataTaskPublisher(for: builder.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in .unknown}
            .flatMap { data, response -> AnyPublisher<T, APIError> in
                if let response = response as? HTTPURLResponse {
                    if (200...299).contains(response.statusCode) {
                        do {
                            let rrr = try JSONDecoder().decode(T.self, from: data)
                            print(rrr)
                        } catch {
                            print(error)
                        }
                        
                        return Just(data)
                            .decode(type: T.self, decoder: decoder)
                            .mapError {_ in .decodingError}
                            .eraseToAnyPublisher()
                    } else {
                        do {
                            let shit = try decoder.decode(ServerError.self, from: data)
                            return Fail(error: APIError.httpError(shit.errorCode))
                                    .eraseToAnyPublisher()
                        } catch { }
                        return Fail(error: APIError.unknown)
                                .eraseToAnyPublisher()
                    }
                }
                return Fail(error: APIError.unknown)
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
