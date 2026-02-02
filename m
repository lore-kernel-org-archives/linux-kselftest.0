Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF597226CF1
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 09:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770022893; cv=none; b=TWNUefdcEvYEfbJlRsoQjYDDxESsdwY1l2Vp4+nHn1Tx6ENZ5sZYLr4WwoFN2z5AMGF3QsZahApKWmyT0LJXmHAamDkA7n+RrWpIYyVYndz7CN0kwcw1uQ6RHOvsESWzidoKuchS3p9XU97bkVT2fdxvRlO265rpnsus6umWwRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770022893; c=relaxed/simple;
	bh=+gczyR9CP00JLJHZOZfd22Ict0LA0ac5NBdsHkCGEUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZH6y7TFFIuYv/RBkbZDJ4SDB4A2/mcEHh+5hYfAfXu32S2C3TiV/PMe6aeq8fkVESMnkHjsgcFkzCbpDyJOSPAeFdhU6+/FSKo/mdcasMa4dEu3jzGSK5Ls0GJkQ6qVbt3yoalHtWEjFcCdWjJQweXdgHXMk1u3LF3R6w9XRYbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYS50si6; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYS50si6"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a7b23dd036so20265725ad.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 01:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770022891; x=1770627691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GyX2GBNUQDzc1Pn+HCEXjUKCgBxSdTOB7LysO+AztGk=;
        b=iYS50si6Jt8mD0WHF/eMR9dpkCXBNLp3gunQdFSiPjsNjL24bMiL0/GtHd8ioXQTDr
         jeNbQNrrWxDfru+gf19UeT/+S1QZMLZN+6ac48N+ay56Gi/VX5d3ATTo9ZoMxAyrQnX3
         v7jD5Xw9Fm/+uap1gmtXR64dwwM+P66szHZmP7AF8VYzYIRs5CiqwLr5xxTFcxzmIvaD
         Fv7C+GpCT7BGtTG0HvTL8iQHJPPBIKYW2rY00Mq59KuWz5fg5k5ehaK/YaO9Yvw7+KD9
         v1kf8cBRR5tso3ToxAAVngKbaJL+4dEW7Fag2Ehn9ivwns8N1w0t9jFb/MpLRaglwTLD
         r+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770022891; x=1770627691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GyX2GBNUQDzc1Pn+HCEXjUKCgBxSdTOB7LysO+AztGk=;
        b=VJL3sgkrSfsYW8VG/ncWz75Vs1SW+7N7NC4MFLj/ERQNEy80GRYs/10vRQNz97WipS
         TwaufeXLisG1fpMPgDhDOoSoTTv3RQKXSJER+asoh+yvOhpYRWGIwyvU8wPtDH1DUrhi
         VBg3jEusHQeeaav3BEU4RhAtebTmh5WqOxdn0WK7foZxyHJHHqXeHV6ORue4Y30RGOCA
         6yUMt1L4f22JGkZ/5yO5vh6+tE0QxL2qOFyIprVasnBklbbhhEHuD3c2h0Jrm7fdJA1f
         K84/ZgaLvFwZjG7/8zMojiYAEU59msxO6QBSVkvah3eUsDIKzwlfAXUIquG03ZJ6wOT6
         u2Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWhCEuVfr9G9usEiK0v/9PRvbovZ3gDnEFI6Vv25Kd5mwQSXhC6igWQSGbqy7MZM3TGYDifqduUib5IOI2rkJo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDu5a4YhIXADdFRHlKXsVanDJyrL3b7rqmC7WVLUzAjIRYkeHa
	yDFs5HhXbqvMuFZMSgNsgm1BuvRkb4F/ieZJ06BnUnKseHnsqYHTrChimOrocA==
X-Gm-Gg: AZuq6aLXUX1fCq/tw4RXVuzIQbsuiflnmYYXbwBB/KXlZxu3fBAY/uluHaYKee7yyhw
	3vcSqKK7aPDYvtnXZXnkPJ+3GRnccgX6ZyjjMlPI54FdChYEBBnP1/aRZZA2qgDXorMqyPkjbyY
	wTq3aIdGm97QMFUnTU0YWZWYTRM+J37lstx/JWwwId0071AcX8FRBlo7HgCrP6vH42Ak47v55i9
	KpecyGGoindHa9pzJsJ+UGl+iTROK5UevpXh5cIiSbDy4WDKQRfGAnbVpv+uqRH1MZOgs6imhob
	LvG++9iZ8GHERblHBNW3pYnE6wLjYrSdiuUZX6GmswmYtspE5II8OVROGCDpIVTIE0cKjyP1qTh
	Ww0/r1UZEVTlJ9uElQMPTxBmQfj9NY3MLFpx8yPtg+OyF1TAR4sYE1XyGEH3fiBasnZK4TLcNb3
	e2HCnaIL8E7R9lM/s6L65F4viQ7Lyk06aoHZzkBftVAw==
X-Received: by 2002:a17:902:e78c:b0:2a0:8ca7:69de with SMTP id d9443c01a7336-2a8d81667d5mr94464875ad.41.1770022890731;
        Mon, 02 Feb 2026 01:01:30 -0800 (PST)
Received: from localhost.localdomain ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b414f1esm139167635ad.24.2026.02.02.01.01.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Feb 2026 01:01:30 -0800 (PST)
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
Subject: [PATCH v4 3/3] selftests/bpf: Add supplementary tests for bpf_kptr_xchg
Date: Mon,  2 Feb 2026 17:00:51 +0800
Message-ID: <20260202090051.87802-4-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260202090051.87802-1-pilgrimtao@gmail.com>
References: <20260202090051.87802-1-pilgrimtao@gmail.com>
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

