//
//  MapViewController.swift
//  TouringSpotApp
//
//  Created by Masato Yasuda on 2022/03/10.
//

import UIKit
import MapKit
import CoreLocation
import FloatingPanel

final class MapViewController: UIViewController {

    static func makeFromStoryboard() -> MapViewController {
        let vc = UIStoryboard.mapViewController
        return vc
    }

    @IBOutlet private weak var mapView: MKMapView!

    private var locationManager: CLLocationManager!
    private var touringSpotModel: [TouringSpotModel] = []
    private var annotations: [MKAnnotation] = []

    var fpc = FloatingPanelController()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "マップ"

        locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

        loadCSV.shared.get { [weak self] result in
            guard let self = self else { return }
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
            annotation.title = coordinate.name
            annotation.subtitle = coordinate.imageStr
            annotations.append(annotation)
        }
        mapView.addAnnotations(annotations)
    }
}

extension MapViewController: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation else { return }
        guard let name = annotation.title as? String else { return }
        guard let imageStr = annotation.subtitle as? String else { return }
        showDetailView(name: name, imageStr: imageStr)
    }
}

extension MapViewController: CLLocationManagerDelegate {

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = manager.authorizationStatus
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            manager.startUpdatingLocation()
        case .notDetermined, .denied, .restricted:
            manager.requestWhenInUseAuthorization()
        default:
            break
        }
    }
}

private extension MapViewController {

    func showDetailView(name: String, imageStr: String) {
        fpc.delegate = self
        let detailVC = DetailViewController()
        detailVC.name = name
        detailVC.imageStr = imageStr
        fpc.set(contentViewController: detailVC)
        fpc.addPanel(toParent: self)
        fpc.move(to: .half, animated: true, completion: nil)
    }
}

extension MapViewController: FloatingPanelControllerDelegate {

    func floatingPanel(_ fpc: FloatingPanelController, layoutFor newCollection: UITraitCollection) -> FloatingPanelLayout {
        return CustomFloatingPanelLayout()
    }
}
