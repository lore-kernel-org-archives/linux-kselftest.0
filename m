Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D69389445
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 12:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455274; cv=none; b=WIhVWGhXHHqGINNjPeEuQBuxKIAAJJh9VrtLsmB8nvqyaYz+cW1NkibsOw5SoOO3N4IKeoKpltn4WcxNXQEt4Bs44lBb+W9Xp0mcRCziKsL16bmu859Eomzt8dwlXZNH6ECp4nTQKoudVCMQR2uJcK9N6/bj7Mkb3zQnREbECC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455274; c=relaxed/simple;
	bh=jtGIjlDuLik+f2Igu18fW3dt4LdjvlRBZPoRTTUs1G0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PHnBYH2O5SfTMx+KA5nYWQF2GIK0mBHDUKtoqXKsBHPmKLYbsSD1lEwJHQ92kiqPM5508iWoRprrd3lmc/IaH0qanBRogwih3a/CkArhSFOUCMrfsweVF/uPcEBCM0wzThtN69gVPWgw7hozXUXTESVE/NvfFbGEO9rbbszZBxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eUIjTelB; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUIjTelB"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ae50a33ff8so6617055ad.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Mar 2026 04:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772455271; x=1773060071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Eyq8baO3YE83K4ftV/rGILwVlXJCLjJ+D4XOH4RDSs=;
        b=eUIjTelB/AJ7fRjWkqUGTDs/F87KHVkjklwGXnDrxjZzPbgbQ96c88sAZRIPUgPHJ/
         5cC8A2ddandV1hao6rhaKQv7j8GR8BqFA51Fe9DrT0I593OskRR3wt829/Fvf2dHsCzX
         jF6VKpmGoptFDkLR9uHSf2QiJqGn9ZS8Y1ZdDkpo2pyBBuhwgNF1AzwsmeDwy1ZKlqQ+
         I3ETzhS8cBZgHMkdjXanAJc3LtFPFmCI96QRm2oO8jFlvxShvgvwHh8QtJAwrWXJhRrp
         E9jDDq4468H1BgxdC3CatEwlk0VafdNioDHSsl/9xf2Ptye4KhMI46LiaWJGaDEZAsSK
         EQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455271; x=1773060071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Eyq8baO3YE83K4ftV/rGILwVlXJCLjJ+D4XOH4RDSs=;
        b=fQls1WGGtsEGBQZ/cwhvd0ohUt9GNGk6vuZ4CUaA8hpfMPI82uyN2kdD+NL0ggUxf4
         qHEF1NQ93ynWPjt91KIj2pWBFuP3JH3ZR5Iy+pBsrMQKZwr1FIPVraUlnyi/Upq4D86z
         M08MS9tbVihBwjuG0m+svedePs1iPKaqTa2fMk1qCY2X15W3tSuKP57dKdtuOMxEuNYI
         ffUhV8lZQfRDzeMsB5n9Cc4+u7ETceXRVyxfxPzj74jwoHWvpINSy7Np6gg3MR7NFjcN
         gzUEO9HRItCyXKwXVsiXbAvA7kpIbZorjuMJj4xOxGPFAL/WHVv3s5PARYijV80IBLee
         7GoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH//nJ10J6mlpPyYg7lS3n/Yc797aq2saONTLCpJgk3jj6FtDJ3vZIW37qYtaA4t8kcCN0b4s6GYJGYiWjo54=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqTjB/ibyFZajAj3WyaDyc7wbFK1F7+PkHfHMgt0EebDyl8dom
	2XOmyCPBc4N0XwDhQdsEO+tZySKr9wzCSI/C7F5TsyMOuI3qua3oo2Cp
