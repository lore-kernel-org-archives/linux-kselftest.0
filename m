Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB501373BF4
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 03:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370256; cv=none; b=FWuChBpWcke4lXhBBI9qSRTXhPafIanLcheXetrKow2cE6giG+Vl3gN9ts0obIBBDxZJ3cHkiSoV2oELNfZxG+WRv9C8e4RDwYDnLXVR594Hm5LKG2TmsAlK4193xnJD5EGja9qJHm/gd6JHvnNmr23TGqmi/C2eOiE51svrdIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370256; c=relaxed/simple;
	bh=aa/typwGV4QDDGjY+Bm27QpnR5poM1uCgiHk2vsC6tA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kx8B/0y+sHnG3KyM4jDEaWnWDJmLR6iQJjvCtFIwQEcDw93WRNf/C3JGhnbknwqfD1QQMztSwn0MUmgIx3JaUrEfUhJ0Yq9R2vbMFuPH1JW+Vmb1ki/N/EqKyZrtOC5+85749TOjE91PN5ltKg9H8fSukAseUWZwwpUOAX7670M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=PJhh7Uch; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="PJhh7Uch"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51761d27612so10987531cf.3
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 20:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780370254; x=1780975054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rDOajnV7+kal5yLqGFSrXSEKyBbHqEW0VED8HuIeq9g=;
        b=PJhh7Uch17etmnORG75v0N4nXfyBldu6RsgaBOPwyKpPQoBguV9HIKdlKEQHpxWEt+
         0ufwAZu1BZV06C2H6cQyqUCW07ah6Xspsp31JCsZSNMdmhFnXjYZpLRtF5GrRRub+59n
         fyBNAsxfOxaGCP420BmaJwfSeqGwplCQTPSdy+pZ2HMZBFDlXcrTml2ibXl3+47TGiDR
         vcj2/cR+FHv4dfCDzRWjdaEiE1PO/IpGWh5hjdZqLOloa4UQILMhrSLlHbzjW7sZjsFK
         ne3RBzy+8kET14aCZA/40TveA8SntpWQfHQwDmyHvwzp9VsQER+Hp0ZXAV6VWJDjWS0i
         KR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780370254; x=1780975054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rDOajnV7+kal5yLqGFSrXSEKyBbHqEW0VED8HuIeq9g=;
        b=fC5vHFE/0GzbNIzAOeCm7z6g+8WhHuBDtH7FYuvA27Om5vJT8A67HP3w5nYg9zHuaQ
         UojS102bC1oHUvllz88LxLLll/UtOoUaU1bJ89e1M5O0X5i9MitSGuQn7EAphTJRGBX8
         gXpZeRH2QjuoSh4ir6uY5xNDPd+B8zKMnvOd6Qyz6qo9tkZT0I/N2pScGheOybJhDxMW
         bnGnlSZdWOyBQZYyuhOVZeGaLMqxYidsdwuS1aHWEwIrmlUL+8kg4LUT2m1VtpfurXQB
         LSJEAlEy0h6CH2XLy2uWTYNb9yQoep0sbZ0WL39ZrPY7k+OzkJYctluAxuM4EaGTwtvm
         eBjA==
X-Gm-Message-State: AOJu0YxXpACFmXolShS1L5HGNrMwD34EdjCzB9sxZksXrOEiwUzK7OVA
	sabCoGmMXFtZH894UUyox7MUgVbtFSN62GJ8I+wKsbb8a/AMU28Ur7jN8d6vD3ClW/xBRWNgknw
	AxKzf
X-Gm-Gg: Acq92OEM3tTeHc4EvfQzPkoUyqylP83x8bUng1do5Tj4bBSKTKPghhx0cZkBEsZUSk2
	T2zZWXp8pBs8xMrIzN3a5fMTnz761WaRJKTKC8QGtjQcFtoSvAlPq90YOjxIYP8RxuJatKEu0fQ
	a3n1MrpSLXirjAMKzX/FETZEIQr9e9j9ikoi4neEUYgaRbeUhcML8HWfwMe7z3Gihv+hKHkOvK0
	7t01FFjLBw+22sRsFOVlVgwrYQJaemWg9hGOuFHfl2DyMj7h+/2RKwlwk2dkQ8UBM2+ZOfQEahg
	Fj3M7kT62KzvBkDC9ARnSBBjeiSAYNCw+HKfTauGXBoEYSbNjUr1oBbzm3yMDjdIYTCtmFO000L
	KyoyCjDIBUNyAYLiC5QlDMXHrsKa7dhYDgwOWgtZDgJMhtoVmYipK3EZthGINQic9Ab5xUxFGKC
	f8Wv16ONvt1kLNctMvPJQwOtooyY1UEjT8GVK5UKxDx56yY0uWSp7+U0bDtCD2UrWbzN3DRCT3
