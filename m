Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FCA34EF04;
	Fri,  4 Sep 2026 08:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788509604; cv=none; b=Mc4OfRTlIb6dv+KEUmMjIkcyVtZbcHQ3R27f9pML9Pd0odn08zFYTmCeIelArp9NNQgtFzoSEvZ7adPEWMuKktQj2DtgWJjt/mr9z24JjKIQ0d22+4mSJ3mHxzB5fSJgznBLZM9AzP+8IdRcvxlDpZr9cvdrs53es74gwGh4Cn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788509604; c=relaxed/simple;
	bh=uAio+xzvVw6PGlFC0ttYRMxmSQH1h5tMvrB2COjN2NU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gGhKd5bK0deLD71ONXMjRKk2TkZ691f89FdvsItO0mBN0QODmpGG31D/n2+2R7LOaB8YXAvXXG2Y6akeCMWZvRSpuZK4h09c1jc8fpzqeSksdbuR3f98+mAqIq2lkkr9luWFFErCYVGX+WG/ZGzkptEO8W/2VDW0L/4RvcPvwYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UT/datXU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UT/datXU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944B21F00A3D;
	Fri,  4 Sep 2026 08:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788509597;
	bh=nUaZxjyDcYYSc/qqE/LnTlzY1Gd8czx0w9CMu4/XM+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UT/datXUTnicILsrAq/2W0yG3v2Vnev9Q+gA+bLYPKPupZakTRN5GJ2oCe/bbVUhF
	 k0kNrm0UkyBlrNgmP/TgglG6e2nApqe+VhRBwk1Dt+94yxcRIoT9/PS72FIoDrAEbW
	 HG5e8zcKzuiRFMk9YUsPi3vRGubAP3xv+CRxIxPK27XyPQ2cdjAtrXZblR5fTniioN
	 XHruEhXGCw5flMPSTZkv1ZhzYbeVgTQUmNtu5tFF+XB4IhmgEdeDZSGD3EsFv06g9f
	 nLlLx0cnkwDwg5/dkBYkX0h8jlmw6S1g3Iw0Dk4NLtU4fM0MplIVpfYFCjk7l1+G7a
	 vS7RcDygNNeww==
Date: Fri, 4 Sep 2026 10:13:11 +0200
From: Christian Brauner <brauner@kernel.org>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tejun Heo <tj@kernel.org>, Christian Brauner <christian@brauner.io>, 
	Meta kernel team <kernel-team@meta.com>, linux-kselftest@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests: cover kernfs dentry revalidation
Message-ID: <20260904-kandidat-bergbahn-ersonnen-3a6dd1f1cf0e@brauner>
References: <20260902014050.499002-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260902014050.499002-1-shakeel.butt@linux.dev>

On Tue, Sep 01, 2026 at 06:40:50PM -0700, Shakeel Butt wrote:
> kernfs_test only checked two xattr calls. It did not touch the part of
> kernfs that userspace hits most: the dentry cache.
> 
> The kernel adds and removes kernfs nodes on its own, with no VFS call
> behind it, and removal cannot always unhash the dentries that are
> already cached. So ->d_revalidate() is what keeps the cache honest,
> let's add tests for it.
> 
> Add tests that make the kernel change kernfs directly, instead of going
> through create and unlink:
> 
>  - writing cgroup.subtree_control makes the kernel add and remove files
>    in every child cgroup. That checks two things: a cached negative
>    dentry is dropped once the file appears, and a cached positive one
>    is dropped once the file goes away.
>  - renaming a network interface renames the sysfs node under a dentry
>    that is already cached.
>  - sysfs mounted in a new network namespace must list that namespace's
>    interfaces and not the parent's, which covers the KERNFS_NS tagging
>    code.
>  - many lookups running against concurrent mkdir and rmdir. A lookup
>    may only succeed or fail with an errno that means "it is gone".
>  - open across removal, readdir returning each entry once, and a
>    telldir()/seekdir() round trip, which uses the name hash cookie in
>    kernfs_dir_pos().
> 
> Test the other direction too: walking dentries that are already cached
> must not drop them. That is not just a slowdown. d_invalidate() calls
> detach_mounts(), so a dentry dropped by mistake also unmounts whatever
> is mounted under that directory.
> 
> Both filesystems are needed. cgroup2 has no ->rename and is not
> namespace tagged. sysfs cannot be mounted with a set of children we
> control. The config fragment stops a kernel built with kselftest-merge
> from passing while it runs almost nothing.
> 
> To confirm the tests really catch a broken backstop, kernfs_dir_changed()
> was stubbed to return false. 8 of the 11 tests then failed.
> 
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> ---

