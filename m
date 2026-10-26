Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.34.181.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027981;
	b=2r3IDDc4Tsf/M5tJlpp15xXh1Kg7bj9GJIPsyugrt980yWSrpjuapiiT2vHSlqNXiZ5Q
	 It8ErjiaYDGgrUumVl1Q9aZGE5VFTxKljLU0ee0DbwA0JB30TG3PhT1vLeG1FLp19ZBZ3
	 MvZNS9EBH7CNybHfUUr+sO2qlxNRo4gBBFsDmR0eCKOXruooTGXmVUR2Ga1MON1/ZOuqP
	 ryo0a1RCLrD8Nxq1Jg1CppuMmwBPm3HDgOYhmnynYdV0BgvMt6tfIGB8UmsMryB+xm0Q6
	 s/iuqEZT4aJsEiPKf53h6ABIevf3NQIXUafdHPCQn1A6w03bFDDhTDdTnbX8ROZY67w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027981;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=PcL/8dDOQr+fA2VH0vIfg6XQn4TZ6iqjcjSStxBQNCg=;
	b=QkYFdz5GuK9xeB2Z6KvezhRU7hTOGRJP7iENluxZ/crTCNN5EroHQABlhtlE45HeKN6g
	 5gAf2Bsb13INd03laaRzVC9e+r6d4ZHEu9gHqha2SnK6a1I8563JiDcLlsaN0IomV4PRt
	 XFpjW7Uxr7UldwerzWpmsp1ru4gtzTQvzWih3wKdLjSaacODEaTCPFvzDSOlNdZoPEK6Y
	 pDTuvpQ0Ig1WBB3FXL2ONCfWmg64x//Ksh+Cciexq45xRQgmrVZzBR2ejge7f+JoJuPp0
	 9rfn3tFe3+SRaRcZZea5Lyxcjv3OnudS1vREvrA764SwqA3/b3DSkLpUMmphVmaoy7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=YuMMANVJ;
	arc=none smtp.remote-ip=52.34.181.151
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.34.181.151])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7768606A31A
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 15:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7768606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=YuMMANVJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793027980; x=1824563980;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PcL/8dDOQr+fA2VH0vIfg6XQn4TZ6iqjcjSStxBQNCg=;
  b=YuMMANVJnLwE4r0ebdqbNEtWxem8R++ociBq9EqQzZp+X1boHc7HGlPe
   2z4rzWMDp5owXPZMLW/dIi9djQYiLRb8dkHli7adQDF5rRPNnn+0pNFHr
   aMd+Xxby0TM0P0n4D0rJAntHq9jiCLU1yoLMmLCcy1ztQ/AAO1hE5gVSM
   R3STCyyi0EzM5/EKl9o0Y7LyCKSWT1I/AMWHhyWOtR865lqg9qWNx1Izh
   TV1eJxBEfU+pTAQFhVFchn/2WWnEuzPDfsSvaDWNkjdhEayuKq6ajQ538
   2pHr0tN6fzh319J9Co0UG4k+b6TQNIELYD9vUfa500GZjUaf0aXvqoop8
   A==;
X-CSE-ConnectionGUID: TmdWC1lMRFmHmQeKuQ6tSw==
X-CSE-MsgGUID: S6+yUUkHRSau8EHRlKmzFQ==
X-IronPort-AV: E=Sophos;i="6.27,179,1787011200"; 
   d="scan'208";a="32256729"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 15:19:40 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:15490]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.4.29:2525] with esmtp (Farcaster)
 id fa9da41a-b145-4112-87cd-12a9c5b31e30; Mon, 26 Oct 2026 15:19:40 +0000 (UTC)
X-Farcaster-Flow-ID: fa9da41a-b145-4112-87cd-12a9c5b31e30
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 26 Oct 2026 15:19:39 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 26 Oct 2026 15:19:38 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: <fuse-devel@lists.linux.dev>, <linux-kselftest@vger.kernel.org>, "Shuah
 Khan" <shuah@kernel.org>, Bernd Schubert <bernd@bsbernd.com>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>, NeilBrown <neil@brown.name>
Subject: [PATCH v2 2/3] fuse: open cached files with FUSE_OPEN_ATOMIC
Date: Mon, 26 Oct 2026 15:18:27 +0000
Message-ID: <20261026151828.562870-3-jamz@amazon.com>
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
X-ClientProxiedBy: EX19D031UWC001.ant.amazon.com (10.13.139.241) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

When the server implements FUSE_OPEN_ATOMIC, skip LOOKUP for a
regular file being opened, opening it by name from fuse_open() instead.
If the name now refers to a different file or to nothing, drop the
dentry and return -EOPENSTALE, so that the VFS looks the name up again.
A matching reply refreshes the attributes and the entry timeout.

