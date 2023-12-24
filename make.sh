REPO=shok1122

PATH_DIR="$1"
COMMAND="$2"

list=(${PATH_DIR//\// })
img=${list[0]}
ver=${list[1]}

echo "image: $img"
echo "version: $ver"
echo "command: $COMMAND"

(
	cd $PATH_DIR

	if [ $COMMAND = "build" ]; then
		docker build -t ${REPO}/${img}:${ver} .
	fi

	if [ $COMMAND = "push" ]; then
		docker push ${REPO}/${img}:${ver}
	fi

	if [ $COMMAND = "run" ]; then
		docker run -it --rm --entrypoint bash ${REPO}/${img}:${ver}
	fi
)

