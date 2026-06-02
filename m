Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C98A372ECB
	for <linux-kselftest@vger.kernel.org>; Tue,  2 Jun 2026 03:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780370255; cv=none; b=Rr8tsNkswpwh6oQjJ0j76SMaxE2U8pzg10DVFtd0YE6hkVltvDwueuxXmdCI+x5UsyrUwnAkwfx8QGxK/vgxEoKmqV/FKDy40WJOiVoaRjUSVY0Xd6gZGk5kb/DK8kRxmirQMjXbJSfSWEp5oV7N2/Nv7QCvXyv4vxSlyGzLkxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780370255; c=relaxed/simple;
	bh=gWpkuL6XFDQcIjlfEGo6WTUG/sTPKn/t26+Vm4KOaM0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fkzSvy/daynpmBrWai9RK3oMzPXmeJ8F6OXAXLn8zG1Uh7xtSqPE1TJON+2p+MuXbQSreDnJp/lU90bWquTMzDe+tr8yMeOADn9SNvJ7rMWz53woR3qr8GcwQ1HSNxtw5oxbaOj2b3pSgpfkNG4AEfJgbQZBGLZGbCHwC9ojyRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=EVbPP7mO; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="EVbPP7mO"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8cc0ef7c306so147688866d6.3
        for <linux-kselftest@vger.kernel.org>; Mon, 01 Jun 2026 20:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780370252; x=1780975052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fWqTePdW4kjpFcuQSRvtq+YZpFX+FpQQHf9HMyZY+aI=;
        b=EVbPP7mOB8yWi7K4H5BznPJA/LNxAcTiGlmy4vLvcdtqx4ps1LF0+EJs74X0YZ8tjd
         jlo1RWRCFbVr+iQhd7qi2a3fabLstEzu0OS0SU4K4gJpDTMjkDzJ+rfYMqbf3O98zg9O
         ZqEXSXARizCtOUNwctnoBfI9Tl+TGRmURt7N815R8RAZc2FICmXtTc7tgZWI1/KTY78I
         g4pRGYInrrjXNbaXz/SelNPfNRk8h74eEpZCgicHU1BttK0LLSwYeEhdwV0aUTlDrb1v
         uz90ohTdR58BSzUi9mVezSCJj7b7GmG9Kn+qcfq0qJT70BVoL57nnafI0/9JyZ5/7vvF
         DUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780370252; x=1780975052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fWqTePdW4kjpFcuQSRvtq+YZpFX+FpQQHf9HMyZY+aI=;
        b=FkyhxFZasxuBFsEYuzksf0QL77/4W0m3+5++snygBqhN00KQt82hMOF/ZAiUZBauGp
         sE1cxyZ09RNH6DFqQFQyd27fh901oNFH8RA4mp6Yfv5uvHL2/xcW7AhLvvM87uigHRkT
         SYVzTvHKgwHkdv7hX1TiNmlHCFH8P/U4TxoBg/D+LoZD8M0AymsiOkkospnALhCVHoMZ
         3VHVthTGEZVRUv3uJXcFvILaAuVrknZQAQyoLu4U0zhTV2hNyDfE1TXknyfx4K8H9qkr
         57EYhGdbT78gOXZ202PfuMRcoCacwKO41KOL4cgoP1yAQzwhcLs99DBU1vYhWW88ARPN
         OgIw==
X-Gm-Message-State: AOJu0Yw2QuyQG4nWlG5RdAIV2HkMP3eGROC0N9GKbooFl04K2z9dEIT3
	6OQpb4Eg2IgyH70BVLko7FT05M4xZk0Nuh7127fqrrS/uvz86PanJ5BAWRbhexz7fl+dr23qXJR
	c+oLv
X-Gm-Gg: Acq92OHpl42TZnwx5GSRjz3LS7XRVWWXTDZlbYZvJ9eNZVBNonekJLLeYiJeya5wlRd
	bszJ32a23h7RqNqgj5OD7tlYC1TMSAnATVe7zOn+uwW+/BPWt92tZlqlDwiXWDadzFK9oAc9/tH
	Azjori3Cl63SeIFfcwRzXdzadAGOKx+fPOmo1Y4Ms3kylLFnjKf1y75K1I0yT8q90M5bYLAAasO
	HntRc30S+rofut4v0DDsXRhG2qZJy4eLGGgzGdnyXOKDrKrirouqgJICmT+Q54JLgXl/6I4YrAX
	q8zV1AWshw30PFQLbVvoN2ZJVtDYz9HID8rEAY5NctskfiS8tE2pQZZRR3YU6aWE7ncYNFiWfqh
	h7Mfef+6dfupYFUWdZVjop89yWKmmOZ8JqIqDkkfZESxsg06pqHwSKhYiO5FyavwhJ5vWnoWjRy
	gqSplLCQVPnEQ/iGcDZ6nERbnIYcIpgEbMZfUka9qKYhLXBjehCJ9UJqyFlBFhLw==
