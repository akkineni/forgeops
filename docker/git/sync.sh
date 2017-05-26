#!/usr/bin/env sh
# Sync git configuration upstream


# Top level directory where git projects will be cloned to.
GIT_ROOT=${GIT_ROOT:=/git}

GIT_BRANCH=${GIT_BRANCH:-master}5

# For testing - just echo commands.
#git="echo git"

git="git"

export GIT_SSH_COMMAND="ssh -q -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i /etc/git-secret/ssh"

# IDM may be coming up, and we might not be ready
# Move idm to init container...
sleep 30

# We don't know the name of the git repo that was cloned, but there should only be a single config directory under the GIT_ROOT.
cd ${GIT_ROOT}/*

pwd

$git branch autosave
$git branch
$git checkout autosave

while true 
do
    sleep 30
    t=`date`
    $git add .
    $git commit -a -m "autosave at $t"
    # We use -f to force the upstream push. Revisit this.
    $git push --set-upstream origin autosave -f
done