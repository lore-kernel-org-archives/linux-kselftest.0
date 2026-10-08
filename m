Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92A53CB2EA
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 19:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487278; cv=none; b=erRyg0vsffXdF7apG8lB2MjhZZ+LdX8PlfVf37w2X+9BNWLM9rD27fQNFdmlYb1wjWOru2eWCX43wtB1jLwOEGPshPrrvNeCX8b1jiBzoBZA3GRzcmM3xflphXFAOyeTOpPXD3CgacH4bkh5LxqsxxHmTjSzcKmSXqikP1t93lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487278; c=relaxed/simple;
	bh=dDeq3kJtX4H91hT/baekFnpTkY8XBAYyROy2hZB+uTU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fy90gA3b+J7qh9IFv/BtQLo21imna65FuxohD/d2msWaakTTn4F1M0Ev7FIXKlAX5HO6DxClGFANHF/dDT5yyz+gpQa+eXJtlt5kbKf+5DKrnWp5xDo31MiRHQnYFcNn+63z9y70T+OfjC0U9PnUKfmTzzlNfZ0WePli/WkF77c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YA/eH88m; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YA/eH88m"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2db710396ffso6422605ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 12:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791487275; x=1792092075; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K+SIPR/3rMTRYWskHw/zmca54zT+Ufu+UWtQNOpMjEs=;
        b=YA/eH88m3c+AVVsIC9Y4z6TvZuGkruBKpKYyyxTiOK4GTiYubFIijfn5wTkjT+oEYa
         UQ6lI1RNqI2uTaaS+43XntZCdedbAnSfTZjgMYEaHkhdBwkkdVk6Vsql2lJwacfMfo7Q
         EJfUyASHDxtYT7Y56cBWMsblZxhKkcfnaxVfOY8snG81wfSRMqVBrsj7zdwbkZNeNQPv
         EY7g4WvLAk5tfz+BIxGa/io63+nD4dUV8vTyF9i9yoWKgPOI8CEsX9Gm6A5qIgCifBgK
         zVTL1E1dShIkEnd6Y3YK/ifTNhyV5X0NpnFyjUNX4kit624uQHoZ1lTzzK4ZtLT2ysCD
         Zmxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791487275; x=1792092075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+SIPR/3rMTRYWskHw/zmca54zT+Ufu+UWtQNOpMjEs=;
        b=vIC+H+fQXAaHT6DH2ScwID80ezBxb1JTerl5nO13IblfxAm0LwbxlaNkljsRAVSKeN
         c8uFkWyvDCQyD08x7ILyd+7NPAu7RU36Z7gVRQfsCIhmtcHGE7+4lvDYuUwCe3X0FPXP
         VebfRAEJLkWQQi96El11dfzbGb6ZwPoPvLhhCDEbTjLcTy1niROwSmkQbZ5ZJMX++baj
         wiy7me63mM5LhWGM0n12xZ7KGFAVQEQAXUjWlfO50jO0bIBIkWrKz5uczwbKHOB2XQjU
         XG0oq/cnSARAFh35Edya63xiDnKGqBWFPXwzxo1TIBBhgcg2stOOyjPkqnlXglD6NhDj
         5o0w==
X-Forwarded-Encrypted: i=1; AKwUvBwv4vAnkg8lDeI/fFdkfNWqgxTuu++9hrQhBQ9aHB3OJS2xz9fgnUhfM/gScDSn7h/2f4SBuNRKj8dgjVFuN6g=@vger.kernel.org
X-Gm-Message-State: AFq9FYILMJiFKpBt4Uem8ZyN4zn5QheliWTmkvK2kfZTiJOX8rjg371u
	vU8eP8vdSExijub82u1dwe6/DUmOtQLD/vlmdxsxMQ/cnxHwDTjpeqWR
X-Gm-Gg: AYBFou3gip4/iQAiVJ3aJrnZeKZZl8lxZ8nq0fUw5ZVOEnNpfoVY644NWwxjSGzVj98
	58H6gy3Js0mAGirlm6mCwz+0tFegJA04hw2TCBj2Fan6/5LY2/R9XVTZTpV+BkS/T+hko/1jaOZ
	7uKLOYbGuxDrQVINZWXwUFDIhqXzvVAwKxMb1P0zb4gH/coCtBalz1L1BRoQziNBhakHgoq4oF2
	hHfwOK8F6/Y0yza2PBQ1k7jIScfpmufW7kozd9M9E1YDQymsL+6WLXieTS4i3Uv62kwJxv4I1YC
	Af+RhRIe+nD/1eSwdS6a7+ozIA2RLa3wguFzcntLvzeC1SX2Z3m5NjD6RAkpoxKduIXMeJtYvle
	Tp5ogr/vrwcQJNHgTMAyrZ1Zh+VtscYWWgfG/mlquWmczqX4WQRM2ecaMrr57kp5m+KhMF0WzbD
	PY1nv8DPAVNrL+RsZie5e/mLSxZzuu70MH1JqcaX6ALXoLrteKJuBNrOqlU9lZuPNDiVEt1DlUV
	fO+0g==
