// PresenterProfile.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

protocol ProfileViewProtocol: AnyObject {}
protocol ProfilePresenterProtocol {
    var options: [Options] { get set }
    var profileUser: ProfileUser { get set }
}

/// adwdwa
class ProfilePresenter: ProfilePresenterProtocol {
    weak var view: ProfileViewProtocol?

    var options: [Options] = Options.makeOption()
    var profileUser = ProfileUser.makeProfile()
    func setupAlert() {
        
    }
}
