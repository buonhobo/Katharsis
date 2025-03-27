# mypy shouldn't be necessary, but I keep it in the dependencies because otherwise the flatpak build fails...
pip install kathara mypy
pip freeze > src/requirements.txt
# This flatpak pip generator is not the original one, I emptied the system_packages array to make it work.
python scripts/flatpak-pip-generator.py --runtime 'runtime/org.gnome.Sdk/x86_64/48' --output flatpak/pypi-dependencies -r src/requirements.txt --ignore-installed Pygments,six