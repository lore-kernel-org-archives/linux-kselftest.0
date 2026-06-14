Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B572236EE
	for <linux-kselftest@vger.kernel.org>; Sun, 14 Jun 2026 05:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781415587; cv=none; b=BMmRWmPsJW0Pl39OVWcZHuoqd6aCt02DcoFTWT4b2zzBWIw17lR1dthXrF3gmip4TLbM4InbNOMIKkkUpPbKW+s35ziJLYtuD2Po5EGVTt36gFjrnO9zJzlyiUGdDpXMMhipF7ucXGbNlou+8nqtY7iFnigP9LEf1U394LBfj+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781415587; c=relaxed/simple;
	bh=9kbwiMAQqD/ZLgHbcz+rU3ewKuxGRikpRtLFDnpflQs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BZVG5V3NlzAP9xmALC8FiKoVAumxwthrujdf59jbhPLuFZRRhuRtbrG379yP6VUEOVi56H1il0P/1z67C60xaD2UxhE8uBKS8gM7k2CQH/xKSCAJGyuYm1atOdeDmfOsaboy3mAB4/GVloGrbNJC96hdwZrnx3AVLOKlEYvC/Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHiFBYcy; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHiFBYcy"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-842cd900ee0so1001454b3a.2
        for <linux-kselftest@vger.kernel.org>; Sat, 13 Jun 2026 22:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781415585; x=1782020385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4tgM+z2iyzMGP1zVK/SY9fes3/obYg8+/vIlbcStyS0=;
        b=FHiFBYcyUlhFQ2oW5HFKmGDEwofi5tGB6Sb6brDrz4qffhxDSN48n8B6R6mSqffUBP
         xpYHb/pI72q4QvzXJ+63W+2VWcED01N4aGFY3DRtnCwSHts/VkjKnWWHWOrgOg31VQZj
         pWZKLjWShEhpY1OKTYFffpxNB2q+R6OWcYDJedsksJNJtNfOo97zazLGtnfpqheKGbP1
         muYKJBfa6EAptTgfraIUR7XCPOcqcWrYsesjjHsMta1hiayMDGW9r3ZfkCsqlVV3PrR0
         yU8R26F8vqCvP5V2Ch/EBIk60cYHV562Z/3mRqqvWgKUzN8M8uvUYt+Uhg8bNYTCr591
         B8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781415585; x=1782020385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tgM+z2iyzMGP1zVK/SY9fes3/obYg8+/vIlbcStyS0=;
        b=SSvHhzcalDZhmpEgc8vr7Z2b94zGEia98Ot1SXILApIF0YN3OYw6Ce4ut1lcGg8Pax
         3uvKbI/2zEsaqP0ne6pOTWVIvpg/FL7etzfX0JFSn6E9Bn03cGuObPiIWbx7Csw1AMrt
         vw8f1ooOK+GJiC0WXG2bc4WficJE3hwe82XUfEU+DZuqhKO+tXmRccrXtVP8jYWqcNAd
         bCWFKt9z5bzPFO0pnY/09gzknWaQ7jzF2TsasF6Qu601umXaVfMSOus9WK/WdOvotve8
         mz8qLyGu0mZzB2scJcx5R74Jx+CAZmfDk4gqgRebOLuj0BcWw10DGdMqOkXIcY5X1tIx
         GI0w==
X-Forwarded-Encrypted: i=1; AFNElJ8t/QKWNEXTrxbRyfaIO9RYDXqe9c5vTrK/wNAssft/El/kA6B8SbVAMPP84ddQl21QpXDorMxCjim5fA828is=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpR27CFB0VQfnRRs4v2ktpvfGl0AqfwqaLx96kdy7Gzmu/ma1E
	/xm34lcPxCIPmME9MRnnQs50U0lYrhN/rVXgA8bBxL48LDsNrH6yAg/0
X-Gm-Gg: Acq92OH02toXs67qrogjxpwGzZX/BohUdDK2z6dgAOmfXCB8hcEcHrrmZCfUkjJCfJj
	xWfKvxqZIhQAYcIme+lWPKcZ/tcfoRmqeJg8tOazgiDFbYOM8YH1YtxZhT7GCN1MUchlHJK+w23
	EtK+uJGayzNIxahRzQBIm2Zw7IkFe+MnXe/cZ4NdqT6E3npXThL0M3GA3LUJzsqkDKoOVmiw/Fz
	SJhH3ERI0o6dgUvG4fEQFKUCwyhZHpwckReSG+LMJJf+o/Emt7ZijNioDVr84t5pPJHb+L6LwB/
	WDisi1YaFz/Gd9FUR3BGmpfJ0aJ4vegg/TeiCzwv/ofIfcFUa8GZMOolEKUjMSLr/fHKw34xROb
	p0f0rtscB3PCfO/7wS6S7yW1+nUOPVA/KkZ1Jlo9F9PY9s1Nx2LqBNNeX5H2BfFb1YyrM4OXMbo
	AIqOmq2mq7DxvN6PF+i3+oJIkRqUHgHS4psmB90+4QNQ1A66OZhXOmWD2F0tROQ9Hq7lqMJ+i08
	LWM7AN8c00f9xbq
X-Received: by 2002:a05:6a00:1813:b0:842:7838:61c3 with SMTP id d2e1a72fcca58-8434d07bb66mr9712669b3a.22.1781415585382;
        Sat, 13 Jun 2026 22:39:45 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434acffd04sm6387078b3a.26.2026.06.13.22.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 22:39:44 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Andrii Nakryiko <andrii@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>
Cc: Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH bpf 0/2] libbpf: Reject out-of-range linker relocation offsets
Date: Sun, 14 Jun 2026 14:39:25 +0900
Message-ID: <20260614053927.160566-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The libbpf static linker validates relocation type, symbol index and
instruction alignment in linker_sanity_check_elf_relos(), but does not
check that the relocation offset is inside the relocated section.  A
malformed BPF object processed by the static linker (e.g. via
"bpftool gen object") can therefore carry an out-of-range r_offset that
linker_append_elf_relos() then uses to index the section data, reading
and writing past the buffer.

The normal object-loading path already rejects such offsets (libbpf.c,
rel->r_offset >= scn_data->d_size); the static linker path is the
missing sibling.  Patch 1 adds the same bound.  Patch 2 adds a selftest
that builds a tiny object with an out-of-range relocation offset and
checks that the linker now rejects it, with a valid relocation as a
positive control.

Reproduced with ASAN: before patch 1 the out-of-range relocation is
accepted (and triggers a heap-buffer-overflow); after, it is rejected
with -EINVAL.

HyeongJun An (2):
  libbpf: Reject out-of-range linker relocation offsets
  selftests/bpf: Test linker rejects out-of-range relocation offset

 tools/lib/bpf/linker.c                        |   6 +
 .../selftests/bpf/prog_tests/libbpf_linker.c  | 212 ++++++++++++++++++
 2 files changed, 218 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/libbpf_linker.c

-- 
2.43.0

