Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277CB348445
	for <linux-kselftest@vger.kernel.org>; Sat,  4 Jul 2026 09:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783156933; cv=none; b=OA/T/vyRU7cQTPvmXsMvho/2zpGaQkbfjGRy0a02J4SYTvn7SEW69BSdg1Aif0pNDsSWyISelj2r2xgin4qcEsKVFmktYQncfiIvihLAeuJD36whvr9CwWRGvB6Kyadfp4D+EIiF0CLqUzP5HjlB0nz5DKc4/Zd/FhiC1h1zTMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783156933; c=relaxed/simple;
	bh=dllSngM0zvxO1v5ssnhzMkLAGt8xboxcd17Ii9VCYBA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LNVmo+kP9B/o56xVeBNfYBA7+YSSj5G7b2kBT/vH4f5c9wKpi59iEHIKBLjmjzrAc5goEJafROxI1ENAc9OTHWtcEo1PqkTsNpjq0rzhL7pb50fPyBV0T0ZQmOuPJQ8h2FzGze8ItdQuF4ChhR5pJ39gvDcFLHs3AC0gfGfpduM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oZoHUO1v; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oZoHUO1v"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-381891a9525so1082218a91.3
        for <linux-kselftest@vger.kernel.org>; Sat, 04 Jul 2026 02:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783156931; x=1783761731; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UzWJONpzkCdirFiS8VKHmgg9vJNeKiCmuT7IeyhNbw8=;
        b=oZoHUO1vyfgJsHrlj7jXnac8Y7jFX6bNCl/ftdu8IISRsqEME/uJE0/A83H8yVsc7t
         WHgiurXdOrn5zlM1oRmm50BegFEyQ30S9GgqWiqVNfBlZCJQTJa5VQNo69nm+H7NfZYu
         YV7LX4d7GySYMkDpu6jqNh/99w9z/nnf8U+XYOA82KAuEcRIyC8k9f73l1anTQNO2sqF
         2G4pKU0w4aGPSLilKQcC4Wye+w0Jr/D0Y3XqqEHJMcBtSJ0SbP+sfhluMMeIHDF/3K0D
         020XnE++zeBtNcH7tXs/3NllP9rf6Lf27nCIx4Fqm3mSJwZPSBrVQGerPUYMMvwHMHhN
         8fpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783156931; x=1783761731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzWJONpzkCdirFiS8VKHmgg9vJNeKiCmuT7IeyhNbw8=;
        b=OElXbb3mWenI+cGbjy5HDin+cvNNrOhR0x1GZ5IykzMtvQ3hSb2lZRg3hZC/YVFBJD
         jPwS9NnLXIEcc8nQw6pCsx9kF6uyM47hgEIulsfPaXGrjIJm1vRcDzDA1wVM8Gfg5ctj
         9C3kLQxmBBNYBVxnkg6OhGixeeAFIaFwgKDzuSGTXggRu4GgidGTN3JtxlwvuvjpFuEI
         0wliaGRt84BCfzuqi9fo5CP1/czrUxVD1L8b7EjF8xOicbQZlNQ4svAlhndaup7OQJRZ
         MCP464dH0n8W/j+30mRahgG/gK5U+mRxUSvIk3zp/VnKK569J5q23cFhvMEYVJfIXNkF
         NeUA==
X-Forwarded-Encrypted: i=1; AHgh+RoE1RkYZR9oYjRh3xo0TNIL6DVpQznFqWENbBiu+ccPo42HlSxLMhwQJqr2h224h+bnupd+V3rrZSmuUlq+mIA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/+euFGuIGe8Pxk2qYZpWhAG6V2VqnlL31xXiO/lIf5Kl/6btk
	TR8V9+PJlAlfExdv0d0lBZzE5BcCkIQids17jkWcBZzfQYS6/LaDr0R7
X-Gm-Gg: AfdE7cmRFnT9UDFBgi6j2jBiaSc1C+TbkbdzHoh/dz78bnXavMUjPaFcSo/KL21H01C
	PBObYL0ekwqnlu9H7KiwEKiMumkYyz+/NRtw8Bi+91STIiKo9guNOKg8bU/bi9Gg8Gmoj5z8hs2
	63snWjY3rPVoRN9DTaDCtX0+xQnxE/Win/hWRHspWJbgvwx+Cc6i2u+h/ywNNzq5TL+fmbURmqz
	OcdBc9vQiKNKCqidfU1NFMP0qIKxWqS4R9/ox21UwPJy3BjpaoF62OTn2qBEJBf105vcyQ5DD1L
	npqpwJVMYJ+Jsd7gNaCq0DV7camVLz/xJ5fDidc7h1N3KOKuUbR2lsPUi7mbU3lcVL+4km5IREc
	d38OeWE811R0xWMHZ1HXGWFHtjNUUdbakNZe7LfFwjD/Qbm6cbc7zw5Z1ZIrimcBrc4PsLpKYXb
	JmIV6KAXo3/07WzAPvHTepMIBzRCb+2TG6uI+YOSRZ/ggaF+Sg7hneRsNboqzekKuCXvcWmX0=
