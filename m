Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806592D46A9
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Feb 2026 02:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770605595; cv=none; b=YQu2cz8+Lr4weaqTEUbHH0wVzFUV7LQ2XkkU49UMAzSGe7MOjyqAKCnKskxHv8J4i4AKIBA6p5WXnYTEcz4COa3VVLcJgdNyGOg1ICyGAXKMo50sdG0+UNTN3mIhn5kLFHRg5zZbUOZg3ico/r5aMqhq0miUDWdsPMCdW7LAVqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770605595; c=relaxed/simple;
	bh=RmGHUe45I4K7MVIz7OBicUcd2G4lg/Tg0QEzkQLAcIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=udoZlMH03xTiVNRVXWcfHyPkssWgP8lXKPxBkj/trwlq741u6ZbmavLV8RrzlJ2N96hFJWxa/qtRaTRKPO/W9gWvj1xrfrzdalEnqEVAoEVsscz1etz/Be4PAzdD7XB3YSI2F0I3FVFB6HmdP0JVrtY4iKWiZLEeX+0ZRBDjbBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndrhTPjc; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndrhTPjc"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-354bb7d2cb1so887038a91.0
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Feb 2026 18:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770605595; x=1771210395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UoKEL4fx2cXbp8ykQKKpnwt29v9mHhKU5fa9H902sH4=;
        b=ndrhTPjcGnmVExHoGlvd9h1lvagktFJhVEIcp10SGBmVCRoXzwZEjbWgwRjgojwsNh
         863/XVcbY+EdMslqju7Q06Dg24QEA2Yb8eBwJCu+wHUcYFtiG8dkvyUvSqcVoOvSgrtI
         0DT5WBeZcfqCxpaWtZ2S18uDTMKQy0eGtmskYZ7R7kCoPrTZ11xJ/RHFXs73ucIGdCvM
         GgYllMBnicJGDdaVtRsVLgLrtx+f12aLNoHcbk2cZdA4PBr0udufkWYWIzoUAP9W/Vnh
         ZJfmSFut+G7SImvqeZK3Y9fzHbT0HWjkQCMHcNgaXzeTfdH9+iCffOa0IbP9i9Qbx8kb
         aOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770605595; x=1771210395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UoKEL4fx2cXbp8ykQKKpnwt29v9mHhKU5fa9H902sH4=;
        b=dZOUE0FX7hrJwPxlEtbknpiWcU6QDY1lxAZjJ4rkCg15ANlvT15Q/y/uqEzFJhWB5X
         ZTxeBG9FpWeaIUcyfwSORm0Gt528pl62/5AktCLrAwAKXkCjv0eMhEacOD6mXmhls3Ph
         S1bU6jTDSSakcSoyYah52/9LQeKMQAcOUIFOS57wIkuOcqoTBSXOfousH1F07IWQFNuP
         4XwriVg0WiJDcxr93iFBxmwtVaqLiNjsT1FbgRMwP5WMfJHOqGFy4bIEYxOVFlvusBpn
         PWfHS+RNHDGEUYBHoFlOMtPVoxh3DRpLbS+B7KKthb7ADjXgaJIXpsiV8WFVGez/k5p9
         oS9w==
X-Forwarded-Encrypted: i=1; AJvYcCXT0I2OqM+/s1h7/BlxlD3LlahARxPyvKI2XWQ3mA8PM224rjQhREuctvLOOemzovLVvTb5H4sm+cBcPZFB9Zo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT+lrG291IriR4FVUNPoqQLlvL5XFQhXM2ts4On2HKDENvrfN1
	nhNHpxDl1JegbiVHZVFo9pratJmVbd6rBWDBAIwG8lttcQ61CCgMqc7X
