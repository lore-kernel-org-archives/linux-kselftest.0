Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0E43D4116
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 22:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778797605; cv=none; b=PSBa1Ie+qvu6qb50HJCiAfRwxBbJq1KKNbjAHj3iQTjq26BbpxH/dpcTuF2InRW1qwFarz8eJyNHvGdibSG/uygK48tms50I7MlVSW8aTnk5jxCjMbW8MEveIyyy5zgbACCBypIn1SenC6vA9v9DjoPCWAS5MLz5FAY/P3m6oGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778797605; c=relaxed/simple;
	bh=QUWPsXAuk9w8x8hvZHmCxbdsSUfg7OnvjTcXRnKOaX8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hO+ubCTnI0m4wGJJdVV8q+6E6h8pq2HxKnVbBH5soUJiW0f68dI1l3BI2OcVFbhZEi7Gl4e11YC5P1PY8Or1tNBMlZD5yprfoHO/xkiz/xP65xxwIiLjnTyBebmm+SnXvpJB1Fu2MyjRucbQ09g7F8su38ggQxHMH/EQm5dsoO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=GY4TZ5C6; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="GY4TZ5C6"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-514ae601df2so27945261cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 15:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1778797602; x=1779402402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2T3oA7tkx4rspjASSft4V+bRK2GXucIgM1nPm7xvZEk=;
        b=GY4TZ5C6qvkDfLtPMspH7X2oPhEKsiaJRQAn3QC/HwQyD/rhIVjsWHVMLo7okxYwAU
         KsytTEblAykhbXNhElVshVnHLQqhlU+wQypSSaP8WkDgGrAkqYzk/WrLYRSxsHK6/EDL
         oSBC3yR/y8XQekgY2Z7h4G5u9i/T5uWTV0++I67JrMzpgxuMWQKA/LW6D3k4ybxI7r/B
         O6yrQwkU1/UFi6I7K+C0dzpfHAcaOmXYaXc9yFaScXOWzlTw+KEQAfq2fXu0spO3mXoW
         Rc4SU6UnWP20Kxdyas188gdrbyoYeP30nXoFafvZT5/6DCs3BRUSrKr26txOmmqDZiux
         dnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778797602; x=1779402402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2T3oA7tkx4rspjASSft4V+bRK2GXucIgM1nPm7xvZEk=;
        b=iocVQbhDJ9pgiXKg8aI04LEu6N4wGNpETGGmZxYQ7A4cHSBpgOs8pxMxBwlHe4Fehy
         7zkKPmwHoqHqHvEok+GR2wmCkAu9VZe759vOdSjWq51Rsmi+TH+KnUeWouVFkK8q4Xkf
         r2m2VTjLczhevoAqqxUcjF5XwG9sUn+WR4UX1FhlOROLXL0l9wwbOmWD/Qo8peC5r9VS
         pjx5TyPmcbRVW1xHEFjNMPn1jP0OeiLkqpvPk8IOfrlA7sMX2zA7ws/IHaJrUDQ1ZdNg
         eoN+eYId9R4SShC+IaUpNJypF5IkTSQ8u5Efn/+/dIe0E2S/8VAyFZ32t7KfjAYVoUBz
         /d/w==
X-Gm-Message-State: AOJu0Yx/6faKKKCpxv2/DoBAPrIPPY9xJjJJGaaPUo23waQyt97ua4GE
	NcT/mfNtyhs0bbsPEbKHWcawNxtyilUt51+nyxx+bKa7in+bg3/u35yQMbAw9qxvC1dYSm7Po6S
	tzY5Oddw=
X-Gm-Gg: Acq92OHwumomEGMmflUOq0RbnJrzddGL/6quUs0e4fvYOuYxhapkCI0EgoNP46FBsUG
	zsHvGtlEaqNX36MkJeZfAp+XEPZq/YsEH/KbnDyuGJcjgGmB034E4OZRypSUeOy/witC9oMM9Jt
	v4RiRGULrnZMCPAMA9Z2EzE6PitFtgEg0wiRvuJ+WciG0rV0iKOIf0U+13IzEqxUsH53xsDN/kP
	tjrLbkoJjM5vLzNe84ubS0usUJ0SVlgPgpF1PbbWi06h02eHKq0kYawzhha7Ua2LEt9kJ8Xzizu
	DlTeWkDCbvZRHPMEUtqj6PnqgROwVrAGjdbZDt0Zdy9M2pXX6RSZEF8u6BFamn2mwyHp/FFXen/
	IkOQjokQPD0RnwRqhbhTVtgXFFFPaHAmC7mAYtye7Fz+CJ5z08KN6hNyhIm0Dx/axG3xgqsJBd/
	jPJfXBV69Es8CcNbHZQi/mFsQV9qIAR/+OTIupN5CpeWrb5AD6PN0=
