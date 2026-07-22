Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17EC23537F5;
	Wed, 22 Jul 2026 09:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784711550; cv=none; b=lKJf2zQf75pz5CHojOqnNdVn81j1BKjIB4kJfs5Z7O/0FH5tiLnuUUo1Tumf4frntI7yF6u+3LUj1hJqVzEhzvd0u3fppb2vQ7W9Jwlg2PEC0uYbvriDTGX+0ktAH39P273Bsd0dHeDaEw8Jm+g5BJDSdF962KsISi4poVbj0vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784711550; c=relaxed/simple;
	bh=aRnuFbYmxuzHtIDm1YR9dnNIB8HJZpB9ssKA4sZZP+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iZGUj8PKHdpQ1kAc8PxRwrueXFp/+uR6E2F9jZH0BGqdQMVLjGRRC1j1b8rWTA5B2ZD6X6QA6CmegOSdrOdTOv3uJA1Lt8wJOjoSnPfMif7P3lXnd7eDCKuM44mmlQMr4LZw9Hc6ra99/LXaJMbKxbru6U5s2sJREvdaU9x99sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ui42q0eq; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ui42q0eq"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9EAE01595;
	Wed, 22 Jul 2026 02:12:22 -0700 (PDT)
Received: from e142334-100.cambridge.arm.com (e142334-100.cambridge.arm.com [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9D2F83F86F;
	Wed, 22 Jul 2026 02:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784711546; bh=aRnuFbYmxuzHtIDm1YR9dnNIB8HJZpB9ssKA4sZZP+s=;
	h=From:To:Cc:Subject:Date:From;
	b=ui42q0eqh0FmzLexEzHBPekesvUyxl58Grtq0nXlWfTIRfNyBdi0nULaQUlQfvrWX
	 i2IJUqM2GEOazslVCNUNcWi+ADydnJDwYd6z7iFO4LPz8SZSMdZEFEVytW6XpMpL7K
	 ET0JO12tvo9+/+khCDkAugm9Nm7OD5D4JT1JA+5c=
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
Subject: [PATCH RESEND v1 0/5] selftests/mm: Handle unsupported and transient test conditions
Date: Wed, 22 Jul 2026 10:11:34 +0100
Message-ID: <20260722091219.61504-1-usama.anjum@arm.com>
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
selftest run completed with no failures or errors anymore. Also verified
on x86_64 to make sure they don't cause any unexpected errors.

Muhammad Usama Anjum (5):
  selftests/mm: skip COW tmpfile cases when fallocate() is unsupported
  selftests/mm: skip guard hole-punch test if MADV_REMOVE is unsupported
  selftests/mm: skip khugepaged swap tests without swap
  selftests/mm: skip page-cache hwpoison tests on NFS
  selftests/mm: retry migration failures for the full runtime

 tools/testing/selftests/mm/cow.c            |  9 ++++--
 tools/testing/selftests/mm/guard-regions.c  | 10 ++++--
 tools/testing/selftests/mm/khugepaged.c     | 34 +++++++++++++++++++++
 tools/testing/selftests/mm/memory-failure.c | 13 ++++++--
 tools/testing/selftests/mm/migration.c      | 34 +++++++++++++--------
 5 files changed, 81 insertions(+), 19 deletions(-)

-- 
2.47.3

