Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727A135F5EB
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Mar 2026 13:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772545977; cv=none; b=u4hAPpRwZBylVQHT0QrxoXiALwPlflSr0ACJLQ8GcRQZUKsblipQr5hpyQf0O7e29wccnNVx/11FiOWr+7E0W5DKYXSzeVAked5rmYQYuq+u/fnmGu0ndhM3hcxKsMt0b6oc/dBkPsbym1wofMEub7lywxUILTvV27h0JgqlKN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772545977; c=relaxed/simple;
	bh=5k3B4Ygo1wjsDMA1EPhJXyhhcMiqhAMzgiy+JUuepVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZI5dfQnC7SGO16/FU+UmtM+OvivXiimV62X9PmVGEXBuHyrkr08pXXyzKhJ+VWUWZHBdgk7P+CnTDMHdaPSugDifTOUCpNVlnC2687ZsVQfD/vssJ97x0qNGpFBUhwKxpNS13u4EJG5iGOPsDBlC2rOQ4DxsMc19OeS2DDNsvZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1Sb70Tj; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1Sb70Tj"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82418b0178cso3279516b3a.1
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Mar 2026 05:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772545976; x=1773150776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yrYqqdL3L32jfs4+IGyGROm0lZBENJH7/3+fmtOXxw=;
        b=F1Sb70Tj345lwTMqmngIa4+emLD7oKmaf7Flttjq3fF5f8VJVrpw0U+7A3KQ5OCqBQ
         MC4+1/gzWhQgRyHdjXh+xPNl91JYQwDe3a/ye7fSVwaJfYz3B6kdnQrYvd624SRmMWty
         LkDuuSh6TpxUeDl6KNW1FSTmi8SW61tKjoQlpwHdpjFy8xIdJEEZ1egUuRKPO0QcwbQf
         0ND+paymfA495tldA6iPlcBGrAcbo7Loe8lMweqcWU0+sTEgAH1ZofsAd4e9Sey/Glds
         DbqIZYX/T6ycuL/jnx1NfpUILdGmWCY7+WHs/7fOmNv1EYUdKYYOdZjsyYl6kwNXC1wj
         7+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772545976; x=1773150776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9yrYqqdL3L32jfs4+IGyGROm0lZBENJH7/3+fmtOXxw=;
        b=gY6T+fnWF4dUyMPoaRiQACUMrJ4g3BOJdp2ayruvHAzQp39AgtocFqFXHnQuTx3vRX
         fHiCXnLShttPZWIG61mHNeYxjRPPz+61NgpZRy35HB17+Keurw3c6UgcbW6xjjjSLFL4
         ykukNQlgSKzmrxspe9pJrvn9nUy1VCwsmaKgr+8iFmq1rh6HSIU6T8xZm2AcxIzmKkTS
         1YxiCfKLhtkn0rzpoezQ8Ryp6R5f4ob3ZN/+c1tx9UhOoDqZod1xx0dPA/p8iR7GWfOj
         orVrdsG2buRamFu8HzY43vf34nMP2h5UiePs4biNQ884XJYGbA8M3BJJZcofxK7AJ9kG
         eWRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaptMn0t7tYtZvCSXMlHEcsu1PaPZE6sHM+RQ9gnzX5nPS3QZMH17em1wPwF9iuYPL2XWCKkqye7QBXVEc/WE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoYmyadQu5NjkLpC4GBuIQi5yqm7Gp3cT90ZZatZR+Aha27aVR
	Rl3GtUKmKtXxq8BTWwXJHUG8cQ7C+GRw9MJxSukA6sGgFwdZWqfq5OI8
X-Gm-Gg: ATEYQzzJnFR7tc88qsWBv6kT9y19O415wdjhPTHKMvfopiUrjF9QhDkl/PgbqBxizq0
	r/KyzFodPUF9a61zcaNA7jRzMvPIN9XNonG1EvAK7swvsOlW1Ky3deFyu2edoRMtttEGmQ9T4Fk
	FpS4OUkj1YQmh2TVoXgfWf4f8JgNc025mKwH0mVTkszSTEyE9/mvuFkEVHNH3fIupVAroZBlSob
	kDWx+p6WpxI+nhNiGEdC0mFXHpF/50Etn8/DnpGY29EgV4tJ4PpkrOtjocceDnFq1irxEUOi3zC
	OVdmzxDr/9NUDtcgKIFCGd52gcXDAOiqbXBjo51KloZ+hqSQZI3x/HJprJyKRWxgxPIr89YGd4J
	0//Kkvw+ya8IItGYN0XPaj0VOfBMIrgqKr/YctPA31NRMYLUjKSlfnIzE9T0x6MpPLeD+jUcvRE
	77R6drgLddu3dJ/x5gnVsuLLM3YBIfg12izjB2PJ+6K8tlOtGl
X-Received: by 2002:a05:6a21:a341:b0:366:1f1f:3299 with SMTP id adf61e73a8af0-395c39f7a2emr14911659637.6.1772545975553;
        Tue, 03 Mar 2026 05:52:55 -0800 (PST)
