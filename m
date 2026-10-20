Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.42.203.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792505881;
	b=mi79SmcMs7SrLUenS9KO/XV0gFz7upcJ8uojFlSH5qHvQJWkucMF+I3exMbLnnxJ5T7e
	 Las0rJsWvWiyT5a97grJXGxAkwO5tdzs+fvFu/d3sO5eSXWvXOuSbyYYQaCw6xdRZMRAO
	 FELIY4pmzf0YS9dAPEoTQ6nnvXhaqPfNwY/1P/5PdA4eZOAKMvgooNST/QbaC1EXw2yBr
	 2n05ooEEC5CK6klAVN+USav2cViVFKKqDo1K/v6+QP3pIuIMnP/fY0Hz8hE277TVEm30A
	 M7DwGp4nW6E789uARf7Uzv875+hyeZ3lrJRKTqk6tGyd7FsbG80aSvFXXwJORKYxTJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792505881;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=+uSk6JwQZu1U4p1vlSGXGIhdZNmZROby9F/Zwndg83M=;
	b=GrmAtXLH0M+rojNvOeW4SFwdspZKXkgO8IYj1XoxwOhjpBH+WXyxNbdtmSyHSf6Y4s1p
	 P2C8/0VDsBfGZCdovXKVarkY4Ysr7XKE9j8ubDC9AKCi5JLU+ypmLuo+I0uQvEeouPDZV
	 IBeWTbefAlnScUEKXZOVsSM3T4/ffMwmQin4DUGj022VxQODlG8op93pKQlLbNePBG6ML
	 L8DqPmMlCD5btBk0P/4g8bpJhkQJmPAqdFBLRKnoC68HJ01j+cmHYWpzKYol+erih49bL
	 D4gIVSBOZ6JyRxmCxpJ2EkiNIrPctQsC6xAAbybbXpx1rEuTbDayUm6Mbd2gq5mnKOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=IErOPoDx;
	arc=none smtp.remote-ip=52.42.203.116
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.42.203.116])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1588A606A333
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 14:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1588A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=IErOPoDx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1792505881; x=1824041881;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+uSk6JwQZu1U4p1vlSGXGIhdZNmZROby9F/Zwndg83M=;
  b=IErOPoDx42Vuv9gWta3hpZFhD+/2r79ReOGnvvzXTPMC1S28eX1StfBr
   DXb9dmjjciAGYMT/IlSf1FXohcktYNm1gEWpGzAyMmlp/Fdfjrq/Kwfaq
   g09+SwJZ2rxXKoj946l8JGRkq4mcbt74l514WV9nKYWoxo6fUbL+zaN9T
   +WAdmAfe5iQlilqi1ZDCbkVVSFVQ2Trm3f97dUdCseFf3hsdKi2+uyalF
   zIOiyZoX3cM/4CdrFeZYNqV0ThbP9pwhYqTA0GgvYqQgdvur0ZqLGg9LF
   x3x3TIXQCWMHwoVrB7nb4zMhnu93K//Dw+XZz4y7GCTmrRAASTAMYXv+4
   g==;
X-CSE-ConnectionGUID: NVK2lD0QRk6AvDKOhAcLdA==
X-CSE-MsgGUID: RPtT83BvSPOLJPCsOevSwA==
X-IronPort-AV: E=Sophos;i="6.27,168,1787011200"; 
   d="scan'208";a="31781832"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 14:18:00 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:29811]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.1:2525] with esmtp (Farcaster)
 id 6b82a4ba-f402-4e36-8837-c76fedcca9e0; Tue, 20 Oct 2026 14:18:00 +0000 (UTC)
X-Farcaster-Flow-ID: 6b82a4ba-f402-4e36-8837-c76fedcca9e0
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 20 Oct 2026 14:18:00 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53;
 Tue, 20 Oct 2026 14:17:58 +0000
From: jamz <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: Jimmy Zuber <jamz@amazon.com>, <fuse-devel@lists.linux.dev>,
	<linux-kselftest@vger.kernel.org>, Shuah Khan <shuah@kernel.org>, "Bernd
 Schubert" <bernd@bsbernd.com>, Jim Harris <jiharris@nvidia.com>, "Horst
 Birthelmer" <horst@birthelmer.de>, Luis Henriques <luis@igalia.com>,
	NeilBrown <neil@brown.name>
Subject: [PATCH 2/3] fuse: open cached files with FUSE_OPEN_ATOMIC
Date: Tue, 20 Oct 2026 14:16:46 +0000
Message-ID: <20261020141647.3271341-3-jamz@amazon.com>
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
X-ClientProxiedBy: EX19D031UWC003.ant.amazon.com (10.13.139.252) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

From: Jimmy Zuber <jamz@amazon.com>

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
index 34d2271eb248..ea265a8d179f 100644
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
@@ -1018,6 +1039,146 @@ static int fuse_create_open(struct mnt_idmap *idmap, struct inode *dir,
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
+	    (args.out_args[1].size != sizeof(*outopenp) ||
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
index 6d707f2b3bff..8f4a14de760a 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -278,7 +278,9 @@ static int fuse_open(struct inode *inode, struct file *file)
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
index ba6dc4c43a1f..eabbb36c8dfd 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -954,6 +954,7 @@ void fuse_read_args_fill(struct fuse_io_args *ia, struct file *file, loff_t pos,
 struct fuse_file *fuse_file_alloc(struct fuse_mount *fm, bool release);
 void fuse_file_free(struct fuse_file *ff);
 int fuse_finish_open(struct inode *inode, struct file *file);
+int fuse_open_revalidate(struct file *file);
 
 void fuse_sync_release(struct fuse_inode *fi, struct fuse_file *ff,
 		       unsigned int flags);
-- 
2.50.1

