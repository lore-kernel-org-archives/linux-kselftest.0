Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B651B87C0;
	Thu, 17 Sep 2026 11:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644021; cv=none; b=Ifi1Q6CYruiZxuq1iJwBnjdsyC89R1f9fHXMlplfc/k/bSgKmrYk2V7eNFboPP83R2jQcxTDCmcvWbcuu8x3N8iJUQ5i2Qs2DVUJYmADyA0GuN3cf60v9b3AOumSlaOGIvWDDRIiD4O4M5Gkys6jKwZAw9PpwjOtoPfj475TIss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644021; c=relaxed/simple;
	bh=byGcsqmsm/N1R0xTXpl1j3TGY+DHgMvLIEITNN4nqJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=an7RXxXEiojL+TwlTM7uOYk49Zfsa343ArxSqD8pKoAiaMtQ6WXYZBSL4Ebe+cXH2enFCt/k+Uvk3rxAWFM86ZRQI2hiod7BPA1cjfyrQaO1gSbwcv+KqrDiEeueZ9IRwDJGt6TQbFGYo6npgrFrcGbtW4CuiA/S9p34dIspg0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=vLyp94ye; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="vLyp94ye"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65F831476;
	Thu, 17 Sep 2026 04:20:10 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A50083F7B4;
	Thu, 17 Sep 2026 04:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789644014; bh=byGcsqmsm/N1R0xTXpl1j3TGY+DHgMvLIEITNN4nqJw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vLyp94yeeWRiax05Jl2DCRO+aVPo4bXcyooHB/YmYsA1x71FVXfir4KWrbWqcHtGl
	 69pX8o/9GAKgj5jbZTYX85Q0ef1OkoFgALL65zR6hMtAdE5/fxi3NpB7iRE501hvTc
	 75WW2W5b6BMau6Fr0QYukjfhClAdHkyTt/xhoDf4=
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
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: [PATCH 2/9] selftests/mm: mremap_test: skip test when userfaultfd is unavailable
Date: Thu, 17 Sep 2026 16:49:44 +0530
Message-ID: <20260917111951.188266-3-sarthak.sharma@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917111951.188266-1-sarthak.sharma@arm.com>
References: <20260917111951.188266-1-sarthak.sharma@arm.com>
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

