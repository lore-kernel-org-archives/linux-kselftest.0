Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3AE489FA3;
	Thu,  8 Oct 2026 10:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453933; cv=none; b=d8GBw1UW5U6WqBtewpciUTg8OdQaw+sGgMkGQaHZP3znB7QdWINC7wSlWmUmVM9aYmVnvYRWxzz5uo2UresncpB7SsvwvwU2m5E/1roX/jicJMH0n4fNBrEW8CoeI8SPwhnnNi/w/r/h2xY0zfQ0CxmNrmkLRfdjyAm2ZYIK3dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453933; c=relaxed/simple;
	bh=QrcvO3zUZcJdNbjVfVbLraX2IGF89zeMa2xtBzVMtkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Onwkco6Rp723m3ZlUNayQjr5O202lnAXn6bd/iNMgMAlr3Ma/1708PD7iS9FrxgdgIsrbBE3JybhqiIaYXKZjSp5QJ9nFOTPr0LHjxbRBoyqiW3W4ksX1IJGBDwU244POr43oAwalaBTNJ9TBbffOKmPyX/ls7Ghecovsm9uoGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2FF2C1F7A7;
	Thu,  8 Oct 2026 10:05:27 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 070421339F;
	Thu,  8 Oct 2026 10:05:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rngQNeZqx2ouKAAAD6G6ig
	(envelope-from <jack@suse.cz>); Thu, 08 Oct 2026 10:05:27 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 89E24A13FC; Thu, 08 Oct 2026 12:05:11 +0200 (CEST)
Date: Thu, 8 Oct 2026 12:05:11 +0200
From: Jan Kara <jack@suse.cz>
To: Sahaj Chaudhari <sahaj123.sc@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests/filesystems: test ext4 reserved GID block
 allocation
Message-ID: <q3lifzojfqigq7hcvdxg7fpr5z2aljfg6hh2qsrrnji5roze64@fe45bi4vprhc>
References: <20261008065651.3517824-1-sahaj123.sc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008065651.3517824-1-sahaj123.sc@gmail.com>
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Spamd-Result: default: False [0.00 / 50.00];
	TAGGED_RCPT(0.00)[]
X-Spam-Score: 0.00
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason

On Thu 08-10-26 12:26:51, Sahaj Chaudhari wrote:
> Verify that ext4 allows a process in the configured reserved GID to
> allocate reserved blocks after ordinary free space is exhausted.
> 
> Create a temporary ext4 image with distinct reserved UID and GID values,
> mount it in a private mount namespace, and fill ordinary free space as
> an unprivileged user. Then verify that a process with the reserved GID
> can allocate one more block. Register the test with the filesystem
> selftests and ignore its generated binary.
> 
> Skip when root privileges, required utilities, or private mount namespace
> support are unavailable.
> 
> Tested: fails with ENOSPC on 7.0.0-34-generic; passes on the fixed
> kernel in QEMU.
> 
> Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>

Instead of doing this in selftests can you please implement appropriate
test in fstests? That's a much more natural place for a test like this (and
also easier to write). Thanks! We keep in selftests only things that would
be difficult to test without directly calling internal kernel functions...

								Honza

