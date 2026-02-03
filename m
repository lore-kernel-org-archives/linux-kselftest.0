Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5D82F28FB
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Feb 2026 02:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770085652; cv=none; b=VsLm4ckF2WDnCg3a2txFqT42J3KdXJK9/S6fGK5b+agyMsphO3f9JaCfMLeYV7UjpXVk2jHZ+A2RH4hiTG2uJDCOMunD/LpNf8sYqnze/jWZQ4M1vwcxJtor/kwb9EivbNIYjuPmGqIWpcUpSpfnIp7H4iAfUCttG4GcLKudAmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770085652; c=relaxed/simple;
	bh=kPggzZIm96TRb/FKapQWnHk9ReIs7DNsMTFOONxjQzU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jD7Wf1f5YrajKVqUXTo0uWexWW8euTmAeOzalrc61l30ao4tP22rCtk7LuSN/2oBYmAeHB6Xs794EjISku8fIJepit/wGgH4tG/NXyGK0zqgeC7Tfc+kn07AjbbKPU6jFwI5H+Y1ywOgCAZefHJOpEecnj6socmIid6/578Yzy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJzhVpUD; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJzhVpUD"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-82361bcbd8fso2980455b3a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Feb 2026 18:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770085651; x=1770690451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nkA9MaWRwNjxNhYn+Z2bOC8alIVsObfDtM0GupRSibE=;
        b=hJzhVpUDzSBgL6e2KAIIcjkgRhy6jgCflIxOPiDgsWU/R5EG1x80qhdgxTER4KGtap
         GibRYxfK0TPkLOu8eP4alb6I5Kj+QbV/NVxHFO7VlqQ+W5NS4Z0tNOSd7wdtE31k3xgr
         rzul7a39PGOa9m4BmrBx4QhVIRWskRFFyPu8G0UPpcNlVF0kbX8AYnpw0a5SqZq9Ku1X
         IZnyLxTh3noT2eidebcUBxCmuC8oyH+hm0A42uMvIi5stTIEtxvsevdOjTUcQwu2cZ8y
         BHcBo2XkcFWmW2Tgkj61WWFP19LS0+Ytcz7maA6XoxKjEp9eH0jm/9hUZuVt+DoyeouM
         hhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770085651; x=1770690451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkA9MaWRwNjxNhYn+Z2bOC8alIVsObfDtM0GupRSibE=;
        b=p1/DSTwpMZxTl0Pak1AQf1/zV9ZX7mVKMKKsJXLLpnjzFcta2bqeldBhXUK9fA3z4H
         1T22xXu/hZg3oPQ1Su5goX1ao7OKfovGqZfSGMj/+ZQfA6JEM3Z0PsFzwgiFRJ7NFkxT
         yZy9pIOUI94IgceZt6TwuSOiWTvfj5HMY/ZLsPMAeaV9RgJpKEh7WLryG0CG4OlRQbHl
         J4E7s68NEB9zAqXCJvje3C9Gm7zyvRUXY5AqMxfgN+YQBpEDs4zAI0FKrtrrdoqOOkk+
         2Zwx7CX/+/Q+wAJl7d5oIeJf3cOUP/o/r1EZ7vjXUL0RRAEwn3jGnFzw29xDSeHRfGKz
         Z3dA==
X-Forwarded-Encrypted: i=1; AJvYcCVfRqTlIBM/vvsrYY5WeL2KBxAzcpJOsDuY8wgibU7TePI0MZtQcJSQudMb3sqU6lRG/9Y/y0rbDkrDBHVVrlE=@vger.kernel.org
X-Gm-Message-State: AOJu0YycOz2RsPbAZeHxq7qDAylfqUFk7eiDgKKHqGisJDVWsoDZu3k0
	UQId40HHwfRCihkGCskslOoWaWuQTf/NPwnL44wjsxxN1vTCO6bYygJt
