Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=63.250.43.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818494;
	b=Ts34mG7ee6QnG6wR1yBn/0ZfvzkCekUDx3mdp1JlEaQuZlJB0Zo+1sdHmPnxdzdOlbvl
	 KbBW13Y7u2azWGE1n0vI/IUR7ERgnNpjQdP+DICUFeH+qg8TZ6qJPnzyfpa37RylPi1sX
	 Hyt7audbUOjSgFynQQZXloUipgcnnPq/pXCQpMSiyQ9w1YUOQI2evLjLY2V3GEP/lLGk9
	 9Ca4S3s2O/5rFozR+4/0EAz0xH5YLQAzY9tTBpsknEy2+ay/0QovtT8JVlWSuYqwVqAqT
	 ErY0RnAQJ5PvrwPvtn2yRP1iaABHiHtw+C6F0oyg7Q7VyPFIaNC7t9/WkeHdtThaGWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818494;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Envelope-From;
	bh=DhE9pS/R2JT9liAZOqJWys/743Fnb42sj7FCB68RT3A=;
	b=bGg50Ox5mwmHInoxzQRjlaqonHSCnNtj86n3bwqUoxqNjGi6nq+ggKpKgfeKMxU07nP8
	 8lB0NhHLGvewXCjIBRrtOHWpD8AB/emsmRWNGmJ7ZTvCjRsIv3/dLXr/9Bt2RtXPoENVn
	 K5xJKIYez4nO2SZSLpVRbXVsAEuOvejiA8ugKzOGGqznu8qgGd080JFLb4SFpWvotPM64
	 Zi6sI7rbBjly4QqB8PfcSHIXu1znvB+ZTjkxi+S0mCtvtFk7/Pjszh06b9oszGeZsekVT
	 0+gRKSW+bVk8Upo5AnUXf/xBv5YaMfG2DsGmf+Hh79RW13xo0NlLM6Hnv1Sl/aBRtfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tychen.cc;
	spf=pass smtp.mailfrom=tychen.cc;
	dkim=pass header.d=tychen.cc header.i=@tychen.cc header.a=rsa-sha256 header.s=spacemail header.b=GoUJQhyn;
	arc=none smtp.remote-ip=63.250.43.97
Received: from out-2uec-a97.jellyfish.systems (out-2uec-a97.jellyfish.systems [63.250.43.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C12606EE86
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 18:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7C12606EE86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tychen.cc header.i=@tychen.cc header.a=rsa-sha256 header.s=spacemail header.b=GoUJQhyn
Received: from fedora (ec2-52-197-241-54.ap-northeast-1.compute.amazonaws.com [52.197.241.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4jKZPN5Rpsz8sWS;
	Wed, 04 Nov 2026 18:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1793818491;
	bh=DhE9pS/R2JT9liAZOqJWys/743Fnb42sj7FCB68RT3A=;
	h=From:To:Cc:Subject:Date:From;
	b=GoUJQhynFrGakBujM2PEYzpIKqCp2r2OqsIFJPC+OJDNt7mfiuVuf05oTW8276R7T
	 KRZxPteUHCp6SXkKcLzAEk3iqLQpnPEqPULWmHoe54IRwGbMzi3vNBAeYB/OifATBK
	 ZprmsQhVmFrKsc47HeAlKkrG5pZ8mgfuxTARn8+qfPELCB5oUX7sVhr675UE+fu97Z
	 0yhBvToeDy8JRm2EzUtV3QJNtAVE+l/UrLjvXkpYGqLoIYzTroE4dOztU11pSfXjrV
	 O7/oH3L3wxlpAX2Lmbrm5mjyqDj0IKzpw5dZDnWoN81+f/w3e1UbokYNy4TvJR304d
	 OaXqfIAAhWEzw==
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
	alexei.starovoitov@gmail.com,
	skokovmaksimevg@gmail.com
Subject: [PATCH bpf-next v11 0/3] bpftool: Add recursive map dumping
Date: Thu,  5 Nov 2026 03:54:36 +0900
Message-ID: <cover.1793818386.git.hi@tychen.cc>
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

Dump each inner map in the entry that references it. Open it by ID, dump
it and close it immediately; a missing inner map is an error only in
that entry, and shared inner maps are printed in every referring entry.

Changes in v11:
- Drop the queue, deduplication and second pass, as Alexei suggested.
- Drop the ineffective map-info test. Keep the map-info clearing fix
  for bpftool running on kernels without the kernel-side fix.
- Rewrite the recursive tests and drop Quentin's Acked-by on the
  rewritten patch.

Tested in an x86-64 VM, including shared and missing inner maps, BTF,
multiple roots, and the combination with the batch series.

v10: https://lore.kernel.org/r/cover.1793732336.git.hi@tychen.cc

Tianyi Chen (3):
  bpftool: Reset map info before each query in show and dump loops
  bpftool: Add recursive map dumping
  selftests/bpf: Cover recursive bpftool map dumps

 .../bpf/bpftool/Documentation/bpftool-map.rst |   9 +-
 tools/bpf/bpftool/bash-completion/bpftool     |   3 +
 tools/bpf/bpftool/map.c                       |  67 +++-
 .../prog_tests/bpftool_map_dump_recursive.c   | 375 ++++++++++++++++++
 .../bpf/progs/bpftool_map_dump_recursive.c    |  17 +
 5 files changed, 465 insertions(+), 6 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/bpftool_map_dump_recursive.c
 create mode 100644 tools/testing/selftests/bpf/progs/bpftool_map_dump_recursive.c


base-commit: 8fb43ffc3327d12d57d3fbe6f4820b5a522de0d1
-- 
2.56.0

