Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1795638E131
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 09:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772011728; cv=none; b=mlm1PeAoVVGteY4WmUpxK6CynP2tdaXNTU2YeQUipYYsIFdhVzfgekjSrMDb6Gz6v7542Z7q+e2NpaCjkA6ORc8ukH0Nr0FG4ko3wiD9dUszmCzoFJucsGinfx+fCKck6RsrTyWnDIR5kUJc6tEnXTd9VYLzCNRbAP+df8aFtaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772011728; c=relaxed/simple;
	bh=I8o4y5mNT6NBUdK1Hz51XMHixYT0zeMuuzrQvMT/nDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V8aOj4hK6tHocvLIilgzKRjrGqYyjzQ+HCacmnDaLfDnhD67CEyhMi0YHqfmtE+6VKE9KL91Y2w2clF7rUrYNA/CrS8e3PwMLk183ZffTHCNcSHN/fkBGQ/GpefNnz1zqqmqUxmbWZzEnA25WhdFW4k9Lt4j8ZN9P6Rovz8Wj0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPPhBcFd; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPPhBcFd"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-358fb86de36so874133a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 01:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772011726; x=1772616526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UV/LTk2gfEB8ll8anEm9MRkQrafSl1LusFUtX+b2yMA=;
        b=PPPhBcFdonPI+yS9Aklf/86qn5UGvTzo7dQBIxaJq3i8l7bsC98kmDkYW3dsUzVJB+
         hT8jCjGEzlnjd0Sfka6RFH+DZZDmvF4CJbqM9PrMMHD3QEWi/6RoqWIMz0hZEaUtTjM+
         N4BwjnVUK19bmi/F5/BRILCdszkgbyNwQP4XZMiDctIfxfGY3+0Pj9+krQU1W9lrKbRJ
         tO4skn+CBxbt5ojt4LViEQDTBMfrAm8E7ZCNZZoD8r6EAjx9QKOW43eDyhmegI90dHGI
         EenWzgXm1la6qhqa+6LznLEv2XTybllxlW/JgGztmdi9/zT0FfWVWQ3yHlNd5IXxPjWi
         UJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772011726; x=1772616526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UV/LTk2gfEB8ll8anEm9MRkQrafSl1LusFUtX+b2yMA=;
        b=U16P4xgevWKtGtbQb2UtqcAj5LqfRSvYie+rWV5vabqq1XNIkfcTgDDQ4u4vrol7Ry
         mmLDbB84VQnzyJx005zmmJWRCzCrYhqjZWoS19ufiJpapZ4r8Iu0YJTBIO9iiZaAWw8L
         VpAhBs1Fk2MnpWwmCxM7Q/JFz8HtxtsX/sfOAFWd4/+mJ0gJ2K+OlPHiMj11zw3EFCtb
         nCunJfNLafMX5bwhynV6yDd6xHcZCCdOCV4Dz73omh5A4l2+WSfRGDDpvnEToOLioLsF
         tf37OqVFlp9zRbd5C8u/mU8t07dX/LoOnI1ACMi5yo/nt7F0NCVaeMDkwmM3bbW7Nc/z
         FHQA==
X-Forwarded-Encrypted: i=1; AJvYcCV/zvIsWXWdtZV2dRg3wJGmG/bi7Bdx3+z1f4qjdeoWf9nJmd77EmyLQBVJsb87EWRmOhAWd9yOR8sssc7WHlM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkdek783laVyv5aU3bsPLMeyFTsv4yvhDpTSnr0+wzIw+plP11
	d68lSmz5zg8u+KusCXjZLiNaz2+Gq6SseGaS+2Y+DLNrflHjv183Sm8Z
X-Gm-Gg: ATEYQzw7vYiGMQPvDQKod4kf+E91PrnpTCGuLHZ4Vt1yhug99NcYhml1MA6DNS9AwHg
	K703r5bXb5euFsocDECrJjBkeKvjqcEdSm0zEr+lVEWUGvDbm8RFEGKjoYaZUjzop7KqNeiXl7V
	79NGTp8IQdHh70KDGwIQdOPel1AqvUeiCs754GBG1W6Z9FrZBMd+X+2H0gp8C8nsHpSVOfqwj6Z
	j9FQE2vB6LEXWam7WBtUQXE9xBHITH4Uw523EgQyX4oe+71rT8IjUMFeE4fTDNEdhaqWXzWV/io
	qdTX6mXAbRK9KD+nMDgzdmoW+597RTr57hC28eb0U1bQ1AdZdCFJ0+j6horf+KyWA1kX21ZMTwk
	8GUXegiHQB1N34a8nMm3efClhuv7rgLFMxtroW75Y+Bxt7PM1ZZQFJJG+0cwZuKBpuweyTXxK1h
	xkw59vxOlgs7G8MPgBCazG95SN8cNKy7T1TKMItE5xrTye21bRuSKb6+ZauRBPKE9H
X-Received: by 2002:a17:90b:2681:b0:356:72f3:acaf with SMTP id 98e67ed59e1d1-3590f2552b5mr1428352a91.32.1772011726439;
        Wed, 25 Feb 2026 01:28:46 -0800 (PST)
