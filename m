Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6FA503BF3
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 09:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057120; cv=none; b=hm4VF+yfXP64s7NLCYoIqGaiqYXWW0+f3BBRmL2syvN78acboLnuioGHEf25EDeQg5luOuZs3ymxgFy2gPEO7F4p1qnSRzXy9b398WbL/KD420V3Zz5lTGnAzthBRmGcDYpv+p1V3aRa8aI06fmdvftprmBWATxzoaO7eOBI+Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057120; c=relaxed/simple;
	bh=Apfp6mXRRFleB2bcMCA2n31O1ll/7yjzWDXuHQt4Jhs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SbetcypQkAId3HmD1+mEDtASbkvJiCcryCuQOc/Ts9VsnsneIwPpoh/FgdaI1Lp83gUs0adLRu8aw/7rXhFFFU6ACdRjnAdV3QsDIGxkFQFjhMqnAI5/3NlAkZgKQ6Z59dfnWmk7naZEZOo0B+r+clan0HEJdcvrm0Zg1Mry8wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=OlASajq5; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="OlASajq5"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5e189660cbdso1043026e0c.1
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 02:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792057113; x=1792661913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rZelI1I51j7rf9JD3PGtzWapemkkjt987366KVri7bQ=;
        b=OlASajq5ZX9BAdWGnnHfivx9Cb/zAs2zReuujZRm45/xPjQb1FegUg+eno4/cNEsFA
         GXlXAjfLGmkPr8pJj3cSlRkj4XacVJtypHZgI1oGsCeqexSAxIVjo7TwhYiKJTijDTBr
         iMsp9NlsqnwvoVPdQpP4XB7wr+ESR5e4U9ZOc0lIxf9ix5dDl/uwh7khazcXdW/+Uw2G
         vxnMCOWhekREeX6h2Z33XoDSh3+H0EgyrnwmzBhU7GSyJg4GOr5LMLAfYwMC/Bpxym6O
         4s3n0KJLQEDrfjXopaOWNPdrCQ2jncVv/ZQs7K56afCXqqMPjWFSz5nIbxDLk+iQiSpj
         iB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057113; x=1792661913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=rZelI1I51j7rf9JD3PGtzWapemkkjt987366KVri7bQ=;
        b=Krm+ptkOKM60i7GFanblgjSa4e2nJK2snUmIw1x4O0uFB3KkqRjhmeqZSOi1o72x9I
         vjynASQGvGKthOUEvs11DAPrucV9p12GsG5GxTxE3bJu/mvsbSynoP2ozbbNV6w3eJ/s
         qtgzubSiTRXYdgWBKMxaSl1bORO8j+3pI0pU1GpvXlKYsG5PDjQvlqEDYoYqHgRjjkyf
         YGa4fOi2cYlbYt+k1jG8kXTVM/9mtIDb8c3jTzpan9/wVQD4g9RjnYreRqo4WkS7qzLG
         qCSChN/kDprFGsFmZqF8t+fOdi4vQhfhqHvI1LL1wtL7Z/c9e7POLYAgYTlzLKhWy5Lo
         hvzQ==
X-Gm-Message-State: AFq9FYKW6V2wBUf80/NdgCFsfhCBkudmgKgl4icvKXOqgeD63dwmFQvV
	ehgdpOt6A8ou6wuLLgQkeo+erd+OASIC1zSLiLLZPdQ2Hh1yD35fFpwFgo72kQhl1pZET+WbbOy
	z+xji
X-Gm-Gg: AYBFou0O2YMoJAO7CgqaxGPzNMvbMc2Kn7zcjoFWWclughEgc70YpmQjciBuxIpf8fe
	nKUutYqFccxzkyg8ndBnAoNpVF1HcenlQOg8HY+VbCAuoIGAFexM93R48qJADkMu8jq9EsQ5TIt
	JgnXGPehVeUJ4lqS2OWX9SMxyuI7yN0TdZyErFS21h3926owTzGz4iNSbwk057USm3A3adXSkVP
	LAJGNVQ0VFoU9FsT4TrDPDtvzDOE6RPo2doyJpSrSYaeO6P4O8gbxhXXUvbaQ5Ns2m5F9mM9OIs
	jIQHliF6XKlGpfOnXjOXfq0XDPx2NeEeYR+9v4dpu8mRUxtWmLbu98GRxzC373pQiAF5krOgYul
	xx2qCe4Q/DFWq088y/nQmX3RDqpQeFb04+7bs/RqNdAL4gmrDSxrZZafTPbNtjjtyPi/vvEks5r
	Z1nfOTMxyMcbnlO5oyEmKDELlev4jXKxYpeo1WzBezIOre7fEomYKLCbGYlK2DAewMeNfuiGdje
	oHqkvJpnWefDHW0rCm4nVxEFd7QV+pZxJ14tmP3CR7/0olClT1NoYihz4aOZWBjzjl9E9aE+/RE
	KnHmyg1lcLPY5woaTM3TJ/YB5DuiLw==
