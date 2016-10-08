
package main

import "fmt"

type Vertex struct {
	Lat, Long float64
}

var m = map[string]Vertex{
	"Bell Labs": Vertex{
		40.68433, -74.39967,
	},
	"Google": Vertex{
		37.42202, -122.08408,
	},
}

//若顶级类型只是一个类型名，你可以在文法的元素中省略它。
var n = map[string]Vertex{
	"Bell Labs" : {222.2,233,}
	"Google":{1,2,}
}

func main() {
	fmt.Println(m)
}