X-Gm-Gg: ATEYQzysdMm5SSkwDpmxcmNMKyToqTRsxnC7qtqkBzsJez/S0xtVCl7fmJdzzaWk+BZ
	KaONZHaurcyGsyWUYb2LMnCTEuRXi9kQTFY0rVCwAPlDmoEiLpadK89lACTewixrTqC9GzIjJjM
	mbByAJ8j4jKR+u+WtOEmnVjYQWOoqjo4ZoeKL0FPsDQY3z8ooP5iZr5dKX6M2N7vzDCPUOOFDqe
	NQ4e5FDyoamDBQBvsHM0gvARZ4plTg6YWsJ6VY3YhU53WVyReUYxM2QGXmAQPshRkqk1Po+Xr29
	Qqmasg1NIZoNMMS1i47kCLLdt1/qfyPlimlXqKhfpKWcsXW7olEC1ODCgRl4EGfDKEHmhYqGvbz
	XCmB8yfd7TLHD8dxEuSUUttjGCI7ive8kecieobFnrv/7PIv0L5eNXkMJqgfLlMPGgWt4Zm3gTu
	ILvOjJzo9jY2oeXOvEUYRu7d+83resEVNZkRtKkMi5gYvfL0PJ1nUUWnKpDnc2zr4B
X-Received: by 2002:a17:902:d592:b0:2ad:d0ff:2ed4 with SMTP id d9443c01a7336-2ae2e3e3c91mr110237765ad.6.1772455271425;
        Mon, 02 Mar 2026 04:41:11 -0800 (PST)
Received: from localhost.localdomain ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3d1956absm67910225ad.14.2026.03.02.04.41.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Mar 2026 04:41:11 -0800 (PST)
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
	linux-kselftest@vger.kernel.org
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/6] selftests/bpf: Add test case for bpf_list_add_impl
Date: Mon,  2 Mar 2026 20:40:26 +0800
Message-ID: <20260302124028.82420-5-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260302124028.82420-1-pilgrimtao@gmail.com>
References: <20260302124028.82420-1-pilgrimtao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kaitao Cheng <chengkaitao@kylinos.cn>

Extend refcounted_kptr test (test_list_add_del) to exercise bpf_list_add:
add a second node after the first, then bpf_list_del both nodes.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 .../testing/selftests/bpf/bpf_experimental.h  |  14 +++
 .../selftests/bpf/progs/refcounted_kptr.c     | 105 ++++++++++++++----
 2 files changed, 97 insertions(+), 22 deletions(-)

diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
index b4fb0459f11f..48106ea5dda8 100644
--- a/tools/testing/selftests/bpf/bpf_experimental.h
+++ b/tools/testing/selftests/bpf/bpf_experimental.h
@@ -109,6 +109,20 @@ extern struct bpf_list_node *bpf_list_pop_back(struct bpf_list_head *head) __ksy
  */
 extern struct bpf_list_node *bpf_list_del(struct bpf_list_node *node) __ksym;
 
+/* Description
+ *	Insert 'node' after 'prev' in the BPF linked list. 'prev' must already
+ *	be in a list; 'node' must not be in any list. The 'meta' and 'off'
+ *	parameters are rewritten by the verifier, no need for BPF programs to
+ *	set them.
+ * Returns
+ *	0 on success, -EINVAL if prev is not in a list or node is already in a list.
+ */
+extern int bpf_list_add_impl(struct bpf_list_node *prev, struct bpf_list_node *node,
+			     void *meta, __u64 off) __ksym;
+
+/* Convenience macro to wrap over bpf_list_add_impl */
+#define bpf_list_add(prev, node) bpf_list_add_impl(prev, node, NULL, 0)
+
 /* Description
  *	Remove 'node' from rbtree with root 'root'
  * Returns
diff --git a/tools/testing/selftests/bpf/progs/refcounted_kptr.c b/tools/testing/selftests/bpf/progs/refcounted_kptr.c
index c4fb5615d08b..4d979f5ad9e8 100644
--- a/tools/testing/selftests/bpf/progs/refcounted_kptr.c
+++ b/tools/testing/selftests/bpf/progs/refcounted_kptr.c
@@ -367,18 +367,19 @@ long insert_rbtree_and_stash__del_tree_##rem_tree(void *ctx)		\
 INSERT_STASH_READ(true, "insert_stash_read: remove from tree");
 INSERT_STASH_READ(false, "insert_stash_read: don't remove from tree");
 
-/* Insert node_data into both rbtree and list, remove from tree, then remove
- * from list via bpf_list_del using the node obtained from the tree.
+/* Insert one node in tree and list, remove it from tree, add a second
+ * node after it in list with bpf_list_add, then remove both nodes from
+ * list via bpf_list_del.
  */
 SEC("tc")
-__description("test_bpf_list_del: remove an arbitrary node from the list")
+__description("test_list_add_del: test bpf_list_add/del")
 __success __retval(0)
