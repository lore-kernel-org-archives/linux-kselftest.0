Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854864;
	b=3d+C5GpM4E9E/mRphAAYf5nZTAp1OWAlomQKtU1fIbLFemaOv9FrRJySxgJs9IZz51xa
	 OG+eWxXZgyTcrUi7nYEhbgfuVkRKbdv/0hR7+4b+Va7PF50uiBz78zjVGe9np9dIWin3q
	 r6q91KDf8IWOVSy0gs8BIpTfHFaacaUp8dh7X/lOVMRMMbmJkKd8nQJKEVNdO61xs9rlp
	 2XiGyAXj9RwfXJSKxt//KV09fxniz7NOLWh+JmJ1D0m2fLj3NGq0gF0R6Xje5Y1jzqBhK
	 uRbDgOF7zEzp+USlM+uXyjvVPYVAdxqO+KPoU8zJbj3uAwphtQQIm+lnWz1E+SaraAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854864;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v098YBuIdrKaWG/f26OqsK+m7fEKJ39NQmIhL+jm86Q=;
	b=XexPgwEchVAbhcERRm686qMeWZrJxs98OTEuGVYLYQ7VBYLl8M3HqbVVSlWlgF/Wot6v
	 i9E/27hwRIB5igZuJ31UerVcYY2e7VQKlt2iSJITbe9R2O3X0lNrjzHIXRQPScpoAG83a
	 jo/ICl/9y+oCtfp5iVikyZUznhJCT/CnqbG16MCWX+rXVfxU58Rct9BllkHM6vYzjVGSD
	 oQXtzp03jqSV81CF6lzmWbCcpDVq0oeoRVqESZA5t8YoWu9ndd4Ud1wFjLOW4b/V9pJci
	 GdrqA+oje7DmmzphPqaj/GwA3ho77DvJmE99rcWC14cyrLqFKXrCtUHnjwqw+wvzWNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=bVWrYH5l;
	arc=none smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2455606D816
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 05:01:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2455606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=bVWrYH5l
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5eafb65e204so473973e0c.1
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 21:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793854862; x=1794459662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=v098YBuIdrKaWG/f26OqsK+m7fEKJ39NQmIhL+jm86Q=;
        b=bVWrYH5l5854+NhczsUhYu3xmfCoWRgcjOfjUMuXKuNr7w549b6w7jSfDM4cZ+BLxc
         619ViqeDZP/4H+pKutBapgf9vnTHOJgr4iLyKC29hsoHEmPxzODxf6p6qVq+FnD/aO5C
         dSr3NrVNXAc5hPLr7y9ZK3YpmVIlQc8OuHIv2Xk5kxRIpoWuAtZZRkkv7z0w2Qf7COky
         trKVLTK5NyhF26inZjCCM6NZ+D/A1s/AGe8pqg6vUgo52a8UMgy5dNRFS6hme2vIVbG/
         NRbWBZWYj5b7v0eHB45bozBI2N0IJ6mK0jwx0iswaci8djlHuk/n//wL4FoPtwQMjcHY
         ONeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793854862; x=1794459662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=v098YBuIdrKaWG/f26OqsK+m7fEKJ39NQmIhL+jm86Q=;
        b=YlN/MZ1VlRFDnow7u3M0yeEB+wWTWiBfC1VvF/z3tCzvpvspmaddmB511oX8VcTCMx
         Y+dt+TXy8VlyfQLYbNMyKtyfUS3wenn6QbTLs0rFEQs16TpwCxfEqqrL7jIZuoJf2Sc0
         aEI0T1aG2es8k+o6yd8QaJyfGFztctSSuUipY0/DTUWI6cCyHPx6VEUaCo6+3loc9yL6
         vcYkWOwpLiwp5ZAh/ietg/3ZtcBbxXTNy6ex3zdawAHSRmtpRLsHLOIJhZOsPtKJnck1
         lPaHEqShlvv+saVQ3ZPeH7kUsnxnZAS+w0o7z7bOwyGdNpJjbIipiextdZHv5ubUkyww
         mBJw==
X-Gm-Message-State: APuU4Z+g/kXApeY6I6iwB0Yfo9KVr5i0mrCP5CDZUWQulTnST8ckyO0p
	LRE/umPKi1AcLWTQ12aySjEUXIsQiNPjSuWxoHRL2jUFgG7BbNH1a0SPlvtSzMywfzW/2z6595b
	Y/tZs
