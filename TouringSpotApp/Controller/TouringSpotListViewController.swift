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

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: TouringSpotCell.className, bundle: nil), forCellReuseIdentifier: TouringSpotCell.className)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension TouringSpotListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TouringSpotCell.className) as! TouringSpotCell
        return cell
    }
}
