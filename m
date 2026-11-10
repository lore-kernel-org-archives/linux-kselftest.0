Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.13.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794325969;
	b=cILSq8GMWXEZO294TkxB6lmFOeNL2HQIFIJjxT8lgHSvQ3WqtWf9kJ1J6lM1kNwnI1lt
	 FCrjf6jxdZTxkyygiIfqqpnZn8ImcOXaLFOxQzW8IjE1MZk+ZfBqtRof3YxxadXp4X/CX
	 Jf7VrIldjekNbtL8/oITrL/rGYVoeiUQChuBjCJxT7+Lc+6AZKCCzGcRZGvqjTMAVDP45
	 s1S+P+OP06WsAv14lTcPGN/zkr6S5MYvYNpAedBhrGwSeEPA/FRAPjeeGqBguStk0+od6
	 7k+S0QBBxy6EYYe7Qxci4/e+ySgx5Hs26Zy9hIls+2TcK+jhNNgJz+eiOgOsx1aOn5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325969;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=WdM/Cz3nirkC9hL/nEfDIL/NBwMXXddW7QRGb0zjpYA=;
	b=bVouQucONc1dcuqcTYYoON//HYzqMArVSOl0chU7DpE+eKYxXX2YTCWaxOACX8DEpVM0
	 llulz0I8om1eeea5Jaa2POgBJ3suZmqXxjYQxu/P9E0HM+RKAksn22M+CbVDYOKtM5Yr5
	 COa5n2UPF9asethZ3zWL2JDJVNfcXttzfSUvuaL2ktUVfBeLYOFbbugjxBDkJuH6do2cr
	 kjAdQBPc4yWznEls9vRY7pSZs6RXgT/8PWpN1fUqquqzIPV9Wu1l/78UasQqrYhPKjjXP
	 wLjIKnZJ9UVZmPLRrM5GxyuOzYQpbWRDj9BQ4w3CEUDdtNqBNm5gClZdlJDMGpWJnbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=JiGRsfDn;
	arc=none smtp.remote-ip=52.13.214.179
Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2731F606A320
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 15:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2731F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=JiGRsfDn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794325969; x=1825861969;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WdM/Cz3nirkC9hL/nEfDIL/NBwMXXddW7QRGb0zjpYA=;
  b=JiGRsfDnFcoHYTFgkT3kbdaakhbUWK0oomO2lKZWDA/Gf+HWQXdIt2Y+
   eihnsAuB878V6qqN0C1qinXXYWWlNuhWvTSCfmYaX6Z9yNSq7ip7D7Y8E
   ogIgtibjTVZ2oIEFZSPC7mubX/ibn1wgQGNyL1WfQLkheVD7jSMx++cMP
   p1vxJjD3hai9GLPysKcMVDwyM1wEYlhTH7BmLWBLqWlhGOoOZpgAcwUDE
   SJ/2bnEm8YUbeyrxoFLcCSVaTLbok/lNoX+hn1HEc8G/kVXrxhj8n02ko
   vy+y0xjdmWQVBQeGBG5UUf3heBs0TU5JhKjVw87f9JAz+4G8EtJmOhspx
   w==;
X-CSE-ConnectionGUID: 81FB79FRTfWGzzi6Qjbc3A==
X-CSE-MsgGUID: qoxkwVU2RBSLVRR24b0fUg==
X-IronPort-AV: E=Sophos;i="6.27,206,1787011200"; 
   d="scan'208";a="33603344"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 15:52:48 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:22041]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.50.212:2525] with esmtp (Farcaster)
 id d535c481-8ad8-4769-ac95-cdc8dae23053; Tue, 10 Nov 2026 15:52:48 +0000 (UTC)
X-Farcaster-Flow-ID: d535c481-8ad8-4769-ac95-cdc8dae23053
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Tue, 10 Nov 2026 15:52:48 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Tue, 10 Nov 2026 15:52:47 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: <fuse-devel@lists.linux.dev>, <linux-kselftest@vger.kernel.org>, "Shuah
 Khan" <shuah@kernel.org>, Bernd Schubert <bernd@bsbernd.com>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>, NeilBrown <neil@brown.name>
Subject: [PATCH v7 1/2] fuse: add FUSE_OPEN_ATOMIC
Date: Tue, 10 Nov 2026 15:52:18 +0000
Message-ID: <20261110155219.2175318-2-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261110155219.2175318-1-jamz@amazon.com>
References: <20261110155219.2175318-1-jamz@amazon.com>
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
X-ClientProxiedBy: EX19D031UWC001.ant.amazon.com (10.13.139.241) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Add FUSE_OPEN_ATOMIC. FUSE_OPEN_ATOMIC is FUSE_LOOKUP plus FUSE_OPEN or
FUSE_CREATE in one request. With FUSE_OPEN_ATOMIC, the kernel opens a
name that is not in the dcache with one request to the server. This
greatly improves performance for file systems where the bottleneck is
calls between the kernel and the server. Servers that don't support
FUSE_OPEN_ATOMIC are handled gracefully.

After a -ENOSYS reply to FUSE_OPEN_ATOMIC, every open() on the
connection uses FUSE_LOOKUP, FUSE_OPEN and FUSE_CREATE, including the
open() that received -ENOSYS.

The kernel sends FUSE_OPEN_ATOMIC from ->atomic_open(). The VFS calls
->atomic_open() for a name that is not in the dcache, and for open()
with O_CREAT on a negative dentry. For a name with a valid positive
dentry, the kernel sends FUSE_OPEN. FUSE_OPEN_ATOMIC for a name with a
valid positive dentry would need a VFS change.

