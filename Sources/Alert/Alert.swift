//
//  Alert.swift
//  Instagrid
//
//  Created by Pauline Nomballais on 21/10/2020.
//  Copyright © 2020 PaulineNomballais. All rights reserved.
//

import Foundation

enum AlertType: Equatable {
    case gridNotCompleted
}

struct Alert: Equatable {
    let title: String
    let message: String
}

extension Alert {
    init(type: AlertType) {
        switch type {
        case .gridNotCompleted:
            self = Alert(title: "You need to set all images before sharing!",
                         message: "")            
        }
    }
}
