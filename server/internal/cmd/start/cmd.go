package start

import (
	"fmt"
	"log"

	"github.com/gookit/color"
	"github.com/spf13/cobra"
	"github.com/spf13/viper"

	"github.com/zz-open/sql-doc-web-ui/server/internal/config"
	"github.com/zz-open/sql-doc-web-ui/server/internal/server"
)

var (
	Cmd     *cobra.Command
	cfgFile string
)

const _UI = `
███████╗██████╗ ██╗    ██╗██╗   ██╗
██╔════╝██╔══██╗██║    ██║██║   ██║
███████╗██║  ██║██║ █╗ ██║██║   ██║
╚════██║██║  ██║██║███╗██║██║   ██║
███████║██████╔╝╚███╔███╔╝╚██████╔╝
╚══════╝╚═════╝  ╚══╝╚══╝  ╚═════╝                          
`

func init() {
	Cmd = &cobra.Command{
		Use:   "start",
		Short: "启动服务",
		Long:  `启动服务`,
		Run: func(cmd *cobra.Command, args []string) {
			fmt.Println(color.Cyan.Sprintf(_UI))
			initConfig()
			server.StartServer(config.C)
		},
	}

	Cmd.Flags().StringVarP(&cfgFile, "file", "f", config.DefaultServerConfFile, "服务配置文件")
}

func initConfig() {
	if cfgFile == "" {
		log.Fatalf("请指定配置文件路径")
	}

	viper.SetConfigFile(cfgFile)

	if err := viper.ReadInConfig(); err != nil {
		log.Fatalf("不能读取配置文件: %v", err)
	}

	err := viper.Unmarshal(&config.C)
	if err != nil {
		log.Fatalf("unable to decode into config.SC, %v", err)
	}

	if config.C.Env == "" || config.C.Env != "dev" {
		config.C.Env = "prod"
	}
}
