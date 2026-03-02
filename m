Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5722E376491
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 12:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455265; cv=none; b=U/9+46uMpTjM3vmg/XAMgxxx2CVBaRB+VGWCy12ZiYlubg7YltWutJ/fNRe+zEB3dR2z41TdrspVSL9Hf7Ioqijw+tbfoAr3n8X8y01uS4c8GzrBMpRy0/csEZOkd0MQSp8BlX0UEhbZ9DBfdpMCN/LLf1UYKYwUdQ0JaKc9oh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455265; c=relaxed/simple;
	bh=OARCp2c0bNabt09S6boIe4Fa5ckg0ng3LQnP7arffbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lP1Jh/yYpPv5YfbEXNGiDhg0TkeSFiwA8Foi6zp4psISGejjlgy3wlvhNX7ZAKjA3wDZ2FG2sirnHpgv2T5Ls5X+s3AbZjjuBfpGeRNR0ceLJFztz4w1caodnFhYYEv+JdxgVJsV2Y+yeq1/A8isiDT0S6ATDR16T5pybRnMxjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fakBtF/D; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fakBtF/D"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ad9a9be502so30429535ad.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Mar 2026 04:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772455264; x=1773060064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bd0q35RQwe48UzQhss6Qsj2Pe6t56hcfaCjZ9c765uA=;
        b=fakBtF/DxUwYGww3SkpQS04cAsQ70E6W5diFDhAcN74/OvkRwAk7mJXeB3YQdYEJq5
         eMX3F+ebA1yGyIlzvYAddXSGvfV2lEDs36/Ak3kqiWS8F1K5ZI1WDPiL/E4jjgv2ike0
         Vr3K2MsDxOBTvd/THm5blqgwSVdJ7HNysRjdfJLbbtdOz/GmchRD0lbIzesHmrg++Rwj
         ZQ/y2sYuttJfAUYx524EyM10+BIL7AX4QK/LVE59KCHzJsDk8iJsA4exyDWuFFapimdg
         HGJQy/nn2lronDgei6C6LOIJC8n2cEN3G4cxvOBPWPhRvAsq4labj1WbawDv8JmyLHDK
         Zejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455264; x=1773060064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bd0q35RQwe48UzQhss6Qsj2Pe6t56hcfaCjZ9c765uA=;
        b=vPNMy/520muIkxcTjVRXyrSrcdqrQ4B27+RAbYl8+ZWLcM7JL4MaFTmLBkq7VVro2N
         C7O8OWBlQ+moZgA9b/y6XutDvj2xNsingUEcVtszKwNdIeMdzefbrvIsnC7inf92vEfS
         xfiFPuP4mBtKtXkfcOlp5J53mcRuGxQT1VC/JDeE9TTUYy8B0KIrJD01eBPlVd74QtYr
         GTOoiDcpJ64xoq0K3eO+QKwL1pbU6sIgs7pi/XRfkIfWzfmrPxHchhIPwr5c9hW4MORc
         m5K2cRuBxrUvdp5FEO5ofaMDHLRRZoCYVwcEDhiLwr2ySpjltnDEoJg244x3ctUFCPKx
         9VGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGI+PVOldH5Li2H/yVL3oW5g8uvf6Gxj6+CvBrlMNLVOhM1cjne2vfmNite5OkNQmWkjIFWwDuGu9CJl0dcZo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzH4Mt7rTKqGNki+8HYe3mYPya6GUE7OXBwWbDsue24V86SS9bK
	qk1VrTcQ+fKkrFSJ3x+8oXfxlzZ3FGRkEduBKzLhItgS1zMi2SrvOdfQ
X-Gm-Gg: ATEYQzzKDmCO9j0tAd2Xa+ZRnuetpD9Qgx/oWYt1DeMw0Rf2ZnR8CwNu4/EWy1+rSfR
	czfFXjat7DnPJnZNZh3t/vo4kPFtH6mPfRplx5S6ZOh91RmZi4jKrnIlVTQa1EAE+W5aZr+KHcH
	y9XcT2+pKmL51tei+cT3LdwkeXM+GxAt0brXqAe40QGgCrJavMK6LzMRKMFX94GttlNH7uwxtdh
	ZsnkQzxrs/vWdmkdVHxhYcR/H3baImytPHTb2jAlvXMIWNsTUhoRmmoDS9GgnLhoybpTG8zBiuN
	MiR4Ltk7p0jY3cMeHVY/AsutF4hbLJFdp5n+r131zNXaWYYtLWeODMMDAfixTUQI14HjsRF0GXf
	54Jy1rXT6ulm3jiu+Zc5liaa9dVjAG8h3si/dih/CYiJYbiJDXhZRh5xwRZ+tw4Z10pkY7u4Pkv
	5hy0GIBl4ngovyUulFWcJrwGKut/GT8FUVDRTtIdGguYfNr4xlQtyZnQ==
