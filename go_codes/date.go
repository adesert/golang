

package main

import (
	"fmt"
	"time"
)

func main() {
	fmt.Println("today is date.")
	today := time.Now().Weekday()
	switch time.Saturday {
	case today+0:
		fmt.Println("Today")
	case today+1:
		fmt.Println("Tomorrow")
	case today+2:
		fmt.Println("In two days")
	default:
		fmt.Println("Too far awar.")
	}
}

//没有条件的 switch 同 switch true 一样。

