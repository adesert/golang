
/*
默认选择
当 select 中的其他条件分支都没有准备好的时候，default 分支会被执行。

为了非阻塞的发送或者接收，可使用 default 分支：

*/

package main

import "fmt"
import "time"

func main() {
	tick := time.Tick(100*time.Millisecond)
	boom := time.Tick(500*time.Millisecond)
	for{
		select {
		case <-tick:
			fmt.Println("tick.")
		case <-boom:
			fmt.Println("BOOM!")
			return
		default:
			fmt.Println("   .")
			time.Sleep(50 * time.Millisecond)
		}
	}
}