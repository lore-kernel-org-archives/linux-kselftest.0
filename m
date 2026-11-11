Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356659;
	b=VnchFCzDRa9pnOjeBDGLj/3JBPbXpkWTf/Y9eUTd0JaPIYjjKpBEZC3r8zNrUDjaNumF
	 BzXNXbHfEGrjSF2oHGucvRLWZCJXVg7ruVKTQ1kLqWZcwpgc0VrF9zAzqFO9gH4rIi7nW
	 K7eVKHKeMgb+tPHthrRrrxdJUxbnrq6an3L2qd46fqXEOUvF891hcfJLKTDN5Gi7dL5n4
	 QDeCpaqrfu9AuuyYvdVNiA5jk6yb28N/RYciMH3qjbOCiUwajDbIKHWoMtVNbEJMaPF0b
	 alYCM0IHuRLXj4VcmIfkOU46QCFM8/s27DuUqWvr+FuHcztWBPoGCwllAKVPc2de+6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=6Cr74Qub+tM1aXRzOZn7JCSg3Cj9WP9eXIaNfTgWpng=;
	b=jMXYjD+rqiwhjVzyrHVOVmAmHdlDfDBwhVIbUOj7Py/UHKfGKMEpe8q2+rcHwiv9hJOE
	 odPZ4rpEme8LSMUlaG+SniEmSBNRdaJpYqSPRMAcgJ2IBNZ45z/kFnmVexD0Ds26nSONA
	 qVcxOBx1Z96BTFCPESEOl4RizA2tLWxdT8MbhZ8ZpBOVmaCMUiR336VnsjgcBk228WX38
	 Vh6zFu6xAkENM0Vyju9CZ51qka2sdzLkLO6+UJww6VvMIYRKac2zcIX44oF4ZKScGjimg
	 lLsXUZPWGrGmLI+F+dTVAwBf4bXalpoZffVbj54czpZFZ4O2YmJdyGZDfnci1usGpSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fc6AqgPS;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE0E60A3836
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 00:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBE0E60A3836
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fc6AqgPS
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4db3db8687fso3157595b6e.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 16:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794356658; x=1794961458; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Cr74Qub+tM1aXRzOZn7JCSg3Cj9WP9eXIaNfTgWpng=;
        b=fc6AqgPSThXdW2Y1wCSo9b3Zo9rXFMnF5tjap70o2xRZGXSF4Hy7UwGYAufbBuLq0y
         zeG5vj+rIlg9gSkYT/37+azBV530HrFYqAyU4Fc6l3Vt3M2+v5ZC2iBoviTK6egpaFRu
         H+jAqTx7mdhr9NkVP0cY9wTZxC3SnC8LhTk8E0lqUhoSH12Og+udZFo9b54VdNLPJ9jv
         8Lt3XRNsMSp2LrUhXFQ9A1+AFyzY4U4QHbHwzI4CnZlpTv022hOrrHeqkIC1N6Ida2sO
         bOuWjmQJppR4OXa/cG9G3wPDeCG2ABYczl8cHwvFTLxDAK0D+v9bNRvXHL3KqA+VBoZ4
         qAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356658; x=1794961458;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Cr74Qub+tM1aXRzOZn7JCSg3Cj9WP9eXIaNfTgWpng=;
        b=CzT8o8Hb84fRrGptDVHCipH0M65mCc3HTqL3Js4lF9KbmYPShFbXNGK8qDiZ25iGWP
         7cKo7qSVxwdoy4uYdx0K8eYq436zM/SzfzvfkV/CFzeLH5tMjCyqadR6ilL17VR3JUqe
         qWVMmYvkoHlmXeM016buIhM3rL2y7lbqbSy9BU+ztpXoK5+OJzNWlBZtmX0gyowbutDh
         y24AssWw78jFFELMfvFBxa4XyC/Lmm67tDf4ILV3rSEjPpl5uVVKaWk5AgU7MnMr4YMf
         1MQjwGkkp1WU5pyY26t652Z7a22ikz27HRR65xpv/6oH3c0tW9aO0H9WZXhzFOCbsEm2
         yUvA==
X-Forwarded-Encrypted: i=1; AL+hErEaK762Cg3vg33H8H0fOtXo91y24NAhFl03JIJb/a0tA6XPc4lzOffH/QbiFWTRDi0OcDo1s/v5hojV0m6k668=@vger.kernel.org
X-Gm-Message-State: APuU4Z85PH7Truk68Z5uOOvThPKgwFJAmsTP6Eu9tR9ydgzjOjbJZYg3
	kj38AMuoQHY4auNE7utjb/H8V6/4rLfFo9/ncyZiZ2JtYbHn/MvYUDsAEJyIB67Y4ZZErVdjAWI
	R7/QCIIVUFBL3hQ==
