Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.42.203.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793053071;
	b=lrF0O1YuuGSiL4WZCYaMzwD1441nocW3ianMBNUCXM8UnozkZaYZ/kudDIwC15TrJ9MX
	 tUPXcNrVbyDjBLjOqBnQouIN2Rs5t31z+HcAcniTN7q6WMkUFQh58f1bmoq4s6Yf0pPbF
	 FUgUbPOs8VZdJAMV01/lfV//oePspwKdQk3Kvg+7pnz/JnnAFVKqaeH+9x9aHEtdE5cJo
	 Xj5ooI4uoCZkxmpeUuRlKYR3iLKG54UMZ6aSnkihZYVEeVrdW/9bVJKo6+jcgWbGv4vzD
	 2jSANxxtp2ZzBnBIhl26tjtKryVFCMFv1oq8+v/FLnjmh9cTLJuIMCiTkOv+z9dRTiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793053071;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=e60N3o3p8/6jUl/4VBgOOi9/+yeyNCS1TNRZ6IVpZtQ=;
	b=sPQXTAjZTBmIqaiKjLuFLIMw2NdsBiYpCiUqBDFR1NErCIxPcTjHfjom9RVFqV8dfQM7
	 Ph/JJ6JkwvRBdO8hql24VOsftf0I80JM9hSAr/q78mfZOa1HNmS52PsWp1v2XHdhRQ6M0
	 T8IiCuCDAszmI8jDJwORfa5fBcMkiuW5t8zyTFgYCDzh06XoIrPVufnBXpLjw6DG58m/X
	 q9mGNFteRIKZ6i2uxqbcGUoTJB4OUpTf3Lp+wvz3Ch1OxcSE7ZcyIsVaX8xpMg1e3sFvl
	 wnvu5/7T+eatWkcfdYwpQviETbO9GoyOnvsbMiIlNY4wLcx9OHg437Xfo6N8vbBcw5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=jPJrK6qF;
	arc=none smtp.remote-ip=52.42.203.116
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.42.203.116])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641CB606A31A
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 22:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 641CB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=jPJrK6qF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793053070; x=1824589070;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e60N3o3p8/6jUl/4VBgOOi9/+yeyNCS1TNRZ6IVpZtQ=;
  b=jPJrK6qF4Wwbmjl7HnRnn/9SPDfnhH4DcS8Hr1xFe/r2lF7nOHPk0iVj
   WQKZJkRbxQ95rwU4BfpVMMVIWZBfE+sB1TcvP6bYFYKR36LHOgIqrXBoD
   QG9nGMlp3vG6fpQPZg+n6dc36v0Ecw7mcCDti/1cBhpCz9vg9GVEFnPkA
   Xa6YUc5JJLeiIySCIzaWVXo0updZwLqJmtk5zQkEcYEQJqh6oFStmCkuU
   GkfHxxxvdliQyT9GZkt5DohrqxF8J53G6exwT4ijS2Wokzoc8gzMOsNbN
   ILMpz/6MX0HJzcKbWqvzDlP/bpHlqYT/EHT2945ub+Gduo+3TbD72OChx
   w==;
X-CSE-ConnectionGUID: AOxwW2t7Se6PnZhTJqtUjA==
X-CSE-MsgGUID: eIQ/787OQ9ep1enuyh45Yw==
X-IronPort-AV: E=Sophos;i="6.27,180,1787011200"; 
   d="scan'208";a="32334709"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 22:17:49 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:22019]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.4.136:2525] with esmtp (Farcaster)
 id dbfd637e-6639-4918-a5fa-b70661b9b944; Mon, 26 Oct 2026 22:17:49 +0000 (UTC)
X-Farcaster-Flow-ID: dbfd637e-6639-4918-a5fa-b70661b9b944
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 26 Oct 2026 22:17:49 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 26 Oct 2026 22:17:48 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: <fuse-devel@lists.linux.dev>, <linux-kselftest@vger.kernel.org>, "Shuah
 Khan" <shuah@kernel.org>, Bernd Schubert <bernd@bsbernd.com>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>, NeilBrown <neil@brown.name>
