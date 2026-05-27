Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B88F2BE621
	for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 05:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779859587; cv=none; b=g5zeIaHmE7BNXlVWXPRiYQiLPKsv1XSQ+YJ4YN/yU0lo1ZfRXfrGfZgOwcVN0l6XOtC3gNlOJk9t999UjZl4b36ztHVIw+UmSa3O4kS61V0+gp9L1rFYuU+oT7OemlCzmXeXsg+tUD+5yOz8OLhB/MC7pqojHYPAqw0lDQpuCBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779859587; c=relaxed/simple;
	bh=WEhDZ++slbWPB+Yb8K9OtkosQWMf8J3K7K2A4MwVDxc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZD1m4PzPM7/cQKz8tPlf6ovGCZZ/xUOaRhAXEd5zb8SpJ1D3aFyEzzBFTeOdr73BfwqPmSmQqJye3L3tIHgHeceJAes7a3S0Jmfax9yBqwn3Qyn/eew8t6FQuPHJQYQf2f119c9Dvz3bVF+kqRmieR6okAMyLnUA3MV/5NkxK0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Snpw/GoW; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Snpw/GoW"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3664df30f53so6663473a91.1
        for <linux-kselftest@vger.kernel.org>; Tue, 26 May 2026 22:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779859586; x=1780464386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+izZGAVsti5zvwhRlmRKEL+2HzPRMlNhWQLgHFnK51c=;
        b=Snpw/GoWgaYVLullGg/dGJV6403QMyQyGw3NjNyBWd9/ZxhDTBnJtmfg50WrXO7m+p
         I18ZSCbeQ/J5zmqHT9OQqa8x61ieuXTpWptIj327gEYGG1DyZLbj0yIA+Bik8T95gWdU
         L6dzdqgJ2ycR1OW0ZYeJyv7O+IrWaX+R0hosaMCquCwbt8ehs86/XFDIqSTOvMtRRP4d
         yXBkHZCTB5hNhv0us/7d9azEnmIEN4UGbRq9KXDSHNxAZKnCfP6ZgJbVo7ZW64SNC/nk
         Ko6OsDsB1g1QpRV6q8xBHhtcxO6CeHP44ONkDkLjino/SvXHi4KWTyom1JQAS0/zheH9
         pTCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779859586; x=1780464386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+izZGAVsti5zvwhRlmRKEL+2HzPRMlNhWQLgHFnK51c=;
        b=OI5jc9qbLrv757801H/utiiO4OxEFXaZ+8pTcCl4xtH1QDdax+aXWvsLIluv5B/plJ
         XWuh+GTI3nui/2V99VFMZGHzNxIijFXex2odYLmLLyDSSfP7Gb1U8oL+roQ+Mfd763Fm
         MT/MizwTQhKIAKjPbaG6j3VtF6k8a2anciFC+4LiTWMx+nmIWQfvXkBlZ1R41Kn+cdZk
         MLfmfTvAe4Rif7rMAVQ/BuuGQ8I9N4YAOMhmcJhQ3rtzXDkZL8y/pZ4Ng6DxYSRZHMyB
         AW8SiCiBD3nyrCuyHLrpf/HHlC1r+zAKHLvOLyIn0YjkLHgkT04GG/dbpfVXwsxS4mB4
         i4JQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/SiasO0vZzEbNWxVXIeXwGQ9yAgNw87jkAyvvLp3t6jcXi80IL1RXIOKnYyj+zHRiDLrp1tsqrGqODxmJLwM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUQ+aksR+IDN7PlSLf4h4heflTeXWI9nVxGYmMfeVG3VRfmMwo
	tVM7CRi8ONjblsGMOcpUpuoxqYRo7qJR2X6O8jo8qoCIpSao1Yib0dY0
