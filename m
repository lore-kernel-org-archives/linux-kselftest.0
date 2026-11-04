Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822093;
	b=3y13403ETJWTDfxDQCtVDsYhbMDch/MqWd8vjNT//EbxC8FEjYxbE8uFsbxIeaLJPuaa
	 iL/kJbxRo3RWtUdQyWRK1IWiD+TaPN/eCTrBk2jtd07lhxmfuo6gxup0thsdGUP9ExdaV
	 I9xQ3CVBEu5jHyPcJMRu6V7+1s09ediCFcy6hiOYwanwi/wQ6XURY9L6XF8FmrUwSYsp/
	 VVkE07Oflao1+WYq8sNtK60f0mF13HyDOLJUPaz8zIMLOHNUfksn9bqigayCe2Qp9wAUt
	 jnJ7Z+VnJTE5DjcdiLG2/B+cXFEN/JnnamWAUogOGLhQmbuuQrGcpBUUBcqg9clkGPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822093;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Envelope-From;
	bh=WHoNfqtH04OsXPCfBb3kmpxHV2hBvnBrqZ8UJDzkCnw=;
	b=eHXaRAQrktF8psjUdi2IudSfzPc3+RIjLf21zDeJCtLK57/95hzkDHQ1G3CsKxdaVtdt
	 6K9/dfDNHiAyiBK48S3owm0bA//AiP6cmBxjHoUqnb0aFAdQ04517JDOPi5XVbAFXcuY2
	 Cvoq/gmqGUsmyjpTmDtVR+giVFw7YjLl2ZMhRUC1HhWw+GiVYB59C/nGUVskZrdMJJ8XW
	 aPiUv/Eqnc4A8Q5R7GP1hLtGLTZcO3IIcrlPJ3PH3dWkYBea2gdWexXmgXQO9CHYy//0/
	 mHBUz1c6iniK4cHQw6ekRcCkYV9cPN8P/nU5YstGrTS/ZWnVJ9hBTzRJofs1bIYre+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tychen.cc;
	spf=pass smtp.mailfrom=tychen.cc;
	dkim=pass header.d=tychen.cc header.i=@tychen.cc header.a=rsa-sha256 header.s=spacemail header.b="l+i/qV1K";
	arc=none smtp.remote-ip=198.54.127.64
Received: from out-zbxj-a64.jellyfish.systems (out-zbxj-a64.jellyfish.systems [198.54.127.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40DC606C581
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 19:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B40DC606C581
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tychen.cc header.i=@tychen.cc header.a=rsa-sha256 header.s=spacemail header.b=l+i/qV1K
Received: from fedora (ec2-52-197-241-54.ap-northeast-1.compute.amazonaws.com [52.197.241.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4jKbk66vx5z2x9B;
	Wed, 04 Nov 2026 19:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1793822066;
	bh=WHoNfqtH04OsXPCfBb3kmpxHV2hBvnBrqZ8UJDzkCnw=;
	h=From:To:Cc:Subject:Date:From;
	b=l+i/qV1K19UXI2JQaKILic7H7hYxMc3ziO2wfGAmeT4mXNCCK0XCX5VKNbTWxLAvR
	 vAtGuDAoGg87sYs56aArYpvBjPLfEcMwRWzjtsC2dzLO3u1E592kuxobhJ/rSJlZRT
	 Dc3QbteLRKZux/gsE0XimaBJGMMESwioUd1uNrkFVRUNShOJqrT4BElvcPzwnFMmh6
	 l6nQESUUhdGwE52c6M+Zot4Ch7MF6pnumE8ssovsi8De5XtaD/Ef0w04DvGbTBufKC
	 QRZKYZXodV+9lfQPoYBktV/wzwZyyhAFIkv6x1naP4Ayi4x6ozKcRrDyR0w2XGUYQN
	 8S0t/oldSdVhg==
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
Subject: [PATCH bpf-next v9 0/2] bpftool: Use batch lookups for map dumps
Date: Thu,  5 Nov 2026 04:54:11 +0900
Message-ID: <cover.1793821981.git.hi@tychen.cc>
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

Changes in v9 (selftests only):
- Pre-size RHASH maps to keep asynchronous growth out of the
  order-sensitive dump comparisons (Sashiko).
- Correct the explanation of the injected -EBUSY: it exercises fallback,
  but is not the current hash bucket lock failure errno (BPF CI).

Tested in an x86-64 VM: all 16 batch subtests, 100 repetitions of the
RHASH subtest, and the combination with the recursive series pass.

v8: https://lore.kernel.org/r/cover.1793818387.git.hi@tychen.cc

Tianyi Chen (2):
  bpftool: Use batch lookups for map dumps
  selftests/bpf: Check bpftool batch map dumps

 tools/bpf/bpftool/map.c                       |  97 ++++++--
 .../bpf/prog_tests/bpftool_map_batch.c        | 231 ++++++++++++++++++
 .../selftests/bpf/progs/bpftool_map_batch.c   |  42 ++++
 3 files changed, 355 insertions(+), 15 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/bpftool_map_batch.c
 create mode 100644 tools/testing/selftests/bpf/progs/bpftool_map_batch.c


base-commit: 8fb43ffc3327d12d57d3fbe6f4820b5a522de0d1
-- 
2.56.0

