Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=104.207.68.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818533;
	b=dxHgC04EqKfsaYjBR2QrKZ63Q64jY1udjKWdQudd9ov5Huvb8fsfy3ZL6qWkM2LqKbwZ
	 86ceKbu4XLN+eEQvhRVe1wMVXYl9i02VzMFgk/YpRHTO8CoG8o/XJiU3j0jO+dqW5aFyC
	 /Pt8lrVqV/VWIXrd6KlniQ6HaL27ne3FqMCGtod3LeSc+R3YcKQn80XAfJmivXgLneY4z
	 Aev8Iu2te8MKEsJWV+r73sfA1aVH4UnvHSfq3J3pflc487YXQBUSnUUGgI6GtceIUKVPZ
	 lQI522VZsHp3cQp+Fun2mWts+UwuzGsCD4Jdrbe67jDPZBGdeUyMTmERg60RSZOtMUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818533;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Envelope-From;
	bh=kAxZC5zy5tA55AkBAXOT3P4L7TjFEGjmjCz4a0y1q2M=;
	b=eKdDDE2rVOkF9ZFY2UZrNcrXBY/C/NG6IRx6UseqPVsjP+/Uj5FNeN8+5qOve1uvrMJ5
	 lYrkW0GXaRYqQOCp0D56ZyuJ5VMCRBQpxxqeAZZGyR2tZ7NQ/vns2dk2wi9Fn/wxacPDT
	 AvBwoH7yrCJerT+aeWsuH+Vq6zaxNjoLO0HBTn5srIxm8JYyAwyFKR6xANkQhzgX7vcNL
	 xV05eN8lccaRFxL1vhsT5DRe9xV4icf1pI6VrAZ68e1XSpmMWiigMQ3NyPDDRrtJtp5o9
	 YSZJKKwlSr1IJt45TATJv/qT+RUiLfqUemk4Pdkkf91ioVqGLCJdTKtWWS4ZOdgvVlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tychen.cc;
	spf=pass smtp.mailfrom=tychen.cc;
	dkim=pass header.d=tychen.cc header.i=@tychen.cc header.a=rsa-sha256 header.s=spacemail header.b=PKPcN2O8;
	arc=none smtp.remote-ip=104.207.68.21
Received: from out-93wp-a21.jellyfish.systems (out-93wp-a21.jellyfish.systems [104.207.68.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77ECC606A331
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 18:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77ECC606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tychen.cc header.i=@tychen.cc header.a=rsa-sha256 header.s=spacemail header.b=PKPcN2O8
Received: from fedora (ec2-52-197-241-54.ap-northeast-1.compute.amazonaws.com [52.197.241.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4jKZPs5k1Yz6tkL;
	Wed, 04 Nov 2026 18:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1793818516;
	bh=kAxZC5zy5tA55AkBAXOT3P4L7TjFEGjmjCz4a0y1q2M=;
	h=From:To:Cc:Subject:Date:From;
	b=PKPcN2O8cAgcYZHJQ9SrOFYABz7v9H69zeYd9JAmt3dvOfaidNgThCJfaodKIczKk
	 hElxsXQn1z0kEco+TVGgxU6SA53tMlmtYvb/ZoLr4oZwUI4H4t6qsnK2axQyLIi6bO
	 erFWI5q/cQ3ro4C0inSz8sFJ9NJ6pJGwJmMe+/y0MimsrNRsuWq30alR73By2nRIIR
	 nuKrg1NmJ/FNT3lltcB0bqDjSxUtJah/dGEY77D3hgt/C2Zp/KtoUIiKsz1u15pQge
	 oxEs8v+eF+owQ5x7TwDpX0+A8erlwfautH34LEDFIAC1QGx5LUndngCHUIwUWLeZN+
	 Mnr8J4CirUwzA==
From: Tianyi Chen <hi@tychen.cc>
To: bpf@vger.kernel.org
Cc: Tianyi Chen <hi@tychen.cc>,
	qmo@kernel.org,
	andrii@kernel.org,
	eddyz87@gmail.com,
	ihor.solodrai@linux.dev,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	daniel@iogearbox.net,
	ast@kernel.org,
	alexei.starovoitov@gmail.com
Subject: [PATCH bpf-next v8 0/2] bpftool: Use batch lookups for map dumps
Date: Thu,  5 Nov 2026 03:55:02 +0900
Message-ID: <cover.1793818387.git.hi@tychen.cc>
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

Use batch lookups for map dumps and continue with individual lookups
from the last printed key after any batch error.

Changes in v8:
- Follow Alexei's simpler approach: use a 1 MiB buffer budget, remove
  buffer growth and error classes, and try batching for all map types.
- Count and fail bpftool's lookups in the selftest. Check plain and JSON
  output, including failures before and after the first batch.
- Drop Quentin's Acked-by on the rewritten patch.

Tested in an x86-64 VM: all 16 batch subtests pass; unpatched bpftool
fails all 16. The combination with the recursive series also passes.

v7: https://lore.kernel.org/r/cover.1793732386.git.hi@tychen.cc

Tianyi Chen (2):
  bpftool: Use batch lookups for map dumps
  selftests/bpf: Check bpftool batch map dumps

 tools/bpf/bpftool/map.c                       |  97 ++++++--
 .../bpf/prog_tests/bpftool_map_batch.c        | 228 ++++++++++++++++++
 .../selftests/bpf/progs/bpftool_map_batch.c   |  42 ++++
 3 files changed, 352 insertions(+), 15 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/bpftool_map_batch.c
 create mode 100644 tools/testing/selftests/bpf/progs/bpftool_map_batch.c


base-commit: 8fb43ffc3327d12d57d3fbe6f4820b5a522de0d1
-- 
2.56.0

