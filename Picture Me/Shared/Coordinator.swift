//
//  Coordinator.swift
//  Picture Me
//
//  Created by Narcis Zait on 22/11/2019.
//Copyright © 2019 Narcis Zait. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
    var children: [Coordinator] { get set }
    func start()
}
