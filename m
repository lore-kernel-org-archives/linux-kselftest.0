Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0FE33BD629;
	Thu, 20 Aug 2026 19:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787254840; cv=none; b=nnrE3p+fWrut/5xw+PgLXXwbB8VcWGfB7OZ/FN62xde9SLjwTcZtQKcTapf1BA2MQ6oElh7wylNSFtKITi8jrvMVJHQ9TBAiAwX44alD8rFufHSVP956Scbya2yCH5WYSrIhSLcxrmToYmJCCY5t8kFoax6t3FcD/TOBA9ACYi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787254840; c=relaxed/simple;
	bh=7pjEAmcXmpKnIzyuI0Xt2csvEi1hxzh7Ykp3uUVDmPM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hAiTX8KXZWLzGBypX3P9BKeNTLLrqv5+h6+kLrXLs6wiGDH0uGw2NwkXquDzXDVzSePmRIvJdn9GGJ/usqjpotkjv+JekKGgRL6+ac69fe6JzOzTu00A+qi7bwDVTnF8Ks9gatXScKtv347Y7V/+W5Zo+65Nf0hiPKEk2suJ5iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=OIs7PUjl; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OIs7PUjl"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94FBC202C;
	Thu, 20 Aug 2026 12:40:32 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFB3E3F763;
	Thu, 20 Aug 2026 12:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787254836; bh=7pjEAmcXmpKnIzyuI0Xt2csvEi1hxzh7Ykp3uUVDmPM=;
	h=From:Subject:Date:To:Cc:From;
	b=OIs7PUjlgsvSxEm+4KOPIhXSUEtqz+Dveg3IA6WSTrV09DJzBRAmSh2p2jYzEhnwi
	 ZHbtmhs10iUTaB4haVYZ/hbio7uyPa763254zj4Ui0JB3dxvFix8/Lmjh5Ue/O1sMo
	 hpc/QnbTR2C0OWNI8H9BDVZZJi2DVUgYwEFooaH4=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 0/2] kselftest: mm: fix some failure of
 split_huge_page_test
Date: Thu, 20 Aug 2026 20:40:14 +0100
Message-Id: <20260820-fix_split-v1-0-ab430c58c7cf@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAB5Yh2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDCyMD3bTMivjigpzMEt00ExNLY8vUZBOTJAsloPqColSgJNis6NjaWgB
 DAyKQWwAAAA==
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=7pjEAmcXmpKnIzyuI0Xt2csvEi1hxzh7Ykp3uUVDmPM=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqh1gwm/jKRe0lLHpiBKW9B83UVm1ikv0xur6vY
 zN6/CFlkFqJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCaodYMAAKCRBt1cPRWsUx
 M27iC/44KXI87DFCucVPVj7t0kMHHMnV1u1Ador5n0t/pcbAdBlu4sxJ4lxoytEylySpm7nFeRr
 Fe/qAcPr18DBZt530yAXyQqO/iQ9mAs66y0zhYhY+GMPaa/qvKBVjbMfkUgONkn/dz2F5DXvoiq
 Jh1gQq0TcAJkeKZpGSheCauvaGJO0PAIv7Pdzr41qvyATk9zMWxb8ndjmfM3UKMOw3H2wdJChGq
 ktET/ddQXL36nihkEwmzwUHnyGGSv/j7jnSqeaIyG35YbCb4D1TlYZi4o8P28DW4nfPA/EYxlzw
 vJp4hdRGPzmpVYhlVE76m/AKKaj4PxexIDSGovO2SBfVa1rmFJLdCk7Ikcbm4mOaC+iIt+3xKhU
 6L7nJWLeaev20itWCB0ZZK7/vWbGlxIYFgRxzp+0ijbooqaMTBQnHODW/T/0mNqryXXWOPfGf9f
 yG+bI94CnXx2g7jTJgrfXKcqcnOYyl8QKiNRWPwu8aevgxkTd+YoeoIoehEaeSmiu1IQs=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

split_huge_page_test can fail for the following reasons:

  1. During the test, khugepaged may collapse previously split pages again,
     causing intermittent failures.

  2. Since glibc commit 321e1fc73f (“malloc: Enable 2MB THP by default on AArch64”),
     glibc may call madvise(MADV_HUGEPAGE) for sufficiently large allocations
     made by memalign(). The underlying VMA may start at a different address
     from the aligned address returned by memalign(). Moreover, a subsequent
     madvise(MADV_HUGEPAGE) call does not split the VMA because it already
     has the same advice.

     This causes the test to fail because the check_huge_xxx() helpers
     incorrectly require the address returned by memalign() to match the
     VMA start address reported in /proc/self/smaps.

Address these issues by applying MADV_NOHUGEPAGE after faulting in the
huge page, preventing khugepaged from collapsing it again, and by replacing
the use of /proc/self/smaps in the check_huge_xxx() helpers with
/proc/self/pagemap and /proc/kpageflags.

This patch based on v7.2

---
Yeoreum Yun (2):
      kselftest: mm: prevent random failure of huge page split for khugepaged
      kselftest: mm: replace usage of /proc/self/smaps for check_huge_xxx() helper

 tools/testing/selftests/mm/khugepaged.c           |  26 ++---
 tools/testing/selftests/mm/split_huge_page_test.c |  17 ++-
 tools/testing/selftests/mm/vm_util.c              | 135 ++++++++++++++++++----
 tools/testing/selftests/mm/vm_util.h              |   1 +
 4 files changed, 142 insertions(+), 37 deletions(-)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260820-fix_split-f44939ec44b8

Best regards,
-- 
Sincerely,
Yeoreum Yun

