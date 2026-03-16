Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D833D18AFE
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 11:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773660573; cv=none; b=LRETyHJpce5sk3TSTfbN2TXDdcgPrK3LFIpwUcmC1apVTGBwvIvdDVT1CL1nYCVYHqyNCKaGw5ryLVUiCJvff3MDxxEayD6x6mN63LGkmEQ8aJJ2na0h9ZCcmia+AMmcwN/RBgtoVFEOM9gG98KL+iAANWjlGoRClqLW32Hziyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773660573; c=relaxed/simple;
	bh=f254u9m1QCRh+1RTnHbpIKWIkCtIaFhXm7XPT4JMgW0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M3jD9q7ccykMFslBVOJcK8ehbJCspoq54yTTzyJM7nfX89ofKrVG9GfWUbDvmtM2ZgelTBDB7qmuMFd98GSviWmpaYwokrgLI+cx1mCM8z7KkGbli9IxHHujryEvCZQsvw2ZapHJI7pS3huo8Z2u2kzTC8nl6bB3g22Ehz2yYHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQPRwHW0; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQPRwHW0"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-829abaaa92bso2862826b3a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Mar 2026 04:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773660571; x=1774265371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2EXT8xQIbLD8Uq3gaj+lgUvs/CfjmF64+/VehA8xmM=;
        b=IQPRwHW0hdmJVPw/QB5HYZNDRiS8IfS4WLz41X0HY2Wi8q71hSicH9jLwWCntcPxe4
         RiF3YoIXAi++m72YWJzYt/jzVQsQ/zWJdVcrwi6JD1IY6oy7/Ek5YOQXiusUo7tGDxJO
         bCvJo1v5OjpW+UaZN7dhS6XfJx3qWvq20sbck3xG9Ud6NDuKtLylJxLanOr1//J1Vwf1
         wPt/ky/KNhLkml5FdBKck+cQJW9ne8NiIKn4dXyCpv9sTMDqYf4/a/VNfGNV1pJAzyNV
         trgC+OXHldlww/0TJHygLmkC+RQ9ti/iIV0FUlqrwnYyU1pXHFYFZsblfJrmaQipglgL
         lJSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773660571; x=1774265371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W2EXT8xQIbLD8Uq3gaj+lgUvs/CfjmF64+/VehA8xmM=;
        b=W3EUpWkRY/ySv+1QiRjmTcpQ+aYa2/B7bGSgSmxvNEuWTlxK2VlwMPjlEJdl9Wpo2l
         2Yu+eosr6PiT0FURHqttvzeSrVz6vuIpg2xTNZnCUF4B8ChIIZ63KTTUmm62d1wOEoHn
         gdDa7BclqSA3NIeryXTlKeC4RfZXRQ4IK7DHWJuUO6JEt17R5IHnjdHqAujSgtGeVniP
         PMJtjXTrwjL0QYFoei/YwiD/1ur4mGLvquxgEarw1ess0ByNywBEa7vroHyF6X+tJAGV
         0scQAUca9WweBhbX9HnDkJgHVNKXUESPAP2t81gtlEwzlJs1V2lNnZyAO6/ytaHg4T3D
         z6HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhIOxWngP+290vUOgxtuf4WXF2S5snIta+RnjPgOyVv3ATDW+hgmcsJRTtD8vdcILPu8DmsQ6mFT/+RcT7wuY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx68KlxtxjcKMTPFJVNhZsiSfurdfo6PS9ZcDWodBE7UtFkTLVQ
	DHP/xEYZCH2IKC+NQeIE504dtdl6+PzuZLtCCEPzGYgO+cPqbJqzEHY4
