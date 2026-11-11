Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356653;
	b=TmRAvKFqPOTqxVd8wz8Mdo6haZSZZtSZUvxDTwa+W/SoRDe4drUcs8I/wj+aGFNGz2s3
	 /ESeRri4+Cy5mzaWxYBFOI5Qr8+s34ngeodR3SNBPcULCqwZcFIVlWbTBNWXO+QwvJF8g
	 dcM/uQBK8i5XxhwyqBENqaVG7HJTgnxc566Qs3GOYPWCcbU+IIJ0a4SBOSrdOyoEnMZ2F
	 zzvy8iNyIMTb3dX5zwr7qwa2NRtTzhg3TonJBvJL2Tq+OXLUO/vVE9JaZdno8hWjW825N
	 kkVcO5NnePzcy9LG/+pJYKwKuNYqgBZqcfBX0GHWDVSCeb/VyBiHaTs+vnGCgWk03eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=XT74yUDszl/ziK0mi3MJ4vZ5wlDvYd0idF7CJlDoa8U=;
	b=osc8oqKFbXj7zENRxFTKCFtFDMYI8NxDK+2ZRgwJZ6goVJfz858YnGi2xeIh3YnUFeXF
	 ZOd8PC5kIs1W1covI6UXEHosaRMVee+7E7g8s4aXMXM4pZcSz9C+QMlnw4ZP5tkFFr24W
	 G4v+6Xy7LGiZsobRPiCUWAlkH3Ow9wBY32jk9o77OBAYLqtTLHhW9imTSjGSLO2/lgUKI
	 l34XgIjeCfPf+uyXKm/kw2cxngM8eeY/xFwCikXlwWy75LHoBSQAOhFEmHauECdJ12reI
	 PqgZcFViXYIj2nAgWyNRZNet5O50VIIDBvKty6r53xRMZOBTDBu4+5PZDyXYf3FpjRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iR3k3qyg;
	arc=none smtp.remote-ip=209.85.210.71
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8834B60A262F
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 00:24:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8834B60A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iR3k3qyg
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-847e2926d94so5227777a34.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 16:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794356652; x=1794961452; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XT74yUDszl/ziK0mi3MJ4vZ5wlDvYd0idF7CJlDoa8U=;
        b=iR3k3qygvb3aCIlCIrSKnYKmCnxQIS+qdVbCG/ptGdEvqAtkZagRhJbJIpQT7cfNph
         Npr+bDvbpQFEHA4A1kjUFAzZRLFIW8QnhcM/IogtLe22hW+kAOUhU8eC22immRSzbHo5
         BSarK/TnJPYhmBn2umUi/osFakN9sQA44AoViByT7+lEfp1JPrfne8zRpQAHX2uYRO7E
         exdLdpEQU6vHp6YcY4kZJIOKJqpMtR7TYQiQovC+aXKCiCsNU1rcwkWtOW4rWwpg3eer
         1GiPGJ8LkTOMU0ph/lBRftNBUij831P5sYdgInBz4TdDUgAGrkroii7knK0lBxV1071i
         mBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356652; x=1794961452;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XT74yUDszl/ziK0mi3MJ4vZ5wlDvYd0idF7CJlDoa8U=;
        b=ZnjhijdNAGT2gVFcD2Ij+KOJq13HdVRKfS3PRU4rcns0oPY71jLBzpSNMN/bM/B6E+
         oRt0hmtdqAKQqLCzobtjYiUZCs/TWrsNm+/V5OW/h29rYRKUOi4hcG3TUv+LKC1B+VHy
         wY9DckVY1YBy510npRJT5ygK1TmKtba3Ucb4t8+n6iNUohpuDkB7gtIewZB1n0Tp3YsB
         UYY0jzbR6EwkYtS8Gjzm9njtjFHjho1j6Wo28Xt2rJquZEHfCt5rdA/lt1hKQoCwmKoH
         tRsXcqXK6BAizV+AP8o9hwwQBMGDRoqNnSpI17RjoK9At8GUd8aZMykx7ynE6XfJniiU
         Z1PQ==
X-Forwarded-Encrypted: i=1; AL+hErEM7/ivaIDVJL+NrUAsBo6cykB8EqrsGTi524HrsJztelp9MUP1c1QoQild+Mo/JsuE40aFhYm6RHtjUhMG81Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Ugx9JhCMaIa2Sq/Fk5ay9WXkYwFo/P/HcujsyjPvuipXzOuhb
	MAiBgeLfuzVHNU1Y+gWzN1r9nf7qExl4o5//kZK4nVOQtpXOrnboZe6xwuNZss64vcrX18Cx8om
	SsbIYoMW18qrRPw==
X-Received: from ilbej4-n2.prod.google.com ([2002:a05:6e02:4e04:20b0:523:a008:3bb])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:2392:b0:4f5:c4b9:dc14 with SMTP id 5614622812f47-56b968d6d45mr569805b6e.13.1794356652192;
 Tue, 10 Nov 2026 16:24:12 -0800 (PST)
Date: Wed, 11 Nov 2026 00:23:42 +0000
In-Reply-To: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111002358.1842967-5-dmatlack@google.com>
Subject: [PATCH v4 04/19] liveupdate: Allow file handlers to mark retrieve
 failures as retryable
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Pasha Tatashin <pasha.tatashin@soleen.com>

Add a retryable output flag to struct liveupdate_file_op_args, which a
handler's .retrieve() can set on error to tell LUO that it hasn't
consumed the preserved state. LUO then lets userspace retry the
retrieve, and .finish() still releases the preserved state if the file
is never retrieved.

