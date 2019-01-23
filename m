From: christian at brauner.io (Christian Brauner)
Date: Wed, 23 Jan 2019 11:54:58 +0100
Subject: [PATCH v3] selftests: add binderfs selftests
In-Reply-To: <20190117114854.15132-1-christian@brauner.io>
References: <20190117114854.15132-1-christian@brauner.io>
Message-ID: <20190123105457.k7oobylgq6rwka55@brauner.io>

On Thu, Jan 17, 2019 at 12:48:54PM +0100, Christian Brauner wrote:
> This adds the promised selftest for binderfs. It will verify the following
> things:
> - binderfs mounting works
> - binder device allocation works
> - performing a binder ioctl() request through a binderfs device works
> - binder device removal works
> - binder-control removal fails
> - binderfs unmounting works
> 
> The tests are performed both privileged and unprivileged. The latter
> verifies that binderfs behaves correctly in user namespaces.
> 
> Cc: Todd Kjos <tkjos at google.com>
> Signed-off-by: Christian Brauner <christian.brauner at ubuntu.com>

Hey Shuah,

If you're ok with the patch in its current form, can you please make
sure that this still lands in 5.0? If at all possible I'd like to have
all ducks in a row and release binderfs with selftests and everything.
:)

Thanks!
Christian

> ---
> /* Changelog */
> v3:
> - s/printf/ksft_print_msg/g
> - do not report misleading errno on short write
> 
> v2:
> - make failure to create /dev/binderfs directory fatal in all circumstances
> - make tests run in user namespace to test whether binderfs can be mounted
>   in user namespaces and so that unprivileged users can run the tests
> - use ksft_exit_skip()
> 
> v1:
> - check for ENODEV on mount failure to detect whether binderfs is
>   available
>   If it is not, skip the test and exit with success.
> ---
>  tools/testing/selftests/Makefile              |   1 +
>  .../selftests/filesystems/binderfs/.gitignore |   1 +
>  .../selftests/filesystems/binderfs/Makefile   |   6 +
>  .../filesystems/binderfs/binderfs_test.c      | 275 ++++++++++++++++++
>  .../selftests/filesystems/binderfs/config     |   3 +
>  5 files changed, 286 insertions(+)
>  create mode 100644 tools/testing/selftests/filesystems/binderfs/.gitignore
>  create mode 100644 tools/testing/selftests/filesystems/binderfs/Makefile
>  create mode 100644 tools/testing/selftests/filesystems/binderfs/binderfs_test.c
>  create mode 100644 tools/testing/selftests/filesystems/binderfs/config
> 
> diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
> index 1a2bd15c5b6e..400ee81a3043 100644
> --- a/tools/testing/selftests/Makefile
> +++ b/tools/testing/selftests/Makefile
> @@ -10,6 +10,7 @@ TARGETS += drivers/dma-buf
>  TARGETS += efivarfs
>  TARGETS += exec
>  TARGETS += filesystems
> +TARGETS += filesystems/binderfs
>  TARGETS += firmware
>  TARGETS += ftrace
>  TARGETS += futex
> diff --git a/tools/testing/selftests/filesystems/binderfs/.gitignore b/tools/testing/selftests/filesystems/binderfs/.gitignore
> new file mode 100644
> index 000000000000..8a5d9bf63dd4
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/binderfs/.gitignore
> @@ -0,0 +1 @@
> +binderfs_test
> diff --git a/tools/testing/selftests/filesystems/binderfs/Makefile b/tools/testing/selftests/filesystems/binderfs/Makefile
> new file mode 100644
> index 000000000000..58cb659b56b4
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/binderfs/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +CFLAGS += -I../../../../../usr/include/
> +TEST_GEN_PROGS := binderfs_test
> +
> +include ../../lib.mk
> diff --git a/tools/testing/selftests/filesystems/binderfs/binderfs_test.c b/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
> new file mode 100644
> index 000000000000..8c2ed962e1c7
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
> @@ -0,0 +1,275 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#define _GNU_SOURCE
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <sched.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/ioctl.h>
> +#include <sys/mount.h>
> +#include <sys/stat.h>
> +#include <sys/types.h>
> +#include <unistd.h>
> +#include <linux/android/binder.h>
> +#include <linux/android/binderfs.h>
> +#include "../../kselftest.h"
> +
> +static ssize_t write_nointr(int fd, const void *buf, size_t count)
> +{
> +	ssize_t ret;
> +again:
> +	ret = write(fd, buf, count);
> +	if (ret < 0 && errno == EINTR)
> +		goto again;
> +
> +	return ret;
> +}
> +
> +static void write_to_file(const char *filename, const void *buf, size_t count,
> +			  int allowed_errno)
> +{
> +	int fd, saved_errno;
> +	ssize_t ret;
> +
> +	fd = open(filename, O_WRONLY | O_CLOEXEC);
> +	if (fd < 0)
> +		ksft_exit_fail_msg("%s - Failed to open file %s\n",
> +				   strerror(errno), filename);
> +
> +	ret = write_nointr(fd, buf, count);
> +	if (ret < 0) {
> +		if (allowed_errno && (errno == allowed_errno)) {
> +			close(fd);
> +			return;
> +		}
> +
> +		goto on_error;
> +	}
> +
> +	if ((size_t)ret != count)
> +		goto on_error;
> +
> +	close(fd);
> +	return;
> +
> +on_error:
> +	saved_errno = errno;
> +	close(fd);
> +	errno = saved_errno;
> +
> +	if (ret < 0)
> +		ksft_exit_fail_msg("%s - Failed to write to file %s\n",
> +				   strerror(errno), filename);
> +
> +	ksft_exit_fail_msg("Failed to write to file %s\n", filename);
> +}
> +
> +static void change_to_userns(void)
> +{
> +	int ret;
> +	uid_t uid;
> +	gid_t gid;
> +	/* {g,u}id_map files only allow a max of 4096 bytes written to them */
> +	char idmap[4096];
> +
> +	uid = getuid();
> +	gid = getgid();
> +
> +	ret = unshare(CLONE_NEWUSER);
> +	if (ret < 0)
> +		ksft_exit_fail_msg("%s - Failed to unshare user namespace\n",
> +				   strerror(errno));
> +
> +	write_to_file("/proc/self/setgroups", "deny", strlen("deny"), ENOENT);
> +
> +	ret = snprintf(idmap, sizeof(idmap), "0 %d 1", uid);
> +	if (ret < 0 || (size_t)ret >= sizeof(idmap))
> +		ksft_exit_fail_msg("%s - Failed to prepare uid mapping\n",
> +				   strerror(errno));
> +
> +	write_to_file("/proc/self/uid_map", idmap, strlen(idmap), 0);
> +
> +	ret = snprintf(idmap, sizeof(idmap), "0 %d 1", gid);
> +	if (ret < 0 || (size_t)ret >= sizeof(idmap))
> +		ksft_exit_fail_msg("%s - Failed to prepare uid mapping\n",
> +				   strerror(errno));
> +
> +	write_to_file("/proc/self/gid_map", idmap, strlen(idmap), 0);
> +
> +	ret = setgid(0);
> +	if (ret)
> +		ksft_exit_fail_msg("%s - Failed to setgid(0)\n",
> +				   strerror(errno));
> +
> +	ret = setuid(0);
> +	if (ret)
> +		ksft_exit_fail_msg("%s - Failed to setgid(0)\n",
> +				   strerror(errno));
> +}
> +
> +static void change_to_mountns(void)
> +{
> +	int ret;
> +
> +	ret = unshare(CLONE_NEWNS);
> +	if (ret < 0)
> +		ksft_exit_fail_msg("%s - Failed to unshare mount namespace\n",
> +				   strerror(errno));
> +
> +	ret = mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, 0);
> +	if (ret < 0)
> +		ksft_exit_fail_msg("%s - Failed to mount / as private\n",
> +				   strerror(errno));
> +}
> +
> +static void rmdir_protect_errno(const char *dir)
> +{
> +	int saved_errno = errno;
> +	(void)rmdir(dir);
> +	errno = saved_errno;
> +}
> +
> +static void __do_binderfs_test(void)
> +{
> +	int fd, ret, saved_errno;
> +	size_t len;
> +	ssize_t wret;
> +	bool keep = false;
> +	struct binderfs_device device = { 0 };
> +	struct binder_version version = { 0 };
> +
> +	change_to_mountns();
> +
> +	ret = mkdir("/dev/binderfs", 0755);
> +	if (ret < 0) {
> +		if (errno != EEXIST)
> +			ksft_exit_fail_msg(
> +				"%s - Failed to create binderfs mountpoint\n",
> +				strerror(errno));
> +
> +		keep = true;
> +	}
> +
> +	ret = mount(NULL, "/dev/binderfs", "binder", 0, 0);
> +	if (ret < 0) {
> +		if (errno != ENODEV)
> +			ksft_exit_fail_msg("%s - Failed to mount binderfs\n",
> +					   strerror(errno));
> +
> +		keep ? : rmdir_protect_errno("/dev/binderfs");
> +		ksft_exit_skip(
> +			"The Android binderfs filesystem is not available\n");
> +	}
> +
> +	/* binderfs mount test passed */
> +	ksft_inc_pass_cnt();
> +
> +	memcpy(device.name, "my-binder", strlen("my-binder"));
> +
> +	fd = open("/dev/binderfs/binder-control", O_RDONLY | O_CLOEXEC);
> +	if (fd < 0)
> +		ksft_exit_fail_msg(
> +			"%s - Failed to open binder-control device\n",
> +			strerror(errno));
> +
> +	ret = ioctl(fd, BINDER_CTL_ADD, &device);
> +	saved_errno = errno;
> +	close(fd);
> +	errno = saved_errno;
> +	if (ret < 0) {
> +		keep ? : rmdir_protect_errno("/dev/binderfs");
> +		ksft_exit_fail_msg(
> +			"%s - Failed to allocate new binder device\n",
> +			strerror(errno));
> +	}
> +
> +	ksft_print_msg(
> +		"Allocated new binder device with major %d, minor %d, and name %s\n",
> +		device.major, device.minor, device.name);
> +
> +	/* binder device allocation test passed */
> +	ksft_inc_pass_cnt();
> +
> +	fd = open("/dev/binderfs/my-binder", O_CLOEXEC | O_RDONLY);
> +	if (fd < 0) {
> +		keep ? : rmdir_protect_errno("/dev/binderfs");
> +		ksft_exit_fail_msg("%s - Failed to open my-binder device\n",
> +				   strerror(errno));
> +	}
> +
> +	ret = ioctl(fd, BINDER_VERSION, &version);
> +	saved_errno = errno;
> +	close(fd);
> +	errno = saved_errno;
> +	if (ret < 0) {
> +		keep ? : rmdir_protect_errno("/dev/binderfs");
> +		ksft_exit_fail_msg(
> +			"%s - Failed to open perform BINDER_VERSION request\n",
> +			strerror(errno));
> +	}
> +
> +	ksft_print_msg("Detected binder version: %d\n",
> +		       version.protocol_version);
> +
> +	/* binder transaction with binderfs binder device passed */
> +	ksft_inc_pass_cnt();
> +
> +	ret = unlink("/dev/binderfs/my-binder");
> +	if (ret < 0) {
> +		keep ? : rmdir_protect_errno("/dev/binderfs");
> +		ksft_exit_fail_msg("%s - Failed to delete binder device\n",
> +				   strerror(errno));
> +	}
> +
> +	/* binder device removal passed */
> +	ksft_inc_pass_cnt();
> +
> +	ret = unlink("/dev/binderfs/binder-control");
> +	if (!ret) {
> +		keep ? : rmdir_protect_errno("/dev/binderfs");
> +		ksft_exit_fail_msg("Managed to delete binder-control device\n");
> +	} else if (errno != EPERM) {
> +		keep ? : rmdir_protect_errno("/dev/binderfs");
> +		ksft_exit_fail_msg(
> +			"%s - Failed to delete binder-control device but exited with unexpected error code\n",
> +			strerror(errno));
> +	}
> +
> +	/* binder-control device removal failed as expected */
> +	ksft_inc_xfail_cnt();
> +
> +on_error:
> +	ret = umount2("/dev/binderfs", MNT_DETACH);
> +	keep ?: rmdir_protect_errno("/dev/binderfs");
> +	if (ret < 0)
> +		ksft_exit_fail_msg("%s - Failed to unmount binderfs\n",
> +				   strerror(errno));
> +
> +	/* binderfs unmount test passed */
> +	ksft_inc_pass_cnt();
> +}
> +
> +static void binderfs_test_privileged()
> +{
> +	if (geteuid() != 0)
> +		ksft_print_msg(
> +			"Tests are not run as root. Skipping privileged tests\n");
> +	else
> +		__do_binderfs_test();
> +}
> +
> +static void binderfs_test_unprivileged()
> +{
> +	change_to_userns();
> +	__do_binderfs_test();
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +	binderfs_test_privileged();
> +	binderfs_test_unprivileged();
> +	ksft_exit_pass();
> +}
> diff --git a/tools/testing/selftests/filesystems/binderfs/config b/tools/testing/selftests/filesystems/binderfs/config
> new file mode 100644
> index 000000000000..02dd6cc9cf99
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/binderfs/config
> @@ -0,0 +1,3 @@
> +CONFIG_ANDROID=y
> +CONFIG_ANDROID_BINDERFS=y
> +CONFIG_ANDROID_BINDER_IPC=y
> -- 
> 2.19.1
> 
