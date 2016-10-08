
// 斐波那契数列

package main

import (
	"fmt" 
)

func F(id int) int {
	if(id <2){
		return id
	}
	return F(id-1) + F(id-2)
}

func fibonacci() func() int {
	id :=-1
	return func() int{
		id += 1
		return F(id);
	}
}

func main() {
	f := fibonacci()
	for i:=0;i<10;i++{
		fmt.Println(f())
	}
}