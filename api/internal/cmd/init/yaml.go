package init

import (
	"log"
	"os"

	"github.com/zzopen/mysqldoc/src/common/embed"
	"github.com/zzopen/mysqldoc/src/common/utils"
)

func CreateYamlConfigFile() {
	f, err := os.Create(utils.GetDefaultServerConfigFilePath())
	if err != nil {
		log.Fatalln(err)
	}

	defer f.Close()
	_, err = f.WriteString(embed.YamlConfigContent)
	if err != nil {
		log.Fatalln(err)
	}
}
