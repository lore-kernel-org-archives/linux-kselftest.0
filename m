Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5396C2820C6;
	Wed,  8 Jul 2026 13:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783516269; cv=none; b=KOgg1TbZKuav2q02I3rzIc4NFBkttDHyxEKhZQ0w5AyY1c7UoEqUDG9ZiO4tKUQ8kDLceM4zRZfmtTISvDNDohv8OIe1Yxc4BE0UIjmENj9bg7TpOrztMJDwVEIyou9ZKuZxjOWi48eyZOmreIJzXj7rgvFQZ/DnskZkg6uAhXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783516269; c=relaxed/simple;
	bh=eElheoCkxhqCcnHAHuHAMFo+oy3GhkaMPcphEdBYmKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k62pPY/U0XFTe7YXFUFks/UHTywi4Mogh2bJ+UBgqjzwhnYEYySnsxG2frgDBST4w81VGQv/cKncD9mhjs6tt7OMsFfprnw6jU8T05uI5omWjUgILohEFVzkIMDmd7KNjcvarP2RzFVjQnR8ojRJiwbV4T+OnZPQdN4vDnAoT58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=h6HLYRhc; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="h6HLYRhc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=QLJ99nCgFgJOv66DmJHby7F0GCFR95dwG3N7DBlvEhY=; b=h6HLYRhc0dxvufZq+X2Mo97N8q
	H/hAfS6Y08278kkEyYqaEU6mGHAM7Sf1boT0cz51dmcCtWH2dhoklQCbMONhEA8n9gfQYfblGBb0c
	BvgplWNRdHnTBJFdYD19bGdV3Qwrf+CDn71yTvNhlzRaaPXuWDA3pBu/TIPgTjVcvK3neKwobkLYE
	T/cYnZyYeuqYAHGw+DweGxl75KfPt1wzmRaAON5Qf8d2ylpr5exvcH9gSN2vnHWbSPC2qcHJBi2Qr
	h1kVJnRJM8PMn3KA71fw1wDCdTVipRgCLzj00gyoFyxEyyy8Zk+50nSUGs13auMlnlm6gAnAtsfGS
	djHuuyYQ==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with utf8esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1whS3J-00BiU4-Rl; Wed, 08 Jul 2026 15:11:01 +0200
From: Luis Henriques <luis@igalia.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Matt Harvey <mharvey@jumptrading.com>,
	kernel-dev@igalia.com,
	Luis Henriques <luis@igalia.com>
Subject: [RFC PATCH v1 1/5] Documentation: fuse: add document on caches being used by FUSE
Date: Wed,  8 Jul 2026 14:11:18 +0100
Message-ID: <20260708131122.2917-2-luis@igalia.com>
In-Reply-To: <20260708131122.2917-1-luis@igalia.com>
References: <20260708131122.2917-1-luis@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This new file aims at documenting the caches that are used by FUSE.  At
the moment only the symlink and the ACLs caches are described.

Signed-off-by: Luis Henriques <luis@igalia.com>
---
 .../filesystems/fuse/fuse-caches.rst          | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/filesystems/fuse/fuse-caches.rst

diff --git a/Documentation/filesystems/fuse/fuse-caches.rst b/Documentation/filesystems/fuse/fuse-caches.rst
new file mode 100644
index 000000000000..52b2558b5a68
--- /dev/null
+++ b/Documentation/filesystems/fuse/fuse-caches.rst
@@ -0,0 +1,86 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========
+FUSE Caches
+===========
+
+Introduction
+============
+
+This document summarises the different types of caches that are used in FUSE.
+For each cache type, it attempts to document the rules that are followed to
+insert, validate and invalidate data into the cache.
+
+symlink caching
+===============
+
+Whenever there's a link resolution request, the VFS will call into
+``fuse_get_link()`` which will then send a ``FUSE_READLINK`` request to the
+user-space FUSE server. However, the server can ask the kernel to cache all
+links resolutions by setting the ``FUSE_CACHE_SYMLINKS`` flag during the
+``FUSE_INIT`` negotiation.
+
+If this flag is set, FUSE will immediately call into the VFS
+``__page_get_link()`` from the ``->get_link()`` inode operation. The first time
+this is done for a specific link, it will end-up sending the ``FUSE_READLINK``
+to user-space but the link contents will then be added into page-cache. The next
+time the link needs to be resolved, it will use the link content that is already
+cached, and will only fallback into sending the request to use-space if the
+folio isn't up-to-date.
+
+ACL caching
+===========
+
+FUSE has allowed the usage of POSIX ACLs for a long time as they could be set
+and accessed simply as extended attributes. However, it was only with the
+addition of the ``FUSE_POSIX_ACL`` flag that ACLs started to be fully supported.
+Without this flag, ACLs can still be set, but the VFS won't use them for
+performing permission checks - that would be the user-space server's
+responsibility.
+
+Also, without setting ``FUSE_POSIX_ACL``, ACLs will not be cached by the kernel.
+In this case, new inodes ``i_acl`` and ``i_default_acl`` fields will be set to
+``ACL_DONT_CACHE``.
+
+On the other hand, if ``FUSE_POSIX_ACL`` is set during ``FUSE_INIT``, when an
+ACL is accessed the VFS layer will first check if it's already cached. If it is
+not, FUSE ``->get_acl`` operation is called, which will eventually send a
+user-space request. Future accesses to this inode ACL will then use the cached
+data.
+
+Setting an ACL in an inode, however, won't cache it immediately. It will send
+user-space a request with the new ACL, and the FUSE server may perform some
+modifications before storing it.
+
+On the other hand, ACLs will be removed for the cache in the following
+situations:
+
+-  When setting an ACL in an inode and the user-space server has set the
+   ``FUSE_POSIX_ACL`` flag, all previously cached ACLs for this inode will be
+   invalidated.
+-  When invalidating an inode through the ``FUSE_NOTIFY_INVAL_INODE`` operation.
+-  When ``->d_revalidate()`` is called for a dentry that requires a lookup (e.g.
+   it has expired) and that lookup operation is successful.
+-  When the VFS needs to check access rights for an inode (by calling
+   ``->permission()``), attributes may need to be refreshed. If that happens,
+   any cached ACLs for that inode will be invalidated.
+-  After setting an inode attribute (i.e. operation ``FUSE_SETATTR`` is sent to
+   user-space), the user-space server may have also updated the ACLs, so any
+   cached ACLs for this inode are also invalidated.
+-  While processing ``FUSE_READDIRPLUS`` and a new dentry is added (unless this
+   dentry is already being looked up (``DCACHE_PAR_LOOKUP``))
+-  In general, when there is the need to sent a ``FUSE_STATX`` or
+   ``FUSE_GETATTR`` to user-space (e.g. because the attributes have expired).
+   This may happen in the following cases:
+
+   -  When doing an ``->llseek()`` on a file with ``SEEK_END``, ``SEEK_HOLE`` or
+      ``SEEK_DATA``.
+   -  When the ``FUSE_AUTO_INVAL_DATA`` flag is set at ``INIT`` time (to
+      automatically invalidate cached pages), and a buffered read
+      (``->read_iter()``) past EOF is done on a non-passthrough file.
+   -  When the ``FUSE_WRITEBACK_CACHE`` flag is set at ``INIT`` time, and a
+      buffered write (``->write_iter()``) past EOF is done on a non-passthrough
+      file.
+   -  When the ``FUSE_AUTO_INVAL_DATA`` flag is set at ``INIT`` time and the VFS
+      needs to read a directory contents (``->iterate_shared()``) for a
+      directory that is allowed to be cached.
