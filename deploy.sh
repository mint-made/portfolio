#!/usr/bin/env sh

# abort on errors
set -e

# build
npm run build

# navigate into the build output directory
cd dist

# deploying to a custom domain
echo 'mint-made.com' >> CNAME

git init
git add -A
git commit -m 'deploy'

# deploying to https://<USERNAME>.github.io
git push -f https://github.com/mint-made/mint-made.github.io.git master

cd -

# Vue project deployment information can be found at: https://cli.vuejs.org/guide/deployment.html#github-pages
