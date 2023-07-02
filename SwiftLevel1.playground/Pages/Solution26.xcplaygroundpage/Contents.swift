//: [Previous](@previous)

import Foundation

/*
 짝수와 홀수
 https://school.programmers.co.kr/learn/courses/30/lessons/12937
 문제 설명
 정수 num이 짝수일 경우 "Even"을 반환하고 홀수인 경우 "Odd"를 반환하는 함수, solution을 완성해주세요.

 제한 조건
 num은 int 범위의 정수입니다.
 0은 짝수입니다.
 입출력 예
 num    return
 3    "Odd"
 4    "Even"
 */
func solution(_ num:Int) -> String {
    var result: String = ""
    var value: Int = num
    
    if value < 0 {
        value *= -1
    }
    
    if value > 0 {
        if value % 2 == 0 {
            result = "Even"
        }
        else {
            result = "Odd"
        }
    }
    else if value == 0 {
        result = "Even"
    }
    return result
}

print(solution(4))

//: [Next](@next)
