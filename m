Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.162.73.231
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793217944;
	b=TWm+0Vg4MqEsm+MsmMJ7TLbx0271WKsuwd8bN+Ckrgkwz5zeflqQCfQf7NhagUyL9Up2
	 outckCdiB5N2+I9Wc9xa62lppAzYUGXMeOYy6YUVXaVEh6z8Dr+cyAM+h32OtlPXpA4Kx
	 GjvyNlCepUNGk5gIRY0yelagCAog/GtBfg2IWczhsx6xWJIczqI+byiNjQOxbWzh++iNT
	 1XzdyaWv0YsZevdsUYgq++F6fh2gFYl7CATHOpPqFZ4WlSpoIgSyyoTXIvzKIwRqhiJGe
	 RXsmhQB19pae24FFdiFEyfvX/JzgwhPYYCRvDOiptn4hFUaPTkR7xgzAslrkzBnpHGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793217944;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=XD+IHi/7ltTG4Q7PZuecBlT+S8TjpdGZcBTt0yZUlZA=;
	b=tk6tW85vpaEC2eiGLPuxU1seSD9JFtmaDsNx/GJQN8U9Rb3ALJf/PPF20F8scYkyh2oH
	 3lmWsEcqNIAaj7G7AfO4SSACCFdCxqfuPfsPZJOTPWQGCx5j9da9K3BXBJqSgEsQ+btEb
	 zUcebrUG8/sRdYE4SD0kKlNpQDwPS6ho6S6GfSABD9zCSbDEo+O2cCz8L7N/vvdNQwHkZ
	 1SXe+F/Miy739QTjnj8y20ivov4xCL7Zee8SgIVv02KMqMmz7DkzC9/GowpnkIsoUjVjm
	 so35ZcnPncWyvZ/yS9jq0U4urpPquBbdKalo8nwwLv1QqWYX0Jux5V2E+45gVHCxq1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=apGjMA9C;
	arc=none smtp.remote-ip=35.162.73.231
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E41606A31D
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 20:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3E41606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=apGjMA9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793217943; x=1824753943;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XD+IHi/7ltTG4Q7PZuecBlT+S8TjpdGZcBTt0yZUlZA=;
  b=apGjMA9CHXkYJlxWl07N34h5Uu/Zl8QLmxhuwNPZaXSCWqmE5XkLxuIv
   FrkSoVOgFpvG0Wt/JzLacmLAglgsuv+JqNp7poTsY9AZgPeQzvtVfgKXQ
   MN13zo2abw5h7afr4p9YRjyykFRvdTWAuNEW9ZdSBmFLF+fR1BmCUpooz
   SSQa/fW79CWUBgBztTQZ6T77T0BnHR5SiQZBxniH/yO0j+I9dEgt/SMmJ
   Fa5OE9tQd68+yJ7BS542QNdZU3CJD7u90zIbNloW4LMVDmTtpvoRG4EvQ
   Cv4e4z4ncYHXjZuPzFCLnX9dbjZQdDPutGax9vix1kjbDUflU3dzJ81hQ
   g==;
X-CSE-ConnectionGUID: mbyB3zodTxyrDeuV6IQLtg==
X-CSE-MsgGUID: f9jBcGegQDaBrcbtmScaWQ==
X-IronPort-AV: E=Sophos;i="6.27,183,1787011200"; 
   d="scan'208";a="32312076"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 20:05:43 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:13666]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.44.23:2525] with esmtp (Farcaster)
 id f7c7a3ac-13ab-4805-9aaf-5d186f05e865; Wed, 28 Oct 2026 20:05:42 +0000 (UTC)
X-Farcaster-Flow-ID: f7c7a3ac-13ab-4805-9aaf-5d186f05e865
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 28 Oct 2026 20:05:42 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 28 Oct 2026 20:05:41 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: <fuse-devel@lists.linux.dev>, <linux-kselftest@vger.kernel.org>, "Shuah
 Khan" <shuah@kernel.org>, Bernd Schubert <bernd@bsbernd.com>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>, NeilBrown <neil@brown.name>
Subject: [PATCH v5 1/2] fuse: add FUSE_OPEN_ATOMIC
Date: Wed, 28 Oct 2026 20:04:58 +0000
Message-ID: <20261028200459.2922951-2-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261028200459.2922951-1-jamz@amazon.com>
References: <20261028200459.2922951-1-jamz@amazon.com>
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
X-ClientProxiedBy: EX19D031UWA003.ant.amazon.com (10.13.139.47) To
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
where FUSE_OPEN truncates, an O_TRUNC open keeps FUSE_LOOKUP.

Assisted-by: Claude:claude-opus-5-5 [Claude-Code]
Signed-off-by: Jimmy Zuber <jamz@amazon.com>
---
 fs/fuse/dir.c             | 185 ++++++++++++++++++++++++++++++++++++++
 fs/fuse/fuse_i.h          |   6 ++
 fs/fuse/fuse_trace.h      |   1 +
 include/uapi/linux/fuse.h |  20 ++++-
 4 files changed, 211 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 4c64a4f812395..99014ac82ce49 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -938,6 +938,182 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
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
+	if (open_size < FUSE_COMPAT_OPEN_OUT_SIZE ||
+	    !S_ISREG(inode->i_mode) || fuse_is_bad(inode)) {
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
@@ -951,6 +1127,15 @@ static int fuse_atomic_open(struct inode *dir, struct dentry *entry,
 	if (fuse_is_bad(dir))
 		return -EIO;
 
+	/* With atomic_o_trunc, FUSE_OPEN truncates after a FUSE_LOOKUP */
+	if (!fc->no_open_atomic && !((flags & O_TRUNC) && fc->atomic_o_trunc) &&
+	    (d_in_lookup(entry) || (flags & O_CREAT))) {
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