If the server opens an existing file, the VFS checks permissions after
the reply, as on other filesystems with ->atomic_open(). If open() fails
after a valid reply with fuse_open_out, the kernel sends FUSE_RELEASE.
With default_permissions, the server can receive FUSE_OPEN_ATOMIC and
FUSE_RELEASE for a file that the caller may not open.

The kernel clears O_TRUNC in fuse_create_in.flags, so that the server
truncates a file only after the VFS checks permissions. After the VFS
checks permissions, the kernel sends FUSE_SETATTR to truncate an
existing file. A server with FUSE_ATOMIC_O_TRUNC truncates the file in
FUSE_OPEN. For open() with O_TRUNC on a server with FUSE_ATOMIC_O_TRUNC,
the kernel sends FUSE_OPEN or FUSE_CREATE after the VFS checks
permissions, with FUSE_LOOKUP first for a name that is not in the
dcache.

The request contains fuse_create_in and the name. The reply contains
fuse_entry_out, and fuse_open_out if the server opened the file. The
server replies as follows:

- O_CREAT | O_EXCL on an existing name: the server returns -EEXIST.
- An existing regular file, with or without O_CREAT: the server can
  open the file and return fuse_open_out. The server can also return
  only fuse_entry_out, and the kernel sends FUSE_OPEN after the VFS
  checks permissions.
- An existing directory, symlink or special file: the server must
  return only fuse_entry_out. The kernel returns -EIO for fuse_open_out
  on any file except a regular file.
- A missing name with O_CREAT: the server creates a regular file, opens
  it, and sets FOPEN_CREATED.
- A missing name without O_CREAT: the server returns a zero nodeid. The
  kernel caches a negative dentry, as it does for FUSE_LOOKUP.

The server sets FOPEN_CREATED exactly when it created the file. For
FOPEN_CREATED, the kernel sets FMODE_CREATED, and do_open() passes an
acc_mode of 0 to may_open(), as for any file that open() creates.

For O_CREAT | O_EXCL, when the caller may not create the file, for
example on a read-only mount, the VFS clears O_CREAT and leaves O_EXCL.
For O_EXCL without O_CREAT, the kernel sends FUSE_LOOKUP. For an
existing name, do_open() returns -EEXIST, and the server receives only
FUSE_LOOKUP.

Signed-off-by: Jimmy Zuber <jamz@amazon.com>
---
 fs/fuse/dir.c             | 193 ++++++++++++++++++++++++++++++++++++++
 fs/fuse/fuse_i.h          |   6 ++
 fs/fuse/fuse_trace.h      |   1 +
 include/uapi/linux/fuse.h |  20 +++-
 4 files changed, 219 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 8a8177a178a20..b6862920f41bc 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -938,6 +938,185 @@ static int fuse_create_open(const struct mnt_idmap *idmap, struct inode *dir,
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
+ * Send FUSE_LOOKUP plus FUSE_OPEN or FUSE_CREATE as one FUSE_OPEN_ATOMIC
+ * request.  The server can open an existing regular file, or return only
+ * fuse_entry_out.  Without O_CREAT, a missing name gets a zero nodeid.
+ * The VFS checks permissions after the reply.  Returns 1 on -ENOSYS.
+ */
+static int fuse_open_atomic(const struct mnt_idmap *idmap, struct inode *dir,
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
+	/* The VFS truncates after may_open() */
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
+		/* Locked as for FUSE_LOOKUP */
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
 static int fuse_mknod(const struct mnt_idmap *, struct inode *, struct dentry *,
 		      umode_t, dev_t);
 static int fuse_atomic_open(struct inode *dir, struct dentry *entry,
@@ -951,6 +1130,20 @@ static int fuse_atomic_open(struct inode *dir, struct dentry *entry,
 	if (fuse_is_bad(dir))
 		return -EIO;
 
+	/*
+	 * With atomic_o_trunc, FUSE_OPEN truncates after a FUSE_LOOKUP.  O_EXCL
+	 * without O_CREAT can mean the VFS cleared O_CREAT: with FUSE_LOOKUP,
+	 * do_open() fails with -EEXIST and the server sees only FUSE_LOOKUP.
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
index a033b0bc45762..05c2da7f86670 100644
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
@@ -618,6 +621,9 @@ struct fuse_conn {
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
index 616430a2973c6..ae9b051c1cd80 100644
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
+ * FOPEN_CREATED: the server created the file for FUSE_OPEN_ATOMIC
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
+	 * FUSE_OPEN_ATOMIC is FUSE_LOOKUP plus FUSE_OPEN or FUSE_CREATE in one
+	 * request. The request is fuse_create_in, with O_TRUNC cleared, and the
+	 * name. The reply is fuse_entry_out, plus fuse_open_out if the server
+	 * opened the file. The server can open an existing regular file, and no
+	 * other file type. With O_CREAT, the server creates and opens a regular
+	 * file for a missing name and sets FOPEN_CREATED; an existing name with
+	 * O_EXCL gets -EEXIST. Without O_CREAT, a missing name gets a zero
+	 * nodeid. If open() fails after a valid reply with fuse_open_out, the
+	 * kernel sends FUSE_RELEASE.
+	 */
+	FUSE_OPEN_ATOMIC	= 54,
+
 	/* CUSE specific operations */
 	CUSE_INIT		= 4096,
 
-- 
2.50.1

