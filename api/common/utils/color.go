package utils

import (
	"fmt"

	"github.com/gookit/color"
)

var colorRender = []func(v any) string{
	func(v any) string {
		return color.LightRed.Render(v)
	},
	func(v any) string {
		return color.LightGreen.Render(v)
	},
	func(v any) string {
		return color.LightYellow.Render(v)
	},
	func(v any) string {
		return color.LightBlue.Render(v)
	},
	func(v any) string {
		return color.LightMagenta.Render(v)
	},
	func(v any) string {
		return color.LightCyan.Render(v)
	},
}

func Blue(s string) string {
	return color.LightBlue.Render(s)
}

func Green(s string) string {
	return color.LightGreen.Render(s)
}

func Red(s string) string {
	return color.LightRed.Render(s)
}

func Rainbow(s string) string {
	s0 := s[0]
	return colorRender[int(s0)%(len(colorRender)-1)](s)
}

// rpadx adds padding to the right of a string.
func Rpadx(s string, padding int) string {
	template := fmt.Sprintf("%%-%ds", padding)
	return Rainbow(fmt.Sprintf(template, s))
}
