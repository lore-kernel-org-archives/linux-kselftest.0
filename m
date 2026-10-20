Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.35.192.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510517;
	b=aUgOx4U2810tJ3ET7Kw10VE28YxkQ/vhAYrajGTmPBtycZ2ZqVAj8jQVOSZU0l+UEJno
	 J4bwlkc4R/7ITPQYkD37uQLOCdkZglx2p6CKUKldI6FjRcNA7V4IYYb+AOgnpXj/Wp43L
	 b8uODyu03O0RAH2a6j54EF0K/Ff1PM2k+Hg1r4m59eXSJBCZzMPcQchG5+1NGATwvj5vo
	 vfKp9rylMryP3E2AeE5GnOtkyLuUnB5GuB7ILlmAXmtQzc0Nfu8lIajCPdIYCAXHfIwKG
	 RRwW+eec2nsgFvIFfOd2OtWWgp1eMJfq6E5T8ovktXwYXpAxfaZiY8S6hqolRBZrqhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510517;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=urdzSJWbPB8UwfOnlNFNChzCSBqjzWzge4kvVhpOsOI=;
	b=3YPOd4fei4dI4LfZU4LgPe640k+ncXJpFmWWmt05rhMlB1ePg1Vnf7h/t3fYiKXbKnuq
	 hHenlvUq0e9Jg71igHYbsAK07ZYT3qSFDBaqF/P1FTl0SeMF6JtyikULp+SuczpFwNPaX
	 jsnJ9KYHrWA33zOhjMyYEFMmqhmm2hozqxjuFtLez9L396+tlT3Vozg+wUVSd2UM2Wvdg
	 Lzd76vI5LNfaUw+b70lTGPGqdRh8/kFjEJbHt65Pb/SqaJSIibla0xG/FMbTWeZ9EVePA
	 qhS1V8P7I1lgjgXXALf+QRfrn6k4+k9T9/s6BvZyn61gISBwg4VxiO2LZCEdgqXDhWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=M5ZOgK3N;
	arc=none smtp.remote-ip=52.35.192.45
Received: from pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.35.192.45])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F597606A31F
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Oct 2026 15:35:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F597606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=M5ZOgK3N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1792510516; x=1824046516;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=urdzSJWbPB8UwfOnlNFNChzCSBqjzWzge4kvVhpOsOI=;
  b=M5ZOgK3NNF6uXu2kcqSpUBGlySd/nbkmaobdfE8hfUlDrB3HfeH0oQQh
   2MZEYLwo5AdmLlRBX01AXeIvWyKlZ2xKh7GH6AH6GxRZ+sIMi+XHGRsGY
   /FvU1uRPbeKya5s+4MQV3RyBP70TsrOkwWCZcMeQ0DKocebWJBoOTOhAv
   U1jQlUQKSlTYks4NVxcaoGBLICWrUXUwIPRswnqAQtY8hUaGXouoRKIjI
   47WgI/t52bMuQMD48+JmlKhrFFS+H9GC5drabdMcRNZh6pTyf4o4qAXXl
   WJBkBw3sXYi1uibu/6CU60dTfPFYsSZOQqP2+pdddSTpDr+ILGudKqdns
   Q==;
X-CSE-ConnectionGUID: RwaUBvZMRNCn4+wiwvGNqw==
X-CSE-MsgGUID: SSH5MkhTRPmeceMQxusnMw==
X-IronPort-AV: E=Sophos;i="6.27,168,1787011200"; 
   d="scan'208";a="31523193"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-011.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 15:35:16 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.178:22017]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.63.90:2525] with esmtp (Farcaster)
 id 743ce08c-59e2-4c15-b6da-58c787fbebd3; Tue, 20 Oct 2026 15:35:15 +0000 (UTC)
X-Farcaster-Flow-ID: 743ce08c-59e2-4c15-b6da-58c787fbebd3
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Tue, 20 Oct 2026 15:35:15 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.53;
 Tue, 20 Oct 2026 15:35:14 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: <fuse-devel@lists.linux.dev>, <linux-kselftest@vger.kernel.org>, "Shuah
 Khan" <shuah@kernel.org>, Bernd Schubert <bernd@bsbernd.com>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>
Subject: [PATCH 1/2] fuse: skip LOOKUP before exclusive create
Date: Tue, 20 Oct 2026 15:34:31 +0000
Message-ID: <20261020153432.3812719-2-jamz@amazon.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261020153432.3812719-1-jamz@amazon.com>
References: <20261020153432.3812719-1-jamz@amazon.com>
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
X-ClientProxiedBy: EX19D031UWA004.ant.amazon.com (10.13.139.19) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

mkdir(), mknod(), symlink(), link() and renameat2() with RENAME_NOREPLACE
look the new name up with FUSE_LOOKUP before sending the request, which
costs a round trip to the server.