-long test_bpf_list_del(void *ctx)
+long test_list_add_del(void *ctx)
 {
-	long err;
+	long err = 0;
 	struct bpf_rb_node *rb;
-	struct bpf_list_node *l;
-	struct node_data *n;
+	struct bpf_list_node *l, *l_1;
+	struct node_data *n, *n_1, *m_1;
 
 	err = __insert_in_tree_and_list(&head, &root, &lock);
 	if (err)
@@ -392,29 +393,62 @@ long test_bpf_list_del(void *ctx)
 	}
 
 	rb = bpf_rbtree_remove(&root, rb);
-	if (!rb) {
-		bpf_spin_unlock(&lock);
+	bpf_spin_unlock(&lock);
+	if (!rb)
 		return -5;
-	}
 
 	n = container_of(rb, struct node_data, r);
+	n_1 = bpf_obj_new(typeof(*n_1));
+	if (!n_1) {
+		bpf_obj_drop(n);
+		return -1;
+	}
+	m_1 = bpf_refcount_acquire(n_1);
+	if (!m_1) {
+		bpf_obj_drop(n);
+		bpf_obj_drop(n_1);
+		return -1;
+	}
+
+	bpf_spin_lock(&lock);
+	if (bpf_list_add(&n->l, &n_1->l)) {
+		bpf_spin_unlock(&lock);
+		bpf_obj_drop(n);
+		bpf_obj_drop(m_1);
+		return -8;
+	}
+
 	l = bpf_list_del(&n->l);
+	l_1 = bpf_list_del(&m_1->l);
 	bpf_spin_unlock(&lock);
 	bpf_obj_drop(n);
-	if (!l)
-		return -6;
+	bpf_obj_drop(m_1);
 
-	bpf_obj_drop(container_of(l, struct node_data, l));
-	return 0;
+	if (l)
+		bpf_obj_drop(container_of(l, struct node_data, l));
+	else
+		err = -6;
+
+	if (l_1)
+		bpf_obj_drop(container_of(l_1, struct node_data, l));
+	else
+		err = -6;
+
+	return err;
 }
 
 SEC("?tc")
-__failure __msg("bpf_spin_lock must be held for bpf_list_del")
-long list_del_without_lock_fail(void *ctx)
+__failure __msg("bpf_spin_lock must be held for bpf_list api")
+long list_add_del_without_lock_fail(void *ctx)
 {
+	long err = 0;
 	struct bpf_rb_node *rb;
-	struct bpf_list_node *l;
-	struct node_data *n;
+	struct bpf_list_node *l, *l_1;
+	struct node_data *n, *n_1, *m_1;
+
+	err = __insert_in_tree_and_list(&head, &root, &lock);
+	if (err)
+		return err;
 
 	bpf_spin_lock(&lock);
 	rb = bpf_rbtree_first(&root);
@@ -429,13 +463,40 @@ long list_del_without_lock_fail(void *ctx)
 		return -5;
 
 	n = container_of(rb, struct node_data, r);
+	n_1 = bpf_obj_new(typeof(*n_1));
+	if (!n_1) {
+		bpf_obj_drop(n);
+		return -1;
+	}
+	m_1 = bpf_refcount_acquire(n_1);
+	if (!m_1) {
+		bpf_obj_drop(n);
+		bpf_obj_drop(n_1);
+		return -1;
+	}
+
+	if (bpf_list_add(&n->l, &n_1->l)) {
+		bpf_obj_drop(n);
+		bpf_obj_drop(m_1);
+		return -8;
+	}
+
 	l = bpf_list_del(&n->l);
+	l_1 = bpf_list_del(&m_1->l);
 	bpf_obj_drop(n);
-	if (!l)
-		return -6;
+	bpf_obj_drop(m_1);
 
-	bpf_obj_drop(container_of(l, struct node_data, l));
-	return 0;
+	if (l)
+		bpf_obj_drop(container_of(l, struct node_data, l));
+	else
+		err = -6;
+
+	if (l_1)
+		bpf_obj_drop(container_of(l_1, struct node_data, l));
+	else
+		err = -6;
+
+	return err;
 }
 
 SEC("tc")
-- 
2.50.1 (Apple Git-155)

