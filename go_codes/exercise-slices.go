
package main

import "fmt"

import "golang.org/x/tour/pic"

func Pic(dx,dy int) [][]uint8 {
	d := make([][]uint8,100)
	for i:=0;i<len(d);i++{
		for j:=0;j<len(d);j++{
			d[i][j] = i*j;
		}
	}
	return d
}

func main() {
	pic.Show(Pic)
}