X-Received: by 2002:a05:622a:90:b0:50d:8db0:7abb with SMTP id d75a77b69052e-5173a841d22mr202025281cf.42.1780370252389;
        Mon, 01 Jun 2026 20:17:32 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51741b29745sm71219081cf.8.2026.06.01.20.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 20:17:31 -0700 (PDT)
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
Subject: [PATCH v5 09/13] liveupdate: Remove limit on the number of sessions
Date: Tue,  2 Jun 2026 03:17:13 +0000
Message-ID: <20260602031717.197696-10-pasha.tatashin@soleen.com>
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

Currently, the number of LUO sessions is limited by a fixed number of
pre-allocated pages for serialization (16 pages, allowing for ~819
sessions).

This limitation is problematic if LUO is used to support things such as
systemd file descriptor store, and would be used not just as VM memory
but to save other states on the machine.

Remove this limit by transitioning to a linked-block approach for
session metadata serialization. Instead of a single contiguous block,
session metadata is now stored in a chain of 16-page blocks. Each block
starts with a header containing the physical address of the next block
and the number of session entries in the current block.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/kho/abi/luo.h     |  24 +------
 kernel/liveupdate/luo_session.c | 115 +++++++++++++++-----------------
 2 files changed, 58 insertions(+), 81 deletions(-)

diff --git a/include/linux/kho/abi/luo.h b/include/linux/kho/abi/luo.h
index 9a4fe491812b..79758d92ed5f 100644
--- a/include/linux/kho/abi/luo.h
+++ b/include/linux/kho/abi/luo.h
@@ -33,11 +33,6 @@
  *     It includes the compatibility string, the liveupdate-number, and pointers
  *     to sessions and FLBs.
  *
- *   - struct luo_session_header_ser:
- *     Header for the session array. Contains the total page count of the
- *     preserved memory block and the number of `struct luo_session_ser`
- *     entries that follow.
- *
  *   - struct luo_session_ser:
  *     Metadata for a single session, including its name and a physical pointer
  *     to another preserved memory block containing an array of
@@ -63,13 +58,15 @@
 #define _LINUX_KHO_ABI_LUO_H
 
 #include <linux/align.h>
+#include <linux/kho/abi/block.h>
 #include <uapi/linux/liveupdate.h>
 
 /*
  * The LUO state is registered under this KHO entry name.
  */
 #define LUO_KHO_ENTRY_NAME	"LUO"
-#define LUO_ABI_COMPATIBLE	"luo-v3"
+#define LUO_COMPAT_BASE		"luo-v3"
+#define LUO_ABI_COMPATIBLE	LUO_COMPAT_BASE "-" KHO_BLOCK_ABI_COMPATIBLE
 #define LUO_ABI_COMPAT_LEN	ALIGN(sizeof(LUO_ABI_COMPATIBLE), 8)
 
 /**
@@ -118,21 +115,6 @@ struct luo_file_set_ser {
 	u64 count;
 } __packed;
 
-/**
- * struct luo_session_header_ser - Header for the serialized session data block.
- * @count: The number of `struct luo_session_ser` entries that immediately
- *         follow this header in the memory block.
- *
- * This structure is located at the beginning of a contiguous block of
- * physical memory preserved across the kexec. It provides the necessary
- * metadata to interpret the array of session entries that follow.
- *
- * If this structure is modified, `LUO_ABI_COMPATIBLE` must be updated.
- */
-struct luo_session_header_ser {
-	u64 count;
-} __packed;
-
 /**
  * struct luo_session_ser - Represents the serialized metadata for a LUO session.
  * @name:         The unique name of the session, provided by the userspace at
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 43342916d314..f6eeb965b3c1 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -24,9 +24,10 @@
  *   ioctls on /dev/liveupdate.
  *
  * - Serialization: Session metadata is preserved using the KHO framework. When
- *   a live update is triggered via kexec, an array of `struct luo_session_ser`
- *   is populated and placed in a preserved memory region. The physical address
- *   of this array is stored in the centralized `struct luo_ser` structure.
+ *   a live update is triggered via kexec, session metadata is serialized into
+ *   a chain of linked-blocks and placed in a preserved memory region. The
+ *   physical address of the first block header is stored in the centralized
+ *   `struct luo_ser` structure.
  *
  * Session Lifecycle:
  *
@@ -89,6 +90,7 @@
 #include <linux/fs.h>
 #include <linux/io.h>
 #include <linux/kexec_handover.h>
+#include <linux/kho_block.h>
 #include <linux/kho/abi/luo.h>
 #include <linux/list.h>
 #include <linux/liveupdate.h>
@@ -98,23 +100,14 @@
 #include <uapi/linux/liveupdate.h>
 #include "luo_internal.h"
 
-/* 16 4K pages, give space for 744 sessions */
-#define LUO_SESSION_PGCNT	16ul
-#define LUO_SESSION_MAX		(((LUO_SESSION_PGCNT << PAGE_SHIFT) -	\
-		sizeof(struct luo_session_header_ser)) /		\
-		sizeof(struct luo_session_ser))
-
 static DECLARE_RWSEM(luo_session_serialize_rwsem);
