Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9644B34DCCC
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 11:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773660558; cv=none; b=OaWYt+zyDBJROLdpTpyPPVlc9MTS4ghpqHiZHwF+xazvjy8tHFl+vHSn3PZ+aCyIWNFulhRNh495xsO4UWn3qEmchfGTXYNITS84m5iM2rFyotkTRAWgoKSWzoDCRMN/Kdd1XiIpPHTmmOyniAiosV99P9TKi8OKFyOXSjDjd0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773660558; c=relaxed/simple;
	bh=X6NpjHI33SxFJZtV58lEW1oBuVxFCOVbuRWaUibfXDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k2BK6+3IVOCefRVDrGZQ1EXI+ZpNjgPPJYLDaPkshfFp8uvkvQFuJW5BwSNrr+2ndcKL5v4em7zNmmehiytvK3F4EGZzn3tBjUdUwPat0GdKTI3bTp2uZ/HJ8z9LvJmkEelPdLUUb+IZvvev68ep2VXn9w7DySU0++1P70Y+S54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDIu095M; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDIu095M"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c2af7d09533so3541084a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 04:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773660557; x=1774265357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xcdf8NjYRYFE5tIQAMhp6zvGC7XeDqC/XeKloLYP+1w=;
        b=UDIu095M5+CBbIhot34O5IZt9TCm4RWOVJCY3mcOFpqfQr2ymU2SO5wrOagnpN2Jr5
         Dpo09el23CakLIboz9Ow6mxjyZ8pryC8v2BJu7VHlKLCrTrxUwlqqyxJpvdvIIROo+7e
         ubq4iXRbNjuVygDfDCHz8xbBAynkTOJgbXn8xu1hArezT3yLzoTAmGNG/iAMv6kieDcW
         v3FzqsvJagorsYPfufdfVbya/eUOOgapaT3eC8ok0u06pnGZozdXxjDXhZb8R4+MDm7C
         twfxUa6tIAB0C0bg2lEExfHcqmkXPGUH34o/3hqmCyEVQ5cPztDSEZGcaMLEBcO+7W3e
         sXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773660557; x=1774265357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xcdf8NjYRYFE5tIQAMhp6zvGC7XeDqC/XeKloLYP+1w=;
        b=cPRPK12R5njQNI5GsL7HyT4L31xqdDirl7T3ztg+/8M23VyWRKJNvgIgAmiTk3l0gf
         a6AHFDAh/W0LwBYddQuDO12MYtQloLhqbMMlY7MGc7Ggmx8zAr+Kmlq/jZ8LQDnRBrVq
         ecfKpQY0GC1d8sfNOWy0WX6ihPqVExLCLVKqfKbrjJQ/Ui8nzONf3vbEoOrHW9gG6Xof
         NamzD9mWhmVLRnEXUXgrO+gdDbC4OCD3+CEi4ZpGM9kkVnAtHbIBVs9kjwWy6w4ysoTz
         WiAHZLAn0z5cXVYTybq6a0iim/Dc1FKBDWLNpL2Y67VUHIhWXHVSCwmFOuWKixMyiC+1
         KaYg==
X-Forwarded-Encrypted: i=1; AJvYcCV9brdzC0pQGMgSEQswS2S8KWMW1vK12quEZ3e6yhQUXMvRfq/3DYd+PCsalHlA4R5v7prA44Mfm2HKmqnBUfI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7iCZtCmlejDL0SHE+HnOlvrDb0tSrWuBrF2x6UVFDtrRTOLyC
	0OIpvonrj5KtgEuXoH4wlIaRc0RXsVfJT2VejAFXocIYV5UbdoTgYJhx
X-Gm-Gg: ATEYQzysC3aH5BbGlVHM7ARrVZcOLBP3/zqF3SIsfsNc3NiaW9PloE8I4BX1R4E6rnh
	Rz+VSvlgGCmXi+VX1I33mfEknzr/OiSC6geaBiVRAdI/law9fXlcgNDCrtLPnkOmzfpVOlLUmQh
	HqdeIFrVNdOy1Xbie7fifmE3i3CjfzizHXBlo8UrbV77YZieS9C1FsGhoX8ahiiIZlMtwRBC79l
	TIH+LCA1bgQR4xSIfmlsb+MsNnsv1mMXmvV/yoETYd8Y+BA+9A1U0VLbV3CB6Dhug+lxX6De9IS
	DF+SDPLiwzfz3dTCU90lfEWq0lcCZVLmL66F5XfN5p3VA1IEPt2pIZcm0nVUw6krDCRNxhJKudw
	fmj9uf5Oi+2ZNszJ7YToM9s8cdLgOiA4yTo9Ng1jyuf9YOQl0GfSKoGcsOLQ90zFAE8IMDgLxVT
	UzpUL6xv5CYxCnxVGyiWMJoT0vcF+zg9qi11SamTcpOL5MjRalz1BHJ24=
