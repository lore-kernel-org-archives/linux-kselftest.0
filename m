Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2060650AC16
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 09:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057126; cv=none; b=OG9GWxx85gUQg/aBOG1wuwvFGHiZLr3xtPEVvsvCPtsc0QvhUaQpU9gxZUkj7w1MILuTnuHkY6BHcr6ObJm5Sec/OG3zawHSHMsLkVMOadaQuESWKMFs0wNWkf2tob32aFAYBNV0M0ZQOhgezNN/7h3AdiMnR2GjMnXGh5b9NB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057126; c=relaxed/simple;
	bh=RJj2fAAoSYFwFUq+hZOwwqTz8vG+ANPmSnO3H000nzA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aTFYdAi+wwzxSUCS7qYQu8IqzYC2pXK84mRj2z7BYj1ZFKJoBYFx6MqApzygm6xOpoecY619PcwizkPA6LOGB6hEhjsd13kJBl/2Fvav05VqYz8QBaJMa4WamBj6S7E3EkwpJdIw3R1uIVphJ54JfuwEGVIkXU6f2w/2F27MPwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=lGZzc/a5; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="lGZzc/a5"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-74ab6c88052so467960137.2
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 02:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792057116; x=1792661916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Nt5koYeNjqdzKeqQpmJI32L3fCUQ2SB26pb7zJ3MlRw=;
        b=lGZzc/a5oPvymQ8GnJELtz+nnO+Lrz45jw6PbW+vr6xz/HoXdiHCd/qzin8yDbDnsp
         TvWKvqtZ7Lau9adQV1yjb2APTx4mLFIozHfZ0sIo9CzWCI8/1QxV6i8Tq7oR4gTScTzy
         OgU0EMB592IWdPUTqQVqLmrQACXmKaAo2BSVIFJgHv74dAAt6kLB2HTOfpuq3AqcWSvN
         bOeoWFiAjlFlPfBKvM5/Yk+/PBLHkucq34c3vaFOFewjV4UKKIilSdX57YKHqYDYVSlN
         Qjx+XKaZF70w2DxqQUmI9NuXUNLQxQUJSeIV8nVVfPBqExCT4U5lFJEzh3b4yDZhviIa
         YvHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057116; x=1792661916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Nt5koYeNjqdzKeqQpmJI32L3fCUQ2SB26pb7zJ3MlRw=;
        b=FidpPPnKCi/HFQrLFmzoW73WRmAp7RR9jdvA+waKkRQV8xPkIUyRDIzvi/qXqcw4ai
         lU2jGknGFEArXfacwzUf9Jwv3V3LG1281/xdBDwR1FRpPmWoWSxi3DwjnFYwJT6kDN7l
         mhidUyiKETfxATvJ8vszGVmJF1k9Lh2GrEFFwy9NnOAsLP0Wy7II8PeWETy1hlwK9GCz
         1NKZNP3w6hiAJIq5RnGzyfzOlGuWTRsr0IPzdLkD0rUmXDDUwoA99JONAbVCyCL3a0wf
         nuDFiDGj9UztCRTznGg7b4LYFikHzf/CNXrX5NRjKPLSzVbbXsWerxhLKklXdzsZpqqs
         G3EA==
X-Gm-Message-State: AFq9FYIhoj2GRmxG4bBYFFqI+b+Gn6DCjNJsPM1POqlTKfoPLqpVTFqL
	EiYMHRgBrkbZnBHSxOMGzC0aSVrBGwCbJW0rLM4gM1X/0Ulez518afOx/VhSpmYgETfy4sBS6Pa
	VQ35r
X-Gm-Gg: AYBFou3eqHAwvCHVd5haMbScSZ2+21N1AWj8PggJV3Rb2G9K/hWTOfF5ixMeqFo2y4k
	o6AxXIsO/qRz9w2U83fpAEIzsSYJIkonKNpl9inXjRczpSyO4rpe1MLIDa7aI05gA5vkhqyOezI
	cXyOgkug63kVmSZoFDO7SsfRR2nNpmW9QMHJ9OzkQL453tw0mUryD9K5Vy/VBTbOi7yk89jokus
	MtHX88b30dUIBLAQJQDr6Kosvk50lWHE3AcLS3UMD0VGpH72aKLO0VTzg5jeoh7qI4zCcY6KtAk
	Y55ZXDAWtv/zVPAygVuqdBAHMcmXE1/wHz175/pBQWY3bBqPTqVDM8bm9EA+nHWRQe1kDp0Zohu
	aCG0XryDTUuwf35vKyD+9aqU4X3MaUbf9CAH6TDaeuqk+aw/rm0a152S0xq19o3GRc33EbuuGFs
	k/OMA4/MFf6PEeLWplENPOLmBXTh9zQe+E43j0jMNrn+L+Yz+6HbEjrtswcIWQ1/SGTb9O/HXJr
	DzWSYe8jMullaF8MwHdOhsGrOkgTarxbCIFKIaBXEdLDcmsbBHrBXktaKVaiPw11ZVYehP+BRir
	Qjmap6L9UhHS4p1ikBo=