X-Received: by 2002:a05:622a:1a8a:b0:50e:57de:40d7 with SMTP id d75a77b69052e-5173a712db7mr221436111cf.19.1780370253723;
        Mon, 01 Jun 2026 20:17:33 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51741b29745sm71219081cf.8.2026.06.01.20.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 20:17:33 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH v5 10/13] liveupdate: Remove limit on the number of files per session
Date: Tue,  2 Jun 2026 03:17:14 +0000
Message-ID: <20260602031717.197696-11-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602031717.197696-1-pasha.tatashin@soleen.com>
References: <20260602031717.197696-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To remove the fixed limit on the number of preserved files per session,
transition the file metadata serialization from a single contiguous
memory block to a chain of linked blocks.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/kho/abi/luo.h      |  13 +--
 kernel/liveupdate/luo_file.c     | 139 +++++++++++++++----------------
 kernel/liveupdate/luo_internal.h |   6 +-
 3 files changed, 75 insertions(+), 83 deletions(-)

diff --git a/include/linux/kho/abi/luo.h b/include/linux/kho/abi/luo.h
index 79758d92ed5f..16df550ef143 100644
--- a/include/linux/kho/abi/luo.h
+++ b/include/linux/kho/abi/luo.h
@@ -35,8 +35,8 @@
  *
  *   - struct luo_session_ser:
  *     Metadata for a single session, including its name and a physical pointer
- *     to another preserved memory block containing an array of
- *     `struct luo_file_ser` for all files in that session.
+ *     to the first `struct kho_block_header_ser` for all files in that session.
+ *     Multiple blocks are linked via the `next` field in the header.
  *
  *   - struct luo_file_ser:
  *     Metadata for a single preserved file. Contains the `compatible` string to
@@ -65,7 +65,7 @@
  * The LUO state is registered under this KHO entry name.
  */
 #define LUO_KHO_ENTRY_NAME	"LUO"
-#define LUO_COMPAT_BASE		"luo-v3"
+#define LUO_COMPAT_BASE		"luo-v4"
 #define LUO_ABI_COMPATIBLE	LUO_COMPAT_BASE "-" KHO_BLOCK_ABI_COMPATIBLE
 #define LUO_ABI_COMPAT_LEN	ALIGN(sizeof(LUO_ABI_COMPATIBLE), 8)
 
@@ -103,9 +103,10 @@ struct luo_file_ser {
 
 /**
  * struct luo_file_set_ser - Represents the serialized metadata for file set
- * @files:   The physical address of a contiguous memory block that holds
- *           the serialized state of files (array of luo_file_ser) in this file
- *           set.
+ * @files:   The physical address of the first `struct kho_block_header_ser`.
+ *           This structure is the header for a block of memory containing
+ *           an array of `struct luo_file_ser` entries. Multiple blocks are
+ *           linked via the `next` field in the header.
  * @count:   The total number of files that were part of this session during
  *           serialization. Used for iteration and validation during
  *           restoration.
diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index 9eec07a9e9fc..695e99aaba20 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -118,11 +118,6 @@ static LIST_HEAD(luo_file_handler_list);
 /* Keep track of files being preserved by LUO */
 static DEFINE_XARRAY(luo_preserved_files);
 
-/* 2 4K pages, give space for 128 files per file_set */
-#define LUO_FILE_PGCNT		2ul
-#define LUO_FILE_MAX							\
-	((LUO_FILE_PGCNT << PAGE_SHIFT) / sizeof(struct luo_file_ser))
-
 /**
  * struct luo_file - Represents a single preserved file instance.
  * @fh:            Pointer to the &struct liveupdate_file_handler that manages
@@ -174,39 +169,6 @@ struct luo_file {
 	u64 token;
 };
 
-static int luo_alloc_files_mem(struct luo_file_set *file_set)
-{
-	size_t size;
-	void *mem;
-
-	if (file_set->files)
-		return 0;
-
-	WARN_ON_ONCE(file_set->count);
-
-	size = LUO_FILE_PGCNT << PAGE_SHIFT;
-	mem = kho_alloc_preserve(size);
-	if (IS_ERR(mem))
-		return PTR_ERR(mem);
-
-	file_set->files = mem;
-
-	return 0;
-}
-
-static void luo_free_files_mem(struct luo_file_set *file_set)
-{
-	/* If file_set has files, no need to free preservation memory */
-	if (file_set->count)
-		return;
-
-	if (!file_set->files)
-		return;
-
-	kho_unpreserve_free(file_set->files);
-	file_set->files = NULL;
-}
-
 static unsigned long luo_get_id(struct liveupdate_file_handler *fh,
 				struct file *file)
 {
@@ -276,16 +238,15 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
 	if (luo_token_is_used(file_set, token))
 		return -EEXIST;
 
-	if (file_set->count == LUO_FILE_MAX)
-		return -ENOSPC;
+	err = kho_block_grow(&file_set->block_set, file_set->count);
+	if (err)
+		return err;
 
 	file = fget(fd);
-	if (!file)
-		return -EBADF;
-
-	err = luo_alloc_files_mem(file_set);
-	if (err)
-		goto  err_fput;
+	if (!file) {
+		err = -EBADF;
+		goto err_shrink;
+	}
 
 	err = -ENOENT;
 	down_read(&luo_register_rwlock);
@@ -300,7 +261,7 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
 
 	/* err is still -ENOENT if no handler was found */
 	if (err)
-		goto err_free_files_mem;
+		goto err_fput;
 
 	err = xa_insert(&luo_preserved_files, luo_get_id(fh, file),
 			file, GFP_KERNEL);
@@ -343,10 +304,10 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
 	xa_erase(&luo_preserved_files, luo_get_id(fh, file));
 err_module_put:
 	module_put(fh->ops->owner);
-err_free_files_mem:
-	luo_free_files_mem(file_set);
 err_fput:
 	fput(file);
+err_shrink:
+	kho_block_shrink(&file_set->block_set, file_set->count);
 
 	return err;
 }
