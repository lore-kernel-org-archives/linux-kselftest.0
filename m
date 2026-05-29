Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49AD36A37E
	for <linux-kselftest@vger.kernel.org>; Fri, 29 May 2026 03:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780024878; cv=none; b=XlCLXP3Ce5qNWTL0IId7EZkFaFnxQKj84+J8aHsdfx8/YQFXNxvonTTc31vo4JfdIe6d9lbBcxqBOFKnnoUlq++SOmRkrTytu9hA7sAA6PaYcE/5B5pShcJb4vWXWRPvd6HewHwr513svj0AwkOrTpl57NeWwtv5QFA8gWWq2WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780024878; c=relaxed/simple;
	bh=9LSRU3a1usVDXKHUxY4h/d/bYsPe3I+mUssTk71ltV4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PnCTV2RuqMR8f9NpUlEt1PUKiCTj1U9yKCLhRKKXnnXXmH/+TPi8AgZG/YvB6IG8D2gC6DgvqVTWcGw97usgJTDoOejtw6X97josIJw2XSKaUtOxWWFdMs1DECAtkSg8RrYFBT8N6Iz5t4Gc1RfdILCnCUkDk9JO7F2zj5iJ9lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=giZ7dXUh; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="giZ7dXUh"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8acb856a674so161138826d6.0
        for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 20:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780024876; x=1780629676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/lzT/uKNjiuJAcCs6ljq32s6d+IXBzBHeWWiRI2fHMI=;
        b=giZ7dXUhJCR+iFOptRT/THIdWf3e1MY7fkTXSXFrgpSV2teF9K5vZN90kZvJxfRtQp
         NvdEXGNCIwZiTbMV8lAk6E1SeaO2ytGzKy9pIU2qUw+Q7puTARw9+ZaPYM7QB1FzfUjB
         0CbolnvQgBwuJeSrhiPAH4VAh7TqBND60OjSqmmjbBGN2itkxsW1dcK5fZ3kCjMYFjG5
         cR6lsKWvK6La50SXvwEk3XPs+RoNgZJbRp5hnubRbHh8zqbQoFzuhmd3R/DQ7euBhqch
         PiWdGG15Wf9/xlvmFb634BYtjV7ITSQVGzezwsutE9JaY1vIXZ6JxiDHTPuHRFzewncn
         l20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780024876; x=1780629676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/lzT/uKNjiuJAcCs6ljq32s6d+IXBzBHeWWiRI2fHMI=;
        b=tQzbfNpEv1c2K9A8kM/8d4cqGvm+ExRz0Z22lM9Gz5G1otQBAnrwx+iT3u66qqUy/7
         TmgTkM7o+/jttyvut6192kkW+xo0rr+Un5kCLqzXIRuW2GyTbSZqTriNTrRF5BhRp42z
         VEi0aLPAqrk090SrHK3i7a7gBZR+1rSBqeFZ26E1lcpfFLMyhbuxEfkyYPnWC8ryxnY1
         OY+OhVLARAAKvcxnAzpUz9wHFlFTHq9WI39AvYnAxMGzyzoPRFhun6sW497dGCXoAjny
         L1yJL7udMV54j8rpPkRY6sGoiXKgErDN9yT9Yzf7J5z96XvcY+ibHEBj1KJnn/m3/+Z2
         Gg9Q==
X-Gm-Message-State: AOJu0YytWGY3NfKf8uEzvaPgEy2eEtsxh3S5N0qLz+xariCMnAsohxhV
	LQJ+pHA/z3dE/0brsMl/KOlX9Z56r4o/4H6OR1rAiDbAFik7cqaOP6JVKG75ExKGuJJY2UMds1R
	hPvKD
X-Gm-Gg: Acq92OF9R4QOEnRkumuj8aSArhsvx1TC6y6jkNzsdSi1/IVjCQEz/c0mK63HYx2AN0/
	8G3Ttz5AQMwbDcZOdWgjbRLRY/nlZW5UMRH4DFUfOyb5cjpzbEAt+xs/FzUI6BGmJjbPNk7pt92
	m1C1h0rK9IgvTdXCR1v4jkbk/89u4c98MPGU1D1t1OsGSPO+6Kzf6j3BpB4io3Gfxef9RGFw8fv
	0KTM0n+HXoUUmNWXCtuRNNGMVHFGLJOp2mHRhEqFFMM/XBoJZW7CSu1kPW9HDv8dpBErA+nFQm8
	84Rjf8X3Diw8lKEv9otFF8Xg8nyjd1s14K7W9bo2g66jBC+TJ6o2swE2pOB6T0N89AyC49F7fBJ
	+6WhOS8aBax/eebn2H8kHslrprj361YJEvu2njVvR57tJs+bFrxj9BR2Yf9iKAZMiqhdv+AUgfr
	gyyfKPHTVoMwUV7nFi9k3q4yzDbmRODQoQefDwhaBTaHVGOWGYXQ0+nKDwiFjPJw==
X-Received: by 2002:a05:6214:33c2:b0:8cb:d479:a103 with SMTP id 6a1803df08f44-8cce621c869mr14316046d6.20.1780024875958;
        Thu, 28 May 2026 20:21:15 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea26d286sm1179476d6.48.2026.05.28.20.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 20:21:15 -0700 (PDT)
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
Subject: [PATCH v3 06/11] liveupdate: defer session block allocation and PA setting
Date: Fri, 29 May 2026 03:21:01 +0000
Message-ID: <20260529032106.1505796-7-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529032106.1505796-1-pasha.tatashin@soleen.com>
References: <20260529032106.1505796-1-pasha.tatashin@soleen.com>
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
index 5e12c8f8669b..92f8c53c7a73 100644
--- a/kernel/liveupdate/luo_core.c
+++ b/kernel/liveupdate/luo_core.c
@@ -157,9 +157,7 @@ static int __init luo_state_setup(void)
 	strscpy(luo_ser->compatible, LUO_ABI_COMPATIBLE, sizeof(luo_ser->compatible));
 	luo_ser->liveupdate_num = luo_global.liveupdate_num + 1;
 
-	err = luo_session_setup_outgoing(&luo_ser->sessions_pa);
-	if (err)
-		goto exit_free_luo_ser;
+	luo_session_setup_outgoing(&luo_ser->sessions_pa);
 
 	err = luo_flb_setup_outgoing(&luo_ser->flbs_pa);
 	if (err)
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index 9bf26c5b1495..28ebb4f3000b 100644
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
index 5c092c71797e..ec72f16185f3 100644
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
@@ -495,21 +518,10 @@ int luo_session_retrieve(const char *name, struct file **filep)
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
@@ -611,6 +623,8 @@ int luo_session_serialize(void)
 
 	down_write(&luo_session_serialize_rwsem);
 	down_write(&sh->rwsem);
+	*sh->sessions_pa = 0;
+
 	list_for_each_entry(session, &sh->list, list) {
 		err = luo_session_freeze_one(session, &sh->ser[i]);
 		if (err)
@@ -620,7 +634,11 @@ int luo_session_serialize(void)
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

