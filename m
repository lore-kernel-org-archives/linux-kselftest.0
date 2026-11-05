Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793854860;
	b=mBq0NH9WMyrVm7IwflqcCSpptecgON54mc4hxnO5RGgqXEVLdogRjZY4htt9VPz1cf2H
	 J/dX3sSB7lsqZACBGGbyWmLDvNIx4XW4l56WTJxvMlECwO709da2K7NW2QwzdKqjOcTYw
	 wrUs6IFajFqnWqa8N3JF84Gkx1UuEqTKHWkN1SRfR449V61QaWRcNkS/GAVm8pMa/gWNu
	 vDUsArjVBMduDZB5rt/5gGdhElaAZ6i9mEJr7KS2DwKwvX5PAmRkO3qG4I7D3CeRg6ize
	 JP5DCABv+leTAxRmANioOOf8qh2pgdvY/BCCDAQ1qI0/SD7ZhCbUpoKDTte5mrnKyGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793854860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=3dC/2UP23mv3BH3OYo6bEH5lmwGOxjF2IHkUty9s/lM=;
	b=37kaWiN4mmtViSBAXnokFavPUOoYeH8AiCER4oPkPiQ5Db3YQeuYfi58B+fa5lg/zSwy
	 BF0A0xdkikesMpIrnSYlr7ZCUm3ogaYo0jCItAM5bqWiBwu20bZt7qgzAbaO27+yMmj+l
	 HpxZTz8KblRHCftu6SY7ZX77W+3jG9yloLF2NBL8fcnt/Te0IIYEROHVZC6Gx8WttWXSR
	 1/Iw8Vg1PoAaaup2gs4ut6QIeMGS+b0uU5Yd/sgnTolU1JsDOV6xRExm91C7fWMKu4mX6
	 A+FPVgvopg01yo+kXbaBGGYnJZSesrs0Hy7gYj7KUOnHQUpmyxAs7+1fJJR+W+bWkJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b="W62GKsb/";
	arc=none smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B65606A330
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 05:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7B65606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=W62GKsb/
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eaabf28c06so1087211e0c.2
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 21:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793854859; x=1794459659; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3dC/2UP23mv3BH3OYo6bEH5lmwGOxjF2IHkUty9s/lM=;
        b=W62GKsb/GMKCyR4zqve9dHHGSUSbU1QD07i6Is+HiOxkDaR1F018bLnzpsJtRDwDyQ
         hk6syY3YyAHdz2phEOZWJI43eVM4BANKK42Gjc7gL5ye0TO0ZOX0d94idb3lpCRq0BpF
         a4Opib2TZqWuRpGmO0fr2R7eJ+1jz9wiTlCHcfqUyyweg9N30TjtYvDBDetrJX81JW9p
         gwVSxyAle3uS2TWvvjyusJMNyTbn4h4mAgLoPB7PVn7Sy9eKjeA+pkCwGACFFl3Xnm19
         F546so8q9NRxWl1/LvRuHk/YuZGuj4mCNNGC5P0JMfH053iOP3bJTzMV5uvaCZaQ/xGP
         jJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793854859; x=1794459659;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3dC/2UP23mv3BH3OYo6bEH5lmwGOxjF2IHkUty9s/lM=;
        b=XXiQZvFltRdRcZC2fz9OsvyScaV9MoyZfIKqFlnRTTbjxc0ZRU6o6cPJ9yLFLOpvRb
         PUncocvS5tPE5UV0XngHQTf+ZMMJQK4wFkyKtMqJUaVgCnH+UbXI6yklzCMa6Hpl2kyS
         GfpJEeu9Py/wvE7v9byrCaQFECNJuXgV4pu4kvNZpvBV1EXQCYCDTsVEW3//logv4L6y
         cWdHR9KMUhbNKYhEH0SRIkDjN8OWU14ovohIfYIwlIQIaBXR2ySPC0dftEKfPC/S1fV2
         czPL52mDXgdXofZB3u9qRyYJFAaiSlYUSfeuqDzE3LDAS3t5FNLjQ73vX8TLQlzhyxG+
         1A0A==
X-Gm-Message-State: APuU4Z95rCWPUbNoqqaWQh66S0BdbkMvmNzU8JxUCuVJi6nnKw/SShHO
	yp/3Wk2xGOyr2fDsdsW6U3wDUasRO+ayRV50iHmXJGCOAw60XFe/GG3NDXD60dJ09qmorYrHwRQ
	uMaUI
