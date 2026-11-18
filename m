Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795037331;
	b=YOM/VpToCLf7C4gl+LJMTPBRT8LwYEbE2jcKSRBc9xFMWHy4EMH3oswt188T5e6HoLcE
	 I9VwIyzFt/arqNfcpnv1rco9oDPeBOaHSfeexcd1Q3AKEtGqgY4DxmVTuKWLKyrirY4vB
	 we4ImLpm/jFPOK9SkZNp3VtYAhnaH7KkvSYFWQ2VjsOqlGgK5aQtn9IloYUJe5p2hxJ3f
	 otNs6wiAOUkSInfq+IOf58PVKwo3Ir7XfJYZzD8R9zjwOTl/4L5MxprQ8XFcRLJoNhJRM
	 RrOnpCG1lzWbd+HLDxB/9rbjR1U8enCIFbOOVYt5ZoN7FdBJ8G4OT2dfsKTbbMS72NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795037331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=rcOKrKC5VH2EJYd32jje86IEEuy7ivHNpMjvoLy4Pag=;
	b=AWVrKyQJ+gpKhaXxDRnDr2xyq8IrkStPhvTbw+KozYZnHPuUlqKDz/TgfMRC6HAmDsKD
	 SMTOIRP5JmRuU88u/Mz7D+pCW87E0AakNs9BMfXXv40LeLS1k9aTjdtbfT7xetbkchtFb
	 Sog3ZLDC/LZq8A3E0g5K+mYIvLHGlQ8xiZDnYuU3W0mH9eLjtWTJ935KX/AY9iUk5Dpcp
	 HzXWEDXjUhLUJGGtyFZgkDEQwyDDhBp7AHMRB9qCaMcT1oiMxKlT7NYIIiikB9hEUNpMs
	 pn6p+4eJCUBjyCXOR1Q2h45hvWRrt4pWYrk9Vk+9okISiOU4eJa9qbNsA5Kni/ayiog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=dKq2+911;
	arc=none smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8F760A2601
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 21:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F8F760A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=dKq2+911
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7cc1cf48a39so566855137.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 13:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1795037330; x=1795642130; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rcOKrKC5VH2EJYd32jje86IEEuy7ivHNpMjvoLy4Pag=;
        b=dKq2+911V6f3mCCoT91q/B9EbEcgcYC0SU7+8anT0+yvtrnieQqhFUpIn0r5IIRTs+
         taFjPr07zKynB4iZMS//Evj2vbQH+Gk8TKX79XLD7/2Gy2i4L+bSwwZ+abqAQyxWLXsa
         rkPbQxZdq7LvVQK+iLNWnkQa5K8UZeEdioFzPaEZ8d1ehXcx40qoovh60BbUhGHO7Gog
         Zk/TNqn1xrtbFs/066P/9WgrQtxlV0WqdS7gtIhvsogGvcJyYchXWciHjPYTP4ncgl4y
         yTogek1Hjokaqs0C9ffnH6OWITg9H6AKkJDuBM5A81RWG/YPfP+MDPbn5fz7OgKPJtZp
         3Kkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795037330; x=1795642130;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcOKrKC5VH2EJYd32jje86IEEuy7ivHNpMjvoLy4Pag=;
        b=EJ4ZFpWk7Zb0LzouVkuwNTfy3FgK5m0aylEO2vPHrbeHPjufaMl+EOk/m+Mhvs39z+
         GmVZXRcGoFQJi/IS9WTKjsA6lC6nvXKJh43vPvP+fMsiMy9GE4eG/pWSSW150sAXxgem
         lWDWADkHEVsVrkS8lD9+lAFtIBnKJknEIAYJYv3olD/RinjjD6NivglXJvOXpJoi2Afh
         CZvfhTcTNawRnQK+WQP0HID7q6YbJr9bcx8PHgOZsbX0SJ0qGX/VVMENFtMULPL0F6Yz
         8NOEwprCGqqISZPaIN6w1vhO7+rHvCJVBYerp7y6YF2akdoNOPUl2wIb2gXdIX8UDHKB
         EraQ==
X-Gm-Message-State: APuU4Z9P+h88LSHX2YToT6OluTps8LQrFLzjIx4942fq2/YTA7zGYiVx
	ucRIkn/l15FcT6Ut1EL17nzqwFBHdda8VOosrLEHRw1LnCnd5qpgiB/juF8HZxhc9cbDMSvVgHr
	vuSmk
X-Gm-Gg: AYBFou2TzewAOEkXPeJ9F+xAgAzXJPZoVa+cRCwHob0E3QBZA7DTN2grtkM329HaP+r
	C/vWLRHJGQwk0OHsCE5xJa32lgoxGmpm5NhzuMTX9tqrb0Xfzrtlvc7Bqb5zt3Gy5l1+Rk58NLL
	ewJHOfvk7Q+42q9ubitSdcj6pHIEoo+Mw1kx9HTKwtbOIfnwSMADVkZw0t8dqmC+BcyTvvaR4PO
	znxdJEsqlr6amj3Lvbne3oGa0H9bieD8LwZxN1cBs5PJxVFM8KRHGJOepRch8Tydyq8nY1EIB/Q
	WcRrqCQ9KJ0Aa8u2bSMvCQd3Q2De5aAEsS9Ob9q2VDAPR8zNJNqPhcOUH1p6ADfGP35OlZyufwj
	Pbi86RMOKuStU6Q0Mf1p8+V7i0OEAtsYQ9Z4iET0NHMUF9z/bDru/f94Vh+4EWUoVfLYIL35+Fg
	L8fmRb9e5tDcq/xekNi5bA4gfCr8Ul5FjTdrCF0DLTV1PMM8kj0RIYjIuoU3EqPfB9qbqJsYGV3
	kNmYAtP+lD1zxrsky9LWOAyTHX68FUV0SFVSQGMAArJX2QUWDoR9SMZlOAgGar7KNKEol2nvnpF
	oCIQE9PVOK7RhnsiYOF3Ixbny/dHSHHQPEwnCbklE29CHmy9YXfMq/oSGqM5gDg+fsHnnekFjqs
	h+kbviebbl0G5gzowG0i98oUCBHA1KdhqPLpF9M+Wj6BuPEeAYcEn
X-Received: by 2002:a05:6102:2d03:b0:7a7:196a:84ea with SMTP id ada2fe7eead31-7d6ba480612mr1670329137.34.1795037329535;
        Wed, 18 Nov 2026 13:28:49 -0800 (PST)
Received: from soleen.c.googlers.com.com (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6b9185bc3sm2724635137.5.2026.11.18.13.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:28:49 -0800 (PST)
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
Subject: [PATCH v6 1/7] liveupdate: Move file_set_ser handling to luo_session_serialize()
Date: Wed, 18 Nov 2026 16:28:36 -0500
Message-ID: <20261118212845.2855249-2-pasha.tatashin@soleen.com>
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

base-commit: 079c138d2b6870bb658b6e638077264aefc03833
-- 
2.56.1.708.g77570a6a1d-goog

