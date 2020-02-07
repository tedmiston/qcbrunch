# install jsonnet on play with docker
git clone https://github.com/google/jsonnet.git
cd jsonnet/
make
mv jsonnet jsonnetfmt /usr/local/bin/
cd ..
rm -fr jsonnet

# verify
jsonnet --version
jsonnetfmt --version

# write jsonnet script
touch place.jsonnet

# run jsonnet script
jsonnet place.jsonnet
