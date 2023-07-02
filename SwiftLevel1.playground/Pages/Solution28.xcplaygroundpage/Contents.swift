//: [Previous](@previous)

import Foundation

/*
 정수 제곱근 판별
 https://school.programmers.co.kr/learn/courses/30/lessons/12934
 문제 설명
 임의의 양의 정수 n에 대해, n이 어떤 양의 정수 x의 제곱인지 아닌지 판단하려 합니다.
 n이 양의 정수 x의 제곱이라면 x+1의 제곱을 리턴하고, n이 양의 정수 x의 제곱이 아니라면 -1을 리턴하는 함수를 완성하세요.
 
 제한 사항
 n은 1이상, 50000000000000 이하인 양의 정수입니다.
 입출력 예
 n    return
 121    144
 3    -1
 입출력 예 설명
 입출력 예#1
 121은 양의 정수 11의 제곱이므로, (11+1)를 제곱한 144를 리턴합니다.

 입출력 예#2
 3은 양의 정수의 제곱이 아니므로, -1을 리턴합니다.
 
 (소수점은 % 연산을 할수 없음 truncatingRemainder이걸 사용)
 */
func solution(_ n: Int64) -> Int64 {
    //let value = sqrt(Double(n))//제곱근 구하기
    //print(value)
    
    // sqrt사용하지 않고
    for num in 1...Int(n) {
        if num*num == n {
            return Int64((num+1) * (num+1))
        }
    }
    
    return -1
}

print(solution(121))

//: [Next](@next)
