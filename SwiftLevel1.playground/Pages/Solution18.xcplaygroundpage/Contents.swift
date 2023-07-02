//: [Previous](@previous)

import Foundation

/*
 예산(4점)
 https://school.programmers.co.kr/learn/courses/30/lessons/12982
 
 부서별로 신청한 금액이 들어있는 배열 d와 예산 budget이 매개변수로 주어질 때, 최대 몇 개의 부서에 물품을 지원할 수 있는지 return 하도록 solution 함수를 완성해주세요.
 제한사항
 d는 부서별로 신청한 금액이 들어있는 배열이며, 길이(전체 부서의 개수)는 1 이상 100 이하입니다.
 d의 각 원소는 부서별로 신청한 금액을 나타내며, 부서별 신청 금액은 1 이상 100,000 이하의 자연수입니다.
 budget은 예산을 나타내며, 1 이상 10,000,000 이하의 자연수입니다.
 입출력 예
 d              budget    result
 [1,3,2,5,4]    9           3
 [2,2,3,3]      10          4
 */
func solution(_ d:[Int], _ budget:Int) -> Int {
    
    //let arr = d.sorted()
    //print(arr)
    var sum = 0
    var count = 0
    
    /*for val in arr {
        sum += val
        if sum > budget {
            break
        }
        else {
            count += 1
        }
    }*/
    
    d.sorted().forEach {
        sum += $0
        if sum > budget {
            return
        }
        else {
            count += 1
        }
    }
    
    return count
}

let result = solution([1,3,2,5,4], 9)
print(result)

//: [Next](@next)
