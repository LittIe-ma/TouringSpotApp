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

    func configure(touringSpotData: TouringSpotData) {
        self.nameLabel.text = touringSpotData.name
        self.addressLabel.text = touringSpotData.address
        self.spotImage.image = touringSpotData.image
    }
}