X-Received: from jabll4.prod.google.com ([2002:a05:6638:9804:b0:61f:e4cd:8716])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:2507:b0:4f6:6041:f0a2 with SMTP id 5614622812f47-56b96def35emr632822b6e.27.1794356657766;
 Tue, 10 Nov 2026 16:24:17 -0800 (PST)
Date: Wed, 11 Nov 2026 00:23:46 +0000
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
Message-ID: <20261111002358.1842967-9-dmatlack@google.com>
Subject: [PATCH v4 08/19] liveupdate: Let file handlers retrieve into an
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
restoring the preserved state into it. Also let the callback return the
file descriptor of that file, so that LIVEUPDATE_SESSION_RETRIEVE_FD
returns it instead of a new file descriptor.

LUO starts managing a retrieved file after .retrieve() returns it, and
fails the retrieve if it already manages the file. That works for new
files. The shmem file handler will restore tmpfs files into an existing
file, though, and such a handler has to know that LUO accepts the file
before it modifies it, not after the preserved state is consumed.
Otherwise, it could restore into a file that is preserved in an
outgoing session, or into a file that was already retrieved. Preserve
also makes LUO manage the file before the file handler touches it, so
claiming the file also keeps a preserve from racing with the retrieve.

If .retrieve() claimed the file it returns, LUO doesn't track it again.
A callback that fails after claiming a file must unclaim it.

A file that is restored into an existing file is already open in the
caller, so installing a new file descriptor for it would just leave
userspace with two file descriptors for the same open file. Retrieving
the token again later still returns a new file descriptor, like for any
other file that was already retrieved.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 include/linux/liveupdate.h       | 26 +++++++++++
 include/uapi/linux/liveupdate.h  |  4 +-
 kernel/liveupdate/luo_file.c     | 80 ++++++++++++++++++++++++++++++--
 kernel/liveupdate/luo_internal.h |  2 +-
 kernel/liveupdate/luo_session.c  | 25 +++++++---
 5 files changed, 124 insertions(+), 13 deletions(-)

diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
index e4ad0bf78a5c..87a894e269f2 100644
--- a/include/linux/liveupdate.h
+++ b/include/linux/liveupdate.h
@@ -79,6 +79,13 @@ struct liveupdate_arg_spec {
  *                    to the handler's expected argument size with any trailing
  *                    bytes beyond the user-supplied size zero-filled. Valid
  *                    only for the duration of the callback.
+ * @claimed:          For .retrieve(): Set while the callback has claimed a file
+ *                    with liveupdate_claim_file(). Private to LUO.
+ * @fd:               For .retrieve(): [OUT] -1, or the file descriptor of
+ *                    @file in the calling task if the callback restored the
+ *                    preserved state into a file that is already open there.
+ *                    LUO then returns that file descriptor to userspace
+ *                    instead of installing a new one.
  *
  * This structure bundles all parameters for the file operation callbacks.
  * The 'data' and 'file' fields are used for both input and output.
@@ -92,6 +99,8 @@ struct liveupdate_file_op_args {
 	u64 serialized_data;
 	void *private_data;
 	const void *arg;
+	bool claimed;
+	int fd;
 };
 
 /**
@@ -306,6 +315,12 @@ int liveupdate_get_file_incoming(struct liveupdate_session *s, u64 token,
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
@@ -370,5 +385,16 @@ static inline int liveupdate_get_token_outgoing(struct liveupdate_session *s,
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
diff --git a/include/uapi/linux/liveupdate.h b/include/uapi/linux/liveupdate.h
index 7420e2c5434b..4ebbd578d2d5 100644
--- a/include/uapi/linux/liveupdate.h
+++ b/include/uapi/linux/liveupdate.h
@@ -161,7 +161,9 @@ struct liveupdate_session_preserve_fd {
  * struct liveupdate_session_retrieve_fd - ioctl(LIVEUPDATE_SESSION_RETRIEVE_FD)
  * @size:  Input; sizeof(struct liveupdate_session_retrieve_fd)
  * @fd:    Output; The new file descriptor representing the fully restored
- *         kernel resource.
+ *         kernel resource, or the file descriptor of the file it was restored
+ *         into, if @arg passed one (see the documentation of the file
+ *         handler).
  * @token: Input; An opaque, token that was used to preserve the resource.
  * @arg:   Input; User-space pointer to a file-handler-specific argument
  *         structure starting with a 32-bit size field, or 0 if unused.
diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index 91a2b74f71cb..95b17c980054 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -592,6 +592,10 @@ void luo_file_unfreeze(struct luo_file_set *file_set,
  * @arg:      User-space pointer to the handler argument structure, or NULL.
  * @filep:    Output parameter; on success, this is populated with a pointer
  *            to the newly retrieved 'struct file'.
+ * @fdp:      Output parameter; on success, this is set to -1, or to the file
+ *            descriptor of @filep in the calling task if the file handler
+ *            restored the preserved state into a file that is already open
+ *            there.
  *
  * This function is the primary mechanism for recreating a file in the new
  * kernel after a live update. It searches the file_set's list of deserialized
@@ -616,7 +620,7 @@ void luo_file_unfreeze(struct luo_file_set *file_set,
  *         Any error code returned by the handler's .retrieve() op.
  */
 int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
-		      const void __user *arg, struct file **filep)
+		      const void __user *arg, struct file **filep, int *fdp)
 {
 	struct liveupdate_file_op_args args = {0};
 	struct luo_file *luo_file;
@@ -656,6 +660,7 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 		 */
 		get_file(luo_file->file);
 		*filep = luo_file->file;
+		*fdp = -1;
 		return 0;
 	}
 
