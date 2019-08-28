local_UID=$(id -u $USER)
local_GID=$(id -g $USER)

sudo chown $(local_UID):$(local_GID) * -R
