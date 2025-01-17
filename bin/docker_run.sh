FILE=Gemfile.lock
if [ -f "$FILE" ]; then
    rm $FILE
fi
docker build -t "al-folio:latest" . 
docker run --rm -v "$PWD:/srv/jekyll/" -p "8080:8080" \
                    -it al-folio:latest bundler  \
                    exec jekyll serve --trace --future --watch --port=8080 --host=0.0.0.0 