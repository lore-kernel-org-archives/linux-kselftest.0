Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D5C22A817
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Mar 2026 13:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772977611; cv=none; b=nnkC5MbJxUi4JSctG7IVwq/+STe4Tky7O0TNBJtPm/2nbdXHHRLRjkcFP7zlXQBg9iuolar4r5Wr6VupJsvqA/XDxF5cAypk4Mt5CCksVUGeJ3UlCsw88xZiyVgcWnsaxUL8ICB74BjHy/Lrp9iM28mJCnE+HxUT1z/PcKxoOPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772977611; c=relaxed/simple;
	bh=TryhRL/uyiBcF0xS7N76PWhRBXatsJzx9ww2XVRgX3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pCYVzFFa3LmtymlSlq2wbPt2+mmj9luz0SUI7A2Sr/0zcdPkmUyW28s0u9G/V2MfbuivyQ4Wnc+WGemYAIi78OnOZZMOCXgUVclcPiBwwPJ9WYRWo8E2pkFoHVD5qrKrT2cWJTTP33ORI7SWqJwtEg72RetWLSWKP0EuyPtLYWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+BZebWv; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+BZebWv"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8297e0b27e5so2387131b3a.1
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Mar 2026 06:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772977610; x=1773582410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aF8gwyBWdT2w+mKfu7Jf1DaykLIqQz7Y61RbBhsAuck=;
        b=h+BZebWvFI8GCT+0hRezjtfn2P5k/o1vqWASZhAa4W9BNygoKN76w9k9+Y2qbHSrDz
         oCibCvMJtF+CLHGN8714XZAauGVs6AMOWmfxiwA2wfCc7LO/D7Hmv8PBIJDTIorL8IQk
         nF5Pk8Gc+SGUifNB2BDL+5xX+ZvyfRblxvGFcPOyUR8al5tY5O1DX0U+AuOtGQK0Uw8I
         jXT5ZX9K/qMlpaBtx1ye75UA9mMiv0H5jygRfRIv2kDsitVlRwz64ZHhYuXo/Xp6evz7
         pqNUyh5p3WKFKNN9Q6J/q7nnmDzJAJOoGmdWbrJRjqS3xsrJ5TUV7W3mS/oNd2PpI1XS
         eYdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772977610; x=1773582410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aF8gwyBWdT2w+mKfu7Jf1DaykLIqQz7Y61RbBhsAuck=;
        b=dGgVchPBi6GrqoN2/PICllWP+qJ01G6ZFLwAC1xP9Q9lW1QGXTTMB9cj+tGosLflQ8
         sjMDyPexuV3Cu3FLNY4JG8nQC3giBY07jsR5IgjMOJSHVeBOHjXkVfikUV3nPnm0Fk1S
         xY0BMd3aYSh5zZiR11/OEzs26mQ1zvW4geRQC3Kg2eNt9Huf98I5q3Y40VRI/bESqD5Q
         qnkJPbaCHOdo2f3OdVgzEyYOoGOm5ULD6i4mbgucmNit4McaR/lkxNJbfvYnFGMjtou9
         ENPEBB2BCCIkJ5YouA9Y9PDS6ZPVBXVqfV8OTpRPwcnTFphWtxO35viF0kiN8TYnLbDV
         1vPg==
X-Forwarded-Encrypted: i=1; AJvYcCWL1J+eW3qfio/6GQ5cF/5EIvszzjfPujwah2jZLcXAc8nXEGOeeBLRp3oNkGoex1hdSPZ81yJXXGRhkL2QlEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWkd21lhXGLQJBcr4m5IY8s8if2oaWfBPmXi8J9FMk9EROibqZ
	hMUOW4A411B2cmNjCgrk+hsLGA8Xi6tJT4Vqwat6tk4wZ4Jtk00FgpSO
X-Gm-Gg: ATEYQzyM65jAUq8gdfdWigj1C50fTQT00/F3w6cgHgEAQT6nBHQXjydw9462yF+L7sv
	8p8aNJ85lYqkrI7A6Mf78ysJ5AN7028rN/npQ9ayX9eVtBRBAlPvXwrsLOMUWhee0Levl2FYoTt
	GqGOYEdmfRQ0OoVA9tPVIy5AL4+d+bGSRYZYcORnrBWYAUvt2nbozkzveHz1dbEqAGTQS+U1s6D
	xyxEGWouL8ll1OPgLrSCkcTXf7oKF4bQlaVN/7qTTPBekjONqcJU3JNbyuoVQnPD3YoO5RWIazj
	GVDE66z0ChUz2CMZhfalp58EeEM+ZwcULAeB4PrA/tDFhu3so1Yu5UYWUduFz1iQiXi4+tB9OXY
	RzE1p3479dpFTnRA85mE/8BdHvYPCubbL/7OBRXeutDmm0C3/nLDoX17DZ/NZSOKOnVqjIbaZ4U
	Z8yQ0c3R8buw2hUCkszjacW/N7zkQi9gb5S/HuZESRsXPmVZPx
X-Received: by 2002:a05:6a00:b83:b0:829:809e:8972 with SMTP id d2e1a72fcca58-829a2db6331mr7125950b3a.3.1772977610015;
        Sun, 08 Mar 2026 06:46:50 -0700 (PDT)
