FILE=Gemfile.lock
if [ -f "$FILE" ]; then
    rm $FILE
fi
docker run --rm -v "$PWD:/srv/jekyll/" -p "8080:8080" \
    -it amirpourmand/al-folio bundle install && bundler \
    exec jekyll serve --future --watch --port=8080 --host=0.0.0.0
