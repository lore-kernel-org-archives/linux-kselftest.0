Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6800C4CA790;
	Thu, 17 Sep 2026 11:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644040; cv=none; b=jFkOEc6t9EPOEVCOmdfFqZx33tULzaY2/e0642bI+UK6iAh5RfZ3d3emXG+XkQX0XMS8KFIqDtnasoJ5e/hasYOfbpNYCMz5h0X2/V+eQbf+HK8AlFEs0jfCgW7Cz1eYniNVcxMVNwyIgXBgX9nr5uxFUCQLU9j8qxcUH6ugyRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644040; c=relaxed/simple;
	bh=EBDy9kiw0ETUnAFTA1nwc+a5WpGr3AW/5ybohYQb77I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L1BmKTRG9Xaw0BvZef+aEkFOd2jKcMyDKgHoldsX4FmQVaAlgsV0rh7QHI3t7UXs9P+rYYU2/yGGjgZOnnqF/U6Edi3G88X/g2Q9UtMxsqtz1kodXfOerrYg+YzxGUgU0INWasbd1rDafllWnjDYUxrdz91ZQGLXV8iSIsDzRb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=abJKCI3W; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="abJKCI3W"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0270E1F91;
	Thu, 17 Sep 2026 04:20:25 -0700 (PDT)
Received: from a081061.blr.arm.com (a081061.arm.com [10.164.19.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4426B3F7B4;
	Thu, 17 Sep 2026 04:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789644028; bh=EBDy9kiw0ETUnAFTA1nwc+a5WpGr3AW/5ybohYQb77I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=abJKCI3W5ejqlA1/+Qn5Ky+QWyIO8EvU9TG6NyAWFrVO8SDaurv5n3BuV+0KUhHcR
	 nNjB5ezosZX0vlC9s0hkk27ZqylVrtNdTrcCcPsCb1Jq3MjiwZc3DFRavlFLFaz0Pv
	 OYi7aLb9rvvjhEDVgmX7PXzqpKxlj+3nHy0vi7Jg=
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
Subject: [PATCH 5/9] selftests/mm: mremap_test: fail on data corruption
Date: Thu, 17 Sep 2026 16:49:47 +0530
Message-ID: <20260917111951.188266-6-sarthak.sharma@arm.com>
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

