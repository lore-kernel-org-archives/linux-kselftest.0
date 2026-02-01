Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0D129CE1
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Feb 2026 03:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769915778; cv=none; b=VUlalDSQV2GLr6S//xioJgZBGigc/RcrtfWU0z9sTo9ZM3J2lKeUilszV2Izy6A6E8tEjvoWP+Y2pRIKeYl8ls4iZH7T1FXY7lwulWGLTBRIPeH1ClgogvjAu8LEbd6nQoGBH9k40bjJrAbfsktRrsW/if0n3f1o8bO/rLQqF6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769915778; c=relaxed/simple;
	bh=5WD/B7mrVC63BXuNw4H+kZfkP5LiN+uYJLVKOU5DZf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WZjDVamjVuIZ8bNQunE2at8dwA/mMBbOss4LhclWN3xuvM5i7rtTYl9aZC5kEzae8GSIIJyeibL2AMllsiEV1P8R27ucyWRNTYXz9B+6WUvqn2Ld9hY2bVK6Bg5VO66uA36q1NsFY4OnfPpCSWkSPsVSej345ano8jxrxThznv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mubs6U0g; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mubs6U0g"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-81e821c3d4eso2856454b3a.3
        for <linux-kselftest@vger.kernel.org>; Sat, 31 Jan 2026 19:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769915776; x=1770520576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xFUVb3zqdmYeViDQNZUm545T667JACpxtH5vUY33Trg=;
        b=mubs6U0gg1rlh25C1dswqOi0uOEj91Tp9JKHLb53SzIw4lfxGBc+m6meZcK7hvCcou
         CM+aLqQz6NAa0dd2ohZeIDvNNbeVUPrK0TNzBmDj+NP9R78GIEb24DdJorIZGESX67KQ
         hi7DAP6lafogfhYfkm7e9f3UsBPaYafGjARdCQiXMZrduJ2Sn6fNKHDF67UIF4cr6HSd
         KpPy5fYlHyfQIGU4lgwBS2GrRDhya/UJX4Ts/T2vB3c51iI1FASLLEc4fTOI8XSm69rx
         vm52GmZUt/1ks3/BT4q1vTQ6V6wuLj7nT2ZnU3DgcWMFJGu88jcg5Q8lJRBjK+597I7o
         A7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769915776; x=1770520576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFUVb3zqdmYeViDQNZUm545T667JACpxtH5vUY33Trg=;
        b=rV/0bO7nJf6phUTEw3BdjOZF1Z4ial4ELhRqw3QD2adnrSoy/9rl1mUlDg9iijieTz
         ie2sgTxIFgN8flFLmYFARAzF7gX9HGlZjEqEx+i2Vlv8NugkdhiOBmfAgH+YyHTVY3tY
         u73Kb+N5WlQ+YVz7CgIUWRyHcrR5kXuRKATAuBaka7+m4D4/+dYyvOi+Iyd4TFr67Qn9
         yQzvHt33U0HkonksmuJtBbs1bIU62KeeLr3rA9cUrqnkB5ODi8VP4hHiYFJdQSmDoJ7o
         o/v81DU3qcsrAoFc0eig0Mg065A4nF7thR++Xrgr02n/Zavvewmq/9wDmY+o8t9prC2O
         x/sw==
X-Forwarded-Encrypted: i=1; AJvYcCVtJNc2rzi129yFPkmC3mig1Ze+eSuHVSXeQrAHIWwIzlMIYI6tR2xONJr7V1dy/4A2bynZH2EwrA8MP8MP3dc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT1nXbf20eM03GgGEsX1K/kg8Q9rq83+APQ6s69arkS72LumJ1
	Cr2UCaHTPvS+zL3FhRTx0yc/F/Qrh8xaHnnK5tL3Y1zgtOLX7I1goKJL
X-Gm-Gg: AZuq6aJXNa+0yU80YLPtJF/XZ7AZb6DD3wwrFd7rc8TlkYKyHmQBqs1mhDZWfv+uFHw
	NkbR4PmpcUE6iXdc7edU0Eo/DgPrrNIS2560LHAudrAwGGm+bLL4cCbeCYtlXsmjz2W0BebfAAa
	x87ij2yXAhQ7d54CpzzbEF70xn661Y2PKsd+eKJCRDFBAlvd6vXTbjIGmLohaqkPYfqBFQXFkMd
	Le+Fy1Vxt4T2rxjIEVeiBeEw/k2TsOXSr1ZnmcNTIKbX52Yi8Ri4hn7IzWkOkdoyDfPPZX4Mebc
	PJtosvGx2JwqjNdj7DgfdNvgk8Truh0j47VG5sHdvArJHfGde9ZxVHe0pnQ4YzRwAShpcU6bR7u
	yx155HU0olatafCWU8VxfbN7Ff46KZjw6uZD37VGDVlR3tEus3zx3g7nOWxdCl7aE/UdeZnGjV/
	ctJHGGNsrPAoyb9y3Ndam5e4xF0AGXeO+lNQchqBMnsQ==
X-Received: by 2002:a05:6a00:1306:b0:81b:14e1:a17b with SMTP id d2e1a72fcca58-823ab9834c2mr7333418b3a.70.1769915776363;
        Sat, 31 Jan 2026 19:16:16 -0800 (PST)
Received: from localhost.localdomain ([113.218.252.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b6b2bdsm11810818b3a.30.2026.01.31.19.16.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 31 Jan 2026 19:16:15 -0800 (PST)
From: chengkaitao <pilgrimtao@gmail.com>
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
	yangfeng@kylinos.cn
Cc: linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Chengkaitao <chengkaitao@kylinos.cn>
Subject: [PATCH v2 0/3] bpf/verifier: Expand the usage scenarios of bpf_kptr_xchg
Date: Sun,  1 Feb 2026 11:16:04 +0800
Message-ID: <20260201031607.32940-1-pilgrimtao@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chengkaitao <chengkaitao@kylinos.cn>

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

The above illustrates a lock-remove-read-readd-unlock workflow, which
exhibits lower performance. To address this, we introduced support
for a streamlined lock-read-unlock operation in [patch 2/2].

Changes in v2:
- allow using bpf_kptr_xchg even if the NON_OWN_REF flag is set
- Add test case

Link to V1:
https://lore.kernel.org/all/20260122081426.78472-1-pilgrimtao@gmail.com/

Chengkaitao (3):
  bpf/verifier: allow calling bpf_kptr_xchg while holding a lock
  bpf/verifier: allow using bpf_kptr_xchg even if the NON_OWN_REF flag
    is set
  selftests/bpf: Add supplementary tests for bpf_kptr_xchg

 kernel/bpf/verifier.c                         |   7 +-
 .../testing/selftests/bpf/prog_tests/rbtree.c |   6 +
 .../selftests/bpf/progs/rbtree_search_kptr.c  | 164 ++++++++++++++++++
 3 files changed, 175 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/progs/rbtree_search_kptr.c

-- 
2.50.1 (Apple Git-155)