X-Received: by 2002:ac8:5c92:0:b0:514:6650:eea4 with SMTP id d75a77b69052e-5165a296e10mr18589761cf.57.1778797601967;
        Thu, 14 May 2026 15:26:41 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516456ba92fsm28671901cf.9.2026.05.14.15.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:26:41 -0700 (PDT)
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
Subject: [PATCH v2 06/10] liveupdate: Remove limit on the number of sessions
Date: Thu, 14 May 2026 22:26:24 +0000
Message-ID: <20260514222628.931312-7-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260514222628.931312-1-pasha.tatashin@soleen.com>
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
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

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/kho/abi/luo.h     |  24 +-------
 kernel/liveupdate/luo_session.c | 105 +++++++++++++++-----------------
 2 files changed, 50 insertions(+), 79 deletions(-)

diff --git a/include/linux/kho/abi/luo.h b/include/linux/kho/abi/luo.h
index 2ba447c0c1ba..a643193a379c 100644
--- a/include/linux/kho/abi/luo.h
+++ b/include/linux/kho/abi/luo.h
@@ -36,7 +36,7 @@
  *
  * Main LUO Node (/):
  *
- *   - compatible: "luo-v2"
+ *   - compatible: "luo-v3"
  *     Identifies the overall LUO ABI version.
  *   - luo-abi-header: u64
  *     The physical address of `struct luo_ser`.
@@ -54,11 +54,6 @@
  *     of the next data block and the number of entries that follow this
  *     header in the current block.
  *
- *   - struct luo_session_header_ser:
- *     Header for the session array. Contains the total page count of the
- *     preserved memory block and the number of `struct luo_session_ser`
- *     entries that follow.
- *
  *   - struct luo_session_ser:
  *     Metadata for a single session, including its name and a physical pointer
  *     to another preserved memory block containing an array of
@@ -90,7 +85,7 @@
  */
 #define LUO_FDT_SIZE		PAGE_SIZE
 #define LUO_FDT_KHO_ENTRY_NAME	"LUO"
-#define LUO_FDT_COMPATIBLE	"luo-v2"
+#define LUO_FDT_COMPATIBLE	"luo-v3"
 #define LUO_FDT_ABI_HEADER	"luo-abi-header"
 
 /**
@@ -155,21 +150,6 @@ struct luo_file_set_ser {
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
- * If this structure is modified, `LUO_FDT_COMPATIBLE` must be updated.
- */
-struct luo_session_header_ser {
-	u64 count;
-} __packed;
-
 /**
  * struct luo_session_ser - Represents the serialized metadata for a LUO session.
  * @name:         The unique name of the session, provided by the userspace at
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 339514e8122c..064e83fabe62 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -69,21 +69,13 @@
 #include <uapi/linux/liveupdate.h>
 #include "luo_internal.h"
 
-/* 16 4K pages, give space for 744 sessions */
-#define LUO_SESSION_PGCNT	16ul
-#define LUO_SESSION_MAX		(((LUO_SESSION_PGCNT << PAGE_SHIFT) -	\
-		sizeof(struct luo_session_header_ser)) /		\
-		sizeof(struct luo_session_ser))
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
@@ -92,8 +84,7 @@ struct luo_session_header {
 	long count;
 	struct list_head list;
 	struct rw_semaphore rwsem;
-	struct luo_session_header_ser *header_ser;
-	struct luo_session_ser *ser;
+	struct luo_block_set block_set;
 	u64 *sessions_pa;
 	bool active;
 };
@@ -112,10 +103,14 @@ static struct luo_session_global luo_session_global = {
 	.incoming = {
 		.list = LIST_HEAD_INIT(luo_session_global.incoming.list),
 		.rwsem = __RWSEM_INITIALIZER(luo_session_global.incoming.rwsem),
+		.block_set = LUO_BLOCK_SET_INIT(luo_session_global.incoming.block_set,
+						sizeof(struct luo_session_ser)),
 	},
 	.outgoing = {
 		.list = LIST_HEAD_INIT(luo_session_global.outgoing.list),
 		.rwsem = __RWSEM_INITIALIZER(luo_session_global.outgoing.rwsem),
+		.block_set = LUO_BLOCK_SET_INIT(luo_session_global.outgoing.block_set,
+						sizeof(struct luo_session_ser)),
 	},
 };
 