X-Received: by 2002:a17:903:1b45:b0:2e5:41d6:178c with SMTP id d9443c01a7336-2e7ffe4ac05mr22054225ad.33.1791487274909;
        Thu, 08 Oct 2026 12:21:14 -0700 (PDT)
Received: from [192.168.0.160] ([76.135.114.51])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e83cd9757fsm811965ad.63.2026.10.08.12.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:21:14 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Date: Thu, 08 Oct 2026 12:20:23 -0700
Subject: [PATCH v3 1/2] fuse: add negotiated per-inode open and release
 suppression
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-fuse-per-inode-no-open-v3-1-99cfd3dbc06b@gmail.com>
References: <20261008-fuse-per-inode-no-open-v3-0-99cfd3dbc06b@gmail.com>
In-Reply-To: <20261008-fuse-per-inode-no-open-v3-0-99cfd3dbc06b@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Shuah Khan <shuah@kernel.org>
Cc: Robert Byrnes <byrnes@wildpumpkin.net>, fuse-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 Stanislav Kinsburskii <skinsburskii@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791487272; l=13843;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=dDeq3kJtX4H91hT/baekFnpTkY8XBAYyROy2hZB+uTU=;
 b=nPke3UjaOfr4ILwTeDJ3eebyG9xOju4sB9rDFF5M/w9SZFwloQGKDrNstPbLexCDx1a0p8+36
 Dl1yGSPRzs9CgsU6/hEYX7WE73X/b5xE9InIIBpXsKJXajo/jq8julE
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=

Filesystems serving cached content may not need per-open state for most
inodes, while still relying on OPEN for control files. The connection-wide
no-open behavior selected by ENOSYS cannot express this distinction.

Add FUSE_PER_INODE_NO_OPEN to INIT negotiation and FUSE_ATTR_NO_OPEN to
inode attributes. For marked inodes, use the existing zero-handle defaults
and normally omit OPEN/OPENDIR and the corresponding RELEASE/RELEASEDIR.
Remember whether each handle was opened locally, so later attribute updates
do not determine the release behavior of existing handles.

Retain RELEASE after a successful remote flock operation, even when OPEN
was skipped, so FUSE_RELEASE_FLOCK_UNLOCK can clean up server-side locks.
Servers negotiating remote flock must accept this RELEASE with a zero file
handle and no preceding OPEN, including after an explicit unlock.

Keep the release argument allocation for regular files, which pins the
inode while asynchronous I/O completes. Honor the hint for internal opens
used by file-attribute ioctls as well. The capability check excludes CUSE
before accessing its non-FUSE inode as a fuse_inode.

The per-inode hint does not suppress OPEN for atomic O_TRUNC, since the
server must perform the truncation. CREATE retains its existing handle
lifecycle. Connection-wide no-open/no-opendir behavior selected by ENOSYS
continues to take precedence.

Update the cached hint from LOOKUP, GETATTR, SETATTR and READDIRPLUS
attributes. Preserve it across STATX replies, which do not carry
fuse_attr.flags.

Document negotiation, cache and handle semantics, and the server's
responsibilities. No additional access-time or open-reference accounting
is introduced.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 Documentation/filesystems/fuse/fuse-no-open.rst | 49 +++++++++++++++++++++++++
 Documentation/filesystems/fuse/index.rst        |  1 +
 fs/fuse/file.c                                  | 26 ++++++++++---
 fs/fuse/fuse_i.h                                | 17 ++++++++-
 fs/fuse/inode.c                                 |  9 +++++
 fs/fuse/ioctl.c                                 |  3 +-
 include/uapi/linux/fuse.h                       | 13 ++++++-
 7 files changed, 110 insertions(+), 8 deletions(-)

