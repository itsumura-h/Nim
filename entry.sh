local_UID=$(id -u $USER)
local_GIU=$(id -g $USER)

sudo chown $(local_UID):$(local_GIU) * -R
