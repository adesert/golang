
package main

import "fmt"

type Person struct {
	Name string
	Age int
}

func (p Person) String() string {
	return fmt.Sprintf("%v (%v years)",p.Name,p.Age)
}

type IPAddr [4]byte

func main() {
	a := Person{"jack",20}
	z := Person{"hok",22}
	fmt.Println(a, z)

	/////

	addrs := map[string]IPAddr {
		"loopback" : {127,0,0,1},
		"googleDNS" : {8,8,8,8},
	}

	for n,a := range addrs {
		fmt.Printf("%v : %v\n",n,a)
	}
}

