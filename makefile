# build everything
all: test deployment

# run the Python test suite
test:

# clean the build directory
clean:
	rm -rf build/ dist/ .eggs/ *.egg-info/ || true
	find . -name "*.pyc" -delete
	find . -name "__pycache__" -delete

# build the deployment package
deployment: clean
	python3 setup.py sdist bdist_wheel

ship-dev: test deployment
	python3 -m twine upload --repository-url https://test.pypi.org/legacy/ dist/*

# ship the deployment package to PyPi
ship: test deployment
	python3 -m twine upload --repository-url https://upload.pypi.org/legacy/ dist/*