@@ -392,13 +353,14 @@ void luo_file_unpreserve_files(struct luo_file_set *file_set)
 
 		list_del(&luo_file->list);
 		file_set->count--;
+		kho_block_shrink(&file_set->block_set, file_set->count);
 
 		fput(luo_file->file);
 		mutex_destroy(&luo_file->mutex);
 		kfree(luo_file);
 	}
 
-	luo_free_files_mem(file_set);
+	kho_block_set_destroy(&file_set->block_set);
 }
 
 static int luo_file_freeze_one(struct luo_file_set *file_set,
@@ -454,7 +416,7 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
 		luo_file_unfreeze_one(file_set, luo_file);
 	}
 
-	memset(file_set->files, 0, LUO_FILE_PGCNT << PAGE_SHIFT);
+	kho_block_set_clear(&file_set->block_set);
 }
 
 /**
@@ -493,19 +455,24 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
 int luo_file_freeze(struct luo_file_set *file_set,
 		    struct luo_file_set_ser *file_set_ser)
 {
-	struct luo_file_ser *file_ser = file_set->files;
 	struct luo_file *luo_file;
+	struct kho_block_it it;
 	int err;
-	int i;
 
 	if (!file_set->count)
 		return 0;
 
-	if (WARN_ON(!file_ser))
-		return -EINVAL;
+	kho_block_it_init(&it, &file_set->block_set);
 
-	i = 0;
 	list_for_each_entry(luo_file, &file_set->files_list, list) {
+		struct luo_file_ser *file_ser = kho_block_it_reserve_entry(&it);
+
+		/* This should not fail normally as blocks were pre-allocated */
+		if (WARN_ON_ONCE(!file_ser)) {
+			err = -ENOSPC;
+			goto err_unfreeze;
+		}
+
 		err = luo_file_freeze_one(file_set, luo_file);
 		if (err < 0) {
 			pr_warn("Freeze failed for token[%#0llx] handler[%s] err[%pe]\n",
@@ -514,16 +481,15 @@ int luo_file_freeze(struct luo_file_set *file_set,
 			goto err_unfreeze;
 		}
 
-		strscpy(file_ser[i].compatible, luo_file->fh->compatible,
-			sizeof(file_ser[i].compatible));
-		file_ser[i].data = luo_file->serialized_data;
-		file_ser[i].token = luo_file->token;
-		i++;
+		strscpy(file_ser->compatible, luo_file->fh->compatible,
+			sizeof(file_ser->compatible));
+		file_ser->data = luo_file->serialized_data;
+		file_ser->token = luo_file->token;
 	}
+	kho_block_it_finalize(&it);
 
 	file_set_ser->count = file_set->count;
-	if (file_set->files)
-		file_set_ser->files = virt_to_phys(file_set->files);
+	file_set_ser->files = kho_block_set_head_pa(&file_set->block_set);
 
 	return 0;
 
@@ -741,14 +707,12 @@ int luo_file_finish(struct luo_file_set *file_set)
 		module_put(luo_file->fh->ops->owner);
 		list_del(&luo_file->list);
 		file_set->count--;
+		kho_block_shrink(&file_set->block_set, file_set->count);
 		mutex_destroy(&luo_file->mutex);
 		kfree(luo_file);
 	}
 
