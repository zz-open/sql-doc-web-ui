package start

import (
	"fmt"
	"github.com/zzopen/mysqldoc/src/internal/server"
	"log"
	"os"

	"github.com/gookit/color"
	"github.com/spf13/cobra"
	"github.com/spf13/viper"

	"github.com/zzopen/mysqldoc/src/common/utils"
	"github.com/zzopen/mysqldoc/src/internal/config"
)

var (
	Cmd                    *cobra.Command
	cfgFile                string
	port                   string
	autoOpenDefaultBrowser bool
	createSqlFile          bool
	mysqlHost              string
	mysqlPort              string
	mysqlUsername          string
	mysqlPassword          string
	mysqlDbName            string
	onlyStartApiServer     bool
)

const _UI = `
███╗   ███╗██╗   ██╗███████╗ ██████╗ ██╗     ██████╗  ██████╗  ██████╗
████╗ ████║╚██╗ ██╔╝██╔════╝██╔═══██╗██║     ██╔══██╗██╔═══██╗██╔════╝
██╔████╔██║ ╚████╔╝ ███████╗██║   ██║██║     ██║  ██║██║   ██║██║     
██║╚██╔╝██║  ╚██╔╝  ╚════██║██║▄▄ ██║██║     ██║  ██║██║   ██║██║     
██║ ╚═╝ ██║   ██║   ███████║╚██████╔╝███████╗██████╔╝╚██████╔╝╚██████╗
╚═╝     ╚═╝   ╚═╝   ╚══════╝ ╚══▀▀═╝ ╚══════╝╚═════╝  ╚═════╝  ╚═════╝
`

func init() {
	Cmd = &cobra.Command{
		Use:   "start",
		Short: "启动服务",
		Long:  `启动服务`,
		Run: func(cmd *cobra.Command, args []string) {
			fmt.Println(color.Cyan.Sprintf(_UI))
			initConfig()
			server.StartServer(config.Sc)
		},
	}

	Cmd.Flags().StringVarP(&cfgFile, "file", "f", "", fmt.Sprintf("服务配置文件(default \"./%s.%s\")", config.DefaultSeverConfFileName, config.DefaultServerConfFileExt))
	Cmd.Flags().StringVar(&port, "port", config.DefaultPort, "服务端口")
	Cmd.Flags().BoolVar(&autoOpenDefaultBrowser, "autoOpenDefaultBrowser", config.DefaultAutoOpenDefaultBrowser, "自动打开浏览器")
	Cmd.Flags().BoolVar(&createSqlFile, "createSqlFile", config.DefaultCreateSqlFile, "创建sql文件")
	Cmd.Flags().StringVar(&mysqlHost, "mysqlHost", config.DefaultMysqlHost, "数据库ip")
	Cmd.Flags().StringVar(&mysqlPort, "mysqlPort", config.DefaultMysqlPort, "数据库端口")
	Cmd.Flags().StringVar(&mysqlUsername, "username", config.DefaultMysqlUsername, "数据库账号")
	Cmd.Flags().StringVar(&mysqlPassword, "password", config.DefaultMysqlPassword, "数据库密码")
	Cmd.Flags().StringVar(&mysqlDbName, "dbname", config.DefaultMysqlDbName, "数据库名称")
	Cmd.Flags().BoolVar(&onlyStartApiServer, "onlyStartApiServer", false, "只启动api server(仅限于debug使用)")
	_ = Cmd.Flags().MarkHidden("onlyStartApiServer")

	// 绑定viper
	_ = viper.BindPFlag("Port", Cmd.Flags().Lookup("port"))
	_ = viper.BindPFlag("AutoOpenDefaultBrowser", Cmd.Flags().Lookup("autoOpenDefaultBrowser"))
	_ = viper.BindPFlag("OnlyStartApiServer", Cmd.Flags().Lookup("onlyStartApiServer"))
	_ = viper.BindPFlag("CreateSqlFile", Cmd.Flags().Lookup("createSqlFile"))
	_ = viper.BindPFlag("Mysql.Host", Cmd.Flags().Lookup("mysqlHost"))
	_ = viper.BindPFlag("Mysql.Port", Cmd.Flags().Lookup("mysqlPort"))
	_ = viper.BindPFlag("Mysql.Username", Cmd.Flags().Lookup("username"))
	_ = viper.BindPFlag("Mysql.Password", Cmd.Flags().Lookup("password"))
	_ = viper.BindPFlag("Mysql.DbName", Cmd.Flags().Lookup("dbname"))
}

func initConfig() {
	var requireReadFile bool
	if cfgFile == "" {
		log.Println("没传 配置文件参数")
		filePath := fmt.Sprintf("%s/%s.%s", utils.GetPwdPath(), config.DefaultSeverConfFileName, config.DefaultServerConfFileExt)
		_, err := os.Stat(filePath)
		if err == nil {
			log.Println("根目录配置文件存在")
			// 文件存在
			viper.AddConfigPath(".")
			viper.SetConfigName(config.DefaultSeverConfFileName)
			viper.SetConfigType(config.DefaultServerConfFileExt)
			requireReadFile = true
		} else {
			log.Println("根目录配置文件不存在")
		}

	} else {
		log.Println("传了 配置文件参数")
		requireReadFile = true
		viper.SetConfigFile(cfgFile)
	}

	if requireReadFile {
		if err := viper.ReadInConfig(); err != nil {
			log.Println("不能读取配置文件:", err)
			os.Exit(1)
		}
	}

	err := viper.Unmarshal(&config.Sc)
	if err != nil {
		log.Fatalf("unable to decode into config.SC, %v", err)
	}
}
