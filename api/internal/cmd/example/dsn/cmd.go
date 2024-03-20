package dsn

import (
	"fmt"
	"github.com/spf13/cobra"
)

var (
	Cmd *cobra.Command
)

func init() {
	Cmd = &cobra.Command{
		Use:   "dsn",
		Short: "输出一个示例dsn",
		Long:  `输出一个示例dsn`,
		Run: func(cmd *cobra.Command, args []string) {
			fmt.Println(getExampleDsn())
		},
	}
}

func getExampleDsn() string {
	return "root:xxxxx@tcp(127.0.0.1:3306)/xxx?charset=utf8mb4&parseTime=True"
}
