//
//  CLPlacemark.swift
//  SimpleGeocoding02
//
//  Created by 김종현 on 2019/10/15.
//  Copyright © 2019 김종현. All rights reserved.
//

import CoreLocation

extension CLPlacemark {
    
    var compactAddress: String? {
        if let name = name {
            var result = name
            
            if let street = thoroughfare {
                result += ", \(street)"
            }
            
            if let city = locality {
                result += ", \(city)"
            }
            
            if let country = country {
                result += ", \(country)"
            }
            
            return result
        }
        return nil
    }
}

