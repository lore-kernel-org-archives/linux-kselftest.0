Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.68.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279313;
	b=Q31GvPqzVg9dy2ljN85xkVw+sEC4c1rVCjkEh8e5WVQdSGpizng/rtC4jQIb1/eAnh+Y
	 w1KUlzD81OA88rTXRRRn51G7zGdBwSwrMmZ+B8COESk1K0q81WPHb+o1VtjxiVU+Eq60i
	 j1IYKKJh7HMTqCEgFmg/PUJ2vNqeInVh5X+DqTxH0LwzX47luW08PjeZ+rcBHnBgXWbi8
	 Ni5rS1tgVASnCx/cQySevMvJpWJMM0/tNcjPkgcGmgXviYNRuKI6FiwnTvlFfZ3hup13w
	 24VPQovOsSmzD6Xsod6NIZ1zWynusACX+wqiAJBUK3F/UTYZDZDnppR6507xhrXUswQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279313;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=6Thd4aTIhyIA5SBe0YaKd+8a0hayqYyXEOVFwEQ9qwc=;
	b=xd32lXKKmFaTJbk+u+0k4rvFNY9nCiV8etI49/hZ5VvGwfZl49R2ZghPnc9G1V0qcgXt
	 XDqBtMhlpnzIOcR1/9RcvjrOkzAFe1oYms2zaAJMve2cSIFgGqVNjKWh21s0j9EPvIKfF
	 7z9G1kWrFElHV4K/HoMRquIuxihyH/yDbS8CwTmEjAwKcjIaNCyonMERsuluk7tfXL7ix
	 wVfRYq/iAHugDIIMgdKHHU/T/YzE1mxGuHNdnGTLnsxXfFI3bhlFHP02LYi+iHnVjQY07
	 kBYJt7uzvjed8f01Coo015eY135Y8fnGS4yCdoUx5IRgLfyqNHmGGDJS5zHJiPKT3UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Tuyt63de;
	arc=none smtp.remote-ip=44.246.68.102
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328D5606A31C
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 13:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 328D5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=Tuyt63de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793279313; x=1824815313;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6Thd4aTIhyIA5SBe0YaKd+8a0hayqYyXEOVFwEQ9qwc=;
  b=Tuyt63deUPyWND3FQwNf2XAzFVq7LL2FFn6REv01BGahvuOsa5n6vtpa
   wuZP6R5kimNMnRZyGAkXWYgVaVeZanxsE5fmL5Pw0L7Ei3vQMxDONKVDJ
   F9u5j8waO+eupCIggEHZPzAex2fhHE97kC3mSugQrkUg7bwyBY6R8rX6P
   lyf+Q93iqTb7qmjf4PQHmIziTk9UWCAxB8E22BVAvRtloHCUcsw7Al0ot
   e/0Iy3RIz7fXh3+308/VMGiE8uYjoiOlnVdDX3bmB9eSSLJZp4WeydT/l
   PRpRhFD9ODTwxu++qlkL65ugtDV2sVmMPzD5hRmBX3wa55i9RrROJ4q9y
   w==;
X-CSE-ConnectionGUID: 4luPrJ9MRR6dXJV84vfheg==
X-CSE-MsgGUID: rujhYSlQSEWPG1amWgX83w==
X-IronPort-AV: E=Sophos;i="6.27,184,1787011200"; 
   d="scan'208";a="32484620"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 13:08:32 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:1691]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.49.48:2525] with esmtp (Farcaster)
 id 894bb303-be18-4549-af3f-c5c4f932dbaf; Thu, 29 Oct 2026 13:08:32 +0000 (UTC)
X-Farcaster-Flow-ID: 894bb303-be18-4549-af3f-c5c4f932dbaf
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 29 Oct 2026 13:08:32 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 29 Oct 2026 13:08:31 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: <fuse-devel@lists.linux.dev>, <linux-kselftest@vger.kernel.org>, "Shuah
 Khan" <shuah@kernel.org>, Bernd Schubert <bernd@bsbernd.com>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>, NeilBrown <neil@brown.name>
