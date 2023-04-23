//
//  ViewController.swift
//  FindTheNumber
//
//  Created by Александр Борисов on 21.04.2023.
//

import UIKit

class GameViewController: UIViewController {

    var statusLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var nextDigit: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var timerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var newGameButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("Новая игра", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1, green: 0.7095583677, blue: 0.1661552787, alpha: 1), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var viewForButtons: UIView = {
        let view = UIView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewForButtons()
    }

    private func setupConstrains() {
        [statusLabel, nextDigit, timerLabel, newGameButton].forEach{viewForButtons.addSubview($0)}

        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: viewForButtons.topAnchor, constant: 90),
            statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statusLabel.widthAnchor.constraint(equalToConstant: 250),
            statusLabel.heightAnchor.constraint(equalToConstant: 40)
        ])

        NSLayoutConstraint.activate([
            nextDigit.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 30),
            nextDigit.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextDigit.widthAnchor.constraint(equalToConstant: 250),
            nextDigit.heightAnchor.constraint(equalToConstant: 80)
        ])

        NSLayoutConstraint.activate([
            timerLabel.topAnchor.constraint(equalTo: nextDigit.bottomAnchor, constant: 30),
            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerLabel.widthAnchor.constraint(equalToConstant: 250),
            timerLabel.heightAnchor.constraint(equalToConstant: 30)
        ])

        NSLayoutConstraint.activate([
            newGameButton.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 30),
            newGameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            newGameButton.widthAnchor.constraint(equalToConstant: 250),
            newGameButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }

    private func configureViewForButtons() {
        view.addSubview(viewForButtons)
        viewForButtons.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        viewForButtons.backgroundColor = .gray
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupNumberButton()
        setupConstrains()
    }

    private func setupNumberButton() {
        let buttonSize = view.frame.size.width / 4


        for x in 0..<4 {
            let buttonInLine1 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x),
                                                        y: viewForButtons.frame.size.height - (buttonSize * 2),
                                                        width: buttonSize,
                                                        height: buttonSize))
            buttonInLine1.setTitleColor(.black, for: .normal)
            buttonInLine1.backgroundColor = #colorLiteral(red: 1, green: 0.7095583677, blue: 0.1661552787, alpha: 1)
            buttonInLine1.setTitle("\(x + 1)", for: .normal)
            buttonInLine1.layer.borderWidth = 5
            buttonInLine1.layer.borderColor = UIColor.darkGray.cgColor
            buttonInLine1.layer.cornerRadius = 30
            viewForButtons.addSubview(buttonInLine1)
        }

        for x in 0..<4 {
            let buttonInLine2 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x),
                                                        y: viewForButtons.frame.size.height - (buttonSize * 3),
                                                        width: buttonSize,
                                                        height: buttonSize))
            buttonInLine2.setTitleColor(.black, for: .normal)
            buttonInLine2.backgroundColor = #colorLiteral(red: 1, green: 0.7095583677, blue: 0.1661552787, alpha: 1)
            buttonInLine2.setTitle("\(x + 5)", for: .normal)
            buttonInLine2.layer.borderWidth = 5
            buttonInLine2.layer.borderColor = UIColor.darkGray.cgColor
            buttonInLine2.layer.cornerRadius = 30
            viewForButtons.addSubview(buttonInLine2)
        }

        for x in 0..<4 {
            let buttonInLine3 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x),
                                                        y: viewForButtons.frame.size.height - (buttonSize * 4),
                                                        width: buttonSize,
                                                        height: buttonSize))
            buttonInLine3.setTitleColor(.black, for: .normal)
            buttonInLine3.backgroundColor = #colorLiteral(red: 1, green: 0.7095583677, blue: 0.1661552787, alpha: 1)
            buttonInLine3.setTitle("\(x + 9)", for: .normal)
            buttonInLine3.layer.borderWidth = 5
            buttonInLine3.layer.borderColor = UIColor.darkGray.cgColor
            buttonInLine3.layer.cornerRadius = 30
            viewForButtons.addSubview(buttonInLine3)
        }

        for x in 0..<4 {
            let buttonInLine4 = UIButton(frame: CGRect(x: buttonSize * CGFloat(x),
                                                        y: viewForButtons.frame.size.height - (buttonSize * 5),
                                                        width: buttonSize,
                                                        height: buttonSize))
            buttonInLine4.setTitleColor(.black, for: .normal)
            buttonInLine4.backgroundColor = #colorLiteral(red: 1, green: 0.7095583677, blue: 0.1661552787, alpha: 1)
            buttonInLine4.setTitle("\(x + 13)", for: .normal)
            buttonInLine4.layer.borderWidth = 5
            buttonInLine4.layer.borderColor = UIColor.darkGray.cgColor
            buttonInLine4.layer.cornerRadius = 30
            viewForButtons.addSubview(buttonInLine4)
        }
    }


}

