Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2554C14F3
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 09:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057118; cv=none; b=PfsP6zzAQXMG8WbqhKjvYRDHwI/01oKWYUdztcjhnZ+9tqUYfjujYo56N/L1NNUXpb/ejbByI0qRyNJhF1mxP61CBczI34nGbY+0zvRv6sE/3Cun9tdgGeGXnxycHP1w2ppUxD/2c4U/rZllQUQgo9L5N6v/nGGcfnxkaJctlO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057118; c=relaxed/simple;
	bh=X9ggIe7QN5xOmpYBeYor+QiP95St4sU+fMrJNPpVImc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ATeqM6MdhYv8YvMxc10G7Q8LdJ6m7JqgrkSKLEp6Dmco929KYQd6YwAGfUkNTKbXMsYO01YbkqBAwIsIaysMWoXxHvDXKFgAYfx7DolkBAvlAo1yika8ReidAdLT06goXhptzzCkvCJgIe2rdTt4tSQQooLWtyELVU4PwdIRLbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=ZHAe3j+8; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="ZHAe3j+8"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5e3e525cf4bso3935752e0c.1
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 02:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792057111; x=1792661911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=D1ap1lTo09xjVAq/k8OVq3JGg6tCyLxeFjdIIFwfh58=;
        b=ZHAe3j+8vVftUFbMKnGKzTodRitSzaissKpkspmJ4umRxUEjaPKq9aSRxNOm6/Fk2G
         GICd8M2dl7aMJQZnHcs2UMeNROpwfNuYSekBeDyXx6aRr6kqDrxDOcSc+KbLGF30gQOK
         9NJJs6nangMSAhQcgaZmP9yCRdPwRV0l5ak57sW/PmhPbXo+16D7z13VNL8NHgtx41Zl
         kWNtAADhB2WBWpbSFdqB7xOCJbDSUOH+vGrPDXvywnr5v8mKudplbdI0Vf6G0ympuTDA
         1hY5C0MEOwbVZr/VLhJrPLYdSLtFGc/aGR2z8sJASZHTuUNeKr0PjrGBY6MB0Ep/0w+k
         +wrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057111; x=1792661911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=D1ap1lTo09xjVAq/k8OVq3JGg6tCyLxeFjdIIFwfh58=;
        b=z2nYmknieKhvCnB43ddieScEWbc3qqFjU8faJwhHLtGy1tzWFpBhKQBt5T3Py8Wiic
         5oqJca/yc8q8dECLRvGMLV12P30W/9tK0713bffpSDKgd4ml3ryK7Bba3yEkE7d+K/uk
         zaCVouOWPVQps7DCywsKllPdxqU53BDpvUrdLXhPXQEEwqT3vQdjYXMMlmgjoPF2SgJe
         zzXsJ1vceDR5lwcMbkETebuInvWdDdNtd7i5L6mV6Z8tLZEksNvuJ3K//6+ktmt79ZKi
         FzOX6BRs4jSuaiMVIaX5ZFEBZUBhkyRXvdLkydNRJI+lBLym8BUuyL7/kQAeScJenXoe
         FOpg==
X-Gm-Message-State: AFq9FYIkTVZ7eE7JYboIC8/lVdHkXbKHticfRq5vK5xYLGLfFMtECmrw
	AKiDP+py1FlI8YvSM1gFkrguYzMEGS2zvQTmyhbjzEUfgkfGgrZ8UvMdsbhUvnEYePURKFtclRv
	en1Ir
