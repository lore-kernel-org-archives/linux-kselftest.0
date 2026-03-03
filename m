Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D18E35C188
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Mar 2026 13:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772545968; cv=none; b=Z8qd002v/F/GHxbdb7LjtSlBsPUFmIrzcV7DHoyUKi44jyN5BEyOj/GKg7hJob+m/Spc+jkQRzpbH79HObu2v7DY2qhj62pZMh6sARGgwn8e2Bi6NLl+N/jid95WhMZDCmjtpthEg5kR/GfFZKMwHWkVHWPt/1B7TpIeQW7FWgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772545968; c=relaxed/simple;
	bh=bXOZyfrjjEJNg2zXkkRsWg+H9U/k/NIMjxFzOVXWV+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YcqszRvlHt2GpElsXZ+MNnbgWIUm6ixe996RvDzLr9A79bSExjBWRur+a22dIkqi0zwVV6/SCp9FbDJyn9y1Hjj4vIdlVC4J7p7d2BX+Vhv+vzsQD5gXb3oqnAl5n3k9HzBuu/wyNcA7vQVLeUrDslUdZUDbJh3Z5K8pTAwJNmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=izg8TOLB; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="izg8TOLB"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-81df6a302b1so6120141b3a.2
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Mar 2026 05:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772545966; x=1773150766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5WORjt7SxVQlhYT/6rzYEp8dt5s0cz4VVG01wwIAJ8=;
        b=izg8TOLB1yNjkO5NJ3g2uyGdEc0fIY3Giyvue25EIY/pftojzqi7WrKFao3DXMwX/8
         sX7sUn9Ktm6wa7s0qPDrR3S+A6qqfH02L039X5VFNkTwbwDmNGlOCjy8Ef4t7FdrWb0R
         YyxFvRw1Pw1Eo3Y98bPYQ8MHBRBoC0cYn5PtAjIIl1fJ3HwjIaL8vin3cybo9GgCCGr9
         neWQNP8Bom80TpCfTbcN5TFem4x5MOXA5RkT09J5XTpm343ATOzV52ZnUL72GA7tsEf9
         1GeztXCc109EglgOOHhKMiC3FWlF0FiQHFA2szCLXFBSTULq3IspBhcGlsv1DsvM3CXv
         cgjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772545966; x=1773150766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U5WORjt7SxVQlhYT/6rzYEp8dt5s0cz4VVG01wwIAJ8=;
        b=pPoS3sGr22l7lApOx1GEppuW2mwc6k1QCKYBF4f5Qbmfnwy5muO/3CixMtBs5RIBse
         Zw6qAlOkUi8d1mfDhwh3BaTjdpeBi72zZDYOseE9bOg12LXgLe3zyJI95xuXTVKJSv02
         RAje40dXNpoWQmywtuqbAvqzu/Ysd2jDckZNiW6JTwaAolfE6/SrFM1goL+rOZi2Nrku
         HnlzItwnD8hgUHqCZk7XinWxUAFI9UV8aEavP/evf0UvZdlEH9SMU3uQCVluVbC1KkRc
         3nEH9GEL+pPpnr8f4rRGiTwTLsGrXYT3v9XISne/xuN+jhoGk+vbnCYrbkn0LRyjGLES
         0AaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzjkUOWPOUUULZ4lq0PDBTKRVBQjuTeB7aNTFJolonAMsxPT5kGWZq9PpZdWnIWOyBNQzUGo/J25nPThXSq/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV/09RsO9e/eZ19WnRtpqtal4OpO1nEurSUCOF+o/BFEz/vJJL
	4lidvLZKv/HD7YnnsF6LhQYrTS0KvviR8HaPG4RWIMECiV3egRdC+yvX
X-Gm-Gg: ATEYQzwpXwm2a8rR9qUQvCPIH1+qbzulKw4rZCJA1Q/LSqwRU7g9Go0dx3K858THxiv
	9PFjMkLdKerYoXNrgFb9+QibeKJT4IcY/DhzdUaTC8FaHS2w3m1/e27dUTzPElT5XfuO7xmyG5y
	J4D6nKS6n0kYonQdXEaKiwYGSKHr8xRlBr5CFaRk7dxEVKWvrSel63pHb6SsHU+B24zl3KO6c31
	Q6vUenKYwqdwyaRMzopnIijQDn/PzCnBSZOYJanx074kutyXMi1TSp8qLKhnF5CdCFMTQejEAWm
	eRoTrznSZ8Ai5FCMAhPvzQfBJlv6Pmk2R/vv6mLaq9o2Y74bJRcZJjn72xTm5OhpXT7klYYBv8Y
	rvoRC6XF+3fdm8Wh7L1NyYwcoiCyzgll0wSvogAdAd7bLu920iA4Xk3OFeNPD2IocgnDbcz7z4X
	kwvrzUJXUVK6fhSsVju2TVh0W70k2GTLPbwws0wUi0ofqGiIc3
