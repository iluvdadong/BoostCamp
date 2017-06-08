
import Foundation

class GradeManager {
    private var studentInfos: [StudentInfo]
    
    init(infos: [StudentInfo]) {
        self.studentInfos = infos
        
        self.sortStudentInfos()
    }
    
    private func sortStudentInfos() -> Void {
        studentInfos.sort { (a, b) -> Bool in
            a.getSname() < b.getSname()
        }
    }
    
    public func printResult() -> Void {
        var result = "성적결과표\n\n"
        
        let avg_score = String(format: "%.2f", self.getAllAvgScore())
        result.append("전체 평균 : \(avg_score)\n\n")
        
        result.append("개인별 학점\n")
        
        for info in self.studentInfos {
            result.append(info.getSname())
            
            let space_counter = 11 - info.getSname().characters.count
            
            for _ in 0 ..< space_counter {
                result.append(" ")
            }
            
            result.append(": ")
            result.append(info.getGrade())
            result.append("\n")
        }
        
        result.append("\n")
    
        
        
        result.append(getStudentList())
        
        FileMan.writeOutput(string: result)
    }
    
    private func getAllAvgScore() -> Float {
        var sum_score: Float = 0
        
        for info in self.studentInfos {
            sum_score += info.getAvg()
        }
        
        return sum_score / Float(studentInfos.count)
    }
    
    private func getStudentList() -> String {
        var result_text = "수료생\n"
        
        for info in studentInfos {
            if info.passOrNot() {
                result_text.append("\(info.getSname()), ")
            }
        }
        
        result_text.remove(at: result_text.index(before: result_text.endIndex))
        result_text.remove(at: result_text.index(before: result_text.endIndex))
        
        return result_text
    }
}