X-Gm-Gg: ATEYQzxEXNkM+wtc7IVGVxQLz5JCOBz4f2RTKAV0899xp5111sziZBJo2sU4vA0QORX
	EGGeaRbqRTyza1vN+4NnseywwINsFy5h0+L6o9RogX0PwtvdBuy5Rir5zhqHHv0HJFVy76C3acM
	ktJ5IIomtkeDDh89NeHVpWcNmCjDpbMavTLRrLm2xcr3RVV8JUFoV98NO5oKUNeVQ8RwebLs8mB
	w/LPMRPeSQoT4HtFHhvxXEgISbVsfEwy+znyfeWMByc2v/ARr1uwG9U1PZWP0L6ySk3Kwu+KTos
	xF+tviqadTk4uhGZOZAJa/2X+8AWBAWW5ZS2Am/eLr2xquzZBujo8Njb/Fooi7Sfi4VeaLc1ZVf
	sGvFg7cUkyUm+VQauXnwT54wrvuJG3/kaXmLWJWUgavyaCKBeKz/pNpBovTj8N0+oYhbelxgdct
	FsewmX+5myIUs8BMRiNSjHVMzpl5HCaOwe4Knm6oXdKkqMchO/obBSb7A=
X-Received: by 2002:a05:6a21:7106:b0:398:c3c3:8686 with SMTP id adf61e73a8af0-398eca2d969mr10979592637.4.1773660571067;
        Mon, 16 Mar 2026 04:29:31 -0700 (PDT)
Received: from localhost.localdomain ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7401588ecesm4684940a12.32.2026.03.16.04.29.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Mar 2026 04:29:30 -0700 (PDT)
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
Subject: [PATCH bpf-next v8 5/8] bpf: Add bpf_list_add_impl to insert node after a given list node
Date: Mon, 16 Mar 2026 19:28:40 +0800
Message-ID: <20260316112843.78657-6-pilgrimtao@gmail.com>
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

Add a new kfunc bpf_list_add_impl(head, new, prev, meta, off) that
inserts 'new' after 'prev' in the BPF linked list. Both must be in
the same list; 'prev' must already be in the list. The new node must
be an owning reference (e.g. from bpf_obj_new); the kfunc consumes
that reference and the node becomes non-owning once inserted.

We have added an additional parameter bpf_list_head *head to
bpf_list_add_impl, as the verifier requires the head parameter to
check whether the lock is being held.

Returns 0 on success, -EINVAL if 'prev' is not in a list or 'new'
is already in a list (or duplicate insertion). On failure, the
kernel drops the passed-in node.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 kernel/bpf/helpers.c  | 14 ++++++++++++++
 kernel/bpf/verifier.c | 13 +++++++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index a9665f97b3bc..dc4f8b4eec01 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -2438,6 +2438,19 @@ __bpf_kfunc int bpf_list_push_back_impl(struct bpf_list_head *head,
 	return __bpf_list_add(new, head, &h->prev, meta ? meta->record : NULL, off);
 }
 
