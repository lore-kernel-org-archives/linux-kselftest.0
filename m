Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821001;
	b=MZy/HBl1Mxicm+I1R51cYQrHG3MIV6XBqPXdg+deO4ejeRbgvGc82URp1P4mSOwIserS
	 27zBWJ8B59EBHd3vvDfARyivuZWhIht1hKHfT6vaIE6l16jD71YEZFa+vXK8WUthtGV9d
	 x1YmUY1reIfR+MAZlQJyZxYf+gxXbHk0CYF/Sk+qnYh1hkbwx1JkRBlu+0LLu4uJDu9nE
	 ded55EUmHispfy9zc/eXfmQG3jBbuFTXfk9Ky1ihDYLzme2Msri1cR2TcuyW2y29YR7QR
	 1s8MzPYbFrkWkSAX8fKv+x4Yjz2bYUL+Pvpsb/oikwWp04L597m9j/FiIQKum4QDMsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821001;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=X0+bPs3huBydmv4YA/a8oHuP3gYp1D95Kp37Nl2w7iE=;
	b=snIfvGqVUBy2HVNeYZ2SKE/n7Wi4ZmR3zdCkE2PAFc67sdfagoBhKrd30EV/nXh3yqYB
	 XemA1juTKeIYqaF5vFLNIog9jUPPTpCRsg0ntwQOB93H9iTRwq/SBrMtR87wKsgmFdMmY
	 rMRkyryCrhj6raZZGENPsO18g6jhGV7XBQYNJ5uqzH/rGRqiES0NegbTh0YpekgweTmAm
	 636DIIzC92ELO2cePgGdK+vVSJRjjFj4+1G/XIIz1/6Zmz14b5sEtXLASm90kJwvz6dIe
	 ioVVqbgQOVrlwx4ZrYpj7TOBWyvnnpLWEYChhvD2Vleb1BAoY1uI/MuRZ7V5SYa3NxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="eTe8b/Ai";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1D9606FAEC;
	Wed,  4 Nov 2026 19:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eTe8b/Ai
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 855FE1F00919;
	Wed,  4 Nov 2026 19:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793821001;
	bh=X0+bPs3huBydmv4YA/a8oHuP3gYp1D95Kp37Nl2w7iE=;
	h=From:To:Cc:Subject:Date;
	b=eTe8b/AiMIbSkffxZm6ryyvxgTQxy7qYq1EpcivdiJzs0Azmolt9hPtoBPZVpndig
	 1M0ftuXa/bpySQNDaqQEfD79Uy79HyUpsTK/mz0ns+vrsKdxJFHUzsIbHdaUVhFxsJ
	 p0u61brQ3zp5BAkJf0bhCXM29/sZ6gMkamHbPTuJTJce4YGMbG5lari529xK7vU24F
	 jYHqlkcp2tMuBxTmrAywOBbGc1x27bqXUzdoKjdqcRaH5LoW7qad/fd/iE9VrS7jpF
	 XaGaxcUxKMYrmIoD6e62zK9ozkveBNUaN/lCiB+Btd66lguslJZZN1XEx7CkaHw1G4
	 FIgof8cuEjnlg==
From: Sasha Levin <sashal@kernel.org>
To: Shuah Khan <shuah@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Aleksei Oladko <aleksey.oladko@virtuozzo.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/prctl: select the tests by ARCH alone
Date: Wed,  4 Nov 2026 14:36:39 -0500
Message-ID: <20261104193639.333186-1-sashal@kernel.org>
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
Content-Transfer-Encoding: 8bit

The prctl tests are only built for x86, and only when CROSS_COMPILE is
not set. In every other case the Makefile defines no rules, so building
or installing the suite fails:

  make[1]: *** No targets.  Stop.

TuxMake sets CROSS_COMPILE for every build, native x86_64 ones
included, so CI systems that use it, such as KernelCI, see prctl fail
on every architecture and never build its tests.

Like breakpoints, ipc and x86, decide by ARCH alone whether the tests
are built, and give the Makefile empty targets on other architectures,
as sparc64 and drivers/s390x/uvdevice do, so that the suite builds and
installs nothing there.

Fixes: 92dd8dd4d07f ("selftests: move prctl tests from Documentation/prctl")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Found with KernelCI-style TuxMake builds that record per-suite results
with KSFT_BUILD_REPORT. With this, an x86_64 build with CROSS_COMPILE
set builds and installs the five tests, arm64 and arm builds succeed
without installing anything, and the tests also compile for i386.

 tools/testing/selftests/prctl/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/prctl/Makefile b/tools/testing/selftests/prctl/Makefile
index e770e86fad9ac..b230e4d955061 100644
--- a/tools/testing/selftests/prctl/Makefile
+++ b/tools/testing/selftests/prctl/Makefile
@@ -1,5 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-ifndef CROSS_COMPILE
 ARCH ?= $(shell uname -m 2>/dev/null || echo not)
 override ARCH := $(shell echo $(ARCH) | sed -e s/i.86/x86/ -e s/x86_64/x86/)
 
@@ -10,5 +9,8 @@ all: $(TEST_PROGS)
 
 include ../lib.mk
 
-endif
+else
+nothing:
+.PHONY: all clean run_tests install
+.SILENT:
 endif
-- 
2.53.0

