Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A29839DBCB;
	Thu, 24 Sep 2026 05:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790226049; cv=none; b=ZedzdQfwefiVJfaW2TVK736Q0dyWry2wO+GESXNSN7M9fHzDyHLjFFYv12jfxAaRnD3tt73nvdSXlTFGjZTaMew0SvtJiZSOxY62iWBPsyg5FuNq3nTv4/+jEs4d22RM4RF0bS4tAf2TNq0wQSrZZcCKNwiHcFN1UmyIxkGJy7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790226049; c=relaxed/simple;
	bh=EBDy9kiw0ETUnAFTA1nwc+a5WpGr3AW/5ybohYQb77I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fD1sC6DybzzOYXIBz6hcZ4+SgWdd079C0KyG7L0MTvn0I/ya6J+dGuzPXEy9TTMpf/mENyz9fg+BsojwjKo1V3IjQJjPm2Q5EYkeGA2B6Dd0U96BN023GL71YJ245tpLH/MtKgqxgYBvATww7ilnEfbFvDLSsObc06IboUVbW0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Map4q1no; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Map4q1no"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2C251476;
	Wed, 23 Sep 2026 22:00:43 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C034F3F86C;
	Wed, 23 Sep 2026 22:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790226047; bh=EBDy9kiw0ETUnAFTA1nwc+a5WpGr3AW/5ybohYQb77I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Map4q1noY0JZiQg7ztyHbCyb1VVRiWXb3iObj+Jv7GRIRqudDYzFyY2KII51sgmAN
	 g20uQxA6AwB+YZCD7D4HOIdsj6OvV644C5IpYIiFpG/hL+j2xeq7Vz08nqaRVACKUT
	 jkSnuOUmBJZa7Jsf5TZV91aoPhsVSa3FjiH3X5FA=
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
Subject: [PATCH RESEND 5/9] selftests/mm: mremap_test: fail on data corruption
Date: Thu, 24 Sep 2026 10:30:05 +0530
Message-ID: <20260924050009.19974-6-sarthak.sharma@arm.com>
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

In mremap_move_multiple_vmas_split(), if data is corrupted
after mremap, the control jumps to cleanup without marking
the test as failed.

Set success to false before moving to cleanup.

Fixes: 7d6597dfef11 ("tools/testing/selftests: explicitly test split multi VMA mremap move")
Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
---
 tools/testing/selftests/mm/mremap_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index 869df22d46db..3b42c4f2473c 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -691,6 +691,7 @@ static void mremap_move_multiple_vmas_split(unsigned int pattern_seed,
 			if (chr != buf[j]) {
 				ksft_print_msg("page %d offset %d corrupted, expected %d got %d\n",
 					       i, j, chr, buf[j]);
+				success = false;
 				goto out_unmap;
 			}
 		}
-- 
2.53.0

