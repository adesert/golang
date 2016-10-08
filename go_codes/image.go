
package main

import "fmt"
import "image"

func main() {
	m := image.NewRGBA(image.Rect(0,0,100,100))
	fmt.Println(m.Bounds())
	fmt.Println(m.At(0,0).RGBA())
}