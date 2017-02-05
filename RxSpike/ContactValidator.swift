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

        return errors
    }
}
