package types

type Reply struct {
	Code string `json:"code"`
	Msg  string `json:"msg"`
	Time string `json:"time"`
	Data any    `json:"data,omitempty"`
}

type TableListRequest struct {
	DbName string
}

type DbInfoRequest struct {
	DbName string
}