X-Received: by 2002:a17:90a:e703:b0:37f:9ce1:736b with SMTP id 98e67ed59e1d1-3829f9ea9dcmr2672536a91.33.1783156931264;
        Sat, 04 Jul 2026 02:22:11 -0700 (PDT)
Received: from r912.tailbb6e1e.ts.net ([182.70.116.80])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bc27ae7sm28006464eec.26.2026.07.04.02.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 02:22:10 -0700 (PDT)
From: Avinash Duduskar <avinash.duduskar@gmail.com>
To: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org
Cc: eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	hawk@kernel.org,
	yatsenko@meta.com,
	leon.hwang@linux.dev,
	kpsingh@kernel.org,
	a.s.protopopov@gmail.com,
	ameryhung@gmail.com,
	rongtao@cestc.cn,
	eyal.birger@gmail.com,
	bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	toke@redhat.com,
	dsahern@kernel.org
Subject: [PATCH bpf-next v6 0/3] bpf: bidirectional VLAN support for bpf_fib_lookup()
Date: Sat,  4 Jul 2026 14:51:56 +0530
Message-ID: <20260704092159.1256823-1-avinash.duduskar@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds VLAN awareness to bpf_fib_lookup() in both directions.
BPF_FIB_LOOKUP_VLAN resolves a VLAN egress to its underlying real device
plus the VLAN tag (XDP programs need this because VLAN devices have no
XDP xmit), and BPF_FIB_LOOKUP_VLAN_INPUT runs the lookup as if a tagged
frame had arrived on the matching VLAN subinterface, for iif policy
routing and VRF table selection.

BPF_FIB_LOOKUP_VLAN opts in to replacing params->ifindex, whose value
existing programs consume since d1c362e1dd68 ("bpf: Always return
target ifindex in bpf_fib_lookup"); without it the output is unchanged.

An egress that does not reduce to a real device plus one tag (a QinQ
stack, or a parent in another network namespace) returns
BPF_FIB_LKUP_RET_VLAN_FAILURE with params->ifindex left at the input;
re-issue without the flag for the VLAN device's own ifindex. A VLAN on
a bond reduces to the bond, which picks its egress slave at xmit.

The new return code is appended after BPF_FIB_LKUP_RET_NO_SRC_ADDR
(nothing renumbered, tools/ mirror updated) and is returned only when
the flag is set, so no existing caller can observe it.

Changes v5 -> v6:

- Patch 1 (BPF_FIB_LOOKUP_VLAN: resolve a VLAN egress to its real
  device plus the tag): no code change.
- Patch 2 (BPF_FIB_LOOKUP_VLAN_INPUT: run the lookup as if the tagged
  frame arrived on the matching VLAN subinterface): no code change.
- Patch 3 (selftests for both flags, tc and XDP paths): comments
  restyled; dead skb.ifindex write removed.

v5: https://lore.kernel.org/all/20260624030530.3342884-1-avinash.duduskar@gmail.com/
v4: https://lore.kernel.org/all/20260623025147.1001664-1-avinash.duduskar@gmail.com/
v3: https://lore.kernel.org/all/20260617224729.1428662-1-avinash.duduskar@gmail.com/
v2: https://lore.kernel.org/all/20260616223426.3568080-1-avinash.duduskar@gmail.com/
v1: https://lore.kernel.org/all/20260609172052.81613-1-avinash.duduskar@gmail.com/

Avinash Duduskar (3):
  bpf: Add BPF_FIB_LOOKUP_VLAN flag to bpf_fib_lookup() helper
  bpf: Add BPF_FIB_LOOKUP_VLAN_INPUT flag to bpf_fib_lookup() helper
  selftests/bpf: Add bpf_fib_lookup() VLAN flag tests

 include/uapi/linux/bpf.h                      |  50 +-
 net/core/filter.c                             |  97 ++-
 tools/include/uapi/linux/bpf.h                |  50 +-
 .../selftests/bpf/prog_tests/fib_lookup.c     | 712 +++++++++++++++++-
 .../testing/selftests/bpf/progs/fib_lookup.c  |  36 +
 5 files changed, 931 insertions(+), 14 deletions(-)


base-commit: a975094bf98ca97be9146f9d3b5681a6f9cf5ce3
-- 
2.54.0

