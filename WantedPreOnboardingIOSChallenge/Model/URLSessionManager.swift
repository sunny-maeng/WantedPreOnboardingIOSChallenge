//
//  URLSessionManager.swift
//  WantedPreOnboardingIOSChallenge
//
//  Created by 맹선아 on 2023/03/01.
//

import Foundation

enum ImageURL: Int, CaseIterable {

    case image1 = 1, image2, image3, image4, image5

    var url: URL? {
        switch self {
        case .image1:
            return URL(string: "https://wallpaperaccess.com/download/europe-4k-1369012")
        case .image2:
            return URL(string: "https://wallpaperaccess.com/download/europe-4k-1318341")
        case .image3:
            return URL(string: "https://wallpaperaccess.com/download/europe-4k-1379801")
        case .image4:
            return URL(string: "https://wallpaperaccess.com/download/cool-lion-167408")
        case .image5:
            return URL(string: "https://wallpaperaccess.com/download/ironman-hd-323408")
        }
    }

}

struct URLSessionManager {

    private let session = URLSession.shared

    func fetchData(url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        session.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard error == nil else {
                completion(.failure(.requestFailError))
                return
            }

            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode)  else {
                let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
                completion(.failure(.httpResponseError(code: statusCode)))
                return
            }

            guard let data = data else {
                completion(.failure(.noDataError))
                return
            }

            completion(.success(data))
        }.resume()
    }

}

enum NetworkError: Error {

    case requestFailError
    case httpResponseError(code: Int)
    case noDataError
    case generateUrlFailError
}

