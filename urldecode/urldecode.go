package main

import (
	"fmt"
	"net/url"
	"os"
)

func main() {
	if len(os.Args) > 1 {
		if values, err := url.ParseQuery(os.Args[1]); err == nil {
			for k := range values {
				fmt.Printf("%s\n", k)
			}

			os.Exit(0)
		}
	}
	fmt.Printf("usage: %s [String to urldecode]\n", os.Args[0])
	os.Exit(1)
}
