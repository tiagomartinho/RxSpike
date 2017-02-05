import Foundation

extension String {
    func match(pattern: String) -> Bool {
        let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let numberOfMatches = regex?.numberOfMatches(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) ?? 0
        return numberOfMatches > 0
    }
}
