//
//  MachineTransition.swift
//  ImageCollectionExpander
//
//  Created by Bianca Madalina Tiba on 12/11/16.
//  Copyright © 2016 Bianca Madalina Tiba. All rights reserved.
//

import UIKit

enum MachineTransition: String {
    case Login = "Login"
    case Logout = "Logout"
}

extension MachineTransition: CustomStringConvertible {
    var description: String {
        get {
            switch self {
            case .Login:
                return "Login"
            case .Logout:
                return "Logout"
            }
        }
    }
}
