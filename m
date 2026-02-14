Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CDF1E5201
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Feb 2026 04:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771043802; cv=none; b=s6ff4ohFU6dF1QfOuDD7kKa+6imnw76IyRqy1UfF5V3mAPb3eU3Xj6hFIzYUXHP19Ub2d2GlYivuLnoZrLzg+eQkH2rT3oa0RCyxq0MCRInrmT7EPAX81RitVB7u1STkKaFoOFYgWSY1YsPMZbw+YTBqqkDm2SNjNnPjlHhitYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771043802; c=relaxed/simple;
	bh=kUZ3TAp/44GbGN69+FneMpT4zG8HXhDlDcPA1PDxXd8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pOfzW807v5mqEYz3zWn4VtDGgko1Lcv/BjrzGdo/xg74RXvNJ3MmCUDkYTlrUxJoxUTutOoRxXNsjlnIfxQyK7aOA86KXVtIrU/d3fcN6GFYVBDqEwFx23pGSxX3CuB9gCQmrgwLZT+plZbutmxB1JnrBUBauyIUm2UFJWDpLH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IuH+tcKS; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IuH+tcKS"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82361bcbd8fso821323b3a.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Feb 2026 20:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771043801; x=1771648601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K4gRHmoXRE/fcFPdbacL9d9KCJ6JNq7p//h36U0/+hs=;
        b=IuH+tcKS8CDE9WD+0vAlfeeW4jAfjWeqrTEgNdiwuV99TnDrkroGJUkhKF0kFmSbGc
         C+M4CPYPoPL9gaI6j6Bcwyx785bSnRt4IKJ+4ZtW27LGdvCzrjmpuxTfJK3QBZBPB3q0
         UWokrKdjiPZ+cN4Dy8CxyA3JE9i0wsCjN3NE/mhBAvShdE9oH39MjuWPmwyFluc4H1Zu
         apvbB/xuHO2jm8mu5N3v6017l06RB5d502Zch/FddRncd/UhvsjURIc+UvXIFOkK9GvQ
         7ZxJjB/YNDoM6Hw9UeC57zhuOyMvJAo2spanVYagw3aUtbWrE+8FhNP61+kRvyKuRYHY
         uX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771043801; x=1771648601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4gRHmoXRE/fcFPdbacL9d9KCJ6JNq7p//h36U0/+hs=;
        b=JZlj8rY/SU7I5utwoqVbLb5bwQ/MGbzELNAWzOSh+3RCTV5OqcNl3OYY66NL01dxfj
         fdBTm36TqScmNgAokmcU4GdEDx29CAFDlHc/dIlX2CuuNq73SWpHe8HE1Q4OPKA69bxc
         noHSz+qeAFW4MY2cZaKKvxTJUEcacbsoTPbex/401h7rl78Av2pI++ApjpUFZrV9uA6C
         k/TspJls0RUFAuGFOA/Mz34v4gl/gY4uxtzfgKlh5b5WPTy467ni1qqkTCQe8Y06vU7Q
         7hPE4wqBIV9l/mZh2JaN8RxdYkiJOMLeZS549GnlcpSeoIRj5yZACiLyErDfQNAidpqQ
         FT8g==
X-Forwarded-Encrypted: i=1; AJvYcCVmi+p/83Xd7wvclNldcO0IFwyCZb7hwwaGhI+6LnJmPoXmEtXQj42EXKET3lf9RrSNlzQYqRoj1qXndKNXD4U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg92+6u21amXo/8QQCfAyvj6FWIcNow+9fDr+0w78DE+P9QA4s
	J7NbAAzlaORQfCVqcQ7hP5+bdSIT/f1pK8ftRkaOm9f4kaeTvIPeMtAt
