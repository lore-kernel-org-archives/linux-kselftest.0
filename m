Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1043F326C;
	Thu,  1 Oct 2026 16:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790873307; cv=none; b=Fs7aj61kV5blZUFyvx/N3E9kjFnpNZEDxohHspETFV0KBt131kxv8Xg5SOkB0iNFYed70NKJkaNFfO2ZxCD9gPg7gyiW3ALfa0983g7G01X10j+2sxuYqJVeqK2xASTYytv8W8adVgLlooh+8Fpt7dz0/tk60XPh8a3wK0UFamo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790873307; c=relaxed/simple;
	bh=K0bt4/rsCjVYk7lX95RDEnLEyGWaw6zxMCwUzzDrqyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YmvgxSaNQodYgBbEDiiBKntNMMNEpK9FsGx8/CGmLlFVYQIXB+SS7nJJymj9DLRF0A/7jh33Rm5P4Dp482SDipH9KD7jQfyrXjRfKA5c3jJCJi09Z9aP2p0B2fY1M5p14eTwbT+WNOras0iS/F6et6js+ugKnHTOt6DOCRxHl2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ATcobHQw; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ATcobHQw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=Qh29u7W8n44uw3ujy4ikIKI+/2mx21IanJSeMnY8nyg=; b=
	ATcobHQw/N+nv4xR3o9oIfX9tP9W+pA6d4GW80UL70wcJnp6rIGGJ7auRflpcHjvQbJ8qTTYGPc79
	K7NuDidgNCfLdDYE2ySWHweFEvxLPcvZSArxJlJXiAr+FNq/NT6ByUR4d2JsyUpNdDaRdHeEhWeGP
	Oj4EIhp1bAcrXYNdJ+HmV8DzDlC0z4sKgYXDJdGVcRill6qPcyGI1fkDldt2QST930uPH9jw7W86Q
	YaDfLAnU1XNb+hXk1zVI1oyNU30kZzn+o8MhYuAl6LyW2ZegSxFbJwd2lUNr1SOL4cde5BPMrw1Qp
	JFqatDhCAHUqYesZQ9UftUNzsTTFGlEKHw==;
