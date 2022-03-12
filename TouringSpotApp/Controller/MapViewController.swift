//
//  MapViewController.swift
//  TouringSpotApp
//
//  Created by Masato Yasuda on 2022/03/10.
//

import UIKit
import MapKit
import CoreLocation

final class MapViewController: UIViewController {

    static func makeFromStoryboard() -> MapViewController {
        let vc = UIStoryboard.mapViewController
        return vc
    }

    @IBOutlet private weak var mapView: MKMapView!

    private var locationManager: CLLocationManager!

    private var touringSpotModel: [TouringSpotModel] = []
    private var annotations: [MKAnnotation] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        loadCSV.shared.get { result in
            switch result {
            case .failure(_):
                loadCSV.shared.showAlert(vc: self)
            case .success(let model):
                self.touringSpotModel.append(model)
            }
        }

        putPin()
    }

    private func putPin() {
        for coordinate in touringSpotModel {
            let annotation = MKPointAnnotation()
            annotation.coordinate = CLLocationCoordinate2DMake(coordinate.latitude, coordinate.longitude)
            annotations.append(annotation)
        }
        mapView.addAnnotations(annotations)
    }
}
