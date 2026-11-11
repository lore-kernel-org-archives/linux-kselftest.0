Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794381570;
	b=GhJiGLBRNoxH3G2TXjP0WLx/MgrlMu4V+8CDe+x6yWWo0OJrzEhuBlGoxCTbRSPV3PU4
	 k5nJ4N/s+onla13DtEbpNJxTXikGmwpJcsNZjAf3LfKdsJCxJLYbNQmoBWlhPON9QJ0tT
	 Cn2MLxBBoduTucykMSxttx61r9J/3oBmP1vqHV9K5huGYM8YUFVp7hNlMRbNU9WbO6CPv
	 uUwZ2ftLCWkz35Gc/NosNs4c+lAvJISh44WllZE2F18JdJP2qABpAIm/j+jHypZbx+NhW
	 aNId6jHWQKjWCpmNmcIWGABSeHNxFIGyqPGtGVC9Rdsj8ykGcBIA2HYRxBG8Y4dMzfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794381570;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Envelope-From;
	bh=+QL4OQsLb5HU0qDdnbeVb1z/fCiXZxiBAN45RxlTd70=;
	b=TRgcW484H6b4sx5r7L6zL4sm/h0q+TWhNnQVv5N47lI0FyjaZtXibS4bKmMeF91fOsgE
	 V3k6COgMJ4mpguQrRHoBIvZzFo61CvUoCfeM4Tt16WCV0YeGcxYUZdMS26Rdu5o35nu54
	 wRwxUsUuRUYX1Nh8TMxgLQ061jVYI1d+vXC24FM8BtL9Og8PlpvsHEPPkvm/nWifDcoVl
	 nJQ63tyQ5RWQ4YZCdM6LUcV7EmkNJUgy1th+6Y6Lvh4G7dbYqLhpHeXYrYGF4mdbAMx6f
	 wDS74kCFIPO1rV2mXt+l+GMaCXKbVk0dmCEuYES2XKnFDG7y/U/XVvODuMDtBFqmaxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tychen.cc;
	spf=pass smtp.mailfrom=tychen.cc;
	dkim=pass header.d=tychen.cc header.i=@tychen.cc header.a=rsa-sha256 header.s=spacemail header.b=H1vTB9RW;
	arc=none smtp.remote-ip=198.54.127.77
Received: from out-zbxj-a77.jellyfish.systems (out-zbxj-a77.jellyfish.systems [198.54.127.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06DD606A327
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 07:19:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C06DD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.a=rsa-sha256 header.s=spacemail header.b=H1vTB9RW
Received: from fedora (unknown [151.145.76.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4jPZdQ33qnz8sWQ;
	Wed, 11 Nov 2026 07:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1794381549;
	bh=+QL4OQsLb5HU0qDdnbeVb1z/fCiXZxiBAN45RxlTd70=;
	h=From:To:Cc:Subject:Date:From;
	b=H1vTB9RWXmL8OfctDQeeTsxZXEbPYwEcsyozoFLdZ+mKtgR3vJ+fOnZK13r6BYEVK
	 zb5xxA252ADxOQBBDsdGtPWLwwbFxw7+rzIO8NOb48sR3qp2Ol07Yuk0jg7pYTVq7I
	 iaqrcj8x8sUFoYMU8xLCwj3zc69nW/QmNDKhjHIM4ptjYVQsDTghW414YGzLuXX99J
	 zOMhnzHNaGtqQzr11CvDNKcXYcti2YG3gc/O2goz3PhOzJhyN8OlH1Lf2BuomJsVb1
	 c5CDRUdJg4ZviwI+hHbF9VTuThosPxEP/pJSLrwc7QVqnqN8WYX7F423JvCMOyVAKV
	 A3XbFBWooQRUQ==
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
	qmo@kernel.org,
	ihor.solodrai@linux.dev
Subject: [PATCH bpf-next v10 0/2] bpftool: Use batch lookups for map dumps
Date: Wed, 11 Nov 2026 16:18:54 +0900
Message-ID: <cover.1794380384.git.hi@tychen.cc>
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

Use bounded batch lookups for map dumps, falling back to individual
lookups after the last printed key on a batch error.

RHASH concurrent-delete correctness requires "bpf: Fix RHASH batch
cursor loss" v2 [1]. Please take that kernel fix first.

Changes in v10:
- Document the non-zero key/value size precondition.
- Rename the tests to bpftool_map_dump_batch, drop duplicate LRU cases
  and use small per-CPU maps. Reserve JSON checks for representative
  raw, BTF, per-CPU and multi-batch paths.
- Carry Quentin's Acked-by tags.

The 14 batch subtests pass in x86-64 KVM. Combined with recursive v12,
all 33 dump/access subtests pass with both 2 and 128 possible CPUs
(2 CPUs online), without skips.

[1] https://lore.kernel.org/r/cover.1794379108.git.hi@tychen.cc

v9: https://lore.kernel.org/r/cover.1793821981.git.hi@tychen.cc

Tianyi Chen (2):
  bpftool: Use batch lookups for map dumps
  selftests/bpf: Check bpftool batch map dumps

 tools/bpf/bpftool/map.c                       |  98 ++++++--
 .../bpf/prog_tests/bpftool_map_dump_batch.c   | 229 ++++++++++++++++++
 .../bpf/progs/bpftool_map_dump_batch.c        |  42 ++++
 3 files changed, 354 insertions(+), 15 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/bpftool_map_dump_batch.c
 create mode 100644 tools/testing/selftests/bpf/progs/bpftool_map_dump_batch.c


base-commit: 0fb18ce8a2e9de830433923cf65838933d615359
-- 
2.56.0

