Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A470346771;
	Tue, 29 Sep 2026 13:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687728; cv=none; b=D57t8zwKyjx00Ok82/0z+WwRGySwevPnuwbGOHv+W/6n+Hw8lIxLXhcOvuJrvwJrxN+2AeIR1PmndyPWlYKHKBor3K2tEsNEUurqSPcsLYXmPzMXP2FVjLr9EDIgn8DJx/JNBaObqVpDZDba0LHluSZcEis2C03WghLxmtG1iNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687728; c=relaxed/simple;
	bh=xoVVUwwV7zfH7B9nRlz47Lz+PWZGkHyWRvJBgM8w/FQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cNM0Eruvts+NuIIOB2jVC4h3fAeljTsvYJR1FD1QcgdjEGf+vfcVNHXomOfP99T5E/kyPUzV0RAwL8gVUlgolci3eY9m4BuLVrRtGhCvRe0HAHK5kIjV35C1nRtxvxHh0UFSzU0zcz+JBXpcKpjw0XzIuhRBGDyxuucj+rabMB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=Bi/PaIQp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gB90BWbs; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="Bi/PaIQp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gB90BWbs"
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 73FBF1400DE9;
	Tue, 29 Sep 2026 09:15:25 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Tue, 29 Sep 2026 09:15:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1790687725; x=1790774125; bh=dln44ETuiX
	wXPmOn5cFsvpQrPsJf7dyzZ/xlI0gN724=; b=Bi/PaIQpgq++yJqpVx/Z33jNvb
	SvAxltNdXLj4vsR0g5jLhrfKa7jM+wDPOJVylXdFfU6yVZF+civwcp+TS2IMl7zk
	Mpwn8WD3YXhQwjrttuH0HjZHRaroT4gnD4uH/ONjGWCdN6Ftp2zoDLCQKTzF81BY
	Rz4lWPlGhoMBMmVP7Q0woy/pWrjhlGuGsm6HvwNVDPyTpRWJ7pPRiDjnSyVSZAq6
	jkCfH7vLGfw9PEq/MoWwHt6TrLEfihhzjoh6MagFMc3RbhbOXqOGfcdR3Ml3PR4m
	D+XNmXCZXtTq2zrV00Kox5LUUJ1XT/pKqmM6QLduZwzqsbVt3aZbcoyp1K/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790687725; x=1790774125; bh=dln44ETuiXwXPmOn5cFsvpQrPsJf7dyzZ/x
	lI0gN724=; b=gB90BWbsm1+K0aSfQ6hhzHMwBkWDLYWVSNdRONEfgAzPHgkH5N5
	hrHfucS/MAr1iQDxuPNc6TwGWs73SHPiCnjLGJxbUe/4hRIM3BoUOKqOOxcejECP
	aLXn+RznCMumAZ7LRkPRLEsG8whF3KoH6adBqr+iOwtlAvUjbALHOEfHkXG80xo0
	KiHxKFPcXhPjnMm0iw4K4Ld8nojmO6pbefM/nbxNkNzMV4Id9CA7l6AHy7q0JjRI
	gmZdow7U+P6zRMlMoHqsLTy1A5nSGWq7Z+1TDRM+LWXpJGMqKK+jubGjLBeDZsDl
	XWNz78V4Xoas6cNMcUQnfFoV1nXBvNDyJbg==
X-ME-Sender: <xms:7Lm7aj1K495RalAp36TemdYS50cOON2KImp5lxK0G2cY-p_dpBvG2A>
    <xme:7Lm7ajtxfocCtCXro7xsFyASeIzxa2_cyN2tSk-I3aVixQeBoyBCEN8XmaH-WnHAX
    bWwsNC11QqT1HPIdPFDuVmhGhzEyrdZjGEO-3yoUtmKNlrEVIRMseou>