X-Received: by 2002:a05:6102:448c:b0:7c3:1d7:f234 with SMTP id ada2fe7eead31-7cb36788160mr4679901137.2.1792057115645;
        Thu, 15 Oct 2026 02:38:35 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003d37009sm12275672241.2.2026.10.15.02.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:38:35 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	graf@amazon.com
Subject: [PATCH v1 6/7] mm/memfd_luo: Support tmpfs preservation and retrieval
Date: Thu, 15 Oct 2026 05:38:15 -0400
Message-ID: <20261015093816.2438942-7-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261015093816.2438942-1-pasha.tatashin@soleen.com>
References: <20261015093816.2438942-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Matlack <dmatlack@google.com>

Relax memfd_luo_can_preserve() to allow general shmem-backed files beyond
unlinked memfd pseudofiles, enabling userspace to preserve standard
tmpfs files across kexec.

Record MEMFD_LUO_FLAG_TMPFS in struct memfd_luo_ser.flags when a linked
tmpfs file is preserved so that tmpfs files must be retrieved as tmpfs
files and anonymous memfd files must be retrieved as memfd files.

To support restoring preserved tmpfs folios to a newly created tmpfs
file on the post-kexec filesystem, introduce struct
liveupdate_memfd_retrieve_arg in the UAPI and wire it up via .rarg on
memfd_luo_file_ops. When retrieving a preserved tmpfs file,
memfd_luo_retrieve() requires this argument, validates that the
specified file descriptor is a writable, empty, linked tmpfs file not
already claimed by LUO, locks its inode, and populates its address space
with the preserved folios. Validation failures on the user-provided
retrieve argument are marked retryable so userspace can retry
LIVEUPDATE_SESSION_RETRIEVE_FD without losing the preserved state.

Signed-off-by: David Matlack <dmatlack@google.com>
Co-developed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/kho/abi/memfd.h   |  13 ++-
 include/uapi/linux/liveupdate.h |  21 +++++
 mm/memfd_luo.c                  | 139 +++++++++++++++++++++++++-------
 3 files changed, 141 insertions(+), 32 deletions(-)

diff --git a/include/linux/kho/abi/memfd.h b/include/linux/kho/abi/memfd.h
index 08b10fea2afc8..47ff5ab967501 100644
--- a/include/linux/kho/abi/memfd.h
+++ b/include/linux/kho/abi/memfd.h
@@ -68,7 +68,18 @@ struct memfd_luo_folio_ser {
 			     F_SEAL_EXEC)
 
 /**
- * struct memfd_luo_ser - Main serialization structure for a memfd.
+ * MEMFD_LUO_FLAG_TMPFS - The preserved file is a tmpfs file.
+ *
+ * Indicates the file was preserved from a linked tmpfs file rather than an
+ * anonymous memfd, and must be retrieved to an empty tmpfs file.
+ */
+#define MEMFD_LUO_FLAG_TMPFS		BIT(0)
+
+/* The set of flags this version supports preserving. */
+#define MEMFD_LUO_ALL_FLAGS		MEMFD_LUO_FLAG_TMPFS
+
+/**
+ * struct memfd_luo_ser - Main serialization structure for a memfd or tmpfs file.
  * @pos:       The file's current position (f_pos).
  * @size:      The total size of the file in bytes (i_size).
  * @seals:     The seals present on the memfd. The seals are uABI so it is safe
diff --git a/include/uapi/linux/liveupdate.h b/include/uapi/linux/liveupdate.h
index 0ab28fd58fa5f..24e938d91392c 100644
--- a/include/uapi/linux/liveupdate.h
+++ b/include/uapi/linux/liveupdate.h
@@ -268,4 +268,25 @@ struct liveupdate_session_freeze {
 #define LIVEUPDATE_SESSION_FREEZE					\
 	_IO(LIVEUPDATE_IOCTL_TYPE, LIVEUPDATE_CMD_SESSION_FREEZE)
 
+/**
+ * struct liveupdate_memfd_retrieve_arg - Argument for tmpfs file retrieval
+ * @size: Input; sizeof(struct liveupdate_memfd_retrieve_arg)
+ * @fd:   Input; Writable, empty, linked tmpfs file descriptor to restore into.
+ *
+ * Passed via &struct liveupdate_session_retrieve_fd.arg on
+ * %LIVEUPDATE_SESSION_RETRIEVE_FD. This argument is required when retrieving
+ * a preserved linked tmpfs file and is rejected with -EINVAL when retrieving
+ * an anonymous memfd.
+ *
+ * @fd must refer to a writable, empty, linked tmpfs file that is not already
+ * claimed by LUO. On success, the file is populated with the preserved folios,
+ * its size and f_pos are restored, and the file descriptor returned in
+ * &struct liveupdate_session_retrieve_fd.fd references the same underlying open
+ * file description as @fd.
+ */
+struct liveupdate_memfd_retrieve_arg {
+	__u32		size;
+	__s32		fd;
+};
+
 #endif /* _UAPI_LIVEUPDATE_H */