Subject: [PATCH v6 1/2] fuse: add FUSE_OPEN_ATOMIC
Date: Thu, 29 Oct 2026 13:07:57 +0000
Message-ID: <20261029130758.818617-2-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029130758.818617-1-jamz@amazon.com>
References: <20261029130758.818617-1-jamz@amazon.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D031UWC004.ant.amazon.com (10.13.139.246) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Add FUSE_OPEN_ATOMIC, which looks up a name, creates it for O_CREAT, and
opens it in one request, so that ->atomic_open() needs no FUSE_LOOKUP
before FUSE_OPEN or FUSE_CREATE. After a -ENOSYS reply the kernel sends
FUSE_LOOKUP, as it does for FUSE_CREATE.

The request carries fuse_create_in and the name. The server replies with
the entry and, if it opened the file, fuse_open_out:

- an existing regular file: the server opens it;
- a new name with O_CREAT: the server creates and opens it, and sets
  FOPEN_CREATED;
- any other file: the server returns the entry only, and the VFS opens
  it;
- a missing name without O_CREAT: the server returns a zero nodeid,
  cached like a negative LOOKUP.

The VFS checks the open after the reply, as for other ->atomic_open()
filesystems, and the kernel releases the file if the check fails.
FMODE_CREATED is set only when the server reports FOPEN_CREATED.

The request carries the open flags without O_TRUNC: the VFS truncates
the opened file with SETATTR after its checks. With FUSE_ATOMIC_O_TRUNC,
where FUSE_OPEN truncates, an O_TRUNC open keeps FUSE_LOOKUP. When the
VFS may not create the file, it drops O_CREAT and keeps O_EXCL; that
open keeps FUSE_LOOKUP, so an existing name gives -EEXIST.

Assisted-by: Claude:claude-opus-5-5 [Claude-Code]
Signed-off-by: Jimmy Zuber <jamz@amazon.com>
---
 fs/fuse/dir.c             | 193 ++++++++++++++++++++++++++++++++++++++
 fs/fuse/fuse_i.h          |   6 ++
 fs/fuse/fuse_trace.h      |   1 +
 include/uapi/linux/fuse.h |  20 +++-
 4 files changed, 219 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 4c64a4f812395..5820582ada650 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -938,6 +938,185 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 	return err;
 }
 
