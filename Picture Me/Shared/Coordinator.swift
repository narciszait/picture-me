//
//  Coordinator.swift
//  Picture Me
//
//  Created by Narcis Zait on 22/11/2019.
//Copyright © 2019 Narcis Zait. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    var children: [Coordinator] { get set }
    func start()
}
