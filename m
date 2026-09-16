Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651DD4AAC6A;
	Wed, 16 Sep 2026 15:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574165; cv=none; b=UZBcnIxc+fZ3N34NTI0+ovcQOmKSnCUk1NUeCPoBs+/n4Kh0Mtmizh2x3FdgcdW0ufvRE3CYD/i1C/DWTVjG6ho0BWgKWqWHbRs0tq/LU5LQw0qWuMKQQ1JpOjXKlgV7jzwLQaUaCbfocXcKz4MkCZWgUpJrsgbXsywOOGmW59A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574165; c=relaxed/simple;
	bh=wPQaNNh5ATIjyRE9+GqM1enjHBG4gZe521Y61xU9Ws8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gaG1O/DJbYOe26iOeph0mJ7F5oTcGpPxA9Y4yJjBkfgzS4QBbDYAWAlXzLRjs383egnSOBQCatUnVIpPg3nzBm0ZtgCHjpzD/2Xqq1wCgX8IT30wdvPp8d+uUYNN6KmEqzQbf58VfXt0Gfe7DbTzMivFt+GXC1ae5q/TRRZwaIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=qEficTSA; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="qEficTSA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=nVj/ZMarGaFZd9tu0ObM/4qhh1bSPt6B/0q4f+HwBUc=; b=
	qEficTSA9w7VDLeASzodTtXe+94sweCqUrYfO1vSwyPN8GsBz9z8mj1BbSDcz79qNdwNr1H6xBF3l
	w0+TcV24xLEROYfTQ9ucEl3a1MIkFY9s/63D1LS9Q6YOPuHWIS4vaxDL0Sw0cg6OZo0uzhIw//gmL
	dWwJ4r2s3uJPXRAjAYZowyYr15x4Ghm/0JyuDC+mZPyoICn6/hM8C2SqyefXOrO25I9tYE1fu0V22
	MYIPivOkn4K6GYWtlZwW1bnpfyUEtkSomfC9EfoNCx93K+sFIQIEdHjI3xd86HxzsAy5o9OWXDfoX
	kiKYoZik+avj6nk0ODcfH8l+iIxv7G+zsQ==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x6ryv-0031JT-Kg; Wed, 16 Sep 2026 17:55:33 +0200
From: Luis Henriques <luis@igalia.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Amir Goldstein <amir73il@gmail.com>,
	Chen Linxuan <me@black-desk.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Matt Harvey <mharvey@jumptrading.com>,
	kernel-dev@igalia.com,
	Luis Henriques <luis@igalia.com>
Subject: [RFC PATCH v4 0/8] fuse: caches documentation and testing
Date: Wed, 16 Sep 2026 16:56:21 +0100
Message-ID: <20260916155629.32421-1-luis@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi!

I'm sending v4 of this patchset.  It tries to fix the problems identified
in the previous version, both by Amir's review and by the sashiko code
review system.

Note however that there were issues identified by the code review system
in the last patch (the readdir kselftest) which I decided not to
implement.  Those issues are real *if* the file system is used outside the
scope of these tests.  A more robust solution could have been based the
libfuse examples, but I thought that wouldn't be needed and I decided to
use a more simplistic approach.  (Maybe that was a wrong decision.)

Finally, here's the (main!) changes since v3:

- Document:
  - Simplified text by removing a lot of details; also used Amir's suggested
    text
  - Added document to index.rst and fixed some typos (sashiko review
    system).
- Added extra struct fuse_common_ctx to reduce test boilerplate even more (Amir)
- Fixed several {} mismatches, and reshaped some error handling code (Amir)
- symlink test:
  - fixed ->lookup() issue previously identified by sashiko, and that I
    had missed (Amir)
  - fix wrong login in fs_lookup() (sashiko)
- readdir test:
  - use constant value for mtime (Amir)
  - Removed redundant condition in fs_lookup() (sashiko)
- acl test:
  - use constant uid/gid for ->lookup() and ->getattr() (sashiko)
  - fix possible memcpy undef behaviour with a NULL source (sashiko)

Luis Henriques (8):
  Documentation: fuse: add document on caches being used by FUSE
  selftests/fuse: convert fusectl test to fuse3
  selftests/fuse: check that fusectlfs is mounted
  selftests/fuse: factor-out test fixture setup/teardown
  selftests/fuse: use dynamically allocated memory to store ACLs
  selftests/fuse: add some extra ACL caching tests
  selftests/fuse: add fuse symlink caching test
  selftests/fuse: add fuse readdir caching test

 .../filesystems/fuse/fuse-caches.rst          | 148 +++++++++
 Documentation/filesystems/fuse/index.rst      |   1 +
 .../selftests/filesystems/fuse/.gitignore     |   3 +
 .../selftests/filesystems/fuse/Makefile       |  28 +-
 .../filesystems/fuse/fuse_acl_cache_test.c    | 304 ++++++++++++++----
 .../selftests/filesystems/fuse/fuse_common.c  |  58 ++++
 .../selftests/filesystems/fuse/fuse_common.h  |  31 ++
 .../selftests/filesystems/fuse/fuse_mnt.c     |  17 +-
 .../fuse/fuse_readdir_cache_test.c            | 274 ++++++++++++++++
 .../fuse/fuse_symlink_cache_test.c            | 163 ++++++++++
 .../selftests/filesystems/fuse/fusectl_test.c |   9 +-
 11 files changed, 953 insertions(+), 83 deletions(-)
 create mode 100644 Documentation/filesystems/fuse/fuse-caches.rst
 create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_common.c
 create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_common.h
 create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_readdir_cache_test.c
 create mode 100644 tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_test.c