I have to say I would appreciate trimmed-down commit messages with less
relative clauses. This reads very LLMy still. Especially for tests my
appetite for wading through multiple paragraphs of info is very low.
Same goes for the very wordy changelog below...

> v2:
>  - netns fixture: rmdir() the mkdtemp() directory when the sysfs mount
>    fails.  The harness does not run TEARDOWN after a SETUP skip, so this
>    leaked one directory into /tmp per test.
>  - Drop the { cpu, cpu.stat } controller row.  cpu.stat lives in
>    cgroup_base_files[] and is added to every cgroup on the default
>    hierarchy regardless of the controller, so selecting that row would
>    have broken both dentry tests on a kernel built with MEMCG=n
>    CGROUP_PIDS=n CGROUP_SCHED=y.  Every file the cpu controller does own
>    is behind a Kconfig symbol, so there is no reliable replacement.
>  - Check in SETUP that the probe file is absent before any test enables
>    the controller, so a row naming a file the controller does not own
>    skips with a diagnostic rather than failing.
>  - ns_tag_isolates_class_net: stop requiring that a fresh netns holds
>    only "lo".  Fallback tunnel devices (tunl0, gre0, ...) are created in
>    every namespace unless net.core.fb_tunnels_only_for_init_net is set.
>    Check that sysfs shows exactly this namespace's set instead, via
>    if_nametoindex().
>  - open_after_rmdir_fails: make the read-after-removal check
>    unconditional.  It accepted a successful read, so a kernel returning
>    stale content would have passed.
>  - config: add CONFIG_NAMESPACES=y.  NET_NS sits inside "if NAMESPACES"
>    and NAMESPACES defaults to n under EXPERT, so olddefconfig would drop
>    NET_NS and every test would skip.  Drop CONFIG_MEMCG=y; SETUP takes
>    the first available controller, so CONFIG_CGROUP_PIDS alone is enough.
>  - Tidy the comments; drop some stray internal issue numbering.
> 
>  MAINTAINERS                                   |   1 +
>  tools/testing/selftests/filesystems/config    |   7 +
>  .../selftests/filesystems/kernfs_test.c       | 695 +++++++++++++++++-
>  3 files changed, 702 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/filesystems/config
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 549df316f487..605fd2d47788 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14392,6 +14392,7 @@ S:	Supported
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
>  F:	fs/kernfs/
>  F:	include/linux/kernfs.h
> +F:	tools/testing/selftests/filesystems/kernfs_test.c
>  
>  KEXEC
>  M:	Andrew Morton <akpm@linux-foundation.org>
> diff --git a/tools/testing/selftests/filesystems/config b/tools/testing/selftests/filesystems/config
> new file mode 100644
> index 000000000000..7231710d5ce7
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/config
> @@ -0,0 +1,7 @@
> +CONFIG_CGROUPS=y
> +CONFIG_CGROUP_PIDS=y
> +CONFIG_NAMESPACES=y
> +CONFIG_NET=y
> +CONFIG_NET_NS=y
> +CONFIG_INET=y
> +CONFIG_SYSFS=y
> diff --git a/tools/testing/selftests/filesystems/kernfs_test.c b/tools/testing/selftests/filesystems/kernfs_test.c
> index 84c2b910a60d..2178428b9665 100644
> --- a/tools/testing/selftests/filesystems/kernfs_test.c
> +++ b/tools/testing/selftests/filesystems/kernfs_test.c
> @@ -2,8 +2,20 @@
>  #define _GNU_SOURCE
>  #define __SANE_USERSPACE_TYPES__
>  
> +#include <dirent.h>
> +#include <errno.h>
>  #include <fcntl.h>
> +#include <limits.h>
> +#include <net/if.h>
> +#include <sched.h>
>  #include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <time.h>
> +#include <unistd.h>
> +#include <sys/ioctl.h>
> +#include <sys/mount.h>
> +#include <sys/socket.h>
>  #include <sys/stat.h>
>  #include <sys/xattr.h>
>  
> @@ -34,5 +46,686 @@ TEST(kernfs_getxattr)
>  	EXPECT_EQ(close(fd), 0);
>  }
>  
> -TEST_HARNESS_MAIN
> +/*
> + * Exercise the kernfs dentry cache: lookup, revalidation of positive and
> + * negative dentries, readdir and namespace tagging.
> + *
> + * These drive kernfs from kernel context rather than VFS create/unlink,
> + * which is what ->d_revalidate() exists for: writing cgroup.subtree_control
> + * adds and removes files in every child cgroup with no VFS operation
> + * touching those names.
> + */
> +
> +#define CG_SCRATCH	"kernfs_selftest"
> +#define TEST_IFNAME	"kfstest0"
> +
> +/*
> + * Controllers that add a file to each child cgroup when enabled.  The probe
> + * file must be owned by the controller: cgroup_base_files[] entries such as
> + * cpu.stat exist in every cgroup regardless, and every file the cpu
> + * controller does own is behind a Kconfig symbol, so cpu is not usable here.
> + */
> +static const struct {
> +	const char *name;
> +	const char *probe_file;
> +} controllers[] = {
> +	{ "memory",	"memory.current" },
> +	{ "pids",	"pids.current" },
> +};
> +
> +static int find_cgroup2_root(char *buf, size_t len)
> +{
> +	char line[PATH_MAX * 2];
> +	FILE *f;
> +	int ret = -1;
> +
> +	f = fopen("/proc/self/mounts", "re");
> +	if (!f)
> +		return -1;
> +
> +	while (fgets(line, sizeof(line), f)) {
> +		char mnt[PATH_MAX], type[64];
> +
> +		/* Octal escaping can expand a path fourfold; bound both %s. */
> +		if (sscanf(line, "%*s %4095s %63s", mnt, type) != 2)
> +			continue;
> +		if (strcmp(type, "cgroup2"))
> +			continue;
> +		if (strlen(mnt) >= len)
> +			break;
> +		strcpy(buf, mnt);
> +		ret = 0;
> +		break;
> +	}
> +
> +	fclose(f);
> +	return ret;
> +}
> +
> +static int write_file(const char *path, const char *val)
> +{
> +	ssize_t len = strlen(val);
> +	int fd, ret;
> +
> +	fd = open(path, O_WRONLY | O_CLOEXEC);
> +	if (fd < 0)
> +		return -1;
> +	ret = write(fd, val, len) == len ? 0 : -1;
> +	close(fd);
> +	return ret;
> +}
> +
> +static bool file_has_word(const char *path, const char *word)
> +{
> +	char buf[4096], *tok, *save;
> +	bool found = false;
> +	ssize_t n;
> +	int fd;
> +
> +	fd = open(path, O_RDONLY | O_CLOEXEC);
> +	if (fd < 0)
> +		return false;
> +	n = read(fd, buf, sizeof(buf) - 1);
> +	close(fd);
> +	if (n < 0)
> +		return false;
> +	buf[n] = '\0';
> +
> +	for (tok = strtok_r(buf, "\n ", &save); tok;
> +	     tok = strtok_r(NULL, "\n ", &save)) {
> +		if (!strcmp(tok, word)) {
> +			found = true;
> +			break;
> +		}
> +	}
> +	return found;
> +}
> +
> +static bool path_is_mounted(const char *path)
> +{
> +	char line[PATH_MAX * 2];
> +	bool found = false;
> +	FILE *f;
> +
> +	f = fopen("/proc/self/mounts", "re");
> +	if (!f)
> +		return false;
> +	while (fgets(line, sizeof(line), f)) {
> +		char mnt[PATH_MAX];
> +
> +		if (sscanf(line, "%*s %4095s", mnt) != 1)
> +			continue;
> +		if (!strcmp(mnt, path)) {
> +			found = true;
> +			break;
> +		}
> +	}
> +	fclose(f);
> +	return found;
> +}
> +
> +/* Shared by the stress tests below. */
> +static bool stress_deadline(const struct timespec *end)
> +{
> +	struct timespec now;
> +
> +	clock_gettime(CLOCK_MONOTONIC, &now);
> +	return now.tv_sec > end->tv_sec ||
> +	       (now.tv_sec == end->tv_sec && now.tv_nsec >= end->tv_nsec);
> +}
> +
> +FIXTURE(kernfs_cgroup)
> +{
> +	char scratch[PATH_MAX];		/* <cg2>/kernfs_selftest.<pid> */
> +	char child[PATH_MAX];		/* <scratch>/child */
> +	char probe[PATH_MAX];		/* child's controller file */
> +	char scratch_sc[PATH_MAX];	/* scratch's cgroup.subtree_control */
> +	char root_sc[PATH_MAX];		/* root's cgroup.subtree_control */
> +	char enable[32];		/* "+<controller>" */
> +	char disable[32];		/* "-<controller>" */
> +	char mnt[PATH_MAX];		/* our own mount, if we made one */
> +	bool mounted;
> +	bool enabled_at_root;
> +};
> +
> +/* A cgroup stays busy briefly after its last task exits. */
> +static void rmdir_retry(const char *path)
> +{
> +	int i;
> +
> +	for (i = 0; i < 500; i++) {
> +		if (!rmdir(path) || errno != EBUSY)
> +			return;
> +		usleep(10000);
> +	}
> +}
> +
> +/*
> + * Undo whatever SETUP managed to do.  The harness skips TEARDOWN after a
> + * failed or skipped SETUP, so SETUP must call this before returning early.
> + */
> +static void kernfs_cgroup_undo(FIXTURE_DATA(kernfs_cgroup) *self)
> +{
> +	rmdir_retry(self->child);
> +	rmdir(self->scratch);
> +	if (self->enabled_at_root)
> +		write_file(self->root_sc, self->disable);
> +	if (self->mounted) {
> +		umount2(self->mnt, MNT_DETACH);
> +		rmdir(self->mnt);
> +	}
> +	self->enabled_at_root = false;
> +	self->mounted = false;
> +}
> +
> +FIXTURE_SETUP(kernfs_cgroup)
> +{
> +	char root[PATH_MAX], ctl[PATH_MAX];
> +	const char *probe_file = NULL;
> +	size_t i;
> +
> +	if (geteuid())
> +		SKIP(return, "test needs to run as root");
> +
> +	/*
> +	 * A private mount namespace stops our mounts leaking, but does not
> +	 * isolate the cgroup hierarchy: cgroup2 has one default hierarchy
> +	 * however many times it is mounted.  The scratch cgroups live in the
> +	 * host's and must be removed, not discarded with the namespace.
> +	 */
> +	if (unshare(CLONE_NEWNS))
> +		SKIP(return, "unshare(CLONE_NEWNS): %s", strerror(errno));
> +	if (mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, NULL))
> +		SKIP(return, "make / private: %s", strerror(errno));
> +
> +	/* Use an existing cgroup2 mount if there is one, else make our own. */
> +	if (find_cgroup2_root(root, sizeof(root))) {
> +		strcpy(self->mnt, "/tmp/kernfs_selftest_cg2.XXXXXX");
> +		if (!mkdtemp(self->mnt))
> +			SKIP(return, "mkdtemp: %s", strerror(errno));
> +		if (mount("none", self->mnt, "cgroup2", 0, NULL)) {
> +			rmdir(self->mnt);
> +			SKIP(return, "mount cgroup2: %s", strerror(errno));
> +		}
> +		self->mounted = true;
> +		strcpy(root, self->mnt);
> +	}
> +
> +	snprintf(self->root_sc, sizeof(self->root_sc),
> +		 "%s/cgroup.subtree_control", root);
> +	snprintf(ctl, sizeof(ctl), "%s/cgroup.controllers", root);
> +
> +	/* Named after our pid so we cannot collide with anything else. */
> +	snprintf(self->scratch, sizeof(self->scratch), "%s/%s.%d", root,
> +		 CG_SCRATCH, getpid());
> +	snprintf(self->child, sizeof(self->child), "%s/child", self->scratch);
> +	snprintf(self->scratch_sc, sizeof(self->scratch_sc),
> +		 "%s/cgroup.subtree_control", self->scratch);
> +
> +	for (i = 0; i < ARRAY_SIZE(controllers); i++) {
> +		if (!file_has_word(ctl, controllers[i].name))
> +			continue;
> +		snprintf(self->enable, sizeof(self->enable), "+%s",
> +			 controllers[i].name);
> +		snprintf(self->disable, sizeof(self->disable), "-%s",
> +			 controllers[i].name);
> +		probe_file = controllers[i].probe_file;
> +
> +		/*
> +		 * A controller must be in the root's subtree_control before
> +		 * it appears in our scratch cgroup.  Note if we enabled it,
> +		 * so it can be put back.
> +		 */
> +		self->enabled_at_root = !file_has_word(self->root_sc,
> +						       controllers[i].name);
> +		if (self->enabled_at_root &&
> +		    write_file(self->root_sc, self->enable)) {
> +			self->enabled_at_root = false;
> +			probe_file = NULL;
> +			continue;
> +		}
> +		break;
> +	}
> +	if (!probe_file) {
> +		kernfs_cgroup_undo(self);
> +		SKIP(return, "no usable cgroup2 controller");
> +	}
> +
> +	snprintf(self->probe, sizeof(self->probe), "%s/%s", self->child,
> +		 probe_file);
> +
> +	/*
> +	 * Only an unusable environment may skip.  A scratch cgroup named
> +	 * after our own pid should always be creatable, so failing to make
> +	 * one is a result -- skipping would let a broken kernel look green.
> +	 */
> +	if (mkdir(self->scratch, 0755)) {
> +		int err = errno;
> +
> +		kernfs_cgroup_undo(self);
> +		if (err == EROFS || err == EACCES || err == EPERM)
> +			SKIP(return, "mkdir %s: %s", self->scratch,
> +			     strerror(err));
> +		ASSERT_EQ(err, 0) TH_LOG("mkdir %s: %s", self->scratch,
> +					 strerror(err));
> +	}
> +	if (mkdir(self->child, 0755)) {
> +		int err = errno;
> +
> +		kernfs_cgroup_undo(self);
> +		ASSERT_EQ(err, 0) TH_LOG("mkdir %s: %s", self->child,
> +					 strerror(err));
> +	}
> +
> +	/*
> +	 * The tests below need the probe file to appear and disappear with
> +	 * the controller, so it must be absent now, before anything enables
> +	 * it in the scratch cgroup.  Skip rather than fail: a probe file that
> +	 * is already there means the table names one the controller does not
> +	 * own, not that the kernel is broken.
> +	 */
> +	if (!access(self->probe, F_OK)) {
> +		kernfs_cgroup_undo(self);
> +		SKIP(return, "%s is not owned by the %s controller",
> +		     probe_file, self->enable + 1);
> +	}
> +}
> +
> +FIXTURE_TEARDOWN(kernfs_cgroup)
> +{
> +	write_file(self->scratch_sc, self->disable);
> +	kernfs_cgroup_undo(self);
> +}
> +
> +/*
> + * Walking already-cached dentries must not invalidate them.  Spurious
> + * invalidation is not merely slow: d_invalidate() calls detach_mounts(), so
> + * an unrelated lookup would silently tear down any mount below.
> + */
> +TEST_F(kernfs_cgroup, path_walk_does_not_invalidate)
> +{
> +	char src[] = "/tmp/kernfs_selftest_bind.XXXXXX";
> +	char sub[PATH_MAX], probe[PATH_MAX];
> +	int i;
> +
> +	snprintf(sub, sizeof(sub), "%s/sub", self->child);
> +	ASSERT_EQ(mkdir(sub, 0755), 0);
> +
> +	if (!mkdtemp(src)) {
> +		rmdir(sub);
> +		SKIP(return, "mkdtemp: %s", strerror(errno));
> +	}
> +	if (mount(src, sub, NULL, MS_BIND, NULL)) {
> +		int err = errno;
> +
> +		rmdir(sub);
> +		rmdir(src);
> +		SKIP(return, "bind mount onto a cgroup dir: %s", strerror(err));
> +	}
> +	ASSERT_TRUE(path_is_mounted(sub));
> +
> +	/* Walk a sibling path through the same directory, repeatedly. */
> +	snprintf(probe, sizeof(probe), "%s/cgroup.procs", self->child);
> +	for (i = 0; i < 8; i++) {
> +		int fd = open(probe, O_RDONLY | O_CLOEXEC);
> +
> +		if (fd >= 0)
> +			close(fd);
> +	}
> +
> +	EXPECT_TRUE(path_is_mounted(sub));
> +
> +	umount2(sub, MNT_DETACH);
> +	rmdir(sub);
> +	rmdir(src);
> +}
> +
> +/*
> + * A cached negative dentry must be invalidated when the kernel creates the
> + * name behind the dcache's back.  That is what kernfs_dir_changed() and
> + * kernfs_elem_dir::rev are for.
> + */
> +TEST_F(kernfs_cgroup, negative_dentry_invalidated_by_kernel_create)
> +{
> +	struct stat st;
> +
> +	/* Caches a negative dentry for the probe file. */
> +	ASSERT_EQ(stat(self->probe, &st), -1);
> +	ASSERT_EQ(errno, ENOENT);
> +
> +	/* The kernel now creates it, with no VFS operation on that name. */
> +	ASSERT_EQ(write_file(self->scratch_sc, self->enable), 0);
> +
> +	EXPECT_EQ(stat(self->probe, &st), 0);
> +}
> +
> +/* The mirror image: a cached positive dentry must go when the node does. */
> +TEST_F(kernfs_cgroup, positive_dentry_invalidated_by_kernel_remove)
> +{
> +	struct stat st;
> +
> +	ASSERT_EQ(write_file(self->scratch_sc, self->enable), 0);
> +	/* Caches a positive dentry. */
> +	ASSERT_EQ(stat(self->probe, &st), 0);
>  
> +	ASSERT_EQ(write_file(self->scratch_sc, self->disable), 0);
> +
> +	ASSERT_EQ(stat(self->probe, &st), -1);
> +	EXPECT_EQ(errno, ENOENT);
> +}
> +
> +/* Opening a removed node fails; it never returns stale content. */
> +TEST_F(kernfs_cgroup, open_after_rmdir_fails)
> +{
> +	char path[PATH_MAX];
> +	char buf[64];
> +	int fd;
> +
> +	snprintf(path, sizeof(path), "%s/cgroup.procs", self->child);
> +
> +	fd = open(path, O_RDONLY | O_CLOEXEC);
> +	ASSERT_GE(fd, 0);
> +
> +	ASSERT_EQ(rmdir(self->child), 0);
> +
> +	/* Lookup by path must fail. */
> +	EXPECT_EQ(open(path, O_RDONLY | O_CLOEXEC), -1);
> +	EXPECT_EQ(errno, ENOENT);
> +
> +	/*
> +	 * An fd held across removal must fail rather than return stale
> +	 * content.  rmdir() deactivates the node before it returns, so
> +	 * kernfs_seq_start() fails to get an active reference.
> +	 */
> +	EXPECT_LT(read(fd, buf, sizeof(buf)), 0);
> +	EXPECT_EQ(errno, ENODEV);
> +	EXPECT_EQ(close(fd), 0);
> +
> +	ASSERT_EQ(mkdir(self->child, 0755), 0);
> +}
> +
> +/* readdir returns every entry exactly once. */
> +TEST_F(kernfs_cgroup, readdir_no_duplicates)
> +{
> +	char names[512][NAME_MAX + 1];
> +	struct dirent *de;
> +	int n = 0, i, j;
> +	DIR *d;
> +
> +	ASSERT_EQ(write_file(self->scratch_sc, self->enable), 0);
> +
> +	d = opendir(self->child);
> +	ASSERT_NE(d, NULL);
> +	while ((de = readdir(d))) {
> +		if (!strcmp(de->d_name, ".") || !strcmp(de->d_name, ".."))
> +			continue;
> +		ASSERT_LT(n, (int)ARRAY_SIZE(names));
> +		strncpy(names[n], de->d_name, NAME_MAX);
> +		names[n][NAME_MAX] = '\0';
> +		n++;
> +	}
> +	closedir(d);
> +
> +	ASSERT_GT(n, 0);
> +	for (i = 0; i < n; i++)
> +		for (j = i + 1; j < n; j++)
> +			EXPECT_STRNE(names[i], names[j]);
> +}
> +
> +/*
> + * A telldir() cookie must resolve back to the same entry after seekdir().
> + * kernfs encodes the cookie as the node's name hash, so this covers
> + * kernfs_dir_pos() as well as plain iteration.
> + */
> +TEST_F(kernfs_cgroup, readdir_seekdir_roundtrip)
> +{
> +	char names[512][NAME_MAX + 1];
> +	struct dirent *de;
> +	long pos[512];
> +	int n = 0, i;
> +	DIR *d;
> +
> +	ASSERT_EQ(write_file(self->scratch_sc, self->enable), 0);
> +
> +	d = opendir(self->child);
> +	ASSERT_NE(d, NULL);
> +
> +	/* Record the cookie *before* reading each entry, with its name. */
> +	while (1) {
> +		long here = telldir(d);
> +
> +		de = readdir(d);
> +		if (!de)
> +			break;
> +		if (!strcmp(de->d_name, ".") || !strcmp(de->d_name, ".."))
> +			continue;
> +		ASSERT_LT(n, (int)ARRAY_SIZE(pos));
> +		pos[n] = here;
> +		strncpy(names[n], de->d_name, NAME_MAX);
> +		names[n][NAME_MAX] = '\0';
> +		n++;
> +	}
> +	ASSERT_GT(n, 0);
> +
> +	/* Seeking back to a cookie must land on the entry it was taken at. */
> +	for (i = 0; i < n; i++) {
> +		seekdir(d, pos[i]);
> +		de = readdir(d);
> +		ASSERT_NE(de, NULL);
> +		EXPECT_STREQ(de->d_name, names[i]);
> +	}
> +
> +	closedir(d);
> +}
> +
> +#define STRESS_SECS	2
> +#define STRESS_DIRS	4
> +#define STRESS_READERS	4
> +
> +/*
> + * Hammer lookup against creation and removal.  Revalidation holds no lock
> + * against the writers, so what makes it safe is that every answer it can
> + * give is one the caller already handles: a reader must only ever see
> + * success or an errno meaning "it went away", never garbage or a hang.
> + */
> +TEST_F(kernfs_cgroup, lookup_vs_create_remove_stress)
> +{
> +	pid_t pids[STRESS_DIRS + STRESS_READERS];
> +	struct timespec end;
> +	int i, status, n = 0;
> +
> +	clock_gettime(CLOCK_MONOTONIC, &end);
> +	end.tv_sec += STRESS_SECS;
> +
> +	for (i = 0; i < STRESS_DIRS; i++) {
> +		pid_t pid = fork();
> +
> +		ASSERT_GE(pid, 0);
> +		if (pid == 0) {
> +			char dir[PATH_MAX];
> +
> +			snprintf(dir, sizeof(dir), "%s/s%d", self->scratch, i);
> +			while (!stress_deadline(&end)) {
> +				if (mkdir(dir, 0755) && errno != EEXIST)
> +					_exit(10);
> +				if (rmdir(dir) && errno != ENOENT &&
> +				    errno != EBUSY)
> +					_exit(11);
> +			}
> +			_exit(0);
> +		}
> +		pids[n++] = pid;
> +	}
> +
> +	for (i = 0; i < STRESS_READERS; i++) {
> +		pid_t pid = fork();
> +
> +		ASSERT_GE(pid, 0);
> +		if (pid == 0) {
> +			/* Start each reader on a different directory. */
> +			unsigned int seq = i;
> +
> +			while (!stress_deadline(&end)) {
> +				int which = seq++ % STRESS_DIRS;
> +				char path[PATH_MAX];
> +				struct stat st;
> +				int fd;
> +
> +				snprintf(path, sizeof(path),
> +					 "%s/s%d/cgroup.procs",
> +					 self->scratch, which);
> +
> +				if (stat(path, &st) && errno != ENOENT &&
> +				    errno != ENODEV)
> +					_exit(20);
> +
> +				fd = open(path, O_RDONLY | O_CLOEXEC);
> +				if (fd < 0) {
> +					if (errno != ENOENT && errno != ENODEV)
> +						_exit(21);
> +				} else {
> +					close(fd);
> +				}
> +
> +				if (access(path, F_OK) && errno != ENOENT &&
> +				    errno != ENODEV)
> +					_exit(22);
> +			}
> +			_exit(0);
> +		}
> +		pids[n++] = pid;
> +	}
> +
> +	for (i = 0; i < n; i++) {
> +		ASSERT_EQ(waitpid(pids[i], &status, 0), pids[i]);
> +		ASSERT_TRUE(WIFEXITED(status));
> +		EXPECT_EQ(WEXITSTATUS(status), 0);
> +	}
> +
> +	for (i = 0; i < STRESS_DIRS; i++) {
> +		char dir[PATH_MAX];
> +
> +		snprintf(dir, sizeof(dir), "%s/s%d", self->scratch, i);
> +		rmdir_retry(dir);
> +	}
> +}
> +
> +/*
> + * sysfs is namespace tagged (KERNFS_NS) and supports rename; cgroup2 does
> + * neither.  Run in a private netns with its own sysfs so the host is
> + * untouched.
> + */
> +FIXTURE(kernfs_netns)
> +{
> +	char mnt[PATH_MAX];
> +	char net[PATH_MAX];
> +	bool mounted;
> +};
> +
> +FIXTURE_SETUP(kernfs_netns)
> +{
> +	if (geteuid())
> +		SKIP(return, "test needs to run as root");
> +
> +	if (unshare(CLONE_NEWNS | CLONE_NEWNET))
> +		SKIP(return, "unshare(CLONE_NEWNS|CLONE_NEWNET): %s",
> +		     strerror(errno));
> +
> +	/* Don't let our sysfs mount escape into the parent namespace. */
> +	ASSERT_EQ(mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, NULL), 0);
> +
> +	strcpy(self->mnt, "/tmp/kernfs_selftest_sysfs.XXXXXX");
> +	ASSERT_NE(mkdtemp(self->mnt), NULL);
> +
> +	if (mount("none", self->mnt, "sysfs", 0, NULL)) {
> +		rmdir(self->mnt);
> +		SKIP(return, "mount sysfs: %s", strerror(errno));
> +	}
> +	self->mounted = true;
> +
> +	snprintf(self->net, sizeof(self->net), "%s/class/net", self->mnt);
> +}
> +
> +FIXTURE_TEARDOWN(kernfs_netns)
> +{
> +	if (self->mounted)
> +		umount2(self->mnt, MNT_DETACH);
> +	rmdir(self->mnt);
> +}
> +
> +/*
> + * sysfs must show this network namespace's interfaces, not the parent's.
> + *
> + * Do not assume a fresh netns contains only "lo": fallback tunnel devices
> + * (tunl0, sit0, gre0, ...) are created in every namespace unless
> + * net.core.fb_tunnels_only_for_init_net is set, so which names appear
> + * depends on the modules the host has.  Check the set instead --
> + * if_nametoindex() resolves in the current netns, so every name sysfs shows
> + * must resolve there, and the counts must agree.
> + */
> +TEST_F(kernfs_netns, ns_tag_isolates_class_net)
> +{
> +	struct if_nameindex *idx, *i;
> +	bool found_lo = false;
> +	int n = 0, want = 0;
> +	struct dirent *de;
> +	DIR *d;
> +
> +	d = opendir(self->net);
> +	ASSERT_NE(d, NULL);
> +	while ((de = readdir(d))) {
> +		if (!strcmp(de->d_name, ".") || !strcmp(de->d_name, ".."))
> +			continue;
> +		EXPECT_NE(if_nametoindex(de->d_name), 0u)
> +			TH_LOG("%s is not in this netns", de->d_name);
> +		if (!strcmp(de->d_name, "lo"))
> +			found_lo = true;
> +		n++;
> +	}
> +	closedir(d);
> +
> +	idx = if_nameindex();
> +	ASSERT_NE(idx, NULL);
> +	for (i = idx; i->if_index; i++)
> +		want++;
> +	if_freenameindex(idx);
> +
> +	EXPECT_TRUE(found_lo);
> +	EXPECT_EQ(n, want);
> +}
> +
> +/*
> + * After a rename the old name must stop resolving and the new one must
> + * start, even though both dentries are already cached.
> + */
> +TEST_F(kernfs_netns, rename_is_revalidated)
> +{
> +	char old_path[PATH_MAX], new_path[PATH_MAX];
> +	struct ifreq ifr = {};
> +	struct stat st;
> +	int sk;
> +
> +	snprintf(old_path, sizeof(old_path), "%s/lo", self->net);
> +	snprintf(new_path, sizeof(new_path), "%s/%s", self->net, TEST_IFNAME);
> +
> +	/* Warm both dentries: one positive, one negative. */
> +	ASSERT_EQ(stat(old_path, &st), 0);
> +	ASSERT_EQ(stat(new_path, &st), -1);
> +	ASSERT_EQ(errno, ENOENT);
> +
> +	sk = socket(AF_INET, SOCK_DGRAM | SOCK_CLOEXEC, 0);
> +	ASSERT_GE(sk, 0);
> +	strcpy(ifr.ifr_name, "lo");
> +	strcpy(ifr.ifr_newname, TEST_IFNAME);
> +	if (ioctl(sk, SIOCSIFNAME, &ifr)) {
> +		close(sk);
> +		SKIP(return, "SIOCSIFNAME: %s", strerror(errno));
> +	}
> +	close(sk);
> +
> +	EXPECT_EQ(stat(old_path, &st), -1);
> +	EXPECT_EQ(errno, ENOENT);
> +	EXPECT_EQ(stat(new_path, &st), 0);
> +}
> +
> +TEST_HARNESS_MAIN
> -- 
> 2.53.0-Meta
> 

-- 
