Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.1.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027952;
	b=T8P9Ck3m5ldfVD3T2FFE5uBW0BeLrXYvLOni/Fm6dGO4bN7qhEX1gSON64dj/zhnIvGd
	 lFp/8ob6wY7YqQuQ9zH/cf1HOmcmgQ6BEhDoqh0sF/MvI4vXnxMiFQWPHl9QnLhNbx2GD
	 J0w90XYd16IdbFmO14tlD9gHvNeIcKoKL9unRWgpR6bNi6t8jGtFTqXlcriG40gazSS5v
	 mhrfJ8AwhzCJLT5PVWWGd2Fj83uJxXLZig6p/DR9p+63bBP740giDnOTXCTgF75STvJU7
	 MeDt9FsX98YmczosZRVegQ1m9pHscnFAahqOCL+/EHYOMgX3bMSoydteWtv521xIvqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027952;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=vD/w7JdZjNBYs2IFMkqhYrBl+psbwx5kF85sFSu90cw=;
	b=Swlr240ofTlrtx6AjpjwlHVFl2Gkx6eEEXyFM6ZbXLGLZw+gHnm31tiuhVhC4dqFsOd1
	 5cJXNhCSfMiR9delkeaDc1VssSFQdc11C3C/94u1ky1WOGbvCMLAOLbaraz2FKfHoxDXZ
	 FDS2AowKZBwV8PmErLPb2/ysMV4EJgzjYeymeuNtEjpqkLRgMe4IIo8QZMRcp9yunBDxV
	 L6kL8etcXU6WAWcUN8Pee7mdLTM014I8vSuTGq82HmdSjup2ndnqPFxaG+jIYWjm2FHZs
	 f4uixDqZuAPbJPZIGzduUiB9KMf97YsWeqVtQL6H3o/KyRcLoaN4XkOPrSRLa8mhISA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=k5dPZUHj;
	arc=none smtp.remote-ip=44.246.1.125
Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D209606A331
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 15:19:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D209606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=k5dPZUHj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793027952; x=1824563952;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vD/w7JdZjNBYs2IFMkqhYrBl+psbwx5kF85sFSu90cw=;
  b=k5dPZUHj1PHu/79T1ktLvwDZj3hxdbuQV1FGomJKjH7XKy4iXrux13iK
   qcv6+xZZxrs/OtnH1ek+3nbJMydSJvhxIVwiyo0GjVBStcCWQUCouRVES
   9L8feVj/s//VP6+/CkiH2ot8F4AtwOXJgf+mixjLBw0uDcZq8wSldevbC
   k5y1wL1nkRoTW2PY8kDnYSxW+LJK/Y56xIGlzujID8JgPrGW4wvZZsPxQ
   NcQifD2QA7cqZW5G2AEnlu5ubEnBFPhGVqo5wIFbHBmUG9U7N26RIqUE1
   Q6Sr4wyUM2OnvO8w1+u9FB4XtFFq7eRGT+VqDCWHj8tFCCqTmvRTCKK6z
   g==;
X-CSE-ConnectionGUID: MBNe4Qv3RXehS33SOkgRQw==
X-CSE-MsgGUID: F/wR0Dg5SFqBFrxczrvrfw==
X-IronPort-AV: E=Sophos;i="6.27,179,1787011200"; 
   d="scan'208";a="32274030"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 15:19:11 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:12663]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.4.29:2525] with esmtp (Farcaster)
 id 4376ec57-7046-4499-986f-0d90463190cc; Mon, 26 Oct 2026 15:19:11 +0000 (UTC)
X-Farcaster-Flow-ID: 4376ec57-7046-4499-986f-0d90463190cc
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 26 Oct 2026 15:19:11 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 26 Oct 2026 15:19:10 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: <fuse-devel@lists.linux.dev>, <linux-kselftest@vger.kernel.org>, "Shuah
 Khan" <shuah@kernel.org>, Bernd Schubert <bernd@bsbernd.com>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>, NeilBrown <neil@brown.name>
Subject: [PATCH v2 1/3] fuse: add FUSE_OPEN_ATOMIC
Date: Mon, 26 Oct 2026 15:18:26 +0000
Message-ID: <20261026151828.562870-2-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261026151828.562870-1-jamz@amazon.com>
References: <20261026151828.562870-1-jamz@amazon.com>
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
X-ClientProxiedBy: EX19D031UWA001.ant.amazon.com (10.13.139.88) To
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
  checks permission with may_open() after the reply and releases the
  file if the check fails, as for other ->atomic_open filesystems. A
  server can instead return the entry only, to have the kernel check
  permission before FUSE_OPEN.
- Existing file with O_TRUNC, or not a regular file: the server returns
  the entry only, and the VFS checks permission and opens it, so that
  truncation is performed after permissions are checked.
- Name that does not exist, without O_CREAT: the server returns a zero
  nodeid, cacheable like a negative LOOKUP.

FMODE_CREATED is set only when the server reports that it created the
file. Therefore a file created by someone else between LOOKUP and
CREATE is no longer opened without a permission check.

A server without the request replies -ENOSYS, and the kernel falls back to
FUSE_LOOKUP, keeping backwards compatibility.

Assisted-by: Claude:claude-opus-5-5 [Claude-Code]
Signed-off-by: Jimmy Zuber <jamz@amazon.com>
---
 fs/fuse/dir.c             | 107 +++++++++++++++++++++++++++++++++++---
 fs/fuse/fuse_i.h          |   6 +++
 include/uapi/linux/fuse.h |   8 ++-
 3 files changed, 112 insertions(+), 9 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 28516a1760e24..f373d06ccdf17 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -815,7 +815,46 @@ static void free_ext_value(struct fuse_args *args)
 }
 
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
@@ -833,8 +872,12 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
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
@@ -880,25 +923,59 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
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
+		if ((created && !create) || (!created && trunc))
+			goto out_free_ff;
+		if (created)
+			file->f_mode |= FMODE_CREATED;
+	}
+
 	ff->fh = outopenp->fh;
 	ff->nodeid = outentry.nodeid;
 	ff->open_flags = outopenp->open_flags;
 	inode = fuse_iget(dir->i_sb, outentry.nodeid, outentry.generation,
-			  &outentry.attr, ATTR_TIMEOUT(&outentry), 0, 0);
+			  &outentry.attr, ATTR_TIMEOUT(&outentry),
+			  created ? 0 : attr_version, created ? 0 : evict_ctr);
 	if (!inode) {
 		flags &= ~(O_CREAT | O_EXCL | O_TRUNC);
 		fuse_sync_release(NULL, ff, flags);
@@ -907,10 +984,14 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 		goto out_err;
 	}
 	kfree(forget);
-	d_instantiate(entry, inode);
+	if (opcode == FUSE_TMPFILE)
+		d_instantiate(entry, inode);
+	else
+		d_splice_alias(inode, entry);
 	fuse_dentry_set_epoch(entry, epoch);
 	fuse_change_entry_timeout(entry, &outentry);
-	fuse_dir_changed(dir);
+	if (created)
+		fuse_dir_changed(dir);
 	err = generic_file_open(inode, file);
 	if (!err) {
 		file->private_data = ff;
@@ -948,6 +1029,16 @@ static int fuse_atomic_open(struct inode *dir, struct dentry *entry,
 	if (fuse_is_bad(dir))
 		return -EIO;
 
+	if (!fc->no_open_atomic && (d_in_lookup(entry) || (flags & O_CREAT))) {
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

