Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB3C3191BA
	for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 20:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776196966; cv=none; b=c7tu237PtBWWKzMUiIc1z+Yfd/jzN1YYoSIern8zeGHpO904lZd/iNVCSSRuQwB6X4aDxVvtoTB/NDWAAFX60Xit+j/YYdzFeRhX7FLBEXUxPxbLZgOxbJKX9sR6fCgmJEb2USm63sW3zpfUARiYbSJmwa4f/mQIkjKKPmx8TGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776196966; c=relaxed/simple;
	bh=MBaNGpIUuUbeKrFAommYLCRpBo7Nxzr/DpXBchJIpvo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AOIj0JjapDVxmu1n7hBHgCntJOjRJ5S/lRXDoGfhZCyMTn1EUBNfHtzg1yzbgKucWvQMWG9LBy7LNaFjyyTrd/SPCNSqXAa9FppDst20DhzkDBxDzBwtq+6jqYmfoeND7+6XmzQonLxCRyNVKwK/h6JvQhRZa52q48QF+ph/vW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=AXKjsaTj; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="AXKjsaTj"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9539d9f1675so3560549241.2
        for <linux-kselftest@vger.kernel.org>; Tue, 14 Apr 2026 13:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1776196963; x=1776801763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGBPIgM/WV5ZDiKpyCtZbuV6OrCUIPCWn13n/Yh3SQE=;
        b=AXKjsaTjCGsdZWqpS4MZqlInXSPJuoQrEBxe5k/XH7nL6Qjqn+D7KVItJD+x0hk3gN
         lrFy0AVtCRrjvDiKyD45XFdRyrp/NdtWjAXNwbvbdAjFR6ZAhfqdaCb29r3M2G/hEIHH
         i0OtQZqQ0FakPikiPrnYpPMLEsoW/mcwd7XBYnx1NhrJnHIZ3yZtQcnQ72Uol+sb785I
         eiBPkB06iByaFrtkE7SLVvm67Wje4CGUxDGjpI14B4T1gs93bdF/2xBOFVV/iU1oODzK
         3yscfe3hCdWSTJ/D4XZ345jRhAX50acTSRIAunp8GHLg0lSITjgcxc3jJ7MRsQSBn7zE
         EEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776196963; x=1776801763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gGBPIgM/WV5ZDiKpyCtZbuV6OrCUIPCWn13n/Yh3SQE=;
        b=WIzPE28Y3Rrq2x6vkzNwFjPQRxA3YgNbGlyK/9aDApIs2x+YK9ZcP+c89TNzUdNy45
         0Yf99Y0rqSmqXptAmTCQHMhyGdASyHYMz70upcZW9PTYfNjhVwY1kAaP2sT0S81sDMbc
         UqhsF/JwVgjGQ5OY2F/Dqw429NdB/BNGUD0it2E/cWQnMDccgKC41u7V0mf0QauNDOfq
         sKGenu7g5b7Hnzd5vSXj0cNEURX0UOYX9vsFsVCUWKz4Kk30NczPPeqxWysn+OQksL66
         XDm4HV05Tk+9CCu9gEIR9qABd7LWa7f+x6gYOvJee1XUEiCbAzDWaPt2eLfjrXm+0Ob2
         llzA==
X-Gm-Message-State: AOJu0YzZn1JMwKyGob7B2dmloHKLAikQG8VdM0W4x1vO2UqwT7+BMkYZ
	yK64d6hWyor38qnVPe3A5yuK2vcPHK4PFEg1LXzhca40LuPl5mPCdHmciEr5BqdkCoQr6yVwM0Q
	/hPhN
