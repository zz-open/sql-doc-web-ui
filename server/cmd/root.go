package cmd

import (
	_ "embed"
	"fmt"
	"log"
	"os"
	"runtime"

	"github.com/spf13/cobra"
	"github.com/spf13/viper"

	configCmd "github.com/zz-open/sql-doc-web-ui/server/cmd/config"
	"github.com/zz-open/sql-doc-web-ui/server/cmd/start"
	"github.com/zz-open/sql-doc-web-ui/server/internal/config"
	"github.com/zz-open/sql-doc-web-ui/server/internal/version"
)

var (
	Cmd *cobra.Command
)

func init() {
	cobra.OnInitialize(initConfig)
	Cmd = &cobra.Command{
		Use:   config.ProjectName,
		Short: "网页版sql doc",
		Long:  `网页版sql doc`,
		Run: func(cmd *cobra.Command, args []string) {
		},
	}

	// 禁用自动补全子命令
	Cmd.CompletionOptions.DisableDefaultCmd = true
	Cmd.Version = fmt.Sprintf("%s %s/%s", version.BuildVersion, runtime.GOOS, runtime.GOARCH)
	Cmd.AddCommand(start.Cmd, configCmd.Cmd)
}

func initConfig() {
	err := viper.Unmarshal(&config.C)
	if err != nil {
		log.Fatalf("unable to decode into config.C, %v", err)
	}
}

func Execute() {
	if err := Cmd.Execute(); err != nil {
		log.Println(err)
		os.Exit(1)
	}
}
