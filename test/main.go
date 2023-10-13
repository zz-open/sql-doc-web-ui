package main

import (
	"fmt"
	"go.uber.org/zap"
	"time"
)

func main() {
	//TString()

}

func F2() {

}

func F1() {

}

func TZap() {
	url := "www.baidu.com"
	logger, _ := zap.NewProduction()
	defer logger.Sync() // flushes buffer, if any
	sugar := logger.Sugar()
	sugar.Infow("failed to fetch URL",
		// Structured context as loosely typed key-value pairs.
		"url", url,
		"attempt", 3,
		"backoff", time.Second,
	)
	sugar.Infof("Failed to fetch URL: %s", url)
}

func TString() {
	str := fmt.Sprintf(
		`qweqwe hello world
%s`, "asdasd")
	fmt.Println(str)
}
