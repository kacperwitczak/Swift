import Foundation

class Multimedia {
    var data: String
    init(data: String) {
        self.data = data    
    }
    
    func display() {
        print("I'm multimedia and this is my context: \(data)")
    }
}

struct Size {
    var width: Int
    var height: Int
    
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }
}

class Picture: Multimedia {
    var size: Size
    
    init(data: String, size: Size) {
        self.size = size
        super.init(data: data)
    }
    
    override func display() {
        print("I'm a photo and this is my context: \(data), Size: \(size.width) x \(size.height)")
    }
}

class Video: Multimedia {
    var size: Size
    var length : Int
    
    init(data: String, size: Size, length : Int) {
        self.size = size
        self.length = length
        super.init(data: data)
    }
    
    override func display() {
        print("I'm a video and this is my context: \(data), Size: \(size.width) x \(size.height), Length: \(length)")
    }
}

enum Gender {
    case Male, Female, Other
}

class User: Equatable {
    var username: String
    var gender: Gender
    
    init(username: String, gender: Gender) {
        self.username = username
        self.gender = gender
    }
    
    func show() {
        print("Username: \(username), Gender: \(gender)")
    }
    
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.username == rhs.username && lhs.gender == rhs.gender
    }
}


enum PostType {
    case Private, FriendsOnly, Public
}

struct Comment {
    var commentID: Int
    var context: String
    
    init(commentID: Int, context: String) {
        self.commentID = commentID
        self.context = context
    }
    
    func display() {
        print("Comment ID: \(commentID), Context: \(context)")
    }
}

class Post {
    var postType: PostType
    var author: User
    var date: Date
    var description: String
    var multimedia: Multimedia
    var likes: [User] = []
    var comments: [Comment] = []
    var views: [User] = []
    var shares: [User] = []
    
    var dummyLikes: Int
    
    init(postType: PostType, author: User, date: Date, description: String, multimedia: Multimedia, dummyLikes: Int) {
        self.postType = postType
        self.author = author
        self.date = date
        self.description = description
        self.multimedia = multimedia
        self.dummyLikes = dummyLikes
    }
    
    func displayLikes() {
        let totalLikesInK = (likes.count + dummyLikes)/1000
        print("Total likes: \(totalLikesInK)k")
    }
    
    func addLike(user: User) {
        likes.append(user)
    }
    
    func removeLike(user: User) {
        if let index = likes.firstIndex(of: user) {
            likes.remove(at: index)
        }
    }
    
    func addComment(comment: Comment) {
        comments.append(comment)
    }
    
    func removeComment(commentID: Int) {
        if let index = comments.firstIndex(where: { $0.commentID == commentID }) {
            comments.remove(at: index)
        }
    }
    
    func displayComments() {
        print("Comments:")
        for comment in comments {
            comment.display()
        }
    }
    
    func addView(user: User) {
        views.append(user)
    }
    
    func addShare(user: User) {
        shares.append(user)
    }
    
    func removeShare(user: User) {
        if let index = shares.firstIndex(of: user) {
            shares.remove(at: index)
        }
    }
    
    func display() {
        print("Post Type: \(postType)")
        print("Author:")
        author.show()
        print("Date: \(date)")
        print("Description: \(description)")
        print("Multimedia:")
        multimedia.display()
        displayLikes()
        print("Comments: \(comments.count)")
        displayComments()
        print("Views: \(views.count)")
        print("Shares: \(shares.count)")
    }
}

let author = User(username: "Apple", gender: .Other)
let currentDate = Date()
let multimedia = Picture(data: "*IPHONE IMAGE*", size:Size(width: 100,height: 100))

let post = Post(postType: .Public,
                author: author,
                date: currentDate,
                description: "IOS ROCKS!!!",
                multimedia: multimedia,
                dummyLikes: 523745)

post.addLike(user: author)
let comment = Comment(commentID: Int.random(in: 1...10000), context: "ANDRIOID BETTER")
post.addComment(comment: comment)
let viewer = User(username: "KASIA98", gender: .Female)
post.addView(user: viewer)
let sharer = User(username: "KACPI12", gender: .Male)
post.addShare(user: sharer)

post.display()

print("===========================")

let author_2 = User(username: "BMW", gender: .Male)
let currentDate_2 = Date()
let multimedia_2 = Video(data: "NMW DRIFTING", size:Size(width: 100,height: 100), length: 10)

let post_2 = Post(postType: .Private,
                author: author_2,
                date: currentDate_2,
                description: "DAS AUTO",
                multimedia: multimedia_2,
                dummyLikes: 91837411)


post_2.addLike(user: author_2)
post_2.addLike(user: author)
let comment_2 = Comment(commentID: Int.random(in: 1...10000), context: "wow nice car!")
let comment_3 = Comment(commentID: Int.random(in: 1...10000), context: "wow nicecar!2")
post_2.addComment(comment: comment_2)
post_2.addComment(comment: comment_3)
let viewer_2 = User(username: "maciek1", gender: .Female)
post_2.addView(user: viewer_2)
post_2.addView(user: viewer)
let sharer_2 = User(username: "audihater", gender: .Male)
post_2.addShare(user: sharer_2)

post_2.display()

