Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D092C237E
	for <linux-kselftest@vger.kernel.org>; Sat, 30 May 2026 22:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780179604; cv=none; b=DMWGp9tsfAZRYuEGWW+Offi3UP7wB72Gxq5jFmJ3Qm17sxUljSwkZObfzpKnfZZHk9d/jORMKS2FeRn43u7JSNAcPDCiJo7377PeCEtAHx1+KPS0hg/Q9B/opRZjGxnCFC5yphqBnJNap73ilO+IJBjGIxC7DASJRnKhPeZsVzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780179604; c=relaxed/simple;
	bh=DhsdXZAIsYS+PKBWOqtIaOAZNzKcM4TBtkEe9giYrf8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c1E4AWCDpgWPFiGsWefFfJzw29IbJ5mYbciJGkQxp6ECOiFP/vYWNI1Qi3M+zQAQiSb2qGg6vopUWQEPhJE3A3fLUkjHKQchLJaEF8hLZXt0Orem3ByKq7tCgVRp5U1anHED+wPTpgVAGbPLDxAwTAnPIU5x0PR34U8OWbwifNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=aaIDTUR7; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="aaIDTUR7"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-915336b83adso188625285a.2
        for <linux-kselftest@vger.kernel.org>; Sat, 30 May 2026 15:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780179598; x=1780784398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ssXPv2DRhDSGHaylMjR7rg2Io0bTsFx1rhCfXPl0Sk=;
        b=aaIDTUR7js6QH5ujnaXO28/RzUaN1AMy80q2HR5JoPT5hkCU9x3pIbUDDXXdISFv2d
         81SBqgHmc27pXvQI/zcEFP1a60qGt/vcI2u3T5OHuNbliqmuKwFery1MfdCj0+M+ijY6
         TQHQVuh+n2NL322WXnkMsCkonawC6nxAe7V1uluyTVfd1410jloHRuGmDLyW4oc9Jiqk
         rXYshjmVztGqhAaZM+Buz+jCgpZjVKjCh8UENzd/G48ngs8VX2ybUQwrKNedJcmV0iS2
         HcEnrNgbVLQkmdA35wc03M5qI53iKaIk8bxRwp2k9LtDIuIFK2RlnlIg78BKZR86j66y
         FfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780179598; x=1780784398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/ssXPv2DRhDSGHaylMjR7rg2Io0bTsFx1rhCfXPl0Sk=;
        b=nPEVtN7XWrgXclukQd/9+aQgMyF48uTmxHlialj0N9zmdE4UE9B6pr8JkPJ2zEZ3jn
         tVSBQCGlXHzqhYuZ3Ol7n125OBcYE/95rQkSV4LQ3NPNKAiAOhCFPUaoYzpd2MW1/qs9
         NxyI26T//xt275ktz6WuLlfC5JSmHUIfRwjIfGgdaO/Jk+rBvKRhhHguzn39UUYSmjZm
         bRpATvqJsH0bqGgL7uayjhNGjk+9a+BkDKMfTsYwefr6xTb8EXLO0BdNvHzqHeeAwpVp
         RcIzymgTG4cV+Wn3iG5XYv/xAnkevUZhygbgHh1b8M6/mJ3afIIbkg1XfGCEhPSxEDkm
         D+tQ==
X-Gm-Message-State: AOJu0YzeCfxxbXkrHbjIMWVc7R1SfbXggbYHAiZYFCTPLsTmhgj2ASg3
	/4yNgPy4OlKTVy+K/rrQRCpBvik36RtQTSFD4hnoYMrTDFwiS6r5qY0dWSYPhSGdCI8JUWqbgrV
	cJgt5
