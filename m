Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7288341D228;
	Fri, 24 Jul 2026 10:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888700; cv=none; b=cwqWMmuECHH5+MVlC4s55WPY5hH08xeXO/WHTxmhvCp5H9XyKL5dz1Ka1M6gEnloEDktlw4rLNWDwsZFxmzxU61mVPkv+HGwGl8irRxs3pmOYCyLTmTjqACV7z+wvhvKhDPvu87zbfDWMqgSKZUHqvimHwn7GqeS6uMf1oY9d0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888700; c=relaxed/simple;
	bh=TiypPVrcuP/pwFCPSKURegHGQntIz51gQCB9AOGPsRY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mzw357INN/xaC14Eo6GPAgH4OYlBS4oQVAUmyzemAlWZkcQ/rxoVtxErziKxW4XKJpcGdNgDqhjK6SNdrt4YUZEVDIL1PTCWR3m9eT7c9UFPjCLTZf11mCHcsDP4ngRadjiKv0tm5fD94lPUHPDiN5dVd3RUW3daHDXCTL1PJgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Fm6VI5NF; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Fm6VI5NF"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A69A51477;
	Fri, 24 Jul 2026 03:24:51 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 329463F66F;
	Fri, 24 Jul 2026 03:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784888695; bh=TiypPVrcuP/pwFCPSKURegHGQntIz51gQCB9AOGPsRY=;
	h=From:To:Cc:Subject:Date:From;
	b=Fm6VI5NFP3hH30OMlcrm9JLiH1m7DtK/3m9a50rIMS5tZBpPguluNw5NwlhAKNsti
	 uFtvXWbCIrAY8UX4HAZERbBFsbi+cHkJwHTSDSakIJZl74jCoXcOH9ZyyeAHq2QCP/
	 Rdh4XIVKDJjUwHV3I6PuoSzp6M/rxxaIjgiADU9w=
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
	linux-kernel@vger.kernel.org,
	sarthak.sharma@arm.com
Cc: Muhammad Usama Anjum <usama.anjum@arm.com>
Subject: [PATCH v2 0/5] selftests/mm: Handle unsupported and transient test conditions
Date: Fri, 24 Jul 2026 11:24:23 +0100
Message-ID: <20260724102431.1199519-1-usama.anjum@arm.com>
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
 tools/testing/selftests/mm/khugepaged.c     | 38 ++++++++++++++++++--
 tools/testing/selftests/mm/memory-failure.c |  9 +++--
 tools/testing/selftests/mm/migration.c      | 39 +++++++++++----------
 5 files changed, 78 insertions(+), 27 deletions(-)

-- 
2.47.3

