Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721291;
	b=U5ivIo46mBacm/B7evRbzCHGzej8nasGkBgLOUkm5ksOJV1CbmGIopDSosKRG+jgwlgR
	 Pd/bjxvi2vxW4LTanejXpXoZ7UkI9QDOeY+tuI3tRq+up6HWCMsmvsA8R5rC3V7HnzRSb
	 uWPXiMNgDOApMKLQr42mkI8dv/l636UPQysHC23s9LqDK2ppqBmnz6BBqlvMKBNitCGqs
	 qRnuSFBHJ+OOaCfVFaP7ydd6XXzSVzk84ATXCH5oMyWlVj9nH06IetHbqQ7hZXR6k+vL+
	 rggcc93rB7rcSvFCWLoHaSKiNPZTMVxN3DrRY+2jUm7xJBE0v9OO/DrwKBBOIRBh6fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721291;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wQeTNNr0ny3k8/wWiQeXVoNElgXTiplTi+Aj/FTcEJg=;
	b=LIWRBy9Sn3qVFe378VOo7xPqm1jtuyk0aFfKLu3TDUwOFP6Gum1wGspRvUt6cA8Y4MhC
	 wClwPMDMSykehra0p7F4k152N/KGVGsCdopmKBXoqNSgYAhJMAuCDMBP9cT2mu71E+b/h
	 AnpA587dSn8g6nS5hCNA90Wus2B8Gvaq4kJizvSHh074QdeaTJNE8UOQwVXoNEx6w/Rgp
	 yKXR7qRMk2/oxhturK8ztYArvZ8gKRmpCYodZHeyiZQ2epVDBaIEsAti2Y/wZTZpjgv7f
	 IP5TnI65tUarItGxsIFwVTIorpgXUEEJRUPQKt0wealwAd6JnlAc1p7HTS1+8puQ9hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="LQ/qLY6J";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BEF606D812;
	Tue,  3 Nov 2026 15:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LQ/qLY6J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58D591F00A1F;
	Tue,  3 Nov 2026 15:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793721291;
	bh=wQeTNNr0ny3k8/wWiQeXVoNElgXTiplTi+Aj/FTcEJg=;
	h=From:To:Cc:Subject:Date;
	b=LQ/qLY6JORtMWR2ZwTpVR8VsQCuQE8Ecro1TWg7HRojxtuQlZ0Boowb9JS3mdiOxY
	 FhaOHk8RWlH2Lx/pXVjmhLEd0h8/izz8juVJJo/vGxMICmz2LeFW3X2nHZlVUJsDuO
	 dCo84GfKeMyCeSS0hJ09o1wQ9gpB5VK79stNzSje3acAppRW/wY+Q3pPLIpQRMkklv
	 6/BAtw2+Aums7+CubehXucFqudqtuajtNatkZyRJJZP0a7vN3lgAKlpsYVgKMu11Xy
	 TJJiBg30LVDEj01eudkqwPrQbeVbNmx4wKyjEbzBNV/aeqmIxkUleD+I6Ys+NLlaxI
	 QRDvC9xmluxVg==
From: Sasha Levin <sashal@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/seccomp: print tv_sec as long long
Date: Tue,  3 Nov 2026 10:54:49 -0500
Message-ID: <20261103155449.534498-1-sashal@kernel.org>
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

On 32-bit architectures with a 64-bit time_t, such as armhf in Debian
13, tv_sec is a long long, and printing it with %lu warns:

  seccomp_benchmark.c:43:27: warning: format '%lu' expects argument of type 'long unsigned int', but argument 2 has type '__time64_t' {aka 'long long int'} [-Wformat=]

Cast it to long long and print it with %lld. While at it, print tv_nsec,
a long, with %ld instead of %lu, and cast it to long, as it is a long
long on x32.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Found with a 32-bit build of the selftests with a 64-bit time_t (gcc 16
and clang 21 with -m32 -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64);
KernelCI's 32-bit arm builds show the same warnings. The changed files
build without format warnings there now, and the x86_64 builds don't
change. The other selftests get the same kind of fix in separate
patches.

 tools/testing/selftests/seccomp/seccomp_benchmark.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_benchmark.c b/tools/testing/selftests/seccomp/seccomp_benchmark.c
index ea4068cdefd6e..5a5d7733c6f5f 100644
--- a/tools/testing/selftests/seccomp/seccomp_benchmark.c
+++ b/tools/testing/selftests/seccomp/seccomp_benchmark.c
@@ -40,9 +40,9 @@ unsigned long long timing(clockid_t clk_id, unsigned long long samples)
 	i *= 1000000000ULL;
 	i += finish.tv_nsec - start.tv_nsec;
 
-	ksft_print_msg("%lu.%09lu - %lu.%09lu = %llu (%.1fs)\n",
-		       finish.tv_sec, finish.tv_nsec,
-		       start.tv_sec, start.tv_nsec,
+	ksft_print_msg("%lld.%09ld - %lld.%09ld = %llu (%.1fs)\n",
+		       (long long)finish.tv_sec, (long)finish.tv_nsec,
+		       (long long)start.tv_sec, (long)start.tv_nsec,
 		       i, (double)i / 1000000000.0);
 
 	return i;
-- 
2.53.0

