Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0790243A812
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 12:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426514; cv=none; b=mMraLzyEm7vcWqVh6t+DBjQsV/wMfiEXjHIlLrXNsjqft6kChBJRDpC0k4NVzJIii2vllKD3v0MVQFzwKKyDiCL0djm4qqiItTt5XtrbHD0nXXuYBZDnn1rWB+DSPtv12YUNTsojahcGST6f8eOVmexYQ14Jw/6bWgfvqssMXdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426514; c=relaxed/simple;
	bh=6dlh6yLyxL+qjxy+1dya2aQDdPRhNTEc0iOCCUQ65wQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gqJ0DgDD+nchm7YHCBKrvKwAe8hwPHlgEi5czJ6JdwZFEABmXQ9f3zF6OS/RqALNFukHSih+APSTjr2w/rQb1H160VcpDziXk8SpftEpMtyGHzYW00YAOV1Rz//pf2aKZuEARDQUdHKqhjoNbdRSRAupvref+ce0sJR/f02MUzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qFpOPUQm; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qFpOPUQm"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0f64df6a6so22148a91.3
        for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 05:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790426512; x=1791031312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W2zTAQUGUmuhZJVF/v4ua+yizjtFuipihK2DMp9YoGo=;
        b=qFpOPUQmYz85NKGQOAkixSlOPWvFHnUHOCDWBPBn8F6Q6lRA/nTHPfEfV0XAfH6upM
         RejlOr8NOBKehlyDxmxj2ijbbZDEMKuf7SMSAHQKA4k/c56jmWxv17A+8vU8pwqFNzMO
         jViCD94MajYAz9u0JXkxxZJPVF6w4X8I0udwjptmrJ4HRtQ4R/RfXrNs99HZlJcHu4x8
         c0vSTljkLrvocO6yj4Hz5H/jEEBCXoQAdFazvHp0k8EaDf/xrif7RX/XNr7abgZ0i5iD
         Gq6K1d4xKufLyBc05kT/aW5J6+4jW9RhUYO071kLPZKBROgjG3WruLRN8fg+zHRMQEQG
         44Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790426512; x=1791031312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2zTAQUGUmuhZJVF/v4ua+yizjtFuipihK2DMp9YoGo=;
        b=M6/NwtuOeNqfOVPkTUGHQuzmurobY0z5fRDRx+WqQ/PpPgaifdtNTM55+42DPWpstF
         a6Jlz9qBHJ4Es8v6HK5Yh61PSD3+FKp0+/V7/Xx0Qkr4db8ygQL+Ry70XBuYbXxswJaK
         buC+4X+ai3680ZvYfZoYlNaBkFYa1FZ0yL7HHa3/MPt+T8kN+Et8pXMDlChtssFuO1wQ
         /PIVygxBKuMKL+psqTp0KaeSg6puvppKRXQRZpXYS4ZPyku77UJfkvsUD12lWpS7/CAU
         8bqhtpUXfpqGw5ocLtgYS/IczXXi02rbdKBP/Jm6e7h4RzSNcn7OEQpQetNADO3Am6V+
         5cqg==
X-Forwarded-Encrypted: i=1; AKwUvByioLYbrPdXeicOJJBfYHeyjN2okV4X27BhRsNkS8ggiOJDFkffJTxG46SWENxhXSFetsZjv5A7Db1qTTWvUcs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJO0EzG0mBcsiqvHTVurajvX9kCD6AKYPsBd2Z3Ixl8f65vkJX8
	y3l2Xgn8H9yLK9370hsubd7zWZJ4Zxe02URCr9jlzC8twL475BaTOFc=
