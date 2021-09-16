c+u		file tree
c+e		nav panel
c+s+e	outline panel
c -		preference panel
c+f
c+s+f files



# primeira vez no git
$ git config --global user.name "Your Name"
$ git config --global user.email your.email@example.com
$ git config --global push.default matching
$ git config --global alias.co checkout

git init
git add -A
git commit -m "Initialize repository"
git remote add origin git@bitbucket.org:tseiiti/rails-tutorial-hello_app.git
git push -u origin --all
git push

git status
git log
git status
git checkout -f
git checkout -b modify-README
git branch -d modify-README
git branch
git mv README.rdoc README.md
git checkout master
git merge modify-README



heroku version
heroku login
heroku keys:add
heroku create
git push heroku master
heroku rename rails-tutorial-hello
