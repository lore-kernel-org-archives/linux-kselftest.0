Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793847766;
	b=KzIU5md4S/BZl8RIk1U6LgLFJTcjmvXPmSKP2PasnXSbjeSCffX/xeSYT4cDUdnksGTn
	 m7t3Ce1PUiE/hf6NoWKdhxkCmi1hPPkGyCEhoD7WGZMLHfYtPM4eDeYCwLXwytwy7WYee
	 Cr4kYc6TOg/nG8a+O0qd7jDmV9dlUynn1/WApVJApqlNLysIVp1gpZsVtZ84xlV+QAI/x
	 IaDkkHiFjXGiswx8YtLLbeHbYo4ElHk10o/xOETAYXDylD22jIOp/OBbNtPZx5PGTdPwH
	 txbg/MsnCYFBund56suyeIVjl95HaopPIRSnIt7c3q/q7TqjUQhgln/HD0zczCQGYFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793847766;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zGZfT70XyONJWUn47AyDJ+cOnVzmjtxiZaxG/uXFuOA=;
	b=KZIzzpB5WmNROLqA/gUIq5jQE+/agkdUuXEuaHuvnW2Q0XWs2HGdEvfaFWseacAacfYc
	 QtqDTOpizOmbvXzOe24/z7ojRvoYJ4fpLzclT1ZszUNFgXT84g/i1lMgsWSuxGuzbdWxA
	 DA1dd9OyZd/Xy8TFx8t3Sx0O3uighk6yxjsqlMKMjtT6V+VDgqMA6iDecPyQdP08B3X3J
	 82xupFOiDpMHtFIV7jXsD0KnrXOn8Uwlq2DSBF+/bLiBGFVw6ZMCSI7Zdx0rSSj9OKt35
	 0ZHVp+38Ir2LxIcHYmaMgEZ3QBWxmwgNP82kyewvMFb3zbWzWRMxNrM5vqNoRo5A/Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZRQbI+t8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC767606A328;
	Thu,  5 Nov 2026 03:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZRQbI+t8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E8B1F000C1;
	Thu,  5 Nov 2026 03:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793847765;
	bh=zGZfT70XyONJWUn47AyDJ+cOnVzmjtxiZaxG/uXFuOA=;
	h=From:To:Cc:Subject:Date;
	b=ZRQbI+t817mQXZkNttd+gHuqAA44iJMUXeDiQIUSXTrPFP/K3YlmPF8OMp6wcehz7
	 ep2l76pxw6rI5FPtzNemsq9Zt8Hvxmlyc/AzpjxVhZd1LZPQFBHkHxxBrF2j49WNCu
	 chDRbIiobEPaUNLWEW2Cmiqj9CtGnquQ5XqSCMUjkVXLQrk5Ti5HFaeBssFD5eneWt
	 z14re8NUk/JAaGvdNg3DWwS3abUODHWy0aAKWNxIeRRGh6dv+a/T6LqWlLEwXQvHVl
	 kbK340AdP6KM/rcyPE46Pbj3IYRNHz0RZ5Mvi30G0+W9t3pWd1V976WurCIiLdIquF
	 LtgHowtaWKWRQ==
From: Sasha Levin <sashal@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Kiryl Shutsemau <kas@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/mm: skip split_huge_page_test without the split_huge_pages file
Date: Wed,  4 Nov 2026 22:02:42 -0500
Message-ID: <20261105030242.1241448-1-sashal@kernel.org>
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

Every case in split_huge_page_test goes through
/sys/kernel/debug/split_huge_pages. When that file does not exist,
because debugfs is not mounted or the kernel has no CONFIG_DEBUG_FS, the
first write bails out of the whole test and it is reported as a failure:

  Bail out! write_file(/sys/kernel/debug/split_huge_pages): No such file or directory

Skip the test in that case.

Fixes: fa6c02315f74 ("mm: huge_memory: a new debugfs interface for splitting THP tests")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Found with KernelCI's NVIDIA lab, which runs the tests in a chroot
without debugfs. Tested on an AMD EPYC 9655P with KernelCI's x86_64
build of next-20261104: without debugfs the test now skips, and with
debugfs mounted it still passes all 62 cases.

 tools/testing/selftests/mm/split_huge_page_test.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/mm/split_huge_page_test.c b/tools/testing/selftests/mm/split_huge_page_test.c
index 33a2473327bb7..deabb7db06192 100644
--- a/tools/testing/selftests/mm/split_huge_page_test.c
+++ b/tools/testing/selftests/mm/split_huge_page_test.c
@@ -610,6 +610,9 @@ int main(int argc, char **argv)
 	if (!thp_is_enabled())
 		ksft_exit_skip("Transparent Hugepages not available\n");
 
+	if (access(SPLIT_DEBUGFS, W_OK))
+		ksft_exit_skip("%s: %s\n", SPLIT_DEBUGFS, strerror(errno));
+
 	if (argc > 1)
 		optional_xfs_path = argv[1];
 
-- 
2.53.0

