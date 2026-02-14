Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC57E2853F8
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Feb 2026 04:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771043823; cv=none; b=bJ02BJ6egdOgER3OZRzfrX8+2BhZruEuKN/nATobg4bQFIzxqnNDmuNZZt5pFr9eWuHNO7v6RTArpGAF6iaLJtpe+wL4J1ANRAdngXP3sA9PeT15zQD7PFiJpOcpYqdDI3KWi4rEdaxDdytca7IyPgP99xmczUu1McjkmJIzCzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771043823; c=relaxed/simple;
	bh=HyK27wmWpvNXYaxDWFYLGlawGlu1xGVw5LGjGH+YMNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rqdNlSmwM3YNlu3dFVu3bJauYf0Jj/6uuLCclPXKMw3cCGBrKCsziPZBLVaGu9K4GSzA8I0Ob7xkv19Vqwo66mSVXvsdI+XZ214fS0wM0FQ6Xo7HyXfl+YScmTWPDkc6Lbre38gqFd76RAIp9fsc8EwpU8LIt9N8AnKLSnGaOCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eMNNEUIj; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eMNNEUIj"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-352ccc61658so684757a91.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Feb 2026 20:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771043821; x=1771648621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxmSnsFITlfMEb8wiQ5FrXf9I6S3N1VemzQNQpL3mIU=;
        b=eMNNEUIjU5SKFQamyAlbGsu8uXwmP7zaoQJdFh709S6sK5rhoH5c5wXwiAxlP7/7sY
         6JT0NmOZipehIlJwUyFfyhIsZTKQ9DPhMtlK6TgBtzDIx2g5mH7YzXa7010Rre7pfVIa
         csC1/zROozgze83+frQis8SlKpUXRwEGpiQJHR8aCGRZCjYKhn2Bv/yYlxr6AEz/asOM
         2mgjwLbMFovZEb/QEnHGY+mvE+klK5vq4LbsWTk9MDenw3yGNmQrVaGKOpfXgpiz/vca
         QBZN0aCApaLkVLuR23OSxu2oiXahu9XgvlhiQJwd2JzI5Fwmy6Q6u0thHruFo2D3VBU8
         m6DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771043821; x=1771648621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dxmSnsFITlfMEb8wiQ5FrXf9I6S3N1VemzQNQpL3mIU=;
        b=YuawSg85doqS/5BY7Sfj44niqEn6Ls/7fjqWjDKiqjxIU0jCnmx3k8QXdOAg40URV4
         imLjEEyi1HM6PUft/bkjOnk5cGD+UdlXvzKuoC8L2gXYmT5TcOYyXpwMRDWL0nj+JI5x
         +ehsDbYPQyjF6GfJxUnODEFLfxROMnZnRChl1Ob5h+X38+VQRKcWXAiVOQ2TQwgw1Nbr
         ZISYWH0I6qw+HQI30ZcF0+4/4VGH4+Q9SRxrwck2J0YQZwabEwStQjf/AKtNHXK4wFIR
         IJrywVzxqVR8Sy0xd+smE+7P4KpGsA+qyaW8GPHTduA+i2Nz2PcN/yPDgQmbxuR+Ogqh
         1b+A==
X-Forwarded-Encrypted: i=1; AJvYcCWJkYDZSL6OSvsWIefFv/S67QE1S/RHknDhZlaqyyLavbLesKy5lQa2AAOMgAGHlrmwBmKmwImhrcNG/76i9A0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvu3hqfqOWTPHM72fvLJ2n7zsShkqxe6U4FGvdnxV++sXI5Qf7
	28yDr546jhukZNZLnBiP+/YxXr16SuP+n5zVVcCmI6ELwysUzL3USf7r
X-Gm-Gg: AZuq6aLoB5mqcnIYGeVacGierPzTKueE4JiqMPdDCQLtq3av9Njkp4MWlRM5PDGOCcg
	slSdTononjwZzCQSNSn8wYKS0d4B17ImI5W0iJo3Y21U02VdtwrSMeIlZHB5gzwN7mMo8dUfNKc
	KETn4fHtpAK3ijFjWGO9VzSrX2nmZT+0teIUHGtXtpBYXagDU9bUI+G57PuB6YXRLyuMXxYAlUJ
	jzm95AWOHTv8CYtPhmrgDVYbVSFyq7O2FdUXSdEKuT2B3LNjY47YO2AozNYs/XdELR6jb8xbxLx
	lqYQGpeJjILNaeYqDuG1kdj/JU7P8qwfQh9q8HZnRyxwkommfhJ3ZPeD3BFGIGs6wIi7QLtY+19
	ITacDxVF+vJWuILxYQaYiMNygEa1EaDcj2ZI8BcE0OeFHiPBNHpYDMSoM2cv24rVQmOXAz4JUYq
	heiVWOK7L9i/8ZyOwDrjOEnog4dqI/pLnXIgvE79wRObOb3bvlSujn