diff --git a/Documentation/filesystems/fuse/fuse-no-open.rst b/Documentation/filesystems/fuse/fuse-no-open.rst
new file mode 100644
index 000000000000..2e0cf43f9ef7
--- /dev/null
+++ b/Documentation/filesystems/fuse/fuse-no-open.rst
@@ -0,0 +1,49 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Per-inode open suppression
+==========================
+
+A filesystem can avoid OPEN and RELEASE requests for individual inodes by
+negotiating FUSE_PER_INODE_NO_OPEN in INIT and setting FUSE_ATTR_NO_OPEN in
+``fuse_attr.flags``.  For directories, the flag suppresses OPENDIR and
+RELEASEDIR instead.  This allows, for example, cached content files to avoid
+open round trips while control files on the same connection retain their
+open handlers.  Without the negotiated capability the attribute is ignored.
+
+The kernel updates the hint when it accepts attributes in replies such as
+LOOKUP, GETATTR, SETATTR and READDIRPLUS.  STATX replies do not carry
+``fuse_attr.flags`` and leave the hint unchanged.  The hint is cached inode
+state; it is not independently revalidated on every open.  A server changing
+the hint must arrange for fresh attributes to reach the kernel and tolerate
+concurrent opens using the previous value.
+
+For an open served locally, the file handle is zero, FOPEN_KEEP_CACHE is
+set, and directories also have FOPEN_CACHE_DIR set.  Subsequent requests
+identify the object by the node ID and may carry a zero file handle.  The
+server must support these requests without per-open state.  Whether OPEN was
+sent is recorded for each handle and is not changed by later attribute
+updates.  An existing server-opened handle still receives its matching
+RELEASE if the inode hint subsequently becomes set.
+
+Remote flock locking is an exception to RELEASE suppression.  When
+FUSE_FLOCK_LOCKS is negotiated and a handle has successfully performed a
+server-side flock operation, its final close sends RELEASE with
+FUSE_RELEASE_FLOCK_UNLOCK and the lock owner, even if OPEN was suppressed.
+The server must accept this RELEASE with a zero file handle and no preceding
+OPEN, and use the node ID and lock owner to remove any remaining flock locks.
+This also applies after an explicit unlock, since the kernel records whether
+a flock operation succeeded rather than tracking the server's current locks.
+
+When FUSE_ATOMIC_O_TRUNC is negotiated, an open with O_TRUNC still sends
+OPEN and receives a matching RELEASE, so the server can perform truncation.
+CREATE also retains its usual open and release semantics.  Connection-wide
+no-open behavior selected by an ENOSYS response continues to take precedence.
+
+The hint does not make an inode immutable, grant permissions, or suppress
+other operations such as FLUSH, FSYNC, locking or data I/O.  Servers supporting
+remote flock must implement the RELEASE cleanup described above.  A server must
+only set it when its access policy and file semantics permit the default
+open behavior described above.  Servers needing per-open authorization,
+nonzero handles, direct I/O, passthrough or other OPEN reply flags must keep
+handling OPEN for those inodes.  No additional access-time or open-reference
+accounting is performed by this feature.
diff --git a/Documentation/filesystems/fuse/index.rst b/Documentation/filesystems/fuse/index.rst
index 3dada6c4057a..6dd9192f74fe 100644
--- a/Documentation/filesystems/fuse/index.rst
+++ b/Documentation/filesystems/fuse/index.rst
@@ -12,4 +12,5 @@ FUSE (Filesystem in Userspace) Technical Documentation
    fuse-io
    fuse-io-uring
    fuse-passthrough
+   fuse-no-open
    uapi/fuse-uapi-io-uring
diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 3d209e2b71ba..31c22ff5c8c1 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -108,8 +108,9 @@ static void fuse_file_put(struct fuse_file *ff, bool sync)
 			fuse_file_io_release(ff, ra->inode);
 
 		if (!args) {
-			/* Do nothing when server does not implement 'opendir' */
-		} else if (args->opcode == FUSE_RELEASE && ff->fm->fc->no_open) {
+			/* No release needed when OPENDIR was skipped. */
+		} else if (args->opcode == FUSE_RELEASE &&
+			   (ff->fm->fc->no_open || (ff->no_open && !ff->flock))) {
 			fuse_release_end(args, 0);
 		} else if (sync) {
 			fuse_simple_request(ff->fm, args);
@@ -130,13 +131,26 @@ static void fuse_file_put(struct fuse_file *ff, bool sync)
 	}
 }
 
