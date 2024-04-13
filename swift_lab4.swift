import Foundation

class City {
    var id: Int
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double

    var keywords: [String] = []

    init(id: Int, name: String, description: String, latitude: Double, longitude: Double) {
        self.id = id
        self.name = name
        self.description = description
        self.latitude = latitude
        self.longitude = longitude
    }

    init(id: Int, name: String, description: String, latitude: Double, longitude: Double, keywords: [String]) {
        self.id = id
        self.name = name
        self.description = description
        self.latitude = latitude
        self.longitude = longitude
        self.keywords = keywords
    }

    func show() {
        print("City ID: \(id), Name: \(name), Description: \(description), Latitude: \(latitude), Longitude: \(longitude)")
        print("Keywords: \(keywords)")
    }

}

enum LocationType {
    case Museum, Pub, Restaurant, Hotel, Monument
}

class Location {
    let id: Int
    let type: LocationType
    let name: String
    let rating: Int

    init(id: Int, type: String, name: String, rating: Int) {
        self.id = id
        switch type {
        case "Museum":
            self.type = .Museum
        case "Pub":
            self.type = .Pub
        case "Restaurant":
            self.type = .Restaurant
        case "Hotel":
            self.type = .Hotel
        case "Monument":
            self.type = .Monument
        default:
            self.type = .Museum
        }
        self.name = name
        self.rating = rating
    }

    func show() {
        print("Location ID: \(id), Type: \(type), Name: \(name), Rating: \(rating)")
    }
}

class ExtendedCity: City {
    var locations: [Location] = []

    override init(id: Int, name: String, description: String, latitude: Double, longitude: Double) {
        super.init(id: id, name: name, description: description, latitude: latitude, longitude: longitude)
    }

    init(id: Int, name: String, description: String, latitude: Double, longitude: Double, keywords: [String], locations: [Location]) {
        self.locations = locations
        super.init(id: id, name: name, description: description, latitude: latitude, longitude: longitude, keywords: keywords)
    }

    func showLocations() {
        for location in locations {
            location.show()
        }
    }
}


func showCities(cities: [City]) {
    for city in cities {
        city.show()
    }
}

func showExtendedCities(cities: [ExtendedCity]) {
    for city in cities {
        city.show()
        city.showLocations()
    }
}

func findCityByName(cities: [City], name: String) -> [City] {
    var result: [City] = []
    for city in cities {
        if city.name == name {
            result.append(city)
        }
    }
    return result
}

func findCityByKeyword(cities: [City], keyword: String) -> [City] {
    var result: [City] = []
    for city in cities {
        if city.keywords.contains(keyword) {
            result.append(city)
        }
    }
    return result
}

func calculateDistance(city1: City, city2: City) -> Double {
    let x1 = city1.latitude
    let y1 = city1.longitude
    let x2 = city2.latitude
    let y2 = city2.longitude

    let dist = sqrt(pow(x2 - x1, 2) + pow(y2 - y1, 2))

    return dist
}

func findFurthestAndClosestCity(cities: [City], x: Double, y: Double) {
    var min_dist = Double.infinity
    var max_dist = -Double.infinity
    var min_city = cities[0]
    var max_city = cities[0]

    for city in cities {
        let dist = calculateDistance(city1: city, city2: City(id: 0, name: "City0", description: "City0", latitude: x, longitude: y))
        if dist < min_dist {
            min_dist = dist
            min_city = city
        }
        if dist > max_dist {
            max_dist = dist
            max_city = city
        }
    }

    print("\nClosest city to (\(x),\(y)):")
    min_city.show()
    print("Furthest city to (\(x),\(y)):")
    max_city.show()
}

func findTwoFurtherstCities(cities: [City]){
    var max_dist = -Double.infinity
    var city1: City? = nil
    var city2: City? = nil

    let n = cities.count

    for i in 0..<n {
        for j in (i+1)..<n {
            let dist = calculateDistance(city1: cities[i], city2: cities[j])
            if dist > max_dist {
                max_dist = dist
                city1 = cities[i]
                city2 = cities[j]
            }
        }
    }

    print("\nTwo furtherst cities:")
    city1!.show()
    city2!.show()
}

