Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795037332;
	b=3QvVK1XcFcifZWqr+Mn1UtrWr3NEvyBJ7/jlRj42JdlYZfZyxoeWy2irM+D01rG0J0Xw
	 9MzZetMXGxXaGGOyoXpSwip8pNbMQ5tmYhn/9Wpr6ySgZySJulOGrHmAEF6v/inw8tUAR
	 1Cf9zhKpqBeiAil/wSnMuOSi2ixOOx1+fiCiQxo+Mwj8910JRAf8ZtCzC1ZmRVmFHD1iF
	 MBSPB8lAgTCIkzY9Y4inFArWby4kDyzOvaA1J2FuKMtqq/+tzWQRxYx8ArSYXbTbVCEwR
	 PIZMh4ijeL3kJ4CkSWjh+yjw3EzvUQtIO1XgDfC0Tb7Djw6jYB8RESD/VLlSbpRwNnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795037332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ePURxFbZRmuaZzBcCX+c1ARIFExZY6rS7Q59wKvUVmQ=;
	b=J7tEHUtgh1Pw3hqQmvB4xBCd9pLO9xnx9cqM9m/dyhZa/be0aWq2HjzZ27oHZl7mJ18h
	 IC31gUHegAehR5AmWKK3QfUPiscUzJagZuzXFfd9MIhTcCBJbjHj0naS6z8PPGf90OyKa
	 GKdG64HYXPj+ReCdgcnzu2zjW5V4bFDCY9g2bXxaHv2yWPxUnd1Q1Twde8IPeaHvrZPUa
	 46ZDipD1zRfv5YOucmVLEYMThwSMfLiNI+QuEBA+gKLUA8wEJ4fDE5XalPKH3NUg7PUns
	 e2yjpOeNKt4Jry/f1wI/7wdgiAwhMyo7XMIy0OfZnLSxzcJACze835amFoDJhg1z0wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=iooawujv;
	arc=none smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB2760A2620
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 21:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FB2760A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=iooawujv
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7d65662077cso1013598137.3
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 13:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1795037331; x=1795642131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ePURxFbZRmuaZzBcCX+c1ARIFExZY6rS7Q59wKvUVmQ=;
        b=iooawujvjzstKoxIo3QMQSY9W2lmr3chcPXIxTqwQ4UzlVojE08xCsqGnt6sl5g1Sc
         xxz0MPeQnsOsxQfcNuJ1J9GeM6zm05LcsBKsu1Z6CZtlSVvvIZIlIM8UOcQvkGRLDDBd
         sjq8dwRs3izuHH0bVA9yN+8byYR1N1WpzDQ96sXdG9fWc3qYxYH1JROMH/w0d9u99hEw
         k1UShZ78J0sQoBBGoSbrnUPBk1SsLobLotR5KKngGDUcX0Ee8yZtU2Svq1vpsiCaZ9XM
         J0mmMo3BKFTxUtiMdU7kdZ462vJofiZErqW5Rzm7ncmZpjQwoWVuwCJd6vLdxpn/mfeB
         sQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795037331; x=1795642131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ePURxFbZRmuaZzBcCX+c1ARIFExZY6rS7Q59wKvUVmQ=;
        b=gVtlpaKWxdQfuv3rWzRuIpVP/lju/VECwUgn9zUNquVE3tCSToDdOny8MSj4sX7vYU
         /RSeHozoLghBuHhETwZcT1wlBZ/1YEbUEkEZcWSiFxL2w3ZGJha4sGPqL9Zx5mnoQDiG
         ee6r9Tp3DGZRXY8hNU2BzhRp+nu/Me3oKBKw9IsDilRuI/3U9ija/Ff7KDOFHJ0TQIzg
         DZrmlozNF1TOphQKbwlqQMS3sg2eV7YbbxXqosZk2nQR/9C9/BewZhQjSx6eNZoY8ZSv
         QR6N2GASsaoX229jcJY3wLxq8yq+I5ldfuj2GxqELSGQysQuOkEx2+ymqjJEL/DgUMEP
         I6EQ==
