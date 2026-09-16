Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF4D4AB3B8;
	Wed, 16 Sep 2026 15:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789574169; cv=none; b=GvFsylIH8qBiPyf47sdqRZRYPwsCLm+pOlBDOemj6gDbIph7L1ILeNGV2O7nUPbXwYnwX1dF1g+jigS4Sx+zQ6SydxBukIaKyACc3YPCsaUPkpwxlINGJUum5rbUdAgqTEyjjGf911E0nLWjKf0dXrHaF0nBNvb/avV02OwaVes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789574169; c=relaxed/simple;
	bh=SJ1dQmglYm8zeefIb3WBPDxbjCnAGi1AF8SZ+vDra48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OxZZElVQfJt+dPMpzt1ehkUsKUqhrwZnIeOtwljqcspjD3mueSJ9B++TUeHSK/oFJFODLjY4qZsA+0kTTRXvpYAO8uAeSXnHNM78tbsIxr2EetGO5gTookIiaRVbfDURSn5sV3r7YnhZZYEv8Kgw2jfJZGwOlLy/6a6aEMKWsHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=JENy3fMF; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="JENy3fMF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=kS+gOOxZwZTiTZdXzBZnDBM6FaeqB/roZcfxX4lzLsQ=; b=
	JENy3fMFNr9FR/0tkbzJf58khr2gkMyx5h/TdK8YJ0hq7aken/cG6+x7qbQTtpRSPvDfpzVOHHs8R
	BRzy4nbhZldXGhjnVTOZjTpIzTlOtnfnOLj2hAP7psS/LNB+Sa2czxYCOLY/5TrruBQvL7t0TD5BK
	dzc6eJTRB+zL1nnXYjd1HkFaKW1HulZyAUKJ6jrOGUi0wMUovhoOPEx5vYJGbM16NnGBpItOrTy+Q
	Lkl7n5IxLYS8h6kCZi1on5xgOykChG3vgbh6Udpx2NhGn26cvAyTRQ30FXoiU0q7TBqhyXGf4hJJB
	7nlBLiAMKKoYoCHT1upF6I2B3ql3+HHkFQ==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x6ryw-0031JV-3R; Wed, 16 Sep 2026 17:55:33 +0200
From: Luis Henriques <luis@igalia.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Amir Goldstein <amir73il@gmail.com>,
	Chen Linxuan <me@black-desk.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Matt Harvey <mharvey@jumptrading.com>,
	kernel-dev@igalia.com,
	Luis Henriques <luis@igalia.com>
Subject: [RFC PATCH v4 1/8] Documentation: fuse: add document on caches being used by FUSE
Date: Wed, 16 Sep 2026 16:56:22 +0100
Message-ID: <20260916155629.32421-2-luis@igalia.com>
In-Reply-To: <20260916155629.32421-1-luis@igalia.com>
References: <20260916155629.32421-1-luis@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This new file aims at documenting the caches that are used by FUSE.  At
the moment only symlink, attributes, ACLs and readdir caches are described.

Signed-off-by: Luis Henriques <luis@igalia.com>
---
 .../filesystems/fuse/fuse-caches.rst          | 148 ++++++++++++++++++
 Documentation/filesystems/fuse/index.rst      |   1 +
 2 files changed, 149 insertions(+)
 create mode 100644 Documentation/filesystems/fuse/fuse-caches.rst