@@ -142,25 +137,6 @@ static void luo_session_free(struct luo_session *session)
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
@@ -174,7 +150,7 @@ static int luo_session_insert(struct luo_session_header *sh,
 	 * for new session.
 	 */
 	if (sh == &luo_session_global.outgoing) {
-		err = luo_session_grow_ser(sh);
+		err = luo_block_grow(&sh->block_set, sh->count);
 		if (err)
 			return err;
 	}
@@ -201,6 +177,8 @@ static void luo_session_remove(struct luo_session_header *sh,
 	guard(rwsem_write)(&sh->rwsem);
 	list_del(&session->list);
 	sh->count--;
+	if (sh == &luo_session_global.outgoing)
+		luo_block_shrink(&sh->block_set, sh->count);
 }
 
 static int luo_session_finish_one(struct luo_session *session)
@@ -489,15 +467,17 @@ void __init luo_session_setup_outgoing(u64 *sessions_pa)
 
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
 
+	err = luo_block_restore(&sh->block_set, sessions_pa);
+	if (err)
+		return err;
+
+	sh->active = true;
 	return 0;
 }
 
@@ -539,6 +519,8 @@ int luo_session_deserialize(void)
 {
 	struct luo_session_header *sh = &luo_session_global.incoming;
 	static bool is_deserialized;
+	struct luo_session_ser *ser;
+	struct luo_block_it it;
 	static int err;
 
 	/* If has been deserialized, always return the same error code */
@@ -564,51 +546,60 @@ int luo_session_deserialize(void)
 	 * userspace to detect the failure and trigger a reboot, which will
 	 * reliably reset devices and reclaim memory.
 	 */
-	for (int i = 0; i < sh->header_ser->count; i++) {
-		err = luo_session_deserialize_one(sh, &sh->ser[i]);
+	luo_block_it_init(&it, &sh->block_set);
+	while ((ser = luo_block_it_read(&it))) {
+		err = luo_session_deserialize_one(sh, ser);
 		if (err)
-			return err;
+			goto err_destroy_blocks;
 	}
 
-	kho_restore_free(sh->header_ser);
-	sh->header_ser = NULL;
-	sh->ser = NULL;
+err_destroy_blocks:
+	luo_block_destroy(&sh->block_set);
 
-	return 0;
+	return err;
 }
 
 int luo_session_serialize(void)
 {
 	struct luo_session_header *sh = &luo_session_global.outgoing;
 	struct luo_session *session;
-	int i = 0;
+	struct luo_block_it it;
 	int err;
 
 	guard(rwsem_write)(&sh->rwsem);
 	*sh->sessions_pa = 0;
 
+	luo_block_it_init(&it, &sh->block_set);
+
 	list_for_each_entry(session, &sh->list, list) {
-		err = luo_session_freeze_one(session, &sh->ser[i]);
+		struct luo_session_ser *ser = luo_block_it_next(&it);
+
+		if (!ser) {
+			err = -ENOSPC;
+			goto err_undo;
+		}
+
+		err = luo_session_freeze_one(session, ser);
 		if (err)
 			goto err_undo;
 
-		strscpy(sh->ser[i].name, session->name,
-			sizeof(sh->ser[i].name));
-		i++;
+		strscpy(ser->name, session->name, sizeof(ser->name));
 	}
 
-	if (sh->header_ser && sh->count > 0) {
-		sh->header_ser->count = sh->count;
-		*sh->sessions_pa = virt_to_phys(sh->header_ser);
-	}
+	luo_block_it_finalize(&it);
+
+	if (sh->sessions_pa && sh->count > 0)
+		*sh->sessions_pa = sh->block_set.head_pa;
 
 	return 0;
 
 err_undo:
+	luo_block_it_prev(&it);
 	list_for_each_entry_continue_reverse(session, &sh->list, list) {
-		i--;
-		luo_session_unfreeze_one(session, &sh->ser[i]);
-		memset(sh->ser[i].name, 0, sizeof(sh->ser[i].name));
+		struct luo_session_ser *ser = luo_block_it_prev(&it);
+
+		luo_session_unfreeze_one(session, ser);
+		memset(ser->name, 0, sizeof(ser->name));
 	}
 
 	return err;
-- 
2.53.0