X-Gm-Gg: AYBFou1q/eE/N5POZkyltm62+NYDyIk9w6abhbNPhp5m/M9FjuIQtQbz7svUhwJBnFr
	5VdUofKJf6yGH94ZxcvrZlcYhqFex3cHbYkofbcyc4XfdjaaAiVqAyWg/kBBIw7uroullml8tZG
	APU/h6X3iSL6du+2iIya2PA/G6GakiKN+cmEZi4shhlbbg3t4bSo0BO1V5FlHW9wY58p366k4ii
	bEeReHigJWnIjikjeBmNpgMUFeIIcu1y8OGsLs/WICAoez3g+F0ryUo29hhkVhKa6yGT0Jrtvbo
	8rQMPWYJeq8slWoFYh1wnxy43D0fX6FoIdbdG0v+nMShmEc67Va5fbFt+16bYHDRWFx7tYF8dwj
	0BNy/6K/rBX5I6TgQhvRj95G8dzD10b9e5Phx3eyc926lqmRCl8pPzd8CdtbszSaLbxaQeyOdrX
	xPlrqnea1g2/L6H1XLuCaDNnbzjViwQKqxvgb/4dBcrBg9nkJo8K4akUF2sEBX0ATX74pUDIbMv
	K+R6lWaqs8YbLd4kAvXhMJezNynA38GMg2eAP8uHhkRYZYdh5g4NxdARDHqRAc/ySzAfKjZ0jxD
	i/jhuVcpSzUs0hpy46I=
X-Received: by 2002:a05:6123:10f:b0:5c9:a7af:8178 with SMTP id 71dfb90a1353d-5e91f26da41mr6464626e0c.2.1792057110812;
        Thu, 15 Oct 2026 02:38:30 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003d37009sm12275672241.2.2026.10.15.02.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:38:25 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	graf@amazon.com
Subject: [PATCH v1 3/7] liveupdate: Pass user argument to file preserve and retrieve
Date: Thu, 15 Oct 2026 05:38:12 -0400
Message-ID: <20261015093816.2438942-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261015093816.2438942-1-pasha.tatashin@soleen.com>
References: <20261015093816.2438942-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow userspace to pass a file-handler-specific argument structure when
preserving or retrieving an FD via LUO. File handlers may need
additional context during preservation or retrieval, such as a target
FD, device location, or handler-specific parameters, without introducing
separate ioctls for each file type. Whether the argument is required,
optional, or unused is defined by the file handler.

Extend struct liveupdate_session_preserve_fd and
struct liveupdate_session_retrieve_fd with a 64-bit arg field pointing
to a handler-defined argument structure that begins with a 32-bit size
field. Because IOCTL_OP validates a minimum size up to the token field,
existing callers passing the 16-byte struct remain compatible and have
arg zero-filled by copy_struct_from_user().

Add parg and rarg (struct liveupdate_arg_spec) to
struct liveupdate_file_ops, initialized via LIVEUPDATE_ARG(_struct,
_min_last), which records the full struct size and minimum required size
while enforcing at compile time that handler argument structures begin
with a 32-bit size field. When arg is non-zero, LUO validates the
minimum size and copies the user argument via copy_struct_from_user() up
to the handler's expected size and passes the kernel copy in
struct liveupdate_file_op_args, or returns -EOPNOTSUPP if the handler
does not accept an argument.

Also provide liveupdate_claim_file() and liveupdate_unclaim_file() so
handlers whose .retrieve() callback restores state into an existing
user-supplied file descriptor can claim it in luo_preserved_files before
modifying the file.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/liveupdate.h       | 60 +++++++++++++++++++
 include/uapi/linux/liveupdate.h  |  6 ++
 kernel/liveupdate/luo_file.c     | 99 +++++++++++++++++++++++++++++---
 kernel/liveupdate/luo_internal.h |  5 +-
 kernel/liveupdate/luo_session.c  |  6 +-
 5 files changed, 164 insertions(+), 12 deletions(-)

diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
index 885ec0bbc4b8c..52d3f453ae011 100644
--- a/include/linux/liveupdate.h
+++ b/include/linux/liveupdate.h
@@ -22,6 +22,36 @@ struct liveupdate_flb;
 struct liveupdate_session;
 struct file;
 