diff --git a/Documentation/filesystems/fuse/fuse-caches.rst b/Documentation/filesystems/fuse/fuse-caches.rst
new file mode 100644
index 000000000000..b133066429b1
--- /dev/null
+++ b/Documentation/filesystems/fuse/fuse-caches.rst
@@ -0,0 +1,148 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========
+FUSE Caches
+===========
+
+Introduction
+============
+
+This document summarises the different types of caches used in FUSE. For each
+cache type, it documents the rules to insert data into it. It also documents the
+rules for validating and invalidating data in the cache.
+
+symlink caching
+===============
+
+Whenever there's a link resolution request for a FUSE filesystem, the VFS will
+call into ``fuse_get_link()``, the ``->get_link()`` inode operation. This
+function will then send a ``FUSE_READLINK`` request to the user-space FUSE
+server.
+
+The server can ask the kernel to cache all link resolutions by setting the
+``FUSE_CACHE_SYMLINKS`` flag during the ``FUSE_INIT`` negotiation. If this flag
+is set, when the VFS calls into the ``->get_link()`` operation, FUSE will
+immediately call ``__page_get_link()``. The first time this is done for a
+specific inode, it will result in sending the ``FUSE_READLINK`` request to
+user-space. But the result returned from this request will then be added into
+the page-cache. The next time this link needs to be resolved, it will use the
+link resolution already cached, and will only fallback to user-space if the
+folio isn't up-to-date.
+
+Attributes caching
+==================
+
+Inode attributes may be obtained from user-space by different FUSE operations.
+For example, ``FUSE_LOOKUP``, ``FUSE_GETATTR``, and also several other
+operations that create file system objects (e.g. ``FUSE_MKDIR``). These
+attributes obtained from user-space are cached by the kernel. They have,
+however, a timeout associated and once it expires, they are invalidated. The
+next time the attributes are needed, a request (``FUSE_GETATTR``) will be sent
+to the FUSE server.
+
+The ``FUSE_GETATTR`` request can be sent to user-space in three different
+scenarios:
+
+#. if the attributes for the inode aren't yet available in the kernel;
+#. if they are not valid any more (timed-out, or have been invalidated), or
+#. if there is an explicit request for forcing the request to be sent (for
+   example, by using the ``AT_STATX_FORCE_SYNC`` flag in ``statx``).
+
+Regarding the attributes invalidation, they may happen in several occasions. For
+example, upon a user-space request for invalidation, through
+``FUSE_NOTIFY_INVAL_INODE``, ``FUSE_NOTIFY_INVAL_ENTRY``, or
+``FUSE_NOTIFY_DELETE`` requests.
+
+FUSE uses fine-grained invalidation masks rather than invalidating all
+attributes at once. The principle is that each operation only invalidates the
+specific attributes that the operation could have changed on the server. The
+masks used are:
+
+- ``STATX_ATIME`` - after reads and readlink, since the server may update access
+  time
+- ``STATX_CTIME`` - after xattr changes (including ACL set/remove) and rename
+- ``STATX_BLOCKS`` - after a successful flush with writeback cache, since the
+  server's block count may differ from the local one
+- ``FUSE_STATX_MODIFY`` (``STATX_MTIME | STATX_CTIME | STATX_BLOCKS``) - after
+  writeback completion (without writeback cache), since the server may have
+  updated modification metadata
+- ``FUSE_STATX_MODSIZE`` (``FUSE_STATX_MODIFY | STATX_SIZE``) - after writes,
+  truncate-on-open, and fallocate, since the server's size and modification
+  metadata may have changed
+- ``FUSE_STATX_MODDIR`` (``FUSE_STATX_MODSIZE | STATX_NLINK``) - after directory
+  modifications (create, unlink, mkdir, rmdir, rename), since the server may
+  have updated the directory's size, timestamps, and link count
+- ``STATX_BASIC_STATS`` - as a full invalidation, used for server-initiated
+  invalidation (FUSE\ :sub:`NOTIFY`\ \_INVAL\ :sub:`INODE`), interrupted
+  setattr, and interrupted link
+
+The full set of invalidation points can be found by searching for
+``fuse_invalidate_attr_mask()`` in the FUSE source.
+
+ACL caching
+===========
+
+FUSE has allowed the usage of POSIX Access Control Lists (ACLs) for a long time,
+as they can be set and accessed simply as extended attributes. However, it was
+only with the introduction of the ``FUSE_POSIX_ACL`` flag that ACLs started to
+be fully supported. Without this flag being set during the ``FUSE_INIT``
+negotiation, ACLs can still be set, but the VFS won't use them for performing
+permission checks - that would be the user-space server's responsibility.
+
+Also, without setting ``FUSE_POSIX_ACL``, ACLs will not be cached by the kernel.
+In this case, new inodes ``i_acl`` and ``i_default_acl`` fields will be set to
+``ACL_DONT_CACHE``.
+
+On the other hand, if the ``FUSE_POSIX_ACL`` flag is set then, when an inode ACL
+is accessed, VFS will first check if it's already cached. If it is not, FUSE
+``->get_acl()`` operation (``fuse_get_acl()``) is called, which will eventually
+send a user-space request. Future accesses to this inode ACL will use the cached
+data.
+
+Setting an ACL in an inode will also result in sending a request to the FUSE
+server for setting it. But this operation won't immediately cache the ACL -- it
+will only be cached after it is accessed again and requested from user-space.
+
+On the other hand, ACLs will be removed from the cache in the following
+situations:
+
+- When setting an ACL in an inode (and the ``FUSE_POSIX_ACL`` flag is set),
+  previously cached ACLs for this inode will be invalidated.
+- When invalidating an inode through the ``FUSE_NOTIFY_INVAL_INODE`` operation.
+- After setting an inode attribute (i.e. operation ``FUSE_SETATTR`` is sent to
+  user-space), the user-space server may have also updated the ACLs. Thus, any
+  cached ACLs for this inode are also invalidated.
+- Whenever attributes are refreshed from the server. For example, when while
+  revalidating a dentry (``->d_revalidate()``), or when updating a dentry during
+  while processing a ``FUSE_READDIRPLUS``.
+- In general, when there is the need to send a ``FUSE_STATX`` or
+  ``FUSE_GETATTR`` to user-space (e.g. when attributes expired).
+
+readdir caching
+===============
+
+When opening a directory a ``FUSE_OPENDIR`` will be sent to the FUSE server, and
+server will be responsible for setting the open flags related with caching,
+namely ``FOPEN_KEEP_CACHE`` and ``FOPEN_CACHE_DIR``.
+
+If neither flags are set by the user-space FUSE server, then every ``readdir``
+will result in a ``FUSE_READDIR`` (or ``FUSE_READDIRPLUS``) request being sent.
+If ``FOPEN_CACHE_DIR`` is set by the server, then the result of a ``readdir``
+will be cached by the kernel and reused for the current open.
+``FOPEN_KEEP_CACHE`` is about keeping the cache on **this** open, not on some
+**next** open.
+
+The readdir cache will also expire and reset if the inode's ``mtime`` or
+``iversion`` don't match the cached values, or if the FUSE connection ``epoch``
+doesn't match the cache ``epoch``.
+
+dentry caching
+==============
+
+TBD
+
+data caching
+============
+
+TBD
+
diff --git a/Documentation/filesystems/fuse/index.rst b/Documentation/filesystems/fuse/index.rst
index 3dada6c4057a..c03c8b7095ed 100644
--- a/Documentation/filesystems/fuse/index.rst
+++ b/Documentation/filesystems/fuse/index.rst
@@ -12,4 +12,5 @@ FUSE (Filesystem in Userspace) Technical Documentation
    fuse-io
    fuse-io-uring
    fuse-passthrough
+   fuse-caches
    uapi/fuse-uapi-io-uring