Add an INIT flag, FUSE_EXCL_CREATE, with which the server fails
FUSE_MKNOD, FUSE_MKDIR, FUSE_SYMLINK, FUSE_LINK, and FUSE_RENAME2 with
RENAME_NOREPLACE, with -EEXIST for an existing name.  When the server
sets it, the lookup of a name that is about to be created returns
without sending FUSE_LOOKUP, and an existing name is reported by the
-EEXIST of the request.  After a failed request the name stays
uncached, so the next lookup goes to the server.

A rename that may replace its target looks the target up, so that the
kernel can check the permission to replace it.

Assisted-by: Claude:claude-opus-5-5 [Claude-Code]
Signed-off-by: Jimmy Zuber <jamz@amazon.com>
---
 fs/fuse/dir.c             | 10 ++++++++++
 fs/fuse/fuse_i.h          |  3 +++
 fs/fuse/inode.c           |  4 +++-
 include/uapi/linux/fuse.h | 10 +++++++++-
 4 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index f48fafccce4b..e491e6b3215a 100644
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
index 8546855386b5..babbacdfb757 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -509,6 +509,9 @@ struct fuse_conn {
 	 */
 	unsigned atomic_o_trunc:1;
 
+	/** @excl_create: Create requests check for an existing name */
+	unsigned excl_create:1;
+
 	/**
 	 * @export_support: Filesystem supports NFS exporting.
 	 * Only set in INIT
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index cbb10e19e7e8..1f1be0c521a1 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1432,6 +1432,8 @@ static void process_init_reply(struct fuse_args *args, int error)
 
 			if (fuse_syncfs_enable(fc, flags))
 				fc->sync_fs = 1;
+			if (flags & FUSE_EXCL_CREATE)
+				fc->excl_create = 1;
 		} else {
 			ra_pages = fc->max_read / PAGE_SIZE;
 			fc->no_lock = 1;
@@ -1490,7 +1492,7 @@ static struct fuse_init_args *fuse_new_init(struct fuse_mount *fm)
 		FUSE_SECURITY_CTX | FUSE_CREATE_SUPP_GROUP |
 		FUSE_HAS_EXPIRE_ONLY | FUSE_DIRECT_IO_ALLOW_MMAP |
 		FUSE_NO_EXPORT_SUPPORT | FUSE_HAS_RESEND | FUSE_ALLOW_IDMAP |
-		FUSE_REQUEST_TIMEOUT;
+		FUSE_REQUEST_TIMEOUT | FUSE_EXCL_CREATE;
 #ifdef CONFIG_FUSE_VDAX
 	if (fm->fc->vdax)
 		flags |= FUSE_MAP_ALIGNMENT;
diff --git a/include/uapi/linux/fuse.h b/include/uapi/linux/fuse.h
index 10a7f31c4bdf..8c079d3080bf 100644
--- a/include/uapi/linux/fuse.h
+++ b/include/uapi/linux/fuse.h
@@ -251,6 +251,9 @@
  *
  *  7.47
  *  - add FUSE_HAS_SYNCFS opt-in flag for privileged userspace servers
+ *
+ *  7.48
+ *  - add FUSE_EXCL_CREATE
  */
 
 #ifndef _LINUX_FUSE_H
@@ -286,7 +289,7 @@
 #define FUSE_KERNEL_VERSION 7
 
 /** Minor version number of this interface */
-#define FUSE_KERNEL_MINOR_VERSION 47
+#define FUSE_KERNEL_MINOR_VERSION 48
 
 /** The node ID of the root inode */
 #define FUSE_ROOT_ID 1
@@ -473,6 +476,10 @@ struct fuse_file_lock {
  *		with CAP_SYS_ADMIN in the initial user namespace (the same
  *		privilege that mounting virtiofs or fuseblk requires).
  *		Insufficiently privileged servers ignore it.
+ * FUSE_EXCL_CREATE: FUSE_MKNOD, FUSE_MKDIR, FUSE_SYMLINK, FUSE_LINK and
+ *		FUSE_RENAME2 with RENAME_NOREPLACE fail with -EEXIST for an
+ *		existing name, so the kernel sends them without a LOOKUP of
+ *		the name
  */
 #define FUSE_ASYNC_READ		(1 << 0)
 #define FUSE_POSIX_LOCKS	(1 << 1)
@@ -522,6 +529,7 @@ struct fuse_file_lock {
 #define FUSE_REQUEST_TIMEOUT	(1ULL << 42)
 #define FUSE_HAS_IO_URING_BUFPOOL (1ULL << 43)
 #define FUSE_HAS_SYNCFS		(1ULL << 44)
+#define FUSE_EXCL_CREATE	(1ULL << 45)
 
 /**
  * CUSE INIT request/reply flags
-- 
2.50.1

