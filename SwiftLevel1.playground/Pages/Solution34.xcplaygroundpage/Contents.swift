//: [Previous](@previous)

import Foundation

/*
 시저암호(7점)
 https://school.programmers.co.kr/learn/courses/30/lessons/12926
 
 어떤 문장의 각 알파벳을 일정한 거리만큼 밀어서 다른 알파벳으로 바꾸는 암호화 방식을 시저 암호라고 합니다. 예를 들어 "AB"는 1만큼 밀면 "BC"가 되고, 3만큼 밀면 "DE"가 됩니다.
 "z"는 1만큼 밀면 "a"가 됩니다. 문자열 s와 거리 n을 입력받아 s를 n만큼 민 암호문을 만드는 함수, solution을 완성해 보세요.
 제한 조건
 공백은 아무리 밀어도 공백입니다.
 s는 알파벳 소문자, 대문자, 공백으로만 이루어져 있습니다.
 s의 길이는 8000이하입니다.
 n은 1 이상, 25이하인 자연수입니다.
 입출력 예
 s          n    result
 "AB"       1    "BC"
 "z"        1    "a"
 "a B z"    4    "e F d"
 
 Character to ascii -> Int(UnicodeScalar("A").value)
 ascii to character -> String(UnicodeScalar(65))
 a~z = 97-122
 A-z = 65-90
 */
func solution(_ s:String, _ n:Int) -> String {
    //print(Int(UnicodeScalar("a").value))
    //print(Int(UnicodeScalar("z").value))
    //print(Int(UnicodeScalar("A").value))
    //print(Int(UnicodeScalar("Z").value))
    var strs = ""
    
    for char in s {
        let str = String(char)
        if char == " " {
            strs += str
        }
        else {
            var ascii = Int(UnicodeScalar(str)!.value)
            print(ascii)
            ascii += n
            print(ascii)
            
            if str >= "a" && str <= "z" {//lowercase
                if ascii > 122 {
                    ascii = 97 + (ascii - 122) - 1
                }
            }
            else {//uppercase
                if ascii > 90 {
                    ascii = 65 + (ascii - 90) - 1
                }
            }
            
            print(ascii)
            strs += String(UnicodeScalar(ascii)!)
        }
    }
    
    return strs
}

let result = solution("AB", 1)
print(result)

//: [Next](@next)