Received: from localhost.localdomain ([113.218.252.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35912f5f29fsm837901a91.1.2026.02.25.01.28.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Feb 2026 01:28:46 -0800 (PST)
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
	leon.hwang@linux.dev,
	linux-kselftest@vger.kernel.org
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] selftests/bpf: Add test cases for bpf_list_is_first/is_last/empty
Date: Wed, 25 Feb 2026 17:26:51 +0800
Message-ID: <20260225092651.94689-7-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260225092651.94689-1-pilgrimtao@gmail.com>
References: <20260225092651.94689-1-pilgrimtao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kaitao Cheng <chengkaitao@kylinos.cn>

Rename test_list_add_del to list_add_del_and_check and extend it to
cover the new kfuncs: assert list non-empty after insert, assert
is_first(n) and is_last(m_1) after bpf_list_add, and assert list
empty after removing both nodes.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 .../testing/selftests/bpf/bpf_experimental.h  | 15 +++++++++++
 .../selftests/bpf/progs/refcounted_kptr.c     | 27 +++++++++++++++----
 2 files changed, 37 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
index dc3919deab89..fc73a276c268 100644
--- a/tools/testing/selftests/bpf/bpf_experimental.h
+++ b/tools/testing/selftests/bpf/bpf_experimental.h
@@ -122,6 +122,21 @@ extern int bpf_list_add_impl(struct bpf_list_node *prev, struct bpf_list_node *n
 /* Convenience macro to wrap over bpf_list_add_impl */
 #define bpf_list_add(prev, node) bpf_list_add_impl(prev, node, NULL, 0)
 
+/* Description
+ *	Return true if 'node' is the first node in the list with head 'head'.
+ */
+extern bool bpf_list_is_first(struct bpf_list_head *head, struct bpf_list_node *node) __ksym;
+
+/* Description
+ *	Return true if 'node' is the last node in the list with head 'head'.
+ */
+extern bool bpf_list_is_last(struct bpf_list_head *head, struct bpf_list_node *node) __ksym;
+
+/* Description
+ *	Return true if the list with head 'head' has no entries.
+ */
+extern bool bpf_list_empty(struct bpf_list_head *head) __ksym;
+
 /* Description
  *	Remove 'node' from rbtree with root 'root'
  * Returns
diff --git a/tools/testing/selftests/bpf/progs/refcounted_kptr.c b/tools/testing/selftests/bpf/progs/refcounted_kptr.c
index a3d5995d4302..aa4ee68c8baf 100644
--- a/tools/testing/selftests/bpf/progs/refcounted_kptr.c
+++ b/tools/testing/selftests/bpf/progs/refcounted_kptr.c
@@ -367,14 +367,14 @@ long insert_rbtree_and_stash__del_tree_##rem_tree(void *ctx)		\
 INSERT_STASH_READ(true, "insert_stash_read: remove from tree");
 INSERT_STASH_READ(false, "insert_stash_read: don't remove from tree");
 
-/* Insert one node in tree and list, remove it from tree, add a second
- * node after it in list with bpf_list_add, then remove both nodes from
- * list via bpf_list_del.
+/* Insert one node in tree and list, remove it from tree, add a second node
+ * after it with bpf_list_add, check bpf_list_is_first/is_last/empty, then
+ * remove both nodes from list via bpf_list_del.
  */
 SEC("tc")
-__description("test_list_add_del: test bpf_list_add/del")
+__description("list_add_del_and_check: test bpf_list_add/del/is_first/is_last/empty")
 __success __retval(0)
-long test_list_add_del(void *ctx)
+long list_add_del_and_check(void *ctx)
 {
 	long err = 0;
 	struct bpf_rb_node *rb;
@@ -386,6 +386,11 @@ long test_list_add_del(void *ctx)
 		return err;
 
 	bpf_spin_lock(&lock);
+	if (bpf_list_empty(&head)) {
+		bpf_spin_unlock(&lock);
+		return -7;
+	}
+
 	rb = bpf_rbtree_first(&root);
 	if (!rb) {
 		bpf_spin_unlock(&lock);
@@ -418,6 +423,14 @@ long test_list_add_del(void *ctx)
 		return -8;
 	}
 
+	if (!bpf_list_is_first(&head, &n->l) ||
+	    !bpf_list_is_last(&head, &m_1->l)) {
+		bpf_spin_unlock(&lock);
+		bpf_obj_drop(n);
+		bpf_obj_drop(m_1);
+		return -9;
+	}
+
 	l = bpf_list_del(&n->l);
 	l_1 = bpf_list_del(&m_1->l);
 	bpf_spin_unlock(&lock);
@@ -434,6 +447,10 @@ long test_list_add_del(void *ctx)
 	else
 		err = -6;
 
+	bpf_spin_lock(&lock);
+	if (!bpf_list_empty(&head))
+		err = -7;
+	bpf_spin_unlock(&lock);
 	return err;
 }
 
-- 
2.50.1 (Apple Git-155)

