//: [Previous](@previous)

import Foundation

/*
 핸드폰 번호 가리기
 https://school.programmers.co.kr/learn/courses/30/lessons/12948
 
 전화번호의 뒷 4자리를 제외한 나머지 숫자를 전부 *으로 가린 문자열을 리턴하는 함수
 제한 조건
 phone_number는 길이 4 이상, 20이하인 문자열입니다.
 입출력 예
 phone_number    return
 "01033334444"    "*******4444"
 "027778888"    "*****8888"
 */
func solution(_ phone_number:String) -> String {
    var phNum = Array(phone_number)
    print(phNum)
    for i in 0..<phNum.count-4 {
        phNum[i] = "*"
    }
    return String(phNum)
    
    // 한줄로 가능
    //String(repeating:"*", count:phone_number.count-4)+phone_number.suffix(4)
}

print(solution("01033334444"))
//: [Next](@next)
