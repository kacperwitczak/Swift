func minValue (_ a: Int,_ b: Int) -> Int {
    if a > b {
        return b
    } 
    return a
}

print(minValue(4,3))
print(minValue(5,4))
print(minValue(6,5))
print(minValue(7,6))
print(minValue(8,7))
print(minValue(9,8))

func lastDigit(_ n : Int) -> Int {
    return n%10
}

print(lastDigit(10))
print(lastDigit(101))
print(lastDigit(109))

func divides(_ a:Int, _ b:Int) -> Bool {
    return a%b == 0
}

print(divides(7, 3))
print(divides(8, 4))

func countDivisors (_ a: Int) -> Int {
    var counter = 0
    for i in 1...a {
        if a%i == 0 {
            counter = counter + 1
        }
    }
    
    return counter
}
print(countDivisors(1))
print(countDivisors(10))
print(countDivisors(12))

func isPrime(_ a:Int) -> Bool {
    if countDivisors(a) == 2 {
        return true
    }
    return false
}

print(isPrime(3))
print(isPrime(8))
print(isPrime(13))

func smartBard(_ n: Int, f:() -> ()) {
    for _ in 1...n {
        f()   
    }
}

let n=10
smartBard(n) {
    print("I will pass this course with best mark, because Swift is great!")
}

let numbers = [10, 16, 18, 30, 38, 40, 44, 50]
print(numbers.filter{$0 % 4 == 0})

print(numbers.reduce(0){$1 > $0 ? $1 : $0})

var strings = ["Gdansk", "University", "of", "Technology"]
print(strings.reduce(""){$0 == "" ? $0 + $1 : $0 + " " + $1 })

let numbers2 = [1, 2 ,3 ,4, 5, 6]
print(numbers2.filter{$0 % 2 == 1}.map{$0 * $0}.reduce(0){$0 + $1})

func minmax (_ a: Int, _ b : Int) -> (Int, Int) {
    if a < b {
        return (a,b)
    }
    return (b,a)
}

print(minmax(1,2))
print(minmax(2,1))

var stringsArray = ["gdansk", "university", "gdansk", "university", "university", "of", "technology", "technology", "gdansk", "gdansk"]

var countedStrings = Array<(String, Int)>()

var stringsMap = [String: Int]()

for s in stringsArray {
    if let count = stringsMap[s] {
        stringsMap[s] = count + 1
    } else {
        stringsMap[s] = 1
    }
}

for (key, value) in stringsMap {
    countedStrings.append((key, value))
}

print(countedStrings)

enum Day: Int {
    case monday = 1
    case tuesday = 2 
    case wednesday = 3 
    case thursday = 4 
    case friday = 5 
    case saturday = 6 
    case sunday = 7
    
    func emoji() -> String {
        switch self {
        case .monday:
            return "🌞"
        case .tuesday:
            return "🌮"
        case .wednesday:
            return "🍂"
        case .thursday:
            return "🚀"
        case .friday:
            return "🎉"
        case .saturday:
            return "🍕"
        case .sunday:
            return "🌈"
        }
    }
}

// Example usage
let today = Day.wednesday
print("\(today) \(today.rawValue), emoji: \(today.emoji())")



