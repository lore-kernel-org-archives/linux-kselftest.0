Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6D151122C;
	Tue, 29 Sep 2026 10:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790678046; cv=none; b=ekXsKPXLivJhRahHyjy0Qg9KUvf+IejGWUJ/jBftR6Ebgb+khbMWdboo1jM0bmGBU0glPB9o5xH2lgJUrDppsx3067fUhnLWLLj67CJxHfkhi7UbkxJ53u2jo2a0rvlOfbDt76N+lIQ7HN8+bmf74LMJFxbsi/YzaoZ8kQXwMLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790678046; c=relaxed/simple;
	bh=mkwLp2NfxwMWmC70wWGt04V85mSXhHKHK1Y+m2eeVRM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IDRX72aoXJ3uQyyw0CYY/cKfVlf7IIaHDS+mJSDiZKq0B/oHhUMZ9FzuXOOYyKSdODQFZ4hvRtuqgQ4kecBVaq0x+l1fRjabPDW3Ztl5d5pPDv6LTb5XXNv94p0pviqCYjEKp7cXOMniQ9TWU66DnkDZABKwU9korLVixFkQomc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=tlFw+y61; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="tlFw+y61"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1227C1655;
	Tue, 29 Sep 2026 03:33:51 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5005B3F86F;
	Tue, 29 Sep 2026 03:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790678034; bh=mkwLp2NfxwMWmC70wWGt04V85mSXhHKHK1Y+m2eeVRM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tlFw+y61iB5s+8IQHPmtgcMO8cXR2JAbgxLSD9hLvzBRQXXZBcRz9YkolBxDPjOGd
	 0iFF1XAHLk1/0VgkIRn78mzYrs3FzsAtShaUk6DIPTLGBjai5V3W3KvaF2O5jcwo8B
	 vz6Lmkpo3yBJczPUAWsn/ehsppwqxfCqxKx4rUJk=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Tue, 29 Sep 2026 11:33:19 +0100
Subject: [PATCH v4 2/2] kselftest: mm: fix intermittent failure khugepaged
 test
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-fix_khugepagd_fail-v4-2-2169c18f2576@arm.com>
References: <20260929-fix_khugepagd_fail-v4-0-2169c18f2576@arm.com>
In-Reply-To: <20260929-fix_khugepagd_fail-v4-0-2169c18f2576@arm.com>
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
 "Gregory Price (Meta)" <gourry@gourry.net>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2567; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=mkwLp2NfxwMWmC70wWGt04V85mSXhHKHK1Y+m2eeVRM=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqu5QHwdcomYjcL3H3i/yKEaWu0SMT6mIQm9r75
 H1OgyULYUKJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCaruUBwAKCRBt1cPRWsUx
 MwiPDADadp7fe4eoEUnDXlsYxQ1/AtQhQDRC5ZGZJYNjHhvwQdp6NJs/6vXIfbzBhHzJRAHf9Ae
 Xdlk3gmJBZPy0WloFUm+2v8qJ1r9F91z2TgbA9mE+g5u9fYvM8DTz8G0UXVszhkF8FGGYtiPKvq
 th1Pl+kaDMrOnW+4kqipK8mikudxXEpKhFBW0OJt5uq86ZuS0q3WUhE+9yUMm823jteeFAh/nwx
 eFe1cyXYgVL4AbR4j9yx/4yM5+YGKe28OI6g5718xntqO/2QAUpYF0vast/BBV8iyUF/5GpZ5aR
 FwT82graQE8bq3bFbrARYwC1FvHr+N1+UCDXcgB67zGx+N02kQdJ5NVxpft6Ro14IwVi1uJb+AL
 uMwSaikb4bZAVuANRcWRJfd9DVIKZqw+4muff4BGWTC2NSRJbnIAfikPEqT6tQeEdIHqC7AgriF
 eiSe3+x9ZLuwfFPow8wxf1x+ewzHbZ+1JA/bjqjqpN80QSHaCKlGqO09p4dfjY3K4tcRY=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133

There are intermittent failures in collapse_max_ptes_swap() and
collapse_max_ptes_shared() when using the khugepaged_context:

  // while running ./khugepaged -s 2

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

This failure was observed on NVIDIA Spark with 16KB page.

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/mm/khugepaged.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 2aa7c9197158..4e888b7bf310 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -618,6 +618,16 @@ static bool wait_for_scan(const char *msg, char *p, size_t len,
 		usleep(TICK);
 	}
 
+	/*
+	 * The file and shmem tests rely on refaults to install PMD mappings
+	 * after collapse. MADV_NOHUGEPAGE would prevent those mappings.
+	 *
+	 * Apply MADV_NOHUGEPAGE only to anonymous VMAs to prevent khugepaged
+	 * from unexpectedly collapsing pages during the test.
+	 */
+	if (is_anon(ops))
+		madvise(p, len, MADV_NOHUGEPAGE);
+
 	return timeout == -1;
 }
 

-- 
2.43.0

