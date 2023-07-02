//: [Previous](@previous)

import Foundation

/*
 나머지가 1이 되는 수 찾기
 https://school.programmers.co.kr/learn/courses/30/lessons/87389
 
 자연수 n이 매개변수로 주어집니다. n을 x로 나눈 나머지가 1이 되도록 하는 가장 작은 자연수 x를 return 하도록 solution 함수를 완성해주세요. 답이 항상 존재함은 증명될 수 있습니다.
 제한사항
 3 ≤ n ≤ 1,000,000
 입출력 예
 n    result
 10    3
 12    11
 */

func solution(_ n:Int) -> Int {
    var x = 1
    var minimum = 0
    
    while (x < n) {
        if n % x == 1 {
            if minimum == 0 || x < minimum {
                minimum = x
            }
        }
        x += 1
    }
    
    return minimum
}

let result = solution(10)
print(result)

//: [Next](@next)
