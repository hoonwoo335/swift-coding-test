//: [Previous](@previous)

import Foundation

/*
 모의고사(6점)
 https://school.programmers.co.kr/learn/courses/30/lessons/42840
 수포자는 수학을 포기한 사람의 준말입니다. 수포자 삼인방은 모의고사에 수학 문제를 전부 찍으려 합니다. 수포자는 1번 문제부터 마지막 문제까지 다음과 같이 찍습니다.
 1번 수포자가 찍는 방식: 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, ...
 2번 수포자가 찍는 방식: 2, 1, 2, 3, 2, 4, 2, 5, 2, 1, 2, 3, 2, 4, 2, 5, ...
 3번 수포자가 찍는 방식: 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, ...
 1번 문제부터 마지막 문제까지의 정답이 순서대로 들은 배열 answers가 주어졌을 때, 가장 많은 문제를 맞힌 사람이 누구인지 배열에 담아 return 하도록 solution 함수를 작성해주세요.
 제한 조건
 시험은 최대 10,000 문제로 구성되어있습니다.
 문제의 정답은 1, 2, 3, 4, 5중 하나입니다.
 가장 높은 점수를 받은 사람이 여럿일 경우, return하는 값을 오름차순 정렬해주세요.
 입출력 예
 answers    return
 [1,2,3,4,5]    [1]
 [1,3,2,4,2]    [1,2,3]
 
 // 대신에 i % 5 로 간단히 할수 있다
 idx += 1
 if idx == pick.count {
     idx = 0
 }
 */
func solution(_ answers:[Int]) -> [Int] {
    let supojas = [
        [1,2,3,4,5], // index % 5
        [2,1,2,3,2,4,2,5], // index % 8
        [3,3,1,1,2,2,4,4,5,5] // index % 10
    ]
    var result: [Int] = [0,0,0]
    var corector: [Int] = []
    var maxVal = 0
    
    for (i,p) in supojas.enumerated() {
        var num = 0
        for (j,v) in answers.enumerated() {
            //print(j % p.count)
            if v == p[j % p.count] {
                num += 1
            }
        }
        print("num",num)
        if num > 0 {
            result[i] = num
            if num > maxVal {
                maxVal = num
            }
        }
    }
    
    for i in 0..<result.count {
        if result[i] == maxVal {
            corector.append(i+1)
        }
    }
    print(result)
    print(corector)
    
    return corector.sorted()
    
    /*
     // dictionary를 이용한 다른 solution
    let answer = (
        a: [1, 2, 3, 4, 5], // index % 5
        b: [2, 1, 2, 3, 2, 4, 2, 5], // index % 8
        c: [3, 3, 1, 1, 2, 2, 4, 4, 5, 5] // index % 10
    )
    var point = [1:0, 2:0, 3:0]

    for (i, v) in answers.enumerated() {
        if v == answer.a[i % 5] { point[1] = point[1]! + 1 }
        if v == answer.b[i % 8] { point[2] = point[2]! + 1 }
        if v == answer.c[i % 10] { point[3] = point[3]! + 1 }
    }

    return point.sorted{ $0.key < $1.key }.filter{ $0.value == point.values.max() }.map{ $0.key }
     */
}

let answer = [1,3,2,4,2]
let result = solution(answer)
print(result)

//: [Next](@next)
