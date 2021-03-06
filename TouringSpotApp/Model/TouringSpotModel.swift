//
//  TouringSpotData.swift
//  TouringSpotApp
//
//  Created by Masato Yasuda on 2022/03/06.
//

import UIKit

struct TouringSpotModel {
    let name: String
    let address: String
    let imageStr: String
    let latitude: Double
    let longitude: Double
}

final class loadCSV {

    static let shared: loadCSV = .init()
    private init() {}

    func get(completion: ((Result<TouringSpotModel, Error>) -> Void)? = nil) {

        guard let path = Bundle.main.path(forResource:"TouringSpotData", ofType:"csv") else { return }

        var csvLines: [String]

        do {
            let csvString = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            csvLines = csvString.components(separatedBy: .newlines)
            csvLines.removeLast()
        } catch let error {
            completion?(.failure(error))
            return
        }

        for data in csvLines {
            let detail = data.components(separatedBy: ",")
            completion?(.success(TouringSpotModel(name: detail[0], address: detail[1], imageStr: detail[2], latitude: Double(detail[3])!, longitude: Double(detail[4])!)))
        }
    }
}

extension loadCSV {
    func showAlert(vc: UIViewController) {
        let ac = UIAlertController(title: nil, message: "データの読み込みに失敗しました。", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(ac, animated: true, completion: nil)
    }
}
