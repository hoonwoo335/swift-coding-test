//: [Previous](@previous)

import Foundation

/*
 최소직사각형
 https://school.programmers.co.kr/learn/courses/30/lessons/86491
 모든 명함의 가로 길이와 세로 길이를 나타내는 2차원 배열 sizes가 매개변수로 주어집니다. 모든 명함을 수납할 수 있는 가장 작은 지갑을 만들 때, 지갑의 크기를 return 하도록 solution 함수를 완성해주세요.
 
 제한사항
 sizes의 길이는 1 이상 10,000 이하입니다.
 sizes의 원소는 [w, h] 형식입니다.
 w는 명함의 가로 길이를 나타냅니다.
 h는 명함의 세로 길이를 나타냅니다.
 w와 h는 1 이상 1,000 이하인 자연수입니다.
 
 입출력 예
 sizes    result
 [[60, 50], [30, 70], [60, 30], [80, 40]]    4000
 [[10, 7], [12, 3], [8, 15], [14, 7], [5, 15]]    120
 [[14, 4], [19, 6], [6, 16], [18, 7], [7, 11]]    133
 */
func solution(_ sizes:[[Int]]) -> Int {
    var w = 0
    var h = 0
    var tmpSizes = sizes.map {
        $0.sorted(by: {$0 > $1})
    }
    print(tmpSizes)
    
    for size in tmpSizes {
        if w < size[0] {
            w = size[0]
        }
        if h < size[1] {
            h = size[1]
        }
    }
    
    return w * h
    
    /*
     min,max를 이용한 방법
     for size in sizes {
         maxNum = max(maxNum, size.max()!)
         minNum = max(minNum, size.min()!)
     }
     */
}

let sizes = [[60, 50], [30, 70], [60, 30], [80, 40]]
let result = solution(sizes)
print(result)

//: [Next](@next)