X-Gm-Message-State: APuU4Z/kKaIA8mrmZuwHBxJ/VjpoGozbhscb3JnW9rtNDVZ6sayuiWpI
	74jSbn7nBC6PuC+MdWxGCjZ8EhhnNGn6V2MCfx0Fkh+aU95M6WxB+JUAjIdEkkx4mraGiveFM8q
	e6iVF
X-Gm-Gg: AYBFou1Skyi98oHHp4T+MDuHh25su+mNS3wQa7QqCqbiWk/UlXPouRM2X75iVlYnmSQ
	tFauAiGaZXyaqcj8hctweMZdR4/nmZ92bw9ClZ1dOtU18muY0ksukj0xe/47u8D3a3NSSt2MTp4
	D3/guV2F7sCdnC57/jqs6uJuAqjOmG8mRSZorx6Lb16B2UwS+TLatBSEslrKfTQY+fv+PfYUopo
	lnIMztA42HEtanH87JMuCtAsxRcPKuVuY6O5hqujiZsXSh2STgdrsD48hZxW5/O4lfeKmwUBVwW
	UkNMbSLQcb4PVFPbHFngGsFbXuiI50SdJ9Bs3QnQLOXsrhpx2fhS+GsFdec+kTjWrXjWSE4vKoG
	TgfgaM549VpXfsXxm47C3FrCy09qez5gu6iW+CTvUzaeRnGJfff+w1IA1PYxAExKnsO4KXuOiiR
	Ft19vDVhz5R8uwl93tiFXE/zWHJvCe61xHYuHu3EJ0zwRE9BtqQ2Wlc2GP6mM5wFC+gPZxlBlgl
	LmXG5JkFFDzSKRGgIkN9xScARMJmx2txZu6aZfOY1RoEjKzEWgl2hWvDD2Xd0w+ScmaobCygDxR
	/VHj+W/3sgW5omD+En7MOdSQosqr+V/Evxm9TMMnf7pzWQDvmS+36JBNppCpxn+/CVfSxZSAp3q
	QjFWphOHsKm0lEbUOJ0qWrJ1rgA9Fopz7H2XIa+B5xpg7He14NWVMnHH83W9bY51BhN7gBDeO0A
	==
X-Received: by 2002:a05:6102:688d:b0:7cc:2fd1:7122 with SMTP id ada2fe7eead31-7d6ba3ddfe6mr1764777137.18.1795037331333;
        Wed, 18 Nov 2026 13:28:51 -0800 (PST)