X-Gm-Gg: AZuq6aKFFRxxPLxleX9kcJoC3ijsJl0flEW4DWWmkuuEjiejQOX0EslSDq+ucwS8+st
	A72ho54Z5hQjjon1V0XPVfy62GjTr7VgitoW3iho83cSUMrJ2idyuMmYlEH4wNuQeSMD7iRCRPv
	dghg4TDbzEXCpHJif1X4TKm5VyRWTOdMH0xXaYfTHU+RsCfNp3sWc2Z2KHnIPhC+AQZftQ5jkn4
	mr6Fu+HkSNxV5lRtch0wsrcrXNcwlWdGhZsZHPw/rlcPETkQmazXI4KrbbikJSPLMg0mjRDduhM
	hdKbMNKiVtLOck+IiXoChfLviyfb0zx5A4DwbdiyTlEPnVxQjuppm3Jj4zWFY8H/8AOmW/hX+3m
	Vg9NQpK7mp+33QHUOZ9Z9PDDwlT4IeB0m2nHVKn9KEUT/M3WOfFdcTJ0Q4AHEJ6r5m1dEjXuf/q
	+pSWDqZEqwRXIPGDDiVUeTV6KRoWTw0RXmM9O6aYhEiV0Kn3KeZWTR
X-Received: by 2002:a17:90b:2682:b0:349:162d:ae0c with SMTP id 98e67ed59e1d1-354b2f6219amr8689322a91.4.1770605594812;
        Sun, 08 Feb 2026 18:53:14 -0800 (PST)
Received: from localhost.localdomain ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35621177896sm6302649a91.15.2026.02.08.18.53.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Feb 2026 18:53:14 -0800 (PST)
From: Chengkaitao <pilgrimtao@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	shuah@kernel.org
Cc: chengkaitao@kylinos.cn,
	leon.hwang@linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 2/2] selftests/bpf: Add test cases for bpf_list_del
Date: Mon,  9 Feb 2026 10:52:50 +0800
Message-ID: <20260209025250.55750-3-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260209025250.55750-1-pilgrimtao@gmail.com>
References: <20260209025250.55750-1-pilgrimtao@gmail.com>
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

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 .../testing/selftests/bpf/bpf_experimental.h  | 11 +++++
 .../selftests/bpf/progs/refcounted_kptr.c     | 41 +++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
index 2cd9165c7348..6d8175abc590 100644
--- a/tools/testing/selftests/bpf/bpf_experimental.h
+++ b/tools/testing/selftests/bpf/bpf_experimental.h
@@ -99,6 +99,17 @@ extern struct bpf_list_node *bpf_list_pop_front(struct bpf_list_head *head) __ks
  */
 extern struct bpf_list_node *bpf_list_pop_back(struct bpf_list_head *head) __ksym;
 
+/* Description
+ *	Remove 'node' from the BPF linked list with head 'head'.
+ *	The node must be in the list. Caller receives ownership of the
+ *	removed node and must release it with bpf_obj_drop.
+ * Returns
+ *	Pointer to the removed bpf_list_node, or NULL if 'node' is NULL
+ *	or not in the list.
+ */
+extern struct bpf_list_node *bpf_list_del(struct bpf_list_head *head,
+					  struct bpf_list_node *node) __ksym;
+
 /* Description
  *	Remove 'node' from rbtree with root 'root'
  * Returns
diff --git a/tools/testing/selftests/bpf/progs/refcounted_kptr.c b/tools/testing/selftests/bpf/progs/refcounted_kptr.c
index 1aca85d86aeb..2cb6dd73db7a 100644
--- a/tools/testing/selftests/bpf/progs/refcounted_kptr.c
+++ b/tools/testing/selftests/bpf/progs/refcounted_kptr.c
@@ -367,6 +367,47 @@ long insert_rbtree_and_stash__del_tree_##rem_tree(void *ctx)		\
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
+	bpf_spin_unlock(&lock);
+	if (!rb)
+		return -5;
+	n = container_of(rb, struct node_data, r);
+
+	bpf_spin_lock(&lock);
+	l = bpf_list_del(&head, &n->l);
+	bpf_spin_unlock(&lock);
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

