//
//  TouringSpotCell.swift
//  TouringSpotApp
//
//  Created by Masato Yasuda on 2022/03/06.
//

import UIKit

final class TouringSpotCell: UITableViewCell {

    static var className: String { String(describing: TouringSpotCell.self) }

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var spotImage: UIImageView!

    func configure(touringSpotModel: TouringSpotModel) {
        self.nameLabel.text = touringSpotModel.name
        self.addressLabel.text = touringSpotModel.address
//        self.spotImage.image = touringSpotModel.image
    }
}
