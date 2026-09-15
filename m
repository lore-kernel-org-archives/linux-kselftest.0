Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E3CB471D0F;
	Tue, 15 Sep 2026 09:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789464113; cv=none; b=Epm1JNLo1pTFFSRm2JfkqoG0ETqfSgrIGMw+UvHAYd5Z8X7HhFWkJdhtPy4TUgfXm9gVW2/jG1hhC3iLwL5ypW6vDRGyE6WHADS92z4W6jY4/NqEwduaDk5TdiaxgwSWgeHZascxOedmSuqzZ253P0OoAskrxP1FSe9u5evcniA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789464113; c=relaxed/simple;
	bh=AFgqujhkJrGASZuwK6HMERYmbZ5P2W2+hv4OhaNPtQ4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R7e4s2s/ZrmbmGhmO0avF0yxORQ2hwa5kNKc8kMgvADHm8Wz1+uYg89m9SzPMAspIiEzZE/2N6tDbpUrPcTXo757C+9mK3zbtcalbUcY45pNunY+Q4559xe8zga/GuDnjA5c5Ft6ORHB3GVOXpyKRwY0eArau9HBbSODxH0G31w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=uJAj+7Fx; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="uJAj+7Fx"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2122E169C;
	Tue, 15 Sep 2026 02:21:46 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE9F33F86F;
	Tue, 15 Sep 2026 02:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789464109; bh=AFgqujhkJrGASZuwK6HMERYmbZ5P2W2+hv4OhaNPtQ4=;
	h=From:Subject:Date:To:Cc:From;
	b=uJAj+7FxYyzFDCCin5QvAMgMxPqvJQYfLVI2/HM4PNsF5rh2/8JMKPohoHSA675sB
	 /zIu1nMYAXMldL4IMU/sq1jciDGHZZxs/vLJia2obRP/Xw/wNT18Vt7R1d16piAWPJ
	 6Oa8fY5OWlEyWPhEPw6dTHJkCh4Gud8xXkJbMN9Q=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 0/2] kselftest: mm: fix intermittent failure khugepaged
 test
Date: Tue, 15 Sep 2026 10:21:35 +0100
Message-Id: <20260915-fix_khugepagd_fail-v1-0-bb6f04c8759f@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB8OqWoC/x2MQQqAIBAAvxJ7TlAj0b4SIZKbLkWFUgTS35OOA
 zNTIGMizDA0BRLelOnYK4i2gTm6PSAjXxkkl4ob0bOFHrvGK+DpgreLo40Zr00nlTaSc6jhmbB
 a/3Sc3vcD6VER72QAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2907; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=AFgqujhkJrGASZuwK6HMERYmbZ5P2W2+hv4OhaNPtQ4=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqqQ4pqW6CqNXPPPXfOrgAwKvwi1qdYYBTYZw8A
 wg9WRl42COJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCaqkOKQAKCRBt1cPRWsUx
 M+kMDAC+icNdo9ex8a/XcN4CcH19iOYi5hhEqweD7ih7Mxr27WHC7//A5zWJh+JHmFtogpa656r
 A+t4r94LEmHzKngogkWejKyL0zYh8qgWeSg92dkn2zl0LDabvqduoG1tiGEQVuxsVUN6FEQIEB1
 csmMDOU4SJEJ0P/lWZ53+wjTrbakbVfGdhsM1Yr8B56pBMZXGBm9nYA3bSyPNSWIHKvPRm5os/X
 CqtM278tZymubu/tsOzNHqlXWCICpqQPyDjtbB2yI2glavvAKPjnDjUpmgZvfWnpFsrm/s8Hzex
 ht1miaQ0sXrxIjYOjDY9xIml3vMGEdOFixFXsMf81kr48k1eA+HaosqW6C1rEmbr/+ZPaSktVQ3
 bvAHVHo1SMeQtdLJdeJsgcrYrqwqj+oaGJS2hTApcgvI77BWpr7WVGd7inBbZRz6BxM7Jlt7OZa
 rtI1EWUJ/GOA4WcAFlX7c3hDWxuP+4IuHKXPGL7qc50OhJ0C3hz+36AZuwbpoZxNxUwd8=
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

To prevent this, change the khugepaged setting from ALWAYS to MADVICE for
the affected tests, and mark the VMA with MADV_NOHUGEPAGE after it has been
collapsed by wait_for_scan(). This prevents khugepaged from collapsing it
again before c->collapse() is called.

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
Yeoreum Yun (2):
      kselftest: mm: return fail when child test result is fail in khugepaged
      kselftest: mm: fix intermittent failure khugepaged test

 tools/testing/selftests/mm/khugepaged.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
---
base-commit: 6b41451631cabf9ea3b384c2a099088e1598f963
change-id: 20260915-fix_khugepagd_fail-9d8932689200

Best regards,
-- 
Sincerely,
Yeoreum Yun

