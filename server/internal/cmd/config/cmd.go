package init

import (
	"fmt"
	"log"

	"github.com/spf13/cobra"
	"gopkg.in/yaml.v3"

	"github.com/zz-open/sql-doc-web-ui/server/internal/config"
)

var (
	Cmd *cobra.Command
)

func init() {
	Cmd = &cobra.Command{
		Use:   "config",
		Short: "输出配置文件模板",
		Long:  `输出配置文件模板，可自定义修改`,
		Run: func(cmd *cobra.Command, args []string) {
			defaultConfig := config.Config{
				Host:            config.DefaultHost,
				Port:            config.DefaultPort,
				OpenBrowser:     config.DefaultOpenBrowser,
				GenerateSqlFile: config.DefaultGenerateSqlFile,
				Env:             config.DefaultEnv,
				Mysql: config.MysqlConfig{
					Host:         config.DefaultMysqlHost,
					Port:         config.DefaultMysqlPort,
					Username:     config.DefaultMysqlUsername,
					Password:     config.DefaultMysqlPassword,
					DatabaseName: config.DefaultMysqlDatabaseName,
				},
			}

			data, err := yaml.Marshal(&defaultConfig)
			if err != nil {
				log.Fatalf("error: %v", err)
			}

			fmt.Println(string(data))
		},
	}
}