+/**
+ * struct liveupdate_arg_spec - Specification of a file handler user argument.
+ * @size:     Full size of the argument structure in the current kernel.
+ * @min_size: Minimum valid user-supplied size (offsetofend of the last
+ *            required field).
+ */
+struct liveupdate_arg_spec {
+	size_t size;
+	size_t min_size;
+};
+
+/**
+ * LIVEUPDATE_ARG - Validated specification of a file handler argument struct.
+ * @_struct:   The argument structure type.
+ * @_min_last: The last required member in @_struct.
+ *
+ * All file handler argument structures passed via
+ * &liveupdate_session_preserve_fd.arg or &liveupdate_session_retrieve_fd.arg
+ * must begin with a 32-bit @size field so they can be extended compatibly.
+ * Use this macro to initialize &liveupdate_file_ops.parg and
+ * &liveupdate_file_ops.rarg.
+ */
+#define LIVEUPDATE_ARG(_struct, _min_last)				\
+	{								\
+		.size = sizeof(_struct) +				\
+			BUILD_BUG_ON_ZERO(offsetof(_struct, size) != 0) + \
+			BUILD_BUG_ON_ZERO(sizeof_field(_struct, size) != sizeof(u32)), \
+		.min_size = offsetofend(_struct, _min_last),		\
+	}
+
 /**
  * struct liveupdate_file_op_args - Arguments for file operation callbacks.
  * @handler:          The file handler being called.
@@ -39,6 +69,11 @@ struct file;
  *                    is not preserved. Set by the handler's .preserve()
  *                    callback, and must be freed in the handler's
  *                    .unpreserve() callback.
+ * @arg:              Kernel copy of the user-provided argument for .preserve()
+ *                    and .retrieve(), or %NULL if none was provided. Allocated
+ *                    to the handler's expected argument size with any trailing
+ *                    bytes beyond the user-supplied size zero-filled. Valid
+ *                    only for the duration of the callback.
  *
  * This structure bundles all parameters for the file operation callbacks.
  * The 'data' and 'file' fields are used for both input and output.
@@ -49,6 +84,7 @@ struct liveupdate_file_op_args {
 	struct file *file;
 	u64 serialized_data;
 	void *private_data;
+	const void *arg;
 };
 
 /**
@@ -67,6 +103,12 @@ struct liveupdate_file_op_args {
  *                resources in the session.
  * @finish:       Required. Final cleanup in the new kernel.
  * @get_id:       Optional. Returns a unique identifier for the file.
+ * @parg:         Optional. Specification of the user argument structure
+ *                accepted by @preserve, initialized via LIVEUPDATE_ARG(). If
+ *                unset, non-zero user arguments are rejected with -EOPNOTSUPP.
+ * @rarg:         Optional. Specification of the user argument structure
+ *                accepted by @retrieve, initialized via LIVEUPDATE_ARG(). If
+ *                unset, non-zero user arguments are rejected with -EOPNOTSUPP.
  * @owner:        Module reference
  *
  * All operations (except can_preserve) receive a pointer to a
@@ -83,6 +125,8 @@ struct liveupdate_file_ops {
 	bool (*can_finish)(struct liveupdate_file_op_args *args);
 	void (*finish)(struct liveupdate_file_op_args *args);
 	unsigned long (*get_id)(struct file *file);
+	struct liveupdate_arg_spec parg;
+	struct liveupdate_arg_spec rarg;
 	struct module *owner;
 };
 
@@ -237,6 +281,11 @@ int liveupdate_reboot(void);
 int liveupdate_register_file_handler(struct liveupdate_file_handler *fh);
 void liveupdate_unregister_file_handler(struct liveupdate_file_handler *fh);
 
+int liveupdate_claim_file(struct liveupdate_file_handler *fh,
+			  struct file *file);
+void liveupdate_unclaim_file(struct liveupdate_file_handler *fh,
+			     struct file *file);
+
 int liveupdate_register_flb(struct liveupdate_file_handler *fh,
 			    struct liveupdate_flb *flb);
 void liveupdate_unregister_flb(struct liveupdate_file_handler *fh,
@@ -269,6 +318,17 @@ static inline void liveupdate_unregister_file_handler(struct liveupdate_file_han
 {
 }
 
+static inline int liveupdate_claim_file(struct liveupdate_file_handler *fh,
+					struct file *file)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline void liveupdate_unclaim_file(struct liveupdate_file_handler *fh,
+					   struct file *file)
+{
+}
+
 static inline int liveupdate_register_flb(struct liveupdate_file_handler *fh,
 					  struct liveupdate_flb *flb)
 {
diff --git a/include/uapi/linux/liveupdate.h b/include/uapi/linux/liveupdate.h
index 1644c502521e0..57a3c129d5a9d 100644
--- a/include/uapi/linux/liveupdate.h
+++ b/include/uapi/linux/liveupdate.h
@@ -127,6 +127,8 @@ struct liveupdate_ioctl_retrieve_session {
  * @size:  Input; sizeof(struct liveupdate_session_preserve_fd)
  * @fd:    Input; The user-space file descriptor to be preserved.
  * @token: Input; An opaque, unique token for preserved resource.
+ * @arg:   Input; User-space pointer to a file-handler-specific argument
+ *         structure starting with a 32-bit size field, or 0 if unused.
  *
  * Holds parameters for preserving a file descriptor.
  *
@@ -150,6 +152,7 @@ struct liveupdate_session_preserve_fd {
 	__u32		size;
 	__s32		fd;
 	__aligned_u64	token;
+	__aligned_u64	arg;
 };
 
 #define LIVEUPDATE_SESSION_PRESERVE_FD					\
@@ -161,6 +164,8 @@ struct liveupdate_session_preserve_fd {
  * @fd:    Output; The new file descriptor representing the fully restored
  *         kernel resource.
  * @token: Input; An opaque, token that was used to preserve the resource.
+ * @arg:   Input; User-space pointer to a file-handler-specific argument
+ *         structure starting with a 32-bit size field, or 0 if unused.
  *
  * Retrieve a previously preserved file descriptor.
  *
@@ -180,6 +185,7 @@ struct liveupdate_session_retrieve_fd {
 	__u32		size;
 	__s32		fd;
 	__aligned_u64	token;
+	__aligned_u64	arg;
 };
 
 #define LIVEUPDATE_SESSION_RETRIEVE_FD					\
diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index 3c1c86ff14d69..e3bfdbc6baedc 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -112,6 +112,7 @@
 #include <linux/xarray.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <linux/uaccess.h>
 #include "luo_internal.h"
 
 static LIST_HEAD(luo_file_handler_list);
@@ -176,6 +177,36 @@ static unsigned long luo_get_id(struct liveupdate_file_handler *fh,
 	return fh->ops->get_id ? fh->ops->get_id(file) : (unsigned long)file;
 }
 
+/**
+ * liveupdate_claim_file - Claim a file in the LUO preserved files table.
+ * @fh:   The file handler claiming @file.
+ * @file: The file to claim.
+ *
+ * File handlers whose .retrieve() callback restores state into an existing
+ * user-supplied &struct file (rather than allocating a new one) should call
+ * this before modifying @file to ensure @file is not already managed by LUO.
+ *
+ * Return: 0 on success, -EBUSY if @file is already managed by LUO, or a
+ *         negative errno on allocation failure.
+ */
+int liveupdate_claim_file(struct liveupdate_file_handler *fh,
+			  struct file *file)
+{
+	return xa_insert(&luo_preserved_files, luo_get_id(fh, file),
+			 file, GFP_KERNEL);
+}
+
+/**
+ * liveupdate_unclaim_file - Release a claimed file from the LUO preserved files table.
+ * @fh:   The file handler that claimed @file.
+ * @file: The file to release.
+ */
+void liveupdate_unclaim_file(struct liveupdate_file_handler *fh,
+			     struct file *file)
+{
+	xa_erase(&luo_preserved_files, luo_get_id(fh, file));
+}
+
 static bool luo_token_is_used(struct luo_file_set *file_set, u64 token)
 {
 	struct luo_file *iter;
@@ -188,11 +219,45 @@ static bool luo_token_is_used(struct luo_file_set *file_set, u64 token)
 	return false;
 }
 
