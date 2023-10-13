package cmd

import (
	_ "embed"
	"github.com/spf13/cobra"
	"log"
)

var (
	ACmd     *cobra.Command
	cfgFile4 string
	cfgFile5 string
)

func init() {
	ACmd = &cobra.Command{
		Use:   "aaa",
		Short: "",
		Long:  ``,
		Run: func(cmd *cobra.Command, args []string) {
			log.Println("aaa:", cmd.Use)
			log.Println("aaa:", args)
			log.Println("aaa cfgFile:", cfgFile4)
			log.Println("aaa cfgFile1:", cfgFile5)
			log.Println("root cfgFile1:", cfgFile1)
		},
	}

	//ACmd.PersistentFlags().StringVarP(&cfgFile4, "file1", "f", "111", "服务配置文件1")
	//ACmd.Flags().StringVarP(&cfgFile5, "file2", "c", "222", "服务配置文件2")
}