X-Received: by 2002:a05:6a21:6317:b0:398:a060:a967 with SMTP id adf61e73a8af0-398eca11578mr11470604637.11.1773660556858;
        Mon, 16 Mar 2026 04:29:16 -0700 (PDT)
Received: from localhost.localdomain ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7401588ecesm4684940a12.32.2026.03.16.04.29.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Mar 2026 04:29:16 -0700 (PDT)
From: Chengkaitao <pilgrimtao@gmail.com>
To: martin.lau@linux.dev,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	shuah@kernel.org,
	chengkaitao@kylinos.cn,
	linux-kselftest@vger.kernel.org
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v8 3/8] bpf: Introduce the bpf_list_del kfunc.
Date: Mon, 16 Mar 2026 19:28:38 +0800
Message-ID: <20260316112843.78657-4-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260316112843.78657-1-pilgrimtao@gmail.com>
References: <20260316112843.78657-1-pilgrimtao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kaitao Cheng <chengkaitao@kylinos.cn>

If a user holds ownership of a node in the middle of a list, they
can directly remove it from the list without strictly adhering to
deletion rules from the head or tail.

We have added an additional parameter bpf_list_head *head to
bpf_list_del, as the verifier requires the head parameter to
check whether the lock is being held.

This is typically paired with bpf_refcount. After calling
bpf_list_del, it is generally necessary to drop the reference to
the list node twice to prevent reference count leaks.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 kernel/bpf/helpers.c  | 11 +++++++++++
 kernel/bpf/verifier.c |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index e87b263c5fe6..dac346eb1e2f 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -2437,6 +2437,8 @@ static struct bpf_list_node *__bpf_list_del(struct bpf_list_head *head,
 	 */
 	if (unlikely(!h->next))
 		INIT_LIST_HEAD(h);
+
+	/* verifier to guarantee n is a list node rather than the head */
 	if (list_empty(h))
 		return NULL;
 
@@ -2463,6 +2465,14 @@ __bpf_kfunc struct bpf_list_node *bpf_list_pop_back(struct bpf_list_head *head)
 	return __bpf_list_del(head, h->prev);
 }
 
+__bpf_kfunc struct bpf_list_node *bpf_list_del(struct bpf_list_head *head,
+					       struct bpf_list_node *node)
+{
+	struct bpf_list_node_kern *kn = (void *)node;
+
+	return __bpf_list_del(head, &kn->list_head);
+}
+
 __bpf_kfunc struct bpf_list_node *bpf_list_front(struct bpf_list_head *head)
 {
 	struct list_head *h = (struct list_head *)head;
@@ -4549,6 +4559,7 @@ BTF_ID_FLAGS(func, bpf_list_push_front_impl)
 BTF_ID_FLAGS(func, bpf_list_push_back_impl)
 BTF_ID_FLAGS(func, bpf_list_pop_front, KF_ACQUIRE | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_list_pop_back, KF_ACQUIRE | KF_RET_NULL)
+BTF_ID_FLAGS(func, bpf_list_del, KF_ACQUIRE | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_list_front, KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_list_back, KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_task_acquire, KF_ACQUIRE | KF_RCU | KF_RET_NULL)
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 64c1f8343dfa..e928ad4290c7 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -12508,6 +12508,7 @@ enum special_kfunc_type {
 	KF_bpf_list_push_back_impl,
 	KF_bpf_list_pop_front,
 	KF_bpf_list_pop_back,
+	KF_bpf_list_del,
 	KF_bpf_list_front,
 	KF_bpf_list_back,
 	KF_bpf_cast_to_kern_ctx,
@@ -12568,6 +12569,7 @@ BTF_ID(func, bpf_list_push_front_impl)
 BTF_ID(func, bpf_list_push_back_impl)
 BTF_ID(func, bpf_list_pop_front)
 BTF_ID(func, bpf_list_pop_back)
+BTF_ID(func, bpf_list_del)
 BTF_ID(func, bpf_list_front)
 BTF_ID(func, bpf_list_back)
 BTF_ID(func, bpf_cast_to_kern_ctx)
@@ -12644,6 +12646,7 @@ static const enum special_kfunc_type bpf_list_api_kfuncs[] = {
 	KF_bpf_list_push_back_impl,
 	KF_bpf_list_pop_front,
 	KF_bpf_list_pop_back,
+	KF_bpf_list_del,
 	KF_bpf_list_front,
 	KF_bpf_list_back,
 };
@@ -12652,6 +12655,7 @@ static const enum special_kfunc_type bpf_list_api_kfuncs[] = {
 static const enum special_kfunc_type bpf_list_node_api_kfuncs[] = {
 	KF_bpf_list_push_front_impl,
 	KF_bpf_list_push_back_impl,
+	KF_bpf_list_del,
 };
 
 /* Kfuncs that take an rbtree node argument (bpf_rb_node *). */
-- 
2.50.1 (Apple Git-155)

