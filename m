Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5C949483B
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 18:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788286048; cv=none; b=UKG/jmU4HPesYeGuifPa3CC5NBX0r/LS4Y3Dr0H/PnEYvtFWPnpGOHNKsakcPGCeA0aDGDaDpsjp+UCJCXPX9G+WLRVOFbylIJINRZxzNwzG4VRwvz/alp6val6AZNCcwEPFis1d5M1Wwo5BRKgRq9+L9SpknmU2Xtfmy3cA22k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788286048; c=relaxed/simple;
	bh=vtYIoVwj2gUjnAUPtl0S6WmTLHlYLBq4sxXTimWNe+0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sL88aypW6sIEib3dDfg1VAlY9pxj/NobUneCsWHLThmv+RjtOCl6yJZynIBfCt3bQ/yAx6HTSh5RGLsklyeh9A+dmZSAcQmaPp0WFm43PTVslWkJcxKcDTG6AVhprIojMbONZ3yFxh7ZrnepClwNHWslJ5ip55Hb3Xh6MKcLJhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tc8EYzPv; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tc8EYzPv"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so182534a91.1
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 11:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788286046; x=1788890846; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=falXxVt1CqmyncILPaUG22UQuDMsfEGdQdvwDGt8XFI=;
        b=tc8EYzPvzjJJOK667C6ZooyWzoXbtgyGaxZzxGmF3XcuQevItsEkT4BZe1CF7BiAO3
         P9RMCqO5ua4LnpSZ4Ie3rcXwhMzd/7C5HiHNg6Z/BRefmz/zS2Rsk+WV7CwdhacYw3ZE
         FY1UZcHuQ6w6r5KaCoziSBTQEb0lUtUSL3tkdGIgjPqF+CpwIwd0KHwc4X3Y9hjkozJ1
         D23a8DfHHQzQnOZWXXVemCVp6r+eNduOgvkR/Jaq1xYA3sD4mimmhWzXEaZYi4LEaKNO
         h6fEiRS9IQRMuSRIBwVmPGNooi6XDl6eoJQCBJ1BHwb9alFpQ6BVW2CCJmEPFsKwneIq
         mgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788286046; x=1788890846;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=falXxVt1CqmyncILPaUG22UQuDMsfEGdQdvwDGt8XFI=;
        b=ALqCDAKX8WkJBommDCCjQ7DUKGT+Da+y0DkWsXCUcMS9sOfFK4UB/HeTSIvnaIyINH
         hBlUByEnuuyvIVyWMaulWAR/Pj5oHKGgFYA56Xcjj2ZcajqWAXcQq6zg15iVBd0OI4Oe
         iDz/SZJkK0DNtKptXv5f+/47FGmBFKkiaP2pQky6ujffmhYm01gHhF6KLRKL2T+EgAH8
         wYvuUAH62VUq+WDyCvXoYFiWYotUiQyxqpwQ51wP126+wjGg1djXecnhr81QUIRuJKvQ
         FQHjOTlT8P+mGxQC+/T5CGcTn3nbshcbt1YRe7MuZC2fSEO6GQCi9ZYjxYnu7Ok+nk1t
         NLaQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0Z6Tn0d8bkstssT1moFwh9ND1v+PDlqDIrviGjJNd5TSKD02oT3Y+hIshgybs+GA/xZYTGAb/D2E7ZB8jjVw=@vger.kernel.org
X-Gm-Message-State: AFuF++ka06bXwG7q8s4hNkq7leZdEsjQf9SQEuhoJEq/Mgyr/eDq93Bz
	11CIxo7oousvPY3NvLBBwptrQGxhBEMKu7SoDD9tqSZAnD52cQoTXGV9JkuF5qF2QCs5Z7K4Tbs
	ByrsoBTPZ9vTkFQ==
X-Received: from pjyv9.prod.google.com ([2002:a17:90a:e989:b0:396:5ba1:a6dc])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3c44:b0:398:dcef:c040 with SMTP id 98e67ed59e1d1-398dcefc24amr26801689a91.19.1788286045592;
 Tue, 01 Sep 2026 11:07:25 -0700 (PDT)
