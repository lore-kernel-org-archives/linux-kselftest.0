Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.246.77.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220204;
	b=smjK8CeYbSmOLLql9RvjK+//ODCFyOToqPJJHAkoZHCT4z50J28mHOhFErPsydTW874+
	 Oy+ysAEk+ENA5ocahs+xdQWc7ofuAv80ko2tZwgElHZC7kkOOzXUC7vhHAeTDK5PhZIQb
	 TCfwl6KK5Lqrgh6CIzQDpLx95uFEl2t0EUbP6bYvAW9DT3LJq1WVeXkFc15DI7CC8nqIN
	 1dYOVsfjzS6lX6xwk+hQtucwU46l5laplv46TLTUAapsp0XEdInHqQtzdCqeJc1NKZ2Sf
	 lO6nL3fNFljNlkYUyDkvzsSAH+ic2T57yLjJGE6CgoZ9bYL3Wt6N0ae9ploBPiSaidg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220204;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=6J38q7PlRtSxTJrpbKNOgpp1zar3iltF/P3/KzlqS00=;
	b=ibQVzET/wM7ViTboxZgltcpDj2KaZVnww0CWawV/mTJeUUFxdd3MBNnINXtcTkYJqYIt
	 n+2zBG4tb6Pvx0/XG5u2SY+88kT8walAPaCjynBS6yJMqi2PhPSPCFAXOdzUSuquHFVds
	 cdaZhb63yzAcFzXVFBwWUoN71yPvXDfvgt3fmwlOddE4KjpdZOf99OowynifrSqlAM1CB
	 jlOB/rZk15Ct4voFJSAL8QNoHwhzZfiBseSUobxRCys+nUpKaFG8UVmC4XGyijrayPlsd
	 GUXT/bJttzFaux4jT/CnMVXsSM7vqpwkrOUlIPY7rDLweLCg7Gp/q1Gw/OGBhy///iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=SPMKrvKj;
	arc=none smtp.remote-ip=44.246.77.92
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.77.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D57606A6A8
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 00:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95D57606A6A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=SPMKrvKj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1795220203; x=1826756203;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6J38q7PlRtSxTJrpbKNOgpp1zar3iltF/P3/KzlqS00=;
  b=SPMKrvKjfDMmFiKOLxye/zYuwEcl3YkVuMwR24JDEndC+JNTu0gm9cxU
   GxMzLgde0gbvMuPIhy0XC6PZ/fhsYyS11JPlZl8o18pWLnbRI4Sn4fivW
   cIxZeDC3A980yIgjNVqutjUXlx6aiwx8X56zcMCAuuOFdQOxKXjnNBB8b
   Jmwn0OPYEIKzUa68Cl4wQ7K4jetr4oYE2UCEjtcTfOIk9FA7VgqEJjQ8r
   YbRrZGruLRY1l+XgU+gS3v8B/RM72c/yJTvPQRFy/4ZA/04c09ytt9qko
   n6USvm22Bw28CUKV/A44kx+w4ei5wZILjOou3GzxlkM8Ac6Wxb6DcVfOe
   Q==;
X-CSE-ConnectionGUID: wGSVPnYnQnC/I2h6PyqwtQ==
X-CSE-MsgGUID: 2Gwp4UucSm2AjnR+b9izoA==
X-IronPort-AV: E=Sophos;i="6.27,223,1787011200"; 
   d="scan'208";a="34705234"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 00:16:42 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:18026]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.36.222:2525] with esmtp (Farcaster)
 id 2e64ba3b-1898-40c2-85be-9ec03f207c27; Sat, 21 Nov 2026 00:16:42 +0000 (UTC)
X-Farcaster-Flow-ID: 2e64ba3b-1898-40c2-85be-9ec03f207c27
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57;
 Sat, 21 Nov 2026 00:16:42 +0000
Received: from dev-dsk-jamz-1e-e35f4cd9.us-east-1.amazon.com (10.189.35.140)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.57;
 Sat, 21 Nov 2026 00:16:41 +0000
