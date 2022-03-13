//
//  UIStoryboard+.swift
//  TouringSpotApp
//
//  Created by Masato Yasuda on 2022/03/06.
//

import UIKit

extension UIStoryboard {

    static var touringSpotListViewController: TouringSpotListViewController {
        UIStoryboard.init(name: "TouringSpotList", bundle: nil).instantiateInitialViewController() as! TouringSpotListViewController
    }

    static var mapViewController: MapViewController {
        UIStoryboard.init(name: "Map", bundle: nil).instantiateInitialViewController() as! MapViewController
    }
}