-
 /**
  * struct luo_session_header - Header struct for managing LUO sessions.
  * @count:       The number of sessions currently tracked in the @list.
  * @list:        The head of the linked list of `struct luo_session` instances.
  * @rwsem:       A read-write semaphore providing synchronized access to the
  *               session list and other fields in this structure.
- * @header_ser:  The header data of serialization array.
- * @ser:         The serialized session data (an array of
- *               `struct luo_session_ser`).
+ * @block_set:   The set of serialization blocks.
  * @sessions_pa: Points to the location of sessions_pa within struct luo_ser.
  * @active:      Set to true when first initialized. If previous kernel did not
  *               send session data, active stays false for incoming.
@@ -123,8 +116,7 @@ struct luo_session_header {
 	long count;
 	struct list_head list;
 	struct rw_semaphore rwsem;
-	struct luo_session_header_ser *header_ser;
-	struct luo_session_ser *ser;
+	struct kho_block_set block_set;
 	u64 *sessions_pa;
 	bool active;
 };
@@ -143,10 +135,14 @@ static struct luo_session_global luo_session_global = {
 	.incoming = {
 		.list = LIST_HEAD_INIT(luo_session_global.incoming.list),
 		.rwsem = __RWSEM_INITIALIZER(luo_session_global.incoming.rwsem),
+		.block_set = KHO_BLOCK_SET_INIT(luo_session_global.incoming.block_set,
+						sizeof(struct luo_session_ser)),
 	},
 	.outgoing = {
 		.list = LIST_HEAD_INIT(luo_session_global.outgoing.list),
 		.rwsem = __RWSEM_INITIALIZER(luo_session_global.outgoing.rwsem),
+		.block_set = KHO_BLOCK_SET_INIT(luo_session_global.outgoing.block_set,
+						sizeof(struct luo_session_ser)),
 	},
 };
 
@@ -173,25 +169,6 @@ static void luo_session_free(struct luo_session *session)
 	kfree(session);
 }
 
-static int luo_session_grow_ser(struct luo_session_header *sh)
-{
-	struct luo_session_header_ser *header_ser;
-
-	if (sh->count == LUO_SESSION_MAX)
-		return -ENOMEM;
-
-	if (sh->header_ser)
-		return 0;
-
-	header_ser = kho_alloc_preserve(LUO_SESSION_PGCNT << PAGE_SHIFT);
-	if (IS_ERR(header_ser))
-		return PTR_ERR(header_ser);
-
-	sh->header_ser = header_ser;
-	sh->ser = (void *)(header_ser + 1);
-	return 0;
-}
-
 static int luo_session_insert(struct luo_session_header *sh,
 			      struct luo_session *session)
 {
@@ -205,7 +182,7 @@ static int luo_session_insert(struct luo_session_header *sh,
 	 * for new session.
 	 */
 	if (sh == &luo_session_global.outgoing) {
-		err = luo_session_grow_ser(sh);
+		err = kho_block_grow(&sh->block_set, sh->count);
 		if (err)
 			return err;
 	}
@@ -232,6 +209,8 @@ static void luo_session_remove(struct luo_session_header *sh,
 	guard(rwsem_write)(&sh->rwsem);
 	list_del(&session->list);
 	sh->count--;
+	if (sh == &luo_session_global.outgoing)
+		kho_block_shrink(&sh->block_set, sh->count);
 }
 
 static int luo_session_finish_one(struct luo_session *session)
