prefix operator ==

public prefix func == <T: Equatable>(rhs: T) -> ( (T) -> Bool ) {
    { lhs in lhs == rhs }
}

#warning("Add === too")

// infix
public func == <T, U: Equatable>(kp: KeyPath<T, U>, rhs: U) -> ( (T) -> Bool ) {
    { lhs in lhs[keyPath: kp] == rhs }
}

prefix operator !=

public prefix func != <T: Equatable>(rhs: T) -> ( (T) -> Bool ) {
    { lhs in lhs != rhs }
}

// infix
func != <T, U: Equatable>(kp: KeyPath<T, U>, rhs: U) -> ( (T) -> Bool ) {
    { lhs in lhs[keyPath: kp] != rhs }
}

public prefix func ! <T>(predicate: @escaping (T) -> Bool) -> (T) -> Bool {
    return { !predicate($0) }
}
