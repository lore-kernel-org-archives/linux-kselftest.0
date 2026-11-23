Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477182;
	b=Oi1UkGl0wWcCGxr4Mvx0I/ZeqbLr/CvTknQNhBb8bTYvM+lgPCiYOt8/sBrjDv2QXRlH
	 fg2QbfWrSmWhFvFg83hNo7gh40nEaaTj+DM/sCxtFYwXRc2fuFS/pUDVz9CKjUsWGapry
	 tmGz9xVxc+8ee0X5c2ZHMdKgKsBeI4Z149jTpplX/b5REHxhVt6zsuGzWa4TtQkQWbpzV
	 o981E9VvEVhmVFbKlBpqGmauSzHGLVulbEZxFKMcQmOr3sHcH3kIoZJy6lbWduE2DvJvf
	 goIm4tOLU2ar0HKzL8SKPBGXVLiewLW1Zkt67EnzDTMcYIEuCOovF2XYwrbZfVN9I8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477182;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=PdON3gXs/6uQsPuxGzIPmKwz1/GfU1B3j8DG4CMn1QI=;
	b=sVbtsRaQqHstxjpKkzA4ZlB4foQcMOhclP4vIG7chXwXaP7FduaV1y7JDyYBZeLgPyF6
	 wSLP3ma+FbHaqCyeImq+CbgVvXqeyKeiU+NYWACTsKkUwfeFuYgjh61+izpXF0TTKTwI8
	 qN/XBQ/KUHJKtQm8LvK2snKZHqRLO0zbzx4MwkLpD4uKTrkiGTItcsvs7eQh7TpTEiHSW
	 dLOZ9T9RzWUBoTE9Mj7ZuG0zgHonjOWoxQPeI+aGbCDa6FCukeux8eYT3KnZAu8+xF2gi
	 h5/jVeV/EoNxD/QH1ugRGDs6okMvPOtKsh6d417ZSnjvQ51ndOAwLP7wHI/8Mu5ZLCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Tg5uHf+V;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A22606A6AA
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 23:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98A22606A6AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Tg5uHf+V
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c55ba309c2so4473193b6e.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 15:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795477180; x=1796081980; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PdON3gXs/6uQsPuxGzIPmKwz1/GfU1B3j8DG4CMn1QI=;
        b=Tg5uHf+Vyqt4fZAmNnX6DnXyEluzcyytloUbGuqjd0ChyCGCHJMW9y6W0SpzmvRfyc
         MsQr4HmGCvRVSfZ2SuYWA08QiuNLgxjWsxYhh5kl7Alw0pisLg83anZiGSucjHCeuo95
         mkeenOCT+pCZuPZfaPmQA3jDIR1Tf5bL3I2DRqGWwOJYt2DOfNY4uaE/75u/Qhv2SGHi
         J6L1yr6MSJSRvZGBFG03ha4I3wRNYVjlWeHDAXtu82JePa9IlsvhvgfRXJk6pmCaFul0
         8wZGNwiwlCjLgLWXgCwqpqLC/8y1TaMOSGJvPc9x9n5rlQkWAjxjA1uBHOYtFqWtSmNv
         X75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477180; x=1796081980;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdON3gXs/6uQsPuxGzIPmKwz1/GfU1B3j8DG4CMn1QI=;
        b=k7+YJDEcdIKdDrGbNjjEBJLMQYRwU5DHlSlYLJmK9a4lkzedDfvaIMs09Pmfm0ea8J
         5ReSQX8y9Hhk75tU1UlA6j7wJBvjlFUcfM/UbjkQ+DZnmyuIPuxHVRGD0yc0XWDxaKbW
         xRA+gcscWn8cnmz6uIBYkKRdVr1w01Byx8Ezdqz0/cTxHh4qvAJ9WYlWPJ62UlkAqyFx
         x82IVxbCJyoLo8jBEgPn4U0D5WEIib7iin6Le6YJMznd41HuTorxDjTXyWayFVvU5/yb
         k/h57/bLtJSLoSFtVldYmapXC5W1QU++Sx1J77Wq36aZFOpHR9cy04TN/ZTE7GPTR4rA
         MuyQ==