X-ME-Received: <xmr:7Lm7an8dtz3x0XRlB5N7q8sOTtyI5JPQswEn-CjZnCFi9wHRZet_FNdnccM>
X-ME-Proxy-Cause: dmFkZTEdRzjebqwEyKUsmCMnVq/d6i3oNDeazqWgQUaCchZvTgbioD5tEK+m1B45sYEP7u
    TntqU8fdl6QP5zx5E69fZ51nHWl+I26EBc2HC3WqwFRQ63udJjmQqPvC1EtMFZ2vLEDK8A
    jjfmS8b69efhc3joRYo74vNDRZ8zClIgdG5l2bRF/M6NC3hbjvylUFvA/MvgT2ujD1YAZh
    IzkQbFH50g9a00b2iMKNZkMTpFzHG/hLdMdg3VRS2Uj6FQJTdX0Jsjit76F/1Pzs13p3Mk
    cbY9gO59pD4jGkwsD6g/gmAD1FIzaa6+dkemqQYDHhLKebwqbPYD7ynQiPvWsaZg0z5SKk
    /or2nd2ppG//ZDj05dGdqm72C1Y4QT9bmB1rPVs3uM1g5pLUlh3ZNiXVUtj6PwLGGByivR
    3/f/MWtgldm9D0KnOLAFqh7y/S+6zOEvf0qgTi5rARGK8xeDQMoAFhqx3RM9U+VPSTAi8O
    r+M6FzHvN+8MI210952MlPgAipoxkYrWni9LVgNHrQCIUD7RrI15C3penw+WmMKTuGULK8
    zdeEWQQ5VgG7WnMsFTNxDb9NDBsq9mzz9CkFRk+xn6hzuMj5SdPQEo+is4YAIR4zgDuWp4
    ZtFEgBdh3L2icI0Vmxm5mNCS/6UGOkYhcoydVBIblgsfofnUI6L/+Knvn9Rg
X-ME-Proxy: <xmx:7Lm7avRPneSVcBJVWT_JjXNBbWegXjyfwdu6-umBDyNWCoyqvnuWag>
    <xmx:7Lm7alDfusfvHescl9rIxVFniotiqVAyeA9f7VU2YEsaOIMoSIpMYw>
    <xmx:7Lm7aoboQy9LsGd6e9psgvdaslroXk_sTjIiFfC_gUpNzrAK6Qgq1g>
    <xmx:7Lm7auJ1hgrn7tUVnSwqmB2fj7dCAOdwdeqPyYJBqM-ISvXJMtjorQ>
    <xmx:7bm7an12QHvh6yInRK7UjF5L1PldHoYcW7S14J4xm-F1kGsifmHspSP7>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Sep 2026 09:15:23 -0400 (EDT)
From: Kiryl Shutsemau <kirill@shutemov.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Shuah Khan <shuah@kernel.org>
Cc: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
	Barry Song <baohua@kernel.org>,
	Dev Jain <dev.jain@arm.com>,
	Lance Yang <lance.yang@linux.dev>,
	"Liam R . Howlett" <liam@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Usama Arif <usama.arif@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 0/4] selftests/mm: check large folio results through check_huge() only
Date: Tue, 29 Sep 2026 14:15:15 +0100
Message-ID: <20260929131521.153079-1-kirill@shutemov.name>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>

The mm selftests had two ways to check that a range came out as folios
of a given order.  check_huge_anon() and check_huge_file() counted
folios of the order in the range.  is_range_backed_by_order() checked
each window for a folio with its head at the window start.  Baolin found
the two sets in khugepaged.c confusing [1], and the answer at the time
was to merge them once Yeoreum's rewrite of check_huge_*() on top of
pagemap and kpageflags landed.  It is in mm-new now.

Make check_huge() check windows below the PMD size, route every caller
through it, and make is_range_backed_by_order() an internal of vm_util.c.
The split test's count-based check goes the same way, which also makes
it notice a split at the wrong offset.  On the way check_huge() stops
reopening pagemap and kpageflags on every call, which was the other
reason the separate helper existed.

Tested on mm-new 2589c5593c20 with KASAN, in 16G guests, x86-64/4K under
KVM and arm64/64K under TCG: the khugepaged matrix at every order,
split_huge_page_test, pagemap_ioctl and khugepaged all:all on tmpfs pass
with the same counts as before.

[1] https://lore.kernel.org/all/65bf1722-c1fd-452a-88c1-c030b042cfbc@linux.alibaba.com/

Kiryl Shutsemau (Meta) (4):
  selftests/mm: open pagemap and kpageflags once for check_huge()
  selftests/mm: check sub-PMD ranges window by window in check_huge()
  selftests/mm: check collapse results through check_huge() only
  selftests/mm: check split results by position, drop
    gather_folio_orders()

 .../testing/selftests/mm/folio_order_check.c  |  28 +-
 tools/testing/selftests/mm/khugepaged.c       |  47 ++-
 .../selftests/mm/khugepaged_sync_check.c      |   7 +-
 .../selftests/mm/split_huge_page_test.c       | 104 +++---
 tools/testing/selftests/mm/vm_util.c          | 320 ++++++------------
 tools/testing/selftests/mm/vm_util.h          |   7 +-
 6 files changed, 176 insertions(+), 337 deletions(-)


base-commit: 2589c5593c200e5146db848730baa1d7dd0c9f4e
-- 
2.54.0

