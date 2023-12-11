page:
	rm -rf docs/*
	mkdir -p docs
	flutter build web -v
	cp -r -v build/web/* docs