Subject: [PATCH v4 2/3] fuse: open cached files with FUSE_OPEN_ATOMIC
Date: Mon, 26 Oct 2026 22:16:38 +0000
Message-ID: <20261026221639.628325-3-jamz@amazon.com>
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
X-ClientProxiedBy: EX19D031UWA001.ant.amazon.com (10.13.139.88) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

When the server implements FUSE_OPEN_ATOMIC, skip LOOKUP for a
regular file being opened, opening it by name from fuse_open() instead.
If the name now refers to a different file or to nothing, drop the
dentry and return -EOPENSTALE, so that the VFS looks the name up again.
A matching reply refreshes the attributes and the entry timeout.

The LOOKUP is still sent for directories, for O_CREAT opens, and, with
default_permissions, when the cached attributes have expired, since
may_open() checks those attributes before fuse_open() runs. After
FUSE_OPEN_ATOMIC, fuse_open() checks permission again with the
attributes in the reply.

A reopen that does not look up the name, for example through
/proc/self/fd, also sends FUSE_OPEN_ATOMIC. If the name has changed,
the VFS retries and the retry opens the file by its nodeid.

If the server replies -ENOSYS, fuse_open() sends the skipped LOOKUP
itself.

Assisted-by: Claude:claude-opus-5-5 [Claude-Code]
Signed-off-by: Jimmy Zuber <jamz@amazon.com>
---
 fs/fuse/dir.c    | 348 +++++++++++++++++++++++++++++++++++++++--------
 fs/fuse/file.c   |  22 ++-
 fs/fuse/fuse_i.h |   1 +
 3 files changed, 308 insertions(+), 63 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 50dd6a07cc067..af749846c7093 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -379,6 +379,82 @@ static void fuse_lookup_init(struct fuse_args *args, u64 nodeid,
 	args->out_args[0].value = outarg;
 }
 
+/*
+ * Look the name of @entry up again.  Returns 1 if it still refers to the
+ * inode of @entry, refreshing its attributes and entry timeout, 0 if it does
+ * not, or -ENOMEM / -EINTR.
+ */
+static int fuse_revalidate_lookup(struct inode *dir, const struct qstr *name,
+				  struct dentry *entry)
+{
+	struct inode *inode = d_inode(entry);
+	struct fuse_mount *fm = get_fuse_mount(inode);
+	struct fuse_inode *fi = get_fuse_inode(inode);
+	struct fuse_entry_out outarg;
+	FUSE_ARGS(args);
+	struct fuse_forget_link *forget;
+	u64 attr_version;
+	int ret;
+
+	forget = fuse_alloc_forget();
+	if (!forget)
+		return -ENOMEM;
+
+	attr_version = fuse_get_attr_version(fm->fc);
+
+	fuse_lookup_init(&args, get_node_id(dir), name, &outarg);
+	ret = fuse_simple_request(fm, &args);
+	/* Zero nodeid is same as -ENOENT */
+	if (!ret && !outarg.nodeid)
+		ret = -ENOENT;
+	if (!ret) {
+		if (outarg.nodeid != get_node_id(inode) ||
+		    (bool) IS_AUTOMOUNT(inode) != (bool) (outarg.attr.flags & FUSE_ATTR_SUBMOUNT)) {
+			fuse_chan_queue_forget(fm->fc->chan, forget,
+					       outarg.nodeid, 1);
+			return 0;
+		}
+		spin_lock(&fi->lock);
+		fi->nlookup++;
+		spin_unlock(&fi->lock);
+	}
+	kfree(forget);
+	if (ret == -ENOMEM || ret == -EINTR)
+		return ret;
+	if (ret || fuse_invalid_attr(&outarg.attr) ||
+	    fuse_stale_inode(inode, outarg.generation, &outarg.attr))
+		return 0;
+
+	forget_all_cached_acls(inode);
+	fuse_change_attributes(inode, &outarg.attr, NULL,
+			       ATTR_TIMEOUT(&outarg),
+			       attr_version);
+	fuse_change_entry_timeout(entry, &outarg);
+	return 1;
+}
+
+/*
+ * An open of a regular file whose entry expired leaves the LOOKUP to
+ * fuse_open_revalidate().  With default_permissions, may_open() checks the
+ * cached attributes first, so they must still be valid.
+ */
+static bool fuse_open_skips_lookup(struct fuse_conn *fc, struct dentry *entry,
+				   struct inode *inode, unsigned int flags)
+{
+	struct fuse_inode *fi = get_fuse_inode(inode);
+	u32 perm_mask = STATX_MODE | STATX_UID | STATX_GID;
+
+	if (fc->no_open_atomic || !(flags & LOOKUP_OPEN) ||
+	    (flags & (LOOKUP_CREATE | LOOKUP_REVAL | LOOKUP_RENAME_TARGET |
+		      LOOKUP_DIRECTORY)) ||
+	    !S_ISREG(inode->i_mode) || d_mountpoint(entry))
+		return false;
+
+	return !fc->default_permissions ||
+	       (!(perm_mask & READ_ONCE(fi->inval_mask)) &&
+		!time_before64(fi->i_time, get_jiffies_64()));
+}
+
 /*
  * Check whether the dentry is still valid
  *
@@ -392,7 +468,6 @@ static int fuse_dentry_revalidate(struct inode *dir, const struct qstr *name,
 				  struct dentry *entry, unsigned int flags)
 {
 	struct inode *inode;
-	struct fuse_mount *fm;
 	struct fuse_conn *fc;
 	struct fuse_inode *fi;
 	struct fuse_dentry *fd = entry->d_fsdata;
@@ -407,57 +482,20 @@ static int fuse_dentry_revalidate(struct inode *dir, const struct qstr *name,
 		goto invalid;
 	else if (time_before64(fuse_dentry_time(entry), get_jiffies_64()) ||
 		 (flags & (LOOKUP_EXCL | LOOKUP_REVAL | LOOKUP_RENAME_TARGET))) {
-		struct fuse_entry_out outarg;
-		FUSE_ARGS(args);
-		struct fuse_forget_link *forget;
-		u64 attr_version;
-
 		/* For negative dentries, always do a fresh lookup */
 		if (!inode)
 			goto invalid;
 
