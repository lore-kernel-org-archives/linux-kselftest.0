Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=63.250.43.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794381590;
	b=C/E+DzbK44wSLAX/rJM3DOnffa32/9YYna5pnPzGGWi5+IdoKMiAMd6clgZr6DCS0UXJ
	 gfqMusvKk7Y5m3wZqiWsgKCHUUgSsH+lxHx29+sIBnCAFlT5xcZF07db6sJG/tl55gKPT
	 loWueQ2b8dN59M1aR0vmKYMq/MGptw8PRNKuEOFT8mPjkJma2eX830w5pmdiWaAnwEUby
	 7fn8VVv6LihllEb5j7kWfExnOnBI6yilhUP8e50uwRazdxJA5AjTFCXBk+KWVrJ4WUV29
	 367yBt7QAFhgD6JqJpDm1I3zd405em1VoyJ2Ze2dn4XGmeqeG0API6PdY2OY9AMtzuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794381590;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Envelope-From;
	bh=gWQy+iVU7ejbUzs5+wM93cZcNu+sDcoGHFgbKJFi5b8=;
	b=M+NKeuy17IDRNFE/bZ99Y3e2+O2COVPK7ZpGoPnQTRqpvY7EF4bilW20W2od8AEnxz2s
	 xDFbx6suKm57NoRAgAdl5zsPUJk0J5oiM/YRxYKCT95KsV03xmR5e3lBoRyx7NWetfAv0
	 ekGVyTCIKJmOUCtvEgsFs3O2VAaOUckSqiJJCpIyb6qoX6aclDMcCHvX8WBfbiy6Kdkfn
	 3F+cfW9EPwDUXXpJGtGE7aHGk40JP/hQ9rFHnNEtqSnrZnH2vT3efoKF5Zmzq7NwhGlIz
	 AumTJvdijI35v0Qid/yRls1khFOy4PwyRsAgib0kGTxs6Cm/g6WhYs8ChP0mLE+yfVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tychen.cc;
	spf=pass smtp.mailfrom=tychen.cc;
	dkim=pass header.d=tychen.cc header.i=@tychen.cc header.a=rsa-sha256 header.s=spacemail header.b=VPMP0nVU;
	arc=none smtp.remote-ip=63.250.43.116
Received: from out-2uec-a116.jellyfish.systems (out-2uec-a116.jellyfish.systems [63.250.43.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5823606A32E
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 07:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5823606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.a=rsa-sha256 header.s=spacemail header.b=VPMP0nVU
Received: from fedora (unknown [151.145.76.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4jPZf05fmHz8sWP;
	Wed, 11 Nov 2026 07:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1794381579;
	bh=gWQy+iVU7ejbUzs5+wM93cZcNu+sDcoGHFgbKJFi5b8=;
	h=From:To:Cc:Subject:Date:From;
	b=VPMP0nVUH5+ut5aXAq63K7h2ttnhWuZB9kePjVs0MbOT5RoDKNtUvd3cYKiD2hNYt
	 5A2DfsDNkUr70DiRaQ5UwLcpeMdengpW2dV/f46Cj/tr2ZldHVfXqxZklpgnqBBvSx
	 DJkhK/37dN3IqUZqTvrTh73HdJxThyOIQUVtGBfxVDumZv96HcahLYnv+jaYU7Gwh8
	 Rjbi/sKJZtaZjqtsmji1Idi5COieGNVMXOYLjMLG1Uu1tYm7s8c4MN/eT+d2S0cVFD
	 q5lujdW9gnBHo3Eqb4rNSNlb2KoYeakZs4AkZHAZyIbu6R3DAKsZTX8C7aaMG95Tge
	 89ELuTjszsNhQ==
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
Subject: [PATCH bpf-next v12 0/3] bpftool: Add recursive map dumping
Date: Wed, 11 Nov 2026 16:19:24 +0900
Message-ID: <cover.1794380385.git.hi@tychen.cc>
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

Dump each inner map in the entry that references it. This series is
based on the batch dump v10 series [1]; apply that series first.

Changes in v12:
- Separate plain inner-map dumps with blank lines and indent raw
  entries and counts, including wrapped and per-CPU values.
- Read outer entries individually during recursion; keep batch lookups
  for inner maps.
- Use LIBBPF_OPTS in test_unchanged() and check formatting and lookup
  counts. Size the per-CPU layout buffer from the possible CPU count.

All 33 subtests in the combined batch/dump/access run, including the
11 recursive subtests, pass in x86-64 KVM with both 2 and 128 possible
CPUs (2 CPUs online). The old combined bpftool fails the formatting and
outer-lookup checks. Non-recursive output is unchanged.

[1] https://lore.kernel.org/r/cover.1794380384.git.hi@tychen.cc

v11: https://lore.kernel.org/r/cover.1793818386.git.hi@tychen.cc

Tianyi Chen (3):
  bpftool: Reset map info before each query in show and dump loops
  bpftool: Add recursive map dumping
  selftests/bpf: Cover recursive bpftool map dumps

 .../bpf/bpftool/Documentation/bpftool-map.rst |  10 +-
 tools/bpf/bpftool/bash-completion/bpftool     |   3 +
 tools/bpf/bpftool/map.c                       | 131 ++++-
 .../prog_tests/bpftool_map_dump_recursive.c   | 480 ++++++++++++++++++
 .../bpf/progs/bpftool_map_dump_recursive.c    |  38 ++
 5 files changed, 639 insertions(+), 23 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/bpftool_map_dump_recursive.c
 create mode 100644 tools/testing/selftests/bpf/progs/bpftool_map_dump_recursive.c


base-commit: 0fb18ce8a2e9de830433923cf65838933d615359
prerequisite-patch-id: f2cb564c4555c7d7f3c87a7e9827a6e91816affd
prerequisite-patch-id: b8e7968eb997646d032c3489c5462230ee5837e6
-- 
2.56.0