X-Gm-Gg: AeBDietqyo8ekIDobZ9TYIDEnaUuTWZCLdux2YW+wwrgUZr6QA2q7Mpo+6NLASBe98U
	wR04RZqrTGZjU/SyszLOLOAFjcQ/nbL8i1QdUh2HFm3XujYRrpquFYHIfBh60SDAaXistDRlsCz
	8Xt2A0JMUNfsV+iynWNnWOp08OYdqi3EaKU4hyylUzuZBOquYnDIVsqLc6lpQqJ6O1uhQEtGixp
	hPByK80BZSZw5zLR8qLpdjVfhhodnCf1bOaQx6WJ7FwpZ8oQnzRSi6MsfG8mUt+MvwfWDdvKj/Z
	i27XqTKxjlkKInKjhSuj2ayf1y0czldkYMqbQrlSIu3BXSAttn72uHLkucXzeqrxWyrWUsitpPz
	Dz2qeXoPTdxsaX/CPXImIIq0hLfYzbAPASp+aHSILYgqhoNPjX5Uq8ObzEFo9V1Oj8TlYmtmHjq
	bNUwc9VazeA5CPnYbsW0A90ylxb2OfJ3mJpk0a/yFlIgNh4lLx38CxMXqAMkQl9UcMj8ZhmOkoj
	m28
X-Received: by 2002:a05:6102:5043:b0:604:ee6f:17d with SMTP id ada2fe7eead31-609feaaaca6mr8735682137.8.1776196962686;
        Tue, 14 Apr 2026 13:02:42 -0700 (PDT)
Received: from plex.localdomain ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84a180a2sm132213656d6.15.2026.04.14.13.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 13:02:42 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH 2/5] liveupdate: Remove limit on the number of files per session
Date: Tue, 14 Apr 2026 20:02:34 +0000
Message-ID: <20260414200237.444170-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414200237.444170-1-pasha.tatashin@soleen.com>
References: <20260414200237.444170-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To remove the fixed limit on the number of preserved files per session,
transition the file metadata serialization from a single contiguous memory
block to a chain of linked blocks.

ABI Changes:
- Define 'struct luo_file_header_ser' to manage linked blocks in preserved
  memory.
- Update 'struct luo_file_set_ser' to point to the head of the block chain.
- Bump the session ABI version to 'luo-session-v4' to reflect these breaking
  changes.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/kho/abi/luo.h      |  35 ++++-
 kernel/liveupdate/luo_file.c     | 226 ++++++++++++++++++++-----------
 kernel/liveupdate/luo_internal.h |  17 ++-
 3 files changed, 189 insertions(+), 89 deletions(-)

diff --git a/include/linux/kho/abi/luo.h b/include/linux/kho/abi/luo.h
index f5732958545e..a15f6a0f3d93 100644
--- a/include/linux/kho/abi/luo.h
+++ b/include/linux/kho/abi/luo.h
@@ -84,8 +84,13 @@
  *
  *   - struct luo_session_ser:
  *     Metadata for a single session, including its name and a physical pointer
- *     to another preserved memory block containing an array of
- *     `struct luo_file_ser` for all files in that session.
+ *     to the first `struct luo_file_header_ser` for all files in that session.
+ *     Multiple blocks are linked via the `next` field in the header.
+ *
+ *   - struct luo_file_header_ser:
+ *     Header for the file data block. Contains the physical address of the
+ *     next file data block and the number of `struct luo_file_ser` entries
+ *     that follow this header in the current block.
  *
  *   - struct luo_file_ser:
  *     Metadata for a single preserved file. Contains the `compatible` string to
@@ -134,11 +139,29 @@ struct luo_file_ser {
 	u64 token;
 } __packed;
 
+/**
+ * struct luo_file_header_ser - Header for the serialized file data block.
+ * @next:  Physical address of the next struct luo_file_header_ser.
+ * @count: The number of `struct luo_file_ser` entries that immediately
+ *         follow this header in the memory block.
+ *
+ * This structure is located at the beginning of a block of
+ * physical memory preserved across the kexec. It provides the necessary
+ * metadata to interpret the array of file entries that follow.
+ *
+ * If this structure is modified, `LUO_FDT_SESSION_COMPATIBLE` must be updated.
+ */
+struct luo_file_header_ser {
+	u64 next;
+	u64 count;
+} __packed;
+
 /**
  * struct luo_file_set_ser - Represents the serialized metadata for file set
- * @files:   The physical address of a contiguous memory block that holds
- *           the serialized state of files (array of luo_file_ser) in this file
- *           set.
+ * @files:   The physical address of the first `struct luo_file_header_ser`.
+ *           This structure is the header for a block of memory containing
+ *           an array of `struct luo_file_ser` entries. Multiple blocks are
+ *           linked via the `next` field in the header.
  * @count:   The total number of files that were part of this session during
  *           serialization. Used for iteration and validation during
  *           restoration.
@@ -154,7 +177,7 @@ struct luo_file_set_ser {
  *                          luo_session_header_ser
  */
 #define LUO_FDT_SESSION_NODE_NAME	"luo-session"
