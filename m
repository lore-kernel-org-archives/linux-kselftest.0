Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ED42E62C8
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 05:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770011936; cv=none; b=cAO9gqID4xYOiWy8w4TQxIwifivnBmcLGrdTX1KbUHO/KTwGqapsRygRhLoDH8TgLnTT8mDe/p+4mYpS/c4JEfBOAv1x2NJBRzDOk29U/rwS3PUfP/E9QJBv7WtFAWopHwt/ZAAH4oIwhE7XN2sm3pfKoNXAHiHOso8AOZTNN0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770011936; c=relaxed/simple;
	bh=WqMh59Jh7O6oTHdQ7P3uwRCuoF1pABsvr7CUqtI/TbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FB/0Sk10zqXSFcnecNcTmFKWZIJqVZPDh+xRDwmZOTds5/4bJDMq8dlkc5wNtSWAa0oJtqZQHw1f1oF9kKWniapSROhs481hxQNHvYSaHqRzKyZ/oBp9boimSqdoZqpRevnsAPXucRIP6AaMXeYgOJ7OwME+mV0Lj0eTc7MjyP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mf0cvh5j; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mf0cvh5j"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c626bd75628so1462372a12.3
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Feb 2026 21:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770011934; x=1770616734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IVHOGSx4NXgsONy8xwysVIqdktjCEZu5P7F2LVYkzA=;
        b=Mf0cvh5jL+vOQAU6nIfyr/yzyDHgRpzs6NS8q4GgCTkRykWsw2HCwh8GuK+adUi6kd
         PwuMvAt7WhTplOTsPdZJTaQ1/+6H7RO/tqAAEQ7mJpNB7dMwyQtGLDZTjDyI3VO+oxuE
         Qz9Z6EWvQ5oY/yRaiJhDHUYFBI04JtQN14j478PPr9evGeu44b39AlnBLd97Bu/MWtwM
         t0oXpmVFmyztqNVTrwp0F8nzBgnSAFqN7ipZLpRRc9uPTVvgBWY8O+r5UT4BVlcnhL86
         kK8TuqZElbXTwnOUjv5WHJavztuiIf1uu0zH/dQJt9jDPb1jWauVaQyuoHJWzPn2/P6v
         IJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770011934; x=1770616734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0IVHOGSx4NXgsONy8xwysVIqdktjCEZu5P7F2LVYkzA=;
        b=hwALUeoyIZla9FnZ5PhbzyAPgiQo4tNua2smXV4CTPxdWouD99OKTc+1ZT572JM8Rc
         8TVWAsaulUJoD7i9bZQAod10RsTJ1hMRJ3ZEYRiMN/aT4lsZ8YAhEg6dDEo+GMiElAeb
         1gUacHK+AX4EB0KGPxmDm2Ob7HYBCxdhXmfzIzd/X/EshhsK5hcsNGZeA/V6POZhS7HV
         uKdylHRCPioYYHlVzQTVFzZcDNnhSx+2V7p7VCwy01WBQAkPYJLXcYd2GPhSkmRG0OLF
         CgxE6snp4gzM+gEgzH7RiE75QkRMUOz/mGN5/o+8RDYVcjTYy7Rt15sU552Ro6zpxVCz
         Tc1Q==
X-Forwarded-Encrypted: i=1; AJvYcCX+goy26sYWzBhw/LURMibxztg54L9EvHKPIDKLrMoYRDbIymPfy090Eb5RZ6jiVuayzz6RZJJqBGdX6NKsE1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMN7S1Zy7DQpwFd2baxWkCx4JbAphCLpH7jW2lGFaZY+8SQtPi
	qgcE68up2lslgeE1krte3dD7CFXktxQZdkAuc7/rnn6q1zgOU9VbOe+l
X-Gm-Gg: AZuq6aJqH+oMZVC+8wLLlLfR7Rqna/8ZX1Jj/2TDQRX2oUPCpqIeo2MHEU08hn8cRmf
	Ot2927/MrTbOsPsJSZtWbgm4Z890ILb2hjF+1Z6qsq63UkmgByUvwbrRrIwTGsh93eMl7MwnaY9
	zQa4fmo1Uslk032gNQnFsxQ6Uux9F2lUuHgVD7sYx1vO9WGvMa+szGXpC7HA6xAhH9ecfGRQ0HP
	2O+f/4gmvP+3SUbhtxzNmGogh38wSQwZsSYM7w75kGgk1ZaU2V7FxmJfOlqtKpzx2Cmq3azU1ix
	x0An1GoRk6Wv+brSXJI9V40rxzK76A5sud4h4bVRRvkveVqHgEH9xOPhQWuM4ehkfDB/WvaY2ON
	twUjkOm2gxpzb7WS0aQVHKFVS7MuHbSplSkhwHPLK7e7pVv8S6tCR9fGAd0n+w/+fzDmStzyuJR
	AkyYsQb5EbJgzKUP9HQSBOMMaSjh8mwj3faH/0DG6mgCORwDvr/Z7f
X-Received: by 2002:a17:903:24e:b0:297:f0a8:e84c with SMTP id d9443c01a7336-2a8d993fa57mr109015545ad.52.1770011933936;
        Sun, 01 Feb 2026 21:58:53 -0800 (PST)
Received: from localhost.localdomain ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4173a2sm139121185ad.30.2026.02.01.21.58.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Feb 2026 21:58:53 -0800 (PST)
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
	Chengkaitao <chengkaitao@kylinos.cn>
Subject: [PATCH RESEND v3 3/3] selftests/bpf: Add supplementary tests for bpf_kptr_xchg
Date: Mon,  2 Feb 2026 13:58:18 +0800
Message-ID: <20260202055818.78231-4-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260202055818.78231-1-pilgrimtao@gmail.com>
References: <20260202055818.78231-1-pilgrimtao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chengkaitao <chengkaitao@kylinos.cn>

1. Allow using bpf_kptr_xchg while holding a lock.
2. When the rb_node contains a __kptr pointer, we do not need to
   perform a remove-read-add operation.

This patch implements the following workflow:
1. Construct a rbtree with 16 elements.
2. Traverse the rbtree, locate the kptr pointer in the target node,
   and read the content pointed to by the pointer.
3. Remove all nodes from the rbtree.

Signed-off-by: Chengkaitao <chengkaitao@kylinos.cn>
Signed-off-by: Feng Yang <yangfeng@kylinos.cn>
---
 .../testing/selftests/bpf/prog_tests/rbtree.c |   6 +
 tools/testing/selftests/bpf/progs/bpf_misc.h  |   4 +
 .../selftests/bpf/progs/rbtree_search_kptr.c  | 164 ++++++++++++++++++
 3 files changed, 174 insertions(+)
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
index 000000000000..1345c7f441c1
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/rbtree_search_kptr.c
@@ -0,0 +1,164 @@
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
+	rb_n = NULL;
+	while (rb_n && can_loop) {
+		bpf_spin_lock(&lock);
+		rb_n = bpf_rbtree_first(&root);
+		if (!rb_n) {
+			ret = __LINE__;
+			goto fail;
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
+		bpf_obj_drop(tnode->node_data);
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

