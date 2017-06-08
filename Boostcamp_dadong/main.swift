import Foundation

var infos: [[String: Any]] = []
var studentInfos = [StudentInfo]()

infos = FileMan.readJson()

for info in infos {
    let studentInfo = StudentInfo(info: info)
    studentInfos.append(studentInfo)
}

var manager = GradeManager(infos: studentInfos)

manager.printResult()
