package logx

import (
	"fmt"
	"time"

	"github.com/zzopen/mysqldoc/src/internal/config"
	"go.uber.org/zap"
)

var Logger *zap.Logger

func NewLogger(c config.Config) *zap.Logger {
	logFile := fmt.Sprintf("%s%s-access.log%s", c.Log.Path, config.ProjectName, time.Now().Format(time.DateOnly))

	options := []Option{
		WithInfoLevel(),
		WithField("domain", fmt.Sprintf("%s[%s]", config.ProjectName, c.Env)),
	}

	if config.C.Log.Mode == config.LogModeFile {
		options = append(options, WithDisableConsole(), WithFileRotationP(logFile))
	} else if config.C.Log.Mode == config.LogModeConsole {
	}

	logger, _ := NewJSONLogger(options...)
	return logger
}

func InitLogger(c config.Config) {
	Logger = NewLogger(c)
}