+static bool fuse_open_needed(struct fuse_conn *fc, unsigned int open_flags,
+			     bool isdir, bool no_open)
+{
+	if (isdir ? fc->no_opendir : fc->no_open)
+		return false;
+
+	/* Atomic truncation must still be performed by the server's OPEN. */
+	if ((open_flags & O_TRUNC) && fc->atomic_o_trunc)
+		return true;
+
+	return !no_open;
+}
+
 struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
-				 unsigned int open_flags, bool isdir)
+				 unsigned int open_flags, bool isdir, bool no_open)
 {
 	struct fuse_conn *fc = fm->fc;
 	struct fuse_file *ff;
 	int opcode = isdir ? FUSE_OPENDIR : FUSE_OPEN;
-	bool open = isdir ? !fc->no_opendir : !fc->no_open;
+	bool open = fuse_open_needed(fc, open_flags, isdir, no_open);
 	bool release = !isdir || open;
 
 	/*
@@ -152,6 +166,7 @@ struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
 		return ERR_PTR(-ENOMEM);
 
 	ff->fh = 0;
+	ff->no_open = !open;
 	/* Default for no-open */
 	ff->open_flags = FOPEN_KEEP_CACHE | (isdir ? FOPEN_CACHE_DIR : 0);
 	if (open) {
@@ -189,7 +204,8 @@ struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
 int fuse_do_open(struct fuse_mount *fm, u64 nodeid, struct file *file,
 		 bool isdir)
 {
-	struct fuse_file *ff = fuse_file_open(fm, nodeid, file->f_flags, isdir);
+	struct fuse_file *ff = fuse_file_open(fm, nodeid, file->f_flags, isdir,
+					    fuse_inode_no_open(fm->fc, file_inode(file)));
 
 	if (!IS_ERR(ff))
 		file->private_data = ff;
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 87e2bd9d4bb1..76157a84db22 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -257,6 +257,8 @@ enum {
 	 * or the fuse server has an exclusive "lease" on distributed fs
 	 */
 	FUSE_I_EXCLUSIVE,
+	/* Server does not need OPEN/OPENDIR for this inode */
+	FUSE_I_NO_OPEN,
 };
 
 struct fuse_conn;
@@ -322,6 +324,9 @@ struct fuse_file {
 
 	/** @flock: Has flock been performed on this file? */
 	bool flock:1;
+
+	/** @no_open: Open was served locally without an OPEN/OPENDIR request */
+	bool no_open:1;
 };
 
 struct fuse_release_args {
@@ -556,6 +561,9 @@ struct fuse_conn {
 	/** @no_opendir: Is opendir/releasedir not implemented by fs? */
 	unsigned no_opendir:1;
 
+	/** @per_inode_no_open: Honor FUSE_ATTR_NO_OPEN */
+	unsigned per_inode_no_open:1;
+
 	/** @no_fsync: Is fsync not implemented by fs? */
 	unsigned no_fsync:1;
 
@@ -833,6 +841,13 @@ static inline struct fuse_inode *get_fuse_inode(const struct inode *inode)
 	return container_of(inode, struct fuse_inode, inode);
 }
 
+static inline bool fuse_inode_no_open(struct fuse_conn *fc, struct inode *inode)
+{
+	/* CUSE uses a non-FUSE inode and cannot negotiate this capability. */
+	return fc->per_inode_no_open &&
+		test_bit(FUSE_I_NO_OPEN, &get_fuse_inode(inode)->state);
+}
+
 static inline u64 get_node_id(struct inode *inode)
 {
 	return get_fuse_inode(inode)->nodeid;
@@ -1261,7 +1276,7 @@ void fuse_file_io_release(struct fuse_file *ff, struct inode *inode);
 
 /* file.c */
 struct fuse_file *fuse_file_open(struct fuse_mount *fm, u64 nodeid,
-				 unsigned int open_flags, bool isdir);
+				 unsigned int open_flags, bool isdir, bool no_open);
 void fuse_file_release(struct inode *inode, struct fuse_file *ff,
 		       unsigned int open_flags, fl_owner_t id, bool isdir);
 
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index cbb10e19e7e8..63924d95caa3 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -299,6 +299,11 @@ void fuse_change_attributes_common(struct inode *inode, struct fuse_attr *attr,
 	 * anyway. Its less efficient but should be safe.
 	 */
 	inode->i_flags &= ~S_NOSEC;
+
+	/* STATX replies do not carry fuse_attr.flags. */
+	if (fc->per_inode_no_open && !sx)
+		assign_bit(FUSE_I_NO_OPEN, &fi->state,
+			   attr->flags & FUSE_ATTR_NO_OPEN);
 }
 
 u32 fuse_get_cache_mask(struct inode *inode)
@@ -1432,6 +1437,8 @@ static void process_init_reply(struct fuse_args *args, int error)
 
 			if (fuse_syncfs_enable(fc, flags))
 				fc->sync_fs = 1;
+			if (flags & FUSE_PER_INODE_NO_OPEN)
+				fc->per_inode_no_open = 1;
 		} else {
 			ra_pages = fc->max_read / PAGE_SIZE;
 			fc->no_lock = 1;
@@ -1510,6 +1517,8 @@ static struct fuse_init_args *fuse_new_init(struct fuse_mount *fm)
 	if (fuse_uring_enabled())
 		flags |= FUSE_OVER_IO_URING | FUSE_HAS_IO_URING_BUFPOOL;
 
+	flags |= FUSE_PER_INODE_NO_OPEN;
+
 	ia->in.flags = flags;
 	ia->in.flags2 = flags >> 32;
 
diff --git a/fs/fuse/ioctl.c b/fs/fuse/ioctl.c
index ce1807704da6..7fc11bb3eee9 100644
--- a/fs/fuse/ioctl.c
+++ b/fs/fuse/ioctl.c
@@ -492,7 +492,8 @@ static struct fuse_file *fuse_priv_ioctl_prepare(struct inode *inode)
 	if (!S_ISREG(inode->i_mode) && !isdir)
 		return ERR_PTR(-ENOTTY);
 
-	return fuse_file_open(fm, get_node_id(inode), O_RDONLY, isdir);
+	return fuse_file_open(fm, get_node_id(inode), O_RDONLY, isdir,
+			      fuse_inode_no_open(fm->fc, inode));
 }
 
 static void fuse_priv_ioctl_cleanup(struct inode *inode, struct fuse_file *ff)
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index 10a7f31c4bdf..1b5699407e11 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -251,6 +251,9 @@
  *
  *  7.47
  *  - add FUSE_HAS_SYNCFS opt-in flag for privileged userspace servers
+ *
+ *  7.48
+ *  - add FUSE_PER_INODE_NO_OPEN and FUSE_ATTR_NO_OPEN
  */
 
 #ifndef _LINUX_FUSE_H
@@ -286,7 +289,7 @@
 #define FUSE_KERNEL_VERSION 7
 
 /** Minor version number of this interface */
-#define FUSE_KERNEL_MINOR_VERSION 47
+#define FUSE_KERNEL_MINOR_VERSION 48
 
 /** The node ID of the root inode */
 #define FUSE_ROOT_ID 1
@@ -473,6 +476,7 @@ struct fuse_file_lock {
  *		with CAP_SYS_ADMIN in the initial user namespace (the same
  *		privilege that mounting virtiofs or fuseblk requires).
  *		Insufficiently privileged servers ignore it.
+ * FUSE_PER_INODE_NO_OPEN: honor FUSE_ATTR_NO_OPEN in inode attributes
  */
 #define FUSE_ASYNC_READ		(1 << 0)
 #define FUSE_POSIX_LOCKS	(1 << 1)
@@ -522,6 +526,7 @@ struct fuse_file_lock {
 #define FUSE_REQUEST_TIMEOUT	(1ULL << 42)
 #define FUSE_HAS_IO_URING_BUFPOOL (1ULL << 43)
 #define FUSE_HAS_SYNCFS		(1ULL << 44)
+#define FUSE_PER_INODE_NO_OPEN	(1ULL << 45)
 
 /**
  * CUSE INIT request/reply flags
@@ -605,9 +610,15 @@ struct fuse_file_lock {
  *
  * FUSE_ATTR_SUBMOUNT: Object is a submount root
  * FUSE_ATTR_DAX: Enable DAX for this file in per inode DAX mode
+ * FUSE_ATTR_NO_OPEN: Skip OPEN/OPENDIR and matching RELEASE/RELEASEDIR;
+ *                   requires FUSE_PER_INODE_NO_OPEN. Atomic O_TRUNC opens
+ *                   still go to the server. RELEASE is also sent after a
+ *                   successful remote flock operation to clean up locks,
+ *                   even when OPEN was skipped and the file handle is zero.
  */
 #define FUSE_ATTR_SUBMOUNT      (1 << 0)
 #define FUSE_ATTR_DAX		(1 << 1)
+#define FUSE_ATTR_NO_OPEN	(1 << 2)
 
 /**
  * Open flags

-- 
2.43.0