X-Received: by 2002:a17:90b:1a84:b0:354:a439:d9e0 with SMTP id 98e67ed59e1d1-356aad8f6f1mr3705160a91.36.1771043821123;
        Fri, 13 Feb 2026 20:37:01 -0800 (PST)
Received: from localhost.localdomain ([113.218.252.61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662e53936sm13519815a91.1.2026.02.13.20.36.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Feb 2026 20:37:00 -0800 (PST)
From: Chengkaitao <pilgrimtao@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	shuah@kernel.org,
	yangfeng@kylinos.cn,
	alexei.starovoitov@gmail.com
Cc: linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: [PATCH v7 3/5] selftests/bpf: Add supplementary tests for bpf_kptr_xchg
Date: Sat, 14 Feb 2026 12:36:28 +0800
Message-ID: <20260214043630.38644-4-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260214043630.38644-1-pilgrimtao@gmail.com>
References: <20260214043630.38644-1-pilgrimtao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kaitao Cheng <chengkaitao@kylinos.cn>

1. Allow using bpf_kptr_xchg while holding a lock.
2. When the rb_node contains a __kptr pointer, we do not need to
   perform a remove-read-add operation.

This patch implements the following workflow:
1. Construct a rbtree with 16 elements.
2. Traverse the rbtree, locate the kptr pointer in the target node,
   and read the content pointed to by the pointer.
3. Remove all nodes from the rbtree.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
Signed-off-by: Feng Yang <yangfeng@kylinos.cn>
---
 .../testing/selftests/bpf/prog_tests/rbtree.c |   6 +
 tools/testing/selftests/bpf/progs/bpf_misc.h  |   4 +
 .../selftests/bpf/progs/rbtree_search_kptr.c  | 167 ++++++++++++++++++
 3 files changed, 177 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/progs/rbtree_search_kptr.c

diff --git a/tools/testing/selftests/bpf/prog_tests/rbtree.c b/tools/testing/selftests/bpf/prog_tests/rbtree.c
index d8f3d7a45fe9..a854fb38e418 100644
--- a/tools/testing/selftests/bpf/prog_tests/rbtree.c
+++ b/tools/testing/selftests/bpf/prog_tests/rbtree.c
@@ -9,6 +9,7 @@
 #include "rbtree_btf_fail__wrong_node_type.skel.h"
 #include "rbtree_btf_fail__add_wrong_type.skel.h"
 #include "rbtree_search.skel.h"
+#include "rbtree_search_kptr.skel.h"
 
 static void test_rbtree_add_nodes(void)
 {
@@ -193,3 +194,8 @@ void test_rbtree_search(void)
 {
 	RUN_TESTS(rbtree_search);
 }
+
+void test_rbtree_search_kptr(void)
+{
+	RUN_TESTS(rbtree_search_kptr);
+}
diff --git a/tools/testing/selftests/bpf/progs/bpf_misc.h b/tools/testing/selftests/bpf/progs/bpf_misc.h
index c9bfbe1bafc1..0904fe14ad1d 100644
--- a/tools/testing/selftests/bpf/progs/bpf_misc.h
+++ b/tools/testing/selftests/bpf/progs/bpf_misc.h
@@ -188,6 +188,10 @@
 #define POINTER_VALUE	0xbadcafe
 #define TEST_DATA_LEN	64
 
+#ifndef __aligned
+#define __aligned(x) __attribute__((aligned(x)))
+#endif
+
 #ifndef __used
 #define __used __attribute__((used))
 #endif
diff --git a/tools/testing/selftests/bpf/progs/rbtree_search_kptr.c b/tools/testing/selftests/bpf/progs/rbtree_search_kptr.c
new file mode 100644
index 000000000000..069fc64b0167
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/rbtree_search_kptr.c
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2026 KylinSoft Corporation. */
+
+#include <vmlinux.h>
+#include <bpf/bpf_helpers.h>
+#include "bpf_misc.h"
+#include "bpf_experimental.h"
+
+#define NR_NODES 16
+
+struct node_data {
+	int data;
+};
+
+struct tree_node {
+	struct bpf_rb_node node;
+	u64 key;
+	struct node_data __kptr * node_data;
+};
+
+#define private(name) SEC(".data." #name) __hidden __aligned(8)
+
+private(A) struct bpf_rb_root root __contains(tree_node, node);
+private(A) struct bpf_spin_lock lock;
+
+static bool less(struct bpf_rb_node *a, const struct bpf_rb_node *b)
+{
+	struct tree_node *node_a, *node_b;
+
+	node_a = container_of(a, struct tree_node, node);
+	node_b = container_of(b, struct tree_node, node);
+
+	return node_a->key < node_b->key;
+}
+
+SEC("syscall")
+__retval(0)
+long rbtree_search_kptr(void *ctx)
+{
+	struct tree_node *tnode;
+	struct bpf_rb_node *rb_n;
+	struct node_data __kptr * node_data;
+	int lookup_key  = NR_NODES / 2;
+	int lookup_data = NR_NODES / 2;
+	int i, data, ret = 0;
+
+	for (i = 0; i < NR_NODES && can_loop; i++) {
+		tnode = bpf_obj_new(typeof(*tnode));
+		if (!tnode)
+			return __LINE__;
+
+		node_data = bpf_obj_new(typeof(*node_data));
+		if (!node_data) {
+			bpf_obj_drop(tnode);
+			return __LINE__;
+		}
+
+		tnode->key = i;
+		node_data->data = i;
+
+		node_data = bpf_kptr_xchg(&tnode->node_data, node_data);
+		if (node_data)
+			bpf_obj_drop(node_data);
+
+		bpf_spin_lock(&lock);
+		bpf_rbtree_add(&root, &tnode->node, less);
+		bpf_spin_unlock(&lock);
+	}
+
+	bpf_spin_lock(&lock);
+	rb_n = bpf_rbtree_root(&root);
+	while (rb_n && can_loop) {
+		tnode = container_of(rb_n, struct tree_node, node);
+		node_data = bpf_kptr_xchg(&tnode->node_data, NULL);
+		if (!node_data) {
+			ret = __LINE__;
+			goto fail;
+		}
+
+		data = node_data->data;
+		node_data = bpf_kptr_xchg(&tnode->node_data, node_data);
+		if (node_data) {
+			bpf_spin_unlock(&lock);
+			bpf_obj_drop(node_data);
+			return __LINE__;
+		}
+
+		if (lookup_key == tnode->key) {
+			if (data == lookup_data)
+				break;
+
+			ret = __LINE__;
+			goto fail;
+		}
+
+		if (lookup_key < tnode->key)
+			rb_n = bpf_rbtree_left(&root, rb_n);
+		else
+			rb_n = bpf_rbtree_right(&root, rb_n);
+	}
+	bpf_spin_unlock(&lock);
+
+	while (can_loop) {
+		bpf_spin_lock(&lock);
+		rb_n = bpf_rbtree_first(&root);
+		if (!rb_n) {
+			bpf_spin_unlock(&lock);
+			return 0;
+		}
+
+		rb_n = bpf_rbtree_remove(&root, rb_n);
+		if (!rb_n) {
+			ret = __LINE__;
+			goto fail;
+		}
+		bpf_spin_unlock(&lock);
+
+		tnode = container_of(rb_n, struct tree_node, node);
+
+		node_data = bpf_kptr_xchg(&tnode->node_data, NULL);
+		if (node_data)
+			bpf_obj_drop(node_data);
+
+		bpf_obj_drop(tnode);
+	}
+
+	return 0;
+fail:
+	bpf_spin_unlock(&lock);
+	return ret;
+}
+
+
+SEC("syscall")
+__failure __msg("R1 type=scalar expected=map_value, ptr_, ptr_")
+long non_own_ref_kptr_xchg_no_lock(void *ctx)
+{
+	struct tree_node *tnode;
+	struct bpf_rb_node *rb_n;
+	struct node_data __kptr * node_data;
+	int data;
+
+	bpf_spin_lock(&lock);
+	rb_n = bpf_rbtree_first(&root);
+	if (!rb_n) {
+		bpf_spin_unlock(&lock);
+		return __LINE__;
+	}
+	bpf_spin_unlock(&lock);
+
+	tnode = container_of(rb_n, struct tree_node, node);
+	node_data = bpf_kptr_xchg(&tnode->node_data, NULL);
+	if (!node_data)
+		return __LINE__;
+
+	data = node_data->data;
+	if (data < 0)
+		return __LINE__;
+
+	node_data = bpf_kptr_xchg(&tnode->node_data, node_data);
+	if (node_data)
+		return __LINE__;
+
+	return 0;
+}
+
+char _license[] SEC("license") = "GPL";
-- 
2.50.1 (Apple Git-155)

