Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E652D3033CB
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 09:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772011653; cv=none; b=i3Et5juqtQvsRU+LVkuvOSyYH07Yr9+MQtLMThMQIXXqQv/gTHOifBPz5XpbS5xTuU1LveYhflbJIhkyIL2CVPTFc5R8LrmHhi0lIVpgg65/TBWtWETGmltqIQLCiLTcutDMO8ogw3nl98Nw9S+r3uWnc0wQE5P/7DicNLDzPX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772011653; c=relaxed/simple;
	bh=9WB8MCPTdtXhtrp5FTp0FnfzfHPnxg3d6osMwaa3AW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m7x/biOHbqT0JFsuQPNulbgsrnXOJohQlgGlUS3EvjpWAnoQshp78u+tJvni+JbUW0T0C1UKhTQh//wMDmhneJcBssdIo1TJFZPo9TuQa6UxtTuWe3Dj2UlJGidV3GJremrWLvcJVjlV4/El7wIwWuIVGAm+E75Gx5BvufcYfeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UwoFCEUT; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwoFCEUT"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c70bc5b4e86so1448214a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 01:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772011650; x=1772616450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6NeUYBW+BF+U6wXLlBa7cECXJg2bRaRM2pqIkQAOKAU=;
        b=UwoFCEUTnkgdf638aAgYj0wGVUH/h90Um6uscbF5tNBHOgGsL+gEwpQkoGrrebFQ8P
         wYf1jyouqPK0r8P2G4xQ0gNMTS1HycUPK6HtuM6Q4Bpa7IQMFWYkUjws/lxNQXjj1bw9
         f/qf9GZoNhNgOepVdajoNEco41w5C7+V0SRU21a1UbUjpUbQfXkVOVm3c9mRTJXcJK8P
         DaCr6hahU599hHX+dY7dw4WlzyL/zETogPUQDOOyxqr8F5j+qDDi2XYYwC75Kj8Qy0b+
         hNvvirDV4Ns85znILCCOYDjd6Icq8TTXT9goViO5KfYjkxb10mcpfbO4P68ZyIgdtGDP
         aFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772011650; x=1772616450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6NeUYBW+BF+U6wXLlBa7cECXJg2bRaRM2pqIkQAOKAU=;
        b=ZwV1e+B3RV/eLTu2Bs04HNrR9+bN6zmYPSkaQAf4NuX8L1LM+F4iI79+ruQxsFxSz8
         Dzei4tmKIgN/4w4A1ZNdMn7qjLKyllldq2iw0v2StzaYvcW802jp9Sl6sHWcI+lXYtkp
         Yom1mOyb5JLkKvZj6AW78I/n+edBGW6/Wurukod4NoVHcqMCY6ISsr8a9aNU7IYBvn7u
         Ka5DYJqMPomcRAsUXMa1HIOQw05uyUumn4F/ZoE0y9fRr/BLuto3Qy99+jcR8/VIt46k
         KLM1xx3TXLUdbsCcxji21i6KtlQdIN0vqq33DlEbQXlH8+oIydNeweyNNEsBKl6Tbz7N
         EjOg==
X-Forwarded-Encrypted: i=1; AJvYcCU58PbdO5W/6lmQJhRLykZ/gheFMIYb6yjNTj86eAfIQOLdGqrnlpaLrYiozcxfs4XATHvhAD4JNT4oVqZ9JnM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8wrExg90XyENOzFQd+JMmN+YizRrJ+tPvEfuQDihCTq4Ca1If
	IlZ5E6Yk31yPWjBVX/JbU1PrHXovkkKEX6alg99bBo4p5D07LkKQpHEo
X-Gm-Gg: ATEYQzyHWAR7R4TBFJhlyhInK68GfWTfeJktRDV9s+/90dRmJ8iFt6Oz+y8fXhVxgTQ
	In9L2AvXhs2EmRK5ZgUIaIg8t2r3tYhqZUxhFwp3JY8s01+Qs0tWnTYIVDEgdvJGGI26mzLHIU0
	MMvJMhZwRdKwC8EPpMbYXE1VOzIYx2k3OQ1OnpZxC9MbnXEp89Nxpaa7gpaBdpDQL0HHiQL8Vcb
	yi7N48dHWu5E6B94zbhqbK0bJO+Yv2L+jXmFCgN4UEfVKVqo+yjcZ4hc76e90SKUjk4UJmch8oq
	e9Fd6Z8UOHITCCFgaW/sajgtU+EuzTc2jn3pwafhQqebplxpNtrvTFBRo6roJNJjcspeDsNEIp+
	3dy38m9kk+DBNHSVRV4zRNpkrNxIps5//UJq3pZwwzRm8aA229IFtDmOhQhpKJMdKbxWTeX3zX8
	4Zc7dhVSYWEqIkPc8oZmzVqoSs16DbknO/3Kgj77qn6wwLrvVxMqP+wBtJ7GiAntPl
