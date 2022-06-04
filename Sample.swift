import UIKit

class employee
{
    
let name:String
let age: CGFloat
let gender:Int // 1 is male
var title:String//職稱, 總共三級
var level:Int // 階級總共十級
var notes:String = ""// 備註
    
    init(name:String,age:CGFloat,gender:Int,title:String,level:Int) {
    self.name       =       name
    self.age        =       age
    self.gender     =       gender
    self.title      =       title
    self.level      =       level
    }
}

/*
 目的： 新人報到時，計算並印出薪資後，連同個人資料一同寫回DB
 */
class EmployeeSystem {
    var employeeArray = [employee]()
    
    func getemployeearray() -> [employee] {
        employeeArray
    }
    
    /// 薪資計算規則
    /// 女生起薪 1500, 男生起薪 1000
    /// title 底薪從一千開始，每多一級多一千
    /// level 每多一級加 100
    /// - Parameter person: 員工
    /// - Returns: 薪資
    func offer(from person: employee) -> Int {
        if person.age >= 30 && person.age < 40 {
            person.notes = "而立"
        }
        if person.age >= 40 && person.age < 50 {
            person.notes = "不惑"
        }
        if person.age >= 50 && person.age < 60 {
            person.notes = "知天命"
        }
        if person.age >= 60 && person.age < 70 {
            person.notes = "耳順"
        }
        
        if person.gender == 1 {
            var salary = 1000 // 男
            if person.title == "師1" {
                salary += 1000 // 起薪
                salary += person.level * 100 // Level
                return salary
            } else if person.title == "師2" {
                salary += 2000 // 起薪
                salary += person.level * 100 // Level
                return salary
            } else if person.title == "師3" {
                salary += 3000 // 起薪
                salary += person.level * 100 // Level
                return salary
            }
        } else if person.gender == 0 {
            var salary = 1500 // 女
            if person.title == "師1" {
                salary += 1000 // 起薪
                salary += person.level * 100 // Level
                return salary
            } else if person.title == "師2" {
                salary += 2000 // 起薪
                salary += person.level * 100 // Level
                return salary
            } else if person.title == "師3" {
                salary += 3000 // 起薪
                salary += person.level * 100 // Level
                return salary
            }
        }
        return 0
    }
    func saveEmployee(_ person: employee) {
        // 將相關資料更新回 DB
    }
}

let es = EmployeeSystem()

let tony = employee(name: "tony", age: 40, gender: 1, title: "師3", level: 5)
let marry = employee(name: "marry", age: 22, gender: 0, title: "師1", level: 8)
let peter = employee(name: "peter", age: 61, gender: 1, title: "師2", level: 10)
let eve = employee(name: "eve", age: 35, gender: 0, title: "師2", level: 2)

es.employeeArray.append(tony)
es.employeeArray.append(marry)
es.employeeArray.append(peter)
es.employeeArray.append(eve)

for e in es.getemployeearray() {
    let offer = es.offer(from: e)
    print("\(e.name): \(offer)元")
    es.saveEmployee(e)
}
