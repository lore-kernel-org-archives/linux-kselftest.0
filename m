Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAEC285050
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Feb 2026 12:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771072870; cv=none; b=EhuWu+oDdmVbDOpjJKa16J0bN66QA+9I3cc30HnP4FQQwVZhra9t7HgaWLYgsbdn8zUXGvm518zr8/G6MwcMA8CRooRfCKHBtMTzo673xNtb6XyssuU6XKk/ElRhHNpDSt9sX7DyfdKw63YdS0+0GGVIFdDG+E7JHkpcwMFEgQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771072870; c=relaxed/simple;
	bh=HyK27wmWpvNXYaxDWFYLGlawGlu1xGVw5LGjGH+YMNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BEmNDiJolEdmyQn+6XOl40fUGgpt8v6ga3550DaSMBwMlLEfVSk0gLZbdhlU2tALnEsi00W37yYnXzLACmz73jAf4I8YuOR/vK4w5W71efZ+v4W1nuRLuC/eReHtv+4JlWqbqSOGYJnF60TY4rC26o6RD99A6B9Je7Ja8d3SQl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRUpbzD+; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRUpbzD+"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-823081bb15fso989762b3a.3
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Feb 2026 04:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771072868; x=1771677668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxmSnsFITlfMEb8wiQ5FrXf9I6S3N1VemzQNQpL3mIU=;
        b=TRUpbzD+FQdjsgG6KHfPdkvg9QPyOqvStmMo+2MHcsOOcaba7ShBJf6YqacwMpczO4
         JgdkaG7lz9B+Q0eXg4bj6ywtG0oimlFBEp5YppsClol3iF+2x/EIRmL1nfsX+yZSldnA
         V1xqhQ0eDRT83H7EJHGoAnFv1K3XuUiUxMZoEkWt75N4OpZ/+R5pCTHyxS+RzRinEAms
         SX4tVgCmaPLDRsZMh8O3M98OlGO8BUnGDBJRblps36uSXDmcngY2WN5boJOUV8eEuzKI
         XoUQuLJpfhHC3KSNGQa/+3wGuxTIaGOHNdCdyKKUoYWLfOR5ByysjHnbSkmmKTWHuFrB
         pE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771072868; x=1771677668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dxmSnsFITlfMEb8wiQ5FrXf9I6S3N1VemzQNQpL3mIU=;
        b=Hj1fFBbKRP7NW4G0xTVWrR/0/X4iehrIksezqFmGIJEMqNogc+TAvbwnSp5P11S8vG
         lpny8bSHYSsekzkC+kjAOMAe+n1HgEonb1g4/wSua3GQYLvdEcF2DFbd1bnFK1hRPHWY
         QY9P0XjGS6QTK/h+YSZDfTgo5bvXWg+yOp06BPVK5zakfc2tDW6+I4pSfqTkzxaHkz+l
         prKV1W4yeOxTr6QtR4NTGqS6ppn0FCl2dKCvbhoFh8ZKpqfq89HWlf+k/KIFBddByDmV
         634Qs09nasVSyKtlCfjhv2/c1YLT4lnudf3WeEhLQn1AZgrULz49Sz1/m1piVQvJ17B6
         4Jgw==
X-Forwarded-Encrypted: i=1; AJvYcCV1s2dw/aPGAOQVLI9Ng4ftI/4ZuY4WFbG1XVnTedxa+7v72AEEqBg+S9SA12QhSBhotmQ1YS1Cu72J1g9J9L0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAdSWBFU4Z+czQF7rl1ViJu7L0pDcMVt3sdKM7Q4BgM7EmQGJb
	Zw/Bte4Z6mZ8dnSyAn+fsFlmLE0TaJVh1KUb+Hp1HxjvdDiCRhqLpwYy
X-Gm-Gg: AZuq6aIopchQziSlFEIUQINky4l7kkSv+yi36KFBLK5bzwQ76lRvSiLWwy0E1/ccqT1
	G+bYgZIzbH/glzb83RwHoDh7ZA5AM5+QuTJ4vAVfKLbHL+9VkWcwNpEejRvqfBG9EAVV3F6kHGk
	YZ+b7UVr3IH0JlhD31RPErimYK76tiipplXv+bkn6eOpK5xU1+P4nM6mCowvxtSC36iVIFcmMv0
	dW9Fc/7HzV5VuBkgdmJ9+qcyPcSaTwhcP5IRDyNPMtVq7+XBAXEJew+nqGZ3w4nYf79EIb3zwqW
	ttOXRWWpKHQhQYYRLsK7ONbgP/m7FuI+TwZiXTwxOKqTuSh47bO7SSSqj0LfKPd78MGz7TclwzW
	xYZJkMC70G4y4XnWqGlJq4WmFVRBdBGIUx8gDmGEkBoFNxA+zwRPU69cffALxITOJ1YX2TM2j1/
	NM1N4p9NWMifX2tuMnBiJSSML0GRjEOcXZ/vsRN3rM3uyVD/abqMYw
X-Received: by 2002:a05:6a00:178c:b0:81f:4999:ae46 with SMTP id d2e1a72fcca58-824d961c463mr2060599b3a.48.1771072868105;
        Sat, 14 Feb 2026 04:41:08 -0800 (PST)
Received: from localhost.localdomain ([113.218.252.61])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a2e40bsm7064497b3a.11.2026.02.14.04.41.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Feb 2026 04:41:07 -0800 (PST)
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
Subject: [PATCH RESEND v7 3/5] selftests/bpf: Add supplementary tests for bpf_kptr_xchg
Date: Sat, 14 Feb 2026 20:40:40 +0800
Message-ID: <20260214124042.62229-4-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260214124042.62229-1-pilgrimtao@gmail.com>
References: <20260214124042.62229-1-pilgrimtao@gmail.com>
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

