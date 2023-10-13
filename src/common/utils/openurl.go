package utils

import (
	"fmt"
	"os/exec"
	"runtime"
)

// OpenWithBrowser opens url with default browser.
// 参考：https://github.com/toqueteos/webbrowser/blob/main/webbrowser.go
func OpenWithBrowser(url string) error {
	if url == "" {
		return nil
	}

	var cmd *exec.Cmd
	switch runtime.GOOS {
	case "linux":
		cmd = exec.Command("xdg-open", url)
	case "windows":
		cmd = exec.Command("cmd", "/c", "start", url)
	case "darwin":
		cmd = exec.Command("open", url)
	default:
		return fmt.Errorf("runtime.GOOS %s is not supported", runtime.GOOS)
	}

	return cmd.Start()
}