X-Received: by 2002:a05:6102:2924:b0:7cc:56a:58d2 with SMTP id ada2fe7eead31-7cc056a64bcmr366185137.31.1792057113624;
        Thu, 15 Oct 2026 02:38:33 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003d37009sm12275672241.2.2026.10.15.02.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:38:33 -0700 (PDT)
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
Subject: [PATCH v1 5/7] liveupdate: Allow file handlers to mark retrieve failures as retryable
Date: Thu, 15 Oct 2026 05:38:14 -0400
Message-ID: <20261015093816.2438942-6-pasha.tatashin@soleen.com>
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

When luo_retrieve_file() invokes a handler's .retrieve() callback and it
returns an error, LUO currently records the error in
luo_file->retrieve_status and blocks any subsequent retrieve attempts.
This is necessary when the handler has already partially consumed or
freed the preserved KHO state.

However, with user arguments passed to .retrieve(), a handler may fail
early while validating caller-supplied parameters (such as a missing
argument, an invalid or read-only target file descriptor, or a non-empty
target file) before touching any preserved KHO state. In such cases,
userspace should be able to fix the argument and retry
LIVEUPDATE_SESSION_RETRIEVE_FD, and if the file is never retrieved,
.finish() must still run to release the preserved KHO state.

Add a retryable output flag to struct liveupdate_file_op_args. When a
handler sets args->retryable = true on error, luo_retrieve_file() leaves
luo_file->retrieve_status at 0 so the retrieve operation can be retried
and .finish() will still clean up the unconsumed preserved state if the
session is finished without retrieving the file.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/liveupdate.h      | 11 ++++++++---
 include/uapi/linux/liveupdate.h |  7 ++++---
 kernel/liveupdate/luo_file.c    | 20 ++++++++++++++------
 3 files changed, 26 insertions(+), 12 deletions(-)

diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
index 52d3f453ae011..4e1f0f4cbd6fb 100644
--- a/include/linux/liveupdate.h
+++ b/include/linux/liveupdate.h
@@ -57,9 +57,13 @@ struct liveupdate_arg_spec {
  * @handler:          The file handler being called.
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
@@ -81,6 +85,7 @@ struct liveupdate_arg_spec {
 struct liveupdate_file_op_args {
 	struct liveupdate_file_handler *handler;
 	int retrieve_status;
+	bool retryable;
 	struct file *file;
 	u64 serialized_data;
 	void *private_data;
diff --git a/include/uapi/linux/liveupdate.h b/include/uapi/linux/liveupdate.h
index 57a3c129d5a9d..0ab28fd58fa5f 100644
--- a/include/uapi/linux/liveupdate.h
+++ b/include/uapi/linux/liveupdate.h
@@ -175,9 +175,10 @@ struct liveupdate_session_preserve_fd {
  * associated with the token and populates the @fd field with a new file
  * descriptor referencing the restored resource in the current (new) kernel.
  * This operation must be performed *before* signaling completion via
- * %LIVEUPDATE_IOCTL_FINISH. If a retrieve of a token fails, subsequent
- * attempts to retrieve the token fail with the same error code. Failed
- * retrieves are not retried.
+ * %LIVEUPDATE_IOCTL_FINISH. If a retrieve of a token fails after consuming
+ * preserved state, subsequent attempts to retrieve the token fail with the
+ * same error code. Early argument or target validation errors before
+ * preserved state is consumed leave the token intact and may be retried.
  *
  * Return: 0 on success, negative error code on failure (e.g., invalid token).
  */
diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index e3bfdbc6baedc..5c2ffec696885 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -138,9 +138,10 @@ static DEFINE_XARRAY(luo_preserved_files);
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
@@ -620,7 +621,9 @@ void luo_file_unfreeze(struct luo_file_set *file_set,
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
@@ -678,8 +681,13 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token, u64 arg,
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
2.56.0.385.gd3acb90ef8-goog

