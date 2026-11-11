Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=104.207.68.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794381536;
	b=tIcLFaOhCdsQaAU4a2RoPNGXiOFMpNnZ85tlf7yAqkq77wd1vx6raibj/ZoypSwQEkex
	 YSYVWCt6/79Rp9DNdfe0ZXoqcMyhOXdmWBm50n7R1cO7kwIhgyFTE9oVt2eHWO3F/wlNp
	 41OEfLmoxzaY/xVvpWVKyR7yaN4oFgN/+unLINKZ8ICJJw+bAnGZjADpxr39NnPuuKePE
	 DYrwDLvIar1Am7OaD8WtzTrKB2Zh0YSXbIr0M4+5Mx+7TOealssDDd+s9Ynn+NmRoiztU
	 VtDgOHfdDoE+VbcCHG66IjT163FmL1bag+pkkNqgM/DFDQsEaNy0q1Bi2YduAtW/n1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794381536;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Envelope-From;
	bh=FDVYx8yy52ErHGioH23BNSxBVVZYdOQuntf0S9ipsa0=;
	b=JsfNuzhk1QrV6xm58UUlEs1bl8Z3sE/EWjXxNDESyawCYGlDGnv3FC+DARlVH5t+MooS
	 t8B4OKC9zXxyeNZ3X/T01RYieSijXACJ3tbvLDUqDLCVslLcnKyMvjl3BsoXpBWnj8o5D
	 A5Ds7KBVVyQw/nVO5UH38T8uP8EGUL0W86h0470CebAhrMc046KEJu+7zOU/U76za2kgY
	 jgcMaCDe/HfntvvtSma0IYGRceLOVx23Fd1AdNj85zrckpzo8mI1wpdS1PEryT6JUiSRJ
	 AlkQZwUQ9AcrBAdDjMSnrWh+5xHxBiV6UdyNHg1Ye0SlM4c3jJ68beq1WXd3SGEUmiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tychen.cc;
	spf=pass smtp.mailfrom=tychen.cc;
	dkim=pass header.d=tychen.cc header.i=@tychen.cc header.a=rsa-sha256 header.s=spacemail header.b=kXQVO9cc;
	arc=none smtp.remote-ip=104.207.68.34
Received: from out-93wp-a34.jellyfish.systems (out-93wp-a34.jellyfish.systems [104.207.68.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A2C606A321
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 07:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3A2C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.a=rsa-sha256 header.s=spacemail header.b=kXQVO9cc
Received: from fedora (unknown [151.145.76.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4jPZcm1bzTz6tkL;
	Wed, 11 Nov 2026 07:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1794381515;
	bh=FDVYx8yy52ErHGioH23BNSxBVVZYdOQuntf0S9ipsa0=;
	h=From:To:Cc:Subject:Date:From;
	b=kXQVO9ccHYWViACQPDpmlLFRWVPV5tx3Wzp1wFQE8lvUGe/Fky8pccpFlySaMwebZ
	 OOaHF2QabfKCa4jDKyjmPtJ+wLt6J5UjX7/5UXlpsLxuRvmzXZgWIokKpnDVLtL7Kk
	 Z/GgZwv3U2DRaoQd3VS/16JDypMjGxVqDhYtgEu5KZXzt+gZJocZ9v3EmZGuwj97TV
	 VN4N2Ts6u4yn92BnAuVu8dX/RKqSkRrKA19q2DTPcuGet+OxMCT+Fv+Q6jJsSVxuOw
	 CIn6hintx5fDEaMhzrax8MvVQdsbxmcaNjTzZ7UaOk5jWCr+8hvuR6gLu3X6JfQJTU
	 Y0uyj2IRM9XQQ==
From: Tianyi Chen <hi@tychen.cc>
To: bpf@vger.kernel.org
Cc: Tianyi Chen <hi@tychen.cc>,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	yatsenko@meta.com
Subject: [PATCH bpf v2 0/2] bpf: Fix RHASH batch cursor loss
Date: Wed, 11 Nov 2026 16:18:22 +0900
Message-ID: <cover.1794379108.git.hi@tychen.cc>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: hi@tychen.cc

Report a lost RHASH traversal key as -EAGAIN rather than end-of-iteration.
The kernel change is unchanged from v1.

Changes in v2:
- Add the batch subtests to the existing rhash.c suite.
- Carry Mykyta's Acked-by on the fix.

All 17 RHASH subtests pass in x86-64 KVM, with five further successful
runs of the five batch subtests. The concurrent-delete test still fails
on the unpatched kernel.

v1: https://lore.kernel.org/r/cover.1794056839.git.hi@tychen.cc

Tianyi Chen (2):
  bpf: Report lost RHASH batch traversal keys as EAGAIN
  selftests/bpf: Cover RHASH batch cursor loss

 kernel/bpf/hashtab.c                          |  13 +-
 .../testing/selftests/bpf/prog_tests/rhash.c  | 177 ++++++++++++++++++
 2 files changed, 184 insertions(+), 6 deletions(-)


base-commit: 475a0cfd02f14d764023e926ac01fc7597134229
-- 
2.56.0

