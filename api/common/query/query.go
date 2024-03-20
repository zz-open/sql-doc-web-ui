package query

import (
	"github.com/jmoiron/sqlx"
	"github.com/zzopen/mysqldoc/src/common/logx"
)

func ScanMap(conn *sqlx.DB, str string) []map[string]string {
	if str == "" || conn == nil {
		return nil
	}

	rows, err := conn.Queryx(str)
	if err != nil {
		logx.Logger.Error(err.Error())
		return nil
	}

	defer rows.Close()

	var result []map[string]string

	for rows.Next() {
		rowMap := make(map[string]any)
		err := rows.MapScan(rowMap)
		if err != nil {
			continue
		}

		m := make(map[string]string)
		for k, v := range rowMap {
			if b, ok := v.([]uint8); ok {
				m[k] = string(b)
			}
		}

		result = append(result, m)
	}

	return result
}

func GetMysqlVersion(conn *sqlx.DB) string {
	versionSql := "SELECT VERSION()"
	queryMap := ScanMap(conn, versionSql)
	if queryMap == nil || len(queryMap) == 0 {
		return ""
	}

	res := queryMap[0]["VERSION()"]
	return res
}
