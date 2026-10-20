Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=50.112.246.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505853;
	b=Ssa95Tji74iFNDdUGTpFuV290MQJ+SDdUFvcBRKVDvCgPEDunE/07YaAFsZ7ipjWiD8a
	 W3/lOJmzLHr4qla2sVRBJo0VyyVfYeqvDKFT6xQMtaSzA00q/1RPo8xv0KJNZ88X2Gqbr
	 LyEDsYf6oPnLKfVmc7TRGdzpAbD1RWV0GfVEdwvxbK6lNDZ+aSCJPUDoyo7Lq5EP5SIFW
	 St1LozLptYeHVP2/Cq7Y4SosHuJcsLXHHBjEBlZjNfsTMwMSjMiu7j/EPcb0nT0Gwf23G
	 N20p2q2AlaVjZlfQ66zmD8CK1yLg9FB1MzRdxJqGl7xuWdZrooVhjX29qz+4bya72sA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505853;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=jY3euqs1gFgfmF9g9mBbXny89Z02VELSyxvLVpXXjI0=;
	b=xM0/rUy5O82P2j9lNepMiu2zHg5HJyhrGNN3hP1f+qtUcejihqaYKaB8zSTEQgLPan+v
	 WLuWRdoo75slBGGlsN7sHtj9Flz/qugaq897P+/Z++5LZcfS1UsTLNSp+iKnpP3rKS/Oh
	 YyNpUFm/R9wPxdcBuBZUs8dKY6fgHzANP31PANGpTGn95aIAuBcrYWRI+3b0TF1XfsU/e
	 CUGpAPvsRNBb7koNAAGn5+Sz0wj0NXKVr+ix255zVBpTDuWhXp4ShKKL1WD/QJQCwAZbI
	 vWMzH04mgH/rcVPN+IzIFgeas3rYtz8LEns3RwT3MyrhqpDiPifqcbjqcMBY90TXN4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=EFINs3yN;
	arc=none smtp.remote-ip=50.112.246.219
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5863760A4AD0
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 14:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5863760A4AD0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=EFINs3yN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1792505851; x=1824041851;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jY3euqs1gFgfmF9g9mBbXny89Z02VELSyxvLVpXXjI0=;
  b=EFINs3yNWqGS+Kxt6I6rzbgccrKXP5CQxSZpQ/z3TvL7Vvh/YMOLlZrD
   7bCvuKUwlhXjcEuMG7DArTMFuIfgsvKdvJTYDrbmTy7BQLlwTAwrqh/BV
   OLCsPgoi6XfzAqLcfveoa44HHGfDEUhu+u/t9/OYKxzHkq0qLlahKwwZD
   +OObleBCd5f/vwmrMo5rak8/iGYeAAcgu+8tuawqYsyad9/v/Q3ErwWHT
   T3nnjHod5xq3YDCrRsJ+sVKS4a4I1209CeJ5gocU4Kb7T3nVlAzJ+t0Yc
   xOKrAM40Zv+faZRhNebsKOwtcAN5I0IGp+IuYKWwpgXKDaptZxFZD9toy
   Q==;
X-CSE-ConnectionGUID: 1Jt/lIfoRSiwI6OXQBnaMA==
X-CSE-MsgGUID: A8JloJxsTVamRCwin87YVw==
X-IronPort-AV: E=Sophos;i="6.27,168,1787011200"; 
   d="scan'208";a="31523493"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 14:17:30 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:2124]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.12.154:2525] with esmtp (Farcaster)
 id 7035ec4c-3e7b-4b51-9ed7-f85f50fdf656; Tue, 20 Oct 2026 14:17:30 +0000 (UTC)
X-Farcaster-Flow-ID: 7035ec4c-3e7b-4b51-9ed7-f85f50fdf656
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 20 Oct 2026 14:17:30 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53;
 Tue, 20 Oct 2026 14:17:29 +0000
From: jamz <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: Jimmy Zuber <jamz@amazon.com>, <fuse-devel@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, Shuah Khan <shuah@kernel.org>, "Bernd
 Schubert" <bernd@bsbernd.com>, Jim Harris <jiharris@nvidia.com>, "Horst
 Birthelmer" <horst@birthelmer.de>, Luis Henriques <luis@igalia.com>,
	NeilBrown <neil@brown.name>
Subject: [PATCH 1/3] fuse: add FUSE_OPEN_ATOMIC
Date: Tue, 20 Oct 2026 14:16:45 +0000
Message-ID: <20261020141647.3271341-2-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261020141647.3271341-1-jamz@amazon.com>
References: <20261020141647.3271341-1-jamz@amazon.com>
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

From: Jimmy Zuber <jamz@amazon.com>

Add FUSE_OPEN_ATOMIC, allowing the kernel to skip LOOKUP to improve
performance. A server implementing FUSE_OPEN_ATOMIC will look up
the name, create it if O_CREAT is supplied, and open it in one request.

