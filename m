Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06EA3368A4;
	Fri, 31 Jul 2026 20:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.68.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785530371; cv=none; b=TjilBLodkAJqVZNM9Pf3KFjFtyU0tJxfxc5jKV10aBR2Ro61nJhU0pzB2lvsIgYLrikpPNbqdbDifQiXqeRXW11YkEu8qMVrJV/8EjdB3gFkeyvZpMCNY98AvidIJ/rob7r+exCBad9S7qG72RMgdOFzev9wlz9+sbPJaJyDTrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785530371; c=relaxed/simple;
	bh=JmyLqMQOCQhrSgHHrKOoWCVisbxlpu7jpYOhnApJxLU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OqZVfHOm4KFrMRYyj0+kY/5pcc5SItTi2Qc6mPsKpnac31bQoQ42/S0oB25x81f5oza8B12XjvcHJODHTaNmYIw8q2lirCAL5enUCnEfIqC4FMSJI9jEL4Sz1dnS0VwRa+km51/6dqO1s4jyn4tb/DN/jzr22ie7u9Zb/e8vZm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=tdCapOgM; arc=none smtp.client-ip=44.246.68.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="tdCapOgM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1785530369; x=1817066369;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1XxHHgDxFaSg+PKoRdxaXxYeDVMEsgZ+UBXj89p6PiM=;
  b=tdCapOgM5gu2/3Hwm+qwfDzfIsATlewc6u6XakXfkDD1ao5NWqIZs+dh
   kRjEZEMozrgrmEb1gGnb06VGhiiB5H8BPbD9N6TpADy1gGZuxHH/32HX/
   nusGhC66LKFdMiUjcCtJc5E4iwIKoF+kyPk8Do3GvtikSapgFGpHxG4pz
   SMIqyJdS2j4Ys4hcL5Fkjh1oDJckGoQQlVCDrFwVRiL1SpADAViDpJxXu
   FlvfxfCsNe2KWoALLlwsOsm67gXanwpW0021JTV5+UOw8hvaxZtGbthaZ
   7rE1hl6OjhqIaaaK2Pid3M+OvlHBja6PV6ab2fTGJISzvFjO00ffomd2s
   Q==;
X-CSE-ConnectionGUID: yT/zqkz6TiqzE/kEwCpw/Q==
X-CSE-MsgGUID: 8hB2ugaATHKcSp/4s5+Q0g==
X-IronPort-AV: E=Sophos;i="6.25,197,1779148800"; 
   d="scan'208";a="24812508"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 20:39:29 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:6666]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.53.230:2525] with esmtp (Farcaster)
 id dc5acb33-2963-492f-a241-07f8fe5799a1; Fri, 31 Jul 2026 20:39:29 +0000 (UTC)
X-Farcaster-Flow-ID: dc5acb33-2963-492f-a241-07f8fe5799a1
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Fri, 31 Jul 2026 20:39:29 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Fri, 31 Jul 2026 20:39:28 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Shuah Khan <shuah@kernel.org>
CC: <fuse-devel@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>
Subject: [PATCH 1/2] fuse: zero the partial EOF page when extending a file
Date: Fri, 31 Jul 2026 20:38:41 +0000
Message-ID: <20260731203842.540798-2-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260731203842.540798-1-jamz@amazon.com>
References: <20260731203842.540798-1-jamz@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D044UWA001.ant.amazon.com (10.13.139.100) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Extending a fuse file past a non-page-aligned EOF does not zero the tail of
the old last page.  If that page is cached and was dirtied beyond the old
EOF -- e.g. an application mmap()ed the EOF page and stored into the region
past EOF, which is undefined until the file grows -- the now in-bounds tail
is exposed to subsequent reads as stale data instead of zeros, in violation
of POSIX file-extension semantics.

Other filesystems zero this via pagecache_isize_extended(), but that helper
is a no-op for fuse: it returns early when i_blocksize() >= PAGE_SIZE, and
a non-fuseblk fuse mount has s_blocksize == PAGE_SIZE (the server-supplied
st_blksize only sets fi->cached_i_blkbits, not i_blkbits).  The NFS client
hit the same problem and open-codes the zeroing in
nfs_truncate_last_folio(); add the equivalent fuse_zero_partial_eof_folio()
and call it from the three paths that extend a file: a buffered write, a
size-extending setattr/truncate, and a size-extending fallocate
(fuse_write_update_attr(), fuse_do_setattr() and fuse_file_fallocate()).

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
index cb8da4c06d17..a9063b4e9217 100644
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
@@ -1200,20 +1202,64 @@ static ssize_t fuse_send_write(struct fuse_io_args *ia, loff_t pos,
 	return err ?: ia->write.out.size;
 }
 
+/*
+ * An operation extended i_size past a non-folio-aligned old EOF at @from,
+ * turning [@from, @to) into a hole that must read back as zero.  If the old
+ * last folio is cached and was dirtied beyond the old EOF (e.g. mmap stores
+ * into the post-EOF region, which are undefined until the file grows), zero
+ * that tail so it is not exposed as stale data (xfstests generic/363).
+ *
+ * pagecache_isize_extended() cannot be used: it bails out for
+ * i_blocksize() >= PAGE_SIZE, and a non-fuseblk mount has
+ * s_blocksize == PAGE_SIZE, so the zeroing has to be done here.
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
 	struct fuse_inode *fi = get_fuse_inode(inode);
 	bool ret = false;
+	loff_t old_size = 0;
 
 	spin_lock(&fi->lock);
 	fi->attr_version = atomic64_inc_return(&fc->attr_version);
 	if (written > 0 && pos > inode->i_size) {
+		old_size = inode->i_size;
 		i_size_write(inode, pos);
 		ret = true;
 	}
 	spin_unlock(&fi->lock);
 
+	/* [old_size, pos - written) is the hole this write opened past EOF. */
+	if (ret)
+		fuse_zero_partial_eof_folio(inode, old_size, pos - written);
+
 	fuse_invalidate_attr_mask(inode, FUSE_STATX_MODSIZE);
 
 	return ret;
@@ -2913,8 +2959,18 @@ static long fuse_file_fallocate(struct file *file, int mode, loff_t offset,
 
 	/* we could have extended the file */
 	if (!(mode & FALLOC_FL_KEEP_SIZE)) {
+		loff_t oldsize = i_size_read(inode);
+
 		if (fuse_write_update_attr(inode, offset + length, length))
 			file_update_time(file);
+		/*
+		 * fuse_write_update_attr() already zeroes up to @offset when
+		 * the write started past the old EOF; this additionally covers
+		 * a fallocate whose range starts at or before it.  fallocate
+		 * writes no data, so the whole extension must read as zero; the
+		 * overlap is a no-op.
+		 */
+		fuse_zero_partial_eof_folio(inode, oldsize, offset + length);
 	}
 
 	if (mode & (FALLOC_FL_PUNCH_HOLE | FALLOC_FL_ZERO_RANGE))
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

