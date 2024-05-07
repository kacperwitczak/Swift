class WordGame {
    var word: String
    var lives: Int
    var used_letters: [Character]

    var categories: [String: [String]] = [
        "animals": ["dog", "cat", "elephant", "giraffe", "lion", "tiger", "bear", "wolf", "fox", "rabbit"],
        "fruits": ["apple", "banana", "orange", "grape", "kiwi", "mango", "pear", "peach", "plum", "strawberry"],
        "countries": ["romania", "france", "germany", "spain", "italy", "russia", "china", "japan", "brazil", "canada"]
    ]

    init() {
        print("Welcome to the Word Game!")
        print("Choose a category:")
        for (index, category) in categories.keys.enumerated() {
            print("\(index + 1). \(category)")
        }

        let category = readLine()!
        let words = categories[Array(categories.keys)[Int(category)! - 1]]!
        self.word = words.randomElement()!

        print("Choose difficulty level:")
        print("1. Easy (10 lives)")
        print("2. Medium (7 lives)")
        print("3. Hard (5 lives)")
        let level = readLine()!

        let lives: Int
        switch level {
        case "1":
            lives = 10
        case "2":
            lives = 7
        case "3":
            lives = 5
        default:
            lives = 7
        }

        self.lives = lives
        self.used_letters = []
    }

    func get_current_state() -> String {
        var board = ""
        for letter in word {
            if used_letters.contains(letter) {
                board += String(letter)
            } else {
                board += "_"
            }
        }
        return board
    }

    func draw_board() {
        print(get_current_state())
    }

    func guess(letter: Character) {
        if used_letters.contains(letter) {
            print("You have already used this letter")
            return
        }
        used_letters.append(letter)
        if !word.contains(letter) {
            lives -= 1
            print("Wrong guess! Remaining lives: \(lives)")
        } else {
            print("Correct guess!")
        }
        print("Used letters: \(used_letters)")
    }

    func is_over() -> Bool {
        if lives == 0 {
            print("Game over! The word was \(word)")
            return true
        }

        if get_current_state() == word {
            print("Congratulations! You have guessed the word!")
            print("The word was \(word)")
            return true
        }

        return false
    }

    func play() {
        while !is_over() {
            draw_board()
            print("Enter a letter:")
            let input = readLine()!
            if input.count != 1 {
                print("Invalid input! Please enter a single letter.")
                continue
            }
            let letter = input.first!
            guess(letter: letter)
        }
    }

}

while true {
    print("Do you want to play? (yes/no)")
    let input = readLine()!
    if input == "no" {
        print("Goodbye!")
        break
    }
    let game = WordGame()
    game.play()
}


