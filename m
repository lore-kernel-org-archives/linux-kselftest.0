Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2352773E9
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Feb 2026 03:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769915791; cv=none; b=AYuxJEd2iWcSI8suWdo6QX7Nr2k5Vl/wqIPXSGZDHNv85oaM+P+vxH1gPhGjQxO1DcPv2agq3EQcn4M/5izN0hrpUTm+zyO28l+B2FeH3BrT0A+zzt5Tjv5yM2G5JCyaClLY8QQdRdFj8IW8Wmd9DXr6HRYt1kizn+usieH3g+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769915791; c=relaxed/simple;
	bh=dwNUmlxcqa+1GX66MgxUDlnEQ+lIyB0CeInZdZx1Ebc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E/HOYEh/uQ6E29Ywk0DGKiNbECFaKx8WyvAkymZn5RVR4tdsWYNt001WjSUoj1dUPIR3adOSFwv2pLpjrIhZlRzks1YLilrgzltsshvYgghzIBmMXuYLlk8BxotbnzKkim6Sqqy8Opw76lsgAU/J/6EbCWqKLNxGS7zjSwCmUx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TQt34JlX; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQt34JlX"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-352f00d0e83so1642699a91.2
        for <linux-kselftest@vger.kernel.org>; Sat, 31 Jan 2026 19:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769915789; x=1770520589; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGPWhoujPZMCC5voFQpQuLH7IyYWH0J71f2m4GWhuCE=;
        b=TQt34JlXm0gJ3jbTUuD5/jkvInSwTLJWZFnCz65fr+zlTpHBEMZpO+iQYhXZEZTVQg
         3mDlCT1ZhvovzpkZVGjkVTjJBq5j9jEf/3YY2uhNQN0xkWHuTimRuNt32X0TjUsDGLyW
         yG6I/pjfk2Fh+rmN/tCp6XfGjwYMRnTz9dUuBRiIetbzdRCWs+KUZmf2yhNxsN4z32xt
         sDryAUVJpso9p8ioeHj9iYyNoVZnITQXcMQ7XTtmXURzpR3cxbz2ATlSvLWZ2/+l+96r
         tE6w054Kl/SOyIwlUCOxXzHLdF01OeFU7S6zbpygXMCAEcyx9CiO7bu5YsJ0bsFPyMkr
         ADig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769915789; x=1770520589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aGPWhoujPZMCC5voFQpQuLH7IyYWH0J71f2m4GWhuCE=;
        b=A5YUFTk6Kc9fO2x8lkR889dasmFoDG2JBvWPnEn/V5opa+zb428bXo13X/qnSEuYZ7
         /0iNYUr6wVQHCIh+gdPRzbiAafgHsjZUyJmx5yDV9ig5n3LGuz2S+NV3YD6JtZNOLv0j
         QSOP0MT2j+DxhtPLGUJ9bEATcv21hMu5HcU9GJeonTqA1K6qmkF7iF06NvTZVxtnBIyT
         gvjA01xh/kTMRNwPDsJnGU+cuE4kLhPMzVMmPPt252aDaD2TPrwo0ZC7nPz6cbSR3AB3
         Fou72qpO+frIGATSqE4j5XZZGcLTsrMUKen7R48qFwxlmpAySvJKHrN/LlE/PlP53MRj
         +mYA==
X-Forwarded-Encrypted: i=1; AJvYcCW0ulK4xWRhGXHDd3BwbngNX1c/j/YOv1nz51hTpCDPtKLwhIaQ9JITl7yREO3UU+B/ZMrJkwu/ALHhtjxmZa8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSDeO85MQ0GmpUe5wRLjKtdLNilOHEMcJzv+xOQcaFR3GlfAS3
	N1Nu+XoMFT1z0AzwWQCURi+BhAG2cBXs7pYeXNHJDP+nj0eXyNi1ZY8d
X-Gm-Gg: AZuq6aLKNztzID7TaIg4LMZBb8nh+gjnTs3foSalbX08jmLukmq/1ncpx7crl74XBXY
	4SdFGOfMPNKtwGKkWZhF1MPNRq9WAnFWciuJZHPDBWj6gvMmgKGDBYU6DinjzmfzKqUoP3Zbr56
	kwnfoiHNFWDm/cPSzMQKqcS/r7lOv0pfnmCsXTDurl+011HRJOPcL3lXdAX8ZH7F9ZslceyicBI
	DEocaEcdrx7WpmHNjiV44hx7hlmcfD6x7HGbkT3ax2j1NB/Cp2sB/S7g+EHcoylpwWKCsPvLG9f
	baLqNVOzTxv+vfT2JjRFrlUnvq04nptaBymAAecQrgAapez9CGKlgnPzGDtO1SGpcJ3eQ5Lhnei
	vrPgVQsLpfSnQ6v7YhOR85fMQYO+hfklSuq0aSh6OtY/ynVtBaX6+J3IytUXBXy3F6JNzsK4Co3
	Ls6nNGAfb7/ImY/GXPdt1eqoZkjz9JYCZNioxK6f1nfg==
X-Received: by 2002:a17:90b:4c0f:b0:340:7b2e:64cc with SMTP id 98e67ed59e1d1-3543b32ae3emr8324057a91.15.1769915789441;
        Sat, 31 Jan 2026 19:16:29 -0800 (PST)
Received: from localhost.localdomain ([113.218.252.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b6b2bdsm11810818b3a.30.2026.01.31.19.16.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 31 Jan 2026 19:16:29 -0800 (PST)
From: chengkaitao <pilgrimtao@gmail.com>
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
	yangfeng@kylinos.cn
Cc: linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Chengkaitao <chengkaitao@kylinos.cn>
Subject: [PATCH v2 3/3] selftests/bpf: Add supplementary tests for bpf_kptr_xchg
Date: Sun,  1 Feb 2026 11:16:07 +0800
Message-ID: <20260201031607.32940-4-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260201031607.32940-1-pilgrimtao@gmail.com>
References: <20260201031607.32940-1-pilgrimtao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chengkaitao <chengkaitao@kylinos.cn>

1. Allow using bpf_kptr_xchg under lock-held context.
2. The rb_node contains a __kptr pointer, eliminating the need to
   perform the remove-read-readd operation sequence.

This patch implements the following workflow:
1. Construct a rbtree with 16 elements.
2. Traverse the rbtree, locate the kptr pointer in the target node,
   and read the content pointed to by the pointer.
3. Remove all nodes from the rbtree.

Signed-off-by: Chengkaitao <chengkaitao@kylinos.cn>
Signed-off-by: Feng Yang <yangfeng@kylinos.cn>
---
 .../testing/selftests/bpf/prog_tests/rbtree.c |   6 +
 .../selftests/bpf/progs/rbtree_search_kptr.c  | 164 ++++++++++++++++++
 2 files changed, 170 insertions(+)
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
diff --git a/tools/testing/selftests/bpf/progs/rbtree_search_kptr.c b/tools/testing/selftests/bpf/progs/rbtree_search_kptr.c
new file mode 100644
index 000000000000..5b853d6cb5a8
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
+#define private(name) (SEC(".data." #name) __hidden __aligned(8))
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

