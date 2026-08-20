Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.83.148.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326B8442107;
	Thu, 20 Aug 2026 12:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.83.148.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787229378; cv=none; b=N31/WHIf8jzFtG03RzI7tHvJRebb0BSiI54EGwJWgxI44vXsWFrMPEmiWnd/Gll+K/bEShS4ew7pLO3/1jyte3n/7NQWn7J9AYbAifbkqo2KX5QFaaRqR1bGpXBDAv3o9vPOwOgalQz1Tau/f7DmVBpVkCZaJ2AdQOt5JaulbEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787229378; c=relaxed/simple;
	bh=j9ZvZCwiEUWO4OekhUKTi601qeDSu0iQM2/HyyDMW8g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lqA4NqubsTJt2vT3Aj8yBei8q0JMaV27mDRNLdQTCG/2L7vpk2yFQAU3aDuaMmnjNS70hLhg4NsWykTYPrbWwA81iWhwDEcW4yZSac3zIYg83v8h9sjqrnXabSkaTj1bEWSd30dobNZNrZCSSe1/fJYEgtirgelspKVXLCnulFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=ifewejVC; arc=none smtp.client-ip=35.83.148.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="ifewejVC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1787229377; x=1818765377;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CP4CgN2KKeU8iTxhY+zaSLMyBlds3cHioUSm+sgVwrY=;
  b=ifewejVCVPHsgHC/ruzD6853DYN/0HWySC2cOKvREZ8XjoljpOOkTrYA
   O9ogq5XNWFDfuZ0CRv/XGb3e6RXrpUGuDLIheNaMXI6fasX/cx3KtEnNT
   9ynYHbRwSi0Q3JDqDD+pgV10VD0ifcrwuUzdDqroC/Y812na5ytoOcTg+
   oaiJAz4JPD8SbKkpQh6p8GNksQyv6Kdr6RMkLSPoAuqmegoeNs3pDcVRB
   R9CHi/5NCHMwFNgSvWjhqcb+WEWTK9LGIDPsak1AcUNwUpDC20QkiLw0H
   2U4pDeyGhaWcZx8LgHkDkoL5/Hp4IYB1Dn0/g2gE/9rShmnxNhM2kWMKI
   Q==;
X-CSE-ConnectionGUID: SVf3vkqUSeOCG6ngRgZZHg==
X-CSE-MsgGUID: QGeJ5xffTaCPEomrTWKMEw==
X-IronPort-AV: E=Sophos;i="6.25,233,1779148800"; 
   d="scan'208";a="26269914"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 12:36:16 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:30407]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.76:2525] with esmtp (Farcaster)
 id f91f801b-8da2-4fb8-84b5-049a1bff1d7d; Thu, 20 Aug 2026 12:36:16 +0000 (UTC)
X-Farcaster-Flow-ID: f91f801b-8da2-4fb8-84b5-049a1bff1d7d
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 20 Aug 2026 12:36:16 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 20 Aug 2026 12:36:15 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: <miklos@szeredi.hu>, <shuah@kernel.org>
CC: <fuse-devel@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, <jack@suse.com>, <joannelkoong@gmail.com>,
	<bfoster@redhat.com>
Subject: [PATCH v3 1/2] fuse: zero the partial EOF page when extending a file
Date: Thu, 20 Aug 2026 12:35:32 +0000
Message-ID: <20260820123533.190470-2-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260820123533.190470-1-jamz@amazon.com>
References: <20260820123533.190470-1-jamz@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D033UWC001.ant.amazon.com (10.13.139.218) To
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
pagecache_isize_extended() cannot be reused: it is a no-op when
i_blocksize() >= PAGE_SIZE, and would increase the work in that function
for use cases that don't need it, if changed to support this situation.

Add fuse_zero_partial_eof_folio(), which zeroes the tail of the old EOF
folio, and call it up front from the three paths that extend a file,
mirroring xfs_file_write_zero_eof() and ext4_block_zero_eof():

  - a buffered write whose position is past the old EOF (fuse_perform_write(),
    before the page cache is filled);
  - a size-extending setattr/truncate (fuse_do_setattr());
  - a size-extending fallocate (fuse_file_fallocate()).

Zeroing [old EOF, write start) before the write, rather than after it, keeps
the zeroed range disjoint from the written data, so a write that lands inside
the old EOF folio is preserved without special-casing.

writeback_cache connections are unaffected, as their writes go through
iomap_file_buffered_write(), which zeroes post-EOF folios.  The bug is
observable on a non-writeback_cache server that returns FOPEN_KEEP_CACHE on
writable files (without FOPEN_DIRECT_IO), and is caught by the new
write_extend_eof fuse selftest.