X-Gm-Gg: AYBFou2lsEqaJYB63qP4FfYLIzePK7Dl0HZnxK0PyTMg4y1yzBBaYvN3KJQzYNzYfhK
	wGSqVBOq1ldlSi3YcYuaSf9rBceRuRRMpM3w3iXB66trUzdrvJfoP9/inYaY4pG+eOZegr1Fikl
	pQgumE1GvvBGZXMXF39OBNisWa0k8JPh4V1GxwKq2p55Vk+1yrLOY/2I/FN1sZl2DbtsH5M367p
	DVsgPHd907CvMQhMEPj4dMksVze/DVZaXmdxBECw+7BtFDbAllP16YGf3Z7pMUtJ9/b3L/lrCzU
	VYtGNzy8CuifmvIzKyTR0ebwlt5nVHJjnHCc9g8rBGeNjcorwa3iSKY6ihTRlBsQ9HhEIZecfLI
	qcj72Q4cUBwvgugUYIX6ms+wTmIFoyyHHIm7VrYvGEtfn3uSo38C14qlrlKisQ4IvOG0rDSPH3H
	aZSHTQD6VDO8dcRrZSVxI7UjU84e8VodjuzBgvxkluV0WJG8jlo83rut/Pw7EzOzTUnCEEnX/ds
	GQsyM6p9HcbkHOXuQ8Sy06j7nHQHFGiex6WDxknsPi9VbHJLPyZasKTIjHRC3YtELQRDucPnHWs
	AG/dAgixTQo2pQFlBUoZ0v0HuLK6VnpkMAt7iYMwJ1+oZ8BW9R8DMDsRqwkoCpxXG4NKC+1q0Yb
	4bQPbXzSyFnexxOxIiScNig8XQOM5z9by0tKHULSSQ41427ownQ==
X-Received: by 2002:a05:6122:e443:b0:5ea:e197:702e with SMTP id 71dfb90a1353d-5ec6899db99mr8875283e0c.20.1793854858748;
        Wed, 04 Nov 2026 21:00:58 -0800 (PST)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8d9d62bsm3305282e0c.8.2026.11.04.21.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 21:00:58 -0800 (PST)
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
Subject: [PATCH v5 1/6] liveupdate: Move file_set_ser handling to luo_session_serialize()
Date: Thu,  5 Nov 2026 00:00:47 -0500
Message-ID: <20261105050053.3063001-2-pasha.tatashin@soleen.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In preparation for allowing userspace to freeze a session explicitly
before kexec reboot, luo_file_freeze() and luo_file_unfreeze() need to
be called on session->file_set before any struct luo_session_ser entry
is reserved in luo_session_serialize().

Currently, struct luo_session_ser is populated and cleared across two
layers: luo_session_serialize() writes and clears ser->name, while
luo_file_freeze() and luo_file_unfreeze() write and clear
ser->file_set_ser.

Drop the struct luo_file_set_ser pointer parameter from
luo_file_freeze() and luo_file_unfreeze() (and struct luo_session_ser
from luo_session_freeze_one() and luo_session_unfreeze_one()), and
populate and clear all fields of struct luo_session_ser in
luo_session_serialize().

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_file.c     | 24 ++++++++----------------
 kernel/liveupdate/luo_internal.h |  6 ++----
 kernel/liveupdate/luo_session.c  | 19 ++++++++++---------
 3 files changed, 20 insertions(+), 29 deletions(-)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index a39992da504f..988eb313a135 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -440,8 +440,7 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
 
 /**
  * luo_file_freeze - Freezes all preserved files and serializes their metadata.
- * @file_set:     The file_set whose files are to be frozen.
- * @file_set_ser: Where to put the serialized file_set.
+ * @file_set: The file_set whose files are to be frozen.
  *
  * This function is called from the reboot() syscall path, just before the
  * kernel transitions to the new image via kexec. Its purpose is to perform the
@@ -457,8 +456,8 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
  *
  * 2. Serializes Metadata: After a successful freeze, it copies the final file
  *    metadata—the handler's compatible string, the user token, and the final
- *    private data handle—into the pre-allocated contiguous memory buffer
- *    (file_set->files) that will be handed over to the next kernel via KHO.
+ *    private data handle—into the pre-allocated serialization blocks
+ *    (file_set->block_set) that will be handed over to the next kernel via KHO.
  *
  * Error Handling (Rollback):
  * This function is atomic. If any handler's .freeze() operation fails, the
@@ -471,8 +470,7 @@ static void __luo_file_unfreeze(struct luo_file_set *file_set,
  * Context: Called only from the liveupdate_reboot() path.
  * Return: 0 on success, or a negative errno on failure.
  */
