//
//  ViewController.swift
//  ios-here-helloworld
//
//  Created by Lucas Mckenna on 9/19/18.
//  Copyright © 2018 Lucas Mckenna. All rights reserved.
//

import UIKit
import NMAKit
import MotionDnaSDK

class ViewController: UIViewController, MotionDnaLocationManagerDelegate{
    
    var first = Bool(true)

    func locationManager(_ manager: MotionDnaLocationManagerDataSource!, didUpdate locations: [CLLocation]!) {
        
        let coords = NMAGeoCoordinates(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        


        
        DispatchQueue.main.async{
            if (self.first == true)
            {
                // Instantiate user_location to coordinates.
                self.user_location=NMAMapMarker(geoCoordinates: coords, image: UIImage(named: "Red_Location_Dot"))
                
                // Add NMAMarker to map.
                self.mapView.add(self.user_location!)
                
                // Set map center to latest MotionDna coordinate.
                self.mapView.set(geoCenter: coords, animation: NMAMapAnimation.linear)
                self.first = false
            }
            // Keep updating marker positions.
            self.user_location?.coordinates=coords
        }
    }
    
    func locationManager(_ manager: MotionDnaLocationManagerDataSource!, didFailWithError error: Error!) {
    }
    
    func locationManager(_ manager: MotionDnaLocationManagerDataSource!, didUpdate newHeading: CLHeading!) {
        DispatchQueue.main.async{
            // Not implemented because couldn't rotate NMAMarker on here maps implementation (all other map providers allow marker rotations, therefore I removed the heading from our custom image).
        }
    }
    
    func locationManagerShouldDisplayHeadingCalibration(_ manager: MotionDnaLocationManagerDataSource!) -> Bool {
        return  false
    }
    
    // MapView from Here Maps
    @IBOutlet var mapView: NMAMapView!
    
    // Navisens SDK instance
    var sdk = MotionDnaSDK()
    
    // User location instance NMAMapMarker
    var user_location : NMAMapMarker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Start our SDK with MotionDna key
        sdk.runMotionDna("")
        
        // Set SDK GPS updates to 1Hz.
        sdk.setExternalPositioningState(HIGH_ACCURACY)
        
        // Do any additional setup after loading the view, typically from a nib.
        sdk.setLocationNavisens()

        // Set MotionDna SDK delegate to self to receive location updates.
        sdk.motionDnaDelegate=self

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
