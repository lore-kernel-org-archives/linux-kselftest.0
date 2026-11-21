Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.42.203.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220225;
	b=wdlGFiyfdB1j5bFRRbvJArXwfZjg1NM8WcoBhnkky/bCXvx3C1zjj3Dq0JjgvVjFyq3z
	 5BguMR0EwIu+xh9gc7UqcDA3Uvf1Kh2oZw6WHAPWzIS07ZWxOYPeCjvK6GvLggTloLnEy
	 ZoELri/+d6MlV+K/roTMxxRdyKTwpNTUaCE5ya9rMFGbtwsj49h3GT28xE/zox77XSk0Q
	 JG2YHvbANTEO5wV276u69BMRqOLDWQ5RuFdwk0dweYlZuYP4ryiXcbL6vd91zAFTJKrT9
	 SAIRQPdOvRKLTVV9J0GmNUxj14VWP6FR4EFdCYODFO2CbdHS7V8bXi0tAH8a4QG5sng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220225;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=jvjh7chGUxkxSxjETwh7Soz3OAhwo5eqX1x1G41t1gU=;
	b=OP+LruMwvVDbJKL0a6fckjk3x82ndESrOmG632zXxPjkRIPUVBT4QOSmW4mtWEZQ80Si
	 C2ANcQerjzzsrW4cOAEzt5RSkYOuzv8vewqtiCQrqLvnZAd7209raQbC2AkREA7NbrWWg
	 7hjXH5doSJooKBz7IYxnw5TGLuw92ANJZpuOpiPPNgoQq9ldPk0+2nNrNmHPPdSBz4r7p
	 xWRQW7wpWcudFJytcyDzeQND/13lJYnUGB5LJ1KMpBVM+Qr84YUGzcQ8mVhbF/xxWyi44
	 UljTugyA3k479gjN1Pt78j2bm3hQG2/cxPj1D0lkzWN4jZzzPTZD7ODlbx8GcB7jTpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=VC7r5VLE;
	arc=none smtp.remote-ip=52.42.203.116
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.42.203.116])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3631A606A6A4
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 00:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3631A606A6A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=VC7r5VLE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1795220225; x=1826756225;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jvjh7chGUxkxSxjETwh7Soz3OAhwo5eqX1x1G41t1gU=;
  b=VC7r5VLE1qEPbKC+AJZeF+s+qNjJWcTlT99P1WmU6TM28i7gyGk2FdMx
   wfslbHbQTBcyJBfl44A44jbV938cFd+70QKYqjDH39raeYq9ztqaUUfF+
   ZPomzlBRRQ7ahOT8rW78S8AiyOHakRXuMTPLSbr2VAbK5eT9vOTnHQ4uZ
   zcIZrvCrH+ECN1YNgy0Wh3zhJq6CBcqf0OPEmConsaPRpxHjTnzxY+ikE
   K4mKSWatKHUG4plZb6MKutOUfxxSaEoKoJWrAyGxlGxxXTepAam/8DpWT
   3xyERFr1fq/MMgSBgIkhp/34AYJmqrYDscxfG+gG3nLzoRz/Qu0QDbZOp
   Q==;
X-CSE-ConnectionGUID: r2pihnN8SaajDptEpL62vA==
X-CSE-MsgGUID: iWtLTcqlQrG/A3uVbo7Mmg==
X-IronPort-AV: E=Sophos;i="6.27,223,1787011200"; 
   d="scan'208";a="34772223"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 00:17:04 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:19365]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.36.222:2525] with esmtp (Farcaster)
 id 55b1a733-7408-4ddd-89a6-e9346dcc7ddc; Sat, 21 Nov 2026 00:17:04 +0000 (UTC)
X-Farcaster-Flow-ID: 55b1a733-7408-4ddd-89a6-e9346dcc7ddc
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57;
 Sat, 21 Nov 2026 00:17:04 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57;
 Sat, 21 Nov 2026 00:17:03 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: <fuse-devel@lists.linux.dev>, <linux-kselftest@vger.kernel.org>, "Shuah
 Khan" <shuah@kernel.org>, Bernd Schubert <bernd@bsbernd.com>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>, NeilBrown <neil@brown.name>, Joanne Koong
	<joannelkoong@gmail.com>
