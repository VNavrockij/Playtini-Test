//
//  Mark.swift
//  Playtini-Test
//
//  Created by Vitalii Navrotskyi on 17.03.2024.
//

import Foundation

enum Mark {
    case plus
    case minus

    var stringValue: String {
        switch self {
            case .plus:
                return "+"
            case .minus:
                return "-"
        }
    }

}
