Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.26.1.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B7F1E8332;
	Mon, 24 Aug 2026 14:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.26.1.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787581917; cv=none; b=crJumKryuVHpCOQFxBX72vslNOsQmWBxPptjzrUcPLjM0mYOegdiyYeL9V8xvoS8p/JIeqyRBbXFjhCocGG88fU4RjsPzLESg6yvhzc3QfNpTmCZb1KrmmR4ql/kNX8RgY4Pfal+nF/dyGMrMlk5hqySxYD53hycT7hqg4nSYpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787581917; c=relaxed/simple;
	bh=oAmKG89BSiGgcW6XhsvVAYvDuwz7DDrBBtt4wMakxvM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S9SdLLawrUquFSIuO5h+g3jkpSWUkY1hXeyo/MqwdUIloPu+fiZIFUNPl4BAY4oE/AFYcO/gOa1/zBurhqUakQjiQywdnjpeVW5lfajKHWJW2Lb/+mPR9/Sedy2CTuK/cAHgQ4zlnnwM1shBNArY9X876Z7JmDGEEVrt+WD1wFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=r/WEffSS; arc=none smtp.client-ip=52.26.1.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="r/WEffSS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1787581916; x=1819117916;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yzKD5WwtMJMFFjCtja3a5C0KRabX8L7BqjVzHqWXjh8=;
  b=r/WEffSSC41KC6y+/EpNzPmaSHfH5uyxfJbHs584TvNNkSnDhZ4a/ZbK
   NP6WONtJIPNbuz7t7C8PdJTzaJm2KLIi9NHCfpy3h+bg8QKicm2Gypl0E
   6sJccJA9cShgTGYUMSoeUzhXr0/oxftmNWUETVN57fEGtTfKs7bFhpfwC
   TuaTc0aV76nBFQFMnw4f+H4zD4KnD2pxVV2kJ4wzj4ZxCvurWbnV6M7Al
   caAw+xD29CpeC/kLhCt4jxPjNiWEXSE92rjx0sY0zeGG/2iFyC1wGAAYX
   paXn+Q5zk3k8fS75e5AXUAxGCNvOqs/vwOTMGMzKUi3Z9XU2tST4UflFI
   Q==;
X-CSE-ConnectionGUID: PigiWMXhQOCXbYCjvvcZMw==
X-CSE-MsgGUID: 3ON9/EU1TdWh2bsvAuvPGw==
X-IronPort-AV: E=Sophos;i="6.25,240,1779148800"; 
   d="scan'208";a="26807252"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 14:31:56 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:1998]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.43.135:2525] with esmtp (Farcaster)
 id 2e5dd481-abae-45dc-82ca-ee3640a9875d; Mon, 24 Aug 2026 14:31:55 +0000 (UTC)
X-Farcaster-Flow-ID: 2e5dd481-abae-45dc-82ca-ee3640a9875d
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Mon, 24 Aug 2026 14:31:55 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46;
 Mon, 24 Aug 2026 14:31:54 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: <miklos@szeredi.hu>, <shuah@kernel.org>
CC: <fuse-devel@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <jack@suse.com>, <joannelkoong@gmail.com>,
	<bfoster@redhat.com>
Subject: [PATCH v4 1/2] fuse: zero the partial EOF page when extending a file
Date: Mon, 24 Aug 2026 14:30:51 +0000
Message-ID: <20260824143052.1546163-2-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260824143052.1546163-1-jamz@amazon.com>
References: <20260824143052.1546163-1-jamz@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D035UWB003.ant.amazon.com (10.13.138.85) To
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

Call truncate_pagecache_range() over the newly-exposed range up front from the
three paths that extend a file, before the new size is published:

  - a buffered write whose position is past the old EOF (fuse_perform_write());
  - a size-extending setattr/truncate (fuse_do_setattr());
  - a size-extending fallocate (fuse_file_fallocate()).

This unmaps the stale mappings and zeroes the partial tail of the old EOF
folio, so a later read returns zeros.  Truncating [old EOF, write start) before
a buffered write keeps the dropped range disjoint from the written data, so a
write that lands inside the old EOF folio is preserved.

writeback_cache connections are unaffected, as their writes go through
iomap_file_buffered_write(), which zeroes post-EOF folios.  The bug is
observable on a non-writeback_cache server that returns FOPEN_KEEP_CACHE on
writable files (without FOPEN_DIRECT_IO), and is caught by the new
write_extend_eof fuse selftest.

Signed-off-by: Jimmy Zuber <jamz@amazon.com>
---
 fs/fuse/dir.c  | 3 +++
 fs/fuse/file.c | 9 +++++++++
 2 files changed, 12 insertions(+)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 795e92037ce7..a6f0f509f840 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -2282,6 +2282,9 @@ int fuse_do_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 	 */
 	if ((is_truncate || !is_wb) &&
 	    S_ISREG(inode->i_mode) && oldsize != outarg.attr.size) {
+		if (outarg.attr.size > oldsize)
+			truncate_pagecache_range(inode, oldsize,
+						 outarg.attr.size - 1);
 		truncate_pagecache(inode, outarg.attr.size);
 		invalidate_inode_pages2(mapping);
 	}
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index cb8da4c06d17..6ec13c6aafe6 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -1368,9 +1368,13 @@ static ssize_t fuse_perform_write(struct kiocb *iocb, struct iov_iter *ii)
 	struct fuse_conn *fc = get_fuse_conn(inode);
 	struct fuse_inode *fi = get_fuse_inode(inode);
 	loff_t pos = iocb->ki_pos;
+	loff_t old_size = i_size_read(inode);
 	int err = 0;
 	ssize_t res = 0;
 
+	if (pos > old_size)
+		truncate_pagecache_range(inode, old_size, pos - 1);
+
 	if (inode->i_size < pos + iov_iter_count(ii))
 		set_bit(FUSE_I_SIZE_UNSTABLE, &fi->state);
 
@@ -2913,6 +2917,11 @@ static long fuse_file_fallocate(struct file *file, int mode, loff_t offset,
 
 	/* we could have extended the file */
 	if (!(mode & FALLOC_FL_KEEP_SIZE)) {
+		loff_t oldsize = i_size_read(inode);
+
+		if (offset + length > oldsize)
+			truncate_pagecache_range(inode, oldsize,
+						 offset + length - 1);
 		if (fuse_write_update_attr(inode, offset + length, length))
 			file_update_time(file);
 	}
-- 
2.50.1

