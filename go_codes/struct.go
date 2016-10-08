
package main

import "fmt"

type Vertex struct {
	X int
	Y int
}

func  main() {
	fmt.Println(Vertex{1,2})

	v := Vertex{3,4}
	v.X = 10
	fmt.Println(v.X)

	m := Vertex{10,11}
	p := &m
	p.X = 1e9
	fmt.Println(*p)
}