X-Gm-Gg: AYBFou2tEcldRvkfmdQF/xzkmfm+MTpsr/a7ti4VaUTSnNY+FvHAv5sV7VWIKEMkehS
	xN3WoEAxOAYGqteQoQ3ds9rz+J4eZC1vYmHmT3mOw/kWKvdDuElEl83s2tLGdGjncFQNIxAz+jH
	MyP76jxUVSQCYF8ZAJ4OUyX/ZGB3VlHytjAoYp+1l+zFOzpC0+2PhG+7MTS0wtAYzXrRmQviiWR
	z5qBJ7MCbq4A+9oYuRTKQLUo4Kt3PIFx5fYgiPs76ujoJB2hARMgxXI3jDXnKXb/xvgbOGeGYXu
	Wj/3/tYEoJPECHGxFbBzge5+TAv26WGCmopKZDXOoQP5o+LQZmpQGjHs0EfOlJ9ooclr/WUdY4r
	aN1sDODLAREvQyVBZkRbEI5Jev/mxC+0zeu0CLSGupRdkImbRl8P3lb+uoCkJQckw45Lxi0IG91
	jc2yMMGFBONoVDVYCkSN1rTkfPKh5PY1yJgPO1wb80Ubal6JlkcYkdOo3XNMD4JjSRUZdksuA7O
	lIu8UM4A5VvN45N+Mc4aHcU5w==
X-Received: by 2002:a17:90b:4a87:b0:3a0:a18e:bca0 with SMTP id 98e67ed59e1d1-3a0bb60e052mr3893421a91.31.1790426512107;
        Sat, 26 Sep 2026 05:41:52 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([211.230.25.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0cd1c4ec9sm5965212a91.16.2026.09.26.05.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 05:41:51 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: akpm@linux-foundation.org,
	rppt@kernel.org
Cc: peterx@redhat.com,
	surenb@google.com,
	aarcange@redhat.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	mhocko@suse.com,
	shuah@kernel.org,
	kirill@shutemov.name,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH v3 0/2] userfaultfd: clear the inherited uffd bit in move_swap_pte()
Date: Sat, 26 Sep 2026 21:41:43 +0900
Message-ID: <20260926124145.2878520-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UFFDIO_MOVE on a swapped-out page installs the source PTE at the
destination unchanged, so a uffd bit set on a write-protected or
RWP-protected source lands in a destination VMA that was never
registered for either, and nothing clears it afterwards.  Patch 1 clears the bit, then re-arms it if
the destination is RWP-registered, which is what the present-page and
zeropage move paths already do.  Patch 2 adds the tests that catch it.

v1: https://lore.kernel.org/all/20260919004630.1159895-1-donggeunyoo.kernel@gmail.com/
v2: https://lore.kernel.org/all/20260925042907.2330519-1-donggeunyoo.kernel@gmail.com/

Changes in v3:
 - patch 1: describe the userspace-visible effects and the backport
   (Andrew Morton, David Hildenbrand)
 - patch 2: drop the MADV_PAGEOUT retry loop (David Hildenbrand)
 - patch 2: add an RWP case (David Hildenbrand)

Changes in v2:
 - patch 1: clear the bit unconditionally (Kiryl Shutsemau)
 - patch 1: rewrite the changelog for readability (Mike Rapoport)
 - add Assisted-by: LLM (Mike Rapoport)

x86_64 defconfig plus USERFAULTFD, TRANSPARENT_HUGEPAGE,
PAGE_TABLE_CHECK_ENFORCED and a swap device, under QEMU, on
6812ce4e4379:

  uffd-unit-tests                    before   after
  move-swap-wp on anon               not ok   ok
  move-swap-rwp on anon              not ok   ok
  the other 103 unit tests           ok       ok
  uffd-wp-mremap, 38 tests           ok       ok

  11 unit tests skip on both, as CONFIG_GUP_TEST is not set.

  pagemap bit 57 at the destination  before   after
  swapped page, dst not armed        set      clear
  swapped page, dst WP-armed         set      clear
  swapped page, dst RWP-armed        set      set
  resident page, dst WP-armed        clear    clear

  MADV_COLLAPSE over 2 MB at dst     EINVAL   0
  fault on the moved page at dst     WARNING  none

Donggeun Yoo (2):
  userfaultfd: clear the inherited uffd bit in move_swap_pte()
  selftests/mm: add tests for UFFDIO_MOVE of a uffd-protected swap entry

 mm/userfaultfd.c                             |  1 +
 tools/testing/selftests/mm/uffd-unit-tests.c | 84 ++++++++++++++++++++
 2 files changed, 85 insertions(+)

-- 
2.53.0