X-Gm-Gg: AYBFou0wXcGyTXA9rxtaKkW7wjRq2IijzQQBGcye4ghO61Ls07xsI/p3PicmK85Crgl
	rO+XYneW6XyRELCz3K9KrJx6c07L+VUoHxm9fyonuF8RuiN8nOEscCMsLktAvZ19CyKWOqTmEfc
	P8Xa6UwvzVHYVV+vpc3YwQECtfaitbvCX5gaikXwbRksIYNjNkZaMZhWgw7nc1QE6dL5WU0upl0
	/ExEDC1MszcP8jqNc7fZQ++pZWbSNh+IYUmgnhzFxYftI32BIo+OA+ta8evdegmKi5rnznnPHU7
	QecMlUCV3xfyBoS/Y0qtVP51HVWgvpZKPc0/6N0da4sFGyEsfCAqmb2yd7l1Hi2aEDEQwAMt5JH
	Z4Htc7JfYLv5pqMnrZdLDlTU4mJXrA9gERgz7Er/4uwpjrqzF4xwbhCjJ0Vk4G0Wp+N/cUh1i3D
	5HBWMCf7I285OlTl+2QyoQ1VMg/tPpQlnGdMKlATyEsGoKRjoK7FsHToimt9ld37CmOwf1eTbqY
	uGlvMPK0gzbduWNhJKPVKaX9G+EJdJ6BCGgWrfDSKWXn27riQ7PxUKGNzsKq4SWAsldjbk7p238
	DWZWzq1Pq/rvgdj90Ob+qqYfpjP/iY1R5A2itoCFFtKLq7oeiDnfAU3us9vtG32YaYD2ler2e1m
	GSEmXp+/4o0NFA41qF13euqG9W2qDU7thdf/xt8CFtqCj4ybU7Q==
X-Received: by 2002:a05:6122:468d:b0:5ec:4a13:8aae with SMTP id 71dfb90a1353d-5ec689801b4mr8447981e0c.17.1793854861885;
        Wed, 04 Nov 2026 21:01:01 -0800 (PST)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8d9d62bsm3305282e0c.8.2026.11.04.21.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:01:01 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	graf@amazon.com
Subject: [PATCH v5 3/6] liveupdate: luo: serialize sessions via per-session publish helper
Date: Thu,  5 Nov 2026 00:00:49 -0500
Message-ID: <20261105050053.3063001-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105050053.3063001-1-pasha.tatashin@soleen.com>
References: <20261105050053.3063001-1-pasha.tatashin@soleen.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With incremental kho_block publication in place, LUO sessions can be
published into sh->block_set individually as they are committed, rather
than rebuilding the entire session serialization chain during reboot.

Currently, luo_session_serialize() resets *sh->sessions_pa and
serializes all outgoing sessions from scratch in a single pass at reboot
time.

Introduce luo_session_publish_one() to append a session's
luo_session_ser entry via kho_block_set_it_append() and move the session
onto sh->published_list. Update luo_session_serialize() to freeze all
remaining unpublished sessions first (rolling back via
luo_session_unfreeze_one() on failure) and then publish them in a second
pass.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_session.c | 92 ++++++++++++++++++++++-----------
 1 file changed, 63 insertions(+), 29 deletions(-)

diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 6dea35911181..caf0e85081e8 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -103,20 +103,30 @@
 static DECLARE_RWSEM(luo_session_serialize_rwsem);
 /**
  * struct luo_session_header - Header struct for managing LUO sessions.
- * @count:       The number of sessions currently tracked in the @list.
+ * @count:       The number of sessions currently tracked in the header.
+ * @published_count: The number of outgoing sessions currently published in
+ *                   @block_set.
  * @list:        The head of the linked list of `struct luo_session` instances.
+ * @published_list:  The head of the linked list of published outgoing
+ *                   sessions, ordered identically to their entries in
+ *                   @block_set.
  * @rwsem:       A read-write semaphore providing synchronized access to the
  *               session list and other fields in this structure.
  * @block_set:   The set of serialization blocks.
+ * @it:          Iterator tracking the next slot in @block_set for outgoing
+ *               session serialization.
  * @sessions_pa: Points to the location of sessions_pa within struct luo_ser.
  * @active:      Set to true when first initialized. If previous kernel did not
  *               send session data, active stays false for incoming.
  */
 struct luo_session_header {
 	long count;
+	long published_count;
 	struct list_head list;
+	struct list_head published_list;
 	struct rw_semaphore rwsem;
 	struct kho_block_set block_set;
+	struct kho_block_set_it it;
 	u64 *sessions_pa;
 	bool active;
 };
