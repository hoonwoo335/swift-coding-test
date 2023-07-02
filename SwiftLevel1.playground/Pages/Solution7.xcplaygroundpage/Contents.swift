//: [Previous](@previous)

import Foundation

/*
 숫자 문자열과 영단어(3점)
 https://school.programmers.co.kr/learn/courses/30/lessons/81301
 다음은 숫자의 일부 자릿수를 영단어로 바꾸는 예시입니다.
 1478 → "one4seveneight"
 234567 → "23four5six7"
 10203 → "1zerotwozero3"
 이렇게 숫자의 일부 자릿수가 영단어로 바뀌어졌거나, 혹은 바뀌지 않고 그대로인 문자열 s가 매개변수로 주어집니다. s가 의미하는 원래 숫자를 return 하도록 solution 함수를 완성해주세요.
 */
func solution(_ s:String) -> Int {
    /*
    let words = [["zero","0"],["one","1"],["two","2"],["three","3"],["four","4"],["five","5"],["six","6"],["seven","7"],["eight","8"],["nine","9"]]
    var num =  s
    for word in words {
        num = num.replacingOccurrences(of: word[0], with: word[1])
    }
     */
    
    // 이렇게 좀더 간소화 가능
    let words = ["zero","one","two","three","four","five","six","seven","eight","nine"]
    var num =  s
    for (i, word) in words.enumerated() {
        print(word)
        num = num.replacingOccurrences(of: word, with: String(i))
    }
    return Int(num)!
}

let result = solution("23four5six7")
print(result)

//: [Next](@next)