X-Gm-Gg: Acq92OHojDWaNsbJXNGbbYBG32GBAum/Gq5cr6IIgXELe0VY3fgZvGF2MBFfPr87lql
	eoiOdmgjK/TtwC0n9QBuguRbX7QK5Ugjdomg/YymNEUXNMsBDwFMqy9faq5JNNs0YSSXK1Y7mFS
	OlTVGmgYf1C0/CiANlyCbx8qNadzp7GCZgqE++Pvx0J6fqqYwuuv5OIqHO4gBBv5hTPNWs1c3FW
	Kg1szLUyK4l4KkisPGWI2SU2hBGODsHWMNIb07p2gbCiketmZy3DuEmPekSObxa/sISttjg7Xmt
	nWTWtW6NYqZAh66TDH1+SUTljJ6KdMd4NIbB7lyfZgmTYz4CymTLqplEeXtYFWn3KkCz9kC1lOq
	KAzSJyp9gHjPEo6qT3ur8lbI+CSZlUgs0g1kZvSw2XMQ7VdNbsqO/s4qZfxm7Nuc1b9OPvNPE25
	d6HufYgcxldRjgR3A9fiCRxXZPnAmTwWvDgXrQ9ODtAa95Eqo=
X-Received: by 2002:a17:903:1b43:b0:2b7:abc0:3bd7 with SMTP id d9443c01a7336-2beb035b8edmr246804415ad.9.1779859585668;
        Tue, 26 May 2026 22:26:25 -0700 (PDT)
Received: from localhost.localdomain ([220.83.29.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58e4fcfsm144891465ad.71.2026.05.26.22.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 22:26:24 -0700 (PDT)
From: Taegu Ha <hataegu0826@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Shuah Khan <shuah@kernel.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Taegu Ha <hataegu0826@gmail.com>
Subject: [PATCH bpf 0/1] bpf: reject overlarge global subprog argument sizes
Date: Wed, 27 May 2026 14:25:38 +0900
Message-ID: <20260527052539.3388700-1-hataegu0826@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This fixes a verifier argument-size overflow in global BPF subprogram
calls.

For global subprogram generic pointer arguments, the verifier derives the
pointee size from program BTF and stores it as u32. That value is later
passed to check_mem_reg(), which feeds a signed int access-size path. For
stack pointers, the value is negated to mark the call-site validation path
where STACK_POISON is allowed.

That conversion is unsafe for BTF-resolved sizes above INT_MAX. A type
such as int[0x3fffffff] resolves to 0xfffffffc bytes. On the vulnerable
stack path, (int)0xfffffffc becomes -4, and the negation validates only a
four-byte stack object. The callee is still verified with the original
large memory size, so the caller/callee memory contract is inconsistent.

I confirmed the issue with a non-executing raw-BTF verifier reproducer. On
a vulnerable kernel, the verifier accepted a program with:

  - caller object: a four-byte stack slot
  - BTF callee argument: int[0x3fffffff]
  - resolved BTF size: 0xfffffffc
  - accepted callee access: *(u32 *)(r1 + 4)

The relevant vulnerable verifier log contained:

  R1=mem_or_null(id=1,sz=0xfffffffc)
  r0 = *(u32 *)(r1 +4)

The program was only loaded to prove verifier acceptance. It was not
attached or executed.

The fix rejects sizes that cannot be represented by the signed verifier
access-size API before any conversion, and adds a verifier regression test
that expects:

  R1 memory size 4294967292 is too large

Security and reachability:

This is reachable from BPF-loadable contexts that can supply program BTF
and BPF-to-BPF global subprogram calls: direct CAP_BPF or CAP_SYS_ADMIN
callers, explicit BPF token delegation, or privileged BPF loader services
that accept user-controlled BPF objects. The delegated-loader case is
relevant to bpfman/bpfd-style deployments where an API/RBAC boundary can
ask a privileged daemon to perform the BTF and program load. The issue is
not reachable by ordinary unprivileged users on systems where unprivileged
BPF is disabled.

Validation performed:

  - vulnerable QEMU guest: raw-BTF reproducer accepted
  - patched QEMU guest: raw-BTF reproducer rejected the oversized size
  - git diff --check
  - scripts/checkpatch.pl --strict
  - git apply --check on a clean tree
  - clean worktree object build:
    kernel/bpf/verifier.o kernel/bpf/btf.o
  - git send-email --dry-run

Full BPF selftests were not run in this environment because clang is not
installed.

Taegu Ha (1):
  bpf: reject overlarge global subprog argument sizes

 kernel/bpf/verifier.c                           |  7 ++++++-
 .../bpf/progs/verifier_global_subprogs.c        | 17 +++++++++++++++++
 2 files changed, 23 insertions(+), 1 deletion(-)

-- 
2.43.0
