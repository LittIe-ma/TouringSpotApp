//
//  ModalViewController.swift
//  TouringSpotApp
//
//  Created by Masato Yasuda on 2022/03/21.
//

import UIKit

final class DetailViewController: UIViewController {

    var name: String!
    var imageStr: String!

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = self.name
        imageView.image = UIImage(named: imageStr)
    }
}