If the server replies -ENOSYS, fuse_open() sends the skipped LOOKUP
itself.

Assisted-by: Claude:claude-opus-5-5 [Claude-Code]
Signed-off-by: Jimmy Zuber <jamz@amazon.com>
---
 fs/fuse/dir.c    | 247 ++++++++++++++++++++++++++++++++++++++---------
 fs/fuse/file.c   |   4 +-
 fs/fuse/fuse_i.h |   1 +
 3 files changed, 208 insertions(+), 44 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index f373d06ccdf17..5005f46235396 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -379,6 +379,60 @@ static void fuse_lookup_init(struct fuse_args *args, u64 nodeid,
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
 /*
  * Check whether the dentry is still valid
  *
@@ -392,7 +446,6 @@ static int fuse_dentry_revalidate(struct inode *dir, const struct qstr *name,
 				  struct dentry *entry, unsigned int flags)
 {
 	struct inode *inode;
-	struct fuse_mount *fm;
 	struct fuse_conn *fc;
 	struct fuse_inode *fi;
 	struct fuse_dentry *fd = entry->d_fsdata;
@@ -407,57 +460,24 @@ static int fuse_dentry_revalidate(struct inode *dir, const struct qstr *name,
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
 
+		/* fuse_open_revalidate() checks the name of a file it opens */
+		if (!fc->no_open_atomic && (flags & LOOKUP_OPEN) &&
+		    !(flags & (LOOKUP_EXCL | LOOKUP_REVAL |
+			       LOOKUP_RENAME_TARGET)) &&
+		    S_ISREG(inode->i_mode) && !d_mountpoint(entry))
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
@@ -467,6 +487,7 @@ static int fuse_dentry_revalidate(struct inode *dir, const struct qstr *name,
 			fuse_advise_use_readdirplus(dir);
 		}
 	}
+valid:
 	ret = 1;
 out:
 	return ret;
@@ -1016,6 +1037,146 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
 	return err;
 }
 
+/*
+ * Open a regular file whose dentry has expired with FUSE_OPEN_ATOMIC, which
+ * revalidates the name in the same request.  Returns 1 if the file still
+ * needs FUSE_OPEN, or -EOPENSTALE if the name no longer refers to it.
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
+	u64 attr_version;
+	int err;
+
+	if (fc->no_open_atomic || IS_ROOT(entry) || !S_ISREG(inode->i_mode) ||
+	    !time_before64(fuse_dentry_time(entry), get_jiffies_64()))
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
+	memset(&inarg, 0, sizeof(inarg));
+	memset(&outentry, 0, sizeof(outentry));
+	inarg.flags = file->f_flags & ~(O_CREAT | O_EXCL | O_NOCTTY);
+	inarg.mode = S_IFREG;
+	parent = dget_parent(entry);
+	take_dentry_name_snapshot(&name, entry);
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
+		if (!err) {
+			d_drop(entry);
+			err = -EOPENSTALE;
+		}
+		release_dentry_name_snapshot(&name);
+		dput(parent);
+		fuse_file_free(ff);
+		kfree(forget);
+		return err;
+	}
+	release_dentry_name_snapshot(&name);
+	dput(parent);
+
+	if (err == -ENOENT) {
+		d_drop(entry);
+		err = -EOPENSTALE;
+	}
+	if (err < 0)
+		goto out_free;
+
+	if (args.out_args[1].size) {
+		ff->fh = outopenp->fh;
+		ff->nodeid = outentry.nodeid;
+		ff->open_flags = outopenp->open_flags;
+	}
+
+	/* The retry looks the name up again */
+	err = -EOPENSTALE;
+	if (outentry.nodeid != get_node_id(inode) ||
+	    fuse_invalid_attr(&outentry.attr) ||
+	    fuse_stale_inode(inode, outentry.generation, &outentry.attr)) {
+		d_drop(entry);
+		goto out_release;
+	}
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
+	fuse_change_entry_timeout(entry, &outentry);
+
+	if (!args.out_args[1].size) {
+		fuse_file_free(ff);
+		return 1;
+	}
+	file->private_data = ff;
+	return 0;
+
+out_release:
+	if (outentry.nodeid)
+		fuse_chan_queue_forget(fc->chan, forget, outentry.nodeid, 1);
+	else
+		kfree(forget);
+	if (args.out_args[1].size)
+		fuse_sync_release(NULL, ff, file->f_flags);
+	else
+		fuse_file_free(ff);
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
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index eb5ae11b6010c..a79aec76ecbea 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -286,7 +286,9 @@ static int fuse_open(struct inode *inode, struct file *file)
 	if (is_wb_truncate || vdax_truncate)
 		fuse_set_nowrite(inode);
 
-	err = fuse_do_open(fm, get_node_id(inode), file, false);
+	err = fuse_open_revalidate(file);
+	if (err > 0)
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