+static int luo_copy_user_arg(u64 user_arg, const void **argp,
+			     const struct liveupdate_arg_spec *spec)
+{
+	void *karg __free(kfree) = NULL;
+	void __user *uptr;
+	u32 user_size;
+	int err;
+
+	if (!user_arg)
+		return 0;
+	if (!spec->size)
+		return -EOPNOTSUPP;
+
+	uptr = u64_to_user_ptr(user_arg);
+	if (get_user(user_size, (u32 __user *)uptr))
+		return -EFAULT;
+	if (user_size < spec->min_size)
+		return -EINVAL;
+	if (user_size > PAGE_SIZE)
+		return -E2BIG;
+
+	karg = kmalloc(spec->size, GFP_KERNEL);
+	if (!karg)
+		return -ENOMEM;
+
+	err = copy_struct_from_user(karg, spec->size, uptr, user_size);
+	if (err)
+		return err;
+
+	*argp = no_free_ptr(karg);
+	return 0;
+}
+
 /**
  * luo_preserve_file - Initiate the preservation of a file descriptor.
  * @file_set: The file_set to which the preserved file will be added.
  * @token:    A unique, user-provided identifier for the file.
  * @fd:       The file descriptor to be preserved.
+ * @arg:      User-space pointer to the handler argument structure, or 0.
  *
  * This function orchestrates the first phase of preserving a file. Upon entry,
  * it takes a reference to the 'struct file' via fget(), effectively making LUO
@@ -208,9 +273,11 @@ static bool luo_token_is_used(struct luo_file_set *file_set, u64 token)
  *    (allocates if needed).
  * 3. Iterates through registered handlers, calling can_preserve() to find one
  *    compatible with the given @fd.
- * 4. Calls the handler's .preserve() operation, which saves the file's state
+ * 4. Copies the user argument structure (if @arg is non-zero) according to the
+ *    handler's parg specification.
+ * 5. Calls the handler's .preserve() operation, which saves the file's state
  *    and returns an opaque private data handle.
- * 5. Adds the new instance to the file_set's internal list.
+ * 6. Adds the new instance to the file_set's internal list.
  *
  * On success, LUO takes a reference to the 'struct file' and considers it
  * under its management until it is unpreserved or finished.
@@ -225,10 +292,12 @@ static bool luo_token_is_used(struct luo_file_set *file_set, u64 token)
  *         -EBADF if the file descriptor is invalid.
  *         -ENOSPC if the file_set is full.
  *         -ENOENT if no compatible handler is found.
+ *         -EOPNOTSUPP if @arg is non-zero and the handler does not accept an arg.
  *         -ENOMEM on memory allocation failure.
  *         Other erros might be returned by .preserve().
  */