-int luo_file_freeze(struct luo_file_set *file_set,
-		    struct luo_file_set_ser *file_set_ser)
+int luo_file_freeze(struct luo_file_set *file_set)
 {
 	struct luo_file *luo_file;
 	struct kho_block_set_it it;
@@ -506,9 +504,6 @@ int luo_file_freeze(struct luo_file_set *file_set,
 		file_ser->token = luo_file->token;
 	}
 
-	file_set_ser->count = file_set->count;
-	file_set_ser->files = kho_block_set_head_pa(&file_set->block_set);
-
 	return 0;
 
 err_unfreeze:
@@ -519,28 +514,25 @@ int luo_file_freeze(struct luo_file_set *file_set,
 
 /**
  * luo_file_unfreeze - Unfreezes all files in a file_set and clear serialization
- * @file_set:     The file_set whose files are to be unfrozen.
- * @file_set_ser: Serialized file_set.
+ * @file_set: The file_set whose files are to be unfrozen.
  *
  * This function rolls back the state of all files in a file_set after the
  * freeze phase has begun but must be aborted. It is the counterpart to
  * luo_file_freeze().
  *
  * It invokes the __luo_file_unfreeze() helper with a NULL argument, which
- * signals the helper to iterate through all files in the file_set and call
- * their respective .unfreeze() handler callbacks.
+ * signals the helper to iterate through all files in the file_set, call their
+ * respective .unfreeze() handler callbacks, and clear the serialized blocks.
  *
  * Context: This is called when the live update is aborted during
  *          the reboot() syscall, after luo_file_freeze() has been called.
  */
-void luo_file_unfreeze(struct luo_file_set *file_set,
-		       struct luo_file_set_ser *file_set_ser)
+void luo_file_unfreeze(struct luo_file_set *file_set)
 {
 	if (!file_set->count)
 		return;
 
 	__luo_file_unfreeze(file_set, NULL);
-	memset(file_set_ser, 0, sizeof(*file_set_ser));
 }
 
 /**
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index dac6644bfb18..01a172cd9d7a 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -103,10 +103,8 @@ int luo_session_deserialize(void);
 
 int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd);
 void luo_file_unpreserve_files(struct luo_file_set *file_set);
-int luo_file_freeze(struct luo_file_set *file_set,
-		    struct luo_file_set_ser *file_set_ser);
-void luo_file_unfreeze(struct luo_file_set *file_set,
-		       struct luo_file_set_ser *file_set_ser);
+int luo_file_freeze(struct luo_file_set *file_set);
+void luo_file_unfreeze(struct luo_file_set *file_set);
 int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 		      struct file **filep);
 int luo_file_finish(struct luo_file_set *file_set);
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 74bc66929f4b..6dea35911181 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -219,18 +219,16 @@ static int luo_session_finish_one(struct luo_session *session)
 	return luo_file_finish(&session->file_set);
 }
 
-static void luo_session_unfreeze_one(struct luo_session *session,
-				     struct luo_session_ser *ser)
+static void luo_session_unfreeze_one(struct luo_session *session)
 {
 	guard(mutex)(&session->mutex);
-	luo_file_unfreeze(&session->file_set, &ser->file_set_ser);
+	luo_file_unfreeze(&session->file_set);
 }
 
-static int luo_session_freeze_one(struct luo_session *session,
-				  struct luo_session_ser *ser)
+static int luo_session_freeze_one(struct luo_session *session)
 {
 	guard(mutex)(&session->mutex);
-	return luo_file_freeze(&session->file_set, &ser->file_set_ser);
+	return luo_file_freeze(&session->file_set);
 }
 
 static int luo_session_release(struct inode *inodep, struct file *filep)
@@ -657,13 +655,16 @@ int luo_session_serialize(void)
 			goto err_undo;
 		}
 
-		err = luo_session_freeze_one(session, ser);
+		err = luo_session_freeze_one(session);
 		if (err) {
 			kho_block_set_it_prev(&it);
 			goto err_undo;
 		}
 
 		strscpy(ser->name, session->name, sizeof(ser->name));
+		ser->file_set_ser.count = session->file_set.count;
+		ser->file_set_ser.files =
+			kho_block_set_head_pa(&session->file_set.block_set);
 	}
 
 	if (sh->count > 0)
@@ -676,8 +677,8 @@ int luo_session_serialize(void)
 	list_for_each_entry_continue_reverse(session, &sh->list, list) {
 		struct luo_session_ser *ser = kho_block_set_it_prev(&it);
 
-		luo_session_unfreeze_one(session, ser);
-		memset(ser->name, 0, sizeof(ser->name));
+		luo_session_unfreeze_one(session);
+		memset(ser, 0, sizeof(*ser));
 	}
 	up_write(&sh->rwsem);
 	up_write(&luo_session_serialize_rwsem);
-- 
2.56.0.398.g882cbad275-goog