When luo_retrieve_file() invokes a handler's .retrieve() callback and it
returns an error, LUO currently records the error in
luo_file->retrieve_status and blocks any subsequent retrieve attempts.
This is necessary when the handler has already partially consumed or
freed the preserved KHO state.

However, with user arguments passed to .retrieve(), a handler may fail
early while validating caller-supplied parameters, such as a missing or
invalid argument, before touching any preserved KHO state. In such
cases, userspace should be able to fix the argument and retry
LIVEUPDATE_SESSION_RETRIEVE_FD.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 include/linux/liveupdate.h      | 11 ++++++++---
 include/uapi/linux/liveupdate.h |  8 +++++---
 kernel/liveupdate/luo_file.c    | 20 ++++++++++++++------
 3 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
index 7543f5d648d3..e4ad0bf78a5c 100644
--- a/include/linux/liveupdate.h
+++ b/include/linux/liveupdate.h
@@ -58,9 +58,13 @@ struct liveupdate_arg_spec {
  * @session:          The session this file belongs to.
  * @retrieve_status:  The retrieve status for the 'can_finish / finish'
  *                    operation. A value of 0 means the retrieve has not been
- *                    attempted, a positive value means the retrieve was
- *                    successful, and a negative value means the retrieve failed,
- *                    and the value is the error code of the call.
+ *                    attempted (or only failed with a retryable error), a
+ *                    positive value means the retrieve was successful, and a
+ *                    negative value means the retrieve permanently failed, and
+ *                    the value is the error code of the call.
+ * @retryable:        For .retrieve(): [OUT] Set to true by the callback on
+ *                    error when the preserved state has not been consumed and
+ *                    retrieval may be retried.
  * @file:             The file object. For retrieve: [OUT] The callback sets
  *                    this to the new file. For other ops: [IN] The caller sets
  *                    this to the file being operated on.
@@ -83,6 +87,7 @@ struct liveupdate_file_op_args {
 	struct liveupdate_file_handler *handler;
 	struct liveupdate_session *session;
 	int retrieve_status;
+	bool retryable;
 	struct file *file;
 	u64 serialized_data;
 	void *private_data;
diff --git a/include/uapi/linux/liveupdate.h b/include/uapi/linux/liveupdate.h
index 87e77c3bfd82..7420e2c5434b 100644
--- a/include/uapi/linux/liveupdate.h
+++ b/include/uapi/linux/liveupdate.h
@@ -174,9 +174,11 @@ struct liveupdate_session_preserve_fd {
  * associated with the token and populates the @fd field with a new file
  * descriptor referencing the restored resource in the current (new) kernel.
  * This operation must be performed *before* signaling completion via
- * %LIVEUPDATE_IOCTL_FINISH. If a retrieve of a token fails, subsequent
- * attempts to retrieve the token fail with the same error code. Failed
- * retrieves are not retried.
+ * %LIVEUPDATE_IOCTL_FINISH. If a retrieve of a token fails after consuming
+ * preserved state, subsequent attempts to retrieve the token fail with the
+ * same error code. A file handler may instead leave the token intact on errors
+ * that occur before it consumes the preserved state, e.g. an invalid @arg, so
+ * that the retrieve can be retried. See the documentation of the file handler.
  *
  * Retrieving a token that was already retrieved successfully returns a new file
  * descriptor for the same file. Passing a non-zero @arg in that case fails
diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index 1437630d435e..0c9a3b6921d1 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -152,9 +152,10 @@ static DEFINE_XARRAY(luo_preserved_files);
  * @retrieve_status: Status code indicating whether a user/kernel in the new kernel has
  *                 successfully called retrieve() on this file. This prevents
  *                 multiple retrieval attempts. A value of 0 means a retrieve()
- *                 has not been attempted, a positive value means the retrieve()
- *                 was successful, and a negative value means the retrieve()
- *                 failed, and the value is the error code of the call.
+ *                 has not been attempted (or only failed with a retryable
+ *                 error), a positive value means the retrieve() was successful,
+ *                 and a negative value means the retrieve() permanently failed,
+ *                 and the value is the error code of the call.
  * @mutex:         A mutex that protects the fields of this specific instance
  *                 (e.g., @retrieved, @file), ensuring that operations like
  *                 retrieving or finishing a file are atomic.
@@ -588,7 +589,9 @@ void luo_file_unfreeze(struct luo_file_set *file_set,
  * The operation is idempotent: if a file has already been successfully
  * retrieved, this function will simply return a pointer to the existing
  * 'struct file' and report success without re-executing the retrieve
- * operation. This is handled by checking the 'retrieved' flag under a lock.
+ * operation. If a previous retrieve failed permanently, it returns that
+ * saved error code; if a previous retrieve failed with a retryable error
+ * before consuming preserved state, the retrieve operation is re-attempted.
  *
  * File retrieval can happen in any order; it is not bound by the order of
  * preservation.
@@ -655,8 +658,13 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 	err = luo_file->fh->ops->retrieve(&args);
 	kfree(args.arg);
 	if (err) {
-		/* Keep the error code for later use. */
-		luo_file->retrieve_status = err;
+		/*
+		 * Keep the error code for later use unless the handler marked
+		 * the failure as retryable (e.g. invalid user argument before
+		 * preserved state was consumed).
+		 */
+		if (!args.retryable)
+			luo_file->retrieve_status = err;
 		return err;
 	}
 
-- 
2.56.0.542.g3ef89b7020-goog

