Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.68.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793053042;
	b=TX2ZVflEZlIzILnszSQGl7jIICxl+HupgYUChbi9PZCuE5+0OHDCXH8Q93N4Sxz9hv7g
	 i/xXfAzK10dTVx085XlxXX079EC25YwzVuVd5Z41QQTlASy8vBz+RdO4+esCXBGXCe5JO
	 mxFYjI+Gmig/+kZ1YaNknhMj3lfo6t/SRHYfhpkRN5ev5ELXF4t75VrHlbVG07VM5t52g
	 MMHeL8+M2O5+zqlqaxNjuJV4pl1uGI+JF8GuB3+YRVJBSBLKhbvxq1lvaC9gV5nqiTuO5
	 dJbDMcf6jHwOl0nbImoE+W449tTaYTjb0e8tFKic1fuumOZqkdrtVIOb2tenWMFbxEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793053042;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=X+pEQZYY35DoRlcmdSHssMl9saAcEF7c7LSxOGKtzt0=;
	b=O3NAC7ozFfD4yphxwR2zJlXz9QooqOi/qG+F4I984J+E3MYxki82mSJMcjqldmxmIdHm
	 3NnCQDH3iu3w7vvhjGzXuRTsMX95NSuUI60sgtzxWDKmc1AbwbvwNVMDCdwBK2OePLF9v
	 6SGuWPMYs6xsisDwNCFzKASPCYlmmsLlgAwKf6qELqQjVT8VEhxmztE+rlR5M9dIL7JEO
	 VSUtQ6Vd+hy9WGarwhFqvvfe2X3ZKwxqwxuqZC6Bw3ysc+xpYw3n1FBdx15YtBfRvA+Ja
	 gQBAeuifWsvS773jUQEtANhQoi99QthDBqn9HKCqACwHXs//jgv2Qb6IW13f9fOtt3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=KdZ76Zx+;
	arc=none smtp.remote-ip=44.246.68.102
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CD6606A31A
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 22:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3CD6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=KdZ76Zx+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793053041; x=1824589041;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X+pEQZYY35DoRlcmdSHssMl9saAcEF7c7LSxOGKtzt0=;
  b=KdZ76Zx+3p9DrigD7oToS3z9ta4TZ6MzNzS2SzP1vNbc+tcfXduM86R+
   CIR0ywYOuz1IBbv/YA2z1bjMDsettwecpBbLa+q+zBdhjrsfY0CFGONVp
   okURjxsCHylLR6AMhuFmRy/KiPuSNQ/TBxs9sK0YuNSMoiuPmfDNUX3jP
   sQK3NCIcx7H7Zx7A8v1y2BR+Yv4pbTPvEmL3YUH5yIJgjD8NQKMb73Jg1
   +5stMPALQC4u+dYDTjFsJLeweITEMIqWMN+vHApjE96+Dtq5IuIapI2Ks
   S443c6AYDA7qyEV+WioFmU0ehOBypP14vX5snRwFV8v48eVXOupHX2mDn
   g==;
X-CSE-ConnectionGUID: J8wTylQfSOezh7qzpD1mIg==
X-CSE-MsgGUID: YbrfRkYxQ+OVrSjL9rvI2g==
X-IronPort-AV: E=Sophos;i="6.27,180,1787011200"; 
   d="scan'208";a="32217372"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 22:17:21 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:22041]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.165:2525] with esmtp (Farcaster)
 id f7d577e0-6d43-4851-a328-ad4b969743d0; Mon, 26 Oct 2026 22:17:21 +0000 (UTC)
X-Farcaster-Flow-ID: f7d577e0-6d43-4851-a328-ad4b969743d0
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 26 Oct 2026 22:17:20 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 26 Oct 2026 22:17:19 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: <fuse-devel@lists.linux.dev>, <linux-kselftest@vger.kernel.org>, "Shuah
 Khan" <shuah@kernel.org>, Bernd Schubert <bernd@bsbernd.com>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>, NeilBrown <neil@brown.name>
Subject: [PATCH v4 1/3] fuse: add FUSE_OPEN_ATOMIC
Date: Mon, 26 Oct 2026 22:16:37 +0000
Message-ID: <20261026221639.628325-2-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261026221639.628325-1-jamz@amazon.com>
References: <20261026221639.628325-1-jamz@amazon.com>
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
X-ClientProxiedBy: EX19D031UWA004.ant.amazon.com (10.13.139.19) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Add FUSE_OPEN_ATOMIC, allowing the kernel to skip LOOKUP to improve
performance. A server implementing FUSE_OPEN_ATOMIC will look up
the name, create it if O_CREAT is supplied, and open it in one request.

