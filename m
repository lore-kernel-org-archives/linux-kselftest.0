Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760853385B6
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 03:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772594197; cv=none; b=GT/GkyhTd7B895hmCSAUUYZ4oLsEAx+Po/b9FFZpJXyQvy1bTkKf6QcHYr77gH5if4K+o/Q2Fe+jQ3Lc1LqVYZeLRPDjDg93Ez5oadmDUA/1s96J/8XKIP2wp7Vv8WIGXKuq7GllMmX8tePjhUfC7PwQYHk1beSuDR4I7Mv3ERo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772594197; c=relaxed/simple;
	bh=5k3B4Ygo1wjsDMA1EPhJXyhhcMiqhAMzgiy+JUuepVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HRF0cNDtvpnpesHxMZOyYZ4zN51BAW+8/obhElna6+NZ0Qq1kn6H/xuWgyBPH+PyfyFJ644Nd8Zh2Wd3a0nWVrZ8lO6j12jd8MrAX7rVKBvZnj9rOoDYsWEZmEp5jxPvwbTCY3McHc+BXlo5wZfOrOICK8w/9z99kPYwOnfHPX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXiXYnWq; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXiXYnWq"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35990245493so1755069a91.2
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Mar 2026 19:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772594196; x=1773198996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yrYqqdL3L32jfs4+IGyGROm0lZBENJH7/3+fmtOXxw=;
        b=cXiXYnWqyt0MpL47jDycvNwUCu6830PNR2bgK+QA59NNxdSFC+vyKzDouKjF6HuiBV
         nVCXnDNu50UzfiAFiTOSHkq9P7A8xYDR4L9QJg5zbHauE410nlObPXBocoAyspx/lT/W
         8DJc0RkFOwwffgq92CwiCncrGoyOquh+wB+1BzXt82OHt5TtckOlTo1xjyUEvD8Y1sob
         6v3Ub4JoXfWapPDBYH12dqa5V1GFl5ZVdkryw5H4Oy3xcfzm45K0CBEr2+umCk5NCd5Z
         xuJpnUar+QK3CpE/Ixyv3r0E04yf9iKaYnqLwZADMfFHrscnIrRRnn+7u2SgPogEjIsF
         Jf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772594196; x=1773198996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9yrYqqdL3L32jfs4+IGyGROm0lZBENJH7/3+fmtOXxw=;
        b=DWOlMbX+0WcXFVEcOyeQzd2P/QfelJyiuOGB+k7ZrV2ywFt0WpFRMFcjDCh7R6+9u+
         /keiR88WEiBLBrBlaYHWor8bV8bEj52P87MkYaQ9wCuWma2SvLR4VIPX47vdu5Xjq8Tm
         IK73Sl1xJAG1ptH85hHbol22qulJbbCWT7S2q/8b3mJksgSsQFDOjfpYKPOo5Igrs0/a
         RNQZgy1kcLswQjua1UzhXvoCJBLlP8nQ+bM+aRmg2LuUovi2q0t3YcgsAHH/3KoGB38A
         uFoXx3iFYv93CFxkvNCX8KA7CHoVCB9rch/HSbT2okxcRy1rSYCdLg1LHBfETpec/t95
         KCrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAULjzZEHG0K1y0+k2kwSFuIZn5cXAfyAlDCaSXhsUlW2DyS5fBRmiy9xH7orQW6nJAw1N/QmXWkzsoBccTGU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0J0sm18aL74OIG8CGc9+L5AVsZgDfz1MkSduN1fHOugDlNckM
	EELtXh8Zt0AQ/Bo/6vE68VArNElZ8HEAk9Z25Ik3U5uNU2vY+GgxdiQA
X-Gm-Gg: ATEYQzydE8ew3N/oT/IhznkjiW53W64g7z3+c/b3jNn1Mtrp+kTepjxvcFsvNNV8kCT
	FaLzuoYCjBaYlCyaJtNtQvhutXUj97pT1SStD1Pk6uYd3SIpV4d+bUli8vwoqVG9AGRiLEbWCV8
	GzAhy47nrHcl4jYLU+GAm8QkLpYm/hTcJ4WU5VnTZoc0mYSCF2HpB+bzt8ZEkr8CJKJTQ3LkN8x
	mM9fBCL4cFAyeBP6gbk/Xdlp7pNwpH6m09iesFubcV79sTXBQqPvyM9zDqPj2eUQqKaencJI+4w
	MXNUaMQPa55BRLbIoG+apjfG4dTZR2+VX99fkjdKboAl2TjU1kUAJcdFiZPf6yr9WpPlc1yHPJY
	jRElNq+PeS1lUPaDAvQ/JyaLBIyJ2LtQjoJSxogw8ebMf1+XbMlQSjzjEWuz784GQTcIBVAsLzi
	vfpgAEcfb/5/Eaa2IvLH0W2Bfx7p6DqP2Lp5S7kImXO8oj6IXIEQ==
X-Received: by 2002:a17:90b:1643:b0:356:24f0:af0c with SMTP id 98e67ed59e1d1-359a6a4d3famr830934a91.17.1772594195723;
        Tue, 03 Mar 2026 19:16:35 -0800 (PST)
Received: from localhost.localdomain ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c3ab946sm3610648a91.13.2026.03.03.19.16.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Mar 2026 19:16:35 -0800 (PST)
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
Subject: [PATCH v5 2/6] selftests/bpf: Add test cases for bpf_list_del
Date: Wed,  4 Mar 2026 11:16:02 +0800
Message-ID: <20260304031606.43884-3-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304031606.43884-1-pilgrimtao@gmail.com>
References: <20260304031606.43884-1-pilgrimtao@gmail.com>
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

