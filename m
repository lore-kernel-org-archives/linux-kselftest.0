Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40BFD4746A9;
	Mon, 21 Sep 2026 10:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986924; cv=none; b=l0YQZkV76+b9fpvWmTGQa8SlYnJiDM3hP+FhiH1XjHJWIufx4UPsNEwwMcnk3YlUftLr61k6Zux0VjhctJjx99ZgrOTi8MSISzdqUHGCHTM6ZLNCiAGjvDz/MaoQot8X9qurFb1idb+/d8C66KRE8MbouZDQvBbmIwivp6anee4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986924; c=relaxed/simple;
	bh=s3vlN8KzPKyTD9fkA2aQfkXgGf19XzC4T6yxr/yppHc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bFL/j0qWA/AGa0IHfwhhomMrSd5a9p/88AYYkof/yq7o9qx5vnAAYrqvZQfIPapCOX2rjnHIrvqY47UjkB0UDN3GWTQRmO701KqxxLrLTyhqok1fhzbOsXo5gOS8Y8NXUFHoTelBiFXiaScfFH4EMwMsvAKwFEzF/2cxf6pl190=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qyO6N2YM; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qyO6N2YM"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C342143D;
	Mon, 21 Sep 2026 03:35:17 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 222383F86C;
	Mon, 21 Sep 2026 03:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789986921; bh=s3vlN8KzPKyTD9fkA2aQfkXgGf19XzC4T6yxr/yppHc=;
	h=From:Subject:Date:To:Cc:From;
	b=qyO6N2YMmdt/Vr9iE62nlfEjCTOA/Gxi+kIxZEU9KsxbJ661aGOzSSuze4iEQ7emS
	 TjOTZOpdzITgLpB6g68bCsOzle/eb0dpftBbeHGWMv4yOJtTOt4S/fjazr4bIqyF9c
	 VJ0KzmyAmgjV6SRlled1/uSIKM5u+dQhhem3zSYM=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH v2 0/2] kselftest: mm: fix intermittent failure khugepaged
 test
Date: Mon, 21 Sep 2026 11:35:00 +0100
Message-Id: <20260921-fix_khugepagd_fail-v2-0-3c2877beef61@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFQIsWoC/32NQQ6CMBREr0L+2prfKrVl5T0MIaW08KNQ0irRE
 O5u5QAu32TmzQrJRXIJqmKF6BZKFKYM4lCAHczUO0ZdZhAoJGpeMk/v5j68ejebvmu8oQfTndI
 nIZUWiJCHc3S5tUtvdeaB0jPEz/6x8F/6V7dwhqxtpcezVZdS+6uJ49GGEept275CriUhsgAAA
 A==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2975; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=s3vlN8KzPKyTD9fkA2aQfkXgGf19XzC4T6yxr/yppHc=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqsQhkpRkHWGqSOL0OBsuUib1qwsbDCZewd1Uf7
 hN481PdzruJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCarEIZAAKCRBt1cPRWsUx
 M+b4C/wNcLRogdBHlGyb2lfV/a4n88h2wVz78E7q2rzBERXnKg+JWPOdj38pgkGIxeYZnwCK+CG
 fooqQlutkh6S6B+KGh8tJoxVJcqtXA9mAajYyIxf8iXaavUwqXKeSJ+g/+UDYKFN9RuiM+nnJt4
 TrDmsOuNf35GZUd1OjaVhzw+5Xcong5iY9b85g22JlJLCYqJ0q5JaKsoXbGTKZ6gT0VSojAUDHE
 54FnIGUdL1kAJKAFe3YNZGuK0Yq2Emvv8p6Q4nEYF7r8XuXuc6wldUqZynsIga8ecFZuvPSyyum
 +6EcyRYZRPAF+v8z/lP4T/A1xy6/zIbLFa8aPPedK0aE3GqZkqrFleSsc6I+uo/Xh1xwOh8Br3X
 po5a3mpfv56sGPqfbnr+2iOqI04rzzqJSNwg5K0hLzCcD3JWO3LO3GXdVZ4fT+Odd9g0L7RoGNR
 3Vtne3zOrJP8jQrlSLHYqkxUnLKOXZzWiWwNHR87KD8QdVMKf+ffh0VL6NQxpiWQqwWq0=
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

This failure was observed on NVIDIA Spark with 16KB page and this patch
is based on mm/mm-unstable

---
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
base-commit: 8d61431ed2607386b427752505379536eb634ce8
change-id: 20260915-fix_khugepagd_fail-9d8932689200

Best regards,
-- 
Sincerely,
Yeoreum Yun

