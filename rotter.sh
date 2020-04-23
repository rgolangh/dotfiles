function rotter() {
	curl -s https://rotter.net/rss/rotternews.xml \
	 | xmllint --xpath "(//item/title)" - \
	 | sed  -E 's/<\/?title>/ ~~~  /g' -
#	 | fribidi --width 150
}
