//: [Previous](@previous)

import Foundation

/*
 평균 구하기
 https://school.programmers.co.kr/learn/courses/30/lessons/12944
 정수를 담고 있는 배열 arr의 평균값을 return
 arr은 길이 1 이상, 100 이하인 배열입니다.
 arr의 원소는 -10,000 이상 10,000 이하인 정수입니다.
 [1,2,3,4]    2.5
 [5,5]    5
 */
func solution(_ arr: [Int]) -> Double {
    //var total: Int = 0
    //arr.map { total += $0 }
    //return Double(total) / Double(arr.count)
    //reduce를 쓰면 한줄로 가능
    return Double(arr.reduce(0,+)) / Double(arr.count)
}

print(solution([1,2,3,4]))

//: [Next](@next)