@@ -134,12 +144,14 @@ struct luo_session_global {
 static struct luo_session_global luo_session_global = {
 	.incoming = {
 		.list = LIST_HEAD_INIT(luo_session_global.incoming.list),
+		.published_list = LIST_HEAD_INIT(luo_session_global.incoming.published_list),
 		.rwsem = __RWSEM_INITIALIZER(luo_session_global.incoming.rwsem),
 		.block_set = KHO_BLOCK_SET_INIT(luo_session_global.incoming.block_set,
 						sizeof(struct luo_session_ser)),
 	},
 	.outgoing = {
 		.list = LIST_HEAD_INIT(luo_session_global.outgoing.list),
+		.published_list = LIST_HEAD_INIT(luo_session_global.outgoing.published_list),
 		.rwsem = __RWSEM_INITIALIZER(luo_session_global.outgoing.rwsem),
 		.block_set = KHO_BLOCK_SET_INIT(luo_session_global.outgoing.block_set,
 						sizeof(struct luo_session_ser)),
@@ -186,6 +198,10 @@ static int luo_session_insert(struct luo_session_header *sh,
 		if (!strncmp(it->name, session->name, sizeof(it->name)))
 			return -EEXIST;
 	}
+	list_for_each_entry(it, &sh->published_list, list) {
+		if (!strncmp(it->name, session->name, sizeof(it->name)))
+			return -EEXIST;
+	}
 
 	/*
 	 * For outgoing we should make sure there is room in serialization array
@@ -203,6 +219,42 @@ static int luo_session_insert(struct luo_session_header *sh,
 	return 0;
 }
 
+static void luo_session_publish_one(struct luo_session *session)
+{
+	struct luo_session_header *sh = &luo_session_global.outgoing;
+	struct luo_session_ser entry = {};
+
+	lockdep_assert_held_write(&sh->rwsem);
+	lockdep_assert_held(&session->mutex);
+
+	if (!sh->active || !sh->sessions_pa)
+		return;
+
+	if (!sh->published_count)
+		kho_block_set_it_init(&sh->it, &sh->block_set);
+
+	strscpy(entry.name, session->name, sizeof(entry.name));
+	entry.file_set_ser.count = session->file_set.count;
+	entry.file_set_ser.files =
+		kho_block_set_head_pa(&session->file_set.block_set);
+
+	/* This should not fail normally as blocks were pre-allocated */
+	if (WARN_ON_ONCE(!kho_block_set_it_append(&sh->it, &entry)))
+		return;
+
+	if (!sh->published_count) {
+		/*
+		 * Ensure the first block header and entry are visible before
+		 * publishing sessions_pa to concurrent KHO readers.
+		 */
+		smp_store_release(sh->sessions_pa,
+				  kho_block_set_head_pa(&sh->block_set));
+	}
+
+	list_move_tail(&session->list, &sh->published_list);
+	sh->published_count++;
+}
+
 static void luo_session_remove(struct luo_session_header *sh,
 			       struct luo_session *session)
 {
@@ -636,50 +688,32 @@ int luo_session_deserialize(void)
 int luo_session_serialize(void)
 {
 	struct luo_session_header *sh = &luo_session_global.outgoing;
-	struct luo_session *session;
-	struct kho_block_set_it it;
+	struct luo_session *session, *tmp;
 	int err;
 
 	down_write(&luo_session_serialize_rwsem);
 	down_write(&sh->rwsem);
-	*sh->sessions_pa = 0;
-
-	kho_block_set_it_init(&it, &sh->block_set);
 
 	list_for_each_entry(session, &sh->list, list) {
-		struct luo_session_ser *ser = kho_block_set_it_reserve_entry(&it);
-
-		/* This should not fail normally as blocks were pre-allocated */
-		if (WARN_ON_ONCE(!ser)) {
-			err = -ENOSPC;
-			goto err_undo;
-		}
-
 		err = luo_session_freeze_one(session);
 		if (err) {
-			kho_block_set_it_prev(&it);
-			goto err_undo;
+			list_for_each_entry_continue_reverse(session, &sh->list, list)
+				luo_session_unfreeze_one(session);
+			goto err_unlock;
 		}
+	}
 
-		strscpy(ser->name, session->name, sizeof(ser->name));
-		ser->file_set_ser.count = session->file_set.count;
-		ser->file_set_ser.files =
-			kho_block_set_head_pa(&session->file_set.block_set);
+	list_for_each_entry_safe(session, tmp, &sh->list, list) {
+		mutex_lock(&session->mutex);
+		luo_session_publish_one(session);
+		mutex_unlock(&session->mutex);
 	}
 
-	if (sh->count > 0)
-		*sh->sessions_pa = kho_block_set_head_pa(&sh->block_set);
 	up_write(&sh->rwsem);
 
 	return 0;
 
-err_undo:
-	list_for_each_entry_continue_reverse(session, &sh->list, list) {
-		struct luo_session_ser *ser = kho_block_set_it_prev(&it);
-
-		luo_session_unfreeze_one(session);
-		memset(ser, 0, sizeof(*ser));
-	}
+err_unlock:
 	up_write(&sh->rwsem);
 	up_write(&luo_session_serialize_rwsem);
 
-- 
2.56.0.398.g882cbad275-goog

