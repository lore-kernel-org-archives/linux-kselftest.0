Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059B243231B;
	Wed,  5 Aug 2026 11:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785928709; cv=none; b=FpEaL0AeOb+qKQrvX6GEbkDVTPbxiT7SbxRUQpn4yTawvW1WNqoPYUzLtKn/peyg/xR69g1eI4h2p62jE3MYq5XEg9hR20Noa/J82Y93SpFKGPnW7htSJYqoH5jLtTNL8jKDEul0UJbNlU0fAWG9eWVZY7Hkb5h02HpU3eb2+hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785928709; c=relaxed/simple;
	bh=MU5empUMl3yldn/ojRHKh06PTEKGbPUZ4kS1eWRJoVY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UFWBEoY6xve/Yz0bjdzSkB7nT77MfE9X0NyU+B0JOMIlhPm2v8pX+gTN9gLKHq1F0UTj+vdOysZZoIKxEKab/MjH5dNi/F1YoEhcKUrJ7YvuFP/8JLkkDYS9v4YwELiN4V9eoZYu45b63RAiPF/QntE3rZV6BagqTQlSsjuDP7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YpsQvHVg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YpsQvHVg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88CD6C19425;
	Wed,  5 Aug 2026 11:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785928708;
	bh=MU5empUMl3yldn/ojRHKh06PTEKGbPUZ4kS1eWRJoVY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=YpsQvHVgzgU/4xG+7gT7zXvCPuqVsdtYwQicGeAvGwQQR2nYq6EdBX3cCuYyMInHo
	 SYppcgKGgfgAa5myeGJQ/N/Etpg0nsxMz6nQUq3kPmSnOu3mQd3a9x2wpi2/TpMhFS
	 vnoqT1Fcl9WCuEizfz66ntBdVPAVmqs2d7PW5BI2gAuWAq05ROdZu75Tb/U3AlDJ1x
	 LTH/MG0AkTmOiA30ora27eOIMHS+Vb7L85KdfNJW6INatUxxrDppH40kBGMGQC7W9A
	 Hvo/s8mSGLrdwofbB/gG2dTHmoZEakQIijzuVQtTzoLwDTynPQ5cW/Afe2DRHiwDRo
	 K3+rHaBAGQSGg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE44C55174;
	Wed,  5 Aug 2026 11:18:28 +0000 (UTC)
From: Shivam Kalra via B4 Relay <devnull+shivamkalra98.zohomail.in@kernel.org>
Subject: [PATCH 0/3] mm: support splitting mappingless swapcache folios
Date: Wed, 05 Aug 2026 16:48:23 +0530
Message-Id: <20260805-b4-mappingless-swapcache-v1-0-b1d78ba257ca@zohomail.in>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP8bc2oC/yXMTQ6CQAxA4auQrm3CFOLfVYyLzlCgRsfJVNCEc
 HdGXX6L9xYwySoG52qBLLOaPmOB21UQRo6DoHbFQDXt6wMR+hYfnJLG4S5maG9OgcMoePLc9Y4
 a1xwZSp6y9Pr5rS/Xv23yNwmv7w/WdQOr4E30fAAAAA==
X-Change-ID: 20260722-b4-mappingless-swapcache-9badf123138a
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Nico Pache <nico.pache@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Shivam Kalra <shivamkalra98@zohomail.in>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785928706; l=2322;
 i=shivamkalra98@zohomail.in; s=20260402; h=from:subject:message-id;
 bh=MU5empUMl3yldn/ojRHKh06PTEKGbPUZ4kS1eWRJoVY=;
 b=h7y3Pjsg4r+NdPMicPmvEWMC2Ho6ZdL0IIy0BTtTOeVECkZ/mZLDLYhfb2ahKy3FOQMnebkaH
 flAUIWn8AC6DVQVxGuodSOCJ5ZwParkiGLGybn9or1t3EVrTEdorstP
X-Developer-Key: i=shivamkalra98@zohomail.in; a=ed25519;
 pk=U8kQSxcte8P8iZ6zB7phIj+Yl+i/5ntifBGuclgypx8=
X-Endpoint-Received: by B4 Relay for shivamkalra98@zohomail.in/20260402
 with auth_id=716
X-Original-From: Shivam Kalra <shivamkalra98@zohomail.in>
Reply-To: shivamkalra98@zohomail.in

Large shmem folios lose their address-space mapping when they are written
to swap, but remain valid members of the swap cache. Folios read from swap
but not yet associated with an anon_vma can have the same mappingless
swapcache state. folio_check_splittable() currently mistakes both cases for
truncation and rejects the split with -EBUSY.

Implement the longstanding TODO for this state. Allow mappingless
swapcache folios to use the existing uniform order-0 swapcache split path,
while continuing to reject truly truncated folios and unsupported
higher-order or non-uniform swapcache splits.

memory_failure() is one caller affected by the restriction: it cannot
isolate a poisoned base page within a mappingless swapcache THP. The
end-to-end test uses this case to exercise the complete shmem pageout,
swapcache split, and swapin path.

The first patch contains the MM implementation. The second adds focused
KUnit coverage for the split eligibility checks. The third adds the
end-to-end hwpoison selftest, which pages out a shmem THP, poisons a tail
page, and verifies both isolation and the data read back from swap.

Tests:
  - The split_hwpoison_swapcache kselftest passes under x86_64 QEMU
      using virtme-ng 1.41 (2 GiB RAM, 4 KiB pages). 

Signed-off-by: Shivam Kalra <shivamkalra98@zohomail.in>
---
Shivam Kalra (3):
      mm/huge_memory: allow splitting mappingless swapcache folios
      mm: add KUnit coverage for mappingless swapcache folios
      selftests/mm: test hwpoison recovery of mappingless swapcache THPs

 mm/Kconfig                                         |  14 ++
 mm/Makefile                                        |   1 +
 mm/huge_memory.c                                   |  18 +-
 mm/tests/folio_split_kunit.c                       |  52 ++++
 tools/testing/selftests/mm/Makefile                |   2 +
 tools/testing/selftests/mm/run_vmtests.sh          |   1 +
 .../selftests/mm/split_hwpoison_swapcache.sh       |  57 +++++
 .../selftests/mm/split_hwpoison_swapcache_test.c   | 261 +++++++++++++++++++++
 8 files changed, 395 insertions(+), 11 deletions(-)
---
base-commit: 0b53bff4fa05ff0d3ffbd3d3bb10fae69dfab498
change-id: 20260722-b4-mappingless-swapcache-9badf123138a

Best regards,
--  
Shivam Kalra <shivamkalra98@zohomail.in>


