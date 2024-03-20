package example

import (
	"github.com/spf13/cobra"
	"github.com/zzopen/mysqldoc/src/internal/cmd/example/dsn"
)

var (
	Cmd *cobra.Command
)

func init() {
	Cmd = &cobra.Command{
		Use:   "example",
		Short: "示例工具，提供各种示例仅供参考",
		Long:  `示例工具，提供各种示例仅供参考`,
		Run: func(cmd *cobra.Command, args []string) {
		},
	}

	Cmd.AddCommand(dsn.Cmd)
}
