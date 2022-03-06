//
//  ViewController.swift
//  TouringSpotApp
//
//  Created by Masato Yasuda on 2022/03/06.
//

import UIKit

final class TouringSpotListViewController: UIViewController {

    static func makeFromStoryboard() -> TouringSpotListViewController {
        let vc = UIStoryboard.touringSpotListViewController
        return vc
    }

    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

