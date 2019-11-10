//
//  ViewController.swift
//  SimpleGeocoding
//  plist, Geocoding
//  Created by 김종현 on 2019/10/14.
//  Copyright © 2019 김종현. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var pins = [MKPointAnnotation]()
        let path = Bundle.main.path(forResource: "PinData", ofType: "plist")
        let contents = NSArray(contentsOfFile: path!)
        
       
        if let items = contents {
            for item in items {
                let addr = (item as AnyObject).value(forKey: "address")
                let title = (item as AnyObject).value(forKey: "title")
                let subTitle = (item as AnyObject).value(forKey: "subTitle")

                let geocoder = CLGeocoder()
                geocoder.geocodeAddressString(addr! as! String, completionHandler: { placemarks, error in
                    if error != nil {
                        print("nil")
                    }

                    if let myPlacemarks = placemarks {
                        let myPlacemark = myPlacemarks[0]
                        let pin = MKPointAnnotation()

                        pin.title = title as? String
                        pin.subtitle = subTitle as? String

                        if let loc = myPlacemark.location {
                            pin.coordinate = loc.coordinate
                            pins.append(pin)
                        } else {
                            print("loc nil")
                        }
                    }
                    self.mapView.showAnnotations(pins, animated: true)
                })
            }
        } else {
            print("contents nil")
        }
    }
}

