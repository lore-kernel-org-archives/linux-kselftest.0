Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.83.148.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299848;
	b=cx1B0jDAA5/pbahDT+CtPAs6vcgDSEhXqg8T/1ljqxBQjtXhOjNvqSWjYmmzHKc3XbDo
	 9DREQ6lF1JTyVPvMA2xMm4S0TKw74hIU9kPPVQO0IcAv2YKhUs/LPz9ULk/sgpbb5bgu8
	 1bSnIW0mYmGPzhzExySrV3RZbHE8Ez2xdd7hLYs3N837sEelgCfoxh4GhQrWdNLzArosX
	 6Zoxg6XsE6gA0XnY0RPrvs1Ota7BNM1vvU14w94Xa7NvJ51FIxMOPMmPnu9WLIrxFwEGE
	 rYfZ5H0Q4LiVawvFebYsI1Tla8jkYyfY+Ab2urXLtsyMRNXBEzqwjimu3I1F+FgrfCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299848;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=kt31RkZvs3Js/rRT4Zbm1eAJylYnR0XDwopyriblP6o=;
	b=3qWYdRd3Wrfodh9koOJs1QTYrnnx/oUxcOXnQm3TH9NM2SfCu+0jI5ubrTyXLN/Xy3Ud
	 rknX1VvpD4rZunhweBKIuFd8d4UEwXL1+EZZtA9jq5Zbov1vHoPaAguQ8OR4cnUcEZY8m
	 uYce5ivnUszlah030SJU+zFR6QUdH6Bpk5ii+qtvK6LTAqb5DK8g4jc9d49k7I+8PjhvX
	 afWVAoyz+j6QDX8t3RUBqTaKPLdISi2KRQDzgI8TPq9SjnCAyq/Fn2Twm2/AdrhPjlgcv
	 iRdaWrs4K+M/gRh6hCPfDGr973ikzlvC+wc68UDwHOwWHKuFS7SH18bou/FJyR+O7pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=oKhzjY1z;
	arc=none smtp.remote-ip=35.83.148.184
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.83.148.184])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FC1606A327
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Oct 2026 18:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1FC1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=oKhzjY1z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1793299846; x=1824835846;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kt31RkZvs3Js/rRT4Zbm1eAJylYnR0XDwopyriblP6o=;
  b=oKhzjY1z8wPfygac/z8PZ/yM7tcHHfgKU0VhrT7ieiZ0gSB+P7BTKyoz
   gr0qO8oezONex7pmbwIU4ie+NWEr8gLkbsSRPJUo4nqxTi8ks+ZJwQBxA
   3D/7kNO7hgiKjjefOtKQc/3hgo46kg0V2KFAxLP3Xn+sqMzEKIC4T+nOu
   As+6l96lkj4/QKWq2jCruv88Uv8vw8ErCoBFy0gFb4Vqb+EzJpIi8l8aP
   xkJxqndwnFLcQSQCOyZWXAAei/iUEC37JPT/W+KoJaWB9BicH/xYb1oXX
   u1XjyJp5zC4WU5bD5cZgtwUGa9LZ/7ryMrufzr4p/rXwAMPjYoQqT+oH4
   w==;
X-CSE-ConnectionGUID: aEgEyDVDQRO0k6U3NVhPkg==
X-CSE-MsgGUID: a16Vh8rbQMCQzsdJYqDR3A==
X-IronPort-AV: E=Sophos;i="6.27,184,1787011200"; 
   d="scan'208";a="32391019"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 18:50:43 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:27962]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.63.21:2525] with esmtp (Farcaster)
 id 6fd115fd-b7f7-4055-a1a0-5f83e1515a33; Thu, 29 Oct 2026 18:50:43 +0000 (UTC)
X-Farcaster-Flow-ID: 6fd115fd-b7f7-4055-a1a0-5f83e1515a33
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 29 Oct 2026 18:50:43 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 29 Oct 2026 18:50:42 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: <fuse-devel@lists.linux.dev>, <linux-kselftest@vger.kernel.org>, "Shuah
 Khan" <shuah@kernel.org>, Bernd Schubert <bernd@bsbernd.com>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>
Subject: [PATCH v2 1/2] fuse: skip LOOKUP before exclusive create
Date: Thu, 29 Oct 2026 18:50:09 +0000
Message-ID: <20261029185010.3080336-2-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029185010.3080336-1-jamz@amazon.com>
References: <20261029185010.3080336-1-jamz@amazon.com>
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
X-ClientProxiedBy: EX19D031UWC002.ant.amazon.com (10.13.139.212) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

mkdir(), mknod(), symlink(), link() and renameat2() with RENAME_NOREPLACE
look the new name up with FUSE_LOOKUP before sending the request, which
costs a round trip to the server.

Add an INIT flag, FUSE_EXCL_CREATE, with which the server fails
FUSE_MKNOD, FUSE_MKDIR, FUSE_SYMLINK, FUSE_LINK, and FUSE_RENAME2 with
RENAME_NOREPLACE, with -EEXIST for an existing name.  When the server
sets it, the lookup of a name that is about to be created returns
without sending FUSE_LOOKUP, and an existing name is reported by the
-EEXIST of the request.  The VFS checks the request before sending it,
so an existing name can also fail with the error of such a check, such
as -EROFS on a read-only mount or -EACCES without write permission on
the directory.  After a failed request the name stays uncached, so the
next lookup goes to the server.