> ---
>  .../testing/selftests/filesystems/.gitignore  |   1 +
>  tools/testing/selftests/filesystems/Makefile  |   3 +
>  .../selftests/filesystems/ext4_resgid.sh      |  43 ++++
>  .../selftests/filesystems/ext4_resgid_test.c  | 239 ++++++++++++++++++
>  4 files changed, 286 insertions(+)
>  create mode 100755 tools/testing/selftests/filesystems/ext4_resgid.sh
>  create mode 100644 tools/testing/selftests/filesystems/ext4_resgid_test.c
> 
> diff --git a/tools/testing/selftests/filesystems/.gitignore b/tools/testing/selftests/filesystems/.gitignore
> index 9eb185fb2f9d..c5807237efcb 100644
> --- a/tools/testing/selftests/filesystems/.gitignore
> +++ b/tools/testing/selftests/filesystems/.gitignore
> @@ -7,3 +7,4 @@ anon_inode_test
>  kernfs_test
>  idmapped_tmpfile
>  ustat_test
> +ext4_resgid_test
> diff --git a/tools/testing/selftests/filesystems/Makefile b/tools/testing/selftests/filesystems/Makefile
> index 03be337c1f35..a3590e0e5c07 100644
> --- a/tools/testing/selftests/filesystems/Makefile
> +++ b/tools/testing/selftests/filesystems/Makefile
> @@ -4,6 +4,9 @@ CFLAGS += $(KHDR_INCLUDES)
>  TEST_GEN_PROGS := devpts_pts file_stressor anon_inode_test kernfs_test fclog ustat_test
>  TEST_GEN_PROGS += idmapped_tmpfile
>  TEST_GEN_PROGS_EXTENDED := dnotify_test
> +TEST_GEN_PROGS_EXTENDED += ext4_resgid_test
> +TEST_PROGS += ext4_resgid.sh
> +TEST_INCLUDES := ../kselftest/ktap_helpers.sh
>  
>  include ../lib.mk
>  
> diff --git a/tools/testing/selftests/filesystems/ext4_resgid.sh b/tools/testing/selftests/filesystems/ext4_resgid.sh
> new file mode 100755
> index 000000000000..544bfd736d91
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/ext4_resgid.sh
> @@ -0,0 +1,43 @@
> +#!/bin/bash
> +# SPDX-License-Identifier: GPL-2.0
> +
> +set -e
> +
> +DIR="$(dirname "$(readlink -f "$0")")"
> +# shellcheck source=../kselftest/ktap_helpers.sh
> +source "${DIR}"/../kselftest/ktap_helpers.sh
> +
> +ksft_skip()
> +{
> +	ktap_skip_all "$1"
> +	exit "$KSFT_SKIP"
> +}
> +
> +[ "$(id -u)" -eq 0 ] || ksft_skip "must be run as root"
> +
> +for tool in mke2fs tune2fs losetup truncate; do
> +	command -v "$tool" >/dev/null 2>&1 ||
> +		ksft_skip "missing required command: $tool"
> +done
> +
> +tmpdir=$(mktemp -d)
> +loop_dev=
> +
> +cleanup()
> +{
> +	if [ -n "$loop_dev" ]; then
> +		losetup -d "$loop_dev"
> +	fi
> +	rm -rf "$tmpdir"
> +}
> +trap cleanup EXIT
> +
> +image="$tmpdir/ext4.img"
> +truncate -s 16M "$image"
> +mke2fs -q -F -t ext4 -b 4096 -N 1024 -m 10 -O ^has_journal "$image"
> +tune2fs -u 123 -g 456 "$image" >/dev/null
> +
> +loop_dev=$(losetup --find --show "$image") ||
> +	ksft_skip "could not allocate a loop device"
> +
> +./ext4_resgid_test "$loop_dev"
> diff --git a/tools/testing/selftests/filesystems/ext4_resgid_test.c b/tools/testing/selftests/filesystems/ext4_resgid_test.c
> new file mode 100644
> index 000000000000..9d40d04bdafc
> --- /dev/null
> +++ b/tools/testing/selftests/filesystems/ext4_resgid_test.c
> @@ -0,0 +1,239 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#define _GNU_SOURCE
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <grp.h>
> +#include <sched.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/mount.h>
> +#include <sys/stat.h>
> +#include <sys/types.h>
> +#include <sys/wait.h>
> +#include <unistd.h>
> +
> +#include "kselftest.h"
> +
> +#define TEST_UID 1000
> +#define FILL_GID 1001
> +#define RESGID 456
> +#define TEST_BLOCK_SIZE 4096
> +#define MAX_BLOCKS 32768
> +
> +struct worker_result {
> +	off_t offset;
> +	int error;
> +	int setup_error;
> +};
> +
> +static void worker(int fd, gid_t gid, bool fill, off_t offset, int pipefd)
> +{
> +	struct worker_result result = {
> +		.offset = offset,
> +	};
> +	int i;
> +
> +	if (setgroups(0, NULL) || setresgid(gid, gid, gid) ||
> +	    setresuid(TEST_UID, TEST_UID, TEST_UID)) {
> +		result.setup_error = errno;
> +		goto report;
> +	}
> +
> +	if (fill) {
> +		for (i = 0; i < MAX_BLOCKS; i++) {
> +			if (fallocate(fd, 0, result.offset, TEST_BLOCK_SIZE)) {
> +				result.error = errno;
> +				goto report;
> +			}
> +			result.offset += TEST_BLOCK_SIZE;
> +		}
> +		result.error = EFBIG;
> +	} else if (fallocate(fd, 0, result.offset, TEST_BLOCK_SIZE)) {
> +		result.error = errno;
> +	}
> +
> +report:
> +	if (write(pipefd, &result, sizeof(result)) != sizeof(result))
> +		_exit(1);
> +	_exit(0);
> +}
> +
> +static int run_worker(int fd, gid_t gid, bool fill, off_t offset,
> +		      struct worker_result *result)
> +{
> +	int pipefd[2], status;
> +	pid_t pid, waited;
> +	ssize_t n;
> +
> +	if (pipe(pipefd))
> +		return -errno;
> +	pid = fork();
> +	if (pid < 0) {
> +		int error = errno;
> +
> +		close(pipefd[0]);
> +		close(pipefd[1]);
> +		return -error;
> +	}
> +	if (!pid) {
> +		close(pipefd[0]);
> +		worker(fd, gid, fill, offset, pipefd[1]);
> +	}
> +
> +	close(pipefd[1]);
> +	do {
> +		n = read(pipefd[0], result, sizeof(*result));
> +	} while (n < 0 && errno == EINTR);
> +	close(pipefd[0]);
> +	do {
> +		waited = waitpid(pid, &status, 0);
> +	} while (waited < 0 && errno == EINTR);
> +	if (waited != pid)
> +		return -errno;
> +	if (n != sizeof(*result) || !WIFEXITED(status) ||
> +	    WEXITSTATUS(status))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	char mountpoint[] = "/tmp/ext4-resgid.XXXXXX";
> +	char filename[sizeof(mountpoint) + sizeof("/fill")];
> +	struct worker_result fill_result, group_result;
> +	bool mounted = false, skipped = false;
> +	int fd = -1, ret, failed = 0;
> +	char message[160] = "reserved GID can allocate reserved ext4 blocks";
> +
> +	ksft_print_header();
> +	ksft_set_plan(1);
> +
> +	if (geteuid()) {
> +		ksft_test_result_skip("must be run as root\n");
> +		ksft_finished();
> +	}
> +	if (argc != 2) {
> +		ksft_test_result_fail("usage: %s block-device\n", argv[0]);
> +		ksft_finished();
> +	}
> +	if (unshare(CLONE_NEWNS)) {
> +		if (errno == EPERM || errno == EINVAL) {
> +			ksft_test_result_skip("private mount namespace is unavailable\n");
> +			ksft_finished();
> +		}
> +		ksft_exit_fail_perror("creating mount namespace");
> +	}
> +	if (mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, NULL)) {
> +		if (errno == EPERM || errno == EACCES) {
> +			ksft_test_result_skip("cannot make mounts private\n");
> +			ksft_finished();
> +		}
> +		ksft_exit_fail_perror("making mounts private");
> +	}
> +	if (!mkdtemp(mountpoint))
> +		ksft_exit_fail_perror("creating mountpoint");
> +	if (mount(argv[1], mountpoint, "ext4", 0, NULL)) {
> +		int error = errno;
> +
> +		rmdir(mountpoint);
> +		errno = error;
> +		ksft_exit_fail_perror("mounting ext4 test image");
> +	}
> +	mounted = true;
> +
> +	snprintf(filename, sizeof(filename), "%s/fill", mountpoint);
> +	fd = open(filename, O_CREAT | O_EXCL | O_RDWR, 0666);
> +	if (fd < 0) {
> +		snprintf(message, sizeof(message), "creating test file: %s",
> +			 strerror(errno));
> +		failed = 1;
> +		goto out;
> +	}
> +	if (fchown(fd, TEST_UID, FILL_GID) || fchmod(fd, 0666)) {
> +		snprintf(message, sizeof(message), "setting test-file owner: %s",
> +			 strerror(errno));
> +		failed = 1;
> +		goto out;
> +	}
> +
> +	ret = run_worker(fd, FILL_GID, true, 0, &fill_result);
> +	if (ret) {
> +		snprintf(message, sizeof(message), "filling filesystem: %s",
> +			 strerror(-ret));
> +		failed = 1;
> +		goto out;
> +	}
> +	if (fill_result.setup_error) {
> +		if (fill_result.setup_error == EPERM) {
> +			snprintf(message, sizeof(message),
> +				 "cannot drop worker privileges: %s",
> +				 strerror(fill_result.setup_error));
> +			skipped = true;
> +			goto out;
> +		}
> +		snprintf(message, sizeof(message), "dropping worker privileges: %s",
> +			 strerror(fill_result.setup_error));
> +		failed = 1;
> +		goto out;
> +	}
> +	if (fill_result.error != ENOSPC) {
> +		snprintf(message, sizeof(message),
> +			 "unprivileged fill stopped with %s, expected ENOSPC",
> +			 strerror(fill_result.error));
> +		failed = 1;
> +		goto out;
> +	}
> +
> +	ret = run_worker(fd, RESGID, false, fill_result.offset, &group_result);
> +	if (ret) {
> +		snprintf(message, sizeof(message), "testing reserved GID: %s",
> +			 strerror(-ret));
> +		failed = 1;
> +		goto out;
> +	}
> +	if (group_result.setup_error) {
> +		snprintf(message, sizeof(message), "setting reserved GID: %s",
> +			 strerror(group_result.setup_error));
> +		failed = 1;
> +		goto out;
> +	}
> +	if (group_result.error) {
> +		snprintf(message, sizeof(message),
> +			 "reserved-GID allocation failed: %s",
> +			 strerror(group_result.error));
> +		failed = 1;
> +	}
> +
> +out:
> +	if (fd >= 0 && close(fd)) {
> +		snprintf(message, sizeof(message), "closing test file: %s",
> +			 strerror(errno));
> +		failed = 1;
> +	}
> +	if (unlink(filename) && errno != ENOENT) {
> +		snprintf(message, sizeof(message), "removing test file: %s",
> +			 strerror(errno));
> +		failed = 1;
> +	}
> +	if (mounted && umount(mountpoint)) {
> +		snprintf(message, sizeof(message), "unmounting test image: %s",
> +			 strerror(errno));
> +		failed = 1;
> +	}
> +	if (rmdir(mountpoint)) {
> +		snprintf(message, sizeof(message), "removing mountpoint: %s",
> +			 strerror(errno));
> +		failed = 1;
> +	}
> +
> +	if (failed)
> +		ksft_test_result_fail("%s\n", message);
> +	else if (skipped)
> +		ksft_test_result_skip("%s\n", message);
> +	else
> +		ksft_test_result_pass("%s\n", message);
> +	ksft_finished();
> +}
> -- 
> 2.43.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
