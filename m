Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E4F560AA6;
	Wed, 23 Sep 2026 15:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177406; cv=none; b=Jp/V3q4KGek1cnrRfUn+giN4Wf3QXCGgiPwb3xKNzR1JDG72g056xJjE8/TkzLx8ClcWk/R3AgrDmSFpUjoU2PDa2ePkN+ioV+9mK/mdhIsGaV+uoYELobtyMKmRyMIq2ZqanT5eCfa9QHjOuRV1b7B1uptBRojDXeoVR7hAwkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177406; c=relaxed/simple;
	bh=bweJ08cI1wxdWcAWpqQUT1byxmSO3PWzKNswFgARuKM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=e9ZEwz5soWBIMrj4JLLO9u7Md/cZ/Tjgr3wVxFbrN8twA2Rm3fsgC3pyVYCfbG83dt5TRnvpXNYl8oWHMwSvG11XvpLBJpqUlHjGcXW/7wiBQ7fbFlLlXffoqAO3eVXkv3Xd5TgfZtofAKymyTsdYQ1Qe4FdDQjPdTVUVwfdA2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=AfsLGFjr; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AfsLGFjr"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B905F1570;
	Wed, 23 Sep 2026 08:29:54 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A0863F86F;
	Wed, 23 Sep 2026 08:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790177398; bh=bweJ08cI1wxdWcAWpqQUT1byxmSO3PWzKNswFgARuKM=;
	h=From:Subject:Date:To:Cc:From;
	b=AfsLGFjr9cSIlAfAIMfUc+9MJWm2/Ef0ef1X4C/kNVuAvMMJ1vEQglVmtpK6yXljA
	 kvMxGTuy2JI7Y46CExkGjM0wTXnvQMXo1BdDwijyzF4kwdh+BBd4HyrlKIvOVlaorZ
	 048/CMADAO1WF8lx4Gr/+jm0ZyJioNWVqVRtIN6E=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v3 0/2] kselftest: mm: fix intermittent failure khugepaged
 test
Date: Wed, 23 Sep 2026 16:29:50 +0100
Message-Id: <20260923-fix_khugepagd_fail-v3-0-b387e92fe1a9@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG/ws2oC/x2MWwqAIBAArxL7nWAr2eMqESK52lJUKEUQ3T3pc
 2BmHkgUmRL0xQORLk68bxlUWcA02y2QYJcZUKKWHSrh+TbLfAY6bHDGW15F1aDS6OvWVQ3k8Ii
 UrX86jO/7ARHQjxtkAAAA
To: Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>, 
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
 Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3121; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=bweJ08cI1wxdWcAWpqQUT1byxmSO3PWzKNswFgARuKM=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqs/BxkwlkaZg1jFRE9j9tMvyCcftG7cu/ywr9T
 AE1rxBtk0uJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarPwcQAKCRBt1cPRWsUx
 M67fC/9xYpqodOUkH1uLZ32IFXS3OPOOhVDYcdB02dRNRXhpojFIS5M7G+4C+MoLpVQeIMjNZgo
 Y/h7iMze3lbooJQYhZqEchwZUsl3+FqXA3hTObs3eQxB+cfEJJmJqyKcuE+8o6elnKegAscWB7Z
 zvLvZoQdlfvbTzxZG2M2gWixMZH2/Jy4F3cQbocc8T1rtjjyLWAo1l7WWqy7sBcU+zmRXriV+eF
 kQzCWw7eaXWKMGHIZ6jOmxPFaTwcTL4FmboU+cBY3AQr/4SxSWa5jhLmZKWSLFm61aZsofOmV6k
 lS5hyCXc9WXEFyTwQO8IulIWkr5Fp0qBesJy89iXX8gunMFRb4JLzgx27KIr6U8JpdGCE3+U/II
 BIX3M6ACwK3ZZVZ3ejAFLATj8uV/qZ+Bs7oVzboWYqTAX7cbiVj91XRaicrtUXwrZQmVeJKGK2U
 clppKr2wVkTN+xekeW5wqpdC9gJPdgg22tIoiY2jYF2bt9WxcLXusgEm5P4SPSVXQYu1k=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

There are intermittent failures in collapse_max_ptes_swap() and
collapse_max_ptes_shared() when using the khugepaged_context:

  # Run test: collapse_max_ptes_shared (khugepaged:anon)
  # Allocate huge page... OK
  # Share huge page over fork()... OK
  # Trigger CoW on page 1023 of 2048... OK
  # Maybe collapse with max_ptes_shared exceeded.... OK
  # Trigger CoW on page 1024 of 2048... Fail
  Bail out! Unexpected huge page
  # Planned tests != run tests (26 != 23)
  # Totals: pass:23 fail:0 xfail:0 xpass:0 skip:0 error:0

  # Run test: collapse_max_ptes_swap (khugepaged:anon)
  # Swapout 257 of 2048 pages... OK
  # Maybe collapse with max_ptes_swap exceeded.... OK
  # Swapout 256 of 2048 pages... OK
  Bail out! Unexpected huge page
  # Planned tests != run tests (26 != 17)
  # Totals: pass:17 fail:0 xfail:0 xpass:0 skip:0 error:0

This happens because khugepaged may collapse the pages before wait_for_scan()
is called, causing a sanity check that expects uncollapsed pages to fail.

For example, in collapse_max_ptes_swap(), after faulting the pages back in
and paging out up to max_ptes_swap pages, khugepaged may collapse them again
before c->collapse() is called.

To prevent this, mark the VMA with MADV_NOHUGEPAGE after it has been
collapsed by wait_for_scan() for anon. This prevents khugepaged from
collapsing it again before c->collapse() is called.

Also, fix false-positive results when a child process fails in tests
such as collapse_fork*() or collapse_max_ptes_shared():

  # -------------------------
  # running ./khugepaged -s 2
  # -------------------------
  #
  # Run test: collapse_max_ptes_shared (khugepaged:anon)
  # Allocate huge page... OK
  # Share huge page over fork()... OK
  # Trigger CoW on page 1023 of 2048... OK
  # Maybe collapse with max_ptes_shared exceeded.... OK
  # Trigger CoW on page 1024 of 2048... Fail
  Bail out! Unexpected huge page
  # Planned tests != run tests (26 != 23)
  # Totals: pass:23 fail:0 xfail:0 xpass:0 skip:0 error:0  // child failed.
  # Check if parent still has huge page... OK              // parent hpage success
  ok 24 collapse_max_ptes_shared                           // considered as success
  ...
  # Totals: pass:26 fail:0 xfail:0 xpass:0 skip:0 error:0

This failure was observed on NVIDIA Spark with 16KB page.

---
Changes in v3:
- using is_anon() instead of comparing name of mem_ops
- add r-b tag.
- Link to v2: https://lore.kernel.org/all/20260921-fix_khugepagd_fail-v2-0-3c2877beef61@arm.com/

Changes in v2:
- remove temporary enabled setup.
- Link to v1: https://lore.kernel.org/r/20260915-fix_khugepagd_fail-v1-0-bb6f04c8759f@arm.com

---
Yeoreum Yun (2):
      kselftest: mm: return fail when child test result is fail in khugepaged
      kselftest: mm: fix intermittent failure khugepaged test

 tools/testing/selftests/mm/khugepaged.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)
---
base-commit: 685086170033a6ab334f0068cd25dae90fd1bb4e
change-id: 20260923-fix_khugepagd_fail-172362f58d17

Best regards,
-- 
Sincerely,
Yeoreum Yun

