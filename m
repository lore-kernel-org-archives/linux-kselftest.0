From: christian at brauner.io (Christian Brauner)
Date: Wed, 16 Jan 2019 23:49:38 +0100
Subject: [PATCH v1] selftests: add binderfs selftests
In-Reply-To: <20190116224050.GA21920@kroah.com>
References: <20190116222745.26217-1-christian@brauner.io>
 <20190116224050.GA21920@kroah.com>
Message-ID: <20190116224936.xixnlqvhawtnvlio@brauner.io>

On Wed, Jan 16, 2019 at 11:40:50PM +0100, Greg KH wrote:
> On Wed, Jan 16, 2019 at 11:27:45PM +0100, Christian Brauner wrote:
> > This adds the promised selftest for binderfs. It will verify the following
> > things:
> > - binderfs mounting works
> > - binder device allocation works
> > - performing a binder ioctl() request through a binderfs device works
> > - binder device removal works
> > - binder-control removal fails
> > - binderfs unmounting works
> > 
> > Cc: Todd Kjos <tkjos at google.com>
> > Signed-off-by: Christian Brauner <christian.brauner at ubuntu.com>
> > ---
> > /* Changelog */
> > 
> > v1:
> > - check for ENODEV on mount failure to detect whether binderfs is
> >   available
> >   If it is not, skip the test and exit with success.
> > ---
> >  tools/testing/selftests/Makefile              |   1 +
> >  .../selftests/filesystems/binderfs/.gitignore |   1 +
> >  .../selftests/filesystems/binderfs/Makefile   |   6 +
> >  .../filesystems/binderfs/binderfs_test.c      | 126 ++++++++++++++++++
> >  .../selftests/filesystems/binderfs/config     |   3 +
> >  5 files changed, 137 insertions(+)
> >  create mode 100644 tools/testing/selftests/filesystems/binderfs/.gitignore
> >  create mode 100644 tools/testing/selftests/filesystems/binderfs/Makefile
> >  create mode 100644 tools/testing/selftests/filesystems/binderfs/binderfs_test.c
> >  create mode 100644 tools/testing/selftests/filesystems/binderfs/config
> > 
> > diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
> > index 1a2bd15c5b6e..400ee81a3043 100644
> > --- a/tools/testing/selftests/Makefile
> > +++ b/tools/testing/selftests/Makefile
> > @@ -10,6 +10,7 @@ TARGETS += drivers/dma-buf
> >  TARGETS += efivarfs
> >  TARGETS += exec
> >  TARGETS += filesystems
> > +TARGETS += filesystems/binderfs
> >  TARGETS += firmware
> >  TARGETS += ftrace
> >  TARGETS += futex
> > diff --git a/tools/testing/selftests/filesystems/binderfs/.gitignore b/tools/testing/selftests/filesystems/binderfs/.gitignore
> > new file mode 100644
> > index 000000000000..8a5d9bf63dd4
> > --- /dev/null
> > +++ b/tools/testing/selftests/filesystems/binderfs/.gitignore
> > @@ -0,0 +1 @@
> > +binderfs_test
> > diff --git a/tools/testing/selftests/filesystems/binderfs/Makefile b/tools/testing/selftests/filesystems/binderfs/Makefile
> > new file mode 100644
> > index 000000000000..58cb659b56b4
> > --- /dev/null
> > +++ b/tools/testing/selftests/filesystems/binderfs/Makefile
> > @@ -0,0 +1,6 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +CFLAGS += -I../../../../../usr/include/
> > +TEST_GEN_PROGS := binderfs_test
> > +
> > +include ../../lib.mk
> > diff --git a/tools/testing/selftests/filesystems/binderfs/binderfs_test.c b/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
> > new file mode 100644
> > index 000000000000..34361efcb9c8
> > --- /dev/null
> > +++ b/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
> > @@ -0,0 +1,126 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +#define _GNU_SOURCE
> > +#include <errno.h>
> > +#include <fcntl.h>
> > +#include <sched.h>
> > +#include <stdio.h>
> > +#include <stdlib.h>
> > +#include <string.h>
> > +#include <sys/ioctl.h>
> > +#include <sys/mount.h>
> > +#include <sys/stat.h>
> > +#include <sys/types.h>
> > +#include <unistd.h>
> > +#include <linux/android/binder.h>
> > +#include <linux/android/binderfs.h>
> > +#include "../../kselftest.h"
> > +
> > +int main(int argc, char *argv[])
> > +{
> > +	int fd, ret, saved_errno;
> > +	size_t len;
> > +	struct binderfs_device device = { 0 };
> > +	struct binder_version version = { 0 };
> > +
> > +	ret = unshare(CLONE_NEWNS);
> > +	if (ret < 0)
> > +		ksft_exit_fail_msg("%s - Failed to unshare mount namespace\n",
> > +				   strerror(errno));
> > +
> > +	ret = mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, 0);
> > +	if (ret < 0)
> > +		ksft_exit_fail_msg("%s - Failed to mount / as private\n",
> > +				   strerror(errno));
> > +
> > +	ret = mkdir("/dev/binderfs", 0755);
> > +	if (ret < 0 && errno != EEXIST)
> > +		ksft_exit_fail_msg(
> > +			"%s - Failed to create binderfs mountpoint\n",
> > +			strerror(errno));
> > +
> > +	ret = mount(NULL, "/dev/binderfs", "binder", 0, 0);
> > +	if (ret < 0) {
> > +		if (errno != ENODEV)
> > +			ksft_exit_fail_msg("%s - Failed to mount binderfs\n",
> > +					   strerror(errno));
> > +
> > +		ksft_test_result_skip(
> > +			"The Android binderfs filesystem is not available\n");
> > +		ksft_exit_pass();
> 
> Do you have to clean up your new directory you created and the mount?
> Or does exiting the code here somehow undo the unshare/mount/mkdir steps
> above??
> 
> Same type of question for the failure paths of the mkdir and mount calls.

All mounts performed after a new mount namespace without propagation is
setup for a process will die when all references to the mount namespace
are dropped which in this case happens when the process dies.

> 
> > +	}
> > +
> > +	/* binderfs mount test passed */
> > +	ksft_inc_pass_cnt();
> > +
> > +	memcpy(device.name, "my-binder", strlen("my-binder"));
> > +
> > +	fd = open("/dev/binderfs/binder-control", O_RDONLY | O_CLOEXEC);
> > +	if (fd < 0)
> > +		ksft_exit_fail_msg(
> > +			"%s - Failed to open binder-control device\n",
> > +			strerror(errno));
> 
> No cleanup?  Same for other calls to ksft_exit_fail_msg() later in this
> file.

Same comment as above. :)

The thing we might want to cleanup is the mountpoint itself
"/dev/binderfs".

> 
> thanks,
> 
> greg "error handling is hard!" k-h

That's fair. With patches purely for testing I always have to force
myself to pay close attention because I implicitly and very much
**falsely** keep thinking that the test is less important than the
actual code. And I'm always a little ashamed of that. :)

Thanks!
Christian
