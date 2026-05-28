Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94AC309F1D
	for <linux-kselftest@vger.kernel.org>; Thu, 28 May 2026 05:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779946022; cv=none; b=dSOvQp1GNdJ9++RXiFbCqrQxPUR7CF/oWVqfzb+CgTZI2T4hkUG+1Xtof5xtAgBJ8OVzDAX9dTyOwAN5u+6YpKbaD5zhJKiSNZSU/81SLEE/R6sdoOaHBxBTBq0sbdgiS+dJFhXQ1ooWOcAKHi43jpPa7fdlXC6OWkPWZzyXY0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779946022; c=relaxed/simple;
	bh=xx54sAco+6m3AjMvNwtpeIRSEjr4pcpTSs5UMGBZpv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C+KubmWST0+Q0n3yiMOOiShwKn43fKEtOMUUQs4Nr0zKH1lesOAZrgYhRprzFkj42DilBrboFfJy0F9ZFOkLeZK9oXLWNb0wPfPeJzM8FRAMGMOymPQ4Ltb0LBXAWAnwpsIz1wk2dCf7V4KHDj5LBdIA/dtRNQ2ZjMnmEwLAiCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SkQgWdwW; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SkQgWdwW"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2baca4df358so79319305ad.2
        for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 22:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779946018; x=1780550818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbgqf3mu8JYb4D5FqVjFkGrGI4aSc89zJJbOU4Y7BTU=;
        b=SkQgWdwWjtj7NoyHUG6N5Aa21jLgg1ocPDmD07kHy1KzUP3vbrvKLK/9G2bO/Z88nC
         GEwUAdN3msn9xss4JEgMXHW6Yrk5is+s14vR7oPcsejFJQoWgDViA9QfjuliQTWzMCHj
         wrfzo2VdZu9YxpkmHwfQ7NUO6dK8sBqUfNd/BOoS8qfFuZQ/GzuSafE6HozPg5NjM6oG
         a0AWMI9r0pYskrj13pRCTmznn6z+Ap9krXCOl6ikvAI47K66qG+3Boy8iS1n7ZO1Nfw5
         vqVifUbNVW9xYaSvQAVJepQU6V9b5EF765+ysQ6dPu9PW1lTmWcOLgh3UMHVOsvMkKJ0
         35Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779946018; x=1780550818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jbgqf3mu8JYb4D5FqVjFkGrGI4aSc89zJJbOU4Y7BTU=;
        b=oZYNFGaZKfhxu7bHtPjjDBB+QuFBI3Tcd8iUjcfbLTWx4ArCrWTGCV7AbMQ7xPzXmj
         ccBphIppsbprZvoVS+of/M8f7cF039D8RHzBOZJYJAXFoVfxjIh8Z4BUOqF3hJKfXsgC
         BQMYxZyaumiXDzd+22Q2kHe8xJwYMonSeuFjDUq108iOs0/7+nY77uMs3TDlGdIItRPd
         rdgfxIT/GK2lBxEA5QunQbylHC/cFUq1mu40X/hIO54Wv2B6uDAfaHSxG26w8Asf+hmP
         jyJHv4co7IE4XT4WGyPTGlYhe0txlSY61eNGe5Aqyl8JnmIsR3llJMiCV5g9Ib5gAm+k
         dElg==
X-Forwarded-Encrypted: i=1; AFNElJ9jVBw5MvO3lWCDEES53GOP2Uc0XI3TzU4UdFZ3nCyDcf0URNMV4/5VOWiVPlG9+nDwBDjmlsyP05SYhpeiaK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpXVOYzUNxp8ChSrvNhd1pUZYKSJR/Q0n0UIGNrNXczuAoMnYS
	SiGlzo9LONpDwrZ4PT92fyZZB6xU9C5h7cccp0DqIPaKJEG52e/5Tt5S
X-Gm-Gg: Acq92OHZOYF+dE06eL/hhqPXvFyDTFmqZSVuo54rKYP8xk32ZK+j96rbtwwEmKiXEnl
	CfIR/dGdzy41btLgv8uVCrSVWjUmJQXUerDSxtMO/Wm0x7qxY6oLOmKRyqNq/sx3tJTbALzDhNI
	Qz606o9tUeA3z1506XTu3h6I/pSNsfh4n2mmtAhvou8XVMmIftkUwSGLoMFASv/9mXv4qm4MwCe
	+bUQhoC/MGOfoa+toTIzeLkQORj8BefoBATpg0Ae5NzIbSQuXcZbFWixXzp13P2v5bf9g1eqI4c
	4aIXNzgA7IQSmEj/BUMv3DFPbfdhtf65Eqgbop0Eq1tlpH5tguT8Fc1HnAUxRpF/ZPw2mWojOaq
	L7Wmrbg9xVO1GpFTq1KXTydlACO2yLNZ1jL/+ga+rU/U1ZEzPZuchLUdgF6gwvwFRKVjHGldNpp
	/VwV1fCK2k8Fp9T0KBqmr9E9S1rFVnITLOvJP5yB09YXD4hNJepoONGCmFscwiLYNy
X-Received: by 2002:a17:902:c403:b0:2bd:2458:50d4 with SMTP id d9443c01a7336-2beb07f5ademr283061445ad.41.1779946017786;
        Wed, 27 May 2026 22:26:57 -0700 (PDT)
Received: from foxirain.tailf10b76.ts.net ([220.83.29.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58c7046sm172642695ad.57.2026.05.27.22.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 22:26:57 -0700 (PDT)
From: Taegu Ha <hataegu0826@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: Yonghong Song <yonghong.song@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Taegu Ha <hataegu0826@gmail.com>
Subject: [PATCH v2 0/1] bpf: reject overlarge global subprog argument sizes
Date: Thu, 28 May 2026 14:25:32 +0900
Message-ID: <20260528052533.3940181-1-hataegu0826@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527052539.3388700-1-hataegu0826@gmail.com>
References: <20260527052539.3388700-1-hataegu0826@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This rejects BTF-derived global subprog argument sizes that cannot be
represented by the verifier's signed access-size API.

The issue is not a large immediate in the generated BPF instruction stream.
The oversized BTF pointee size wraps the caller-side PTR_TO_STACK argument
check before the callee is verified with the original large mem_size.

Changes in v2:
- Expand the commit message to describe the caller/callee verifier mismatch.
- Keep the existing size expression unchanged after adding the S32_MAX guard,
  as suggested by Yonghong.

Taegu Ha (1):
  bpf: reject overlarge global subprog argument sizes

 kernel/bpf/verifier.c                           |  5 +++++
 .../bpf/progs/verifier_global_subprogs.c        | 17 +++++++++++++++++
 2 files changed, 22 insertions(+)

-- 
2.43.0