X-Received: by 2002:a17:903:244e:b0:2ae:5039:a075 with SMTP id d9443c01a7336-2ae5039a3bfmr31249185ad.53.1772455263609;
        Mon, 02 Mar 2026 04:41:03 -0800 (PST)
Received: from localhost.localdomain ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3d1956absm67910225ad.14.2026.03.02.04.40.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Mar 2026 04:41:03 -0800 (PST)
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
Subject: [PATCH v3 3/6] bpf: add bpf_list_add_impl to insert node after a given list node
Date: Mon,  2 Mar 2026 20:40:25 +0800
Message-ID: <20260302124028.82420-4-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260302124028.82420-1-pilgrimtao@gmail.com>
References: <20260302124028.82420-1-pilgrimtao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kaitao Cheng <chengkaitao@kylinos.cn>

Add a new kfunc bpf_list_add_impl(prev, node, meta, off) that inserts
'node' after 'prev' in the BPF linked list. Both must be in the same
list; 'prev' must already be in the list. The new node must be an
owning reference (e.g. from bpf_obj_new); the kfunc consumes that
reference and the node becomes non-owning once inserted.

Returns 0 on success, -EINVAL if prev is not in a list or node is
already in a list (or duplicate insertion). On failure, the kernel
drops the passed-in node.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 kernel/bpf/helpers.c  | 34 ++++++++++++++++++++++++++++++++++
 kernel/bpf/verifier.c | 23 ++++++++++++++++-------
 2 files changed, 50 insertions(+), 7 deletions(-)

diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index 577af62a9f7a..d212962d4ed6 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -2495,6 +2495,39 @@ __bpf_kfunc struct bpf_list_node *bpf_list_back(struct bpf_list_head *head)
 	return (struct bpf_list_node *)h->prev;
 }
 