@@ -553,15 +532,17 @@ void __init luo_session_setup_outgoing(u64 *sessions_pa)
 
 int __init luo_session_setup_incoming(u64 sessions_pa)
 {
-	struct luo_session_header_ser *header_ser;
+	struct luo_session_header *sh = &luo_session_global.incoming;
+	int err;
 
-	if (sessions_pa) {
-		header_ser = phys_to_virt(sessions_pa);
-		luo_session_global.incoming.header_ser = header_ser;
-		luo_session_global.incoming.ser = (void *)(header_ser + 1);
-		luo_session_global.incoming.active = true;
-	}
+	if (!sessions_pa)
+		return 0;
 
+	err = kho_block_set_restore(&sh->block_set, sessions_pa);
+	if (err)
+		return err;
+
+	sh->active = true;
 	return 0;
 }
 
@@ -603,6 +584,8 @@ int luo_session_deserialize(void)
 {
 	struct luo_session_header *sh = &luo_session_global.incoming;
 	static bool is_deserialized;
+	struct luo_session_ser *ser;
+	struct kho_block_it it;
 	static int saved_err;
 	int err;
 
@@ -629,18 +612,19 @@ int luo_session_deserialize(void)
 	 * userspace to detect the failure and trigger a reboot, which will
 	 * reliably reset devices and reclaim memory.
 	 */
-	for (int i = 0; i < sh->header_ser->count; i++) {
-		err = luo_session_deserialize_one(sh, &sh->ser[i]);
+	kho_block_it_init(&it, &sh->block_set);
+	while ((ser = kho_block_it_read_entry(&it))) {
+		err = luo_session_deserialize_one(sh, ser);
 		if (err)
 			goto save_err;
 	}
 
-	kho_restore_free(sh->header_ser);
-	sh->header_ser = NULL;
-	sh->ser = NULL;
+	kho_block_set_destroy(&sh->block_set);
 
 	return 0;
+
 save_err:
+	kho_block_set_destroy(&sh->block_set);
 	saved_err = err;
 	return err;
 }
@@ -649,36 +633,47 @@ int luo_session_serialize(void)
 {
 	struct luo_session_header *sh = &luo_session_global.outgoing;
 	struct luo_session *session;
-	int i = 0;
+	struct kho_block_it it;
 	int err;
 
 	down_write(&luo_session_serialize_rwsem);
 	down_write(&sh->rwsem);
 	*sh->sessions_pa = 0;
 
+	kho_block_it_init(&it, &sh->block_set);
+
 	list_for_each_entry(session, &sh->list, list) {
-		err = luo_session_freeze_one(session, &sh->ser[i]);
-		if (err)
+		struct luo_session_ser *ser = kho_block_it_reserve_entry(&it);
+
+		/* This should not fail normally as blocks were pre-allocated */
+		if (WARN_ON_ONCE(!ser)) {
+			err = -ENOSPC;
 			goto err_undo;
+		}
 
-		strscpy(sh->ser[i].name, session->name,
-			sizeof(sh->ser[i].name));
-		i++;
-	}
+		err = luo_session_freeze_one(session, ser);
+		if (err) {
+			kho_block_it_prev(&it);
+			goto err_undo;
+		}
 
-	if (sh->header_ser && sh->count > 0) {
-		sh->header_ser->count = sh->count;
-		*sh->sessions_pa = virt_to_phys(sh->header_ser);
+		strscpy(ser->name, session->name, sizeof(ser->name));
 	}
+
+	kho_block_it_finalize(&it);
+
+	if (sh->count > 0)
+		*sh->sessions_pa = kho_block_set_head_pa(&sh->block_set);
 	up_write(&sh->rwsem);
 
 	return 0;
 
 err_undo:
 	list_for_each_entry_continue_reverse(session, &sh->list, list) {
-		i--;
-		luo_session_unfreeze_one(session, &sh->ser[i]);
-		memset(sh->ser[i].name, 0, sizeof(sh->ser[i].name));
+		struct luo_session_ser *ser = kho_block_it_prev(&it);
+
+		luo_session_unfreeze_one(session, ser);
+		memset(ser->name, 0, sizeof(ser->name));
 	}
 	up_write(&sh->rwsem);
 	up_write(&luo_session_serialize_rwsem);
-- 
2.53.0

