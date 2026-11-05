Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883424;
	b=5abBPFQK8xtbThFY1UgHjRq+Jkm3/2HgBjyekK4vEIHpxSGbx26X/tujntsgIbVuB9wU
	 amG4D2rFEwriRPX+ghGzF7Q1pW7wPUjcLB41EPr/rYDZqlFuVPIKPpWejGk7E5f0PLWif
	 twjrzLs/aPxvT1JQiBVkn5zysoa9ZRURZ4/Vp7ceqjd+AXOKd+M9fopQZEw7S4GjnV8y+
	 i9Z1SHNlMjuDfAc5CKqLmJzTRTnCyJaJ5GbGEct8fcddiMCGJyBLpdvZsOZJqpdYmlErL
	 BfNerzKqT7ZNrxldBjKPr2QQ1PTBc0o8+pUXmXFnnJX/ZhyZIzRnN0vip//kZQAinDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883424;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=6ZdWd9DpqOCzkQFl85BzLJVbsF2MwY+Jr5TxyApvNGc=;
	b=c5n2na3eqjB4Fw69A98jyHurvg5sm+YrEOPIgCSknd3PFK/fggg0wxWBUTuXh/j0EwXK
	 NqV3pz55n5TBaAETBSKB5N9jV8kJfo5qAEsD05pswKSv3fnODfWSh/XRMherrQ1CQx1hk
	 RS/F4jLznaQuJSFpcgov/fszidjCs9maCPgT6drPts0v8NeOVNpaGCkBTxl+zKJmhderN
	 8IcmCLXR5mLNKtloN2IubbZBQWhKMp0Mimu+Mhard4531wxFD9mbuFzGkIIgvWE61t4nW
	 cKa+XA4W7X34Z64pZvtB/SHkMpRGZxdtbjxnEC913MeJvsBXIhGo3La+8UQHmyd0aFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hffKrapl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33ABB606A326;
	Thu,  5 Nov 2026 12:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hffKrapl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E6D1F000C1;
	Thu,  5 Nov 2026 12:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793883423;
	bh=6ZdWd9DpqOCzkQFl85BzLJVbsF2MwY+Jr5TxyApvNGc=;
	h=From:To:Cc:Subject:Date;
	b=hffKraplRz7pqDxe4LqjKCfL+qBomnmHugPychqHpetlgNHHWqDQUg/B1ws+/L7Ai
	 c45iEvZFAp15HvNvOrku6zRVJcc/zWQV2Y8/Gbzvyom1Qv96VkHHcW7PKRbWSiyMyD
	 XNO7QdCKcc7/tIueBN/FdRlxqzFU9MfNsKycGk2LfrGiOOOWX1361oNldIeuVWJ+gz
	 79LrsyvM3ZV6GkJIWtFwqHaeFpGsZJlzPL48nceBYmOeaH5cp2eOejKzoopF56njlV
	 gNekU72mdfTWk+zEdK6cuHEQupBlI6U03JcbJUNhRcnZl40Y/4ILpEQVMy6alJP2ZV
	 OxkygSUrKA7wQ==
From: Sasha Levin <sashal@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Ivan Orlov <ivan.orlov0322@gmail.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Nageswara R Sastry <rnsastry@linux.ibm.com>,
	kexec@lists.infradead.org,
	Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Wake Liu <wakel@google.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 0/3] selftests: target selection fixes for cross and LLVM builds
Date: Thu,  5 Nov 2026 07:56:58 -0500
Message-ID: <20261105125701.1605281-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A few suites select their tests from the build host instead of the
target, or depend on the host C library in ways that break cross
builds:

 - set-anon-vma-name-test fails instead of skipping on kernels built
   without CONFIG_ANON_VMA_NAME.

 - kexec only recognizes the ppc64le spelling of PowerPC and decides
   about the x86-64 jump test from the build host.

 - size links a custom _start against the static C library, which
   fails on ARM with clang and on LoongArch; it now uses nolibc.

The patches are independent of each other and apply on
mm-nonmm-unstable.

Since the original posting:

 - "selftests/prctl: build generated tests for the target architecture"
   is dropped. "selftests/prctl: select the tests by ARCH alone" in
   mm-nonmm-unstable replaces it.

 - "selftests/thermal: allow cross builds of the Intel tests" is dropped,
   it went in through the thermal tree as ff4194e54f84.

 - The size patch has Thomas's Reviewed-by.

Original posting:
https://lore.kernel.org/r/20261014200127.1363472-1-sashal@kernel.org

Sasha Levin (3):
  selftests/prctl: skip the anonymous VMA naming test when unsupported
  selftests/kexec: select tests using the target compiler
  selftests/size: use nolibc startup and syscall wrappers

 tools/testing/selftests/kexec/Makefile        | 26 ++++++++-------
 .../selftests/prctl/set-anon-vma-name-test.c  |  3 ++
 tools/testing/selftests/size/Makefile         |  9 ++++-
 tools/testing/selftests/size/get_size.c       | 33 +++++--------------
 4 files changed, 34 insertions(+), 37 deletions(-)


base-commit: 72afe7762a29508ae89831540347c1be3b7ba621
-- 
2.53.0

