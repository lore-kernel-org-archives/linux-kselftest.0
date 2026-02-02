Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2932921773F
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 03:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770001961; cv=none; b=mPPg/FaEOkDuqVYp6SOhGWiNHF0bitMmC46H53DnqF6nHqpmKJAw4JIxkN8YhaAmJhKAvTmmiaPO358MAy5T8se1UoNZIagEptalYt+BY+zJUAOMK2QSQWZ2wKmSzMrvm/peNZ9t3l3l4e2LlvMvrZr89Sk3Xdehyfrfrqpr0fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770001961; c=relaxed/simple;
	bh=WqMh59Jh7O6oTHdQ7P3uwRCuoF1pABsvr7CUqtI/TbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mxvoj38GNnmUT778y3UssQbcfKQu0WpX4FdFvKcabhZw/vzBWZNIDTFJUj+Qy2SlNp3kwTHWkOyGLGv1rLD61T5wdbt+vA+/ePWnyb+/KP0nXppK7zJ3+w2YLhBsRnXd7cZjUS5sPxYeExVb/DKVKLEuHbIOwYkGAayFl1+rq5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ViA4ISJm; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ViA4ISJm"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29efd139227so25171605ad.1
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Feb 2026 19:12:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770001959; x=1770606759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IVHOGSx4NXgsONy8xwysVIqdktjCEZu5P7F2LVYkzA=;
        b=ViA4ISJmEiVqePEiPzq7ogL9GAv0L/Rrn2Er2Oso0l+atF38gx3J5dwYB5/sj5PSr+
         ZMTEWNDitj+RKoK4UA53W0EWf7mPCUmQRAKJxW/f2KedEvNYtsEi8dCcSRhkJljmz7wL
         KbmzYKs6NwgBmZW5YzpKDk+0JY6AobtI0FftaVqSg5/Dt86zhACb+q3m47VWjZXuv/Xs
         60bfSR+sa+mindJZpDUVi6qyia0roRuryyqrWPRjq49V2Ie4NixKw0eelZI18dsHZpvo
         zwOri87Pj6zCy+Or6RviFPjEV1MNk6jTsfhMUTSYFZ64r2wPMHUNP0TcIJ7eAwJ6GZL1
         kmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770001959; x=1770606759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0IVHOGSx4NXgsONy8xwysVIqdktjCEZu5P7F2LVYkzA=;
        b=OwzJShUerXGEiSV5iNpZhm5pscIr3YvhId4lrebVJXmbfy/1/fc+hGBG494sK+D8sm
         OIdP5ut5f8V/byQ+id6BtPA7Il37unCgRKclcgl1tqAhugDSP0A5V/Q2psz3vt3fxYUE
         nHaCdjmXqgbyCOQr5aGCpa0mfUgRWtI/3flxMP+5hXhgOKcULNdee1BnXoEkY642wWJe
         Nf54Xomx7LQON3qKfI9CJd93HffwD8RoY9cwvq9EqVM2VBQMkwbSBi47ZGK1pLSNox11
         609XZIV/Re0ntgopftG4Bn0xu1xW08No0DrcxKOzlPLlfK2hRwG5gzimet8SlB7124wZ
         F8AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqM8j3zK+4h5waaWhgKVdGMcp+btOwL6n/6FVeLLQdQovuI5raUQZG1shD8PYp5M17M29OHMC/oyjk3545GPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOX7YGMMc7yQlHpZXiqH6GasYSu/RrRqdxJnvigpy5GUhmLQ+/
	zbKjjHVa/h1RlDT3DSD2djjNDJGKVxPFV5ruP5t9CxBce5908XQ2bboH
X-Gm-Gg: AZuq6aLsI0iPimcBHURnC/jQZKy0Hl+QwJvWJKVa+58FlRtIaca+nSPVKdXsXrBHZOG
	AqE/dpVDLIj0eyYv5x+HTixlvdPaNar2fNVPTEVoyL+0mA2L2CK7dCSqz5dIUMDZ7822c57pCeM
	9oPzNAJO6EDGA1PLE6hhp+4594F2rTjQH0a0hyrXluUNhcNZTQhPutjsbALfFjT6bUcqQ89Hroo
	kb3AbQzwGSVcucB0h2wLu45LzL5Zbc2axIdWhLQWm9NPGmEPHUl+TK7kpT39nmoNk5lPl6NFUFh
	xUR9qWNy4Tcqvf02MbpW/1CwoHiLnZ6XSB94zfcKEuGZXxS/QQASmPIxBRh/txlJN/SW4EBxhXi
	sV2IMXqlo5Vo+RPKrsgv5ntk30BpfGNQsOtamF6kcIlBVsolPbD59IzJFVrERewduJ0opzFhPeE
	gKx6jhqSdyD4/jHKSqGVynx6yBDVtDMcNlEYAIofexTg==
X-Received: by 2002:a17:902:f690:b0:2a0:e94e:5df6 with SMTP id d9443c01a7336-2a8d81818c8mr89657635ad.50.1770001959412;
        Sun, 01 Feb 2026 19:12:39 -0800 (PST)
Received: from localhost.localdomain ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b6e4110sm124318605ad.84.2026.02.01.19.12.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Feb 2026 19:12:39 -0800 (PST)
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
	yangfeng@kylinos.cn,
	alexei.starovoitov@gmail.com
Cc: linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Chengkaitao <chengkaitao@kylinos.cn>
Subject: [PATCH v3 3/3] selftests/bpf: Add supplementary tests for bpf_kptr_xchg
Date: Mon,  2 Feb 2026 11:12:14 +0800
Message-ID: <20260202031214.69958-3-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260202031214.69958-1-pilgrimtao@gmail.com>
References: <20260202031214.69958-1-pilgrimtao@gmail.com>
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

