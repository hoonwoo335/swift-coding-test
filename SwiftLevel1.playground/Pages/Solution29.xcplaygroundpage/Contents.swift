//: [Previous](@previous)

import Foundation

/*
 정수 내림차순으로 배치하기
 https://school.programmers.co.kr/learn/courses/30/lessons/12933
 문제 설명
 함수 solution은 정수 n을 매개변수로 입력받습니다. n의 각 자릿수를 큰것부터 작은 순으로 정렬한 새로운 정수를 리턴해주세요. 예를들어 n이 118372면 873211을 리턴하면 됩니다.

 제한 조건
 n은 1이상 8000000000 이하인 자연수입니다.
 입출력 예
 n    return
 118372    873211
 */
func solution(_ n: Int64) -> Int64 {
    /*let str = "\(n)"
    var arr: [Int] = []
    
    for char in str {
        arr.append(char.hexDigitValue!)
    }
    arr = arr.sorted(by: { $0 > $1 })
    
    return Int64(arr.reduce(0, { $0 * 10 + $1 }))*/
    
    // 그냥 정수를 문자열 배열로 바로 받아서 정렬후 정수로 변환해주면 간단히 해결
    var arr = Array(String(n))
    arr = arr.sorted(by: { $0 > $1 })
    return Int64(String(arr))!
    // 한줄로 가능
    //return Int64(String(Array(String(n)).sorted { $0 > $1 }))!
}

print(solution(118372))

//: [Next](@next)
