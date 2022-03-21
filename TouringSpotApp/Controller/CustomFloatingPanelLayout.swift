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

    var initialState: FloatingPanelState = .hidden

    var anchors: [FloatingPanelState : FloatingPanelLayoutAnchoring] {
        return [
            .tip: FloatingPanelLayoutAnchor(absoluteInset: 120.0, edge: .bottom, referenceGuide: .safeArea),
            .hidden: FloatingPanelLayoutAnchor(absoluteInset: 0.0, edge: .bottom, referenceGuide: .safeArea)
        ]
    }

    var supportedPositions: Set<FloatingPanelState> {
        return [.tip, .hidden]
    }
}
