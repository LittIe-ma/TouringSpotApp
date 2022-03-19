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

    private var touringSpotModel: [TouringSpotModel] = []

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
    }
}

extension TouringSpotListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        touringSpotModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TouringSpotCell.className) as! TouringSpotCell
        let touringSpotModel = touringSpotModel[indexPath.row]
        cell.selectionStyle = .none
        cell.configure(touringSpotModel: touringSpotModel)
        return cell
    }
}