The server replies with the entry and, if it opened the file, the open
file:

- New name with O_CREAT: the server creates and opens the file and sets
  FOPEN_CREATED. The kernel checks write permission on the parent before
  sending the request.
- Existing regular file without O_TRUNC: the server opens it. The kernel
  checks permission after the reply and releases the file if the check
  fails, as for other ->atomic_open filesystems. With
  default_permissions, it checks the attributes in the reply before it
  opens the file itself. A server can instead return the entry only, to
  have the kernel check permission before FUSE_OPEN.
- Existing file with O_TRUNC, or not a regular file: the server returns
  the entry only, and the VFS checks permission and opens it, so that
  truncation is performed after permissions are checked.
- Name that does not exist, without O_CREAT: the server returns a zero
  nodeid, cacheable like a negative LOOKUP.

FMODE_CREATED is set only when the server reports that it created the
file. Therefore a file created by someone else between LOOKUP and
CREATE is no longer opened without a permission check.

If the VFS dropped O_CREAT or O_TRUNC because the open cannot create or
truncate, the kernel sends FUSE_LOOKUP and lets the VFS report the error.

A server without the request replies -ENOSYS, and the kernel falls back to
FUSE_LOOKUP, keeping backwards compatibility.

Assisted-by: Claude:claude-opus-5-5 [Claude-Code]
Signed-off-by: Jimmy Zuber <jamz@amazon.com>
---
 fs/fuse/dir.c             | 179 +++++++++++++++++++++++++++++++++++---
 fs/fuse/fuse_i.h          |   6 ++
 include/uapi/linux/fuse.h |   8 +-
 3 files changed, 178 insertions(+), 15 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 4c64a4f812395..50dd6a07cc067 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -814,8 +814,79 @@ static void free_ext_value(struct fuse_args *args)
 		kfree(args->in_args[args->ext_idx].value);
 }
 
+static int fuse_perm_getattr(struct inode *inode, int mask);
+
+/*
+ * Check the open against attributes the server just returned, with the mask
+ * do_open() passes to may_open().  As in fuse_permission(), a denial
+ * refreshes the attributes and checks again.  may_open() still runs the full
+ * check.
+ */
+static int fuse_may_open(struct file *file, struct inode *inode)
+{
+	struct mnt_idmap *idmap = file_mnt_idmap(file);
+	int mask = MAY_OPEN;
+	int err;
+
+	if (file->f_flags & __FMODE_EXEC) {
+		mask |= MAY_EXEC;
+	} else {
+		mask |= ACC_MODE(file->f_flags);
+		if (file->f_flags & O_TRUNC)
+			mask |= MAY_WRITE;
+		if (file->f_flags & O_APPEND)
+			mask |= MAY_APPEND;
+	}
+	err = generic_permission(idmap, inode, mask);
+	if (err == -EACCES) {
+		err = fuse_perm_getattr(inode, mask);
+		if (!err)
+			err = generic_permission(idmap, inode, mask);
+	}
+	return err;
+}
+
 /*
- * Atomic create+open operation
+ * FUSE_OPEN_ATOMIC found an existing name and left the open to the VFS.  A
+ * zero nodeid means the name does not exist.
+ */
+static int fuse_open_atomic_found(struct inode *dir, struct dentry *entry,
+				  struct file *file,
+				  struct fuse_entry_out *outarg,
+				  struct fuse_forget_link *forget, int epoch,
+				  u64 attr_version, u64 evict_ctr)
+{
+	struct fuse_conn *fc = get_fuse_conn(dir);
+	struct inode *inode = NULL;
+	struct dentry *res;
+
+	if (outarg->nodeid) {
+		inode = fuse_iget(dir->i_sb, outarg->nodeid, outarg->generation,
+				  &outarg->attr, ATTR_TIMEOUT(outarg),
+				  attr_version, evict_ctr);
+		if (!inode) {
+			fuse_chan_queue_forget(fc->chan, forget,
+					       outarg->nodeid, 1);
+			return -ENOMEM;
+		}
+	}
+	kfree(forget);
+	if (inode && get_node_id(inode) == FUSE_ROOT_ID) {
+		iput(inode);
+		return -EIO;
+	}
+
+	res = d_splice_alias(inode, entry);
+	if (!IS_ERR(res)) {
+		fuse_dentry_set_epoch(res ?: entry, epoch);
+		fuse_change_entry_timeout(res ?: entry, outarg);
+	}
+	return finish_no_open(file, res);
+}
+
+/*
+ * Atomic create+open operation, or lookup with optional create and open for
+ * FUSE_OPEN_ATOMIC
  *
  * If the filesystem doesn't support this, then fall back to separate
  * 'mknod' + 'open' requests.
@@ -833,8 +904,12 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 	struct fuse_entry_out outentry;
 	struct fuse_inode *fi;
 	struct fuse_file *ff;
+	u64 attr_version, evict_ctr;
 	int epoch, err;
 	bool trunc = flags & O_TRUNC;
+	bool atomic = opcode == FUSE_OPEN_ATOMIC;
+	bool create = !atomic || (flags & O_CREAT);
+	bool locked, created;
 
 	/* Userspace expects S_IFREG in create mode */
 	BUG_ON((mode & S_IFMT) != S_IFREG);