Date: Tue,  1 Sep 2026 18:07:10 +0000
In-Reply-To: <20260901180713.4185641-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260901180713.4185641-1-dmatlack@google.com>
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260901180713.4185641-3-dmatlack@google.com>
Subject: [RFC PATCH 2/5] liveupdate: Introduce SESSION_RETRIEVE_INTO_FD API
 and core support
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <shuah@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Define the LIVEUPDATE_CMD_SESSION_RETRIEVE_INTO_FD ioctl in the UAPI and
implement the core support into LUO sessions. Add a new .retrieve_into()
callback definition to struct liveupdate_file_handler but do not yet
implement it for any file types.

Delegating VFS topology recreation to userspace across Live Updates
requires an interface where userspace can provide an empty target file
descriptor, and the kernel can inject preserved memory into it. This API
supplies that missing routing. It uses the new luo_retrieve_into_file()
helper to safely look up tracking structures without duplicating backend
locks.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 include/linux/liveupdate.h       |  1 +
 include/uapi/linux/liveupdate.h  | 21 +++++++++++++++++++
 kernel/liveupdate/luo_file.c     | 36 ++++++++++++++++++++++++++++++++
 kernel/liveupdate/luo_internal.h |  2 ++
 kernel/liveupdate/luo_session.c  | 30 ++++++++++++++++++++++++++
 5 files changed, 90 insertions(+)

diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
index 63ea5417de84..7b595e0f53bc 100644
--- a/include/linux/liveupdate.h
+++ b/include/linux/liveupdate.h
@@ -79,6 +79,7 @@ struct liveupdate_file_ops {
 	int (*freeze)(struct liveupdate_file_op_args *args);
 	void (*unfreeze)(struct liveupdate_file_op_args *args);
 	int (*retrieve)(struct liveupdate_file_op_args *args);
+	int (*retrieve_into)(struct liveupdate_file_op_args *args, struct file *target_file);
 	bool (*can_finish)(struct liveupdate_file_op_args *args);
 	void (*finish)(struct liveupdate_file_op_args *args);
 	unsigned long (*get_id)(struct file *file);
diff --git a/include/uapi/linux/liveupdate.h b/include/uapi/linux/liveupdate.h
index 4043d4038712..ed2049529cc0 100644
--- a/include/uapi/linux/liveupdate.h
+++ b/include/uapi/linux/liveupdate.h
@@ -59,7 +59,11 @@ enum {
 	LIVEUPDATE_CMD_SESSION_PRESERVE_FD = LIVEUPDATE_CMD_SESSION_BASE,
 	LIVEUPDATE_CMD_SESSION_RETRIEVE_FD = 0x41,
 	LIVEUPDATE_CMD_SESSION_FINISH = 0x42,
+
 	LIVEUPDATE_CMD_SESSION_GET_NAME = 0x43,
+
+	LIVEUPDATE_CMD_SESSION_RETRIEVE_INTO_FD = 0x44,
+
 };
 
 /**
@@ -184,6 +188,23 @@ struct liveupdate_session_retrieve_fd {
 #define LIVEUPDATE_SESSION_RETRIEVE_FD					\
 	_IO(LIVEUPDATE_IOCTL_TYPE, LIVEUPDATE_CMD_SESSION_RETRIEVE_FD)
 
+/**
+ * struct liveupdate_session_retrieve_into_fd - ioctl(LIVEUPDATE_SESSION_RETRIEVE_INTO_FD)
+ * @size:  Input; sizeof(struct liveupdate_session_retrieve_into_fd)
+ * @fd:    Input; The open file descriptor (e.g. empty tmpfs file) to inject the resource into.
+ * @token: Input; An opaque, token that was used to preserve the resource.
+ *
+ * Retrieve a previously preserved file descriptor into an existing file descriptor.
+ */
+struct liveupdate_session_retrieve_into_fd {
+	__u32		size;
+	__s32		fd;
+	__aligned_u64	token;
+};
+
+#define LIVEUPDATE_SESSION_RETRIEVE_INTO_FD					\
+	_IO(LIVEUPDATE_IOCTL_TYPE, LIVEUPDATE_CMD_SESSION_RETRIEVE_INTO_FD)
+
 /**
  * struct liveupdate_session_finish - ioctl(LIVEUPDATE_SESSION_FINISH)
  * @size:     Input; sizeof(struct liveupdate_session_finish)
diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index 5e160836a165..c4abfd25e149 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -932,3 +932,39 @@ void liveupdate_unregister_file_handler(struct liveupdate_file_handler *fh)
 	luo_flb_unregister_all(fh);
 	list_del(&ACCESS_PRIVATE(fh, list));
 }
+
+int luo_retrieve_into_file(struct luo_file_set *file_set, u64 token,
+			   struct file *target_file)
+{
+	struct liveupdate_file_op_args args = {0};
+	struct luo_file *luo_file;
+	int err;
+
+	luo_file = luo_find_file_by_token(file_set, token);
+	if (IS_ERR(luo_file))
+		return PTR_ERR(luo_file);
+
+	guard(mutex)(&luo_file->mutex);
+	if (luo_file->retrieve_status < 0)
+		return luo_file->retrieve_status;
+
+	if (luo_file->retrieve_status > 0)
+		return -EBUSY; /* Already retrieved */
+
+	if (!luo_file->fh->ops->retrieve_into)
+		return -EOPNOTSUPP;
+
+	args.handler = luo_file->fh;
+	args.serialized_data = luo_file->serialized_data;
+	err = luo_file->fh->ops->retrieve_into(&args, target_file);
+	if (err) {
+		luo_file->retrieve_status = err;
+		return err;
+	}
+
+	luo_file->file = target_file;
+	get_file(luo_file->file);
+	luo_file->retrieve_status = 1;
+
+	return 0;
+}
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index 64879ffe7378..1af9aebe6623 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -92,6 +92,8 @@ void luo_file_unfreeze(struct luo_file_set *file_set,
 		       struct luo_file_set_ser *file_set_ser);
 int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 		      struct file **filep);
