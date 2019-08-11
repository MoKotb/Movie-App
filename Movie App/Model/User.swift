import Foundation
import SwiftyJSON

class User {
    
    public private(set) var id:Int!
    public private(set) var iso:String!
    public private(set) var username:String!
    public private(set) var name:String!
    public private(set) var adult:Bool!
    
    init(){}
    
    init(id:Int,iso:String,username:String,name:String,adult:Bool) {
        self.id = id
        self.iso = iso
        self.username = username
        self.name = name
        self.adult = adult
    }
    
    func parseUser(data:Data) -> User {
        var newUser = User()
        do{
            let json = try JSON(data: data)
            let id = json["id"].intValue
            let iso = json["iso_3166_1"].stringValue
            let username = json["username"].stringValue
            let name = json["name"].stringValue
            let adult = json["include_adult"].boolValue
            newUser = User(id: id, iso: iso, username: username, name: name, adult: adult)
        }catch let error{
            debugPrint("User.parseUser() \(error.localizedDescription)")
        }
        return newUser
    }
}
