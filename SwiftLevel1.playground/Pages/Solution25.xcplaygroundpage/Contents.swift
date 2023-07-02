//: [Previous](@previous)

import Foundation

/*
 최대공약수와 최소공배수(3점)
 https://school.programmers.co.kr/learn/courses/30/lessons/12940
 
 최대공약수: 두 정수의 공통된 약수 중 가장 큰 수
 최소공배수: 두 정수의 공통된 배수 중 가장 작은 수
 두 수를 입력받아 두 수의 최대공약수와 최소공배수를 반환하는 함수, solution을 완성해 보세요. 배열의 맨 앞에 최대공약수, 그다음 최소공배수를 넣어 반환하면 됩니다.
 예를 들어 두 수 3, 12의 최대공약수는 3, 최소공배수는 12이므로 solution(3, 12)는 [3, 12]를 반환해야 합니다.
 제한 사항
 두 수는 1이상 1000000이하의 자연수입니다.
 입출력 예
 n    m    return
 3    12    [3, 12]
 2    5    [1, 10]
 
 최대공약수 공식
 숫자1 % 숫자 2 == 0 ? 둘중최소값(숫자1, 숫자2) : 없으면 다시(숫자2, 숫자1 % 숫자2)
 최소공배수 공식
 (숫자1 * 숫자2) / 최대공약수
 */
func solution(_ n:Int, _ m:Int) -> [Int] {
    /*let mod: Int = n % m
    if mod == 0 {
        print("1-\(min(n, m))")
    }
    else {
        print("2-\(m),\(mod)")
    }*/
    
    // 최대공약수
    func gcd(_ num: Int, _ num2: Int) -> Int {
        let mod: Int = num % num2
        return mod == 0 ? min(num, num2) : gcd(num2, mod)
    }
    // 최소공배수
    func lcm(_ a: Int, _ b: Int) -> Int {
        return a * b / gcd(a, b)
    }
    return [gcd(n, m), lcm(n, m)]
}

print(solution(3,12))
//: [Next](@next)
