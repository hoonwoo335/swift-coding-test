//: [Previous](@previous)

import Foundation

/*
 비밀지도
 https://school.programmers.co.kr/learn/courses/30/lessons/17681
 
 네오는 평소 프로도가 비상금을 숨겨놓는 장소를 알려줄 비밀지도를 손에 넣었다. 그런데 이 비밀지도는 숫자로 암호화되어 있어 위치를 확인하기 위해서는 암호를 해독해야 한다.
 다행히 지도 암호를 해독할 방법을 적어놓은 메모도 함께 발견했다.
 지도는 한 변의 길이가 n인 정사각형 배열 형태로, 각 칸은 "공백"(" ") 또는 "벽"("#") 두 종류로 이루어져 있다.
 전체 지도는 두 장의 지도를 겹쳐서 얻을 수 있다. 각각 "지도 1"과 "지도 2"라고 하자. 지도 1 또는 지도 2 중 어느 하나라도 벽인 부분은 전체 지도에서도 벽이다.
 지도 1과 지도 2에서 모두 공백인 부분은 전체 지도에서도 공백이다.
 "지도 1"과 "지도 2"는 각각 정수 배열로 암호화되어 있다.
 암호화된 배열은 지도의 각 가로줄에서 벽 부분을 1, 공백 부분을 0으로 부호화했을 때 얻어지는 이진수에 해당하는 값의 배열이다.
 
 네오가 프로도의 비상금을 손에 넣을 수 있도록, 비밀지도의 암호를 해독하는 작업을 도와줄 프로그램을 작성하라.
 
 입력 형식
 입력으로 지도의 한 변 크기 n 과 2개의 정수 배열 arr1, arr2가 들어온다.
 1 ≦ n ≦ 16
 arr1, arr2는 길이 n인 정수 배열로 주어진다.
 정수 배열의 각 원소 x를 이진수로 변환했을 때의 길이는 n 이하이다. 즉, 0 ≦ x ≦ 2n - 1을 만족한다.
 
 출력 형식
 원래의 비밀지도를 해독하여 '#', 공백으로 구성된 문자열 배열로 출력하라.
 */

func solution3(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    /*var result: [String] = Array(repeating: "", count: n)
    var arr: [String] = Array(repeating: "", count: n)
    
    for i in 0..<n {
        let temp = String(arr1[i] | arr2[i], radix: 2) // ragix 진법변환
        print("temp - ", temp)
        arr[i] = temp
    }
    
    var i = 0
    for val in arr {
        for bin in val {
            result[i] += bin == "1" ? "#" : " "
        }
        i += 1
    }
    
    return result*/
    
    var result: [String] = Array(repeating: "", count: n)
    
    for i in 0..<n {
        let temp = String(arr1[i] | arr2[i], radix: 2) // ragix 진법변환
        print("temp - ", temp)
        // 이것을 수행하는 이유는 radix로 2진수로 변환할때 01111 앞자리가 0이면 그냥 1111로 떨어지는 문제로 자리수에 문제가 생김
        // 이문제를 보완하는 다음 코드를 추가
        let padded = Array(repeating: "0", count: n-temp.count) + temp
        print("padded - ", padded)
        for chr in padded {
            result[i] += chr == "1" ? "#" : " "
        }
        //temp = temp.replacingOccurrences(of: "1", with: "#")
        //result[i] = temp.replacingOccurrences(of: "0", with: " ")
    }
    
    return result
}

func solution2(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var result: [String] = Array(repeating: "", count: n)
    var arr: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    for i in 0..<arr1.count {
        var k = n - 1 // 5 ~ 0
        var j = 0 // 0 ~ 5
        while k >= 0 {
            arr[i][k] = arr1[i] >> j & 1 // 10진수 -> 2진수 변환 연산
            k -= 1
            j += 1
        }
    }
    
    print(arr1)
    print(arr)
    
    for i in 0..<arr2.count {
        var k = n - 1
        var j = 0
        var val = 0
        while k >= 0 {
            val = arr2[i] >> j & 1
            if (val == 1) {
                arr[i][k] = val
            }
            k -= 1
            j += 1
        }
    }
    
    print(arr2)
    print(arr)
    
    for i in 0..<arr.count {
        for j in 0..<arr[i].count {
            if (arr[i][j] == 1) {
                result[i] += "#"
            }
            else {
                result[i] += " "
            }
        }
    }
    
    return result
}


/*2,4,8,32
 [46, 33, 33, 22, 31, 50]
 [[1, 0, 1, 1, 1, 0], [1, 0, 0, 0, 0, 1], [1, 0, 0, 0, 0, 1], [0, 1, 0, 1, 1, 0], [0, 1, 1, 1, 1, 1], [1, 1, 0, 0, 1, 0]]
 [27, 56, 19, 14, 14, 10]
 [[1, 1, 1, 1, 1, 1], [1, 1, 1, 0, 0, 1], [1, 1, 0, 0, 1, 1], [0, 1, 1, 1, 1, 0], [0, 1, 1, 1, 1, 1], [1, 1, 1, 0, 1, 0]]
 ["######", "###  #", "##  ##", " #### ", " #####", "### # "]
 */

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var result: [String] = Array(repeating: "", count: n)
    var arr: [[Int]] = Array(repeating: (Array(repeating: 0, count: n)), count: n)
    
    for i in 0..<arr1.count {
        var k: Int = arr1[i]
        var j: Int = n-1
        
        while k > 0 {
            arr[i][j] = k%2
            k /= 2
            j -= 1
        }
    }
    
    print(arr1)
    print(arr)
    
    for i in 0..<arr2.count {
        var k: Int = arr2[i]
        var j: Int = n-1
        
        while k > 0 {
            if k%2 == 1 {
                arr[i][j] = k%2
            }
            k /= 2
            j -= 1
        }
    }
    
    print(arr2)
    print(arr)
    
    for i in 0..<arr.count {
        for  j in 0..<arr[i].count {
            if arr[i][j] == 1 {
                result[i].append("#")
            }
            else {
                result[i].append(" ")
            }
        }
    }
    
    return result
}

//let n = 6
//let arr1 = [46, 33, 33 ,22, 31, 50]
//let arr2 = [27 ,56, 19, 14, 14, 10]

let n = 5
let arr1 = [9, 3, 28, 18, 11]
let arr2 = [30, 1, 21, 17, 28]

let result = solution3(n, arr1, arr2)

print(result)

//: [Next](@next)