-int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
+int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd,
+		      u64 arg)
 {
 	struct liveupdate_file_op_args args = {0};
 	struct liveupdate_file_handler *fh;
@@ -264,10 +333,14 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
 	if (err)
 		goto err_fput;
 
+	err = luo_copy_user_arg(arg, &args.arg, &fh->ops->parg);
+	if (err)
+		goto err_module_put;
+
 	err = xa_insert(&luo_preserved_files, luo_get_id(fh, file),
 			file, GFP_KERNEL);
 	if (err)
-		goto err_module_put;
+		goto err_free_arg;
 
 	err = luo_flb_file_preserve(fh);
 	if (err)
@@ -290,6 +363,7 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
 	if (err)
 		goto err_kfree;
 
+	kfree(args.arg);
 	luo_file->serialized_data = args.serialized_data;
 	luo_file->private_data = args.private_data;
 	list_add_tail(&luo_file->list, &file_set->files_list);
@@ -303,6 +377,8 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
 	luo_flb_file_unpreserve(fh);
 err_erase_xa:
 	xa_erase(&luo_preserved_files, luo_get_id(fh, file));
+err_free_arg:
+	kfree(args.arg);
 err_module_put:
 	module_put(fh->ops->owner);
 err_fput:
@@ -533,6 +609,7 @@ void luo_file_unfreeze(struct luo_file_set *file_set,
  * luo_retrieve_file - Restores a preserved file from a file_set by its token.
  * @file_set: The file_set from which to retrieve the file.
  * @token:    The unique token identifying the file to be restored.
+ * @arg:      User-space pointer to the handler argument structure, or 0.
  * @filep:    Output parameter; on success, this is populated with a pointer
  *            to the newly retrieved 'struct file'.
  *
@@ -552,9 +629,10 @@ void luo_file_unfreeze(struct luo_file_set *file_set,
  *          kernel.
  * Return: 0 on success. Returns a negative errno on failure:
  *         -ENOENT if no file with the matching token is found.
+ *         -EOPNOTSUPP if @arg is non-zero and the handler does not accept an arg.
  *         Any error code returned by the handler's .retrieve() op.
  */
-int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
+int luo_retrieve_file(struct luo_file_set *file_set, u64 token, u64 arg,
 		      struct file **filep)
 {
 	struct liveupdate_file_op_args args = {0};
@@ -591,9 +669,14 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 		return 0;
 	}
 
+	err = luo_copy_user_arg(arg, &args.arg, &luo_file->fh->ops->rarg);
+	if (err)
+		return err;
+
 	args.handler = luo_file->fh;
 	args.serialized_data = luo_file->serialized_data;
 	err = luo_file->fh->ops->retrieve(&args);
+	kfree(args.arg);
 	if (err) {
 		/* Keep the error code for later use. */
 		luo_file->retrieve_status = err;
@@ -604,9 +687,9 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 	/* Get reference so we can keep this file in LUO until finish */
 	get_file(luo_file->file);
 
-	WARN_ON(xa_insert(&luo_preserved_files,
-			  luo_get_id(luo_file->fh, luo_file->file),
-			  luo_file->file, GFP_KERNEL));
+	if (xa_load(&luo_preserved_files,
+		    luo_get_id(luo_file->fh, luo_file->file)) != luo_file->file)
+		WARN_ON(liveupdate_claim_file(luo_file->fh, luo_file->file));
 
 	*filep = luo_file->file;
 	luo_file->retrieve_status = 1;
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index b42369c3b1f30..3bd9ef442934e 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -87,13 +87,14 @@ int __init luo_session_setup_incoming(u64 sessions_pa);
 int luo_session_serialize(void);
 int luo_session_deserialize(void);
 
-int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd);
+int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd,
+		      u64 arg);
 void luo_file_unpreserve_files(struct luo_file_set *file_set);
 int luo_file_freeze(struct luo_file_set *file_set,
 		    struct luo_file_set_ser *file_set_ser);
 void luo_file_unfreeze(struct luo_file_set *file_set,
 		       struct luo_file_set_ser *file_set_ser);
-int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
+int luo_retrieve_file(struct luo_file_set *file_set, u64 token, u64 arg,
 		      struct file **filep);
 int luo_file_finish(struct luo_file_set *file_set);
 int luo_file_deserialize(struct luo_file_set *file_set,
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 403906937bc0f..74f8a1bf1da8c 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -284,7 +284,8 @@ static int luo_session_preserve_fd(struct luo_session *session,
 	if (session->frozen)
 		return -EBUSY;
 
-	err = luo_preserve_file(&session->file_set, argp->token, argp->fd);
+	err = luo_preserve_file(&session->file_set, argp->token, argp->fd,
+				argp->arg);
 	if (err)
 		return err;
 
@@ -307,7 +308,8 @@ static int luo_session_retrieve_fd(struct luo_session *session,
 		return argp->fd;
 
 	mutex_lock(&session->mutex);
-	err = luo_retrieve_file(&session->file_set, argp->token, &file);
+	err = luo_retrieve_file(&session->file_set, argp->token, argp->arg,
+				&file);
 	mutex_unlock(&session->mutex);
 	if (err < 0)
 		goto err_put_fd;
-- 
2.56.0.385.gd3acb90ef8-goog