Subject: [PATCH v9 2/3] fuse: add FUSE_OPEN_ATOMIC
Date: Sat, 21 Nov 2026 00:16:07 +0000
Message-ID: <20261121001608.996811-3-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261121001608.996811-1-jamz@amazon.com>
References: <20261121001608.996811-1-jamz@amazon.com>
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
X-ClientProxiedBy: EX19D031UWA002.ant.amazon.com (10.13.139.96) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Add FUSE_OPEN_ATOMIC, a request that combines FUSE_LOOKUP with FUSE_OPEN
or FUSE_CREATE. With this patch, the kernel sends it from
->atomic_open(), so that an open() of a name that is not in the dcache
needs one request instead of two. Returning -ENOSYS triggers fallback to
the old behavior, starting with the open() that received it.

This patch defines the request as struct fuse_open_atomic_in followed by
the name and, with O_CREAT, the extensions of FUSE_CREATE. The request
carries per-request flags (atomic_flags). A server must ignore
atomic_flags bits that it does not implement and must return the bits it
honored in the reply. This patch defines the reply as the fixed-size
struct fuse_open_atomic_out: the entry with its attributes as struct
fuse_statx, the flags FUSE_OPEN_ATOMIC_OPENED and
FUSE_OPEN_ATOMIC_CREATED, and fuse_open_out.

For an existing regular file, the server must either open it or return
only the entry, and for any other file type it must return only the
entry. For a missing name, the server must create and open a regular
file with O_CREAT, and return a zero nodeid or -ENOENT without O_CREAT.
With this patch, the kernel returns -EIO for any other reply.

With this patch, the VFS checks permissions after the reply, as it does
on other filesystems with ->atomic_open(), so the server can see
FUSE_OPEN_ATOMIC and FUSE_RELEASE for a file that open() then refuses.
The kernel clears O_TRUNC in the request and truncates with FUSE_SETATTR
after the permission check. An open without FOPEN_KEEP_CACHE drops the
cached pages when the reply arrives, as FUSE_CREATE does.

Not supported: O_DIRECTORY, O_EXCL without O_CREAT, O_TRUNC on a server
with FUSE_ATOMIC_O_TRUNC, and servers in no-open mode. These opens fall
back to FUSE_LOOKUP, FUSE_OPEN and FUSE_CREATE.

If the server opens an existing DAX file, the kernel releases it and
opens it again with FUSE_OPEN, which handles DAX.

Signed-off-by: Jimmy Zuber <jamz@amazon.com>
---
 fs/fuse/dir.c             | 281 ++++++++++++++++++++++++++++++++++++++
 fs/fuse/fuse_i.h          |   3 +
 fs/fuse/fuse_trace.h      |   1 +
 include/uapi/linux/fuse.h |  75 +++++++++-
 4 files changed, 359 insertions(+), 1 deletion(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index a719e3516e187..9c6b5fb709cb8 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -955,6 +955,280 @@ static void fuse_statx_to_attr(struct fuse_statx *sx, struct fuse_attr *attr)
 	attr->blksize = sx->blksize;
 }
 