X-Received: by 2002:a05:6a21:140a:b0:395:6f58:d4b7 with SMTP id adf61e73a8af0-395c3a0cbafmr15399033637.6.1772545966299;
        Tue, 03 Mar 2026 05:52:46 -0800 (PST)
Received: from localhost.localdomain ([113.218.252.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa62147esm14689782a12.12.2026.03.03.05.52.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Mar 2026 05:52:46 -0800 (PST)
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
Subject: [PATCH v4 1/6] bpf: Introduce the bpf_list_del kfunc.
Date: Tue,  3 Mar 2026 21:52:14 +0800
Message-ID: <20260303135219.33726-2-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260303135219.33726-1-pilgrimtao@gmail.com>
References: <20260303135219.33726-1-pilgrimtao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kaitao Cheng <chengkaitao@kylinos.cn>

If a user holds ownership of a node in the middle of a list, they
can directly remove it from the list without strictly adhering to
deletion rules from the head or tail.

This is typically paired with bpf_refcount. After calling
bpf_list_del, it is generally necessary to drop the reference to
the list node twice to prevent reference count leaks.

Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
---
 kernel/bpf/helpers.c  | 19 +++++++++++++++++++
 kernel/bpf/verifier.c |  6 +++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index 6eb6c82ed2ee..19d88da8e694 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -2459,6 +2459,24 @@ __bpf_kfunc struct bpf_list_node *bpf_list_pop_back(struct bpf_list_head *head)
 	return __bpf_list_del(head, true);
 }
 
+__bpf_kfunc struct bpf_list_node *bpf_list_del(struct bpf_list_head *head,
+					       struct bpf_list_node *node)
+{
+	struct bpf_list_node_kern *knode = (struct bpf_list_node_kern *)node;
+	struct list_head *h = (void *)head;
+
+	if (unlikely(!knode))
+		return NULL;
+
+	if (WARN_ON_ONCE(READ_ONCE(knode->owner) != h))
+		return NULL;
+
+	list_del_init(&knode->list_head);
+	WRITE_ONCE(knode->owner, NULL);
+
+	return node;
+}
+
 __bpf_kfunc struct bpf_list_node *bpf_list_front(struct bpf_list_head *head)
 {
 	struct list_head *h = (struct list_head *)head;
@@ -4545,6 +4563,7 @@ BTF_ID_FLAGS(func, bpf_list_push_front_impl)
 BTF_ID_FLAGS(func, bpf_list_push_back_impl)
 BTF_ID_FLAGS(func, bpf_list_pop_front, KF_ACQUIRE | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_list_pop_back, KF_ACQUIRE | KF_RET_NULL)
+BTF_ID_FLAGS(func, bpf_list_del, KF_ACQUIRE | KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_list_front, KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_list_back, KF_RET_NULL)
 BTF_ID_FLAGS(func, bpf_task_acquire, KF_ACQUIRE | KF_RCU | KF_RET_NULL)
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 67c09b43a497..c9557d3fb8dd 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -12461,6 +12461,7 @@ enum special_kfunc_type {
 	KF_bpf_list_push_back_impl,
 	KF_bpf_list_pop_front,
 	KF_bpf_list_pop_back,
+	KF_bpf_list_del,
 	KF_bpf_list_front,
 	KF_bpf_list_back,
 	KF_bpf_cast_to_kern_ctx,
@@ -12521,6 +12522,7 @@ BTF_ID(func, bpf_list_push_front_impl)
 BTF_ID(func, bpf_list_push_back_impl)
 BTF_ID(func, bpf_list_pop_front)
 BTF_ID(func, bpf_list_pop_back)
+BTF_ID(func, bpf_list_del)
 BTF_ID(func, bpf_list_front)
 BTF_ID(func, bpf_list_back)
 BTF_ID(func, bpf_cast_to_kern_ctx)
@@ -12996,6 +12998,7 @@ static bool is_bpf_list_api_kfunc(u32 btf_id)
 	       btf_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
 	       btf_id == special_kfunc_list[KF_bpf_list_pop_front] ||
 	       btf_id == special_kfunc_list[KF_bpf_list_pop_back] ||
+	       btf_id == special_kfunc_list[KF_bpf_list_del] ||
 	       btf_id == special_kfunc_list[KF_bpf_list_front] ||
 	       btf_id == special_kfunc_list[KF_bpf_list_back];
 }
@@ -13118,7 +13121,8 @@ static bool check_kfunc_is_graph_node_api(struct bpf_verifier_env *env,
 	switch (node_field_type) {
 	case BPF_LIST_NODE:
 		ret = (kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_front_impl] ||
-		       kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_back_impl]);
+		       kfunc_btf_id == special_kfunc_list[KF_bpf_list_push_back_impl] ||
+		       kfunc_btf_id == special_kfunc_list[KF_bpf_list_del]);
 		break;
 	case BPF_RB_NODE:
 		ret = (kfunc_btf_id == special_kfunc_list[KF_bpf_rbtree_remove] ||
-- 
2.50.1 (Apple Git-155)

