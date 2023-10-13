package cmd

import (
	"github.com/spf13/cobra"
	"log"
	"os"
)

var (
	Cmd      *cobra.Command
	cfgFile1 string
	cfgFile2 string
	Region   string
)

func init() {

	Cmd = &cobra.Command{
		Use:   "mysqldoc",
		Short: "mysqldoc web版查看数据库表结构",
		Long:  `web版查看数据库表结构`,
		Run: func(cmd *cobra.Command, args []string) {
			log.Println("cfgFile:", cfgFile1)
			log.Println("cfgFile1:", cfgFile2)
		},
	}

	cobra.OnInitialize(initConfig)
	Cmd.PersistentFlags().StringVarP(&cfgFile1, "file1", "f", "111", "服务配置文件1")
	Cmd.Flags().StringVarP(&cfgFile2, "file2", "c", "222", "服务配置文件2")
	Cmd.Flags().StringVarP(&Region, "region", "r", "", "AWS region (required)")
	_ = Cmd.MarkFlagRequired("region")
	Cmd.AddCommand(ACmd)
}

func Execute() {
	if err := Cmd.Execute(); err != nil {
		log.Println(err)
		os.Exit(1)
	}
}

func initConfig() {
	log.Println("----initConfig----")
}
