//
//  ViewController.swift
//  RESTfulandJson
//
//  Created by Macbook Air on 3/10/2560 BE.
//  Copyright © 2560 Botanyap. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var skinTypelbl: UILabel!
    var skintype = SkinType().type1 {
        didSet {
            skinTypelbl.text = self.skintype
            Utilities().setSkinType(value: skintype)
        }
    }

    let locationManager = CLLocationManager()
    var coords = CLLocationCoordinate2D(latitude: 40,longitude: 40)
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        skintype = Utilities().getSkinType()
        skinTypelbl.text = "Skin : " + skintype
        
    }
    
    
    @IBAction func changeSkinClicked(_ sender: UIButton) {
        let alert = UIAlertController(title: "Skin Type", message: "Please Choose Skin Type", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: SkinType().type1, style: .default, handler: { (action) in
            self.skintype = SkinType().type1
        }))
        alert.addAction(UIAlertAction(title: SkinType().type2, style: .default, handler: { (action) in
            self.skintype = SkinType().type2
        }))

        alert.addAction(UIAlertAction(title: SkinType().type3, style: .default, handler: { (action) in
            self.skintype = SkinType().type3
        }))

        alert.addAction(UIAlertAction(title: SkinType().type4, style: .default, handler: { (action) in
            self.skintype = SkinType().type4
        }))

        alert.addAction(UIAlertAction(title: SkinType().type5, style: .default, handler: { (action) in
            self.skintype = SkinType().type5
        }))

        alert.addAction(UIAlertAction(title: SkinType().type6, style: .default, handler: { (action) in
            self.skintype = SkinType().type6
        }))
        self.present(alert, animated: true, completion: nil)
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("Location changed")
        
        if status == .authorizedWhenInUse {
            getLocation()
        }else if status == .denied {
            let alert = UIAlertController(title: "Error", message:"Go to setting and allow Location for this app!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func getLocation() {
        if  let loc = locationManager.location?.coordinate {
            coords = loc
        }
        
    }
}

