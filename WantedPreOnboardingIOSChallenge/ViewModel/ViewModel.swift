//
//  ViewModel.swift
//  WantedPreOnboardingIOSChallenge
//
//  Created by 맹선아 on 2023/03/01.
//

import UIKit

final class ViewModel {

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

    var updateImage1: ( (UIImage?) -> Void ) = { _ in}
    var updateImage2: ( (UIImage?) -> Void ) = { _ in  }
    var updateImage3: ( (UIImage?) -> Void ) = { _ in  }
    var updateImage4: ( (UIImage?) -> Void ) = { _ in  }
    var updateImage5: ( (UIImage?) -> Void ) = { _ in  }
    
}
