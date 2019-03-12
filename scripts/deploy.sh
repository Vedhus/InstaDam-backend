rsync -e "ssh -o StrictHostKeyChecking=no" -r --delete-after --quiet $TRAVIS_BUILD_DIR $TRAVIS_SSH_USER@$TRAVIS_SSH_HOST:/tmp/$TRAVIS_BUILD_ID;
ssh -o StrictHostKeyChecking=no $TRAVIS_SSH_USER@$TRAVIS_SSH_HOST -t\
 "cd /tmp/${TRAVIS_BUILD_ID};\
sudo rm -rf ~/instadam;\
mkdir -p ~/instadam;\
sudo mv /tmp/${TRAVIS_BUILD_ID}/InstaDam-backend ~/instadam;\
cd ~/instadam/InstaDam-backend; kill -9 `pgrep wsgi`;\
source ~/.bashrc;\
echo "Test";\
/home/zonglin/.local/bin/uwsgi --chmod-socket=666 -s /home/zonglin/instadam_backend.sock --manage-script-name --mount /='wsgi:app'"
