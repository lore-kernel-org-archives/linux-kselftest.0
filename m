Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0D335E947
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Mar 2026 13:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772545988; cv=none; b=OXTGiWRinqStlepg8mYUHj34iUGNikCBhaXZa0feTCWnrPo75WvtsusNLgRcVVDEBJF0xg5YbIgfs3j/mwdSpE6iMGsRAmG0mnj+cQl7X/utKHLAN82FAzLZ1uvWf0ovobm4ifVXC8bfo6V+9+KxQ+VRE8Vm5U5bR3S4ICbvuY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772545988; c=relaxed/simple;
	bh=iSFNWc06H3raqgJgDDYUzTQRs2V7xM01vLG58BhNkmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lenEXtPGPLKfy4m425DHh3opNrmV6p7ImZJYLG6fLVmN06XSPfVq8H2xURm3UTz2RRJIgV1dLFRURog+weRvDAVIHBvwNwaTvtHY7kJMrls1D3rzkR6WK/5kBcXJdRNi1V3QE3heA4tEP99xBs2pLKQgLlAvRvhbWHCuZUfX4X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mYG8Vaf6; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mYG8Vaf6"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8274936d2c0so5584525b3a.3
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Mar 2026 05:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772545987; x=1773150787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qUQQET4CboZXfpjCg6qExZ2BGX2KyTfT1q7il2Qu4FA=;
        b=mYG8Vaf6er89Bf13AgtaW1iJ0gMMXqY5eOMQo1O/An5d0oZQTHnIuQ8PHhnngXBWmX
         7JWJT+167gRS8h+QwH6DItK4q0LUvPJsREIwxQZh+tvSb/sydt2RY2/oTGIdN/gHgESP
         uJ7ln5zDGJqku1mxa3oe4/PYmisW6EIKOa1rBSJeUvB+i4ntA06r2zrQjsgKZfGi/4M7
         mtCln4kSk7LJ4rX5SoqIiZORqbA8xlqOh+52NfHTMrZW23d+xOpyklVNhj66LsgB5Ztm
         wznD7fkvhEI49U3cygji2tOKwNBfKifswt3MR8Wau2a7n/KhTiLf0kmKs1vWAp+lvKm+
         Nebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772545987; x=1773150787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qUQQET4CboZXfpjCg6qExZ2BGX2KyTfT1q7il2Qu4FA=;
        b=Z3yFRGH4WA8IJozniCQR/FTqqAqT6W6Kk0+UWWBmYfB76YEZwOaZJs+ER/Dww14WMn
         8a++9ELFwQOa9ZcmtZ17bMOiuAeJSvW9I5RlSLsjh8/5sHLPwfDGzdvKASQ65gP/T0VC
         oneZbqBP8M8t4hrDmGwTGe3Py0viHqsOWZ2gDlPNjPZKO2DyrTxeCXTRszAHdR8/WgSA
         Ba8gwTWHvAHAlBbi7qgXj2vxYZPB0TXXOHmSCmAGyGESANz/rKUc6CgAIZr2tmP5i6X0
         +ThGfR9/uCa2nsclJcOR0EnXr7XRKap8T2Uv6W1TBp1nI9iyh/i0R+axNhNVxl6PfzGT
         N/Pw==
X-Forwarded-Encrypted: i=1; AJvYcCU0XGmsTbinm5W7+Pt0OxwlJxa0eimPRoq0dZz7KhlZYkXDGqCV0elUEvHDLbwrgR+gK2c/hycoxIyGw942tcg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFibHR0l3xIXQ0AKs0Zp04w0VukCuPYkqqZWmFDz+EvmBIU7XP
	dWoQrAXYzWF9qSlGLNAUHVvvRPC0yuw92tfHNWGEWGEXMI7DNHITx3YH
X-Gm-Gg: ATEYQzxgY5YFneRlltCDcAlr4nQtHVCURctPRoX6yPqCq0gStMDAxymT5XcSSrEqhte
	+Vk+Ri1VNmesd7Q0FhuhwdQJvi47+IYdJNsI0wxe/Ri4SNJF6MNb4+7fDcw8NjWQLQNfdJgwmXb
	sHgUw+Bflia/pB3FdoeqYDl/qFQDTvClz8PXu7N9mddXJv2HftRxalUDdm9i9fxrRTxwcchKzKn
	un5oMMYEwpdKtsSJsez2/y99UtAZuZ4uR6VHLYtB8pEl9Gto5ERpB5jqj2dQqsgV7Epk7xfCQWI
	vC6X2Hn/mab63RzIof0+X2mRAQi5ljsuofhs2TVDlnWrWyFN8EQxbTm3dsBlsSUqPuXJs0hz9+V
	bRwy4K1wcSYDzI0qYOgA53HmVyrNNgLrlghn2pg3e15bz+1gSNouF+8HB9psbfe6yoDN1x5U8HX
	PN+4ixkXz+O50cJla5CD1J4Tvj4po/I/p/FX3vQF0p6n7Kyj+g
X-Received: by 2002:a05:6a20:c6c1:b0:35d:d477:a7e6 with SMTP id adf61e73a8af0-395c3a0c9acmr16875727637.13.1772545986758;
        Tue, 03 Mar 2026 05:53:06 -0800 (PST)