+static int __bpf_list_add_after(struct bpf_list_node_kern *prev,
+				struct bpf_list_node_kern *node,
+				struct btf_record *rec, u64 off)
+{
+	struct bpf_list_head *head;
+	struct list_head *n = &node->list_head, *p = &prev->list_head;
+
+	head = READ_ONCE(prev->owner);
+	if (unlikely(!head))
+		goto fail;
+
+	if (cmpxchg(&node->owner, NULL, BPF_PTR_POISON))
+		goto fail;
+
+	list_add(n, p);
+	WRITE_ONCE(node->owner, head);
+	return 0;
+
+fail:
+	__bpf_obj_drop_impl((void *)n - off, rec, false);
+	return -EINVAL;
+}
+
+__bpf_kfunc int bpf_list_add_impl(struct bpf_list_node *prev,
+				  struct bpf_list_node *node,
+				  void *meta__ign, u64 off)
+{
+	struct bpf_list_node_kern *n = (void *)node, *p = (void *)prev;
+	struct btf_struct_meta *meta = meta__ign;
+
+	return __bpf_list_add_after(p, n, meta ? meta->record : NULL, off);
+}
+
 __bpf_kfunc struct bpf_rb_node *bpf_rbtree_remove(struct bpf_rb_root *root,
 						  struct bpf_rb_node *node)
 {
@@ -4564,6 +4597,7 @@ BTF_ID_FLAGS(func, bpf_list_pop_back, KF_ACQUIRE | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_list_del, KF_ACQUIRE | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_list_front, KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_list_back, KF_RET_NULL)
+BTF_ID_FLAGS(func, bpf_list_add_impl)
 BTF_ID_FLAGS(func, bpf_task_acquire, KF_ACQUIRE | KF_RCU | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_task_release, KF_RELEASE)
 BTF_ID_FLAGS(func, bpf_rbtree_remove, KF_ACQUIRE | KF_RET_NULL)
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 8a782772dd36..f5ee11779a5c 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -12453,6 +12453,7 @@ enum special_kfunc_type {
 	KF_bpf_list_del,
 	KF_bpf_list_front,
 	KF_bpf_list_back,
+	KF_bpf_list_add_impl,
 	KF_bpf_cast_to_kern_ctx,
 	KF_bpf_rdonly_cast,
 	KF_bpf_rcu_read_lock,
@@ -12514,6 +12515,7 @@ BTF_ID(func, bpf_list_pop_back)
 BTF_ID(func, bpf_list_del)
 BTF_ID(func, bpf_list_front)
 BTF_ID(func, bpf_list_back)
+BTF_ID(func, bpf_list_add_impl)
 BTF_ID(func, bpf_cast_to_kern_ctx)
 BTF_ID(func, bpf_rdonly_cast)
 BTF_ID(func, bpf_rcu_read_lock)
@@ -12989,7 +12991,8 @@ static bool is_bpf_list_api_kfunc(u32 btf_id)
 	       btf_id == special_kfunc_list[KF_bpf_list_pop_back] ||
 	       btf_id == special_kfunc_list[KF_bpf_list_del] ||
 	       btf_id == special_kfunc_list[KF_bpf_list_front] ||
-	       btf_id == special_kfunc_list[KF_bpf_list_back];
+	       btf_id == special_kfunc_list[KF_bpf_list_back] ||
+	       btf_id == special_kfunc_list[KF_bpf_list_add_impl];
 }
 
 static bool is_bpf_rbtree_api_kfunc(u32 btf_id)
@@ -13111,7 +13114,8 @@ static bool check_kfunc_is_graph_node_api(struct bpf_verifier_env *env,
 	case BPF_LIST_NODE:
 		ret = (kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_front_impl] ||
 		       kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
-		       kfunc_btf_id == special_kfunc_list[KF_bpf_list_del]);
+		       kfunc_btf_id == special_kfunc_list[KF_bpf_list_del] ||
+		       kfunc_btf_id == special_kfunc_list[KF_bpf_list_add_impl]);
 		break;
 	case BPF_RB_NODE:
 		ret = (kfunc_btf_id == special_kfunc_list[KF_bpf_rbtree_remove] ||
@@ -13263,12 +13267,15 @@ __process_kf_arg_ptr_to_graph_node(struct bpf_verifier_env *env,
 		return -EINVAL;
 	}
 
-	/* bpf_list_del: require list head's lock. Use refs[] REF_TYPE_LOCK_MASK
-	 * only. At lock time we stored the locked object's btf_record in ref->
-	 * lock_rec, so we can get the list value type from the ref directly.
+	/* When there is no bpf_list_head in the parameter list, to prevent BPF
+	 * programs from calling bpf_list APIs without holding the spinlock,
+	 * we need to acquire the list head's lock. At lock time we stored the
+	 * locked object's btf_record in ref->lock_rec, so we can get the list
+	 * value type from the ref directly.
 	 */
 	if (node_field_type == BPF_LIST_NODE &&
-	    meta->func_id == special_kfunc_list[KF_bpf_list_del]) {
+	    (meta->func_id == special_kfunc_list[KF_bpf_list_del] ||
+	     meta->func_id == special_kfunc_list[KF_bpf_list_add_impl])) {
 		struct bpf_verifier_state *cur = env->cur_state;
 
 		for (int i = 0; i < cur->acquired_refs; i++) {
@@ -13281,7 +13288,7 @@ __process_kf_arg_ptr_to_graph_node(struct bpf_verifier_env *env,
 							reg->btf, reg->btf_id))
 				return 0;
 		}
-		verbose(env, "bpf_spin_lock must be held for bpf_list_del\n");
+		verbose(env, "bpf_spin_lock must be held for bpf_list api\n");
 		return -EINVAL;
 	}
 
@@ -14278,6 +14285,7 @@ static int check_kfunc_call(struct bpf_verifier_env *env, struct bpf_insn *insn,
 
 	if (meta.func_id == special_kfunc_list[KF_bpf_list_push_front_impl] ||
 	    meta.func_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
+	    meta.func_id == special_kfunc_list[KF_bpf_list_add_impl] ||
 	    meta.func_id == special_kfunc_list[KF_bpf_rbtree_add_impl]) {
 		release_ref_obj_id = regs[BPF_REG_2].ref_obj_id;
 		insn_aux->insert_off = regs[BPF_REG_2].off;
@@ -23244,6 +23252,7 @@ static int fixup_kfunc_call(struct bpf_verifier_env *env, struct bpf_insn *insn,
 		*cnt = 3;
 	} else if (desc->func_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
 		   desc->func_id == special_kfunc_list[KF_bpf_list_push_front_impl] ||
+		   desc->func_id == special_kfunc_list[KF_bpf_list_add_impl] ||
 		   desc->func_id == special_kfunc_list[KF_bpf_rbtree_add_impl]) {
 		struct btf_struct_meta *kptr_struct_meta = env->insn_aux_data[insn_idx].kptr_struct_meta;
 		int struct_meta_reg = BPF_REG_3;
-- 
2.50.1 (Apple Git-155)

