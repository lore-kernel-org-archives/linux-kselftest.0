Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10491B85F8
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Feb 2026 12:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771072855; cv=none; b=HDh61jpQmeWiGAzyen5NF8yNxkMnmq6NLRgOIx5/6BkOohnsxXH+T+9VaYtbXpmw8nmzNnq6Ml3IGawHWLd/NWxDgttbKPar2ObT+e91BfaU/edRPIZ++bYODZxVE4vCWpaptgpb5Lx2OzWPpKFRIhGkJf34KbVSvU8gkVJYgSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771072855; c=relaxed/simple;
	bh=kUZ3TAp/44GbGN69+FneMpT4zG8HXhDlDcPA1PDxXd8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E7eiWNk0G9Hy4Cvakpfdp0OSeKFrdal4KyuijMXOfrR8pCvVsVjbl8a/viBXsSUHW8yMBLGuiY1uIY0jsNclHy0uhGGNECJjSlleZijJ6JOByo3h5EfCWhuFbYwdQbYtbwGDLyFLutcKhrURvQp9TKI5FI23s918ThJrh0ognrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwwadwWy; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwwadwWy"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34c93e0269cso2603427a91.1
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Feb 2026 04:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771072852; x=1771677652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K4gRHmoXRE/fcFPdbacL9d9KCJ6JNq7p//h36U0/+hs=;
        b=RwwadwWyNxlHX+EkQqbJB9JpybnDui2N7keDPf7ILW444Pc3mGuEz1i3+reDQGz3P0
         lEJndqlGbQYM9jMxqEXrmzUmgYu28z0gqpbnzawAF9XAgL5qiS4FUWu7Ua/yARh09Zvr
         rYLiZ9D4nleLlDlrRbYNQHOZuXbrEzvWpF/Rze+O1eLwnpA/SrazPSxLN45D2MUEs1kt
         87o7fc1jywidnYPGoXzMGOzG3s4WTJMzzS2plx+TTNZFCxRYjjGx+vnWvGG7tqsvmr/b
         I8ck0CxyO5ZJX3WdzpT3FdSGekpldUETyf+/fQMJO1zjOc6Q7oft24owdVw+vqoO9lch
         PNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771072852; x=1771677652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K4gRHmoXRE/fcFPdbacL9d9KCJ6JNq7p//h36U0/+hs=;
        b=NYlgOpHCxSXIBhFOT2mt9Ar4VOB+PNhx4LLcwHGo3hBpHL7NHOxBlW4CM1aBtuIG+g
         GFMSM0Cq0Gig92MTWUvbebLucf8xiwrCxm79CPuFhnYvCt2BDpMDUk0cgHvkJqiKotsm
         WCmAdQbXpjWv3GdSgvglK+5M/RPscffj9JOADDDu9wEky2D20N7j/sMoPLJa+FSqP1id
         ADJMT9BINqE/yp8EqkKH4YJzIAdzXSsTALMp4j4LvWDjuUyDjoS6MlA0rBTmmgQOUMEi
         d/svymxxZs07K/1YPkCUORLNLT0rjWjtsmylaf58S3kdwFuIcBhmdSGgWlkExQj+jOea
         riwA==
X-Forwarded-Encrypted: i=1; AJvYcCUG7n5aLt53qRo1LZNRk2LWnAPMynQUe+3W2y19p1Uh1f/3f7ljSh7kg+oBeZswMJnuFjQS/ABw29uEAXOwkgI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBHRsod1EqvqAWzfIHgRcFDRJm9Tcs6WQ5BKR2iJetYGG6JCDm
	quQHSTvvQ/qNGp1iv249j5+9ybYlfHHKL6QkvOQWCjtH0zG0mwBvg4Tr
X-Gm-Gg: AZuq6aLYcZKv2QYBafN7VOtqUoVpUjGvaIJJ9IPFgnAm+MrhXPAb8MX0A4XLh02b8QO
	urR/PaAL6lqJNTkBcE7bnySWXh9oDitBCiogMyIHBT6Vo9iIQtS2n6n2hVyDa0pigBNwWrOJlWJ
	ozcY3Yov9gSdLvacDa+7rQTsafcAU0t/HuQRIsVzP4f9zFsJE4eFCNkB+aFO8YAHXza59ys4w/j
	EAyzv7trRzzWw8v4HuTeXYSqigFABAfMG3BqW30SzEEjwgQ7fbTt2gMRns3ARr5/JITWHnnY/gi
	tKDp0FJbx9CdbGx3y0/zN2L5jEzM2oMO5syi/w0cJb62VmhAm9y4t1NrPMr4GTi2fpBMlUeHtMv
	yNf8zaSVhKsoz9lCMwvqCezcYBfVwme1WGbWW9JKju3mBoIM677EEdlsMcRP4+mKFgxOy9HqsHk
	xchoZGVqgHlu7mYDWGOfbuD6Ja4FI/93aTqawl/tcI0PvaCYSqjSF0
X-Received: by 2002:a17:90b:2544:b0:356:256c:4bf0 with SMTP id 98e67ed59e1d1-357b51d0e56mr2341557a91.17.1771072852134;
        Sat, 14 Feb 2026 04:40:52 -0800 (PST)
Received: from localhost.localdomain ([113.218.252.61])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6a2e40bsm7064497b3a.11.2026.02.14.04.40.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Feb 2026 04:40:51 -0800 (PST)
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
Subject: [PATCH RESEND v7 0/5] bpf: Expand the usage scenarios of bpf_kptr_xchg
Date: Sat, 14 Feb 2026 20:40:37 +0800
Message-ID: <20260214124042.62229-1-pilgrimtao@gmail.com>
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

