package init

import (
	"github.com/spf13/cobra"
)

var (
	Cmd *cobra.Command
)

func init() {
	Cmd = &cobra.Command{
		Use:   "init",
		Short: "创建一个yaml配置文件",
		Long:  `创建一个yaml配置文件`,
		Run: func(cmd *cobra.Command, args []string) {
			CreateYamlConfigFile()
		},
	}
}
