import Foundation
//Kacper Witczak 193609 Informatyka Grupa 4 Sroda 18:15-20:00 2/2
//1.1
var a = 5
var b = 10
var sum = a + b
print(String(a) + " + " + String(b) + " = " + String(sum))

//1.2
var school_name = "Gdansk University of Technology"
var school_name_new = ""
for c in school_name {
  if c == "n" {
    school_name_new += "⭐️"
  } else {
    school_name_new += String(c)
  }
}
print(school_name_new)

//1.3
var name = "Kacper Witczak"
var reversed_name = String(name.reversed())
print("\(name) -> \(reversed_name)")

//2.1
for _ in 1...11 {
  print("I will pass this course with best mark, because Swift is great!")
}

//2.2
let n = 5
for i in 1...n {
  print(i*i)
}

//2.3
let n2 = 4
for _ in 1...n2 {
  for _ in 1...n2 {
    print("@", terminator: "")
  }
  print("")
}

//3.1
var numbers = [5, 10, 20, 15, 80, 13]
let max_number = numbers.max()
if let unwrappedMax = max_number {
    print(unwrappedMax)
}

//3.2
var numbers_reversed = Array(numbers.reversed())
print(numbers_reversed)

//3.3
var allNumbers = [10, 20, 10, 11, 13, 20, 10, 30]
var unique_numbers = Array(Set(allNumbers))
print("unique = \(unique_numbers)")

//4.1
var number = 10
var result = Array<Int>()
for i in 1...number {
  if number%i == 0 {
    result.append(i)
  }
}
print(result)

//5.1
var flights: [[String: String]] = [
    [
        "flightNumber" : "AA8025",
        "destination" : "Copenhagen"
    ],
    [
        "flightNumber" : "BA1442",
        "destination" : "New York"
    ],
    [
        "flightNumber" : "BD6741",
        "destination" : "Barcelona"
    ]
]
var flightsResult = [String]()
for flight in flights {
  flightsResult.append(flight["flightNumber"]!)
}
print("flightNumbers = \(flightsResult)")

//5.2
var names = ["Hommer","Lisa","Bart"]
var fullNames = [[String:String]]()
for name in names {
  fullNames.append(["lastName":"Simpson","firstName":name])
}
print("fullName = ")
for f in fullNames {
    print(f)
}