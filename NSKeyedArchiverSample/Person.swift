import CoreData

class Person: NSObject,NSCoding{
    let name:String
    let address:Address
    
    //コンストラクタ
    init(name:String,address:Address){
        self.name = name
        self.address = address
    }
    //復元用コンストラクタ
    required init (coder aDecoder:NSCoder){
        self.name = aDecoder.decodeObjectForKey("name") as! String
        self.address = aDecoder.decodeObjectForKey("address") as! Address
    }
    //エンコード
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name,forKey: "name")
        aCoder.encodeObject(self.address,forKey: "address")
    }
}