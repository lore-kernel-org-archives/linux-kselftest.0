Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936CE153BE9
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Feb 2026 02:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770518944; cv=none; b=ZHBaWnRlXOx8mfIxt8ZNmnAYecMuwHE2gxUOvrw0jv4e7EULA5LeCk+0FmARvFiyoEbXjkuy8swC1wACIW/hGLx7h9VSw4TzLEEdy/VwXEI4DIjGXAs+85trJ8HMQXLJj9FzGlLmJCfopUR9FGxfELpsHiqZBmXem1mTRosqxQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770518944; c=relaxed/simple;
	bh=ggaDIpn3ewDGn+U09yPrXsdr7h8u5fNEwSg1M3wvUWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DsrzF1/nY86Qx0hr+2gRMHPxB6UnNwKq8l+66Sh2Ow0dJWcNh6r8Q3h0AtOyHOa6dmelHxXR49q1Q/CUZwWaTSceWXKWTyfNV0BKVVbLLBSPqp+GtaO4RYOqXSY/CLU62NvlPWzKMH2b6NTJkObwxwWFOeq+CNO11BZ1KYU8pNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NfNsrqoX; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NfNsrqoX"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a8a7269547so31065155ad.0
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Feb 2026 18:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770518944; x=1771123744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yJE7ntfEvSYVWyw3WIf0KrfyfMPjDLGhWYcYr6XtYJU=;
        b=NfNsrqoXaiLA1PL7fzChDL5OtZpDifgnOMYPnNrqhRgatjRa62JUBQdr55ntPT4AeS
         ulK7nsfIX+smPKvzvesJMq0iwWNlYYIZZQcmMVn0WQv0+j/ulQEAmA5YfyOJs4ngdino
         mYmYvQX4gVc7RkPHqpGZmtc0Zyec25YISw0T4/qhQ4Vcb0d/taGcwpNr9umVIy0Dihxx
         nmZ+RVPrEIJMCLLd0826w7ixDXDNT8B/4kPTazU+JNqMkNNthI7ahTedpG7vdByhiSrL
         KVq6JyGxvPuyf+60SQy2WnrwATZMwNklUZUoCpkEQ37UQHSxRRenp6WRmdy33KGjRbfo
         1DbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770518944; x=1771123744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJE7ntfEvSYVWyw3WIf0KrfyfMPjDLGhWYcYr6XtYJU=;
        b=dF6waOFqXYLYeQt3tKkyVDW4p5VWbHIAwV6I+Wgh5Gx2AVeOq3rGRtWU1ssdcjc57b
         hl4YWKne3ltGAtNWDkIlZys/Hr6N/vg89li163/ROuIEk+7qyA0ZyYoRWEQFxmN3V4qt
         yDKku0YqggIbVjW9ZWnb7/nx9HbGCXUl4GG4bSUTaY7XYW6gUf8IGyk7X1+/GQabYwsS
         sQxClvVH+2HOAezziT/CBTWAlPaxf9rFz/8fTVWc6/QzUSKo3L7zfGULNJGhmn7wLyai
         IxaRC/xrhgDpFNZRRveRKDVFwtN5++LHvR+tqa01MS0+B2aDEDkKjUgXjOHDI3L7xvzx
         d07g==
X-Forwarded-Encrypted: i=1; AJvYcCWbaO4NL7WtLXnOGIMrv8ge0KiPSVOlYcg3FUzZtCt0/HFV3hlveJ0rimh8pBCjxwBqU1WU1rbd7ylPOziq2So=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoGETAhklHpe5dYwgT4yZBg1VNQ3aKmBOH8jGLIyouA6yRkc9/
	86540LWWtJZL8ppk9O+Vpa4NWrfao3ZJbO6lpjqeyPMf052mGIknDjAU
X-Gm-Gg: AZuq6aIotjN2wwMjPyiAlHfkDmoMuNBfT++9SBInZN4xt07eygN4pQIvb22jbkXtFg9
	NPF26E5G6EFTPVgVFWzIRIJavkxw2bZ+pL6XCr56DTKternEDNsWV0b0Rz39se0mtmX4meewJPR
	o+tn0BVbjLBY/kJ5KjB/3bqPAsIG2KXaEiZs4zRJpGmzuKN0cR5xCyS5Y4uXisa5qACYYOm6YYf
	NBMYIwy3qAYSlTaT1MKwkVNTXt3T0vYAs0XPmcKQ3cVEAJhNs+j9huuLgfsBeUtwal7wfdwyBCU
	L85ws8VxBlu7I/dphsMIn+cREez02ZZqzH7HcdGlTECcbbcHPelXG9mVcDrbJRUUXeuH5CSq50f
	dJP/39m1tiED/yeZL9cb0AN5PiMoIdcPIaHze6h6re3SHcLcc480VNzbIyIxreWwwxOvrzmoXJC
	jt9zhz0IiEqRefLeWSyPYaIemuWdnTK864ZaHIrZGV
X-Received: by 2002:a17:903:1c2:b0:2a9:4450:abbc with SMTP id d9443c01a7336-2a95164f64dmr88105895ad.26.1770518943797;
        Sat, 07 Feb 2026 18:49:03 -0800 (PST)
Received: from localhost.localdomain ([113.218.252.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9521b9f5esm67194715ad.51.2026.02.07.18.48.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Feb 2026 18:49:02 -0800 (PST)
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
Subject: [PATCH v6 0/5] bpf/verifier: Expand the usage scenarios of bpf_kptr_xchg
Date: Sun,  8 Feb 2026 10:48:41 +0800
Message-ID: <20260208024846.18653-1-pilgrimtao@gmail.com>
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
  bpf/verifier: allow calling bpf_kptr_xchg while holding a lock
  bpf/verifier: allow using bpf_kptr_xchg even if the NON_OWN_REF flag
    is set
  selftests/bpf: Add supplementary tests for bpf_kptr_xchg
  bpf/verifier: allow using bpf_kptr_xchg even if the MEM_RCU flag is
    set
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

