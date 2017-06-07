//
//  UIExtensions.swift
//  TheTuneSquad
//
//  Created by Christina Lee on 6/7/17.
//  Copyright © 2017 Christina Lee. All rights reserved.
//

import UIKit

extension UIResponder {
    static var identifier : String {
        return String(describing: self)
    }
}