+		if (fuse_open_skips_lookup(fc, entry, inode, flags))
+			goto valid;
+
 		ret = -ECHILD;
 		if (flags & LOOKUP_RCU)
 			goto out;
 
-		fm = get_fuse_mount(inode);
-
-		forget = fuse_alloc_forget();
-		ret = -ENOMEM;
-		if (!forget)
-			goto out;
-
-		attr_version = fuse_get_attr_version(fm->fc);
-
-		fuse_lookup_init(&args, get_node_id(dir), name, &outarg);
-		ret = fuse_simple_request(fm, &args);
-		/* Zero nodeid is same as -ENOENT */
-		if (!ret && !outarg.nodeid)
-			ret = -ENOENT;
-		if (!ret) {
-			fi = get_fuse_inode(inode);
-			if (outarg.nodeid != get_node_id(inode) ||
-			    (bool) IS_AUTOMOUNT(inode) != (bool) (outarg.attr.flags & FUSE_ATTR_SUBMOUNT)) {
-				fuse_chan_queue_forget(fm->fc->chan, forget,
-						  outarg.nodeid, 1);
-				goto invalid;
-			}
-			spin_lock(&fi->lock);
-			fi->nlookup++;
-			spin_unlock(&fi->lock);
-		}
-		kfree(forget);
-		if (ret == -ENOMEM || ret == -EINTR)
+		ret = fuse_revalidate_lookup(dir, name, entry);
+		if (ret <= 0)
 			goto out;