The server replies with the entry and the open file. If the file was
created, the server returns FOPEN_CREATED, or just the entry if it
was not created. If the name does not exist, the server returns a
zero nodeid, cacheable like a negative LOOKUP. An existing file
opened with O_TRUNC is returned unopened, so that truncation can be
performed after permissions are checked.

FMODE_CREATED is set only when the server reports that it created the
file. Therefore a file created by someone else between LOOKUP and
CREATE is no longer opened without a permission check.

A server without the request replies -ENOSYS, and the kernel falls back to
FUSE_LOOKUP, keeping backwards compatibility.

Assisted-by: Claude:claude-opus-5-5 [Claude-Code]
Signed-off-by: Jimmy Zuber <jamz@amazon.com>
---
 fs/fuse/dir.c             | 112 +++++++++++++++++++++++++++++++++++---
 fs/fuse/fuse_i.h          |   3 +
 include/uapi/linux/fuse.h |   8 ++-
 3 files changed, 113 insertions(+), 10 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index f48fafccce4b..34d2271eb248 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -815,7 +815,47 @@ static void free_ext_value(struct fuse_args *args)
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
+	d_drop(entry);
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
@@ -833,8 +873,12 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
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
@@ -878,26 +922,62 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 	outopenp = &ff->args->open_outarg;
 	args.out_args[1].size = sizeof(*outopenp);
 	args.out_args[1].value = outopenp;
+	/* FUSE_OPEN_ATOMIC leaves out fuse_open_out if it did not open */
+	args.out_argvar = atomic;
 
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
 
+	attr_version = fuse_get_attr_version(fm->fc);
+	evict_ctr = fuse_get_evict_ctr(fm->fc);
+
+	/* Without O_CREAT the parent is locked shared, as for a lookup */
+	locked = !create && fuse_lock_inode(dir);
 	err = fuse_simple_idmap_request(idmap, fm, &args);
+	fuse_unlock_inode(dir, locked);
 	free_ext_value(&args);
-	if (err)
+	if (err < 0)
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
+	    args.out_args[1].size != sizeof(*outopenp))
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
@@ -906,10 +986,14 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 		goto out_err;
 	}
 	kfree(forget);
-	d_instantiate(entry, inode);
+	if (d_in_lookup(entry))
+		d_splice_alias(inode, entry);
+	else
+		d_instantiate(entry, inode);
 	fuse_dentry_set_epoch(entry, epoch);
 	fuse_change_entry_timeout(entry, &outentry);
-	fuse_dir_changed(dir);
+	if (created)
+		fuse_dir_changed(dir);
 	err = generic_file_open(inode, file);
 	if (!err) {
 		file->private_data = ff;
@@ -947,6 +1031,16 @@ static int fuse_atomic_open(struct inode *dir, struct dentry *entry,
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
index 8546855386b5..ba6dc4c43a1f 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -589,6 +589,9 @@ struct fuse_conn {
 	/** @no_create: Is create not implemented by fs? */
 	unsigned no_create:1;
 
+	/** @no_open_atomic: Is open atomic not implemented by fs? */
+	unsigned no_open_atomic:1;
+
 	/** @no_bmap: Is bmap not implemented by fs? */
 	unsigned no_bmap:1;
 
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index 10a7f31c4bdf..745b686c468f 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -251,6 +251,9 @@
  *
  *  7.47
  *  - add FUSE_HAS_SYNCFS opt-in flag for privileged userspace servers
+ *
+ *  7.48
+ *  - add FUSE_OPEN_ATOMIC and FOPEN_CREATED
  */
 
 #ifndef _LINUX_FUSE_H
@@ -286,7 +289,7 @@
 #define FUSE_KERNEL_VERSION 7
 
 /** Minor version number of this interface */
-#define FUSE_KERNEL_MINOR_VERSION 47
+#define FUSE_KERNEL_MINOR_VERSION 48
 
 /** The node ID of the root inode */
 #define FUSE_ROOT_ID 1
@@ -400,6 +403,7 @@ struct fuse_file_lock {
  *                           (FUSE_URING_ZERO_COPY) and the request carries page
  *                           payload. Otherwise reads/writes fall back to
  *                           copying.
+ * FOPEN_CREATED: FUSE_OPEN_ATOMIC created the file
  */
 #define FOPEN_DIRECT_IO		(1 << 0)
 #define FOPEN_KEEP_CACHE	(1 << 1)
@@ -410,6 +414,7 @@ struct fuse_file_lock {
 #define FOPEN_PARALLEL_DIRECT_WRITES	(1 << 6)
 #define FOPEN_PASSTHROUGH	(1 << 7)
 #define FOPEN_IO_URING_ZERO_COPY (1 << 8)
+#define FOPEN_CREATED		(1 << 9)
 
 /**
  * INIT request/reply flags
@@ -690,6 +695,7 @@ enum fuse_opcode {
 	FUSE_TMPFILE		= 51,
 	FUSE_STATX		= 52,
 	FUSE_COPY_FILE_RANGE_64	= 53,
+	FUSE_OPEN_ATOMIC	= 54,
 
 	/* CUSE specific operations */
 	CUSE_INIT		= 4096,
-- 
2.50.1

