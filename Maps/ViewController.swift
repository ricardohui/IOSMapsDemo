//
//  ViewController.swift
//  Maps
//
//  Created by Ricardo Hui on 27/3/2019.
//  Copyright © 2019 Ricardo Hui. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let latitude : CLLocationDegrees = 27.175244;
        let longitude: CLLocationDegrees = 0.0399773;
        let latDelta: CLLocationDegrees = 0.05;
        let lonDelta: CLLocationDegrees = 0.05;
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region:MKCoordinateRegion = MKCoordinateRegion(center:location, span: span)
        map.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.title = "Tai Mahal"
        annotation.subtitle = "One day I'll go here"
        annotation.coordinate = location
        map.addAnnotation(annotation)
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
        // the colon after longpress is important here to send info about gestureRecognizer to the longpress method
        uilpgr.minimumPressDuration = 2
        map.addGestureRecognizer(uilpgr)
    }
    @objc func longpress(gestureRecognizer: UIGestureRecognizer){
        let touchPoint = gestureRecognizer.location(in: self.map)
        
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "New Place"
        annotation.subtitle = "Maybe I will go here too"
        map.addAnnotation(annotation)
    }


}