@@ -880,25 +955,59 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 	args.out_args[1].size = sizeof(*outopenp);
 	args.out_args[1].value = outopenp;
 
-	err = get_create_ext(idmap, &args, dir, entry, mode);
-	if (err)
-		goto out_free_ff;
+	if (create) {
+		err = get_create_ext(idmap, &args, dir, entry, mode);
+		if (err)
+			goto out_free_ff;
+	} else {
+		idmap = &invalid_mnt_idmap;
+	}
+
+	attr_version = fuse_get_attr_version(fm->fc);
+	evict_ctr = fuse_get_evict_ctr(fm->fc);
 
+	/* Without O_CREAT the parent is locked shared, as for a lookup */
+	locked = !create && fuse_lock_inode(dir);
 	err = fuse_simple_idmap_request(idmap, fm, &args);
+	fuse_unlock_inode(dir, locked);
 	free_ext_value(&args);
 	if (err < 0)
 		goto out_free_ff;
 
 	err = -EIO;
+	if (atomic && !args.out_args[1].size) {
+		/* A zero nodeid: the name does not exist and was not created */
+		if (!outentry.nodeid && create)
+			goto out_free_ff;
+		if (outentry.nodeid && (invalid_nodeid(outentry.nodeid) ||
+					fuse_invalid_attr(&outentry.attr)))
+			goto out_free_ff;
+		fuse_file_free(ff);
+		return fuse_open_atomic_found(dir, entry, file, &outentry,
+					      forget, epoch, attr_version,
+					      evict_ctr);
+	}
+
 	if (!S_ISREG(outentry.attr.mode) || invalid_nodeid(outentry.nodeid) ||
-	    fuse_invalid_attr(&outentry.attr))
+	    fuse_invalid_attr(&outentry.attr) ||
+	    args.out_args[1].size < FUSE_COMPAT_OPEN_OUT_SIZE)
 		goto out_free_ff;
 
+	created = !atomic || (outopenp->open_flags & FOPEN_CREATED);
+	if (atomic) {
+		/* Only O_CREAT creates; O_TRUNC opens are left to the VFS */
+		if ((created && !create) ||
+		    (!created && (trunc || (flags & O_EXCL))))
+			goto out_free_ff;
+		if (created)
+			file->f_mode |= FMODE_CREATED;
+	}
+
 	ff->fh = outopenp->fh;
 	ff->nodeid = outentry.nodeid;
-	ff->open_flags = outopenp->open_flags;
 	inode = fuse_iget(dir->i_sb, outentry.nodeid, outentry.generation,
-			  &outentry.attr, ATTR_TIMEOUT(&outentry), 0, 0);
+			  &outentry.attr, ATTR_TIMEOUT(&outentry),
+			  created ? 0 : attr_version, created ? 0 : evict_ctr);
 	if (!inode) {
 		flags &= ~(O_CREAT | O_EXCL | O_TRUNC);
 		fuse_sync_release(NULL, ff, flags);
@@ -907,29 +1016,46 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 		goto out_err;
 	}
 	kfree(forget);