A rename that may replace its target looks the target up, so that the
kernel can check the permission to replace it.

Assisted-by: Claude:claude-opus-5-5 [Claude-Code]
Signed-off-by: Jimmy Zuber <jamz@amazon.com>
---
 fs/fuse/dir.c             | 10 ++++++++++
 fs/fuse/fuse_i.h          |  6 ++++++
 fs/fuse/inode.c           |  4 +++-
 include/uapi/linux/fuse.h | 12 +++++++++++-
 4 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index 28516a1760e24..c4d47ef1a195c 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -627,6 +627,16 @@ static struct dentry *fuse_lookup(struct inode *dir, struct dentry *entry,
 		return ERR_PTR(-EIO);
 
 	fc = get_fuse_conn_super(dir->i_sb);
+
+	/* The request fails with -EEXIST if the name exists */
+	if (fc->excl_create &&
+	    (flags & (LOOKUP_CREATE | LOOKUP_EXCL)) ==
+	    (LOOKUP_CREATE | LOOKUP_EXCL)) {
+		if (entry->d_name.len > fc->name_max)
+			return ERR_PTR(-ENAMETOOLONG);
+		return NULL;
+	}
+
 	epoch = atomic_read(&fc->epoch);
 
 	locked = fuse_lock_inode(dir);
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index c91af283aef20..1d4cc77887e50 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -537,6 +537,12 @@ struct fuse_conn {
 	 */
 	unsigned atomic_o_trunc:1;
 
+	/**
+	 * @excl_create: Create requests check for an existing name.
+	 * Only set in INIT
+	 */
+	unsigned excl_create:1;
+
 	/**
 	 * @export_support: Filesystem supports NFS exporting.
 	 * Only set in INIT
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 1341b681d0ed3..97ff1b87186d9 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1445,6 +1445,8 @@ static void process_init_reply(struct fuse_args *args, int error)
 
 			if (fuse_syncfs_enable(fc, flags))
 				fc->sync_fs = 1;
+			if (flags & FUSE_EXCL_CREATE)
+				fc->excl_create = 1;
 		} else {
 			ra_pages = fc->max_read / PAGE_SIZE;
 			fc->no_lock = 1;
@@ -1503,7 +1505,7 @@ static struct fuse_init_args *fuse_new_init(struct fuse_mount *fm)
 		FUSE_SECURITY_CTX | FUSE_CREATE_SUPP_GROUP |
 		FUSE_HAS_EXPIRE_ONLY | FUSE_DIRECT_IO_ALLOW_MMAP |
 		FUSE_NO_EXPORT_SUPPORT | FUSE_HAS_RESEND | FUSE_ALLOW_IDMAP |
-		FUSE_REQUEST_TIMEOUT;
+		FUSE_REQUEST_TIMEOUT | FUSE_EXCL_CREATE;
 #ifdef CONFIG_FUSE_VDAX
 	if (fm->fc->vdax)
 		flags |= FUSE_MAP_ALIGNMENT;
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index 616430a2973c6..0731e555ad9cb 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -257,6 +257,9 @@
  *  - add backing_id_64 to fuse_open_out
  *  - add FUSE_NOTIFY_BACKING_MAP, fuse_notify_backing_map_out, fuse_extent
  *  - add FUSE_BACKING_MAP_CREATE, FUSE_BACKING_MAP_CYCLIC
+ *
+ *  7.48
+ *  - add FUSE_EXCL_CREATE
  */
 
 #ifndef _LINUX_FUSE_H
@@ -292,7 +295,7 @@
 #define FUSE_KERNEL_VERSION 7
 
 /** Minor version number of this interface */
-#define FUSE_KERNEL_MINOR_VERSION 47
+#define FUSE_KERNEL_MINOR_VERSION 48
 
 /** The node ID of the root inode */
 #define FUSE_ROOT_ID 1
@@ -480,6 +483,12 @@ struct fuse_file_lock {
  *		privilege that mounting virtiofs or fuseblk requires).
  *		Insufficiently privileged servers ignore it.
  * FUSE_PASSTHROUGH_V2: use 64 bit server allocated backing ID
+ * FUSE_EXCL_CREATE: FUSE_MKNOD, FUSE_MKDIR, FUSE_SYMLINK, FUSE_LINK and
+ *		FUSE_RENAME2 with RENAME_NOREPLACE fail with -EEXIST for an
+ *		existing name, so the kernel sends them without a LOOKUP of
+ *		the name. The VFS checks the request before sending it, so an
+ *		existing name can also fail with the error of such a check,
+ *		such as -EROFS
  */
 #define FUSE_ASYNC_READ		(1 << 0)
 #define FUSE_POSIX_LOCKS	(1 << 1)
@@ -530,6 +539,7 @@ struct fuse_file_lock {
 #define FUSE_HAS_IO_URING_BUFPOOL (1ULL << 43)
 #define FUSE_HAS_SYNCFS		(1ULL << 44)
 #define FUSE_PASSTHROUGH_V2	(1ULL << 45)
+#define FUSE_EXCL_CREATE	(1ULL << 46)
 
 /*
  * CUSE INIT request/reply flags
-- 
2.50.1

