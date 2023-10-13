package utils

import "regexp"

func StringRegexpReplace(str string, pattern string, replace string) string {
	re := regexp.MustCompile(pattern)
	return re.ReplaceAllString(str, replace)
}
