//
//  ViewController.swift
//  FindTheNumber
//
//  Created by Александр Борисов on 21.04.2023.
//

import UIKit

class GameViewController: UIViewController {
    //MARK: - Properties
    var statusLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var nextDigit: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 1, green: 0.7095583677, blue: 0.1661552787, alpha: 1)
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

    var buttons: [UIButton] = []

    lazy var game = Game(countItems: buttons.count)


    //MARK: - View lifycycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewForButtons()
        setupConstrains()
        setupNumberButton()

        newGame()

    }


    //MARK: - Setup Constrains
    private func setupConstrains() {
        [statusLabel, nextDigit, timerLabel, newGameButton].forEach{viewForButtons.addSubview($0)}

        var constraints = [NSLayoutConstraint]()

        constraints.append(statusLabel.topAnchor.constraint(equalTo: viewForButtons.topAnchor, constant: 90))
        constraints.append(statusLabel.centerXAnchor.constraint(equalTo: viewForButtons.centerXAnchor))
        constraints.append(statusLabel.widthAnchor.constraint(equalToConstant: 250))
        constraints.append(statusLabel.heightAnchor.constraint(equalToConstant: 40))

        constraints.append(nextDigit.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 30))
        constraints.append(nextDigit.centerXAnchor.constraint(equalTo: viewForButtons.centerXAnchor))
        constraints.append(nextDigit.widthAnchor.constraint(equalToConstant: 250))
        constraints.append(nextDigit.heightAnchor.constraint(equalToConstant: 80))

        constraints.append(timerLabel.topAnchor.constraint(equalTo: nextDigit.bottomAnchor, constant: 30))
        constraints.append(timerLabel.centerXAnchor.constraint(equalTo: viewForButtons.centerXAnchor))
        constraints.append(timerLabel.widthAnchor.constraint(equalToConstant: 250))
        constraints.append(timerLabel.heightAnchor.constraint(equalToConstant: 30))

        constraints.append(newGameButton.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 30))
        constraints.append(newGameButton.centerXAnchor.constraint(equalTo: viewForButtons.centerXAnchor))
        constraints.append(newGameButton.widthAnchor.constraint(equalToConstant: 250))
        constraints.append(newGameButton.heightAnchor.constraint(equalToConstant: 30))

        NSLayoutConstraint.activate(constraints)
    }

    //MARK: - Configure view
    private func configureViewForButtons() {

        view.addSubview(viewForButtons)
        viewForButtons.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        viewForButtons.backgroundColor = .gray

    }

    //MARK: - Creat 16 buttons
    private func setupNumberButton() {
        let buttonSize = viewForButtons.frame.size.width / 4

        //MARK: buttons 1-4
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
            buttons.append(buttonInLine1)
            buttonInLine1.tag = x + 1
            buttonInLine1.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        }

        //MARK: buttons 5-8
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
            buttons.append(buttonInLine2)
            buttonInLine2.tag = x + 5
            buttonInLine2.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        }

        //MARK: buttons 9-12
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
            buttons.append(buttonInLine3)
            buttonInLine3.tag = x + 9
            buttonInLine3.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        }

        //MARK: buttons 13-16
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
            buttons.append(buttonInLine4)
            buttonInLine4.tag = x + 13
            buttonInLine4.addTarget(self, action: #selector(numberPressed(_:)), for: .touchUpInside)
        }
    }

    @objc func numberPressed(_ sender: UIButton) {
        guard let buttonIndex = buttons.firstIndex(of: sender)
        else{ return }

        game.check(index: buttonIndex)
        updateUI()
    }

    private func newGame() {
        newGameButton.addTarget(self, action: #selector(startAction), for: .touchUpInside)
    }

    @objc func startAction() {
        statusLabel.text = "Start Game!"
        statusLabel.textColor = #colorLiteral(red: 1, green: 0.7095583677, blue: 0.1661552787, alpha: 1)
        newGameButton.isHidden = true
        game.newGame()
        setupScreen()
    }

    private func setupScreen() {
        for index in game.items.indices {
            buttons[index].setTitle(game.items[index].title, for: .normal)
            buttons[index].alpha = 1
            buttons[index].isEnabled = true
        }
        nextDigit.text = game.nextItem?.title
    }

    private func updateUI() {

        for index in game.items.indices {
            buttons[index].alpha = game.items[index].isFound ? 0 : 1
            buttons[index].isEnabled = !game.items[index].isFound

            if game.items[index].isError {
                UIView.animate(withDuration: 0.3) { [weak self] in
                    self?.buttons[index].backgroundColor = .red
                } completion: { [weak self] (_) in
                    self?.buttons[index].backgroundColor = .white
                    self?.game.items[index].isError = false
                }
            }
        }
        nextDigit.text = game.nextItem?.title

    }



}
