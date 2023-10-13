package cmd

import (
	_ "embed"
	"fmt"
	"github.com/spf13/viper"
	"github.com/zzopen/mysqldoc/src/common/logx"
	"github.com/zzopen/mysqldoc/src/internal/cmd/example"

	"log"
	"os"
	"runtime"
	"text/template"

	"github.com/spf13/cobra"

	"github.com/zzopen/mysqldoc/src/common/utils"
	initCmd "github.com/zzopen/mysqldoc/src/internal/cmd/init"
	"github.com/zzopen/mysqldoc/src/internal/cmd/start"
	"github.com/zzopen/mysqldoc/src/internal/config"
	"github.com/zzopen/mysqldoc/src/internal/version"
)

var (
	//go:embed usage.tpl
	usageTpl string

	Cmd *cobra.Command

	env         string
	logFileName string
	logPath     string
	logLevel    string
	logMode     string
)

func init() {
	cobra.AddTemplateFuncs(template.FuncMap{
		"blue":    utils.Blue,
		"green":   utils.Green,
		"rpadx":   utils.Rpadx,
		"rainbow": utils.Rainbow,
	})

	cobra.OnInitialize(initConfig)
	Cmd = &cobra.Command{
		Use:   config.ProjectName,
		Short: "mysqldoc web版查看数据库表结构",
		Long:  `web版查看数据库表结构`,
		Run: func(cmd *cobra.Command, args []string) {
		},
	}

	// 禁用自动补全子命令
	Cmd.CompletionOptions.DisableDefaultCmd = true
	Cmd.PersistentFlags().StringVar(&env, "env", config.DefaultEnv, "环境")
	Cmd.PersistentFlags().StringVar(&logFileName, "logFileName", config.DefaultLogFileName, "日志文件名称")
	Cmd.PersistentFlags().StringVar(&logPath, "logPath", config.DefaultLogPath, "日志存放目录")
	Cmd.PersistentFlags().StringVar(&logLevel, "logLevel", config.DefaultLogLevel, "日志级别")
	Cmd.PersistentFlags().StringVar(&logMode, "logMode", config.DefaultLogMode, "日志输出模式")
	_ = Cmd.PersistentFlags().MarkHidden("env")
	_ = Cmd.PersistentFlags().MarkHidden("logFileName")
	_ = Cmd.PersistentFlags().MarkHidden("logPath")
	_ = Cmd.PersistentFlags().MarkHidden("logLevel")
	_ = Cmd.PersistentFlags().MarkHidden("logMode")

	// 绑定viper
	_ = viper.BindPFlag("Env", Cmd.PersistentFlags().Lookup("env"))
	_ = viper.BindPFlag("Log.FileName", Cmd.PersistentFlags().Lookup("logFileName"))
	_ = viper.BindPFlag("Log.Path", Cmd.PersistentFlags().Lookup("logPath"))
	_ = viper.BindPFlag("Log.Level", Cmd.PersistentFlags().Lookup("logLevel"))
	_ = viper.BindPFlag("Log.Mode", Cmd.PersistentFlags().Lookup("logMode"))

	Cmd.Version = fmt.Sprintf("%s %s/%s", version.BuildVersion, runtime.GOOS, runtime.GOARCH)
	Cmd.SetUsageTemplate(usageTpl)
	Cmd.AddCommand(start.Cmd, initCmd.Cmd, example.Cmd)
}

func initConfig() {
	err := viper.Unmarshal(&config.C)
	if err != nil {
		log.Fatalf("unable to decode into config.C, %v", err)
	}

	logx.InitLogger(config.C)
}

func Execute() {
	if err := Cmd.Execute(); err != nil {
		log.Println(err)
		os.Exit(1)
	}
}
