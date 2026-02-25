Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2B137E314
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 09:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772011666; cv=none; b=hdK1pjXvdBJ66WHjC3a3O1T8Mn5lPKXVb7IjVmVp0q3KvkRB1Iul/iL3LEWhaQrVxaKEvvX8Z6qoWFSr3pTQVVDsJwzlgMAS6/davMd4AlSvsVoL3iVnL1WsziNxNF00pWz2+JbN14IxCpzGnCvjA0Pk6eBC8o7dSaJITb5qYek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772011666; c=relaxed/simple;
	bh=ntnkQefVl45lQLEojls73Rs/Y+YFDH/AmymklrtPohE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lrme/2m2IPIL/aj3IWY+EL9yYJ1i49kYg2BtJKTH9TTXsEf82vtr98XiQbByc6r9eIGNuefduYObw4yvxofS9cxM8qfj+HM4HxYd5kdSPOLL6IET2ippbTKffpR0s3M1MGBPqjuEeU1GtfibrOtLPUR6BdZO/IKOirXSvHg0+FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b076u3PR; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b076u3PR"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-358ed67cd4bso355855a91.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 01:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772011663; x=1772616463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edeAv+lo1yi2ZetRpzlKqTFXrWjKU1IM+ewr9/GQxlk=;
        b=b076u3PRUo9NH4yBxsw0ocdQFubUZl9GwZfd5pywQn48+YjpU3vMoXmZrdsi5GbXxi
         9YPfZo0BoAbVrHAqwOzi4apQtJg2+jWopn2XaUWsGuyqwRpsOhLCSiuHZ3MrF5Gjq5E7
         +ZKKf5uFUrYxvT6Hp5lo9ozzoLWDsHx992gQ0SPYXbN1XKC9AUdQZynRT3jax/h8vtvK
         /UcOP7+L5PikaAMwGO+ST0KyNUcRIyxf7j/o4kJ1Binv3kV84hXNFu2v8I6G/m06Xunm
         zAo/vw5pYqYTWx8YofVYvkNkf+cnhASVFY5ew/e+FejCXdPxupe68QrxEZS/ZUadUdOG
         Cu6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772011663; x=1772616463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=edeAv+lo1yi2ZetRpzlKqTFXrWjKU1IM+ewr9/GQxlk=;
        b=RoHswReTUVQE019E0Qt1sqKAEydnooGFiiaBUtSdlV6mVRn5gJFGFN1CH85ZEe1gM9
         CgnCoPTA/mcqObaTF1lwMdr18HM5pPrR6w5FZZYFZWvnAzz1UUvjEdznXJ7EOEEW6qwJ
         PWEHk9qTZoOI2p2Bq0PsHKxirk1DgPgDoNybcrEWIATVWO8rJ4E/qsmRwr8lRMSDuA7b
         LRX8aqKX31/1OmiCdOxLf18aDi3zSqtStw95YCO+nAIY8mZ54Z2pkPbQulWYGLMO7WUO
         i4+MQG7iMzqqLm4XdntR1uAU2HXXXPnVorG33O4VWeg7sZq37HKMPpl30qNi2EVy0ZTt
         e9WA==
X-Forwarded-Encrypted: i=1; AJvYcCUptG+ZGfw9jceqqEuc6OqpMPU9gXgX4zgb7A+GIrCDUuWKDXF/vWWRdTaUkiGssR7QRARsumIUsRn/1u6iH4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTlz+c8bwEZv5SfFHY67nfFQuY09EIdUo/VixEAI+Vi2YdrEMK
	Vk5r4qgxZmfGxAVHSmSYcX8uLLYemgT3ViYalUJ9I+yH1RBznp8r/Kz7
X-Gm-Gg: ATEYQzw+Zk2DBlNjX+yZPxLNfu2AI1bDQIjQRCwiVV+0w2csood4tB2sZRVxiCl8ZTb
	ql6vIe306NEfUxHANAw5EeP/KaLHibmRdpUR/wlmiEN65+J42YMTFMbIEgFsZvrab6fRQ78qB4/
	vqT90/R0L/JT4Awnbt2z0pMNGSgWR890I7U9xk+ceIYGV+RqRFWThT6DxgbwsomxTKQ9w354P/U
	fnosDJJgbZCDvKbymkl2uV64Og01YU0JSZ/dR4COuUMomLKVoQ2BABK5PpzeonZ6OIf3dJG+TXe
	ffFJw59wMNVFFxba6p6Ktl3r5ADEDgMvpzLjh+OXyQs7hHepJ4EaUHvtTCmechzVc4P2r7xnfxc
	YaMjjp3QnE1VPg1tgFYqHzckX54a3Z6DyvFtAMO12ohtlqZe+rOphLKqVA0Qq2eQB+0aDuT2QSb
	+zsbnzJr4slQqaElheDK7Sij6MSxdY6qUFFWat+IJd+b/cbHJldjIsnQ==
X-Received: by 2002:a17:90b:5787:b0:34c:7212:7a67 with SMTP id 98e67ed59e1d1-3590382bfabmr2213562a91.12.1772011663325;
        Wed, 25 Feb 2026 01:27:43 -0800 (PST)
Received: from localhost.localdomain ([113.218.252.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35912f5f29fsm837901a91.1.2026.02.25.01.27.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 Feb 2026 01:27:43 -0800 (PST)
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
Subject: [PATCH v2 2/6] selftests/bpf: Add test cases for bpf_list_del
Date: Wed, 25 Feb 2026 17:26:47 +0800
Message-ID: <20260225092651.94689-3-pilgrimtao@gmail.com>
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

Add a node to both an rbtree and a list, retrieve the node from
the rbtree, use the obtained node pointer to remove it from the
list, and finally free the node.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 .../testing/selftests/bpf/bpf_experimental.h  | 10 +++++
 .../selftests/bpf/progs/refcounted_kptr.c     | 41 +++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
index 4b7210c318dd..c7c950e10501 100644
--- a/tools/testing/selftests/bpf/bpf_experimental.h
+++ b/tools/testing/selftests/bpf/bpf_experimental.h
@@ -99,6 +99,16 @@ extern struct bpf_list_node *bpf_list_pop_front(struct bpf_list_head *head) __ks
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
+extern struct bpf_list_node *bpf_list_del(struct bpf_list_node *node) __ksym;
+
 /* Description
  *	Remove 'node' from rbtree with root 'root'
  * Returns
diff --git a/tools/testing/selftests/bpf/progs/refcounted_kptr.c b/tools/testing/selftests/bpf/progs/refcounted_kptr.c
index 1aca85d86aeb..86f7f5f8e4c8 100644
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
+	l = bpf_list_del(&n->l);
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

