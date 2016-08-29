#!/bin/bash
#
# This assumes git is already installed.
# It configures some git options.

#TODO: add ability to configure name and email from command line
username="Joel Carlson"
useremail="JoelsonCarl@gmail.com"

git config --global user.email "${useremail}"
git config --global user.name "${username}"
git config --global core.editor vim
git config --global push.default simple
git config --global gpg.program gpg2

git_commit_template=~/.git_commit_msg.txt
{
	echo "subject: summary"
	echo
	echo "Description"
	echo
	echo "Signed-off-by: ${username} <${useremail}>"
} > "${git_commit_template}"
git config --global commit.template ~/.git_commit_msg.txt
