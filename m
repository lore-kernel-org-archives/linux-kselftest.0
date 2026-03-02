Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314F7375AA2
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 12:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455258; cv=none; b=hdrqz5dia7iacR7aVW4XezpX2B83eGKptM3GPdF/e/U95SnkxrRBck/QvZ7H7YNgrhGGP6aazBt+ZliNXu71/fexejKSMx77qRm6VSc3eC+EFrL6NedIzdBNz3FjMdfgSz3fhkYLkZBpOuM2LV27gGGe+EF5VswYejCkC14vnQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455258; c=relaxed/simple;
	bh=sOe9arj46SNWwf/pIF8963vr5xEYDR3pc1hBPuALohY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BWRGwyB/nAfS1tjBlHZFt4tQUse9dGGXxr09wuRcNj/xnajXv9xYLNQnkWwgd+B8dJIPbE/MsHmxPJjk2KIoT21z+Y2ketyxNJSZSi9++uZygnl1WtNdwsw2rzvnqwsRCArFn1trL9QHpFskuwlFtjvmk0tMsbxuLvVg8SJkA2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UW7f/9tl; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UW7f/9tl"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ae4e538abdso9871925ad.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Mar 2026 04:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772455256; x=1773060056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uX4WAvxsCrnf+I/DBX5XaVur9b97LAwNil7wzBRZi20=;
        b=UW7f/9tlWtJ3TM5LHAMxWUipm3FjEpFbCpEnjckH3Eb3vANq4Ac6F/zY/6hdEg68M9
         JHRh5FsLpvoSLneyQ07RVDDiyXmFMJtYdpoaDJRP1kMGwI0UVNPT5Kk2R0/teWcgod0A
         442ukMb/EnDeMT5XRVaYVDJOe2bulhCjuHmOLbUzBvzlQSlhsdndHACH58HgeTr4I3W/
         nF3uc36K1MuyyoqgKnReZLdXZmyGCPEt2ft+TRLxamfZdP84jFj9Sa3Kt3O7Krk5MZGf
         apBSkQmrZbY9dsJK3gZl4Lsz8LcY7Axli7672l8EskcBb9+V9vrGcx8IHIP7evzzYA17
         Xw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455256; x=1773060056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uX4WAvxsCrnf+I/DBX5XaVur9b97LAwNil7wzBRZi20=;
        b=fa3IIAqnstQuGKwio5OReNM4H+QvQrGZWZLrnn8nOz0myviG/lYbVJ3ov1E8Bnhbi5
         8DhIa6T/ZCBLOkz3y5ZUGd0ReEPjgBssiK5rDxO1Tj+Bf5/lhxrxKUz32BtALvo5tv8h
         +hTyAUSvKo1dDKi+Few/ozQXUzslbFUdyOoChWemYuZqcwPgCxsRXG+NwCWlW8/cCDxC
         YQ8iO6dq6HRndh3l99zpYgxgtpfe0Zk15vVaIZ+YJH6s4RHHCjG2+xhbFEA9kn8ri9jM
         EbNG9CDENJn3+zKQjhUTAtehXYuH2zrBcFeX3j5kTNRH0T9gX6/M/U1Z57nFpkwh41fZ
         qqPA==
X-Forwarded-Encrypted: i=1; AJvYcCXz707dBKt6BkxMHb0XpL4tXCE1Fl41a2TGC+ofcKIbMKVQfOTb9vzsADUOXq708+/nJzKZfscw2mhzs44dvPk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrcs7kDm478EsRGdkcAr0i06kPxMTRcnTFiujwrIWlSAmzQl5s
	h2yBLyKIwCc+z6s2EUJK5xhcll7NrHyIX3y2huPD87eT3drlLQHpPsNJ
X-Gm-Gg: ATEYQzxck6M7hfb3Sh3Dgkr7j5Nvkd5B0GxV37IHXqT43gMiemRe6HdllGYrdrG9/EU
	K4gyUdAQwHw0ugBWjil6DiEuvZqsaz9dXDIVSIRh5bGohzo9EObK+hIClXKu/Xie0XRw62xP0RF
	kBMxrvS8OJA5DITCZxM4chwxoMtgcA92ObrNaWZb9zSxQVR5iMwrK86rBV3P400BWlzptyXgSB5
	2Il/Z6ge74HKvIs7AjRv0bfBlYw8ujLLdQA2Ta9psUeWmXdoO0wusUojJEOSd3+ATuqzpLnV3u8
	lh6wnO2MF2i0gZKFc/+CIyvf4Oi8I3Wgr/yCcW0J0BheC1lBa7iicqRYCfuIIl/fSbn6JJutVJU
	rzWgeLY8s+jSJn3V3zXzmsPk8P4InSJjWr1IU1HyOuegidkgb5HDyHQu2ktD5DpYTdljtCs9Nke
	101eJ+Thx6oSO0j5FqthzAH3cix7u71S1+ghuUDBIBp+H2ykJcEm/9oQ==
X-Received: by 2002:a17:903:37d0:b0:2ad:dfb8:8ed3 with SMTP id d9443c01a7336-2ae2e3ecea7mr116397005ad.8.1772455256520;
        Mon, 02 Mar 2026 04:40:56 -0800 (PST)
Received: from localhost.localdomain ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3d1956absm67910225ad.14.2026.03.02.04.40.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Mar 2026 04:40:56 -0800 (PST)
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
Subject: [PATCH v3 2/6] selftests/bpf: Add test cases for bpf_list_del
Date: Mon,  2 Mar 2026 20:40:24 +0800
Message-ID: <20260302124028.82420-3-pilgrimtao@gmail.com>
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

Add a node to both an rbtree and a list, retrieve the node from
the rbtree, use the obtained node pointer to remove it from the
list, and finally free the node.

To verify the validity of bpf_list_del, also expect the verifier
to reject calls to bpf_list_del made without holding the spin_lock.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 .../testing/selftests/bpf/bpf_experimental.h  | 10 +++
 .../selftests/bpf/progs/refcounted_kptr.c     | 71 +++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
index 4b7210c318dd..b4fb0459f11f 100644
--- a/tools/testing/selftests/bpf/bpf_experimental.h
+++ b/tools/testing/selftests/bpf/bpf_experimental.h
@@ -99,6 +99,16 @@ extern struct bpf_list_node *bpf_list_pop_front(struct bpf_list_head *head) __ks
  */
 extern struct bpf_list_node *bpf_list_pop_back(struct bpf_list_head *head) __ksym;
 
+/* Description
+ *	Remove 'node' from its BPF linked list.
+ *	The node must be in the list. Caller receives ownership of the
+ *	removed node and must release it with bpf_obj_drop.
+ * Returns
+ *	Pointer to the removed bpf_list_node, or NULL if 'node' is NULL
+ *	or not in the list.
+ */
+extern struct bpf_list_node *bpf_list_del(struct bpf_list_node *node) __ksym;
+
 /* Description
  *	Remove 'node' from rbtree with root 'root'
  * Returns
diff --git a/tools/testing/selftests/bpf/progs/refcounted_kptr.c b/tools/testing/selftests/bpf/progs/refcounted_kptr.c
index 1aca85d86aeb..c4fb5615d08b 100644
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
+	l = bpf_list_del(&n->l);
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
+__failure __msg("bpf_spin_lock must be held for bpf_list_del")
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
+	l = bpf_list_del(&n->l);
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

