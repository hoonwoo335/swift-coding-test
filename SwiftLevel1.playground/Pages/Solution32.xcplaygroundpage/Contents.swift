//: [Previous](@previous)

import Foundation

/*
 
 이상한 문자 만들기(10점)
 https://school.programmers.co.kr/learn/courses/30/lessons/12930
 문제 설명
 문자열 s는 한 개 이상의 단어로 구성되어 있습니다. 각 단어는 하나 이상의 공백문자로 구분되어 있습니다. 각 단어의 짝수번째 알파벳은 대문자로, 홀수번째 알파벳은 소문자로 바꾼 문자열을 리턴하는 함수, solution을 완성하세요.

 제한 사항
 문자열 전체의 짝/홀수 인덱스가 아니라, 단어(공백을 기준)별로 짝/홀수 인덱스를 판단해야합니다.
 첫 번째 글자는 0번째 인덱스로 보아 짝수번째 알파벳으로 처리해야 합니다.
 입출력 예
 s    return
 "try hello world"    "TrY HeLlO WoRlD"
 입출력 예 설명
 "try hello world"는 세 단어 "try", "hello", "world"로 구성되어 있습니다. 각 단어의 짝수번째 문자를 대문자로, 홀수번째 문자를 소문자로 바꾸면 "TrY", "HeLlO", "WoRlD"입니다. 따라서 "TrY HeLlO WoRlD" 를 리턴합니다.
 
 s.split(separator: " ") -> Substring type
 s.split(separator: " ").map(String.init) -> Substring to string
 split 이 아니라 components를 써야 모든 공백이 처리 되면서 문제풀이 성공이 된다.
 
 javascript
 return s.toUpperCase().replace(/(\w)(\w)/g, function(a){return a[0].toUpperCase()+a[1].toLowerCase();})

 */
func solution(_ s:String) -> String {
    //let strs = s.split(separator: " ").map(String.init) // fail
    let strs = s.components(separatedBy: " ") // success
    print(strs)
    var result = ""
    
    func changeCharacter(_ s:String) -> String {
        var subs = Array(s)
        for (i, char) in subs.enumerated() {
            var temp = ""
            if i==0 || i%2==0 {
                temp = String(char).uppercased()
            }
            else {
                temp = String(char).lowercased()
            }
            subs[i] = temp[temp.startIndex] // string to substring
        }
        return String(subs)
    }
    
    for (i, str) in strs.enumerated() {
        result += changeCharacter(str)
        if i < strs.count-1 {
            result += " "
        }
    }
    
    return result
    
    /*
     map을 활용한 방법
     
    let a = s.components(separatedBy: " ").map { $0.enumerated().map { $0.offset % 2 == 0 ? $0.element.uppercased() : $0.element.lowercased() } }
    return a.map{ $0.map { $0 }.joined() }.joined(separator: " ")
     */
}

let s = "try hello world"
let result = solution(s)
print(result)

//: [Next](@next)