X-Gm-Gg: AZuq6aI4esjqJqwtVXn5E17wXZGZ3sCHJk82kPt93CgSty1ECVdcMTJ5sBCN9yzuGsq
	3Xmcy+KIJH4+RO6vbE6LX0s0DwRZtt4ICxdRBoSU/ks1BHhXFAnl7UPhimIoXttiLVBe5wdb+sZ
	wYBSueIMea/OrlvjkQ5mKIHX/6sDai5xApSE9j9TNmfMGwte7l8DXkCUDAG3OdaBV4qOar4kkUD
	tJAEvwiII3wDAcB2bqsTvCduNIGH8vDy94+LHmamHteV2JvGOD35faPFQx2JyCYUGtglJv2xJ8C
	aNB3Y21zqO1ns2ZQfTpLeiojTxQaQnbtCR5DPdXKBELxKAEO1yo2B+Jat+nEBu/p7ve26yDGdDu
	AkcVo+ABo4YF1HRnmvgsT5g7VCjZpRG1vGeAg8a70NHb8QtXMNCtmiSTMVbcbG/CBnAbMxyrEKM
	cCznVBFzAL+ebMxS9ZzdexQFNurFU726BQlFeVPr1m8Q==
X-Received: by 2002:a05:6a00:ad81:b0:823:69c:931a with SMTP id d2e1a72fcca58-823ab65a326mr13146087b3a.16.1770085650612;
        Mon, 02 Feb 2026 18:27:30 -0800 (PST)
Received: from localhost.localdomain ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b58f38sm17803073b3a.24.2026.02.02.18.27.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Feb 2026 18:27:30 -0800 (PST)
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
Subject: [PATCH v5 0/3] bpf/verifier: Expand the usage scenarios of bpf_kptr_xchg
Date: Tue,  3 Feb 2026 10:27:09 +0800
Message-ID: <20260203022712.99347-1-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chengkaitao Com <chengkaitao@kylinos.cn>

When using bpf_kptr_xchg, we triggered the following error:
    31: (85) call bpf_kptr_xchg#194
    function calls are not allowed while holding a lock
bpf_kptr_xchg can now be used in lock-held contexts, so we extended
its usage scope in [patch 1/2].

When writing test cases using bpf_kptr_xchg and bpf_rbtree_*, the
following approach must be followed:

	bpf_spin_lock(&lock);
	rb_n = bpf_rbtree_root(&root);
	while (rb_n && can_loop) {
		rb_n = bpf_rbtree_remove(&root, rb_n);
		if (!rb_n)
			goto fail;

		tnode = container_of(rb_n, struct tree_node, node);
		node_data = bpf_kptr_xchg(&tnode->node_data, NULL);
		if (!node_data)
			goto fail;

		data = node_data->data;
		/* use data to do something */

		node_data = bpf_kptr_xchg(&tnode->node_data, node_data);
		if (node_data)
			goto fail;

		bpf_rbtree_add(&root, rb_n, less);

		if (lookup_key < tnode->key)
			rb_n = bpf_rbtree_left(&root, rb_n);
		else
			rb_n = bpf_rbtree_right(&root, rb_n);
	}
	bpf_spin_unlock(&lock);

The above illustrates a lock-remove-read-add-unlock workflow, which
exhibits lower performance. To address this, we introduced support
for a streamlined lock-read-unlock operation in [patch 2/2].

Changes in v5:
- add lastname
Changes in v4:
- Fix the dead logic issue in the test case
Changes in v3:
- Fix compilation errors
Changes in v2:
- Allow using bpf_kptr_xchg even if the NON_OWN_REF flag is set
- Add test case

Link to v4:
https://lore.kernel.org/all/20260202090051.87802-1-pilgrimtao@gmail.com/
Link to V3:
https://lore.kernel.org/all/20260202055818.78231-1-pilgrimtao@gmail.com/
Link to V2:
https://lore.kernel.org/all/20260201031607.32940-1-pilgrimtao@gmail.com/
Link to V1:
https://lore.kernel.org/all/20260122081426.78472-1-pilgrimtao@gmail.com/

Chengkaitao Com (3):
  bpf/verifier: allow calling bpf_kptr_xchg while holding a lock
  bpf/verifier: allow using bpf_kptr_xchg even if the NON_OWN_REF flag
    is set
  selftests/bpf: Add supplementary tests for bpf_kptr_xchg

 kernel/bpf/verifier.c                         |   7 +-
 .../testing/selftests/bpf/prog_tests/rbtree.c |   6 +
 tools/testing/selftests/bpf/progs/bpf_misc.h  |   4 +
 .../selftests/bpf/progs/rbtree_search_kptr.c  | 167 ++++++++++++++++++
 4 files changed, 182 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/progs/rbtree_search_kptr.c

-- 
2.50.1 (Apple Git-155)

