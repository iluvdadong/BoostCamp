import Foundation

class FileMan {
    public static func readJson() -> [[String: Any]] {
        do {
            let filePath = URL(fileURLWithPath: NSHomeDirectory().appending("/students.json"))
            let data = try Data(contentsOf: filePath)
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            if let json = json as? [[String: Any]] {
                return json
            } else {
                print("JSON is invalid")
                return [[:]]
            }
        } catch {
            print(error.localizedDescription)
        }
        return [[:]]
    }
    
    public static func writeOutput(string: String) -> Void {
        let fileName = "result.txt"
        
        let destination = FileManager.default.homeDirectoryForCurrentUser
        let resultPath = destination.appendingPathComponent(fileName)
        
        do {
            try string.write(to: resultPath, atomically: false, encoding: String.Encoding.utf8)
        }
        catch {
            print("write fail")
        }
    }
}
