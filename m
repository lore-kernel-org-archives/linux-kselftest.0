Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F6E8530E06;
	Wed, 23 Sep 2026 15:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177413; cv=none; b=qVvLS8SxjeoA6hhQ/fjm0E/BeYvuXaXxUgsdInzJtZyQyZQ+d5iYhPadP8h3qgvzYEgr0cVwcMlk34a7O1Tp9G7hnAAyR5RQvHbgOhdhQCXFhOwtio0CjzBobC9ljpcYIMJe7ZLZkwj9qETXivyNjnR+ls3jfpmfmb1lRYQel4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177413; c=relaxed/simple;
	bh=ooA7gnlKxc89gO2WIVt8hrp3HEKHzLvwfAey+X1/t9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jzVwGBwAYZ7JnKrjcSKkoG/ZVT/J9yUjdasykvR3HaJl0V4A+UdIkKrUw3BK77m9ZuhuQxyB9hRjfhoSp9H+xR2D3t4vp57BunIONIvqVL0hSwMViXP/KkT4ciKicnL1kL9+Cx31LPilap9VZUkH7uKyP+1Ln5UGEgWulAz/nHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hw7PCCi5; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hw7PCCi5"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7073D1713;
	Wed, 23 Sep 2026 08:30:01 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E96CD3F86F;
	Wed, 23 Sep 2026 08:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790177405; bh=ooA7gnlKxc89gO2WIVt8hrp3HEKHzLvwfAey+X1/t9M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hw7PCCi5jHR812P5EOIWZclw4ZxjUSX7JLRYhLtXpc4HxN+39wQ2emq3aKdgcXiCz
	 OT6hV4qavToaDNJ+zoSQwVL6ajNpche0PPLo29kcABl2/fOrzs1rVcHWiW5AteDIrh
	 2i/Ce240ZJuWHuYQ3pBFOjzB9p6EnFf0JDjPtyF0=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Wed, 23 Sep 2026 16:29:52 +0100
Subject: [PATCH v3 2/2] kselftest: mm: fix intermittent failure khugepaged
 test
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-fix_khugepagd_fail-v3-2-b387e92fe1a9@arm.com>
References: <20260923-fix_khugepagd_fail-v3-0-b387e92fe1a9@arm.com>
In-Reply-To: <20260923-fix_khugepagd_fail-v3-0-b387e92fe1a9@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2212; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=ooA7gnlKxc89gO2WIVt8hrp3HEKHzLvwfAey+X1/t9M=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqs/Bypoq9vTrEQVXeB9sf2lJpalwQjYUcNreLF
 vOel/96l82JAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarPwcgAKCRBt1cPRWsUx
 Mx3nC/9rvmyHURuLkgtUmXfMQosa4eCGa9HReNKzlD+EjOD7f/wjyIWVpohxdVXx/vLpw/ulWB9
 iHZFGNZdtIxoDjqOymdosbkanMfOpGHaZxIKADZRZtt2TwN4r4qGnrZvdohg87UciEO4RpgvRon
 TTu7Bv/Q5XVSsgFXGn9Nz5LWZAKpc/Q2Ebb1zQMXIJ9UqWEXUUotizO2NxxNoAikI6lL+aEQEYV
 mOaVNYvlzlw1FgNrSBsxvAD8npp6X/HXAz+EwGj+9imiQJh8ib/LJG3vFi9caum2sqZjR2ep9RL
 39LIF2Z5h22jz+UIDxp+pzBOjumlsyrw6CJWXSb8jjn6wFRLul3baiVTWVlx01hvJRoaSBKVFBH
 tglhp2rHCHSOjezEqGVEzqbH1xobmjrJ/GvbXM34NyjJr0CA3+11u2iCZrJupelN6kRxeqQoIza
 fJx/uf6yBk6sgKGG85huRI64p7jO3i8mbpcUEkuqpbscOk+PyibHYtDTqs77i4+s8J98U=
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

Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Tested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 tools/testing/selftests/mm/khugepaged.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
index 2aa7c9197158..b0cb02bf1a73 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -618,6 +618,9 @@ static bool wait_for_scan(const char *msg, char *p, size_t len,
 		usleep(TICK);
 	}
 
+	if (is_anon(ops))
+		madvise(p, len, MADV_NOHUGEPAGE);
+
 	return timeout == -1;
 }
 

-- 
2.43.0

