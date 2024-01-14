//
//  DetailsVC.swift
//  FoursquareClone
//
//  Created by Ümit Türkmen on 14.01.2024.
//

import UIKit
import Parse
import MapKit

class DetailsVC: UIViewController , MKMapViewDelegate{

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var placeAtmText: UILabel!
    @IBOutlet weak var placeTypeText: UILabel!
    @IBOutlet weak var placeNameText: UILabel!
    var choosenLatitude = Double()
    var choosenLongitude = Double()
    var choosenPlaceId = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        getData()
        
        mapView.delegate = self
        }
    func getData(){
        let query = PFQuery(className: "Places")
        query.whereKey("objectId", equalTo: choosenPlaceId)
        query.findObjectsInBackground { objects, error in
            if error != nil {
                print("error")
            } else {
                if objects!.count > 0 {
                    let choosenPlaceObjext = objects![0]
                    if let placeName = choosenPlaceObjext.object(forKey: "name") as? String {
                        self.placeNameText.text = placeName
                        }
                    if let placeType = choosenPlaceObjext.object(forKey: "type") as? String {
                        self.placeTypeText.text = placeType
                        }
                    if let placeAtm = choosenPlaceObjext.object(forKey: "atm") as? String {
                        self.placeAtmText.text = placeAtm
                        }
                    if let placeLatitude = choosenPlaceObjext.object(forKey: "latitude") as? String{
                        if let placeLatitudeDouble = Double(placeLatitude) {
                            self.choosenLatitude = placeLatitudeDouble
                            }
                        }
                    if let placeLongitude = choosenPlaceObjext.object(forKey: "longitude") as? String{
                        if let placeLongitudeDouble = Double(placeLongitude) {
                            self.choosenLongitude = placeLongitudeDouble
                            }
                        }
                    if let imageData = choosenPlaceObjext.object(forKey: "image") as? PFFileObject {
                        imageData.getDataInBackground { Data, error in
                            if error == nil {
                                if Data != nil {
                                    self.imageView.image = UIImage(data: Data!)
                                }
                                
                            }
                        }
                    }
                    
                    let location = CLLocationCoordinate2D(latitude: self.choosenLatitude, longitude: self.choosenLongitude)
                    let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                    let region = MKCoordinateRegion(center: location, span: span)
                    self.mapView.setRegion(region, animated: true)
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = location
                    annotation.title = self.placeNameText.text
                    annotation.subtitle = self.placeTypeText.text
                    self.mapView.addAnnotation(annotation)
                    
                    }
                }
            }
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.canShowCallout = true
            let button = UIButton(type: UIButton.ButtonType.detailDisclosure)
            pinView?.rightCalloutAccessoryView = button
        } else {
            pinView?.annotation = annotation
        }
        return pinView
    }
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if self.choosenLatitude != 0.0 && self.choosenLongitude != 0.0 {
            let requestLocation = CLLocation(latitude: self.choosenLatitude, longitude: self.choosenLongitude)
            CLGeocoder().reverseGeocodeLocation(requestLocation) { placemarks, error in
                if let placemark = placemarks {
                    if placemark.count > 0 {
                        let mkPlaceMark = MKPlacemark(placemark: placemark[0])
                        let mapItem = MKMapItem(placemark: mkPlaceMark)
                        mapItem.name = self.placeNameText.text
                        
                        let launchOptions =  [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving]
                        mapItem.openInMaps(launchOptions: launchOptions)
                    }
                }
            }
        }
    }
}