Received: from localhost.localdomain ([113.218.252.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4636968sm7095056b3a.9.2026.03.08.06.46.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Mar 2026 06:46:49 -0700 (PDT)
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
Subject: [PATCH bpf-next v7 1/5] bpf: Introduce the bpf_list_del kfunc.
Date: Sun,  8 Mar 2026 21:46:10 +0800
Message-ID: <20260308134614.29711-2-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260308134614.29711-1-pilgrimtao@gmail.com>
References: <20260308134614.29711-1-pilgrimtao@gmail.com>
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
 kernel/bpf/helpers.c  | 30 +++++++++++++++++++++++-------
 kernel/bpf/verifier.c |  6 +++++-
 2 files changed, 28 insertions(+), 8 deletions(-)

diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index 6eb6c82ed2ee..01b74c4ac00d 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -2426,20 +2426,23 @@ __bpf_kfunc int bpf_list_push_back_impl(struct bpf_list_head *head,
 	return __bpf_list_add(n, head, true, meta ? meta->record : NULL, off);
 }
 
-static struct bpf_list_node *__bpf_list_del(struct bpf_list_head *head, bool tail)
+static struct bpf_list_node *__bpf_list_del(struct bpf_list_head *head,
+					    struct list_head *n)
 {
-	struct list_head *n, *h = (void *)head;
+	struct list_head *h = (void *)head;
 	struct bpf_list_node_kern *node;
 
 	/* If list_head was 0-initialized by map, bpf_obj_init_field wasn't
 	 * called on its fields, so init here
 	 */
-	if (unlikely(!h->next))
+	if (unlikely(!h->next)) {
 		INIT_LIST_HEAD(h);
-	if (list_empty(h))
+		return NULL;
+	}
+
+	if (n == h)
 		return NULL;
 
-	n = tail ? h->prev : h->next;
 	node = container_of(n, struct bpf_list_node_kern, list_head);
 	if (WARN_ON_ONCE(READ_ONCE(node->owner) != head))
 		return NULL;
@@ -2451,12 +2454,24 @@ static struct bpf_list_node *__bpf_list_del(struct bpf_list_head *head, bool tai
 
 __bpf_kfunc struct bpf_list_node *bpf_list_pop_front(struct bpf_list_head *head)
 {
-	return __bpf_list_del(head, false);
+	struct list_head *h = (void *)head;
+
+	return __bpf_list_del(head, h->next);
 }
 
 __bpf_kfunc struct bpf_list_node *bpf_list_pop_back(struct bpf_list_head *head)
 {
-	return __bpf_list_del(head, true);
+	struct list_head *h = (void *)head;
+
+	return __bpf_list_del(head, h->prev);
+}
+
+__bpf_kfunc struct bpf_list_node *bpf_list_del(struct bpf_list_head *head,
+					       struct bpf_list_node *node)
+{
+	struct bpf_list_node_kern *kn = (void *)node;
+
+	return __bpf_list_del(head, &kn->list_head);
 }
 
 __bpf_kfunc struct bpf_list_node *bpf_list_front(struct bpf_list_head *head)
@@ -4545,6 +4560,7 @@ BTF_ID_FLAGS(func, bpf_list_push_front_impl)
 BTF_ID_FLAGS(func, bpf_list_push_back_impl)
 BTF_ID_FLAGS(func, bpf_list_pop_front, KF_ACQUIRE | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_list_pop_back, KF_ACQUIRE | KF_RET_NULL)
+BTF_ID_FLAGS(func, bpf_list_del, KF_ACQUIRE | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_list_front, KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_list_back, KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_task_acquire, KF_ACQUIRE | KF_RCU | KF_RET_NULL)
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 67c09b43a497..c9557d3fb8dd 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -12461,6 +12461,7 @@ enum special_kfunc_type {
 	KF_bpf_list_push_back_impl,
 	KF_bpf_list_pop_front,
 	KF_bpf_list_pop_back,
+	KF_bpf_list_del,
 	KF_bpf_list_front,
 	KF_bpf_list_back,
 	KF_bpf_cast_to_kern_ctx,
@@ -12521,6 +12522,7 @@ BTF_ID(func, bpf_list_push_front_impl)
 BTF_ID(func, bpf_list_push_back_impl)
 BTF_ID(func, bpf_list_pop_front)
 BTF_ID(func, bpf_list_pop_back)
+BTF_ID(func, bpf_list_del)
 BTF_ID(func, bpf_list_front)
 BTF_ID(func, bpf_list_back)
 BTF_ID(func, bpf_cast_to_kern_ctx)
@@ -12996,6 +12998,7 @@ static bool is_bpf_list_api_kfunc(u32 btf_id)
 	       btf_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
 	       btf_id == special_kfunc_list[KF_bpf_list_pop_front] ||
 	       btf_id == special_kfunc_list[KF_bpf_list_pop_back] ||
+	       btf_id == special_kfunc_list[KF_bpf_list_del] ||
 	       btf_id == special_kfunc_list[KF_bpf_list_front] ||
 	       btf_id == special_kfunc_list[KF_bpf_list_back];
 }
@@ -13118,7 +13121,8 @@ static bool check_kfunc_is_graph_node_api(struct bpf_verifier_env *env,
 	switch (node_field_type) {
 	case BPF_LIST_NODE:
 		ret = (kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_front_impl] ||
-		       kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_back_impl]);
+		       kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
+		       kfunc_btf_id == special_kfunc_list[KF_bpf_list_del]);
 		break;
 	case BPF_RB_NODE:
 		ret = (kfunc_btf_id == special_kfunc_list[KF_bpf_rbtree_remove] ||
-- 
2.50.1 (Apple Git-155)