X-Gm-Gg: Acq92OEeXofPAGBiNzj4suuI3vDrnrZeeCmfQrNeTeSLxGU26GZKFzEce920N3auCUW
	nxsnq1ZlbHR687fiJsXJmFP/ymTPipQG9u6tZ+OZshZMBZIEA7tcn/Sq8VYBLO77bEXX7JlvrEo
	0hco54HbNhTg+3/R7rSoDhRc+/qiVYznd1y+y2GZB2y6Su4nit1vEkkWzd/SsD3uUjmjevsxXMM
	YU13Dv69ueipHASjFjlAo+CmamMTrb4o5PC+4dFGnccp/rKtKncwPQsC845QTcOzmNDioR2+TsJ
	9LzBqTz0kC1wuGM1R5b9zBq0a0GJmM9UlW2gwMNl2gIvamjJiCBa7UpWv5W9hUoFj+/vDTzw3l9
	e0pjIbMtYtAmplLDodsA37HKXxyBkyvn7skxfjMxLrisPIASsbFsX03reJ09+825yyrpKRp0wZJ
	2dKW01XIMBVx4raGnNpHp8+9Bzg24fZklNvdlsTL0YVBUeZpwl9LEcC9pk9FdzGw==
X-Received: by 2002:a05:620a:a19c:10b0:914:c01e:6f92 with SMTP id af79cd13be357-9153d9709f3mr614876885a.18.1780179598221;
        Sat, 30 May 2026 15:19:58 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-915324868a0sm651790085a.18.2026.05.30.15.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:19:57 -0700 (PDT)
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
Subject: [PATCH v4 08/13] liveupdate: defer session block allocation and PA setting
Date: Sat, 30 May 2026 22:19:33 +0000
Message-ID: <20260530221938.115978-9-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260530221938.115978-1-pasha.tatashin@soleen.com>
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, luo_session_setup_outgoing() allocates the session block and
sets its physical address in the header immediately. With upcoming
dynamic block-based session management, this makes the first block
different from the rest. Move the allocation to where it is first needed.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_core.c     |  4 +-
 kernel/liveupdate/luo_internal.h |  2 +-
 kernel/liveupdate/luo_session.c  | 68 ++++++++++++++++++++------------
 3 files changed, 45 insertions(+), 29 deletions(-)

diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.c
index e261a03a1b47..fef7fc6765e3 100644
--- a/kernel/liveupdate/luo_core.c
+++ b/kernel/liveupdate/luo_core.c
@@ -161,9 +161,7 @@ static int __init luo_state_setup(void)
 	strscpy(luo_ser->compatible, LUO_ABI_COMPATIBLE, sizeof(luo_ser->compatible));
 	luo_ser->liveupdate_num = luo_global.liveupdate_num + 1;
 
-	err = luo_session_setup_outgoing(&luo_ser->sessions_pa);
-	if (err)
-		goto exit_free_luo_ser;
+	luo_session_setup_outgoing(&luo_ser->sessions_pa);
 
 	err = luo_flb_setup_outgoing(&luo_ser->flbs_pa);
 	if (err)
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index fe22086bfbeb..ee18f9a11b91 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -79,7 +79,7 @@ extern struct rw_semaphore luo_register_rwlock;
 
 int luo_session_create(const char *name, struct file **filep);
 int luo_session_retrieve(const char *name, struct file **filep);
-int __init luo_session_setup_outgoing(u64 *sessions_pa);
+void __init luo_session_setup_outgoing(u64 *sessions_pa);
 int __init luo_session_setup_incoming(u64 sessions_pa);
 int luo_session_serialize(void);
 int luo_session_deserialize(void);
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index b728fd9e3ed2..0548d48bb014 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -108,15 +108,16 @@ static DECLARE_RWSEM(luo_session_serialize_rwsem);
 
 /**
  * struct luo_session_header - Header struct for managing LUO sessions.
- * @count:      The number of sessions currently tracked in the @list.
- * @list:       The head of the linked list of `struct luo_session` instances.
- * @rwsem:      A read-write semaphore providing synchronized access to the
- *              session list and other fields in this structure.
- * @header_ser: The header data of serialization array.
- * @ser:        The serialized session data (an array of
- *              `struct luo_session_ser`).
- * @active:     Set to true when first initialized. If previous kernel did not
- *              send session data, active stays false for incoming.
+ * @count:       The number of sessions currently tracked in the @list.
+ * @list:        The head of the linked list of `struct luo_session` instances.
+ * @rwsem:       A read-write semaphore providing synchronized access to the
+ *               session list and other fields in this structure.
+ * @header_ser:  The header data of serialization array.
+ * @ser:         The serialized session data (an array of
+ *               `struct luo_session_ser`).
+ * @sessions_pa: Points to the location of sessions_pa within struct luo_ser.
+ * @active:      Set to true when first initialized. If previous kernel did not
+ *               send session data, active stays false for incoming.
  */
 struct luo_session_header {
 	long count;
@@ -124,6 +125,7 @@ struct luo_session_header {
 	struct rw_semaphore rwsem;
 	struct luo_session_header_ser *header_ser;
 	struct luo_session_ser *ser;
+	u64 *sessions_pa;
 	bool active;
 };
 
@@ -171,10 +173,30 @@ static void luo_session_free(struct luo_session *session)
 	kfree(session);
 }
 