X-Forwarded-Encrypted: i=1; AL+hErEhfUBhMgdOJiDeGWtazE0h3QpxOBLjvWinqnhTYqunln3NxOiMdbFiyQmiWu+I+v9S9EqVO7ye6rEdzyuJb3k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+/KQCGGaZHDa/eUzWARXN4bAnBnEanjBZpzhRX4WsaWfAOOtY
	fnEtQdscmwsGg2YrJGjq53AOQuSoXchyQScc/GtY/BE+a/OUzAtQkF0/UhnjT0mHRbPFtPGTEPO
	tMQBWXBofZQ71pA==
X-Received: from jabio27.prod.google.com ([2002:a05:6638:831b:b0:608:c2f0:a34d])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1507:b0:4f5:20:d847 with SMTP id 5614622812f47-57a0b64ef2fmr14660562b6e.36.1795477180255;
 Mon, 23 Nov 2026 15:39:40 -0800 (PST)
Date: Mon, 23 Nov 2026 23:39:13 +0000
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
Message-ID: <20261123233924.3970932-9-dmatlack@google.com>
Subject: [PATCH v5 08/18] liveupdate: Let file handlers retrieve into an
 existing file
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

Add liveupdate_claim_file() and liveupdate_unclaim_file(), which a file
handler's .retrieve() callback can use to make LUO manage a file before
restoring the preserved state into it.

LUO starts managing a retrieved file after .retrieve() returns it, and
fails the retrieve if it already manages the file. That works for new
files. The shmem file handler will restore tmpfs files into an existing
file, though, and such a handler has to know that LUO accepts the file
before it modifies it, not after the preserved state is consumed.
Otherwise, it could restore into a file that is preserved in an outgoing
session, or into a file that was already retrieved. Since preserve also
makes LUO manage the file before calling the handler, claiming the file
also keeps a concurrent preserve of the same file from racing with the
retrieve.

If .retrieve() claimed the file it returns, LUO doesn't track it again.
A callback that fails after claiming a file must unclaim it.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 include/linux/liveupdate.h   | 20 +++++++++++
 kernel/liveupdate/luo_file.c | 67 ++++++++++++++++++++++++++++++++++--
 2 files changed, 85 insertions(+), 2 deletions(-)

diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
index e4ad0bf78a5c..03ac06a2b24a 100644
--- a/include/linux/liveupdate.h
+++ b/include/linux/liveupdate.h
@@ -79,6 +79,8 @@ struct liveupdate_arg_spec {
  *                    to the handler's expected argument size with any trailing
  *                    bytes beyond the user-supplied size zero-filled. Valid
  *                    only for the duration of the callback.
+ * @claimed:          For .retrieve(): Set while the callback has claimed a file
+ *                    with liveupdate_claim_file(). Private to LUO.
  *
  * This structure bundles all parameters for the file operation callbacks.
  * The 'data' and 'file' fields are used for both input and output.
@@ -92,6 +94,7 @@ struct liveupdate_file_op_args {
 	u64 serialized_data;
 	void *private_data;
 	const void *arg;
+	bool claimed;
 };
 
 /**
@@ -306,6 +309,12 @@ int liveupdate_get_file_incoming(struct liveupdate_session *s, u64 token,
 int liveupdate_get_token_outgoing(struct liveupdate_session *s,
 				  struct file *file, u64 *tokenp);
 
+/* For .retrieve() callbacks that restore into an existing file */
+int liveupdate_claim_file(struct liveupdate_file_op_args *args,
+			  struct file *file);
+void liveupdate_unclaim_file(struct liveupdate_file_op_args *args,
+			     struct file *file);
+
 #else /* CONFIG_LIVEUPDATE */
 
 static inline bool liveupdate_enabled(void)
@@ -370,5 +379,16 @@ static inline int liveupdate_get_token_outgoing(struct liveupdate_session *s,
 	return -EOPNOTSUPP;
 }
 
+static inline int liveupdate_claim_file(struct liveupdate_file_op_args *args,
+					struct file *file)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void liveupdate_unclaim_file(struct liveupdate_file_op_args *args,
+					   struct file *file)
+{
+}
+
 #endif /* CONFIG_LIVEUPDATE */
 #endif /* _LINUX_LIVEUPDATE_H */
diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index d51bd75723fa..82ec05c7d3ce 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -676,6 +676,9 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 	err = luo_file->fh->ops->retrieve(&args);
 	kfree(args.arg);
 	if (err) {
+		/* A handler that fails must unclaim the file it claimed. */
+		WARN_ON_ONCE(args.claimed);
+
 		/*
 		 * Keep the error code for later use unless the handler marked
 		 * the failure as retryable (e.g. invalid user argument before
@@ -686,9 +689,14 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 		return err;
 	}
 
-	err = luo_track_file(luo_file->fh, args.file);
+	/* A file that the handler claimed is already tracked. */
+	if (!args.claimed)
+		err = luo_track_file(luo_file->fh, args.file);
 	if (err) {
-		/* A retrieved file is new, so it can't be tracked already. */
+		/*
+		 * A retrieved file that the handler didn't claim is new, so it
+		 * can't be tracked already.
+		 */
 		WARN_ON_ONCE(err == -EBUSY);
 
 		/*
@@ -1093,3 +1101,58 @@ int liveupdate_get_file_incoming(struct liveupdate_session *s, u64 token,
 				 token, NULL, filep);
 }
 EXPORT_SYMBOL_GPL(liveupdate_get_file_incoming);
+
+/**
+ * liveupdate_claim_file - Claim the file that the preserved state is restored
+ *                         into.
+ * @args: The arguments of the .retrieve() callback.
+ * @file: The existing file that the callback restores the preserved state into.
+ *
+ * LUO starts managing the file that .retrieve() returns after the callback,
+ * and a file can only be managed once. A handler that restores the preserved
+ * state into an existing file, instead of a new one, must call this before
+ * modifying @file, so that a file that LUO already manages is rejected before
+ * the preserved state is consumed. For example, @file could be preserved in an
+ * outgoing session, or be another retrieved file.
+ *
+ * After a successful claim, the callback must either return @file in
+ * @args->file, or call liveupdate_unclaim_file() and fail.
+ *
+ * Context: Can only be called from a .retrieve() callback.
+ * Return: 0 on success, -EBUSY if LUO already manages @file, or another
+ *         negative errno on failure.
+ */
+int liveupdate_claim_file(struct liveupdate_file_op_args *args,
+			  struct file *file)
+{
+	int err;
+
+	if (WARN_ON_ONCE(args->claimed))
+		return -EINVAL;
+
+	err = luo_track_file(args->handler, file);
+	if (err)
+		return err;
+
+	args->claimed = true;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(liveupdate_claim_file);
+
+/**
+ * liveupdate_unclaim_file - Undo liveupdate_claim_file().
+ * @args: The arguments of the .retrieve() callback.
+ * @file: The file that was claimed.
+ *
+ * Context: Can only be called from a .retrieve() callback.
+ */
+void liveupdate_unclaim_file(struct liveupdate_file_op_args *args,
+			     struct file *file)
+{
+	if (WARN_ON_ONCE(!args->claimed))
+		return;
+
+	luo_untrack_file(args->handler, file);
+	args->claimed = false;
+}
+EXPORT_SYMBOL_GPL(liveupdate_unclaim_file);
-- 
2.56.1.809.ga0b61035b5-goog