Received: from localhost.localdomain ([113.218.252.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa62147esm14689782a12.12.2026.03.03.05.52.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Mar 2026 05:53:06 -0800 (PST)
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
Subject: [PATCH v4 3/6] bpf: add bpf_list_add_impl to insert node after a given list node
Date: Tue,  3 Mar 2026 21:52:16 +0800
Message-ID: <20260303135219.33726-4-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260303135219.33726-1-pilgrimtao@gmail.com>
References: <20260303135219.33726-1-pilgrimtao@gmail.com>
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
 kernel/bpf/helpers.c  | 27 +++++++++++++++++++++++++++
 kernel/bpf/verifier.c | 14 ++++++++++----
 2 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index 19d88da8e694..488810da8f30 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -2497,6 +2497,32 @@ __bpf_kfunc struct bpf_list_node *bpf_list_back(struct bpf_list_head *head)
 	return (struct bpf_list_node *)h->prev;
 }
 
+__bpf_kfunc int bpf_list_add_impl(struct bpf_list_head *head,
+				  struct bpf_list_node *new,
+				  struct bpf_list_node *prev,
+				  void *meta__ign, u64 off)
+{
+	struct bpf_list_node_kern *kn = (void *)new, *kp = (void *)prev;
+	struct btf_struct_meta *meta = meta__ign;
+	struct list_head *n = &kn->list_head, *p = &kp->list_head;
+
+	if (unlikely(!head))
+		return -EINVAL;
+
+	if (WARN_ON_ONCE(READ_ONCE(kp->owner) != head))
+		return -EINVAL;
+
+	if (cmpxchg(&kn->owner, NULL, BPF_PTR_POISON)) {
+		__bpf_obj_drop_impl((void *)n - off,
+			meta ? meta->record : NULL, false);
+		return -EINVAL;
+	}
+
+	list_add(n, p);
+	WRITE_ONCE(kn->owner, head);
+	return 0;
+}
+
 __bpf_kfunc struct bpf_rb_node *bpf_rbtree_remove(struct bpf_rb_root *root,
 						  struct bpf_rb_node *node)
 {
@@ -4566,6 +4592,7 @@ BTF_ID_FLAGS(func, bpf_list_pop_back, KF_ACQUIRE | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_list_del, KF_ACQUIRE | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_list_front, KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_list_back, KF_RET_NULL)
+BTF_ID_FLAGS(func, bpf_list_add_impl)
 BTF_ID_FLAGS(func, bpf_task_acquire, KF_ACQUIRE | KF_RCU | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_task_release, KF_RELEASE)
 BTF_ID_FLAGS(func, bpf_rbtree_remove, KF_ACQUIRE | KF_RET_NULL)
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index c9557d3fb8dd..6dfd4afff1cf 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -12464,6 +12464,7 @@ enum special_kfunc_type {
 	KF_bpf_list_del,
 	KF_bpf_list_front,
 	KF_bpf_list_back,
+	KF_bpf_list_add_impl,
 	KF_bpf_cast_to_kern_ctx,
 	KF_bpf_rdonly_cast,
 	KF_bpf_rcu_read_lock,
@@ -12525,6 +12526,7 @@ BTF_ID(func, bpf_list_pop_back)
 BTF_ID(func, bpf_list_del)
 BTF_ID(func, bpf_list_front)
 BTF_ID(func, bpf_list_back)
+BTF_ID(func, bpf_list_add_impl)
 BTF_ID(func, bpf_cast_to_kern_ctx)
 BTF_ID(func, bpf_rdonly_cast)
 BTF_ID(func, bpf_rcu_read_lock)
@@ -13000,7 +13002,8 @@ static bool is_bpf_list_api_kfunc(u32 btf_id)
 	       btf_id == special_kfunc_list[KF_bpf_list_pop_back] ||
 	       btf_id == special_kfunc_list[KF_bpf_list_del] ||
 	       btf_id == special_kfunc_list[KF_bpf_list_front] ||
-	       btf_id == special_kfunc_list[KF_bpf_list_back];
+	       btf_id == special_kfunc_list[KF_bpf_list_back] ||
+	       btf_id == special_kfunc_list[KF_bpf_list_add_impl];
 }
 
 static bool is_bpf_rbtree_api_kfunc(u32 btf_id)
@@ -13122,7 +13125,8 @@ static bool check_kfunc_is_graph_node_api(struct bpf_verifier_env *env,
 	case BPF_LIST_NODE:
 		ret = (kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_front_impl] ||
 		       kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
-		       kfunc_btf_id == special_kfunc_list[KF_bpf_list_del]);
+		       kfunc_btf_id == special_kfunc_list[KF_bpf_list_del] ||
+		       kfunc_btf_id == special_kfunc_list[KF_bpf_list_add_impl]);
 		break;
 	case BPF_RB_NODE:
 		ret = (kfunc_btf_id == special_kfunc_list[KF_bpf_rbtree_remove] ||
@@ -14264,6 +14268,7 @@ static int check_kfunc_call(struct bpf_verifier_env *env, struct bpf_insn *insn,
 
 	if (meta.func_id == special_kfunc_list[KF_bpf_list_push_front_impl] ||
 	    meta.func_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
+	    meta.func_id == special_kfunc_list[KF_bpf_list_add_impl] ||
 	    meta.func_id == special_kfunc_list[KF_bpf_rbtree_add_impl]) {
 		release_ref_obj_id = regs[BPF_REG_2].ref_obj_id;
 		insn_aux->insert_off = regs[BPF_REG_2].off;
@@ -23230,13 +23235,14 @@ static int fixup_kfunc_call(struct bpf_verifier_env *env, struct bpf_insn *insn,
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
+		if (desc->func_id == special_kfunc_list[KF_bpf_list_add_impl] ||
+		    desc->func_id == special_kfunc_list[KF_bpf_rbtree_add_impl]) {
 			struct_meta_reg = BPF_REG_4;
 			node_offset_reg = BPF_REG_5;
 		}
-- 
2.50.1 (Apple Git-155)

