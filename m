Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29EE3357D07;
	Thu, 24 Sep 2026 05:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790226034; cv=none; b=rWiN8SXvT8Vt0sH6H9s8wm5J7TFo+JCwjsFljuNpvnjd8JfihQaChVyw/ZhTLMmVP8qsbNLctyfquUlh+Yz6Nd4JuNr2B2u595OcznE3rgq1gbFpDzINWoipKJ8r1Q0dB+61IpUC9HzTrN/dNDHPrFVVtosPhRDV8yl9Ozg9oIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790226034; c=relaxed/simple;
	bh=byGcsqmsm/N1R0xTXpl1j3TGY+DHgMvLIEITNN4nqJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F5grEns3kveURVvjAwVouKe58+QEjat7qXmq9Dt0hTPwoCcmb57oCcfWaVPT9EAMidTJcr2vkVhf5yLBKrKTCkPH+sN91qYrsXkZhYgANMM2pNI5JAbCwZ7e5ssSJni7oTsuDMcLRbf8RjEnalNDm4Y25eexgBBPVatjkvvYMUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=LuFybSna; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LuFybSna"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 986F01650;
	Wed, 23 Sep 2026 22:00:28 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6D7A93F86C;
	Wed, 23 Sep 2026 22:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790226032; bh=byGcsqmsm/N1R0xTXpl1j3TGY+DHgMvLIEITNN4nqJw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LuFybSnaBK6aX9A1irXAYXSeNMGzh4XW6ctNbILwMrWmmAnlhIn77jfPGpRYPkd7A
	 RqxBLqNFn91VSuvKtcW7w9vDPCCRho8LPF1Cqfao4evfSKjU1lUzqVLmAxCi48iGOD
	 DaAMkeqiYABjim6BmgEzJZFnhZyAjA2oYemwlcX8=
From: Sarthak Sharma <sarthak.sharma@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	John Hubbard <jhubbard@nvidia.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Park Tae-sun <ts930@dgu.ac.kr>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH RESEND 2/9] selftests/mm: mremap_test: skip test when userfaultfd is unavailable
Date: Thu, 24 Sep 2026 10:30:02 +0530
Message-ID: <20260924050009.19974-3-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924050009.19974-1-sarthak.sharma@arm.com>
References: <20260924050009.19974-1-sarthak.sharma@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The userfaultfd syscall can return ENOSYS even when __NR_userfaultfd is
defined by the architecture headers, for example when the kernel is
built without CONFIG_USERFAULTFD. The test currently skips for EPERM
when the caller lacks permission to use userfaultfd but treats
ENOSYS as a failure.

Handle ENOSYS like EPERM and skip the mremap_move_multi_invalid_vmas()
test when userfaultfd syscall is not implemented.

Fixes: 742d3663a577 ("selftests/mm: add test for invalid multi VMA operations")
Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 tools/testing/selftests/mm/mremap_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index 5532d3151ed0..a5813a5e8f5b 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -721,7 +721,7 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 	if (uffd == -1) {
 		err = errno;
 		ksft_perror("userfaultfd");
-		if (err == EPERM) {
+		if (err == EPERM || err == ENOSYS) {
 			ksft_test_result_skip("%s - missing uffd\n", test_name);
 			return;
 		}
-- 
2.53.0