Received: from localhost.localdomain ([113.218.252.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa62147esm14689782a12.12.2026.03.03.05.52.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Mar 2026 05:52:55 -0800 (PST)
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
Subject: [PATCH v4 2/6] selftests/bpf: Add test cases for bpf_list_del
Date: Tue,  3 Mar 2026 21:52:15 +0800
Message-ID: <20260303135219.33726-3-pilgrimtao@gmail.com>
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

Add a node to both an rbtree and a list, retrieve the node from
the rbtree, use the obtained node pointer to remove it from the
list, and finally free the node.

To verify the validity of bpf_list_del, also expect the verifier
to reject calls to bpf_list_del made without holding the spin_lock.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 .../testing/selftests/bpf/bpf_experimental.h  | 11 +++
 .../selftests/bpf/progs/refcounted_kptr.c     | 71 +++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
index 4b7210c318dd..54ec9d307fdc 100644
--- a/tools/testing/selftests/bpf/bpf_experimental.h
+++ b/tools/testing/selftests/bpf/bpf_experimental.h
@@ -99,6 +99,17 @@ extern struct bpf_list_node *bpf_list_pop_front(struct bpf_list_head *head) __ks
  */
 extern struct bpf_list_node *bpf_list_pop_back(struct bpf_list_head *head) __ksym;
 
+/* Description
+ *	Remove 'node' from the BPF linked list with head 'head'.
+ *	The node must be in the list. Caller receives ownership of the
+ *	removed node and must release it with bpf_obj_drop.
+ * Returns
+ *	Pointer to the removed bpf_list_node, or NULL if 'node' is NULL
+ *	or not in the list.
+ */
+extern struct bpf_list_node *bpf_list_del(struct bpf_list_head *head,
+					  struct bpf_list_node *node) __ksym;
+
 /* Description
  *	Remove 'node' from rbtree with root 'root'
  * Returns
diff --git a/tools/testing/selftests/bpf/progs/refcounted_kptr.c b/tools/testing/selftests/bpf/progs/refcounted_kptr.c
index 1aca85d86aeb..ac7672cfefb8 100644
--- a/tools/testing/selftests/bpf/progs/refcounted_kptr.c
+++ b/tools/testing/selftests/bpf/progs/refcounted_kptr.c
@@ -367,6 +367,77 @@ long insert_rbtree_and_stash__del_tree_##rem_tree(void *ctx)		\
 INSERT_STASH_READ(true, "insert_stash_read: remove from tree");
 INSERT_STASH_READ(false, "insert_stash_read: don't remove from tree");
 
+/* Insert node_data into both rbtree and list, remove from tree, then remove
+ * from list via bpf_list_del using the node obtained from the tree.
+ */
+SEC("tc")
+__description("test_bpf_list_del: remove an arbitrary node from the list")
+__success __retval(0)
+long test_bpf_list_del(void *ctx)
+{
+	long err;
+	struct bpf_rb_node *rb;
+	struct bpf_list_node *l;
+	struct node_data *n;
+
+	err = __insert_in_tree_and_list(&head, &root, &lock);
+	if (err)
+		return err;
+
+	bpf_spin_lock(&lock);
+	rb = bpf_rbtree_first(&root);
+	if (!rb) {
+		bpf_spin_unlock(&lock);
+		return -4;
+	}
+
+	rb = bpf_rbtree_remove(&root, rb);
+	if (!rb) {
+		bpf_spin_unlock(&lock);
+		return -5;
+	}
+
+	n = container_of(rb, struct node_data, r);
+	l = bpf_list_del(&head, &n->l);
+	bpf_spin_unlock(&lock);
+	bpf_obj_drop(n);
+	if (!l)
+		return -6;
+
+	bpf_obj_drop(container_of(l, struct node_data, l));
+	return 0;
+}
+
+SEC("?tc")
+__failure __msg("bpf_spin_lock at off=32 must be held for bpf_list_head")
+long list_del_without_lock_fail(void *ctx)
+{
+	struct bpf_rb_node *rb;
+	struct bpf_list_node *l;
+	struct node_data *n;
+
+	bpf_spin_lock(&lock);
+	rb = bpf_rbtree_first(&root);
+	if (!rb) {
+		bpf_spin_unlock(&lock);
+		return -4;
+	}
+
+	rb = bpf_rbtree_remove(&root, rb);
+	bpf_spin_unlock(&lock);
+	if (!rb)
+		return -5;
+
+	n = container_of(rb, struct node_data, r);
+	l = bpf_list_del(&head, &n->l);
+	bpf_obj_drop(n);
+	if (!l)
+		return -6;
+
+	bpf_obj_drop(container_of(l, struct node_data, l));
+	return 0;
+}
+
 SEC("tc")
 __success
 long rbtree_refcounted_node_ref_escapes(void *ctx)
-- 
2.50.1 (Apple Git-155)