-#define LUO_FDT_SESSION_COMPATIBLE	"luo-session-v3"
+#define LUO_FDT_SESSION_COMPATIBLE	"luo-session-v4"
 #define LUO_FDT_SESSION_HEADER		"luo-session-header"
 
 /**
diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index dedbb8d02e6a..20a2d776cff4 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -119,10 +119,12 @@ static LIST_HEAD(luo_file_handler_list);
 /* Keep track of files being preserved by LUO */
 static DEFINE_XARRAY(luo_preserved_files);
 
-/* 2 4K pages, give space for 128 files per file_set */
+/* 2 4K pages, give space for 127 files per block */
 #define LUO_FILE_PGCNT		2ul
-#define LUO_FILE_MAX							\
-	((LUO_FILE_PGCNT << PAGE_SHIFT) / sizeof(struct luo_file_ser))
+#define LUO_FILE_BLOCK_MAX					\
+	(((LUO_FILE_PGCNT << PAGE_SHIFT) -			\
+	  sizeof(struct luo_file_header_ser)) /			\
+	 sizeof(struct luo_file_ser))
 
 /**
  * struct luo_file - Represents a single preserved file instance.
@@ -158,7 +160,7 @@ static DEFINE_XARRAY(luo_preserved_files);
  * and the serialized state handle returned by the handler's .preserve()
  * operation.
  *
- * These instances are tracked in a per-file_set list. The @serialized_data
+ * These structures are tracked in a per-file_set list. The @serialized_data
  * field, which holds a handle to the file's serialized state, may be updated
  * during the .freeze() callback before being serialized for the next kernel.
  * After reboot, these structures are recreated by luo_file_deserialize() and
@@ -175,37 +177,68 @@ struct luo_file {
 	u64 token;
 };
 
-static int luo_alloc_files_mem(struct luo_file_set *file_set)
+static int luo_file_add_block(struct luo_file_set *file_set,
+			      struct luo_file_header_ser *ser)
 {
-	size_t size;
-	void *mem;
+	struct luo_file_block *block;
 
-	if (file_set->files)
-		return 0;
-
-	WARN_ON_ONCE(file_set->count);
+	if (file_set->nblocks >= LUO_MAX_BLOCKS)
+		return -ENOSPC;
 
-	size = LUO_FILE_PGCNT << PAGE_SHIFT;
-	mem = kho_alloc_preserve(size);
-	if (IS_ERR(mem))
-		return PTR_ERR(mem);
+	block = kzalloc_obj(*block);
+	if (!block)
+		return -ENOMEM;
 
-	file_set->files = mem;
+	block->ser = ser;
+	list_add_tail(&block->list, &file_set->blocks);
+	file_set->nblocks++;
 
 	return 0;
 }
 
-static void luo_free_files_mem(struct luo_file_set *file_set)
+static int luo_file_create_ser_block(struct luo_file_set *file_set)
 {
-	/* If file_set has files, no need to free preservation memory */
-	if (file_set->count)
-		return;
+	struct luo_file_block *last = NULL;
+	struct luo_file_header_ser *ser;
+	int err;
 
-	if (!file_set->files)
-		return;
+	ser = kho_alloc_preserve(LUO_FILE_PGCNT << PAGE_SHIFT);
+	if (IS_ERR(ser))
+		return PTR_ERR(ser);
+
+	if (!list_empty(&file_set->blocks))
+		last = list_last_entry(&file_set->blocks, struct luo_file_block, list);
+
+	err = luo_file_add_block(file_set, ser);
+	if (err)
+		goto err_unpreserve;
+
+	if (last)
+		last->ser->next = virt_to_phys(ser);
+
+	return 0;
 
