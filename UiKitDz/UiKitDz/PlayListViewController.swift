// PlayListViewController.swift
// Copyright © RoadMap. All rights reserved.

import AVFoundation
import UIKit

/// контроле где располагается список моих треков
final class PlayListViewController: UIViewController {
    // MARK: - Public Methods

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? PlayerViewController {
            switch segue.identifier {
            case "TreckOne":
                destinationVC.currentIndex = 0
            case "TreckTwo":
                destinationVC.currentIndex = 1
            default:
                break
            }
        }
    }
}
