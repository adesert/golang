
// 方法的所有者

/*
	Go 没有类。然而，仍然可以在结构体类型上定义方法。

	方法接收者 出现在 func 关键字和方法名之间的参数中。

	你可以对包中的 任意 类型定义任意方法，而不仅仅是针对结构体。

	但是，不能对来自其他包的类型或基础类型定义方法。

*/


package main

import "fmt"

import "math"

type Vertex struct {
	X,Y float64
}

// Abs 相当于是定义在结构体Vertex 上的方法
func (v *Vertex) Abs() float64 {
	return math.Sqrt(v.X*v.X + v.Y*v.Y)
}

func main() {
	v := &Vertex{3,4}
	fmt.Println(v.Abs())
}