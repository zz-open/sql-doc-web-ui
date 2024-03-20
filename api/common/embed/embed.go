package embed

import _ "embed"

//go:embed config.yaml.tpl
var YamlConfigContent string
