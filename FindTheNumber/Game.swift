//
//  Game.swift
//  FindTheNumber
//
//  Created by Александр Борисов on 23.04.2023.
//

import Foundation

class Game {

    struct Item {
        var title: String
        var isFound = false
        var isError = false
    }

    private let data = Array(1...99)
    var items:[Item] = []
    private var countItems: Int
    var nextItem: Item?

    init(countItems: Int) {
        self.countItems = countItems
        setupGame()
    }

    private func setupGame() {
        var digits = data.shuffled()
        items.removeAll()

        while items.count < countItems {
            let item = Item(title: String(digits.removeFirst()))
            items.append(item)
        }

        nextItem = items.shuffled().first
    }

    func check(index: Int) {
        if items[index].title == nextItem?.title {
            items[index].isFound = true
            nextItem = items.shuffled().first(where: {(item) -> Bool in
                item.isFound == false
            })
        } else {
            items[index].isError = true
        }
    }

    func newGame() {
        setupGame()
    }
}
