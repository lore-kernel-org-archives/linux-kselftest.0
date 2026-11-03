Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718155;
	b=IRpZhTQWZhx9Y0/SVfv4o6jcnL7SX4t9ghmJI7AwHiEhl3I+7XZ4zfdQd73jxxYosN0u
	 sN7miH3Rl2NkFdV3GkpGmhLlU9zpX3V6jYVyG5ikcOnU9RU8OcniKF2YFRR6pYYFWhwlG
	 CVEXqyNSFNyty4rzQPqHcjagYehfgjBIyvJ8ReOfEjGqW1ca+XafO2pXWobJktvnSAPFV
	 GhpLmHbU39x2L2VnyewbEm3NInOIb1m3ngC06J4OTiv2SVUpmd4bWr/WGE4I2h+nR0dKf
	 L0hlh/WFneTSnB9lkkYwiosBFkMDzhFQ/5dFWXXtD/c8jJmmDPehUmvqFp10nG1UPHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718155;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=U9IkzZm34rCCgwwxhYv9RGNAtGYJYLV1upi9Qm+KRR0=;
	b=A2+DMTDLJ/DaFFjl+VICUQCuXcpJONbhUTJnNvangT8y+DwybfEhJoc3jZcUzkezAmHi
	 IRbvULv6CZE4Tl1TJhqyFHH2phXYVC1hNE4381YgRzXTxhJkjvTddBvcNTYp3GuxgfXio
	 yzJ4BCMm8IyMU119ol8KAL+JjqUpamI3DPx6fSSAjui8co2QmeX0nT1a97RBAnZoZ61SQ
	 Lf85fvZT3FSCMvmeJMWuEYWEDplBOPNSIM3jorXmDu+WWSJuXz+j16Azn7zIa6BztbAg1
	 cXL5V/7+25HhBH49OqoKLMXDsaX2kW/0m2orXROrQycY0rZW1VAD+W1QRsEyiV2jC3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OyTBjdX3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AB5606B259;
	Tue,  3 Nov 2026 15:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OyTBjdX3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F9A91F000C1;
	Tue,  3 Nov 2026 15:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718154;
	bh=U9IkzZm34rCCgwwxhYv9RGNAtGYJYLV1upi9Qm+KRR0=;
	h=From:To:Cc:Subject:Date;
	b=OyTBjdX3/O/77emKUjMIfGN3cKSCmukSiTZ752wiHDG9WLvrB9qQYKO8ht4WhajoF
	 lYK8EDipEvLxf040Lpl+aK/97qdx5k8G0HT3MPO2br2dlKRCr3HiG9V/C5UR7Kzuqg
	 D3ghy58HuzNyzHDB/Pt6recTVr0vY4GmIU0cp046a3QCtUQ8nevmVCL226WfgbqAIo
	 ST+b79klpCXua6UBlbPduChw/aLJFLlzLkngz/GwVkfb/OaKr96nf1c+U7wV7TmIm3
	 AQ63gllNewgdmm508klPOH/tbrcECb3c0iNLvxnhbTXZDfrHlhK2wAchkKLa8h+izX
	 e0lT+ROJioH7A==
From: Sasha Levin <sashal@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/mm: uffd-wp-mremap: keep the THP sizes in unsigned long
Date: Tue,  3 Nov 2026 10:02:32 -0500
Message-ID: <20261103150232.291827-1-sashal@kernel.org>
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

Commit 0020a1f5ca36 ("selftests/mm: hugepage_settings: use unsigned long
in detect_hugetlb_page_size") changed the sizes of the test cases to
unsigned long, but left thpsizes and detect_thp_sizes() with size_t. On
32-bit architectures size_t is unsigned int, and gcc 14 rejects the test
cases that point at thpsizes:

  uffd-wp-mremap.c:299:26: error: initialization of 'long unsigned int *' from incompatible pointer type 'size_t *' {aka 'unsigned int *'} [-Wincompatible-pointer-types]

Use unsigned long for the THP sizes as well.

Fixes: 0020a1f5ca36 ("selftests/mm: hugepage_settings: use unsigned long in detect_hugetlb_page_size")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
KernelCI's 32-bit arm kselftest builds hit this. Built the mm selftests
with gcc 14 and gcc 16 -m32 (four errors in this file before, none
after) and natively with gcc and clang (no change). An i386 build with
clang runs and detects the THP sizes as before, up to the point where
the test needs root.

 tools/testing/selftests/mm/uffd-wp-mremap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/mm/uffd-wp-mremap.c b/tools/testing/selftests/mm/uffd-wp-mremap.c
index c48eaab8e75cf..fb5582ec5b201 100644
--- a/tools/testing/selftests/mm/uffd-wp-mremap.c
+++ b/tools/testing/selftests/mm/uffd-wp-mremap.c
@@ -15,7 +15,7 @@ static int pagemap_fd;
 static int nr_pagesizes = 1;
 static unsigned long pagesize;
 static int nr_thpsizes;
-static size_t thpsizes[20];
+static unsigned long thpsizes[20];
 static int nr_hugetlbsizes;
 static unsigned long hugetlbsizes[10];
 
@@ -30,7 +30,7 @@ static void check_uffd_wp_feature_supported(void)
 		ksft_exit_skip("uffd-wp feature not supported\n");
 }
 
-static int detect_thp_sizes(size_t sizes[], int max)
+static int detect_thp_sizes(unsigned long sizes[], int max)
 {
 	int count = 0;
 	unsigned long orders;
-- 
2.53.0

