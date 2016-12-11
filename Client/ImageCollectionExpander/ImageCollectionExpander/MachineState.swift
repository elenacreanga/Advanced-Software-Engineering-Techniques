//
//  MachineState.swift
//  ImageCollectionExpander
//
//  Created by Bianca Madalina Tiba on 12/11/16.
//  Copyright © 2016 Bianca Madalina Tiba. All rights reserved.
//

import UIKit

enum MachineState: String {
    case Logged = "Logged"
    case NotLogged = "NotLogged"
}

extension MachineState: CustomStringConvertible {
    var description: String {
        get {
            switch self {
            case .Logged:
                return "Logged"
            case .NotLogged:
                return "NotLogged"
            }
        }
    }
}
