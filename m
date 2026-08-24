Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA9A41A921;
	Mon, 24 Aug 2026 14:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.1.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787581870; cv=none; b=tBOtgwx5nc/LmRBQ/7iU/gpzOLXJL1VBRcfH3tI12BqVh0OaNDBCXx7FVHvJ1gyGtP+iEn580/3HpFbYeHie42O2X9QEbZt8B7h+dvWYKYkzpQNf0XgHjGrVuHt20epMWLeL/FvNgOhaV/fx+AAF+hGySflXuZM4hQvT1waGZK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787581870; c=relaxed/simple;
	bh=XVEK7EY1wWtjtsyn0MPN/WQ5HzdK5BbHbhtTV/4UEg8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZW3mLiJXce2yqbF1/nqrV0lOhuZmvzlwmc2jdsbw8On4OMg+aSzbFTo/O9DZYWLjnieJ643GJ5pSJCa5oO3p4qfWDfka5YHJx05SdqhyYhQaZ9BiVhsLiCRzi4sbLjRGLDxE2hpF+tsKk8XFPzpWbGbKQqK+qIAH4FZnkMHFaN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=WhHhg7gO; arc=none smtp.client-ip=44.246.1.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="WhHhg7gO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1787581869; x=1819117869;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XzH7Buy5si9W237HHH8/LM5uhMjJc+hKh7mJg5q8s70=;
  b=WhHhg7gOJvtFXZHhZWTn8yPMRbh6rFV710yhU4yUZdwGtKGACZbWOFRS
   cN58Z3cdV2bpxi/fRz8SXBGGCIoO8XvLEIc8VN1BaJMuJQjTj4graw5PW
   xWxvyWvo9Q7gzladibAbg2/VNiekkYIJhSlXt22FZcfHoZ1TEA4hVJaee
   UeUilpWaPP5gB7Wc4THs/KJO4YkQj5hQNhi9fX18Olq1ed+ZD+ZzcDUz6
   9MWm9qumBgfqQtoufMVDTRg+NiZ2p+jZ+sV2OG+A4T49mUGJc/lwJ0FKg
   BnfXUbT2G4FFwg/P9vaLNik+J/DsdDEuCJOULmY/G0E9fZtnSjKt7RC5w
   Q==;
X-CSE-ConnectionGUID: 15mV54/9ThSrae1y4zuZPQ==
X-CSE-MsgGUID: +KOaNdi6QBeqwERcH88FzA==
X-IronPort-AV: E=Sophos;i="6.25,240,1779148800"; 
   d="scan'208";a="26779934"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 14:31:09 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:20407]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.23.75:2525] with esmtp (Farcaster)
 id 37ee16d5-546c-4b2e-802e-a8b43474d441; Mon, 24 Aug 2026 14:31:08 +0000 (UTC)
X-Farcaster-Flow-ID: 37ee16d5-546c-4b2e-802e-a8b43474d441
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Mon, 24 Aug 2026 14:31:08 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Mon, 24 Aug 2026 14:31:07 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: <miklos@szeredi.hu>, <shuah@kernel.org>
CC: <fuse-devel@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <jack@suse.com>, <joannelkoong@gmail.com>,
	<bfoster@redhat.com>
Subject: [PATCH v4 0/2] fuse: zero the partial EOF page when extending a file
Date: Mon, 24 Aug 2026 14:30:50 +0000
Message-ID: <20260824143052.1546163-1-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D035UWA002.ant.amazon.com (10.13.139.60) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Extending a fuse file past a non-page-aligned EOF does not zero the tail of
the old last page.  When that page is cached and has been mmap-dirtied beyond
the old EOF, the now in-bounds tail is served to later reads as stale data
rather than zeros, which violates POSIX file-extension semantics.

Some file systems get this zeroing automatically at writeback time
(block_write_full_folio() / iomap_writeback_handle_eof() zero the tail of the
folio straddling i_size).  A non-writeback caching fuse file system uses neither
path, so it has to zero the tail itself from the size-extending paths, like
XFS (xfs_file_write_zero_eof()) and ext4 (ext4_block_zero_eof()) do.

Patch 1 calls truncate_pagecache_range() over the newly-exposed range up front
from the three paths that extend a file: buffered write, setattr, and
fallocate.  Patch 2 adds a self-contained raw /dev/fuse selftest covering each
path.

Tested by booting the patched kernel under User-Mode Linux and running the new
selftest, and reproduced against libfuse's passthrough_ll example daemon.

Changes since v3 [3]:
- Drop the fuse_zero_partial_eof_folio() helper and call
  truncate_pagecache_range(inode, from, to - 1) from the three extend paths
  instead.  Miklos pointed out the helper's folio_mkclean()/folio_mark_dirty()
  dance is only needed by file systems using buffer heads (as Jan noted), and
  that truncate_pagecache_range() already does the rest of the zeroing.  The
  selftest is unchanged and still passes with patch 1 (and fails without it).

Changes since v1 [1]:
- Zero from the size-extending paths up front, keyed on the write starting
  beyond EOF, rather than after the fact from fuse_write_update_attr(), so a
  write that lands inside the old EOF folio is preserved.  (v2 [2] carried this
  change but went out with malformed recipient headers; it was resent as
  v3 [3].)

[1] https://lore.kernel.org/all/20260731203842.540798-1-jamz@amazon.com/
[2] https://lore.kernel.org/all/20260820122627.156961-1-jamz@amazon.com/
[3] https://lore.kernel.org/all/20260820123533.190470-1-jamz@amazon.com/

Jimmy Zuber (2):
  fuse: zero the partial EOF page when extending a file
  selftests/fuse: test post-EOF page zeroing when a file is extended

 fs/fuse/dir.c                                 |   3 +
 fs/fuse/file.c                                |   9 +
 .../selftests/filesystems/fuse/.gitignore     |   1 +
 .../selftests/filesystems/fuse/Makefile       |   3 +
 .../filesystems/fuse/write_extend_eof_test.c  | 368 ++++++++++++++++++
 5 files changed, 384 insertions(+)
 create mode 100644 tools/testing/selftests/filesystems/fuse/write_extend_eof_test.c


base-commit: 7d87a5a284bb34edb3f4e7e312ef403b3385a7b7
-- 
2.50.1

