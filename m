Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732517;
	b=SNA5Kc35KlFp5HGNEtFduJm1aBWvKFBUFLpOW2QvlnXBcAb3BTEXu0NqKduJiImdVb+o
	 CX+wL29+U36pxQZUYqjuwTLwCMfFjPbtGhAMjZVFAb/RTlntznLTrPB4j2exg+5U89r9m
	 RWSzWBwSQhEZElwunwxIf/KrpIVPLjQPDn5OY6Y83p17e0WB7WAPyUkRoJCMANcsa83Rh
	 KxFuECMPx+SHLJg1qYtqYwMeKWkXeV2FqGr/cyX4K+9++3J1VqwuNMVzi2ZZSF25VGJd2
	 rgGtKbULy8U9v4qWZgpDClz74NoM/duz1dNGU9AIdQe0O41a0BvNQEHEv8bEAtE58hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732517;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:From:Date:Subject:To:
	 Cc:X-Envelope-From;
	bh=FJ4h+YnyaLgUIGCR3B3/vMguXn3tVihBsJl6Sia2pRM=;
	b=TSIrOgvbuu9V+pA8bPKYzjZ1qYDkPwzVBD0AMV69d6kWVYyy1zWejWt87nq26kUg9wUM
	 ObF47QkPc5ZFmjDnzOLrvaEsna4mVrAuqnRvyRnUUBntBlg1jviS/kf8kHwWtAGB/GKCN
	 xLtFdbwnFUzALOUAamoDUrnu4gBSs6IPiOy1IHEEdVXjbnQIag6hE3+08qXocMKniZACZ
	 IB/H1N0UafTlFLwZP4/ocnUmDLRnLA42YqxPGppnO6RUhVXalWur/e6g8mOCLKiB92Yat
	 Hvw8Of9zxBc2VA2xAojVsOl0rwBat5deFE0jL9hv7+xjxDXLXT/Jiub4hIHcgJyK6uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tychen.cc;
	spf=pass smtp.mailfrom=tychen.cc;
	dkim=pass header.d=tychen.cc header.i=@tychen.cc header.a=rsa-sha256 header.s=spacemail header.b=i6td7gWW;
	arc=none smtp.remote-ip=198.54.127.131
Received: from out-2z4y-a131.jellyfish.systems (out-2z4y-a131.jellyfish.systems [198.54.127.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679F9606A329
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 19:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 679F9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tychen.cc header.i=@tychen.cc header.a=rsa-sha256 header.s=spacemail header.b=i6td7gWW
Received: from [10.18.116.108] (unknown [151.145.76.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4jJyby1hG3z8sWS;
	Tue, 03 Nov 2026 19:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1793732514;
	bh=FJ4h+YnyaLgUIGCR3B3/vMguXn3tVihBsJl6Sia2pRM=;
	h=From:Date:Subject:To:Cc:From;
	b=i6td7gWWnrq4zoMMCT/0W9ecYzKuRDVqGmoRt5Dp6YcC/10U6LPPXRgKx3pZlARu/
	 +bkT2Q2WwseVs2KpLelgp0xTbQFfr+pAe7jIFPEDFH+vQdcmgQJSeoWJ/ZBmBsV30k
	 ZWwWZOW3xFZMSUHXV3aynVTAdqq61qKwjvJ6pPTQuy008a9cRr1BQ20V2yFPgHzjWT
	 tR4rbb2kyYzDgtWlZjSunpqJ8te6TAgyK+76LEJuK10sR4Mf5SIAL9QdRE3eTb9W0k
	 sF0RWgWyVn0CGtWNjV4vk1PAP/bCw65S4VgdvoOW0Xw0GFeN/9gP2G6Clb3cWJgFco
	 9/Qu3NIZwfhLQ==
Message-ID: <cover.1793732386.git.hi@tychen.cc>
From: Tianyi Chen <hi@tychen.cc>
Date: Wed, 04 Nov 2026 04:01:49 +0900
Subject: [PATCH bpf-next v7 0/2] bpftool: Batch hash map dumps with bounded buffers
To: bpf@vger.kernel.org
Cc: qmo@kernel.org,
    andrii@kernel.org,
    eddyz87@gmail.com,
    ihor.solodrai@linux.dev,
    linux-kselftest@vger.kernel.org,
    daniel@iogearbox.net,
    ast@kernel.org,
    hi@tychen.cc
X-Envelope-From: hi@tychen.cc
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list

Rebased on current bpf-next, retaining Quentin's Acked-by.

Changes in v7:
- Use the upstream error formatter for batch failures.
- Refresh the matched-base timings and syscall counts in patch 1.

The 12 batch tests and both upstream non-iterable-map tests pass on
x86-64 KVM with Linux 7.2.13 and 7.3.0. All 33 focused subtests also pass
with the map-info/recursive series; per-CPU fallback output is unchanged.

v6: https://lore.kernel.org/r/20260925174412.2028749-1-hi@tychen.cc

Tianyi Chen (2):
  bpftool: Use batch lookups for hash map dumps
  selftests/bpf: Check bpftool batch map dump contents

 tools/bpf/bpftool/map.c                       | 123 ++++++++++-
 .../bpf/prog_tests/bpftool_map_batch.c        | 191 ++++++++++++++++++
 2 files changed, 306 insertions(+), 8 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/bpftool_map_batch.c


base-commit: cd5bc55288d4fd999595c8f2af6a5408cbe92a52
-- 
2.56.0