From: Jimmy Zuber <jamz@amazon.com>
To: Miklos Szeredi <miklos@szeredi.hu>
CC: <fuse-devel@lists.linux.dev>, <linux-kselftest@vger.kernel.org>, "Shuah
 Khan" <shuah@kernel.org>, Bernd Schubert <bernd@bsbernd.com>, Jim Harris
	<jiharris@nvidia.com>, Horst Birthelmer <horst@birthelmer.de>, Luis Henriques
	<luis@igalia.com>, NeilBrown <neil@brown.name>, Joanne Koong
	<joannelkoong@gmail.com>
Subject: [PATCH v9 1/3] fuse: move fuse_statx_to_attr() up
Date: Sat, 21 Nov 2026 00:16:06 +0000
Message-ID: <20261121001608.996811-2-jamz@amazon.com>
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
X-ClientProxiedBy: EX19D031UWC003.ant.amazon.com (10.13.139.252) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

Move fuse_statx_to_attr() above fuse_atomic_open(), for use by
FUSE_OPEN_ATOMIC in the next patch.

Signed-off-by: Jimmy Zuber <jamz@amazon.com>
---
 fs/fuse/dir.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
index da23ccd8685cf..a719e3516e187 100644
--- a/fs/fuse/dir.c
+++ b/fs/fuse/dir.c
@@ -935,6 +935,26 @@ static int fuse_create_open(const struct mnt_idmap *idmap, struct inode *dir,
 	return err;
 }
 
+static void fuse_statx_to_attr(struct fuse_statx *sx, struct fuse_attr *attr)
+{
+	memset(attr, 0, sizeof(*attr));
+	attr->ino = sx->ino;
+	attr->size = sx->size;
+	attr->blocks = sx->blocks;
+	attr->atime = sx->atime.tv_sec;
+	attr->mtime = sx->mtime.tv_sec;
+	attr->ctime = sx->ctime.tv_sec;
+	attr->atimensec = sx->atime.tv_nsec;
+	attr->mtimensec = sx->mtime.tv_nsec;
+	attr->ctimensec = sx->ctime.tv_nsec;
+	attr->mode = sx->mode;
+	attr->nlink = sx->nlink;
+	attr->uid = sx->uid;
+	attr->gid = sx->gid;
+	attr->rdev = new_encode_dev(MKDEV(sx->rdev_major, sx->rdev_minor));
+	attr->blksize = sx->blksize;
+}
+
 static int fuse_mknod(const struct mnt_idmap *, struct inode *, struct dentry *,
 		      umode_t, dev_t);
 static int fuse_atomic_open(struct inode *dir, struct dentry *entry,
@@ -1410,26 +1430,6 @@ static void fuse_fillattr(const struct mnt_idmap *idmap, struct inode *inode,
 	stat->blksize = 1 << blkbits;
 }
 
-static void fuse_statx_to_attr(struct fuse_statx *sx, struct fuse_attr *attr)
-{
-	memset(attr, 0, sizeof(*attr));
-	attr->ino = sx->ino;
-	attr->size = sx->size;
-	attr->blocks = sx->blocks;
-	attr->atime = sx->atime.tv_sec;
-	attr->mtime = sx->mtime.tv_sec;
-	attr->ctime = sx->ctime.tv_sec;
-	attr->atimensec = sx->atime.tv_nsec;
-	attr->mtimensec = sx->mtime.tv_nsec;
-	attr->ctimensec = sx->ctime.tv_nsec;
-	attr->mode = sx->mode;
-	attr->nlink = sx->nlink;
-	attr->uid = sx->uid;
-	attr->gid = sx->gid;
-	attr->rdev = new_encode_dev(MKDEV(sx->rdev_major, sx->rdev_minor));
-	attr->blksize = sx->blksize;
-}
-
 static int fuse_do_statx(const struct mnt_idmap *idmap, struct inode *inode,
 			 struct file *file, struct kstat *stat)
 {
-- 
2.50.1

