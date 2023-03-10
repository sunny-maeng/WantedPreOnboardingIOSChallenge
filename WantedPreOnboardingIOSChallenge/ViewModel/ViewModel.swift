//
//  ViewModel.swift
//  WantedPreOnboardingIOSChallenge
//
//  Created by ๋งน์ ์ on 2023/03/01.
//

import UIKit

final class ViewModel {

    private let urlSessionManager: URLSessionManager = URLSessionManager()

    private var image1: UIImage? = nil {
        didSet {
            updateImage1(image1)
        }
    }
    private var image2: UIImage? = nil {
        didSet {
            updateImage2(image2)
        }
    }
    private var image3: UIImage? = nil {
        didSet {
            updateImage3(image3)
        }
    }
    private var image4: UIImage? = nil {
        didSet {
            updateImage4(image4)
        }
    }
    private var image5: UIImage? = nil {
        didSet {
            updateImage5(image5)
        }
    }

    private let defaultImage: UIImage? = UIImage(systemName: "photo")

    var updateImage1: ( (UIImage?) -> Void ) = { _ in}
    var updateImage2: ( (UIImage?) -> Void ) = { _ in  }
    var updateImage3: ( (UIImage?) -> Void ) = { _ in  }
    var updateImage4: ( (UIImage?) -> Void ) = { _ in  }
    var updateImage5: ( (UIImage?) -> Void ) = { _ in  }

    func placeDefaultImage(number: Int) {
        switch number {
        case 1: image1 = defaultImage
        case 2: image2 = defaultImage
        case 3: image3 = defaultImage
        case 4: image4 = defaultImage
        case 5: image5 = defaultImage
        default: return
        }
    }

    func loadImage(number: Int) {
        guard let url = ImageURL.init(rawValue: number)?.url else {
            print("url Error")
            return
        }

        urlSessionManager.fetchData(url: url) { [weak self] result in
            switch result {
            case .success(let data):
                switch number {
                case 1: self?.image1 = UIImage(data: data)
                case 2: self?.image2 = UIImage(data: data)
                case 3: self?.image3 = UIImage(data: data)
                case 4: self?.image4 = UIImage(data: data)
                case 5: self?.image5 = UIImage(data: data)
                default: return
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func loadAllImage() {
        Array(1...ImageURL.allCases.count).forEach {
            placeDefaultImage(number: $0)
            loadImage(number: $0)
        }
    }
}


