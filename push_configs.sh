# 0. set hostname like http://www.rackspace.com/knowledge_center/article/centos-hostname-change
# 1. ssh-keygen -t rsa (enter, enter ...)
# 2. ssh-copy-id ${user}@${ip}
# 3. ./<script_name> ip user1 user2
ip=$1
shift
for user in "$@"; do
	scp -r ~/.configs ${user}@${ip}:~
	scp -r ~/.vim ${user}@${ip}:~
	ssh ${user}@${ip} 'sh ~/.configs/install.sh'
done