@@ -666,9 +671,13 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 	args.handler = luo_file->fh;
 	args.session = luo_session_from_file_set(file_set);
 	args.serialized_data = luo_file->serialized_data;
+	args.fd = -1;
 	err = luo_file->fh->ops->retrieve(&args);
 	kfree(args.arg);
 	if (err) {
+		/* A handler that fails must unclaim the file it claimed. */
+		WARN_ON_ONCE(args.claimed);
+
 		/*
 		 * Keep the error code for later use unless the handler marked
 		 * the failure as retryable (e.g. invalid user argument before
@@ -679,9 +688,14 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
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
@@ -700,6 +714,7 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 	get_file(luo_file->file);
 
 	*filep = luo_file->file;
+	*fdp = args.fd;
 	luo_file->retrieve_status = 1;
 
 	return 0;
@@ -1081,7 +1096,64 @@ EXPORT_SYMBOL_GPL(liveupdate_get_token_outgoing);
 int liveupdate_get_file_incoming(struct liveupdate_session *s, u64 token,
 				 struct file **filep)
 {
+	int fd;
+
 	return luo_retrieve_file(luo_file_set_from_session_locked(s),
-				 token, 0, filep);
+				 token, 0, filep, &fd);
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
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index e0be84acb33b..5e2f82f5a044 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -109,7 +109,7 @@ int luo_file_freeze(struct luo_file_set *file_set,
 void luo_file_unfreeze(struct luo_file_set *file_set,
 		       struct luo_file_set_ser *file_set_ser);
 int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
-		      const void __user *arg, struct file **filep);
+		      const void __user *arg, struct file **filep, int *fdp);
 int luo_file_finish(struct luo_file_set *file_set);
 int luo_file_deserialize(struct luo_file_set *file_set,
 			 struct luo_file_set_ser *file_set_ser);
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 0d7533f0bde6..2f3f0eeedf07 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -285,31 +285,42 @@ static int luo_session_retrieve_fd(struct luo_session *session,
 {
 	struct liveupdate_session_retrieve_fd *argp = ucmd->cmd;
 	struct file *file;
-	int err;
+	int fd, err;
 
-	argp->fd = get_unused_fd_flags(O_CLOEXEC);
-	if (argp->fd < 0)
-		return argp->fd;
+	fd = get_unused_fd_flags(O_CLOEXEC);
+	if (fd < 0)
+		return fd;
 
 	mutex_lock(&session->mutex);
 	err = luo_retrieve_file(&session->file_set, argp->token,
-				u64_to_user_ptr(argp->arg), &file);
+				u64_to_user_ptr(argp->arg), &file, &argp->fd);
 	mutex_unlock(&session->mutex);
 	if (err < 0)
 		goto err_put_fd;
 
+	/*
+	 * If the file handler restored the preserved state into a file that is
+	 * already open in this task, return its file descriptor.
+	 */
+	if (argp->fd >= 0) {
+		fput(file);
+		put_unused_fd(fd);
+		return luo_ucmd_respond(ucmd, sizeof(*argp));
+	}
+
+	argp->fd = fd;
 	err = luo_ucmd_respond(ucmd, sizeof(*argp));
 	if (err)
 		goto err_put_file;
 
-	fd_install(argp->fd, file);
+	fd_install(fd, file);
 
 	return 0;
 
 err_put_file:
 	fput(file);
 err_put_fd:
-	put_unused_fd(argp->fd);
+	put_unused_fd(fd);
 
 	return err;
 }
-- 
2.56.0.542.g3ef89b7020-goog