+/* Release the file the server opened for a reply the kernel rejects */
+static void fuse_open_atomic_release(struct fuse_file *ff, u64 nodeid,
+				     unsigned int open_size,
+				     unsigned int flags)
+{
+	if (open_size >= FUSE_COMPAT_OPEN_OUT_SIZE && !invalid_nodeid(nodeid)) {
+		ff->fh = ff->args->open_outarg.fh;
+		ff->nodeid = nodeid;
+		fuse_sync_release(NULL, ff, flags & ~(O_CREAT | O_EXCL));
+	} else {
+		fuse_file_free(ff);
+	}
+}
+
+/*
+ * Look the name up, create it for O_CREAT, and open it in one request.  The
+ * server opens an existing regular file, returns only the entry of other
+ * files, and returns a zero nodeid for a missing name.  The VFS checks the
+ * open afterwards.  Returns 1 if the server replies -ENOSYS.
+ */
+static int fuse_open_atomic(struct mnt_idmap *idmap, struct inode *dir,
+			    struct dentry *entry, struct file *file,
+			    unsigned int flags, umode_t mode)
+{
+	struct fuse_mount *fm = get_fuse_mount(dir);
+	struct fuse_conn *fc = fm->fc;
+	FUSE_ARGS(args);
+	struct fuse_forget_link *forget;
+	struct fuse_create_in inarg;
+	struct fuse_open_out *outopen;
+	struct fuse_entry_out outentry;
+	struct inode *inode = NULL;
+	unsigned int open_size;
+	u64 attr_version, evict_ctr;
+	struct fuse_file *ff;
+	struct dentry *res;
+	bool locked = false;
+	int epoch, err;
+
+	if (entry->d_name.len > fc->name_max)
+		return -ENAMETOOLONG;
+	forget = fuse_alloc_forget();
+	ff = fuse_file_alloc(fm, true);
+	if (!forget || !ff) {
+		kfree(forget);
+		if (ff)
+			fuse_file_free(ff);
+		return -ENOMEM;
+	}
+	outopen = &ff->args->open_outarg;
+	if (!fc->dont_mask)
+		mode &= ~current_umask();
+
+	/* The VFS truncates the file after its checks */
+	memset(&inarg, 0, sizeof(inarg));
+	memset(&outentry, 0, sizeof(outentry));
+	inarg.flags = flags & ~(O_NOCTTY | O_TRUNC);
+	inarg.mode = mode;
+	inarg.umask = current_umask();
+	args.opcode = FUSE_OPEN_ATOMIC;
+	args.nodeid = get_node_id(dir);
+	args.in_numargs = 2;
+	args.in_args[0].size = sizeof(inarg);
+	args.in_args[0].value = &inarg;
+	args.in_args[1].size = entry->d_name.len + 1;
+	args.in_args[1].value = entry->d_name.name;
+	args.out_numargs = 2;
+	args.out_args[0].size = sizeof(outentry);
+	args.out_args[0].value = &outentry;
+	args.out_argvar = true;
+	args.out_args[1].size = sizeof(*outopen);
+	args.out_args[1].value = outopen;
+
+	if (flags & O_CREAT) {
+		err = get_create_ext(idmap, &args, dir, entry, mode);
+		if (err)
+			goto out_free;
+	} else {
+		/* Locked as for a lookup */
+		idmap = &invalid_mnt_idmap;
+		locked = fuse_lock_inode(dir);
+	}
+	epoch = atomic_read(&fc->epoch);
+	attr_version = fuse_get_attr_version(fc);
+	evict_ctr = fuse_get_evict_ctr(fc);
+	err = fuse_simple_idmap_request(idmap, fm, &args);
+	fuse_unlock_inode(dir, locked);
+	free_ext_value(&args);
+	if (err < 0) {
+		if (err == -ENOSYS) {
+			fc->no_open_atomic = 1;
+			err = 1;
+		} else if (err == -EEXIST) {
+			fuse_invalidate_entry(entry);
+		}
+		goto out_free;
+	}
+
+	open_size = args.out_args[1].size;
+	if (open_size && (outopen->open_flags & FOPEN_CREATED))
+		fuse_dir_changed(dir);
+	err = -EIO;
+	if (outentry.nodeid && (invalid_nodeid(outentry.nodeid) ||
+				fuse_invalid_attr(&outentry.attr)))
+		goto out_reject;
+	/* A zero nodeid: the name does not exist and nothing was opened */
+	if (!outentry.nodeid && (open_size || (flags & O_CREAT)))
+		goto out_reject;
+	/* Only a regular file is opened */
+	if (open_size && (open_size < FUSE_COMPAT_OPEN_OUT_SIZE ||
+			  !S_ISREG(outentry.attr.mode)))
+		goto out_reject;
+	if (outentry.nodeid) {
+		inode = fuse_iget(dir->i_sb, outentry.nodeid,
+				  outentry.generation, &outentry.attr,
+				  ATTR_TIMEOUT(&outentry), attr_version,
+				  evict_ctr);
+		err = -ENOMEM;
+		if (!inode)
+			goto out_reject;
+		fuse_advise_use_readdirplus(dir);
+	}
+	kfree(forget);
+
+	if (!open_size) {
+		fuse_file_free(ff);
+		res = d_splice_alias(inode, entry);
+		if (!IS_ERR(res)) {
+			fuse_dentry_set_epoch(res ?: entry, epoch);
+			fuse_change_entry_timeout(res ?: entry, &outentry);
+		}
+		return finish_no_open(file, res);
+	}
+
+	if (fuse_is_bad(inode)) {
+		fuse_open_atomic_release(ff, outentry.nodeid, open_size,
+					 inarg.flags);
+		iput(inode);
+		return -EIO;
+	}
+	if ((flags & O_CREAT) && (outopen->open_flags & FOPEN_CREATED))
+		file->f_mode |= FMODE_CREATED;
+	ff->fh = outopen->fh;
+	ff->nodeid = outentry.nodeid;
+	ff->open_flags = outopen->open_flags & ~FOPEN_CREATED;
+	d_splice_alias(inode, entry);
+	fuse_dentry_set_epoch(entry, epoch);
+	fuse_change_entry_timeout(entry, &outentry);
+
+	err = generic_file_open(inode, file);
+	if (!err) {
+		file->private_data = ff;
+		err = finish_open(file, entry, fuse_finish_open);
+	}
+	if (err) {
+		/* fput() releases a file that finish_open() opened */
+		if (!(file->f_mode & FMODE_OPENED))
+			fuse_sync_release(get_fuse_inode(inode), ff,
+					  inarg.flags & ~(O_CREAT | O_EXCL));
+	} else if (!(ff->open_flags & FOPEN_KEEP_CACHE) && !IS_DAX(inode)) {
+		invalidate_inode_pages2(inode->i_mapping);
+	}
+	return err;
+
+out_reject:
+	fuse_open_atomic_release(ff, outentry.nodeid, open_size,
+				 inarg.flags);
+	if (!invalid_nodeid(outentry.nodeid))
+		fuse_chan_queue_forget(fc->chan, forget, outentry.nodeid, 1);
+	else
+		kfree(forget);
+	return err;
+
+out_free:
+	fuse_file_free(ff);
+	kfree(forget);
+	return err;
+}
+
 static int fuse_mknod(struct mnt_idmap *, struct inode *, struct dentry *,
 		      umode_t, dev_t);
 static int fuse_atomic_open(struct inode *dir, struct dentry *entry,
@@ -951,6 +1130,20 @@ static int fuse_atomic_open(struct inode *dir, struct dentry *entry,
 	if (fuse_is_bad(dir))
 		return -EIO;
 
+	/*
+	 * With atomic_o_trunc, FUSE_OPEN truncates after a FUSE_LOOKUP.  O_EXCL
+	 * without O_CREAT, where the VFS may not create the file, needs the
+	 * FUSE_LOOKUP so that do_open() reports -EEXIST for an existing name.
+	 */
+	if (!fc->no_open_atomic &&
+	    !((file->f_flags & O_TRUNC) && fc->atomic_o_trunc) &&
+	    ((flags & O_CREAT) || (d_in_lookup(entry) && !(flags & O_EXCL)))) {
+		err = fuse_open_atomic(idmap, dir, entry, file, flags,
+				       mode | S_IFREG);
+		if (err <= 0)
+			return err;
+	}
+
 	if (d_in_lookup(entry)) {
 		struct dentry *res = fuse_lookup(dir, entry, 0);
 		if (res || d_really_is_positive(entry))
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index c91af283aef20..c680e106bf77a 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -50,6 +50,9 @@
 /** Number of dentries for each connection in the control filesystem */
 #define FUSE_CTL_NUM_DENTRIES 5
 
+/** Size of fuse_open_out without backing_id_64 */
+#define FUSE_COMPAT_OPEN_OUT_SIZE offsetofend(struct fuse_open_out, backing_id)
+
 /*
  * Dentries invalidation workqueue period, in seconds.  The value of this
  * parameter shall be >= FUSE_DENTRY_INVAL_FREQ_MIN seconds, or 0 (zero), in
@@ -617,6 +620,9 @@ struct fuse_conn {
 	/** @no_create: Is create not implemented by fs? */
 	unsigned no_create:1;
 
+	/** @no_open_atomic: Is FUSE_OPEN_ATOMIC not implemented by fs? */
+	unsigned no_open_atomic:1;
+
 	/** @no_bmap: Is bmap not implemented by fs? */
 	unsigned no_bmap:1;
 
diff --git a/fs/fuse/fuse_trace.h b/fs/fuse/fuse_trace.h
index 60baa10bbcb99..54d7a1891c382 100644
--- a/fs/fuse/fuse_trace.h
+++ b/fs/fuse/fuse_trace.h
@@ -58,6 +58,7 @@
 	EM( FUSE_SYNCFS,		"FUSE_SYNCFS")		\
 	EM( FUSE_TMPFILE,		"FUSE_TMPFILE")		\
 	EM( FUSE_STATX,			"FUSE_STATX")		\
+	EM( FUSE_OPEN_ATOMIC,		"FUSE_OPEN_ATOMIC")	\
 	EMe(CUSE_INIT,			"CUSE_INIT")
 
 /*
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index 616430a2973c6..2986b247db615 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -257,6 +257,9 @@
  *  - add backing_id_64 to fuse_open_out
  *  - add FUSE_NOTIFY_BACKING_MAP, fuse_notify_backing_map_out, fuse_extent
  *  - add FUSE_BACKING_MAP_CREATE, FUSE_BACKING_MAP_CYCLIC
+ *
+ *  7.48
+ *  - add FUSE_OPEN_ATOMIC and FOPEN_CREATED
  */
 
 #ifndef _LINUX_FUSE_H
@@ -292,7 +295,7 @@
 #define FUSE_KERNEL_VERSION 7
 
 /** Minor version number of this interface */
-#define FUSE_KERNEL_MINOR_VERSION 47
+#define FUSE_KERNEL_MINOR_VERSION 48
 
 /** The node ID of the root inode */
 #define FUSE_ROOT_ID 1
@@ -406,6 +409,7 @@ struct fuse_file_lock {
  *                           (FUSE_URING_ZERO_COPY) and the request carries page
  *                           payload. Otherwise reads/writes fall back to
  *                           copying.
+ * FOPEN_CREATED: FUSE_OPEN_ATOMIC created the file
  */
 #define FOPEN_DIRECT_IO		(1 << 0)
 #define FOPEN_KEEP_CACHE	(1 << 1)
@@ -416,6 +420,7 @@ struct fuse_file_lock {
 #define FOPEN_PARALLEL_DIRECT_WRITES	(1 << 6)
 #define FOPEN_PASSTHROUGH	(1 << 7)
 #define FOPEN_IO_URING_ZERO_COPY (1 << 8)
+#define FOPEN_CREATED		(1 << 9)
 
 /*
  * INIT request/reply flags
@@ -699,6 +704,19 @@ enum fuse_opcode {
 	FUSE_STATX		= 52,
 	FUSE_COPY_FILE_RANGE_64	= 53,
 
+	/*
+	 * FUSE_OPEN_ATOMIC looks up a name, creates it for O_CREAT, and opens
+	 * it. The request carries fuse_create_in, without O_TRUNC, and the
+	 * name. The reply is fuse_entry_out, followed by fuse_open_out if the
+	 * server opened the file, with FOPEN_CREATED if it created it. The
+	 * server opens an existing regular file, and returns the entry only
+	 * for other files, -EEXIST for an existing name with O_CREAT | O_EXCL,
+	 * and a zero nodeid for a missing name without O_CREAT. The kernel
+	 * checks the open after the reply and releases the file if the check
+	 * fails. After a -ENOSYS reply the kernel sends FUSE_LOOKUP instead.
+	 */
+	FUSE_OPEN_ATOMIC	= 54,
+
 	/* CUSE specific operations */
 	CUSE_INIT		= 4096,
 
-- 
2.50.1

