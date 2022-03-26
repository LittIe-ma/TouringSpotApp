//
//  CustomFloatingPanelLayout.swift
//  TouringSpotApp
//
//  Created by Masato Yasuda on 2022/03/21.
//

import Foundation
import FloatingPanel

final class CustomFloatingPanelLayout: FloatingPanelLayout {

    var position: FloatingPanelPosition = .bottom

    var initialState: FloatingPanelState = .half

    var anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] {
        return [
            .half: FloatingPanelLayoutAnchor(absoluteInset: 250.0, edge: .bottom, referenceGuide: .safeArea),
            .hidden: FloatingPanelLayoutAnchor(absoluteInset: 0.0, edge: .bottom, referenceGuide: .safeArea)
        ]
    }

    var supportedPositions: Set<FloatingPanelState> {
        return [.half, .hidden]
    }
}