Signed-off-by: Jimmy Zuber <jamz@amazon.com>
---
 fs/fuse/dir.c    |  3 +++
 fs/fuse/file.c   | 56 ++++++++++++++++++++++++++++++++++++++++++++++++
 fs/fuse/fuse_i.h |  1 +
 3 files changed, 60 insertions(+)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 795e92037ce7..f6614ccef186 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -2282,6 +2282,9 @@ int fuse_do_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 	 */
 	if ((is_truncate || !is_wb) &&
 	    S_ISREG(inode->i_mode) && oldsize != outarg.attr.size) {
+		if (outarg.attr.size > oldsize)
+			fuse_zero_partial_eof_folio(inode, oldsize,
+						    outarg.attr.size);
 		truncate_pagecache(inode, outarg.attr.size);
 		invalidate_inode_pages2(mapping);
 	}
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index cb8da4c06d17..57630ad0af66 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -21,6 +21,8 @@
 #include <linux/splice.h>
 #include <linux/task_io_accounting_ops.h>
 #include <linux/iomap.h>
+#include <linux/highmem.h>
+#include <linux/rmap.h>
 
 static int fuse_send_open(struct fuse_mount *fm, u64 nodeid,
 			  unsigned int open_flags, int opcode,
@@ -1200,6 +1202,43 @@ static ssize_t fuse_send_write(struct fuse_io_args *ia, loff_t pos,
 	return err ?: ia->write.out.size;
 }
 
+/*
+ * A size-extending operation is about to turn [@from, @to) -- the range past a
+ * non-folio-aligned old EOF at @from -- into a hole that must read back as
+ * zero.  If the old last folio is cached and was dirtied beyond the old EOF
+ * (e.g. mmap stores into the post-EOF region, which are undefined until the
+ * file grows), zero that tail so it is not exposed as stale data instead of
+ * zeros (xfstests generic/363).  Only the folio straddling @from can hold such
+ * bytes, so a single folio is handled, as in pagecache_isize_extended().
+ *
+ * Callers hold i_rwsem, serialising this against concurrent writes and
+ * truncates; it must not run under fi->lock, as it locks the folio.
+ */
+void fuse_zero_partial_eof_folio(struct inode *inode, loff_t from, loff_t to)
+{
+	struct folio *folio;
+	size_t offset, end;
+
+	if (from >= to)
+		return;
+
+	folio = filemap_lock_folio(inode->i_mapping, from >> PAGE_SHIFT);
+	if (IS_ERR(folio))
+		return;
+
+	if (folio_mkclean(folio))
+		folio_mark_dirty(folio);
+
+	if (folio_test_dirty(folio)) {
+		offset = offset_in_folio(folio, from);
+		end = min_t(loff_t, to - folio_pos(folio), folio_size(folio));
+		folio_zero_segment(folio, offset, end);
+	}
+
+	folio_unlock(folio);
+	folio_put(folio);
+}
+
 bool fuse_write_update_attr(struct inode *inode, loff_t pos, ssize_t written)
 {
 	struct fuse_conn *fc = get_fuse_conn(inode);
@@ -1368,9 +1407,19 @@ static ssize_t fuse_perform_write(struct kiocb *iocb, struct iov_iter *ii)
 	struct fuse_conn *fc = get_fuse_conn(inode);
 	struct fuse_inode *fi = get_fuse_inode(inode);
 	loff_t pos = iocb->ki_pos;
+	loff_t old_size = i_size_read(inode);
 	int err = 0;
 	ssize_t res = 0;
 
+	/*
+	 * If the write starts past a non-aligned EOF, zero the old EOF folio's
+	 * tail before filling the page cache, so [old_size, pos) reads as the
+	 * hole it is.  The write below fills from @pos, disjoint from this
+	 * range.
+	 */
+	if (pos > old_size)
+		fuse_zero_partial_eof_folio(inode, old_size, pos);
+
 	if (inode->i_size < pos + iov_iter_count(ii))
 		set_bit(FUSE_I_SIZE_UNSTABLE, &fi->state);
 
@@ -2913,6 +2962,13 @@ static long fuse_file_fallocate(struct file *file, int mode, loff_t offset,
 
 	/* we could have extended the file */
 	if (!(mode & FALLOC_FL_KEEP_SIZE)) {
+		/*
+		 * fallocate writes no data, so the whole extension past the old
+		 * EOF is a hole; zero the old EOF folio's tail before publishing
+		 * the new size.
+		 */
+		fuse_zero_partial_eof_folio(inode, i_size_read(inode),
+					    offset + length);
 		if (fuse_write_update_attr(inode, offset + length, length))
 			file_update_time(file);
 	}
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 85f738c53122..ee3b91b56fef 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -1183,6 +1183,7 @@ long fuse_ioctl_common(struct file *file, unsigned int cmd,
 __poll_t fuse_file_poll(struct file *file, poll_table *wait);
 
 bool fuse_write_update_attr(struct inode *inode, loff_t pos, ssize_t written);
+void fuse_zero_partial_eof_folio(struct inode *inode, loff_t from, loff_t to);
 
 int fuse_flush_times(struct inode *inode, struct fuse_file *ff);
 int fuse_write_inode(struct inode *inode, struct writeback_control *wbc);
-- 
2.50.1

