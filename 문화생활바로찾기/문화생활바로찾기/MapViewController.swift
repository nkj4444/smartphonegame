//
//  MapViewController.swift
//  HospitalMap_RE
//
//  Created by 나경종 on 2018. 5. 8..
//  Copyright © 2018년 나경종. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    var posts = NSMutableArray()
   
    
    @IBOutlet weak var FindButton: UIButton!
    @IBOutlet weak var TField: UITextField!
    var festivals : [Festival] = []
    
    var regionRadius: CLLocationDistance = 150000
    
    @IBAction func Find(_ sender: Any) {
        let Text = TField.text
        //regionRadius = 50000
        var initialLocation = CLLocation(latitude: 37.5384514, longitude: 127.0709764)
        if(Text == ""){
            regionRadius = 50000
            initialLocation = CLLocation(latitude: 38.0141103, longitude: 127.0572224)
           // let viewcontroller = ViewController()
           // viewcontroller.url = viewcontroller.url + "&SIGUN_CD=" + "41800"//sgguCd
        }
        if(Text == "수원시"){
            regionRadius = 15000
            initialLocation = CLLocation(latitude: 37.267052, longitude: 127.022840)
        }
        if(Text == "성남시"){
            regionRadius = 15000
            initialLocation = CLLocation(latitude: 37.412118, longitude: 127.120337)
        }
        if(Text == "의정부시"){
            regionRadius = 15000
            initialLocation = CLLocation(latitude: 37.739046, longitude: 127.069764)
        }
        if(Text == "안양시"){
            regionRadius = 15000
            initialLocation = CLLocation(latitude: 37.407076, longitude: 126.930524)
        }
        if(Text == "부천시"){
            regionRadius = 15000
            initialLocation = CLLocation(latitude: 37.505332, longitude: 126.788774)
        }
        if(Text == "광명시"){
            regionRadius = 15000
            initialLocation = CLLocation(latitude: 37.448376, longitude: 126.866235)
        }
        if(Text == "평택시"){
            regionRadius = 30000
            initialLocation = CLLocation(latitude: 37.026232, longitude: 127.005409)
        }
        if(Text == "동두천시"){
            regionRadius = 15000
            initialLocation = CLLocation(latitude: 37.912505, longitude: 127.080043)
        }
        if(Text == "안산시"){
            regionRadius = 15000
            initialLocation = CLLocation(latitude: 37.326513, longitude: 126.836075)
        }
        if(Text == "고양시"){
            regionRadius = 15000
            initialLocation = CLLocation(latitude: 37.664530, longitude: 126.835451)
        }
        if(Text == "과천시"){
            regionRadius = 15000
            initialLocation = CLLocation(latitude: 37.434699, longitude: 127.002946)
        }
        if(Text == "구리시"){
            regionRadius = 15000
            initialLocation = CLLocation(latitude: 37.604487, longitude: 127.131591)
        }
        if(Text == "남양주시"){
            regionRadius = 30000
            initialLocation = CLLocation(latitude: 37.679224, longitude: 127.248601)
        }
        if(Text == "오산시"){
            regionRadius = 15000
            initialLocation = CLLocation(latitude: 37.167040, longitude: 127.050540)
        }
        if(Text == "시흥시"){
            regionRadius = 15000
            initialLocation = CLLocation(latitude: 37.395253, longitude: 126.795684)
        }
        if(Text == "군포시"){
            regionRadius = 15000
            initialLocation = CLLocation(latitude: 37.345653, longitude: 126.922180)
        }
        if(Text == "의왕시"){
            regionRadius = 30000
            initialLocation = CLLocation(latitude: 37.367876, longitude: 126.989017)
        }
        if(Text == "하남시"){
            regionRadius = 30000
            initialLocation = CLLocation(latitude: 37.523979, longitude: 127.205059)
        }
        if(Text == "용인시"){
            regionRadius = 30000
            initialLocation = CLLocation(latitude: 37.229374, longitude: 127.2319889)
        }
        if(Text == "파주시"){
            regionRadius = 15000
            initialLocation = CLLocation(latitude: 37.864606, longitude: 126.796159)
        }
        if(Text == "이천시"){
            regionRadius = 30000
            initialLocation = CLLocation(latitude: 37.210906, longitude: 127.467284)
        }
        if(Text == "안성시"){
            regionRadius = 30000
            initialLocation = CLLocation(latitude: 37.030160, longitude: 127.281509)
        }
        if(Text == "김포시"){
            regionRadius = 30000
            initialLocation = CLLocation(latitude: 37.667404, longitude: 126.644762)
        }
        if(Text == "화성시"){
            regionRadius = 30000
            initialLocation = CLLocation(latitude: 37.176892, longitude: 126.867315)
        }
        if(Text == "광주시"){
            regionRadius = 15000
            initialLocation = CLLocation(latitude: 37.402531, longitude: 127.313076)
        }
        if(Text == "양주시"){
            regionRadius = 25000
            initialLocation = CLLocation(latitude: 37.821739, longitude: 126.998548)
        }
        if(Text == "포천시"){
            regionRadius = 30000
            initialLocation = CLLocation(latitude: 37.942474, longitude: 127.236469)
        }
        if(Text == "여주시"){
            regionRadius = 30000
            initialLocation = CLLocation(latitude: 37.305889, longitude: 127.618779)
        }
        if(Text == "연천군"){
            regionRadius = 30000
            initialLocation = CLLocation(latitude: 38.114531, longitude: 127.030036)
        }
        if(Text == "가평군"){
            regionRadius = 25000
            initialLocation = CLLocation(latitude: 37.847303, longitude: 127.436629)
        }
        if(Text == "양평군"){
            regionRadius = 25000
            initialLocation = CLLocation(latitude: 37.519111, longitude: 127.581051)
        }
        centerMapOnLocation(location: initialLocation)
       
       
        
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? Festival else {return nil}
        
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView{
            dequeuedView.annotation = annotation
            view = dequeuedView
        }else{
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier:identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! Festival
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launchOptions)
        
    }
    func loadInitialData(){
        for post in posts{
            let yadmNm = (post as AnyObject).value(forKey: "yadmNm") as! NSString as String
            let addr = (post as AnyObject).value(forKey: "addr") as! NSString as String
            let XPos = (post as AnyObject).value(forKey: "XPos") as! NSString as String
            let YPos = (post as AnyObject).value(forKey: "YPos") as! NSString as String
            let lat = (YPos as NSString).doubleValue
            let lon = (XPos as NSString).doubleValue
            let festival = Festival(title: yadmNm, locationName: addr, coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon))
            festivals.append(festival)
        }
    }
    func centerMapOnLocation(location: CLLocation){
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialLocation = CLLocation(latitude: 37.5384514, longitude: 127.0709764)
        
        centerMapOnLocation(location: initialLocation)
        
        mapView.delegate = self
        loadInitialData()
        mapView.addAnnotations(festivals)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
