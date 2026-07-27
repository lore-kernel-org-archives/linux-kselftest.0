Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785542571A9;
	Mon, 27 Jul 2026 09:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145969; cv=none; b=ScTDn6VyH2wG5OlWVVX1/0z1tNudEXz/YPaajLIbX1XzfED1qLxVqHHyu/g43ibnUHAe0VlY1LmCFGD0UvWaY856MKfv8G1D5ebs9ybDLpJLT4YFTgr+X7N54iGrSUENCS8HY/z0gGp903y8RTh83elmxqLzqoT2FOmyMmNF/q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145969; c=relaxed/simple;
	bh=C0BIX6coAkVc1uXEiywKFdG6o8NwwBAoxC8vLg0e0Ns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BeLQPB2u0MpMKByM4TIpzs7cjEvxTs4bvZrRuUIqv+rkU4uTLxEd19byYU01y1W6KEwFsD6Fh8WDziqXat8y37Sp4iHfLKaBnoshmiO435ZNFVfj6c4a6AdAE1cbUWxgeTrSsDVbVqBVT/VIMSY02iPQzZxctk+QKOJAd0x3VdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MP4/mRzI; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MP4/mRzI"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A2667143D;
	Mon, 27 Jul 2026 02:52:35 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 601093F66F;
	Mon, 27 Jul 2026 02:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785145959; bh=C0BIX6coAkVc1uXEiywKFdG6o8NwwBAoxC8vLg0e0Ns=;
	h=From:To:Cc:Subject:Date:From;
	b=MP4/mRzIVDzqhcPA9FV2KqfSsS/V5hQE0l5uBnGbdhUHaHAR0psLWqpS9+sGGakUu
	 s/MICmfU1ayOoSsKWr3wNWsfhj0TEtDPLOS7dasqY13XMoPO3niMLFbX0NCCeN1Jdd
	 DfOhzoHVkNc7jfzKWberw8n7399DFZydITK6rjqs=
From: Muhammad Usama Anjum <usama.anjum@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: [PATCH v3 0/5] selftests/mm: Handle unsupported and transient test conditions
Date: Mon, 27 Jul 2026 10:52:16 +0100
Message-ID: <20260727095225.372655-1-usama.anjum@arm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several MM selftests report failures when the test environment lacks
an underlying prerequisite, such as fallocate() support, MADV_REMOVE,
local page-cache semantics, or swap.

This series converts those unsupported cases to SKIP while preserving
failures for unexpected errors. It also allows migration tests to retry
transient move_pages() failures.

Tested on an arm64 Ampere system using an NFS root filesystem. The MM
selftest run completed without failures or errors. Also verified on
x86_64 to ensure the changes do not cause unexpected errors.

Changes since v2:
- Explain why the hard dirty-page variant is skipped on NFS.
- Return -2 when the page is not on the target node.

Changes since v1:
- Print swapout diagnostics before reporting no-swap skips.
- Limit the NFS skip to the hard dirty-page variant.
- Retry per-page failures for the full runtime.
- Verify that both alternating NUMA targets are reached.

Muhammad Usama Anjum (5):
  selftests/mm: skip COW tmpfile cases when fallocate() is unsupported
  selftests/mm: skip guard hole-punch test if MADV_REMOVE is unsupported
  selftests/mm: skip khugepaged swap tests without swap
  selftests/mm: skip hard dirty page-cache test on NFS
  selftests/mm: retry migration failures for the full runtime

 tools/testing/selftests/mm/cow.c            |  9 +++--
 tools/testing/selftests/mm/guard-regions.c  | 10 ++++--
 tools/testing/selftests/mm/khugepaged.c     | 38 +++++++++++++++++++--
 tools/testing/selftests/mm/memory-failure.c | 14 ++++++--
 tools/testing/selftests/mm/migration.c      | 37 +++++++++++---------
 5 files changed, 82 insertions(+), 26 deletions(-)

-- 
2.47.3

