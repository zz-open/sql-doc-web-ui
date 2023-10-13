package config

const ProjectName = "mysqldoc"

const DefaultSeverConfFileName = ProjectName
const DefaultServerConfFileExt = "yaml"

const EnvDev = "dev"
const EnvProd = "prod"

const LogModeFile = "file"
const LogModeConsole = "console"

const LogLevelDebug = "debug"  // -1
const LogLevelInfo = "info"    // 0
const LogLevelWarning = "warn" // 1
const LogLevelError = "error"  // 2

// 全局

const DefaultEnv = EnvProd

// Log

const DefaultLogFileName = ProjectName + ".log"
const DefaultLogPath = "./logs/"
const DefaultLogMode = LogModeFile
const DefaultLogLevel = LogLevelInfo

// Server

const DefaultHost = "0.0.0.0"
const DefaultPort = "7654"
const DefaultAutoOpenDefaultBrowser = true
const DefaultCreateSqlFile = true

// Mysql

const DefaultMysqlHost = "127.0.0.1"
const DefaultMysqlPort = "3306"
const DefaultMysqlUsername = "root"
const DefaultMysqlPassword = ""
const DefaultMysqlDbName = "test"
