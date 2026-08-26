Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34DB641A914;
	Wed, 26 Aug 2026 12:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747108; cv=none; b=LHXoXKlBI7sa26ZxMfKQsHrxbvGajkC3rHeh/m7Qtyp7pWJLFcIXhK10sE60L3QtJUKor5rTc9aXpu5u+5dco0b3D3hooqKkqtlh9xJNe5MUm6eh/Jm6bph8uTKd1FZAieSh9lO2bayy90pDLhorBVxSZzDnIRm4QZd8deR38FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747108; c=relaxed/simple;
	bh=+m47CDGBLu+2KKry0pk847eP8rBPBT/djc8BljXHXXc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Vj/JJ6XYPMHg9E6NTFLPlo3Kz7vAiX7wp3pDFZqkNvJsrRrkXiGHfGXJhd5b9hucU4Q3Ejyl9w6tJgacuIRqojPFlyOYh1MbM+CA1sPLVFOaQRheN82UZG55i/ViicYzB6X1IPE8fwlqlavyRF7C0KvKsSxd349kPmoyXIw99aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=H1AKHO99; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="H1AKHO99"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 103D41576;
	Wed, 26 Aug 2026 05:25:00 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E21123F7D8;
	Wed, 26 Aug 2026 05:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787747103; bh=+m47CDGBLu+2KKry0pk847eP8rBPBT/djc8BljXHXXc=;
	h=From:Subject:Date:To:Cc:From;
	b=H1AKHO99jtLD2bOmZ5RyglZq5nbqOYTkUKkzgdFaYn3ohXgA64O7oLuBkluVJgWzj
	 PgFhPKpCYsDvjAvDEuCpL8SwDam6INmNFDopQ3neQ2Kkagbh3BbmBUyP8nPj/qB8Tl
	 39UAVvLzQxlmqUEgwD7Soi7bhHF3nFJQp5kJqic4=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v2 0/2] kselftest: mm: fix some failure of
 split_huge_page_test
Date: Wed, 26 Aug 2026 13:24:38 +0100
Message-Id: <20260826-fix_split-v2-0-71153c7f579a@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAbbjmoC/22MQQ6CMBBFr0JmbU0pVQsr72GIKeNUJhFKWtJoS
 O9uZe3y/f/yNogUmCJ01QaBEkf2cwF1qABHOz9J8KMwKKnO0igpHL/vcXnxKpzWbdMSaj0YKP4
 SqJx769YXHjmuPnz2dKp/679KqoUUdtCNxJPBC7qrDdMR/QR9zvkLzeH07aAAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1965; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=+m47CDGBLu+2KKry0pk847eP8rBPBT/djc8BljXHXXc=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqjtsbvrNCvj4po7sJrnN7TSfCTIQVoy1AQhX+2
 NKWHsYjt8uJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCao7bGwAKCRBt1cPRWsUx
 M+T4DADC0+md4koOHJPRiqUozSeGzQ4ENUdfN4dbVq+ldDlUffw8Fv/oYwph24FW/hJqA4qcCxt
 RTVIf9PqIjHGWEkD/hfzjT4PuS8oUL4FzlzeYN+9qhWxXOBbUZzO5LNzxpzHE9y/xkIYLzP3iNF
 YEY0KE2YnNBPGGEqbmzF50YKjdbb7/5Ai8ytW9zBQtBFX2M2tCWN1we1dIy09ZYjy6vHUo/Vw00
 cuSUalRsW8OY+toor32GvdjcSQX2Ki+8Ld3/Q+YG+uA9wyedY7SslfvjwhogNpYl4gfdEltJxE9
 /lBGLuoYWUXXAGR8dJe4ALH9h55Pyx8NqYwWamNDyhgCMGDy0d2dvsIf2I3vOX69zFho+RTK4Hr
 +jLWA1SFMp7/QeIwkRL9g7MzT9gpO+n7PtjywTbs9DY6GqdVaFXvb4DV+CIzOtuI/mYGjMOgAde
 W1vBkXWcBpvAGSF+DNwRXyU/+sQ/lezOqofApHi5IGNs7IV2bDi3vgBmHw7a0JOKqAg4k=
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

This patch based on mm-unstable

---
Changes in v2:
  - rebase to mm-unstable.
  - add message in case of failure of madvise() with MADV_NOHUGEPAGE.
  - fix wrong setup expected_huge in check_huge_shmem().
  - Link to v1: https://lore.kernel.org/r/20260820-fix_split-v1-0-ab430c58c7cf@arm.com

---
Yeoreum Yun (2):
      kselftest: mm: prevent random failure of huge page split for khugepaged
      kselftest: mm: replace usage of /proc/self/smaps for check_huge_xxx() helper

 tools/testing/selftests/mm/split_huge_page_test.c |  15 +++
 tools/testing/selftests/mm/vm_util.c              | 130 +++++++++++++---------
 tools/testing/selftests/mm/vm_util.h              |   1 +
 3 files changed, 92 insertions(+), 54 deletions(-)
---
base-commit: 169393fff5d1ec2690934067eeb95544ff5ebdd7
change-id: 20260820-fix_split-f44939ec44b8

Best regards,
-- 
Sincerely,
Yeoreum Yun