+static int luo_session_grow_ser(struct luo_session_header *sh)
+{
+	struct luo_session_header_ser *header_ser;
+
+	if (sh->count == LUO_SESSION_MAX)
+		return -ENOMEM;
+
+	if (sh->header_ser)
+		return 0;
+
+	header_ser = kho_alloc_preserve(LUO_SESSION_PGCNT << PAGE_SHIFT);
+	if (IS_ERR(header_ser))
+		return PTR_ERR(header_ser);
+
+	sh->header_ser = header_ser;
+	sh->ser = (void *)(header_ser + 1);
+	return 0;
+}
+
 static int luo_session_insert(struct luo_session_header *sh,
 			      struct luo_session *session)
 {
 	struct luo_session *it;
+	int err;
 
 	guard(rwsem_write)(&sh->rwsem);
 
@@ -183,8 +205,9 @@ static int luo_session_insert(struct luo_session_header *sh,
 	 * for new session.
 	 */
 	if (sh == &luo_session_global.outgoing) {
-		if (sh->count == LUO_SESSION_MAX)
-			return -ENOMEM;
+		err = luo_session_grow_ser(sh);
+		if (err)
+			return err;
 	}
 
 	/*
@@ -494,21 +517,10 @@ int luo_session_retrieve(const char *name, struct file **filep)
 	return err;
 }
 
-int __init luo_session_setup_outgoing(u64 *sessions_pa)
+void __init luo_session_setup_outgoing(u64 *sessions_pa)
 {
-	struct luo_session_header_ser *header_ser;
-
-	header_ser = kho_alloc_preserve(LUO_SESSION_PGCNT << PAGE_SHIFT);
-	if (IS_ERR(header_ser))
-		return PTR_ERR(header_ser);
-
-	*sessions_pa = virt_to_phys(header_ser);
-
-	luo_session_global.outgoing.header_ser = header_ser;
-	luo_session_global.outgoing.ser = (void *)(header_ser + 1);
+	luo_session_global.outgoing.sessions_pa = sessions_pa;
 	luo_session_global.outgoing.active = true;
-
-	return 0;
 }
 
 int __init luo_session_setup_incoming(u64 sessions_pa)
@@ -610,6 +622,8 @@ int luo_session_serialize(void)
 
 	down_write(&luo_session_serialize_rwsem);
 	down_write(&sh->rwsem);
+	*sh->sessions_pa = 0;
+
 	list_for_each_entry(session, &sh->list, list) {
 		err = luo_session_freeze_one(session, &sh->ser[i]);
 		if (err)
@@ -619,7 +633,11 @@ int luo_session_serialize(void)
 			sizeof(sh->ser[i].name));
 		i++;
 	}
-	sh->header_ser->count = sh->count;
+
+	if (sh->header_ser && sh->count > 0) {
+		sh->header_ser->count = sh->count;
+		*sh->sessions_pa = virt_to_phys(sh->header_ser);
+	}
 	up_write(&sh->rwsem);
 
 	return 0;
-- 
2.53.0