+/* Release the server's open of a reply that the kernel drops, or free @ff */
+static void fuse_open_atomic_drop(struct fuse_file *ff,
+				  struct fuse_open_atomic_out *outarg,
+				  unsigned int flags)
+{
+	if (!(outarg->flags & FUSE_OPEN_ATOMIC_OPENED)) {
+		fuse_file_free(ff);
+		return;
+	}
+	ff->fh = outarg->open.fh;
+	ff->nodeid = outarg->nodeid;
+	fuse_sync_release(NULL, ff, flags & ~(O_CREAT | O_EXCL));
+}
+
+static bool fuse_open_atomic_valid(const struct fuse_open_atomic_in *inarg,
+				   struct fuse_open_atomic_out *outarg,
+				   struct fuse_attr *attr, unsigned int flags)
+{
+	bool opened = outarg->flags & FUSE_OPEN_ATOMIC_OPENED;
+	bool created = outarg->flags & FUSE_OPEN_ATOMIC_CREATED;
+
+	if ((outarg->flags &
+	     ~(FUSE_OPEN_ATOMIC_OPENED | FUSE_OPEN_ATOMIC_CREATED)) ||
+	    outarg->padding || outarg->reserved)
+		return false;
+	if (outarg->atomic_flags & ~inarg->atomic_flags)
+		return false;
+	if (created && (!opened || !(flags & O_CREAT)))
+		return false;
+	/* O_EXCL: the server creates the file or returns -EEXIST */
+	if ((flags & O_EXCL) && !created)
+		return false;
+	/* A zero nodeid: the name does not exist */
+	if (!outarg->nodeid)
+		return !opened && !(flags & O_CREAT);
+	if (invalid_nodeid(outarg->nodeid) || fuse_invalid_attr(attr) ||
+	    (outarg->stat.mask & STATX_BASIC_STATS) != STATX_BASIC_STATS)
+		return false;
+	return !opened || S_ISREG(attr->mode);
+}
+
+static int fuse_open_atomic_send(const struct mnt_idmap *idmap,
+				 struct inode *dir, struct dentry *entry,
+				 unsigned int flags, umode_t mode,
+				 struct fuse_open_atomic_in *inarg,
+				 struct fuse_open_atomic_out *outarg)
+{
+	struct fuse_mount *fm = get_fuse_mount(dir);
+	FUSE_ARGS(args);
+	bool locked = false;
+	int err;
+
+	/* The VFS truncates after may_open() */
+	inarg->flags = flags & ~(O_NOCTTY | O_TRUNC | __O_REGULAR);
+	inarg->mode = mode;
+	inarg->umask = current_umask();
+	inarg->sx_mask = STATX_BASIC_STATS;
+	args.opcode = FUSE_OPEN_ATOMIC;
+	args.nodeid = get_node_id(dir);
+	args.in_numargs = 2;
+	args.in_args[0].size = sizeof(*inarg);
+	args.in_args[0].value = inarg;
+	args.in_args[1].size = entry->d_name.len + 1;
+	args.in_args[1].value = entry->d_name.name;
+	args.out_numargs = 1;
+	args.out_args[0].size = sizeof(*outarg);
+	args.out_args[0].value = outarg;
+
+	if (flags & O_CREAT) {
+		err = get_create_ext(idmap, &args, dir, entry, mode);
+		if (err)
+			return err;
+	} else {
+		/* Locked as for FUSE_LOOKUP */
+		idmap = &invalid_mnt_idmap;
+		locked = fuse_lock_inode(dir);
+	}
+	err = fuse_simple_idmap_request(idmap, fm, &args);
+	fuse_unlock_inode(dir, locked);
+	free_ext_value(&args);
+	return err;
+}
+
+/* Instantiate @entry with @inode, without opening it */
+static int fuse_open_atomic_no_open(struct file *file, struct dentry *entry,
+				    struct inode *inode, int epoch,
+				    struct fuse_open_atomic_out *outarg)
+{
+	/*
+	 * @entry can be a hashed negative dentry (O_CREAT on a cached
+	 * name), which d_splice_alias() accepts.
+	 */
+	struct dentry *res = d_splice_alias(inode, entry);
+	u64 time = fuse_time_to_jiffies(outarg->entry_valid,
+					outarg->entry_valid_nsec);
+
+	if (!IS_ERR(res)) {
+		fuse_dentry_set_epoch(res ?: entry, epoch);
+		fuse_dentry_settime(res ?: entry, time);
+	}
+	return finish_no_open(file, res);
+}
+
+/* Open @file with the server's open from @outarg */
+static int fuse_open_atomic_finish(struct file *file, struct dentry *entry,
+				   struct inode *inode, int epoch,
+				   struct fuse_file *ff,
+				   struct fuse_open_atomic_out *outarg,
+				   unsigned int flags)
+{
+	u64 time = fuse_time_to_jiffies(outarg->entry_valid,
+					outarg->entry_valid_nsec);
+	int err;
+
+	if (outarg->flags & FUSE_OPEN_ATOMIC_CREATED)
+		file->f_mode |= FMODE_CREATED;
+	/* Stored for fuse_finish_open() */
+	ff->args->open_outarg = outarg->open;
+	ff->fh = outarg->open.fh;
+	ff->open_flags = outarg->open.open_flags;
+	ff->nodeid = outarg->nodeid;
+	/* NULL for a regular file */
+	d_splice_alias(inode, entry);
+	fuse_dentry_set_epoch(entry, epoch);
+	fuse_dentry_settime(entry, time);
+
+	err = generic_file_open(inode, file);
+	if (!err) {
+		file->private_data = ff;
+		err = finish_open(file, entry, fuse_finish_open);
+	}
+	if (!err) {
+		if (!(ff->open_flags & FOPEN_KEEP_CACHE))
+			invalidate_inode_pages2(inode->i_mapping);
+	} else if (!(file->f_mode & FMODE_OPENED)) {
+		/* fput() releases a file that finish_open() opened */
+		fuse_sync_release(get_fuse_inode(inode), ff,
+				  flags & ~(O_CREAT | O_EXCL));
+	}
+	return err;
+}
+
+/*
+ * Send FUSE_LOOKUP plus FUSE_OPEN or FUSE_CREATE as one FUSE_OPEN_ATOMIC
+ * request.  The VFS checks permissions after the reply.  Returns 1 after
+ * -ENOSYS; the caller then uses FUSE_LOOKUP.
+ */
+static int fuse_open_atomic(const struct mnt_idmap *idmap, struct inode *dir,
+			    struct dentry *entry, struct file *file,
+			    unsigned int flags, umode_t mode)
+{
+	struct fuse_mount *fm = get_fuse_mount(dir);
+	struct fuse_conn *fc = fm->fc;
+	struct fuse_open_atomic_in inarg = {};
+	struct fuse_open_atomic_out outarg = {};
+	struct fuse_forget_link *forget;
+	struct inode *inode = NULL;
+	struct fuse_attr attr;
+	u64 attr_version, evict_ctr;
+	struct fuse_file *ff;
+	bool created;
+	int epoch, err;
+
+	if (entry->d_name.len > fc->name_max)
+		return -ENAMETOOLONG;
+	forget = fuse_alloc_forget();
+	ff = fuse_file_alloc(fm, true);
+	err = -ENOMEM;
+	if (!forget || !ff)
+		goto out_free;
+	if (!fc->dont_mask)
+		mode &= ~current_umask();
+
+	epoch = atomic_read(&fc->epoch);
+	attr_version = fuse_get_attr_version(fc);
+	evict_ctr = fuse_get_evict_ctr(fc);
+	err = fuse_open_atomic_send(idmap, dir, entry, flags, mode, &inarg,
+				    &outarg);
+	if (err == -ENOSYS) {
+		fc->no_open_atomic = 1;
+		err = 1;
+	} else if (err == -EEXIST) {
+		fuse_invalidate_entry(entry);
+	}
+	if (err)
+		goto out_free;
+
+	fuse_statx_to_attr(&outarg.stat, &attr);
+	attr.flags = outarg.attr_flags;
+	err = -EIO;
+	if (!fuse_open_atomic_valid(&inarg, &outarg, &attr, flags))
+		goto out_reject;
+	created = outarg.flags & FUSE_OPEN_ATOMIC_CREATED;
+	if (created) {
+		/* As for FUSE_CREATE: a new file has current attributes */
+		attr_version = 0;
+		evict_ctr = 0;
+		fuse_dir_changed(dir);
+	}
+	if (outarg.nodeid) {
+		inode = fuse_iget(dir->i_sb, outarg.nodeid, outarg.generation,
+				  &attr, ATTR_TIMEOUT(&outarg), attr_version,
+				  evict_ctr);
+		err = -ENOMEM;
+		if (!inode)
+			goto out_reject;
+		kfree(forget);
+		forget = NULL;
+		err = -EIO;
+		if (fuse_is_bad(inode))
+			goto out_reject;
+		fuse_advise_use_readdirplus(dir);
+	}
+
+	/* An existing DAX file opens in ->open() */
+	if (!(outarg.flags & FUSE_OPEN_ATOMIC_OPENED) ||
+	    (!created && IS_DAX(inode))) {
+		kfree(forget);
+		fuse_open_atomic_drop(ff, &outarg, inarg.flags);
+		return fuse_open_atomic_no_open(file, entry, inode, epoch,
+						&outarg);
+	}
+	return fuse_open_atomic_finish(file, entry, inode, epoch, ff, &outarg,
+				       inarg.flags);
+
+out_reject:
+	fuse_open_atomic_drop(ff, &outarg, inarg.flags);
+	/* The server can have created the name: drop it and the dir attrs */
+	fuse_invalidate_entry(entry);
+	if (flags & O_CREAT)
+		fuse_dir_changed(dir);
+	iput(inode);
+	if (forget && outarg.nodeid)
+		fuse_chan_queue_forget(fc->chan, forget, outarg.nodeid, 1);
+	else
+		kfree(forget);
+	return err;
+
+out_free:
+	if (ff)
+		fuse_file_free(ff);
+	kfree(forget);
+	return err;
+}
+
+static bool fuse_use_open_atomic(struct fuse_conn *fc, struct dentry *entry,
+				 struct file *file, unsigned int flags)
+{
+	if (fc->no_open_atomic || fc->no_open)
+		return false;
+
+	/* With atomic_o_trunc, ->open() truncates, after may_open() */
+	if ((file->f_flags & O_TRUNC) && fc->atomic_o_trunc)
+		return false;
+
+	if (flags & O_CREAT)
+		return true;
+
+	/* Without O_CREAT, a dentry not in lookup is a valid negative dentry */
+	if (!d_in_lookup(entry))
+		return false;
+
+	/*
+	 * O_EXCL without O_CREAT can mean the VFS cleared O_CREAT: with
+	 * FUSE_LOOKUP, do_open() fails with -EEXIST and the server sees only
+	 * FUSE_LOOKUP.
+	 */
+	if (flags & O_EXCL)
+		return false;
+
+	/* The server opens only regular files in FUSE_OPEN_ATOMIC */
+	return !(flags & O_DIRECTORY);
+}
+
 static int fuse_mknod(const struct mnt_idmap *, struct inode *, struct dentry *,
 		      umode_t, dev_t);
 static int fuse_atomic_open(struct inode *dir, struct dentry *entry,
@@ -968,6 +1242,13 @@ static int fuse_atomic_open(struct inode *dir, struct dentry *entry,
 	if (fuse_is_bad(dir))
 		return -EIO;
 
+	if (fuse_use_open_atomic(fc, entry, file, flags)) {
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
index a033b0bc45762..abe24ebb6325b 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -618,6 +618,9 @@ struct fuse_conn {
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
index 616430a2973c6..c2f0699771c2c 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -257,6 +257,9 @@
  *  - add backing_id_64 to fuse_open_out
  *  - add FUSE_NOTIFY_BACKING_MAP, fuse_notify_backing_map_out, fuse_extent
  *  - add FUSE_BACKING_MAP_CREATE, FUSE_BACKING_MAP_CYCLIC
+ *
+ *  7.48
+ *  - add FUSE_OPEN_ATOMIC, fuse_open_atomic_in and fuse_open_atomic_out
  */
 
 #ifndef _LINUX_FUSE_H
@@ -292,7 +295,7 @@
 #define FUSE_KERNEL_VERSION 7
 
 /** Minor version number of this interface */
-#define FUSE_KERNEL_MINOR_VERSION 47
+#define FUSE_KERNEL_MINOR_VERSION 48
 
 /** The node ID of the root inode */
 #define FUSE_ROOT_ID 1
@@ -699,6 +702,12 @@ enum fuse_opcode {
 	FUSE_STATX		= 52,
 	FUSE_COPY_FILE_RANGE_64	= 53,
 
+	/*
+	 * FUSE_OPEN_ATOMIC is FUSE_LOOKUP plus FUSE_OPEN or FUSE_CREATE in one
+	 * request.  See struct fuse_open_atomic_in.
+	 */
+	FUSE_OPEN_ATOMIC	= 54,
+
 	/* CUSE specific operations */
 	CUSE_INIT		= 4096,
 
@@ -848,6 +857,70 @@ struct fuse_open_out {
 	uint64_t	backing_id_64;
 };
 
+/*
+ * FUSE_OPEN_ATOMIC request: fuse_open_atomic_in, then the name.  With
+ * O_CREAT, the extensions of FUSE_CREATE (security context, supplementary
+ * group) follow the name.
+ *
+ * @flags: open(2) flags, without O_TRUNC and O_NOCTTY
+ * @mode, @umask: as in fuse_create_in
+ * @open_flags: 0
+ * @atomic_flags: request variants.  The server must ignore the bits that
+ *	it does not implement, and must set the bits that it honored in the
+ *	atomic_flags of the reply.  A later atomic_flags bit can define a
+ *	longer reply.
+ * @sx_mask: STATX_... attributes that the kernel asks for
+ *
+ * The server must reply with fuse_open_atomic_out as follows:
+ * - O_CREAT | O_EXCL on an existing name: -EEXIST.
+ * - An existing regular file: open it and set FUSE_OPEN_ATOMIC_OPENED, or
+ *   return the entry only.
+ * - An existing file of another type: the entry only.
+ * - A missing name with O_CREAT: create and open a regular file, and set
+ *   FUSE_OPEN_ATOMIC_OPENED and FUSE_OPEN_ATOMIC_CREATED.
+ * - A missing name without O_CREAT: a zero nodeid, or -ENOENT.
+ *
+ * For a nonzero nodeid, @stat must contain at least STATX_BASIC_STATS, and
+ * the reply takes a lookup reference, as for FUSE_LOOKUP.  A file that the
+ * server opens gets FUSE_RELEASE, as for FUSE_CREATE.
+ */
+struct fuse_open_atomic_in {
+	uint32_t	flags;
+	uint32_t	mode;
+	uint32_t	umask;
+	uint32_t	open_flags;	/* FUSE_OPEN_... */
+	uint32_t	atomic_flags;
+	uint32_t	sx_mask;
+	uint64_t	reserved[2];
+};
+
+/*
+ * fuse_open_atomic_out flags
+ * FUSE_OPEN_ATOMIC_OPENED: the server opened the file, and @open is valid
+ * FUSE_OPEN_ATOMIC_CREATED: the server created the file, for O_CREAT
+ * The other bits, padding and reserved in fuse_open_atomic_out must be zero.
+ * @open is fuse_open_out as of protocol 7.48; later fields of fuse_open_out
+ * reach this reply only with an atomic_flags bit.
+ */
+#define FUSE_OPEN_ATOMIC_OPENED		(1 << 0)
+#define FUSE_OPEN_ATOMIC_CREATED	(1 << 1)
+
+struct fuse_open_atomic_out {
+	uint64_t	nodeid;
+	uint64_t	generation;
+	uint64_t	entry_valid;
+	uint64_t	attr_valid;
+	uint32_t	entry_valid_nsec;
+	uint32_t	attr_valid_nsec;
+	uint32_t	flags;		/* FUSE_OPEN_ATOMIC_OPENED, ... */
+	uint32_t	attr_flags;	/* FUSE_ATTR_... */
+	uint32_t	atomic_flags;	/* honored request atomic_flags */
+	uint32_t	padding;
+	uint64_t	reserved;
+	struct fuse_statx stat;
+	struct fuse_open_out open;
+};
+
 struct fuse_release_in {
 	uint64_t	fh;
 	uint32_t	flags;
-- 
2.50.1

