// BirthdayReminderViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol PeopleDelegate: AnyObject {
    func transferPeople(model: People)
}

/// Экран где все пользователь записаны у них есть свойства день рождения сколько лет имя и сколько осталось до дня
/// рожления
final class BirthdayReminderViewController: UIViewController {
    

    // MARK: - Private Properties
    private let firstCellView = CustomCellView()


    private var allCellForPeople: [CustomCellView] = [
        CustomCellView(),
        CustomCellView(),
        CustomCellView(),
        CustomCellView(),
        CustomCellView()
    ]
    private var myFriends: [People] = [] {
        didSet {
            buildMyTableView()
        }
    }

    // MARK: - Visual Components

    private lazy var addContactButton = UIBarButtonItem(
        image: UIImage(systemName: "plus"),
        style: .plain,
        target: self,
        action:
        #selector(addNewContact)
    )

    private var todayLabel: UILabel = {
        let label = UILabel()
        label.text = "Today"
        label.font = .boldSystemFont(ofSize: 16)
        label.frame = CGRect(x: 21, y: 103, width: 180, height: 20)
        return label
    }()

    private var nextWeekLabel: UILabel = {
        let label = UILabel()
        label.text = "Today"
        label.font = .boldSystemFont(ofSize: 16)
        label.frame = CGRect(x: 21, y: 244, width: 180, height: 20)
        return label
    }()

    private var nextMonthLabel: UILabel = {
        let label = UILabel()
        label.text = "NextMonth"
        label.font = .boldSystemFont(ofSize: 16)
        label.frame = CGRect(x: 21, y: 385, width: 180, height: 20)
        return label
    }()

    private var juneLabel: UILabel = {
        let label = UILabel()
        label.text = "June 2024"
        label.font = .boldSystemFont(ofSize: 16)
        label.frame = CGRect(x: 21, y: 526, width: 180, height: 20)
        return label
    }()

    private let imageBirrthdayView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Happy")
        imageView.frame = CGRect(x: 299, y: 156, width: 44, height: 44)
        return imageView
    }()

    // MARK: - Life Cycle

    override func loadView() {
        super.loadView()
        setupUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        buildMyTableView()
    }

    // MARK: - Private Methods

    private func addMyFriends(
        nameSurname: String,
        avatarImage: String,
        daysbBeforeBirthday: String,
        dayBirthday: String,
        age: String
    ) {
        myFriends.append(People(
            nameSurname: nameSurname,
            avatarImage: avatarImage,
            daysbBeforeBirthday: daysbBeforeBirthday,
            dayBirthday: dayBirthday,
            age: age
        ))
    }

    @objc private func addNewContact() {
        let nextVC = ContactPeopleViewController()
        nextVC.delegate = self
        present(nextVC, animated: true)
    }

    private func setupUI() {
        addMyFriends(
            nameSurname: "Halena Link",
            avatarImage: "Halena",
            daysbBeforeBirthday: "",
            dayBirthday: "10.03",
            age: "25"
        )
        addMyFriends(
            nameSurname: "Verona Tusk",
            avatarImage: "Verona",
            daysbBeforeBirthday: "10 days",
            dayBirthday: "20.03",
            age: "39"
        )
        addMyFriends(
            nameSurname: "Alex Smith",
            avatarImage: "Alex",
            daysbBeforeBirthday: "42 days",
            dayBirthday: "21.04",
            age: "51"
        )
        addMyFriends(
            nameSurname: "Tom Johnson",
            avatarImage: "Tom",
            daysbBeforeBirthday: "87 days",
            dayBirthday: "05.06",
            age: "18"
        )

        view.addSubview(todayLabel)
        view.addSubview(nextWeekLabel)
        view.addSubview(nextMonthLabel)
        view.addSubview(juneLabel)
        view.addSubview(imageBirrthdayView)
        navigationItem.rightBarButtonItem = addContactButton
        navigationItem.title = "Birthday Reminder"
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.titleTextAttributes = [
                NSAttributedString.Key.font:
                    UIFont.systemFont(ofSize: 20.0, weight: .bold)
            ]
        }
    }

    private func buildMyTableView() {
        firstCellView.layer.cornerRadius = 12
        firstCellView.layer.borderWidth = 1
        firstCellView.layer.borderColor = UIColor.red.cgColor
        firstCellView.backgroundColor = UIColor(named: "White")
        view.addSubview(firstCellView)
        for index in 1 ..< myFriends.count {
            allCellForPeople[index].frame = CGRect(x: 20, y: 131 + (index * 141), width: 335, height: 93)
            allCellForPeople[index].layoutIfNeeded()
            allCellForPeople[index].nameSurnameLabel.text = myFriends[index].nameSurname
            allCellForPeople[index].dateOfBirthLabel.text =
                "\(myFriends[index].dayBirthday) - turns \(myFriends[index].age)"
            allCellForPeople[index].avatarImageView.image = UIImage(named: "\(myFriends[index].avatarImage)")
            allCellForPeople[index].daysBeforeBirthLabel.text = myFriends[index].daysbBeforeBirthday
            allCellForPeople[index].backgroundColor = UIColor(named: "Purple")
            allCellForPeople[index].layer.cornerRadius = 12
            view.addSubview(allCellForPeople[index])
        }
        view.addSubview(imageBirrthdayView)
    }
}

extension BirthdayReminderViewController: PeopleDelegate {
    func transferPeople(model: People) {
        myFriends.append(model)
    }
}