+__bpf_kfunc int bpf_list_add_impl(struct bpf_list_head *head,
+				  struct bpf_list_node *new,
+				  struct bpf_list_node *prev,
+				  void *meta__ign, u64 off)
+{
+	struct bpf_list_node_kern *kn = (void *)new, *kp = (void *)prev;
+	struct btf_struct_meta *meta = meta__ign;
+	struct list_head *prev_ptr = &kp->list_head;
+
+	return __bpf_list_add(kn, head, &prev_ptr,
+			      meta ? meta->record : NULL, off);
+}
+
 static struct bpf_list_node *__bpf_list_del(struct bpf_list_head *head,
 					    struct list_head *n)
 {
@@ -4574,6 +4587,7 @@ BTF_ID_FLAGS(func, bpf_list_pop_back, KF_ACQUIRE | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_list_del, KF_ACQUIRE | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_list_front, KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_list_back, KF_RET_NULL)
+BTF_ID_FLAGS(func, bpf_list_add_impl)
 BTF_ID_FLAGS(func, bpf_task_acquire, KF_ACQUIRE | KF_RCU | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_task_release, KF_RELEASE)
 BTF_ID_FLAGS(func, bpf_rbtree_remove, KF_ACQUIRE | KF_RET_NULL)
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index e928ad4290c7..98ddb370feb5 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -12506,6 +12506,7 @@ enum special_kfunc_type {
 	KF_bpf_refcount_acquire_impl,
 	KF_bpf_list_push_front_impl,
 	KF_bpf_list_push_back_impl,
+	KF_bpf_list_add_impl,
 	KF_bpf_list_pop_front,
 	KF_bpf_list_pop_back,
 	KF_bpf_list_del,
@@ -12567,6 +12568,7 @@ BTF_ID(func, bpf_obj_drop_impl)
 BTF_ID(func, bpf_refcount_acquire_impl)
 BTF_ID(func, bpf_list_push_front_impl)
 BTF_ID(func, bpf_list_push_back_impl)
+BTF_ID(func, bpf_list_add_impl)
 BTF_ID(func, bpf_list_pop_front)
 BTF_ID(func, bpf_list_pop_back)
 BTF_ID(func, bpf_list_del)
@@ -12644,6 +12646,7 @@ BTF_ID(func, bpf_stream_print_stack)
 static const enum special_kfunc_type bpf_list_api_kfuncs[] = {
 	KF_bpf_list_push_front_impl,
 	KF_bpf_list_push_back_impl,
+	KF_bpf_list_add_impl,
 	KF_bpf_list_pop_front,
 	KF_bpf_list_pop_back,
 	KF_bpf_list_del,
@@ -12655,6 +12658,7 @@ static const enum special_kfunc_type bpf_list_api_kfuncs[] = {
 static const enum special_kfunc_type bpf_list_node_api_kfuncs[] = {
 	KF_bpf_list_push_front_impl,
 	KF_bpf_list_push_back_impl,
+	KF_bpf_list_add_impl,
 	KF_bpf_list_del,
 };
 
@@ -14345,6 +14349,7 @@ static int check_kfunc_call(struct bpf_verifier_env *env, struct bpf_insn *insn,
 
 	if (meta.func_id == special_kfunc_list[KF_bpf_list_push_front_impl] ||
 	    meta.func_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
+	    meta.func_id == special_kfunc_list[KF_bpf_list_add_impl] ||
 	    meta.func_id == special_kfunc_list[KF_bpf_rbtree_add_impl]) {
 		release_ref_obj_id = regs[BPF_REG_2].ref_obj_id;
 		insn_aux->insert_off = regs[BPF_REG_2].var_off.value;
@@ -23357,13 +23362,17 @@ static int fixup_kfunc_call(struct bpf_verifier_env *env, struct bpf_insn *insn,
 		*cnt = 3;
 	} else if (desc->func_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
 		   desc->func_id == special_kfunc_list[KF_bpf_list_push_front_impl] ||
+		   desc->func_id == special_kfunc_list[KF_bpf_list_add_impl] ||
 		   desc->func_id == special_kfunc_list[KF_bpf_rbtree_add_impl]) {
 		struct btf_struct_meta *kptr_struct_meta = env->insn_aux_data[insn_idx].kptr_struct_meta;
 		int struct_meta_reg = BPF_REG_3;
 		int node_offset_reg = BPF_REG_4;
 
-		/* rbtree_add has extra 'less' arg, so args-to-fixup are in diff regs */
-		if (desc->func_id == special_kfunc_list[KF_bpf_rbtree_add_impl]) {
+		/* list/rbtree_add_impl have an extra arg (prev/less),
+		 * so args-to-fixup are in different regs.
+		 */
+		if (desc->func_id == special_kfunc_list[KF_bpf_list_add_impl] ||
+		    desc->func_id == special_kfunc_list[KF_bpf_rbtree_add_impl]) {
 			struct_meta_reg = BPF_REG_4;
 			node_offset_reg = BPF_REG_5;
 		}
-- 
2.50.1 (Apple Git-155)

