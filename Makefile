.PHONY: lint test dist upload

all: lint test

lint:
	pylint3 suffix_tree

test:
	nosetests --with-doctest -v

dist: test
	python3 setup.py sdist bdist_wheel

upload: dist
	twine upload dist/*

install: uninstall clean dist
	sudo pip3 install --upgrade dist/*.whl

uninstall:
	sudo pip3 uninstall suffix-tree

clean:
	-rm -rf dist build *.egg-info
	-rm *~ .*~ pylintgraph.dot
	-find . -name __pycache__ -type d -exec rm -r "{}" \;