-	kho_unpreserve_free(file_set->files);
-	file_set->files = NULL;
+err_unpreserve:
+	kho_unpreserve_free(ser);
+	return err;
+}
+
+static void luo_file_destroy_ser_blocks(struct luo_file_set *file_set,
+					bool unpreserve)
+{
+	struct luo_file_block *block, *tmp;
+
+	list_for_each_entry_safe(block, tmp, &file_set->blocks, list) {
+		if (block->ser) {
+			if (unpreserve)
+				kho_unpreserve_free(block->ser);
+			else
+				kho_restore_free(block->ser);
+		}
+		list_del(&block->list);
+		kfree(block);
+		file_set->nblocks--;
+	}
 }
 
 static unsigned long luo_get_id(struct liveupdate_file_handler *fh,
@@ -247,7 +280,9 @@ static bool luo_token_is_used(struct luo_file_set *file_set, u64 token)
  * 3. Iterates through registered handlers, calling can_preserve() to find one
  *    compatible with the given @fd.
  * 4. Calls the handler's .preserve() operation, which saves the file's state
- *    and returns an opaque private data handle.
+ *    and returns an opaque u64 handle. This is typically performed while the
+ *    workload is still active to minimize the downtime during the
+ *    actual reboot transition.
  * 5. Adds the new instance to the file_set's internal list.
  *
  * On success, LUO takes a reference to the 'struct file' and considers it
@@ -277,17 +312,16 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
 	if (luo_token_is_used(file_set, token))
 		return -EEXIST;
 
-	if (file_set->count == LUO_FILE_MAX)
-		return -ENOSPC;
+	if (file_set->count == file_set->nblocks * LUO_FILE_BLOCK_MAX) {
+		err = luo_file_create_ser_block(file_set);
+		if (err)
+			return err;
+	}
 
 	file = fget(fd);
 	if (!file)
 		return -EBADF;
 
-	err = luo_alloc_files_mem(file_set);
-	if (err)
-		goto  err_fput;
-
 	err = -ENOENT;
 	down_read(&luo_register_rwlock);
 	list_private_for_each_entry(fh, &luo_file_handler_list, list) {
@@ -301,7 +335,7 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
 
 	/* err is still -ENOENT if no handler was found */
 	if (err)
-		goto err_free_files_mem;
+		goto err_fput;
 
 	/* safe to use fh because its module is pinned */
 	err = xa_insert(&luo_preserved_files, luo_get_id(fh, file),
@@ -345,8 +379,6 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
 	xa_erase(&luo_preserved_files, luo_get_id(fh, file));
 err_module_put:
 	module_put(fh->ops->owner);
-err_free_files_mem:
-	luo_free_files_mem(file_set);
 err_fput:
 	fput(file);
 
@@ -399,7 +431,7 @@ void luo_file_unpreserve_files(struct luo_file_set *file_set)
 		kfree(luo_file);
 	}
 
-	luo_free_files_mem(file_set);
+	luo_file_destroy_ser_blocks(file_set, true);
 }
 
 static int luo_file_freeze_one(struct luo_file_set *file_set,
@@ -446,6 +478,7 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
 				struct luo_file *failed_entry)
 {
 	struct list_head *files_list = &file_set->files_list;
+	struct luo_file_block *block;
 	struct luo_file *luo_file;
 
 	list_for_each_entry(luo_file, files_list, list) {
@@ -455,7 +488,11 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
 		luo_file_unfreeze_one(file_set, luo_file);
 	}
 
-	memset(file_set->files, 0, LUO_FILE_PGCNT << PAGE_SHIFT);
+	list_for_each_entry(block, &file_set->blocks, list) {
+		block->ser->count = 0;
+		memset(block->ser + 1, 0,
+		       (LUO_FILE_PGCNT << PAGE_SHIFT) - sizeof(*block->ser));
+	}
 }
 
 /**
@@ -494,7 +531,8 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
 int luo_file_freeze(struct luo_file_set *file_set,
 		    struct luo_file_set_ser *file_set_ser)
 {
-	struct luo_file_ser *file_ser = file_set->files;
+	struct luo_file_block *block;
+	struct luo_file_ser *file_ser;
 	struct luo_file *luo_file;
 	int err;
 	int i;
@@ -502,11 +540,18 @@ int luo_file_freeze(struct luo_file_set *file_set,
 	if (!file_set->count)
 		return 0;
 
-	if (WARN_ON(!file_ser))
-		return -EINVAL;
+	block = list_first_entry(&file_set->blocks, struct luo_file_block, list);
+	file_ser = (void *)(block->ser + 1);
 
 	i = 0;
 	list_for_each_entry(luo_file, &file_set->files_list, list) {
+		if (i == LUO_FILE_BLOCK_MAX) {
+			block->ser->count = i;
+			block = list_next_entry(block, list);
+			file_ser = (void *)(block->ser + 1);
+			i = 0;
+		}
+
 		err = luo_file_freeze_one(file_set, luo_file);
 		if (err < 0) {
 			pr_warn("Freeze failed for token[%#0llx] handler[%s] err[%pe]\n",
@@ -521,10 +566,13 @@ int luo_file_freeze(struct luo_file_set *file_set,
 		file_ser[i].token = luo_file->token;
 		i++;
 	}
+	block->ser->count = i;
 
 	file_set_ser->count = file_set->count;
-	if (file_set->files)
-		file_set_ser->files = virt_to_phys(file_set->files);
+	if (!list_empty(&file_set->blocks)) {
+		block = list_first_entry(&file_set->blocks, struct luo_file_block, list);
+		file_set_ser->files = virt_to_phys(block->ser);
+	}
 
 	return 0;
 
@@ -746,10 +794,7 @@ int luo_file_finish(struct luo_file_set *file_set)
 		kfree(luo_file);
 	}
 
-	if (file_set->files) {
-		kho_restore_free(file_set->files);
-		file_set->files = NULL;
-	}
+	luo_file_destroy_ser_blocks(file_set, false);
 
 	return 0;
 }
@@ -782,8 +827,10 @@ int luo_file_finish(struct luo_file_set *file_set)
 int luo_file_deserialize(struct luo_file_set *file_set,
 			 struct luo_file_set_ser *file_set_ser)
 {
-	struct luo_file_ser *file_ser;
-	u64 i;
+	struct luo_file_header_ser *header_ser;
+	struct luo_file_block *block;
+	u64 header_ser_pa;
+	int err;
 
 	if (!file_set_ser->files) {
 		WARN_ON(file_set_ser->count);
@@ -791,7 +838,15 @@ int luo_file_deserialize(struct luo_file_set *file_set,
 	}
 
 	file_set->count = file_set_ser->count;
-	file_set->files = phys_to_virt(file_set_ser->files);
+	header_ser_pa = file_set_ser->files;
+
+	while (header_ser_pa) {
+		header_ser = phys_to_virt(header_ser_pa);
+		err = luo_file_add_block(file_set, header_ser);
+		if (err)
+			return err;
+		header_ser_pa = header_ser->next;
+	}
 
 	/*
 	 * Note on error handling:
@@ -808,42 +863,51 @@ int luo_file_deserialize(struct luo_file_set *file_set,
 	 * userspace to detect the failure and trigger a reboot, which will
 	 * reliably reset devices and reclaim memory.
 	 */
-	file_ser = file_set->files;
-	for (i = 0; i < file_set->count; i++) {
-		struct liveupdate_file_handler *fh;
-		bool handler_found = false;
-		struct luo_file *luo_file;
-
-		down_read(&luo_register_rwlock);
-		list_private_for_each_entry(fh, &luo_file_handler_list, list) {
-			if (!strcmp(fh->compatible, file_ser[i].compatible)) {
-				if (try_module_get(fh->ops->owner))
-					handler_found = true;
-				break;
-			}
-		}
-		up_read(&luo_register_rwlock);
+	list_for_each_entry(block, &file_set->blocks, list) {
+		struct luo_file_ser *file_ser = (void *)(block->ser + 1);
 
-		if (!handler_found) {
-			pr_warn("No registered handler for compatible '%.*s'\n",
-				(int)sizeof(file_ser[i].compatible),
-				file_ser[i].compatible);
-			return -ENOENT;
+		if (block->ser->count > LUO_FILE_BLOCK_MAX) {
+			pr_warn("File block contains too many entries: %llu\n",
+				block->ser->count);
+			return -EINVAL;
 		}
 
-		luo_file = kzalloc_obj(*luo_file);
-		if (!luo_file) {
-			module_put(fh->ops->owner);
-			return -ENOMEM;
-		}
+		for (int i = 0; i < block->ser->count; i++) {
+			struct liveupdate_file_handler *fh;
+			bool handler_found = false;
+			struct luo_file *luo_file;
+
+			down_read(&luo_register_rwlock);
+			list_private_for_each_entry(fh, &luo_file_handler_list, list) {
+				if (!strcmp(fh->compatible, file_ser[i].compatible)) {
+					if (try_module_get(fh->ops->owner))
+						handler_found = true;
+					break;
+				}
+			}
+			up_read(&luo_register_rwlock);
 
-		/* safe to use fh because its module is pinned */
-		luo_file->fh = fh;
-		luo_file->file = NULL;
-		luo_file->serialized_data = file_ser[i].data;
-		luo_file->token = file_ser[i].token;
-		mutex_init(&luo_file->mutex);
-		list_add_tail(&luo_file->list, &file_set->files_list);
+			if (!handler_found) {
+				pr_warn("No registered handler for compatible '%.*s'\n",
+					(int)sizeof(file_ser[i].compatible),
+					file_ser[i].compatible);
+				return -ENOENT;
+			}
+
+			luo_file = kzalloc_obj(*luo_file);
+			if (!luo_file) {
+				module_put(fh->ops->owner);
+				return -ENOMEM;
+			}
+
+			/* safe to use fh because its module is pinned */
+			luo_file->fh = fh;
+			luo_file->file = NULL;
+			luo_file->serialized_data = file_ser[i].data;
+			luo_file->token = file_ser[i].token;
+			mutex_init(&luo_file->mutex);
+			list_add_tail(&luo_file->list, &file_set->files_list);
+		}
 	}
 
 	return 0;
@@ -852,12 +916,14 @@ int luo_file_deserialize(struct luo_file_set *file_set,
 void luo_file_set_init(struct luo_file_set *file_set)
 {
 	INIT_LIST_HEAD(&file_set->files_list);
+	INIT_LIST_HEAD(&file_set->blocks);
 }
 
 void luo_file_set_destroy(struct luo_file_set *file_set)
 {
 	WARN_ON(file_set->count);
 	WARN_ON(!list_empty(&file_set->files_list));
+	WARN_ON(!list_empty(&file_set->blocks));
 }
 
 /**
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index a73f42069301..a92aaa9c073d 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -50,19 +50,30 @@ static inline int luo_ucmd_respond(struct luo_ucmd *ucmd,
  */
 #define luo_restore_fail(__fmt, ...) panic(__fmt, ##__VA_ARGS__)
 
+/**
+ * struct luo_file_block - Internal representation of a file serialization block.
+ * @list: List head for linking blocks in memory.
+ * @ser:  Pointer to the serialized header in preserved memory.
+ */
+struct luo_file_block {
+	struct list_head list;
+	struct luo_file_header_ser *ser;
+};
+
 /**
  * struct luo_file_set - A set of files that belong to the same sessions.
  * @files_list: An ordered list of files associated with this session, it is
  *              ordered by preservation time.
- * @files:      The physically contiguous memory block that holds the serialized
- *              state of files.
+ * @blocks:     The list of serialization blocks (struct luo_file_block).
  * @count:      A counter tracking the number of files currently stored in the
  *              @files_list for this session.
+ * @nblocks:    The number of allocated serialization blocks.
  */
 struct luo_file_set {
 	struct list_head files_list;
-	struct luo_file_ser *files;
+	struct list_head blocks;
 	long count;
+	long nblocks;
 };
 
 /**
-- 
2.43.0