Received: from bl21-120-122.dsl.telepac.pt ([2.82.120.122] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xCJx9-00AD0e-QL; Thu, 01 Oct 2026 18:48:15 +0200
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
Subject: [RFC PATCH v5 1/8] Documentation: fuse: add document on caches being used by FUSE
Date: Thu,  1 Oct 2026 17:49:09 +0100
Message-ID: <20261001164916.15311-2-luis@igalia.com>
In-Reply-To: <20261001164916.15311-1-luis@igalia.com>
References: <20261001164916.15311-1-luis@igalia.com>
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
 .../filesystems/fuse/fuse-caches.rst          | 198 ++++++++++++++++++
 Documentation/filesystems/fuse/index.rst      |   1 +
 2 files changed, 199 insertions(+)
 create mode 100644 Documentation/filesystems/fuse/fuse-caches.rst

diff --git a/Documentation/filesystems/fuse/fuse-caches.rst b/Documentation/filesystems/fuse/fuse-caches.rst
new file mode 100644
index 000000000000..0778dd3d357f
--- /dev/null
+++ b/Documentation/filesystems/fuse/fuse-caches.rst
@@ -0,0 +1,198 @@
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
+  invalidation (``FUSE_NOTIFY_INVAL_INODE``), interrupted setattr, and
+  interrupted link
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
+Without setting ``FUSE_POSIX_ACL``, ACLs will not be cached by the kernel. In
+this case, new inodes ``i_acl`` and ``i_default_acl`` fields will be set to
+``ACL_DONT_CACHE``.
+
+If the ``FUSE_POSIX_ACL`` flag is set, when an inode ACL is accessed VFS will
+first check if it's already cached. If it is not, FUSE ``->get_acl()`` operation
+(``fuse_get_acl()``) is called, which will eventually send a user-space request.
+Future accesses to this inode ACL will use the cached data.
+
+Setting an ACL in an inode will also result in sending a request to the FUSE
+server for setting it. But this operation won't immediately cache the ACL -- it
+will only be cached after it is accessed again and requested from user-space.
+
+ACLs will be removed from the cache in the following situations:
+
+- When setting an ACL in an inode (and the ``FUSE_POSIX_ACL`` flag is set),
+  previously cached ACLs for this inode will be invalidated.
+- When invalidating an inode through the ``FUSE_NOTIFY_INVAL_INODE`` operation.
+- After setting an inode attribute (i.e. operation ``FUSE_SETATTR`` is sent to
+  user-space), the user-space server may have also updated the ACLs. Thus, any
+  cached ACLs for this inode are also invalidated.
+- Whenever attributes are refreshed from the server. For example, when
+  revalidating a dentry (``->d_revalidate()``), or when updating a dentry while
+  processing a ``FUSE_READDIRPLUS``.
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
+``FOPEN_CACHE_DIR`` determines if readdir results of this open will be cached
+and if readdir cache will be used to return readdir results during the current
+open. If ``FOPEN_KEEP_CACHE`` is set, any readdir cache from previous opens is
+preserved when the directory is opened. Otherwise, the old readdir cache is
+invalidated on open.
+
+The readdir cache will also expire and reset if the inode's ``mtime`` or
+``iversion`` don't match the cached values, or if the FUSE connection ``epoch``
+doesn't match the cache ``epoch``.
+
+dentry caching
+==============
+
+FUSE keeps track of all its file systems dentries in a set of rbtrees. These
+trees will keep the dentries sorted by their expiry time, so that it is easy to
+quickly invalidate expired dentries.
+
+This set of rbtrees is protected through hashed locks to reduce contention while
+doing trees traversal.
+
+When FUSE is initialised, an array of ``struct dentry_bucket`` is initialised
+with a predefined (``FUSE_HASH_SIZE``) number of elements. Each element of this
+array (``dentry_hash``) holds an rbtree (initially empty) of dentries. Every
+time a new dentry is created it will be added to one of the elements of this
+array's rbtree, where it will be sorted by its expiry time (``timeout``). The
+selection of the array element where a dentry is inserted is done through the
+``hash_ptr()`` hash function.
+
+A dentry expiry time will be set to a valid value (provided by the FUSE server)
+in several occasions:
+
+- When a new file system object is created (e.g. ``FUSE_CREATE``,
+  ``FUSE_MKDIR``, etc).
+- When a lookup is sucessfully performed.
+- When a dentry is sucessfully revalidated (``->d_revalidate()``).
+
+A dentry expiry time can be set to 0, indicating that it is stale. This means
+that a ``FUSE_LOOKUP`` will be sent to user-space then next time it needs to be
+looked up. It can be set to 0 in several occasions:
+
+- When the user-space FUSE server explicitly requests a dentry to be invalidated
+  (``FUSE_NOTIFY_INVAL_ENTRY``).
+- When a file system object is being deleted (e.g. ``FUSE_UNLINK``) or renamed.
+- When a filesystem object is being created and fails with ``-EEXIST``.
+- When a lookup fails with ``-ENOENT``.
+
+Cleaning up expired dentries can happen in different ways. One scenario is when
+the VFS requests a revalidation. If the timeout value is 0 (expired), a new
+lookup is sent to user-space. If this lookup results in ``-ENOENT``, the dentry
+is invalidated. If the lookup is successful, the dentry is re-validated and the
+expiry time will be updated. (There's a special case where the lookup is
+successful but the nodeid returned is different from the expected one; in this
+case a ``FUSE_FORGET`` needs to be sent to user-space and the dentry is
+invalidated.)
+
+Another way of cleaning-up expired dentries is through a mechanism that can be
+enabled through the ``inval_wq`` FUSE module parameter. Setting this parameter
+to a value >= 5 will create a workqueue that will periodically walk through all
+the dentries rbtrees in the ``dentry_hash`` array and invalidate those dentries
+that have already expired. Once all the rbtrees have been checked, the workqueue
+reschedules itself to run again after ``inval_wq`` seconds. By default, this
+workqueue is disabled (``inval_wq`` is set to 0).
+
+There is yet another mechanism that allows to clean all the cached dentries for
+a mounted file system, which is by incrementing the 'epoch'
+(``FUSE_NOTIFY_INC_EPOCH``). Each FUSE connection will have its epoch value set
+when it is created, and every new dentry have its ``->d_time`` set to the
+current connection epoch value. By incrementing the connection epoch value, all
+dentries that go through ``->d_revalidate()`` will be automatically invalidated
+because their ``->d_time`` is be smaller than the connection epoch. If
+``inval_wq`` is set, the workqueue to invalidate the dentries will be triggered
+immediately after the epoch is incremented.
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