diff --git a/mm/memfd_luo.c b/mm/memfd_luo.c
index 26929495786e0..9d18f01191c07 100644
--- a/mm/memfd_luo.c
+++ b/mm/memfd_luo.c
@@ -9,14 +9,14 @@
  */
 
 /**
- * DOC: Memfd Preservation via LUO
+ * DOC: Memfd and Tmpfs Preservation via LUO
  *
  * Overview
  * ========
  *
- * Memory file descriptors (memfd) can be preserved over a kexec using the Live
- * Update Orchestrator (LUO) file preservation. This allows userspace to
- * transfer its memory contents to the next kernel after a kexec.
+ * Memory file descriptors and generic tmpfs files can be preserved over a
+ * kexec using the LUO file preservation. This allows userspace to transfer its
+ * memory contents to the next kernel after a kexec.
  *
  * The preservation is not intended to be transparent. Only select properties of
  * the file are preserved. All others are reset to default. The preserved
@@ -24,16 +24,17 @@
  *
  * .. note::
  *    The LUO API is not stabilized yet, so the preserved properties of a memfd
- *    are also not stable and are subject to backwards incompatible changes.
+ *    or tmpfs file are also not stable and are subject to backwards
+ *    incompatible changes.
  *
  * .. note::
- *    Currently a memfd backed by Hugetlb is not supported. Memfds created
+ *    Currently a file backed by Hugetlb is not supported. Memfds created
  *    with ``MFD_HUGETLB`` will be rejected.
  *
  * Preserved Properties
  * ====================
  *
- * The following properties of the memfd are preserved across kexec:
+ * The following properties of the memfd/tmpfs file are preserved across kexec:
  *
  * File Contents
  *   All data stored in the file is preserved.
@@ -300,6 +301,8 @@ static int memfd_luo_preserve(struct liveupdate_file_op_args *args)
 
 	ser->size = inode_size;
 	ser->seals = seals;
+	if (inode->i_nlink)
+		ser->flags |= MEMFD_LUO_FLAG_TMPFS;
 
 	err = memfd_luo_preserve_folios(args->file, &ser->folios,
 					&folios_ser, &nr_folios);
@@ -516,10 +519,60 @@ static int memfd_luo_retrieve_folios(struct file *file,
 	return err;
 }
 
+static struct file *memfd_luo_get_tmpfs_file(struct liveupdate_file_op_args *args)
+{
+	const struct liveupdate_memfd_retrieve_arg *rarg = args->arg;
+	struct inode *inode;
+	struct file *file;
+	int err;
+
+	if (!rarg)
+		return ERR_PTR(-EINVAL);
+
+	file = fget(rarg->fd);
+	if (!file)
+		return ERR_PTR(-EBADF);
+
+	if (!(file->f_mode & FMODE_WRITE)) {
+		err = -EACCES;
+		goto put_file;
+	}
+
+	if (!shmem_file(file)) {
+		err = -EINVAL;
+		goto put_file;
+	}
+
+	inode = file_inode(file);
+	inode_lock(inode);
+	if (!inode->i_nlink) {
+		err = -EINVAL;
+		goto unlock_inode;
+	}
+
+	if (i_size_read(inode) != 0 || !mapping_empty(inode->i_mapping)) {
+		err = -EBUSY;
+		goto unlock_inode;
+	}
+
+	err = liveupdate_claim_file(args->handler, file);
+	if (err)
+		goto unlock_inode;
+
+	return file;
+
+unlock_inode:
+	inode_unlock(inode);
+put_file:
+	fput(file);
+	return ERR_PTR(err);
+}
+
 static int memfd_luo_retrieve(struct liveupdate_file_op_args *args)
 {
 	struct memfd_luo_folio_ser *folios_ser;
 	struct memfd_luo_ser *ser;
+	struct inode *inode;
 	struct file *file;
 	int err;
 
@@ -527,50 +580,75 @@ static int memfd_luo_retrieve(struct liveupdate_file_op_args *args)
 	if (!ser)
 		return -EINVAL;
 
-	/* Make sure the file only has seals supported by this version. */
-	if (ser->seals & ~MEMFD_LUO_ALL_SEALS) {
+	/* Make sure the file only has seals and flags supported by this version. */
+	if ((ser->seals & ~MEMFD_LUO_ALL_SEALS) ||
+	    (ser->flags & ~MEMFD_LUO_ALL_FLAGS)) {
 		err = -EOPNOTSUPP;
 		goto free_ser;
 	}
 
-	/*
-	 * The seals are preserved. Allow sealing here so they can be added
-	 * later.
-	 */
-	file = memfd_alloc_file("", MFD_ALLOW_SEALING);
-	if (IS_ERR(file)) {
-		pr_err("failed to setup file: %pe\n", file);
-		err = PTR_ERR(file);
-		goto free_ser;
-	}
+	if (ser->flags & MEMFD_LUO_FLAG_TMPFS) {
+		file = memfd_luo_get_tmpfs_file(args);
+		if (IS_ERR(file)) {
+			args->retryable = true;
+			return PTR_ERR(file);
+		}
+		inode = file_inode(file);
+	} else {
+		if (args->arg) {
+			args->retryable = true;
+			return -EINVAL;
+		}
 
-	err = memfd_add_seals(file, ser->seals);
-	if (err) {
-		pr_err("failed to add seals: %pe\n", ERR_PTR(err));
-		goto put_file;
-	}
+		/*
+		 * The seals are preserved. Allow sealing here so they can be
+		 * added later.
+		 */
+		file = memfd_alloc_file("", MFD_ALLOW_SEALING);
+		if (IS_ERR(file)) {
+			pr_err("failed to setup file: %pe\n", file);
+			err = PTR_ERR(file);
+			goto free_ser;
+		}
 
-	vfs_setpos(file, ser->pos, MAX_LFS_FILESIZE);
-	i_size_write(file_inode(file), ser->size);
+		err = memfd_add_seals(file, ser->seals);
+		if (err) {
+			pr_err("failed to add seals: %pe\n", ERR_PTR(err));
+			goto put_file;
+		}
+
+		inode = file_inode(file);
+		inode_lock(inode);
+	}
 
 	if (ser->nr_folios) {
 		folios_ser = kho_restore_vmalloc(&ser->folios);
 		if (!folios_ser) {
 			err = -EINVAL;
-			goto put_file;
+			goto unclaim_file;
 		}
 
 		err = memfd_luo_retrieve_folios(file, folios_ser, ser->nr_folios);
 		vfree(folios_ser);
 		if (err)
-			goto put_file;
+			goto unclaim_file;
 	}
 
+	vfs_setpos(file, ser->pos, MAX_LFS_FILESIZE);
+	i_size_write(inode, ser->size);
+	inode_unlock(inode);
+
 	args->file = file;
 	kho_restore_free(ser);
 
 	return 0;
 
+unclaim_file:
+	if (ser->flags & MEMFD_LUO_FLAG_TMPFS) {
+		shmem_truncate_range(inode, 0, (loff_t)-1);
+		liveupdate_unclaim_file(args->handler, file);
+	}
+	inode_unlock(inode);
 put_file:
 	fput(file);
 free_ser:
@@ -581,9 +659,7 @@ static int memfd_luo_retrieve(struct liveupdate_file_op_args *args)
 static bool memfd_luo_can_preserve(struct liveupdate_file_handler *handler,
 				   struct file *file)
 {
-	struct inode *inode = file_inode(file);
-
-	return shmem_file(file) && !inode->i_nlink;
+	return shmem_file(file);
 }
 
 static unsigned long memfd_luo_get_id(struct file *file)
@@ -599,6 +675,7 @@ static const struct liveupdate_file_ops memfd_luo_file_ops = {
 	.unpreserve = memfd_luo_unpreserve,
 	.can_preserve = memfd_luo_can_preserve,
 	.get_id = memfd_luo_get_id,
+	.rarg = LIVEUPDATE_ARG(struct liveupdate_memfd_retrieve_arg, fd),
 	.owner = THIS_MODULE,
 };
 
-- 
2.56.0.385.gd3acb90ef8-goog

