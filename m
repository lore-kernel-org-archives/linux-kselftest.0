Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477176;
	b=hQKdhjO+N7JVJhZ0x68X5RK26R7sFCfRC4R3Ba/C1mcWcGRQiW3Od4+N/DvsaIQU+VUo
	 0Znqwm/ZdSG5bxplz5oURA4DRcXvDSRzG+3Y2KY1xhkIDgW3kDUcqdx9GYCHoXNgYGSe/
	 84U7nYrZhk2z2Ie+xNj3+yJl/IUMtjoM7YptZZysT/O7HgslO2rVLNNDcBiv7SW/8w9xc
	 VyGJu+TxK2VK6hByWFrurCvA/V67DuApqWmuu5O/hbZa43jHqig2beJ7TeBXr6lWKptaR
	 SOi6mcBV7TfQvoYAzcQJZ/89kpuH2RBRysQctMxdGw98QoTy0L4KW3hm/NccMC/DdmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=1AwhDL8d9Iaq27a1JowEPw9jFEWG4nyWIagv2/If4Hg=;
	b=UeQNg19OnWNFN7hEs3GN/paRC63awA5ocUmgP+8GA4CJ6XwZjU81JVavaYENDI4TF6X0
	 shPfEoULHfgkf9VYSGYn+S3Na1MkvXyebgv95k2TuL9ko7Uqe5aDmzkrmIoOXW8H/wchW
	 wjZetrupYo2bIYwOfKWeqd60UZX0btKy0t4aT10ID49a+G7nhTv2u6d47pLuLKrnSE+9w
	 jbMpT5/FjHRxm1SNQ9xh/Z1IbEDmVZ/3pAYy1wAcqjHcYd4ws1Vv3Xbw+TWd+4QZf2zvD
	 3CD5UiXOIT5hO53Kev5s1P9TJjUdCv4OfXqgTVv2/89xT8Uqcw20ZgXEan2KSb55LrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T0JBur5E;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EC8606A68D
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 23:39:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68EC8606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T0JBur5E
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-540537f959fso4282837b6e.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 15:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795477174; x=1796081974; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1AwhDL8d9Iaq27a1JowEPw9jFEWG4nyWIagv2/If4Hg=;
        b=T0JBur5Ekd2RxdTlJS0jBhtDNMp0CLSZ5aUQLn2RAqrCgs30v6k0lnT0Dowrrz8Zro
         tbB1tqTp5kzJ839wtnw/gZBbWi0L9v0YfyuU62WwoPWnphItK7FeJJ8pzRPYLgB0fcTG
         XNmrvev2FleOekcZGA/uaB1JjS0cUMGpVRc7kvXfVrt4jkBtSJ4wIT1jy5wwoCsV/NwR
         F9EUX90c/nh9TOmwDL612s2plIhIWBayhOoZz8X41A9e8lFubXiz82K20O130pXl2gzV
         fzcC/crifadg4lyPkV1mK0lOBnNqzDkzTiTqTifgdwq0h7fhQyFkaD8rdvsf4CJe89NM
         OdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477174; x=1796081974;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1AwhDL8d9Iaq27a1JowEPw9jFEWG4nyWIagv2/If4Hg=;
        b=S18wktNZ8trVvT1POcpEwc8adfvK0Vuno3EqIGK+Anf2ZWm2iX30NspEkauFudcKau
         OeRH2YSDKOxV6h2z6SI1f9ZvjzQBON7mXCce7HgPFnrAZsrOi1Rh2MWvvf33wntl4Tvm
         3nu8dkWO60Pfy4acX+I1h7URxZR8PZS+oQfSjHNSmpJUD0x7O9QOyxg6Fkg16MX9RCZP
         MalUwfkUCcKZaO6hAnXJ8TDXj/J5jxnQClsi7JVu7J9iJpO7paydSyKoiqXBKBMvmUoy
         jci+KeKUpLX27keKSSrMkR8sCdNFBvS+9KGgkUaCQyYNgsY4eieLKhB2K/Vrqo7BTg1g
         kPbw==
X-Forwarded-Encrypted: i=1; AL+hErHsQtxzk0vEhD9tPDjMVcUJsDVBg94Rsiuc0uGtBp3b6YovcafEg3FrHsrOUTStd7VPqIshVvDnhYZ8KhHnYYw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZDoMNLxE9gcNBFT73ekscbW1eN8VFx9OW5u1iLXr7SI4C6NBQ
	O+AQG39IXWJJRQfAR9LmZzUPtjl9H4bX+MnDFlBBZ1ZAfTBLWUI6dBxn13KESgwxj9Rp38lP1sD
	mynjn+spPxvKGqw==
X-Received: from iofz21-n1.prod.google.com ([2002:a05:6602:8515:10b0:9ca:727a:80b2])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1310:b0:56a:608:c445 with SMTP id 5614622812f47-57a0b95a622mr12887442b6e.51.1795477174130;
 Mon, 23 Nov 2026 15:39:34 -0800 (PST)
Date: Mon, 23 Nov 2026 23:39:09 +0000
In-Reply-To: <20261123233924.3970932-1-dmatlack@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123233924.3970932-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261123233924.3970932-5-dmatlack@google.com>
Subject: [PATCH v5 04/18] liveupdate: Allow file handlers to mark retrieve
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
Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
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
index a460f4cdb608..38ba1cf23d2c 100644
--- a/include/uapi/linux/liveupdate.h
+++ b/include/uapi/linux/liveupdate.h
@@ -178,9 +178,11 @@ struct liveupdate_session_preserve_fd {
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
index 3987ab86a3c1..9d98438b0166 100644
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
@@ -594,7 +595,9 @@ void luo_file_unfreeze(struct luo_file_set *file_set,
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
@@ -662,8 +665,13 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
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
2.56.1.809.ga0b61035b5-goog