-	if (file_set->files) {
-		kho_restore_free(file_set->files);
-		file_set->files = NULL;
-	}
+	kho_block_set_destroy(&file_set->block_set);
 
 	return 0;
 }
@@ -822,16 +786,18 @@ int luo_file_deserialize(struct luo_file_set *file_set,
 			 struct luo_file_set_ser *file_set_ser)
 {
 	struct luo_file_ser *file_ser;
+	struct kho_block_it it;
 	int err;
-	u64 i;
 
 	if (!file_set_ser->files) {
 		WARN_ON(file_set_ser->count);
 		return 0;
 	}
 
-	file_set->count = file_set_ser->count;
-	file_set->files = phys_to_virt(file_set_ser->files);
+	file_set->count = 0;
+	err = kho_block_set_restore(&file_set->block_set, file_set_ser->files);
+	if (err)
+		return err;
 
 	/*
 	 * Note on error handling:
@@ -848,25 +814,50 @@ int luo_file_deserialize(struct luo_file_set *file_set,
 	 * userspace to detect the failure and trigger a reboot, which will
 	 * reliably reset devices and reclaim memory.
 	 */
-	file_ser = file_set->files;
-	for (i = 0; i < file_set->count; i++) {
-		err = luo_file_deserialize_one(file_set, &file_ser[i]);
+	kho_block_it_init(&it, &file_set->block_set);
+	while ((file_ser = kho_block_it_read_entry(&it))) {
+		err = luo_file_deserialize_one(file_set, file_ser);
 		if (err)
-			return err;
+			goto err_destroy_blocks;
+		file_set->count++;
+	}
+
+	if (file_set->count != file_set_ser->count) {
+		pr_warn("File count mismatch: expected %llu, found %llu\n",
+			file_set_ser->count, file_set->count);
+		err = -EINVAL;
+		goto err_destroy_blocks;
 	}
 
 	return 0;
+
+err_destroy_blocks:
+	while (!list_empty(&file_set->files_list)) {
+		struct luo_file *luo_file;
+
+		luo_file = list_first_entry(&file_set->files_list,
+					    struct luo_file, list);
+		list_del(&luo_file->list);
+		module_put(luo_file->fh->ops->owner);
+		mutex_destroy(&luo_file->mutex);
+		kfree(luo_file);
+	}
+	file_set->count = 0;
+	kho_block_set_destroy(&file_set->block_set);
+	return err;
 }
 
 void luo_file_set_init(struct luo_file_set *file_set)
 {
 	INIT_LIST_HEAD(&file_set->files_list);
+	kho_block_set_init(&file_set->block_set, sizeof(struct luo_file_ser));
 }
 
 void luo_file_set_destroy(struct luo_file_set *file_set)
 {
 	WARN_ON(file_set->count);
 	WARN_ON(!list_empty(&file_set->files_list));
+	WARN_ON(!kho_block_set_is_empty(&file_set->block_set));
 }
 
 /**
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index ee18f9a11b91..64879ffe7378 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -10,6 +10,7 @@
 
 #include <linux/liveupdate.h>
 #include <linux/uaccess.h>
+#include <linux/kho_block.h>
 
 struct luo_ucmd {
 	void __user *ubuffer;
@@ -44,14 +45,13 @@ static inline int luo_ucmd_respond(struct luo_ucmd *ucmd,
  * struct luo_file_set - A set of files that belong to the same sessions.
  * @files_list: An ordered list of files associated with this session, it is
  *              ordered by preservation time.
- * @files:      The physically contiguous memory block that holds the serialized
- *              state of files.
+ * @block_set:  The set of serialization blocks.
  * @count:      A counter tracking the number of files currently stored in the
  *              @files_list for this session.
  */
 struct luo_file_set {
 	struct list_head files_list;
-	struct luo_file_ser *files;
+	struct kho_block_set block_set;
 	u64 count;
 };
 
-- 
2.53.0