Received: from soleen.c.googlers.com.com (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6b9185bc3sm2724635137.5.2026.11.18.13.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:28:50 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	linux-api@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	graf@amazon.com
Subject: [PATCH v6 3/7] liveupdate: luo_session: support incremental session serialization
Date: Wed, 18 Nov 2026 16:28:38 -0500
Message-ID: <20261118212845.2855249-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
In-Reply-To: <20261118212845.2855249-1-pasha.tatashin@soleen.com>
References: <20261118212845.2855249-1-pasha.tatashin@soleen.com>
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

In preparation for committing frozen sessions ahead of reboot, allow
sessions to be serialized into sh->block_set individually. Introduce
luo_session_serialize_one() to append a single session to sh->block_set
and mark it serialized. Update luo_session_serialize() to freeze all
remaining unserialized sessions first, rolling back on failure, and
then serialize each one via luo_session_serialize_one().

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_internal.h |  3 ++
 kernel/liveupdate/luo_session.c  | 71 ++++++++++++++++++++------------
 2 files changed, 47 insertions(+), 27 deletions(-)

diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index 01a172cd9d7a..77dac2742877 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -64,6 +64,8 @@ struct luo_file_set {
  *              previous kernel) sessions.
  * @retrieved:  A boolean flag indicating whether this session has been
  *              retrieved by a consumer in the new kernel.
+ * @serialized: A boolean flag indicating whether this outgoing session has
+ *              been serialized into KHO.
  * @file_set:   A set of files that belong to this session.
  * @mutex:      protects fields in the luo_session.
  */
@@ -71,6 +73,7 @@ struct luo_session {
 	char name[LIVEUPDATE_SESSION_NAME_LENGTH];
 	struct list_head list;
 	bool retrieved;
+	bool serialized;
 	struct luo_file_set file_set;
 	struct mutex mutex;
 };
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 6dea35911181..56d7f76c0282 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -108,6 +108,8 @@ static DECLARE_RWSEM(luo_session_serialize_rwsem);
  * @rwsem:       A read-write semaphore providing synchronized access to the
  *               session list and other fields in this structure.
  * @block_set:   The set of serialization blocks.
+ * @it:          Iterator tracking the next slot in @block_set for outgoing
+ *               session serialization.
  * @sessions_pa: Points to the location of sessions_pa within struct luo_ser.
  * @active:      Set to true when first initialized. If previous kernel did not
  *               send session data, active stays false for incoming.
@@ -117,6 +119,7 @@ struct luo_session_header {
 	struct list_head list;
 	struct rw_semaphore rwsem;
 	struct kho_block_set block_set;
+	struct kho_block_set_it it;
 	u64 *sessions_pa;
 	bool active;
 };
@@ -203,6 +206,33 @@ static int luo_session_insert(struct luo_session_header *sh,
 	return 0;
 }
 
+static void luo_session_serialize_one(struct luo_session *session)
+{
+	struct luo_session_header *sh = &luo_session_global.outgoing;
+	struct luo_session_ser *ser;
+
+	lockdep_assert_held_write(&sh->rwsem);
+	lockdep_assert_held(&session->mutex);
+
+	if (!*sh->sessions_pa)
+		kho_block_set_it_init(&sh->it, &sh->block_set);
+
+	/* This should not fail normally as blocks were pre-allocated */
+	ser = kho_block_set_it_reserve_entry(&sh->it);
+	if (WARN_ON_ONCE(!ser))
+		return;
+
+	strscpy(ser->name, session->name, sizeof(ser->name));
+	ser->file_set_ser.count = session->file_set.count;
+	ser->file_set_ser.files =
+		kho_block_set_head_pa(&session->file_set.block_set);
+
+	if (!*sh->sessions_pa)
+		*sh->sessions_pa = kho_block_set_head_pa(&sh->block_set);
+
+	session->serialized = true;
+}
+
 static void luo_session_remove(struct luo_session_header *sh,
 			       struct luo_session *session)
 {
@@ -637,48 +667,35 @@ int luo_session_serialize(void)
 {
 	struct luo_session_header *sh = &luo_session_global.outgoing;
 	struct luo_session *session;
-	struct kho_block_set_it it;
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
+		if (session->serialized)
+			continue;
 		err = luo_session_freeze_one(session);
-		if (err) {
-			kho_block_set_it_prev(&it);
-			goto err_undo;
-		}
+		if (err)
+			goto err_unfreeze;
+	}
 
-		strscpy(ser->name, session->name, sizeof(ser->name));
-		ser->file_set_ser.count = session->file_set.count;
-		ser->file_set_ser.files =
-			kho_block_set_head_pa(&session->file_set.block_set);
+	list_for_each_entry(session, &sh->list, list) {
+		if (session->serialized)
+			continue;
+		mutex_lock(&session->mutex);
+		luo_session_serialize_one(session);
+		mutex_unlock(&session->mutex);
 	}
 
-	if (sh->count > 0)
-		*sh->sessions_pa = kho_block_set_head_pa(&sh->block_set);
 	up_write(&sh->rwsem);
 
 	return 0;
 
-err_undo:
+err_unfreeze:
 	list_for_each_entry_continue_reverse(session, &sh->list, list) {
-		struct luo_session_ser *ser = kho_block_set_it_prev(&it);
-
-		luo_session_unfreeze_one(session);
-		memset(ser, 0, sizeof(*ser));
+		if (!session->serialized)
+			luo_session_unfreeze_one(session);
 	}
 	up_write(&sh->rwsem);
 	up_write(&luo_session_serialize_rwsem);
-- 
2.56.1.708.g77570a6a1d-goog