X-Gm-Gg: AZuq6aLxs/0/8c8FlQO3qlRog5kMjtkj+zHKpuaobogHIxQ6yfMt2TucsgS75DrpdIN
	LwfXNWyNDcc7yxzOEb+/bdKknUHed4bo/6jjnAWTLfLGg6nGTh+v+QHFylZFhqlfuskufc18DTx
	2VmHovfUEicmfFW2MFKHmEfRqky6R4FpbQHH3F7XJL63YT4ru2VgYl6sO0B/vKEDn88tTc3ynS4
	KbdvcgmFTpp15hFcdvmlhnCXGGpZW8udHwD94b8JNv9UfNEHxSafF5D5C+apJoHjTrHunLHKRoK
	VP7sDoPibci0RBqGGLau3Miio8uzdmzn7ioD4O5JM6vs3rfM0hm1pvLJ1IidJ8Dyyf3q+1i6PRs
	6XIx/5dBCWGGFJVlMyu/pZCiazG8PceQ483a3UslPxYS3NTwCOryxLMnhLj5AbSHLZk4foChXEe
	lU6WMzxRha9rD7okuJb8dkwjRkQswHM3c+Lpk1eE4gXZ4cn/xaA+2KMa+uso1zPwU=
X-Received: by 2002:a05:6a20:6a22:b0:392:e5eb:f04 with SMTP id adf61e73a8af0-39483aa9f62mr1438972637.72.1771043801018;
        Fri, 13 Feb 2026 20:36:41 -0800 (PST)
Received: from localhost.localdomain ([113.218.252.61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662e53936sm13519815a91.1.2026.02.13.20.36.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 13 Feb 2026 20:36:40 -0800 (PST)
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
	Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: [PATCH v7 0/5] bpf: Expand the usage scenarios of bpf_kptr_xchg
Date: Sat, 14 Feb 2026 12:36:25 +0800
Message-ID: <20260214043630.38644-1-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kaitao Cheng <chengkaitao@kylinos.cn>

When using bpf_kptr_xchg, we triggered the following error:
    31: (85) call bpf_kptr_xchg#194
    function calls are not allowed while holding a lock
bpf_kptr_xchg can now be used in lock-held contexts, so we extended
its usage scope in [patch 1/5].

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
for a streamlined lock-read-unlock operation in [patch 2/5] and
[patch 4/5].

Changes in v7:
- Add a comma to the variable declaration in enum bpf_reg_type
- Modify the prefixes
Changes in v6:
- allow using bpf_kptr_xchg even if the MEM_RCU flag is set
- Add test case
Changes in v5:
- add lastname
Changes in v4:
- Fix the dead logic issue in the test case
Changes in v3:
- Fix compilation errors
Changes in v2:
- Allow using bpf_kptr_xchg even if the NON_OWN_REF flag is set
- Add test case

Link to v6:
https://lore.kernel.org/all/20260208024846.18653-1-pilgrimtao@gmail.com/
Link to v5:
https://lore.kernel.org/all/20260203022712.99347-1-pilgrimtao@gmail.com/
Link to v4:
https://lore.kernel.org/all/20260202090051.87802-1-pilgrimtao@gmail.com/
Link to V3:
https://lore.kernel.org/all/20260202055818.78231-1-pilgrimtao@gmail.com/
Link to V2:
https://lore.kernel.org/all/20260201031607.32940-1-pilgrimtao@gmail.com/
Link to V1:
https://lore.kernel.org/all/20260122081426.78472-1-pilgrimtao@gmail.com/

Kaitao Cheng (5):
  bpf: allow calling bpf_kptr_xchg while holding a lock
  bpf: allow using bpf_kptr_xchg even if the NON_OWN_REF flag is set
  selftests/bpf: Add supplementary tests for bpf_kptr_xchg
  bpf: allow using bpf_kptr_xchg even if the MEM_RCU flag is set
  selftests/bpf: Add test case for rbtree nodes that contain both
    bpf_refcount and kptr fields.

 kernel/bpf/verifier.c                         |   9 +-
 .../testing/selftests/bpf/prog_tests/rbtree.c |   6 +
 tools/testing/selftests/bpf/progs/bpf_misc.h  |   4 +
 .../selftests/bpf/progs/rbtree_search_kptr.c  | 290 ++++++++++++++++++
 4 files changed, 307 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/progs/rbtree_search_kptr.c

-- 
2.50.1 (Apple Git-155)