-		if (ret || fuse_invalid_attr(&outarg.attr) ||
-		    fuse_stale_inode(inode, outarg.generation, &outarg.attr))
-			goto invalid;
-
-		forget_all_cached_acls(inode);
-		fuse_change_attributes(inode, &outarg.attr, NULL,
-				       ATTR_TIMEOUT(&outarg),
-				       attr_version);
-		fuse_change_entry_timeout(entry, &outarg);
 	} else if (inode) {
 		fi = get_fuse_inode(inode);
 		if (flags & LOOKUP_RCU) {
@@ -467,6 +505,7 @@ static int fuse_dentry_revalidate(struct inode *dir, const struct qstr *name,
 			fuse_advise_use_readdirplus(dir);
 		}
 	}
+valid:
 	ret = 1;
 out:
 	return ret;
@@ -816,27 +855,33 @@ static void free_ext_value(struct fuse_args *args)
 
 static int fuse_perm_getattr(struct inode *inode, int mask);
 
+/* The mask do_open() passes to may_open() */
+static int fuse_open_mask(struct file *file)
+{
+	int mask = MAY_OPEN;
+
+	if (file->f_flags & __FMODE_EXEC)
+		return mask | MAY_EXEC;
+
+	mask |= ACC_MODE(file->f_flags);
+	if (file->f_flags & O_TRUNC)
+		mask |= MAY_WRITE;
+	if (file->f_flags & O_APPEND)
+		mask |= MAY_APPEND;
+	return mask;
+}
+
 /*
- * Check the open against attributes the server just returned, with the mask
- * do_open() passes to may_open().  As in fuse_permission(), a denial
- * refreshes the attributes and checks again.  may_open() still runs the full
- * check.
+ * Check the open against attributes the server just returned.  As in
+ * fuse_permission(), a denial refreshes the attributes and checks again.
+ * may_open() still runs the full check.
  */
 static int fuse_may_open(struct file *file, struct inode *inode)
 {
 	struct mnt_idmap *idmap = file_mnt_idmap(file);
-	int mask = MAY_OPEN;
+	int mask = fuse_open_mask(file);
 	int err;
 
-	if (file->f_flags & __FMODE_EXEC) {
-		mask |= MAY_EXEC;
-	} else {
-		mask |= ACC_MODE(file->f_flags);
-		if (file->f_flags & O_TRUNC)
-			mask |= MAY_WRITE;
-		if (file->f_flags & O_APPEND)
-			mask |= MAY_APPEND;
-	}
 	err = generic_permission(idmap, inode, mask);
 	if (err == -EACCES) {
 		err = fuse_perm_getattr(inode, mask);
@@ -1064,6 +1109,195 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 	return err;
 }
 
+/*
+ * Check the open again after fuse_open_revalidate() refreshed the attributes
+ * that may_open() checked.
+ */
+static int fuse_open_recheck(struct file *file, struct inode *inode)
+{
+	struct mnt_idmap *idmap = file_mnt_idmap(file);
+	int err;
+
+	err = inode_permission(idmap, inode, fuse_open_mask(file));
+	if (!err && (file->f_flags & O_NOATIME) &&
+	    !inode_owner_or_capable(idmap, inode))
+		err = -EPERM;
+	return err;
+}
+
+/*
+ * Open a regular file whose entry expired with FUSE_OPEN_ATOMIC, which
+ * revalidates the name in the same request.  Returns 1 if the file still
+ * needs FUSE_OPEN, or -EOPENSTALE if the name no longer refers to it.
+ *
+ * fuse_dentry_revalidate() leaves the LOOKUP of such a file to this
+ * function.  An open that did not look the name up (e.g. through
+ * /proc/self/fd) checks the name as well; a mismatch drops the dentry, and
+ * the retry opens the unhashed dentry by nodeid.
+ */
+int fuse_open_revalidate(struct file *file)
+{
+	struct dentry *entry = file->f_path.dentry;
+	struct inode *inode = d_inode(entry);
+	struct fuse_inode *fi = get_fuse_inode(inode);
+	struct fuse_mount *fm = get_fuse_mount(inode);
+	struct fuse_conn *fc = fm->fc;
+	FUSE_ARGS(args);
+	struct fuse_forget_link *forget;
+	struct fuse_create_in inarg;
+	struct fuse_entry_out outentry;
+	struct fuse_open_out *outopenp;
+	struct name_snapshot name;
+	struct dentry *parent;
+	struct fuse_file *ff;
+	u64 attr_version, time;
+	unsigned int seq;
+	int err;
+
+	/* Backing files and unhashed names open by nodeid */
+	if (fc->no_open_atomic || (file->f_mode & FMODE_BACKING) ||
+	    IS_ROOT(entry) || d_unhashed(entry) || !S_ISREG(inode->i_mode))
+		return 1;
+	time = fuse_dentry_time(entry);
+	if (!time_before64(time, get_jiffies_64()))
+		return 1;
+
+	forget = fuse_alloc_forget();
+	if (!forget)
+		return -ENOMEM;
+	ff = fuse_file_alloc(fm, true);
+	if (!ff) {
+		kfree(forget);
+		return -ENOMEM;
+	}
+
+	do {
+		seq = read_seqbegin(&rename_lock);
+		parent = dget_parent(entry);
+		take_dentry_name_snapshot(&name, entry);
+		if (!read_seqretry(&rename_lock, seq))
+			break;
+		release_dentry_name_snapshot(&name);
+		dput(parent);
+	} while (1);
+
+	memset(&inarg, 0, sizeof(inarg));
+	memset(&outentry, 0, sizeof(outentry));
+	inarg.flags = file->f_flags & ~(O_CREAT | O_EXCL | O_NOCTTY);
+	inarg.mode = S_IFREG;
+	args.opcode = FUSE_OPEN_ATOMIC;
+	args.nodeid = get_node_id(d_inode(parent));
+	args.in_numargs = 2;
+	args.in_args[0].size = sizeof(inarg);
+	args.in_args[0].value = &inarg;
+	args.in_args[1].size = name.name.len + 1;
+	args.in_args[1].value = name.name.name;
+	args.out_numargs = 2;
+	args.out_args[0].size = sizeof(outentry);
+	args.out_args[0].value = &outentry;
+	outopenp = &ff->args->open_outarg;
+	args.out_args[1].size = sizeof(*outopenp);
+	args.out_args[1].value = outopenp;
+	args.out_argvar = true;
+
+	attr_version = fuse_get_attr_version(fc);
+	err = fuse_simple_request(fm, &args);
+	if (err == -ENOSYS) {
+		/* d_revalidate() skipped the LOOKUP, so send it here */
+		fc->no_open_atomic = 1;
+		err = fuse_revalidate_lookup(d_inode(parent), &name.name,
+					     entry);
+		release_dentry_name_snapshot(&name);
+		dput(parent);
+		fuse_file_free(ff);
+		kfree(forget);
+		if (!err) {
+			if (!read_seqretry(&rename_lock, seq))
+				d_drop(entry);
+			return -EOPENSTALE;
+		}
+		if (err > 0)
+			err = fuse_open_recheck(file, inode) ?: 1;
+		return err;
+	}
+	release_dentry_name_snapshot(&name);
+	dput(parent);
+
+	if (err == -ENOENT) {
+		fuse_file_free(ff);
+		kfree(forget);
+		err = -EOPENSTALE;
+		goto out_stale;
+	}
+	if (err < 0)
+		goto out_free;
+
+	if (args.out_args[1].size) {
+		ff->fh = outopenp->fh;
+		ff->nodeid = outentry.nodeid;
+	}
+
+	/* The retry looks the name up again */
+	err = -EOPENSTALE;
+	if (outentry.nodeid != get_node_id(inode) ||
+	    fuse_invalid_attr(&outentry.attr) ||
+	    fuse_stale_inode(inode, outentry.generation, &outentry.attr))
+		goto out_release;
+
+	/* Only O_CREAT creates; O_TRUNC leaves the file unopened */
+	err = -EIO;
+	if (args.out_args[1].size &&
+	    (args.out_args[1].size < FUSE_COMPAT_OPEN_OUT_SIZE ||
+	     (outopenp->open_flags & FOPEN_CREATED) ||
+	     (file->f_flags & O_TRUNC)))
+		goto out_release;
+
+	spin_lock(&fi->lock);
+	fi->nlookup++;
+	spin_unlock(&fi->lock);
+	kfree(forget);
+	forget_all_cached_acls(inode);
+	fuse_change_attributes(inode, &outentry.attr, NULL,
+			       ATTR_TIMEOUT(&outentry), attr_version);
+	/* Keep an invalidation that raced with the request */
+	if (time && fuse_dentry_time(entry) == time)
+		fuse_change_entry_timeout(entry, &outentry);
+
+	err = fuse_open_recheck(file, inode);
+	if (!args.out_args[1].size) {
+		fuse_file_free(ff);
+		return err ?: 1;
+	}
+	if (err) {
+		fuse_sync_release(fi, ff, file->f_flags);
+		return err;
+	}
+	ff->open_flags = outopenp->open_flags;
+	file->private_data = ff;
+	return 0;
+
+out_release:
+	if (args.out_args[1].size)
+		fuse_sync_release(NULL, ff, file->f_flags);
+	else
+		fuse_file_free(ff);
+	if (outentry.nodeid)
+		fuse_chan_queue_forget(fc->chan, forget, outentry.nodeid, 1);
+	else
+		kfree(forget);
+	if (err != -EOPENSTALE)
+		return err;
+out_stale:
+	if (!read_seqretry(&rename_lock, seq))
+		d_drop(entry);
+	return err;
+
+out_free:
+	fuse_file_free(ff);
+	kfree(forget);
+	return err;
+}
+
 /*
  * lookup_open() clears O_CREAT, and O_TRUNC without O_EXCL, when the open
  * cannot create or truncate; do_open() then reports the error.
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index eb5ae11b6010c..51da3d76606d2 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -257,7 +257,7 @@ static int fuse_open(struct inode *inode, struct file *file)
 	struct fuse_inode *fi = get_fuse_inode(inode);
 	struct fuse_conn *fc = fm->fc;
 	struct fuse_file *ff;
-	int err;
+	int err, need_open;
 	bool is_truncate = (file->f_flags & O_TRUNC) && fc->atomic_o_trunc;
 	bool is_wb_truncate = is_truncate && fc->writeback_cache;
 	bool vdax_truncate = is_truncate && FUSE_IS_VDAX(inode);
@@ -265,13 +265,22 @@ static int fuse_open(struct inode *inode, struct file *file)
 	if (fuse_is_bad(inode))
 		return -EIO;
 
+	/* The checks below see the attributes the revalidation refreshed */
+	need_open = fuse_open_revalidate(file);
+	if (need_open < 0)
+		return need_open;
+
 	/* No truncate for DAX yet */
 	if ((file->f_flags & O_TRUNC) && IS_DAX(inode) && !FUSE_IS_VDAX(inode))
-		return -EINVAL;
-
-	err = generic_file_open(inode, file);
-	if (err)
+		err = -EINVAL;
+	else
+		err = generic_file_open(inode, file);
+	if (err) {
+		if (!need_open)
+			fuse_sync_release(fi, file->private_data,
+					  file->f_flags);
 		return err;
+	}
 
 	if (is_wb_truncate || vdax_truncate)
 		inode_lock(inode);
@@ -286,7 +295,8 @@ static int fuse_open(struct inode *inode, struct file *file)
 	if (is_wb_truncate || vdax_truncate)
 		fuse_set_nowrite(inode);
 
-	err = fuse_do_open(fm, get_node_id(inode), file, false);
+	if (need_open)
+		err = fuse_do_open(fm, get_node_id(inode), file, false);
 	if (!err) {
 		ff = file->private_data;
 		err = fuse_finish_open(inode, file);
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 0c7874c5da72b..7ff13ebcb9c83 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -994,6 +994,7 @@ void fuse_read_args_fill(struct fuse_io_args *ia, struct file *file, loff_t pos,
 struct fuse_file *fuse_file_alloc(struct fuse_mount *fm, bool release);
 void fuse_file_free(struct fuse_file *ff);
 int fuse_finish_open(struct inode *inode, struct file *file);
+int fuse_open_revalidate(struct file *file);
 
 void fuse_sync_release(struct fuse_inode *fi, struct fuse_file *ff,
 		       unsigned int flags);
-- 
2.50.1

