Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480DD442B34;
	Thu, 20 Aug 2026 12:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.68.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787229349; cv=none; b=b+TPixFrSmoZvhiBi6b31it3fPD2nwKQnspLY1ykVkEsmFeoMQIKaz3MwF7VmUxR2WH9Mff+/wzp+ZE2lej0zUADnUfYTXZBfmR3sAJKU1tAtIgN+IhBamN608Lm9q7iylVFNFqjR2kYikjiGLWWVo46lOmzibX6xkmHjgt266E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787229349; c=relaxed/simple;
	bh=ITCD0FKShNAqWtdQjWhcJDYFNBcMXaLPw16mX/SXlCM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ppqXx0gFVe5ky6Q+e9dD1hikrah9XcpG74s62z5AT7B6UYn0Y8am3rx3hKOY1Ad3DMmGnfTq3YsR0ms0RzzlZx5+9+Xp3uhLrchsQ1hOuSbz3GGx6ifyOWoQNbjXJSbqEshSaSzqKJ7pWc+4SIIs7mwEJnEHWnR5b2HepADzLtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=S7G0OlFt; arc=none smtp.client-ip=44.246.68.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="S7G0OlFt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1787229348; x=1818765348;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=U51dkfnHhwezuUPH/PDaIASsx6DR5LjGIyHyqRm+zRg=;
  b=S7G0OlFt5wYIcDH3xd2MdDCJnpJuGHVBkJ2z8M/CRNp1ATAisAVQKFLB
   BWuM0HV/hXxCiuIJFk0hwYtZDY1UwX7vcxnHYlQwlPm1nYr+AXhMtQi1M
   rkaP8SQ+MfmvYxlGhXfAWUv1qpWyadyu4x7MEyEj2TAjkmE+3Vp7s1pS9
   rvXoq5STDF+CUzfW8WIoXdFVrCz/zQ9qEShMYS1gfMXfiiwPm1LijungY
   nNqK2InA+VLoO8nJV/1P8ZxUcjz9fNnPx4fcQ75GBtFYCPQy2xOx/3Rje
   3bwtsyRjVVNPbJWp3MNj5JRKYCdJDjominM3TM2dJZQqXYVHd0iJJf3c1
   Q==;
X-CSE-ConnectionGUID: vStSMLcETI6tCa4L0r71Ag==
X-CSE-MsgGUID: dbnln7aeS2aKDBw9P61X9w==
X-IronPort-AV: E=Sophos;i="6.25,233,1779148800"; 
   d="scan'208";a="26491961"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 12:35:47 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:13757]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.53.153:2525] with esmtp (Farcaster)
 id 888d4b2d-5b81-4b45-b84d-0185add44b19; Thu, 20 Aug 2026 12:35:47 +0000 (UTC)
X-Farcaster-Flow-ID: 888d4b2d-5b81-4b45-b84d-0185add44b19
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 20 Aug 2026 12:35:47 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 20 Aug 2026 12:35:46 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: <miklos@szeredi.hu>, <shuah@kernel.org>
CC: <fuse-devel@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <jack@suse.com>, <joannelkoong@gmail.com>,
	<bfoster@redhat.com>
Subject: [PATCH v3 0/2] fuse: zero the partial EOF page when extending a file
Date: Thu, 20 Aug 2026 12:35:31 +0000
Message-ID: <20260820123533.190470-1-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D037UWC004.ant.amazon.com (10.13.139.254) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

v3 is a resend of v2 [2] with no code or commit-message changes; the v2
posting went out with malformed To/Cc headers, so most recipients did not
get a direct copy.

Extending a fuse file past a non-page-aligned EOF does not zero the tail of
the old last page.  When that page is cached and has been mmap-dirtied beyond
the old EOF, the now in-bounds tail is served to later reads as stale data
rather than zeros, which violates POSIX file-extension semantics.

Some file systems get this zeroing automatically at writeback time
(block_write_full_folio() / iomap_writeback_handle_eof() zero the tail of the
folio straddling i_size).  A non-writeback caching fuse file system uses neither
path, so it has to zero the tail itself from the size-extending paths, like
XFS (xfs_file_write_zero_eof()) and ext4 (ext4_block_zero_eof()) do.
pagecache_isize_extended() cannot be reused: it is a no-op when
i_blocksize() >= PAGE_SIZE, and would increase the work in that function
for use cases that don't need it, if changed to support this situation.

Patch 1 adds fuse_zero_partial_eof_folio() and calls it up front from the
three paths that extend a file: buffered write, setattr, and
fallocate.  Patch 2 adds a self-contained raw /dev/fuse selftest covering each
path.

Tested by booting the patched kernel under User-Mode Linux and running the new
selftest, and reproduced against libfuse's passthrough_ll example daemon.

Changes since v1 [1]:
- Miklos and Jan Kara discussed whether there was a better pattern with less
  duplication between file systems.  Jan confirmed that other file systems do
  this zeroing themselves from their write/setattr paths (e.g. XFS
  xfs_file_write_zero_eof(), ext4 ext4_block_zero_eof()), because the block /
  iomap writeback that would otherwise zero the straddling folio does not run
  on this path.  File systems currently implement this separately.  It is
  beyond me to pursue unifying it.  Restructure to match the pattern in other
  file systems: zero [old EOF, write start) up front from fuse_perform_write()
  rather than after the fact from fuse_write_update_attr(), keyed on the write
  starting beyond EOF.
- This keeps the zeroed range disjoint from the written data, so a write that
  lands inside the old EOF folio is preserved by construction; the v1
  "pos - written" arithmetic and the fallocate double-call are gone.
- fuse_write_update_attr() goes back to being a pure attr update; the
  setattr/truncate call in fuse_do_setattr() is unchanged.
- The selftest is unchanged from v1.

[1] https://lore.kernel.org/all/20260731203842.540798-1-jamz@amazon.com/
[2] https://lore.kernel.org/all/20260820122627.156961-1-jamz@amazon.com/

Jimmy Zuber (2):
  fuse: zero the partial EOF page when extending a file
  selftests/fuse: test post-EOF page zeroing when a file is extended

 fs/fuse/dir.c                                 |   3 +
 fs/fuse/file.c                                |  56 +++
 fs/fuse/fuse_i.h                              |   1 +
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../selftests/filesystems/fuse/Makefile       |   3 +
 .../filesystems/fuse/write_extend_eof_test.c  | 368 ++++++++++++++++++
 6 files changed, 432 insertions(+)
 create mode 100644 tools/testing/selftests/filesystems/fuse/write_extend_eof_test.c


base-commit: 7d87a5a284bb34edb3f4e7e312ef403b3385a7b7
-- 
2.50.1

