@echo off

if not "%~1" == "" (goto :%1 2>nul)
goto :default

:test
mkdir test
xcopy /y git_create.py test
goto:eof

:clean
rmdir /s /q test
rmdir /s /q build
rmdir /s /q dist
rmdir /s /q git_create.egg-info
goto:eof

:install
pip install -r requirements.txt
goto:eof

:setup
python setup.py sdist
python setup.py bdist_wheel
goto:eof

:upload
twine upload dist/*
goto:eof

:default
echo USAGE: build.bat (rule)
echo Build Script rules:
echo test - Create test directory.
echo clean - Clean extra directories generated.
echo install - Install dependencies.
echo setup - Setup source distribution and wheel.
echo upload - Upload source distribution and wheel to PyPi.