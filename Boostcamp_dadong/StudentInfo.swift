
import Foundation

class StudentInfo {
    private var sname: String!
    private var datas_score: Float!
    private var algol_score: Float!
    private var nw_score: Float!
    private var datab_score: Float!
    private var os_score: Float!
    
    var avg_score: Float!
    
    var count_subject: Int = 0
    
    init(info: [String: Any]) {
        self.count_subject = 0
        
        if let name = info["name"] {
            self.sname = name as! String
        } else {
            self.sname = ""
        }
        
        let grades = info["grade"] as! [String: Any]
        
        self.setGrades(grades: grades)
        self.setAvgScore()
    }
    
    private func setGrades(grades: [String: Any]) -> Void {
        if let score = grades["algorithm"] {
            self.algol_score = score as! Float
            self.count_subject += 1
        } else {
            self.algol_score = 0
        }
        
        if let score = grades["data_structure"] {
            self.datas_score = score as! Float
            self.count_subject += 1
        } else {
            self.datas_score = 0
        }
        
        if let score = grades["database"] {
            self.datab_score = score as! Float
            self.count_subject += 1
        } else {
            self.datab_score = 0
        }
   
        if let score = grades["networking"] {
            self.nw_score = score as! Float
            self.count_subject += 1
        } else {
            self.nw_score = 0
        }
        
        if let score = grades["operating_system"] {
            self.os_score = score as! Float
            self.count_subject += 1
        } else {
            self.os_score = 0
        }
        
    }
    
    private func setAvgScore() -> Void {
        self.avg_score = (self.algol_score! + self.datab_score! + self.datas_score! + self.nw_score! + self.os_score!) / Float(self.count_subject)
    }
    
    public func getAvg() -> Float {
        if let score = self.avg_score {
            return score
        } else {
            return 0
        }
    }
    
    public func getGrade() -> String {
        let score = self.getAvg()
        
        if score >= 90 {
            return "A"
        } else if score >= 80 {
            return "B"
        } else if score >= 70 {
            return "C"
        } else if score >= 60 {
            return "D"
        } else {
            return "F"
        }
    }
    
    public func passOrNot() -> Bool {
        if let score = self.avg_score {
            if score >= 70 {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    public func getSname() -> String {
        if let name = self.sname {
            return name
        } else {
            return ""
        }
    }
}
