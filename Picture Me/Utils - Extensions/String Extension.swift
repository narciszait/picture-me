//
//  String Extension.swift
//  Picture Me
//
//  Created by Narcis Zait on 23/11/2019.
//  Copyright © 2019 Narcis Zait. All rights reserved.
//

import Foundation

func flag(country: String) -> String {
    if country == "" {
        return "🌍"
    }
    
    let base : UInt32 = 127397
    var s = ""
    for v in country.unicodeScalars {
        s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
    }
    return String(s)
}