+int luo_retrieve_into_file(struct luo_file_set *file_set, u64 token,
+			   struct file *target_file);
 int luo_file_finish(struct luo_file_set *file_set);
 int luo_file_deserialize(struct luo_file_set *file_set,
 			 struct luo_file_set_ser *file_set_ser);
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index f48e9a4185f9..2b967f720ef5 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -278,6 +278,34 @@ static int luo_session_preserve_fd(struct luo_session *session,
 	return err;
 }
 
+static int luo_session_retrieve_into_fd(struct luo_session *session,
+					 struct luo_ucmd *ucmd)
+{
+	struct liveupdate_session_retrieve_into_fd *argp = ucmd->cmd;
+	struct fd target_fd;
+	int err;
+
+	target_fd = fdget(argp->fd);
+	if (fd_empty(target_fd))
+		return -EBADF;
+
+	guard(mutex)(&session->mutex);
+	err = luo_retrieve_into_file(&session->file_set, argp->token, fd_file(target_fd));
+	if (err < 0)
+		goto err_put_fd;
+
+	err = luo_ucmd_respond(ucmd, sizeof(*argp));
+	/*
+	 * If we fail to respond, we cannot easily undo the retrieval. Let the
+	 * normal session cleanup logic handle the file reference eventually.
+	 */
+
+err_put_fd:
+	fdput(target_fd);
+
+	return err;
+}
+
 static int luo_session_retrieve_fd(struct luo_session *session,
 				   struct luo_ucmd *ucmd)
 {
@@ -382,6 +410,8 @@ static const struct luo_ioctl_op luo_session_ioctl_ops[] = {
 		 struct liveupdate_session_retrieve_fd, token, LUO_IOCTL_INCOMING),
 	IOCTL_OP(LIVEUPDATE_SESSION_GET_NAME, luo_session_get_name,
 		 struct liveupdate_session_get_name, name, LUO_IOCTL_ALL),
+	IOCTL_OP(LIVEUPDATE_SESSION_RETRIEVE_INTO_FD, luo_session_retrieve_into_fd,
+		 struct liveupdate_session_retrieve_into_fd, token, LUO_IOCTL_INCOMING),
 };
 
 static bool luo_ioctl_type_valid(struct luo_session *session,
-- 
2.55.0.966.g6673acef38-goog