func findCitiesByRestaurantRating(cities: [ExtendedCity], rating: Int) {
    var result: [ExtendedCity] = []
    for city in cities {
        for location in city.locations {
            if location.type == .Restaurant && location.rating == rating {
                result.append(city)
                break
            }
        }
    }

    print("\nCities with 5 star restaurant:")
    showExtendedCities(cities: result)
}

func getSortedLocations(city: ExtendedCity) -> [Location] {
    return city.locations.sorted(by: { $0.rating > $1.rating })
}

func displayCitiesWithLocationsRatedEqual(cities: [ExtendedCity], rating: Int) {
    for city in cities {
        city.show()
        let locationsWithRatingEqual = city.locations.filter({ $0.rating == rating }).count
        print("Number of locations with rating \(rating): \(locationsWithRatingEqual)")
        for location in city.locations {
            if location.rating == rating {
                location.show()
            }
        }
    }
}

var cities: [City] = []
for i in 1...20 {
    let city = City(id: i,
                    name: "City\(i)",
                    description: "Description of City\(i)",
                    latitude: Double.random(in: -90...90),
                    longitude: Double.random(in: -180...180),
                    keywords: ["keyword\(2*(i%5))", "keyword\(3*(i%7))", "keyword\(5*(i%9))"])
    cities.append(city)
}
cities.append(City(id: 21, name: "Warszawa", description: "Description of City21", latitude: 0, longitude: 0, keywords: ["keyword1", "keyword2", "keyword3"]))
cities.append(City(id: 22, name: "Krakow", description: "Description of City22", latitude: 90000000, longitude: 10000000, keywords: ["keyword4", "keyword5", "keyword6"]))

showCities(cities: cities)

//search 1
let foundCities = findCityByName(cities: cities, name: "City5")
print("\nFound cities:")
showCities(cities: foundCities)

//search 2
let foundCitiesByKeyword = findCityByKeyword(cities: cities, keyword: "keyword6")
print("\nFound cities by keyword:")
showCities(cities: foundCitiesByKeyword)


//distance 1
let distnace = calculateDistance(city1: cities[0], city2: cities[1])
print("\nDistance between \(cities[0].name) and \(cities[1].name): \(distnace)")

let x = 0.0
let y = 0.0

//distance 2
findFurthestAndClosestCity(cities: cities, x: x, y: y)

//distance 3
findTwoFurtherstCities(cities: cities)


var extendedCities: [ExtendedCity] = []
for i in 1...20 {
    var locations: [Location] = []
    let locationTypes = ["Museum", "Pub", "Restaurant", "Hotel", "Monument"]

    locations.append(Location(id: Int.random(in: 1...100), type: locationTypes[Int.random(in: 0..<locationTypes.count)], name: "History Museum", rating: Int.random(in: 1...5)))
    locations.append(Location(id: Int.random(in: 1...100), type: locationTypes[Int.random(in: 0..<locationTypes.count)], name: "Plan C Wejherowo", rating: Int.random(in: 1...5)))
    locations.append(Location(id: Int.random(in: 1...100), type: locationTypes[Int.random(in: 0..<locationTypes.count)], name: "McDonald", rating: Int.random(in: 1...5)))
    
    let city = ExtendedCity(id: i,
                            name: "City\(i)",
                            description: "Description of City\(i)",
                            latitude: Double.random(in: -90...90),
                            longitude: Double.random(in: -180...180),
                            keywords: ["keyword\(2*(i%5))", "keyword\(3*(i%7))", "keyword\(5*(i%9))"],
                            locations: locations)
    extendedCities.append(city)
}

//advance search 1
findCitiesByRestaurantRating(cities: extendedCities, rating: 5)

//advance search 2
let sortedLocations = getSortedLocations(city: extendedCities[0])
print("Sorted locations:")
for location in sortedLocations {
    location.show()
}

//advance search 3
print("\nCities with locations rated 5:")
displayCitiesWithLocationsRatedEqual(cities: extendedCities, rating: 5)
