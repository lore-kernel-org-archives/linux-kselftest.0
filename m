Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7056A2F3621
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Feb 2026 02:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770085672; cv=none; b=EXAo6tSEVSz9rkLD/pc8JtKPfCy0QCwOvDHQd09kiTf/uR7T5cOMQ7qKwTtBYPGu7m7js2SNrTayH3seFB/WPCPg/N3/8JvFVrCy5DfIMICM+jDqGcm2N9SDNYAam9J57608bOTToO8Y5B26E4+E6viRp2x0lzQYoJDPnI8ddAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770085672; c=relaxed/simple;
	bh=WFtoFxjcdZezrv1gLbNQFX2+Ofa+G5yH4J1QraPFtUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EEplKENDM7FPKmDgqcE4GpmAOcaI5Uw087NVx65Yrd+WRyOFxPp1HeSsupem7T1PmZhOuzNFO3Uualc2Rcn8Lh/v4423XUqoy6JXJa7RyrUmGFlTR9LGuxcfDAnOhh0T19rbhJd0spmpuK0Ca4GZGZciZFhko+LJ4gUH3BNHp30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJLnFDcM; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJLnFDcM"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8230f2140beso161488b3a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 18:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770085671; x=1770690471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kptoiBAzP0cGm1tfcA1aNJThIBf5tvZh/2gCBKBUxlo=;
        b=GJLnFDcM/5mCgUrQIhKL62by2MWA/Jw3DNfBk3hRyLk4U8OQGxpl4FPx1rO4af+qf0
         dOCIJiJrBTDtXWw2npUL0z+L3D6Xj82LcyL7ROE6jKpiCG6AGPYgm+ZWEhb1gteBXFgl
         kTeZq+H9lSkQDVRYot6BpwL+9kj3h4ZtirsE5TygtiPgTdz1VI8qll85qUlI+nYXt5i8
         qeRskU0e1iPcPq53kc9lthM2iYC/M4+sGYOJ/ovmdgEag/0n+Qs2vbbGCVDAwnjRqyxi
         SzyJIz6Wzvayek77VAsCYoe5s8tynDE/IDlooDHU+pvj/hy86BKQCapfJtSI4IiVAjrm
         8ZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770085671; x=1770690471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kptoiBAzP0cGm1tfcA1aNJThIBf5tvZh/2gCBKBUxlo=;
        b=Iq8svpM+/szvZy9P41brBj0rVp/tDfcJuiuODpcnyPPRkIk0d2azNAf672wR797BTB
         Ecr6dPICeWoliwtNlzf3UXcTRefnfsxwcKyyY6bu3QquzO5ScKAHSK7XYyhrcYN7vCs5
         sJ8kU5gR7Z7FmJTsS9WLBvakMSCEEBfsvfV+jJCMXMl6O/BwN3pIBDBLd1Fu9bRtDgWG
         2qNiNZIfU8JjwUlALEB6r8PsU/CpL3r3SanPUqOG9lEwo0BlEb/1C+XggfIqHQhNujzr
         W62XT0YkqLqwKDrNSXLz2n373D5kljuGKiLw609acz2nE7Xyy6IoS1f7bWKaWv3kAgXe
         8vyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV26MGACmZWfub1gzXMQ0x8PMEcGk77DiyvBo+kGkA1bpMYTb3bg3Lfoi7BGzDmsY1Tt7TuxSZr7n04uREIx+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFBuDoBTb5Ls75fF3mY+sFXpuc19U8wkgvhbbokCWcCQUzBM5U
	n5VjMcEUPNmpO3btohaY3Lx5ScgDdOy1XBOYvtzm5ssDUqrrps7vBA9V
X-Gm-Gg: AZuq6aItvVdskDUKqjjZD0lRptyZWNx+o7ruakZ95BE7VCnREce5lluIo0RhLWzmVkS
	WrN9bJ+prkzhBwaG7xAN9Taf+NOQ+iXdm19e5ujhCFTxXTpGQDhBy2eMwAaSkyCcDxULZ3aL72O
	9nOQzv2TjIGi5NAZsGfaH5Z+XHrfeKXmm6a9wK6dKUyIaG9qZQjmu8LU/xs+efBpuV8dG/LqIv+
	6ma7FQHjo+EkTQmvfpXnCyi+ILDgUIOxpH0TY72KGUKYTzOy02B7EVzrHiDG2S44ArSXr9xqK7W
	/TXoo9htGTVZURp4CoE4ETOgEuWblFs5CB56PsFqTpWZjVopNPTbUtfoPFaenoWyOJrNu9Ksjlm
	SZ9UOmlYPgxqks6SjnStKnYbRSCyyjpnxPbvsAEhoZcc62jMHbjP0E/vcszZXiKmHV8/iq9vtKe
	oQys+rxku8Oifq9V6yCPXCfHPGuk0wGbMTYN2w2B/kDw==
X-Received: by 2002:a05:6a00:4395:b0:81d:e9b1:b6d6 with SMTP id d2e1a72fcca58-824043185c8mr1329098b3a.28.1770085670642;
        Mon, 02 Feb 2026 18:27:50 -0800 (PST)
Received: from localhost.localdomain ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b58f38sm17803073b3a.24.2026.02.02.18.27.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Feb 2026 18:27:50 -0800 (PST)
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
	Chengkaitao Com <chengkaitao@kylinos.cn>
Subject: [PATCH v5 3/3] selftests/bpf: Add supplementary tests for bpf_kptr_xchg
Date: Tue,  3 Feb 2026 10:27:12 +0800
Message-ID: <20260203022712.99347-4-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260203022712.99347-1-pilgrimtao@gmail.com>
References: <20260203022712.99347-1-pilgrimtao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chengkaitao Com <chengkaitao@kylinos.cn>

1. Allow using bpf_kptr_xchg while holding a lock.
2. When the rb_node contains a __kptr pointer, we do not need to
   perform a remove-read-add operation.

This patch implements the following workflow:
1. Construct a rbtree with 16 elements.
2. Traverse the rbtree, locate the kptr pointer in the target node,
   and read the content pointed to by the pointer.
3. Remove all nodes from the rbtree.

Signed-off-by: Chengkaitao Com <chengkaitao@kylinos.cn>
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