X-Received: by 2002:a17:90a:d448:b0:356:8719:f516 with SMTP id 98e67ed59e1d1-3590f1b0583mr1886400a91.24.1772011650208;
        Wed, 25 Feb 2026 01:27:30 -0800 (PST)
Received: from localhost.localdomain ([113.218.252.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35912f5f29fsm837901a91.1.2026.02.25.01.27.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Feb 2026 01:27:29 -0800 (PST)
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
	leon.hwang@linux.dev,
	linux-kselftest@vger.kernel.org
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] bpf: Introduce the bpf_list_del kfunc.
Date: Wed, 25 Feb 2026 17:26:46 +0800
Message-ID: <20260225092651.94689-2-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260225092651.94689-1-pilgrimtao@gmail.com>
References: <20260225092651.94689-1-pilgrimtao@gmail.com>
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

When a kfunc has only one bpf_list_node parameter, supplement the
initialization of the corresponding btf_field.

This is typically paired with bpf_refcount. After calling
bpf_list_del, it is generally necessary to drop the reference to
the list node twice to prevent reference count leaks.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 kernel/bpf/btf.c      | 33 +++++++++++++++++++++++++++++----
 kernel/bpf/helpers.c  | 17 +++++++++++++++++
 kernel/bpf/verifier.c |  9 ++++++++-
 3 files changed, 54 insertions(+), 5 deletions(-)

diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
index 4872d2a6c42d..8a977c793d56 100644
--- a/kernel/bpf/btf.c
+++ b/kernel/bpf/btf.c
@@ -3785,7 +3785,6 @@ static int btf_find_field_one(const struct btf *btf,
 	case BPF_RES_SPIN_LOCK:
 	case BPF_TIMER:
 	case BPF_WORKQUEUE:
-	case BPF_LIST_NODE:
 	case BPF_RB_NODE:
 	case BPF_REFCOUNT:
 	case BPF_TASK_WORK:
@@ -3794,6 +3793,27 @@ static int btf_find_field_one(const struct btf *btf,
 		if (ret < 0)
 			return ret;
 		break;
+	case BPF_LIST_NODE:
+		ret = btf_find_struct(btf, var_type, off, sz, field_type,
+				      info_cnt ? &info[0] : &tmp);
+		if (ret < 0)
+			return ret;
+		/* graph_root for verifier: container type and node member name */
+		if (info_cnt && var_idx >= 0 && (u32)var_idx < btf_type_vlen(var)) {
+			u32 id;
+			const struct btf_member *member;
+
+			for (id = 1; id < btf_nr_types(btf); id++) {
+				if (btf_type_by_id(btf, id) == var) {
+					info[0].graph_root.value_btf_id = id;
+					member = btf_type_member(var) + var_idx;
+					info[0].graph_root.node_name =
+						__btf_name_by_offset(btf, member->name_off);
+					break;
+				}
+			}
+		}
+		break;
 	case BPF_KPTR_UNREF:
 	case BPF_KPTR_REF:
 	case BPF_KPTR_PERCPU:
@@ -4138,6 +4158,7 @@ struct btf_record *btf_parse_fields(const struct btf *btf, const struct btf_type
 			if (ret < 0)
 				goto end;
 			break;
+		case BPF_LIST_NODE:
 		case BPF_LIST_HEAD:
 			ret = btf_parse_list_head(btf, &rec->fields[i], &info_arr[i]);
 			if (ret < 0)
@@ -4148,7 +4169,6 @@ struct btf_record *btf_parse_fields(const struct btf *btf, const struct btf_type
 			if (ret < 0)
 				goto end;
 			break;
-		case BPF_LIST_NODE:
 		case BPF_RB_NODE:
 			break;
 		default:
@@ -4192,20 +4212,25 @@ int btf_check_and_fixup_fields(const struct btf *btf, struct btf_record *rec)
 	int i;
 
 	/* There are three types that signify ownership of some other type:
-	 *  kptr_ref, bpf_list_head, bpf_rb_root.
+	 *  kptr_ref, bpf_list_head/node, bpf_rb_root.
 	 * kptr_ref only supports storing kernel types, which can't store
 	 * references to program allocated local types.
 	 *
 	 * Hence we only need to ensure that bpf_{list_head,rb_root} ownership
 	 * does not form cycles.
 	 */
-	if (IS_ERR_OR_NULL(rec) || !(rec->field_mask & (BPF_GRAPH_ROOT | BPF_UPTR)))
+	if (IS_ERR_OR_NULL(rec) || !(rec->field_mask &
+	   (BPF_GRAPH_ROOT | BPF_GRAPH_NODE | BPF_UPTR)))
 		return 0;
+
 	for (i = 0; i < rec->cnt; i++) {
 		struct btf_struct_meta *meta;
 		const struct btf_type *t;
 		u32 btf_id;
 
+		if (rec->fields[i].type & BPF_GRAPH_NODE)
+			rec->fields[i].graph_root.value_rec = rec;
+
 		if (rec->fields[i].type == BPF_UPTR) {
 			/* The uptr only supports pinning one page and cannot
 			 * point to a kernel struct
diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index 6eb6c82ed2ee..577af62a9f7a 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -2459,6 +2459,22 @@ __bpf_kfunc struct bpf_list_node *bpf_list_pop_back(struct bpf_list_head *head)
 	return __bpf_list_del(head, true);
 }
 
+__bpf_kfunc struct bpf_list_node *bpf_list_del(struct bpf_list_node *node)
+{
+	struct bpf_list_node_kern *knode = (struct bpf_list_node_kern *)node;
+
+	if (unlikely(!knode))
+		return NULL;
+
+	if (WARN_ON_ONCE(!READ_ONCE(knode->owner)))
+		return NULL;
+
+	list_del_init(&knode->list_head);
+	WRITE_ONCE(knode->owner, NULL);
+
+	return node;
+}
+
 __bpf_kfunc struct bpf_list_node *bpf_list_front(struct bpf_list_head *head)
 {
 	struct list_head *h = (struct list_head *)head;
@@ -4545,6 +4561,7 @@ BTF_ID_FLAGS(func, bpf_list_push_front_impl)
 BTF_ID_FLAGS(func, bpf_list_push_back_impl)
 BTF_ID_FLAGS(func, bpf_list_pop_front, KF_ACQUIRE | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_list_pop_back, KF_ACQUIRE | KF_RET_NULL)
+BTF_ID_FLAGS(func, bpf_list_del, KF_ACQUIRE | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_list_front, KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_list_back, KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_task_acquire, KF_ACQUIRE | KF_RCU | KF_RET_NULL)
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index a3390190c26e..1e9857177a7a 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -12431,6 +12431,7 @@ enum special_kfunc_type {
 	KF_bpf_list_push_back_impl,
 	KF_bpf_list_pop_front,
 	KF_bpf_list_pop_back,
+	KF_bpf_list_del,
 	KF_bpf_list_front,
 	KF_bpf_list_back,
 	KF_bpf_cast_to_kern_ctx,
@@ -12491,6 +12492,7 @@ BTF_ID(func, bpf_list_push_front_impl)
 BTF_ID(func, bpf_list_push_back_impl)
 BTF_ID(func, bpf_list_pop_front)
 BTF_ID(func, bpf_list_pop_back)
+BTF_ID(func, bpf_list_del)
 BTF_ID(func, bpf_list_front)
 BTF_ID(func, bpf_list_back)
 BTF_ID(func, bpf_cast_to_kern_ctx)
@@ -12966,6 +12968,7 @@ static bool is_bpf_list_api_kfunc(u32 btf_id)
 	       btf_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
 	       btf_id == special_kfunc_list[KF_bpf_list_pop_front] ||
 	       btf_id == special_kfunc_list[KF_bpf_list_pop_back] ||
+	       btf_id == special_kfunc_list[KF_bpf_list_del] ||
 	       btf_id == special_kfunc_list[KF_bpf_list_front] ||
 	       btf_id == special_kfunc_list[KF_bpf_list_back];
 }
@@ -13088,7 +13091,8 @@ static bool check_kfunc_is_graph_node_api(struct bpf_verifier_env *env,
 	switch (node_field_type) {
 	case BPF_LIST_NODE:
 		ret = (kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_front_impl] ||
-		       kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_back_impl]);
+		       kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
+		       kfunc_btf_id == special_kfunc_list[KF_bpf_list_del]);
 		break;
 	case BPF_RB_NODE:
 		ret = (kfunc_btf_id == special_kfunc_list[KF_bpf_rbtree_remove] ||
@@ -13211,6 +13215,9 @@ __process_kf_arg_ptr_to_graph_node(struct bpf_verifier_env *env,
 		return -EINVAL;
 	}
 
+	if (!*node_field)
+		*node_field = field;
+
 	field = *node_field;
 
 	et = btf_type_by_id(field->graph_root.btf, field->graph_root.value_btf_id);
-- 
2.50.1 (Apple Git-155)

