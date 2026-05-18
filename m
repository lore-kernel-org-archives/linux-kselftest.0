Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7510381AEB;
	Mon, 18 May 2026 18:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779128266; cv=none; b=LmSrykoEvQekHspo6WdN+7MjiZkEch+N7dAkBhG+whv+ZdURQSDJC1QNjgnXwXdEFB2u4abZTRzChE5sxMtCoSN6u2LUa7nS0kwXL7tZxrJnH9OcKuRMQxbD6zx+j5C4eJWMxeA4SAqWO6NoNpogpQEhtokmEETDVgM7nawih9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779128266; c=relaxed/simple;
	bh=aVAYRCF7fpcH4fE/r8x3fxMBl+z01QeRVwKC6iFuOtI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o0eT4+eGz/jZrXejuff6gqS6XMmLzt/zp4lNOoxyC+ZDt2HH2Dy0dwWM/tvifgoLFlG6umsE6l29qG9dWF/wAgyUT3t0ii7e07iG7Wf2ZS51ELUonPqWETALLePr6YJOfg2kiJB5ZysBNOhwFEOLB63E5X8TkGACSbunbe+AEsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bRAtmhXH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bRAtmhXH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85BFBC2BCC9;
	Mon, 18 May 2026 18:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779128265;
	bh=aVAYRCF7fpcH4fE/r8x3fxMBl+z01QeRVwKC6iFuOtI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=bRAtmhXHDokhqvFEewWkVhT2zPlHSo5s7VDSykNtcQvIR+B4OlkOwwzCAWA/nbvVN
	 Sl3A9950ps0TWTwqezCrVvoFq3z03vGqcN9CcPFW08i5qUz/X/ZWhSlerJk5qVl4vN
	 LO8lyxetnZYbm6kHqHALvxFUmAhMRke3x/WZRBqKgKKHrdFOM/kkp+wr+CRxw00quK
	 CzJjrhP3RLAPn94NfA08+377ggJ+Zmg0wFddimnWqSChP8PrG0Xlh8o4OcKddQ9OU6
	 zitvp2om944rTTLotZCUS6ku8xHxkj2TPopprWEATu4ksSFdu43fjO4SRbEKnE6TrE
	 LRtn+t+BfwtWQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7335ECD4F52;
	Mon, 18 May 2026 18:17:45 +0000 (UTC)
From: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
Subject: [PATCH RFC 0/5] Test readback from fd on hugetlbfs mount
Date: Mon, 18 May 2026 11:17:32 -0700
Message-Id: <20260518-port-hugetlb-selftests-v1-0-d64ba3a785fe@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALxXC2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUwNj3YL8ohLdjNL01JKcJN3i1Jy0ktTikmJdy6RkM+OklFRTQ0MzJaD
 mgqLUtMwKsMHRSkFuzkqxtbUAtv9QKW0AAAA=
X-Change-ID: 20260503-port-hugetlb-selftests-9bc63bde5116
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 muchun.song@linux.dev, osalvador@suse.de
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ackerley Tng <ackerleytng@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779128265; l=1923;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=aVAYRCF7fpcH4fE/r8x3fxMBl+z01QeRVwKC6iFuOtI=;
 b=+r7KYrdkoJP5CPg+cUFpdVi0hERhxpSIqRqAicUAgbGChju5O7GgStBPIRKVnYedFhDyJSaQf
 OobXVllVPbZBKb9C324yvDI5HnNpIK9pzvr/lVbJilPV18vGKGdgtlI
X-Developer-Key: i=ackerleytng@google.com; a=ed25519;
 pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Endpoint-Received: by B4 Relay for ackerleytng@google.com/20260225 with
 auth_id=649
X-Original-From: Ackerley Tng <ackerleytng@google.com>
Reply-To: ackerleytng@google.com

Hi,

I'm thinking of consolidating the tests for libhugetlbfs as kernel
selftests, and to start that off, I picked the simplest test:
tests/readback.c

I refactored hugepage-mmap.c to use the kselftest harness, and then used
FIXTURE_VARIANT from the harness to port in testing readback from an fd on
a hugetlbfs mount.

This output shows that the original test behavior was retained for the
memfd part:

  # ./hugepage-mmap
  TAP version 13
  1..1
  # Returned address is 0x7f312f200000
  # First hex is 0
  # First hex is 3020100
  ok 1 Read same data
  # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

  # ./hugepage-mmap
  TAP version 13
  1..1
  # Starting 1 tests from 1 test cases.
  #  RUN           hugepage_mmap.read_write ...
  # hugepage-mmap.c:41:read_write:Returned address is 0x7f19f3a00000
  # hugepage-mmap.c:54:read_write:First hex is 0
  # hugepage-mmap.c:59:read_write:First hex is 3020100
  #            OK  hugepage_mmap.read_write
  ok 1 hugepage_mmap.read_write
  # PASSED: 1 / 1 tests passed.
  # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0

Let me know what you think before I genericize the 2M hugepage size to
other sizes!

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
Ackerley Tng (5):
      mm: selftests: Inline check_bytes() function into caller
      mm: selftests: Inline {read,write}_bytes functions
      mm: selftests: Refactor hugepage-mmap to use kselftest harness
      mm: selftests: Update hugepage-mmap to support hugetlbfs mount
      mm: selftests: Port readback test logic from libhugetlbfs

 tools/testing/selftests/mm/hugepage-mmap.c | 143 +++++++++++++++++++++--------
 1 file changed, 105 insertions(+), 38 deletions(-)
---
base-commit: 66edb901bf874d9e0787326ba12d3548b2da8700
change-id: 20260503-port-hugetlb-selftests-9bc63bde5116

Best regards,
--
Ackerley Tng <ackerleytng@google.com>


