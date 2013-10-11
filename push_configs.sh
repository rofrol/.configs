# 0. set hostname like http://www.rackspace.com/knowledge_center/article/centos-hostname-change
# 1. ssh-keygen -t rsa (enter, enter ...)
# 2. ssh-copy-id ${user}@${ip}
# 3. ./<script_name> ip user1 user2
# http://serverfault.com/questions/12102/how-to-perform-a-secure-rsync-between-servers-across-an-unsecured-network
# http://stackoverflow.com/questions/15687755/how-to-use-rsync-to-copy-only-specific-subdirectories-same-names-in-several-dir
ip=$1
shift
for user in "$@"; do
	# scp was wrongly copying contents of directory instead whole dir
	# http://unix.stackexchange.com/a/42691/37431
	# I think rsync's filter rules can't match the toplevel directory, so it's always synchronized.
	# A workaround is to synchronize all the files inside this directory instead of the directory itself.
	# Add .[!.]* after * if you have dot files in the topmost directory,
	# and ..?* if you have file names beginning with two dots.
	rsync -azv --include-from 'include.txt' --exclude '*' ~/.[!.]* ${user}@${ip}:
done
