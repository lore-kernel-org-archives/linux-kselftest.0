Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95ECE2874F8
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Feb 2026 02:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770518974; cv=none; b=U0wGux5YPey6qNC7nyuP0RVJjHWvS2F5YbrzD6ZkeYub1ptmhPyeNfPUkcmk7XHrAJMCrB0vc0DlGWiMOfYHu64FGQ5XxrDkDM7aOg4Ybxo3SL4qzAjoMM6uAeAzx1l7EgoAC8Pg+S8XFSyOy2ECKenUTYz+C6KgzdKVbLgKUII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770518974; c=relaxed/simple;
	bh=HyK27wmWpvNXYaxDWFYLGlawGlu1xGVw5LGjGH+YMNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EFLfM5+Z7eiHDAbZaYbYVpKhm9Zt3gLXoFSZ/s9dG2VmVrS99tTVzSqTTkoeamFxW+wnY07qEZrH1O49JOfPlrrcocoiTcZaf8sJXhXg6yBu/BwBe1Fmzsjnp3ipXcYvH9lxdiqolyBmJU4KNTCoJSmRs/6MM3OfnHgISBdZvxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hGRjvio8; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hGRjvio8"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-81ecbdfdcebso1260931b3a.1
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Feb 2026 18:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770518974; x=1771123774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxmSnsFITlfMEb8wiQ5FrXf9I6S3N1VemzQNQpL3mIU=;
        b=hGRjvio8jOeJ5hu9lMkTJKy6KApSwf1Js+LUGFx9RpiAnXxxxZQ9Krm+432qf0cGEM
         OlAZp5Y7wHP7Lre0doV0t2bR8Su8qSfiGPW9BuErkkHWRHtlIcbwHKwsuGLKmrNH8rWB
         1kk09USWu6lSBo4VOkQr3GAMqmexow6dKG06LMhEcZfWlZRf9EVmiGxkXm7TlIjLA+RB
         H/9kl5+VxUJptmEee/4HQVSm1ZalVLpqHiTbVieXNIu2PXO21NCukbSB3E2dm6kfR0jI
         MmP595Un365Y9jHOnzKFvh/ESI8vH+zjZWgInpuYLNP1EjB/k6imk9lKZRSLprz1UJBb
         uUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770518974; x=1771123774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dxmSnsFITlfMEb8wiQ5FrXf9I6S3N1VemzQNQpL3mIU=;
        b=UWOzhlSuNtfnzsSAKqcl/tEIwH06PE3ITrY1v8gjrHknH/NHDVUL5TLcJteQ4BTmFL
         c8RhK1x0X+BkIrXCh2e0ymCBxoN5mLicfE5AvuHbARgM8tSye6dyfZ30PU0OL6SvvBN2
         +TL8lnAVul2VtT7QoruYkBPF33l9HS+z5SDzF+EFyW82vlfxTWhPL3U0WuutpdvHkb2U
         dYmcZ4rDOcDhLYewJNF9vs42bpo2rebZrprMbP73EGuFjitpfmx2EwwsI3/L7rlF7Wue
         VgC3VtAmhQIa6cDhBwbBfiyStyH+Z0Aln4aTaS6WHkhqKUmsOaBXmDoG466XNwPuCSSw
         g3lw==
X-Forwarded-Encrypted: i=1; AJvYcCUYZMSLvdGNG/FVzibwU387V167lRDxDv9ufw5lxLmuf0Lf9tUuW88VOEuxWiGMhR6ZkKKCs8gpAvAB12S3pik=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJN5ELN7Fiu1D5/ll+pS7bj84HomNPwPMqk7xtafSwTsCc4OTX
	PD99z2kkBpxtsekePXQm+Pn8xqvI9I5+Z4pvthBo6QCgEmoe8SOTvnMo
X-Gm-Gg: AZuq6aIwOZjKwKbH562sTnu5uUeiJNUh1Q6san99sUviOdqaMGWWZWGnH1KPx9Uq1dc
	M1nIWqp3u4C6iynsN9VgeLq9X1T/YRHHUKkGQ1Flhp+NE/Z0DA8CoyjK/j95ZWIC88+ZIwlQzGW
	SP/HZXsmpqrm9I5zbFWRooc9vhxls/dNXOkM3N9TR3l1Oh4/83X5zEaMgi8jk2nsAuwawuFvXTr
	1vU8kA+pQkKFZKWZfPe1usmCLGOt8AFyxfK/VsXt7VnPSNp49jNPQwkGgsE1v64TC+EN9fi15O0
	sKrZBPMzSCwRcNxgo9vYosxA5Zul3YGndNxjZmKtggGl+TMCzxpRaM795R1I+tgDHNjpWY7nkpi
	myVfdE0VpC5GlOdIstB8kmNlGYli6P5vzFQ1b4RW+H4VQtStHPRpc8uiS1BOh7up/1vcTV1QzPK
	4jOhqLVn1IC3BQbGyIUDTHMye2gbRVigPyNDwdX08D
X-Received: by 2002:a17:903:2412:b0:2a9:5e25:46f6 with SMTP id d9443c01a7336-2a95e255c83mr57329225ad.17.1770518973927;
        Sat, 07 Feb 2026 18:49:33 -0800 (PST)
Received: from localhost.localdomain ([113.218.252.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9521b9f5esm67194715ad.51.2026.02.07.18.49.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Feb 2026 18:49:33 -0800 (PST)
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
Subject: [PATCH v6 3/5] selftests/bpf: Add supplementary tests for bpf_kptr_xchg
Date: Sun,  8 Feb 2026 10:48:44 +0800
Message-ID: <20260208024846.18653-4-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260208024846.18653-1-pilgrimtao@gmail.com>
References: <20260208024846.18653-1-pilgrimtao@gmail.com>
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

