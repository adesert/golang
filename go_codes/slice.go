

package main

import "fmt"

func main() {
	s := []int{2,3,5,7,11,12}
	fmt.Printf("s ==",s)

	for i:=0;i<len(s);i++{
		fmt.Printf("s[%d] == %d\n",i,s[i])
	}
}