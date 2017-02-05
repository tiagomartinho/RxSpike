import Foundation

extension Contact {

    var isValid: Bool {
        return errors.isEmpty
    }
    
    var errors: [ContactError] {
        var errors = [ContactError]()

        if name.isEmpty {
            errors.append(.emptyName)
        }

        if number.isEmpty {
            errors.append(.emptyNumber)
        }

        if !number.match(pattern: "^[+][0-9]*\\s[0-9]*\\s[0-9]{6,}$") {
            errors.append(.numberHasInvalidFormat)
        }

        return errors
    }
}
