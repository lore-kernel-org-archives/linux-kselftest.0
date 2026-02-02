Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BCC1B78F3
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Feb 2026 07:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770018783; cv=none; b=Nwt4N7Z2Morvljrnh8bOB21iJclRLnMCX4LGl60SOLn/6bHs4r+a19OtNfltyX+dZkjnNFvhovuFgljvsCcnXnC72z4CwaOMV2yg4PVbOx2pRAqPSJzML0vr0PpgTasSXtARBRgQfaE+uYjfRqnXqbRLMkK83naP/EqxUdkEnZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770018783; c=relaxed/simple;
	bh=W0maPzPO5M3pfvomopBHHuSGpDn/zGTQOAOllm67+rw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kym9VqORrwsWrjgQRtUpZetkOOkDuCVQNnN7kOqKRFax3Dsm12NA2hG+2E3oRoqvLmSNTNC1bawLM0aNyZfNZbFY4LpowtOJ20RSVQRRiCEIC56j7R4HmO/O7ht3MZRcF41BjiM6vq9JT1H1d2r9WBZYF+CCflNDhK2KVWjUtK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MGfYJgQD; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGfYJgQD"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-124566b6693so6853374c88.0
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Feb 2026 23:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770018782; x=1770623582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gRIVmJL3tSUzEWbmHeuBiYdL6z2LK0b9AkJ41US+kYI=;
        b=MGfYJgQDIOTP/NYOCx83ydOeUaForuN+dyxQoxQ94ynucdD4wLJrIaeR4KnhW4ZtdT
         Q6w5mbn5cdn2kLeZIr8miFtgE2qJvaVCbR9vUFlgyQ86gnNtoxaZGkGt/Km9T/ipale+
         zT6Yvzpt6TDK5Isglke+xaylj9M/6+flb0xzMM2fuBWjDlz5S5xB6sd+D0Augqovs5PS
         408LlQTY7xlwH/NTjM8XyuraZ/hfEAwA5YZXETjorG3WLHNAE2EMUs0K+5vhluFnjx/2
         tQmApC2vkzhsi9459KJNPUM13iKFctI1mlGdsI8ilizB9iidIgJAzeSYxW6XU1gbmIXj
         ffAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770018782; x=1770623582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRIVmJL3tSUzEWbmHeuBiYdL6z2LK0b9AkJ41US+kYI=;
        b=A8whZSs+mEohDYlHQw0bOTppzS37LDxIN6C15q0kRXToxoJNY+DBnpp7yCOJ07vzXW
         7Z3YM5HPHaiQ4cnXZxpJuUzoaujOw0Xb6w1ji+O75ehohYZGzPgJTgoM69GNYoL5c5FQ
         TJTW05oP+vBrZ+hHDThY5lXiHbEEkzXijV09hsrqWaFoswxVNy4Qm5EX1s8Ifas3YSEa
         Jg4yjl57/pxtB6WTuUve9j8FY34l8c7D+ZPlacogkBqK7yzk2t3c0ohYnbCgo3bGPNpI
         E1Mxwk7q+mqrVnQ04e1GDH9EKAX51zM9MMFwUpZY2YG7Mo0nBtMIJ6pVxkC5OGdH+9o1
         aJJg==
X-Forwarded-Encrypted: i=1; AJvYcCWWF26buu2iQCWVbEdMjAmGwfmkxpqqGelbu8b3VFl0ECjj5w89GEqO0g+Edm6sysladiTTnq2KArdFJk8cS/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF9tACwEsFAb5tX3jFoJTEEVMOfnYjdfxD6DyqrNSjPVe5bj0m
	TC5n8u/w6z01UcHKrNSTq1CKTRZ+zUIhIHFWyI+GH7SJAgcpSATuqKjZYosrqQ==
X-Gm-Gg: AZuq6aIOF+pB4bidhF/bGDf4XmlC0Jr9ypBsLLziNx2tO6QcKWphtlwl2qxkMyNErwk
	wjTQuQkFqbmf5yYMDqQKrM3NhAAHLbtIkDZLjPk+L21IQ93rAJb1vislL8XyS4pr6ozN2VHAhut
	FwRZm4IJQCltOm4cMZRcIkaKSV0s3Qgm/Qo2rtN6NqcSbPal+fvmPyS6lPAHdEnxfs/BbmFbBav
	L8k0cWY0u7TcRLX3AFf8LnIdVhUgpRQB1zTsqs3M+3RBMeMQo56JdRzJLGJtv+PtR0nIhHQH3rz
	rkRXnKvqOYZxjMWrerkp7Ynzlt7OEf8y4RlbIxKIrz9nfnDD1SnhopMGMyQkZTD410QUG6JWsrb
	oPixcAnON27oKgLGnnwC3y6OLZLjBU0VpHps7SATZllTeDryyKiRh+kAi7q1V3a6OWGZ2xibn2G
	c5WWsSSvCA49EE90NyOetrkPJfdFzzFXhbmxMgHKuoTA==
X-Received: by 2002:a17:902:e801:b0:2a0:d59e:3c9e with SMTP id d9443c01a7336-2a8d80382dfmr111267515ad.33.1770011912514;
        Sun, 01 Feb 2026 21:58:32 -0800 (PST)
Received: from localhost.localdomain ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4173a2sm139121185ad.30.2026.02.01.21.58.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Feb 2026 21:58:32 -0800 (PST)
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
	Chengkaitao <chengkaitao@kylinos.cn>
Subject: [PATCH RESEND v3 0/3] bpf/verifier: Expand the usage scenarios of bpf_kptr_xchg
Date: Mon,  2 Feb 2026 13:58:15 +0800
Message-ID: <20260202055818.78231-1-pilgrimtao@gmail.com>
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

The above illustrates a lock-remove-read-add-unlock workflow, which
exhibits lower performance. To address this, we introduced support
for a streamlined lock-read-unlock operation in [patch 2/2].

Changes in v3:
- Fix compilation errors
Changes in v2:
- Allow using bpf_kptr_xchg even if the NON_OWN_REF flag is set
- Add test case

Link to V2:
https://lore.kernel.org/all/20260201031607.32940-1-pilgrimtao@gmail.com/
Link to V1:
https://lore.kernel.org/all/20260122081426.78472-1-pilgrimtao@gmail.com/

Chengkaitao (3):
  bpf/verifier: allow calling bpf_kptr_xchg while holding a lock
  bpf/verifier: allow using bpf_kptr_xchg even if the NON_OWN_REF flag
    is set
  selftests/bpf: Add supplementary tests for bpf_kptr_xchg

 kernel/bpf/verifier.c                         |   7 +-
 .../testing/selftests/bpf/prog_tests/rbtree.c |   6 +
 tools/testing/selftests/bpf/progs/bpf_misc.h  |   4 +
 .../selftests/bpf/progs/rbtree_search_kptr.c  | 164 ++++++++++++++++++
 4 files changed, 179 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/progs/rbtree_search_kptr.c

-- 
2.50.1 (Apple Git-155)