-	d_instantiate(entry, inode);
+	ff->open_flags = outopenp->open_flags & ~FOPEN_CREATED;
+	fi = get_fuse_inode(inode);
+	err = -EIO;
+	if (!S_ISREG(inode->i_mode) || fuse_is_bad(inode))
+		goto out_release;
+	if (opcode == FUSE_TMPFILE)
+		d_instantiate(entry, inode);
+	else
+		d_splice_alias(inode, entry);
 	fuse_dentry_set_epoch(entry, epoch);
 	fuse_change_entry_timeout(entry, &outentry);
-	fuse_dir_changed(dir);
-	err = generic_file_open(inode, file);
+	if (created)
+		fuse_dir_changed(dir);
+	err = 0;
+	/* Check an existing file before the VFS acts on the open */
+	if (!created && fm->fc->default_permissions)
+		err = fuse_may_open(file, inode);
+	if (!err)
+		err = generic_file_open(inode, file);
 	if (!err) {
 		file->private_data = ff;
 		err = finish_open(file, entry, fuse_finish_open);
 	}
 	if (err) {
 		/* fput() releases a file that finish_open() opened */
-		if (!(file->f_mode & FMODE_OPENED)) {
-			fi = get_fuse_inode(inode);
+		if (!(file->f_mode & FMODE_OPENED))
 			fuse_sync_release(fi, ff, flags);
-		}
 	} else {
 		if (fm->fc->atomic_o_trunc && trunc)
 			truncate_pagecache(inode, 0);
-		else if (!(ff->open_flags & FOPEN_KEEP_CACHE))
+		else if (!(ff->open_flags & FOPEN_KEEP_CACHE) && !IS_DAX(inode))
 			invalidate_inode_pages2(inode->i_mapping);
 	}
 	return err;
 
+out_release:
+	fuse_sync_release(fi, ff, flags);
+	iput(inode);
+	return err;
+
 out_free_ff:
 	fuse_file_free(ff);
 out_put_forget_req:
@@ -938,6 +1064,18 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 	return err;
 }
 
+/*
+ * lookup_open() clears O_CREAT, and O_TRUNC without O_EXCL, when the open
+ * cannot create or truncate; do_open() then reports the error.
+ */
+static bool fuse_open_flags_dropped(struct file *file, unsigned int flags)
+{
+	unsigned int dropped = file->f_flags & ~flags;
+
+	return (dropped & O_CREAT) ||
+	       ((dropped & O_TRUNC) && !(flags & O_EXCL));
+}
+
 static int fuse_mknod(struct mnt_idmap *, struct inode *, struct dentry *,
 		      umode_t, dev_t);
 static int fuse_atomic_open(struct inode *dir, struct dentry *entry,
@@ -951,6 +1089,19 @@ static int fuse_atomic_open(struct inode *dir, struct dentry *entry,
 	if (fuse_is_bad(dir))
 		return -EIO;
 
+	if (!fc->no_open_atomic && !fuse_open_flags_dropped(file, flags) &&
+	    (d_in_lookup(entry) || (flags & O_CREAT))) {
+		if (entry->d_name.len > fc->name_max)
+			return -ENAMETOOLONG;
+		err = fuse_create_open(idmap, dir, entry, file, flags,
+				       mode | S_IFREG, FUSE_OPEN_ATOMIC);
+		if (err == -EEXIST)
+			fuse_invalidate_entry(entry);
+		if (err != -ENOSYS)
+			return err;
+		fc->no_open_atomic = 1;
+	}
+
 	if (d_in_lookup(entry)) {
 		struct dentry *res = fuse_lookup(dir, entry, 0);
 		if (res || d_really_is_positive(entry))
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index c91af283aef20..0c7874c5da72b 100644
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
 
+	/** @no_open_atomic: Is open atomic not implemented by fs? */
+	unsigned no_open_atomic:1;
+
 	/** @no_bmap: Is bmap not implemented by fs? */
 	unsigned no_bmap:1;
 
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index 616430a2973c6..1fccd4f2f3921 100644
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
@@ -698,6 +703,7 @@ enum fuse_opcode {
 	FUSE_TMPFILE		= 51,
 	FUSE_STATX		= 52,
 	FUSE_COPY_FILE_RANGE_64	= 53,
+	FUSE_OPEN_ATOMIC	= 54,
 
 	/* CUSE specific operations */
 	CUSE_INIT		= 4096,
-- 
2.50.1

