//
//  Memoization.swift
//  PreferredContentSizeStudies
//
//  Seen on Hacking with Swift: Using memoization to speed up slow functions` on 08/03/22.
//

func memoize<Input: Hashable, Output>(_ function: @escaping (Input) -> Output) -> (Input) -> Output {
    var storage = [Input: Output]()
    
    return { input in
        if let cached = storage[input] {
            return cached
        }

        let result = function(input)
        storage[input] = result
        return result
    }
}
