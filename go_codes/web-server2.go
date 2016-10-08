
package main

import (
	"fmt"
	"net/http"
	"log"
)

type A string
func (a A) ServeHTTP(
	w http.ResponseWriter,
	r *http.Request) {
	fmt.Fprint(w, "a !")
}

type B struct {
	Name string 
	Age int
}
func (b B) ServeHTTP(w http.ResponseWriter,r *http.Request){
	fmt.Fprint(w, "b !")
	fmt.Println(w)
	fmt.Println(*r)	
}


func main() {
	// http.Handle("/string", String("I'm a frayed knot."))
	// http.Handle("/struct", &Struct{"Hello", ":", "Gophers!"})
	http.Handle("/a", A("a"))
	http.Handle("/b", &B{"jack",20})
	log.Fatal(http.ListenAndServe("localhost:4000", nil))
}