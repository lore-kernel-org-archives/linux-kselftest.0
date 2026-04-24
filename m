Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA4B3B19D1;
	Fri, 24 Apr 2026 12:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777033472; cv=none; b=auI8/Ht+mgZaGcJqQqGy+HoIruCXIK9Aj8C27/NAbg5wYNNl6p8lLFHK9a+rKaYv1sw4qCFQiAZIm2ZneBRB/fEo2HMJL0eD6d2FbxDyXvgfkmUOXrZaCmtxrCXQJJ2hSxB8Kt8AY328ROW6oCsHMbLf0tPYHV+5AW57Hi3EQ7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777033472; c=relaxed/simple;
	bh=1Yg49IhGr2YwCvs+IFVozhTPo6GCwWNF7i0sbY0fmz8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gUzgoy8gC1F7vfGV5Yq099K6sJbATX4mxjk3+x+tY90570uj8CpXFfDhPT0E4XdlYLtmhAvIYq7pdnVh7y82gIttNl9YTMso2Sx210UWkCyatOBmhR77gEWI37/CEtUUoduG6I8zrUzFPlwP2Um2CE8NIG11hXN0N2++OgssoHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=XFtZL76D; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="XFtZL76D"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=kCY/q4tclfbP72dbiGmSdv+d95QO4i6rrytMRJvTj44=; b=XFtZL76DHZa40jxuxLT3sHlWll
	E6EDi2xkfoaXXqnJxddpH0DD667wMv/FVue01VLUpC+GZ8mc1ODLyfNIIdxImazldaY+nDE+Vgjg2
	dDa6ekBYXL4N+0jo09ycUUE6jA6PYsy79Qj3jQISA1RoqoGYcFxXSUxU1BoKYs+ppLefUGvPQHdQQ
	9M4eQ71dKGTz9zEAQIrB5latKroPFFzIIBvdlC2IswDedy80T9qHgMmqtcd9vVGznk1vCRDQbfpWV
	88bxsCrs6JtzgS6N1Hif2YE1+/sWe+9fiNT4DfKyUmyotnJRHFOTdyW0V8ygrs1XELIVw/P4R0/bC
	3o0RpGGw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wGFZz-003APX-0o;
	Fri, 24 Apr 2026 12:24:20 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH v5 0/4] mm/memory-failure: add panic option for
 unrecoverable pages
Date: Fri, 24 Apr 2026 05:23:58 -0700
Message-Id: <20260424-ecc_panic-v5-0-a35f4b50425c@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN5g62kC/23NTW7CMBCG4atEs2aq8diJQ1bco0KVf8bgLhJk0
 4gK5e5V6KJBdDnS97xzhyolS4WhuUOROdc8jTA07a6BcHbjSTBHGBpg4o40a5QQPi5uzAGNGKt
 9r6m3AXYNXIqkfHu03o+/d/3ynxKua2BdnHO9TuX78WxW6+6/7qyQ0LJTe1aWu9Aeovjsxrepn
 GANz7yhWm0pI+FeDEVKnUnWvVD9R416+qqRUMXgPSfFPpgXara03VKDhByJrU196kg90WVZfgA
 EjypFZgEAAA==
X-Change-ID: 20260323-ecc_panic-4e473b83087c
To: Miaohe Lin <linmiaohe@huawei.com>, 
 Naoya Horiguchi <nao.horiguchi@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-453a6
X-Developer-Signature: v=1; a=openpgp-sha256; l=5234; i=leitao@debian.org;
 h=from:subject:message-id; bh=1Yg49IhGr2YwCvs+IFVozhTPo6GCwWNF7i0sbY0fmz8=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBp62DtrHhNXOYVDOSXYRniu6HKfays8eZsIassL
 HqjFi7tWjiJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaetg7QAKCRA1o5Of/Hh3
 befJD/9awnGz38LRRnqkMpb8hdarn0kczxmQGG/QdI4fey4T1kHKP7fOwjmSY7tpf4ztvIcexGt
 Y8l9rip6qMK93gKcJhLxezHZe/yzwfRs1Tpq7+ODzy+nUuskr521fRGgtfG0WFBil4DGqEXuvvm
 9otADYxTcEq2yYFoilrFrkrmcM1rrEO4ryPaNI3QRAGwzKn67Elce/an/xgmumCZXDSgKAexT5C
 UkKXiI7XlLYToIhyCRMPz5ONgmjfgJHFS6lmcneTv+XIB1So8g6esolhnY8e+Yhv/ehuF+nRn0B
 TtU1evU/d8D9Tno7eLcdLbSFPQwuAqjdvoCyYpKUSpfyKBJjIq8nAjoWxPBWHvHdXSQAOvFaHXo
 lcs7Xu3Qbw/ct6Px9cwUzM+zd9vlJcb+TZr7wHZ07MX/IqB3CtifeQOR15WN+75Qoewoxv2CbJz
 5/RH+DqMdIjPYXyCZfnEl9np6j8zz2wL7+zz8nuLQdtMRLKtax4Kl6ggCS7er/+rwSFUcnqm4gf
 gp58yI15rY6NLAGBtTyAvBS8nUzCekRnldaqnL+UUfH0UCqpNXWXgHnW1CK+x2t9KKztB2ZEhGd
 /J8yjsBFulCj2GFCBWf8TuANKejT84rr0WGMDtuksRLTdvOl7qNfdgOIfCWZHShm072OR2FCZvm
 Py708WIpi6uYUDw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

When the memory failure handler encounters an in-use kernel page that it
cannot recover (slab, page tables, kernel stacks, vmalloc, etc.), it
currently logs the error as "Ignored" and continues operation.

This leaves corrupted data accessible to the kernel, which will inevitably
cause either silent data corruption or a delayed crash when the poisoned memory
is next accessed.

This is a common problem on large fleets. We frequently observe multi-bit ECC
errors hitting kernel slab pages, where memory_failure() fails to recover them
and the system crashes later at an unrelated code path, making root cause
analysis unnecessarily difficult.

Here is one specific example from production on an arm64 server: a multi-bit
ECC error hit a dentry cache slab page, memory_failure() failed to recover it
(slab pages are not supported by the hwpoison recovery mechanism), and 67
seconds later d_lookup() accessed the poisoned cache line causing
a synchronous external abort:

    [88690.479680] [Hardware Error]: error_type: 3, multi-bit ECC
    [88690.498473] Memory failure: 0x40272d: unhandlable page.
    [88690.498619] Memory failure: 0x40272d: recovery action for
                   get hwpoison page: Ignored
    ...
    [88757.847126] Internal error: synchronous external abort:
                   0000000096000410 [#1] SMP
    [88758.061075] pc : d_lookup+0x5c/0x220

This series adds a new sysctl vm.panic_on_unrecoverable_memory_failure
(default 0) that, when enabled, panics immediately on unrecoverable
memory failures. This provides a clean crash dump at the time of the
error, which is far more useful for diagnosis than a random crash later
at an unrelated code path.

This also categorizes reserved pages as MF_MSG_KERNEL, and panics on
unknown page types (MF_MSG_UNKNOWN).

Note that dynamically allocated kernel memory (SLAB/SLUB, vmalloc,
kernel stacks, page tables) shares the MF_MSG_GET_HWPOISON return path
with transient refcount races, so it is intentionally excluded from the
panic conditions to avoid false positives.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Changes in v5:
- Add vm.panic_on_unrecoverable_memory_failure sysctl to panic on
  unrecoverable kernel page hwpoison events (reserved pages, refcount-0
  non-buddy pages, unknown state), with a recheck to avoid racing with
  concurrent buddy allocations. (Miaohe)
- Distinguish reserved pages as MF_MSG_KERNEL in memory_failure(),
  document the new sysctl in Documentation/admin-guide/sysctl/vm.rst,
  and add a selftest verifying SIGBUS recovery on userspace pages still
  works when the sysctl is enabled. (Miaohe)
- Added a selftest
- Link to v4:
  https://patch.msgid.link/20260415-ecc_panic-v4-0-2d0277f8f601@debian.org

Changes in v4:
- Drop CONFIG_BOOTPARAM_MEMORY_FAILURE_PANIC kernel configuration option.
- Split the reserved page classification (MF_MSG_KERNEL) into its own
  patch, separate from the panic mechanism.
- Document why the buddy allocator TOCTOU race (between
  get_hwpoison_page() and is_free_buddy_page()) cannot cause false
  positives: PG_hwpoison is set beforehand and check_new_page() in the
  page allocator rejects hwpoisoned pages.
- Document the narrow LRU isolation race window for MF_MSG_UNKNOWN and
  its mitigation via identify_page_state()'s two-pass design.
- Explicitly document why MF_MSG_GET_HWPOISON is excluded from the
  panic conditions (shared path with transient races and non-reserved
  kernel memory).
- Link to v3: https://patch.msgid.link/20260413-ecc_panic-v3-0-1dcbb2f12bc4@debian.org

Changes in v3:
- Rename is_unrecoverable_memory_failure() to panic_on_unrecoverable_mf()
  as suggested by maintainer.
- Add CONFIG_BOOTPARAM_MEMORY_FAILURE_PANIC kernel configuration option,
  similar to CONFIG_BOOTPARAM_HARDLOCKUP_PANIC.
- Add documentation for the sysctl and CONFIG option.
- Add code comments documenting the panic condition design rationale and
  how the retry mechanism mitigates false positives from buddy allocator
  races.
- Link to v2: https://patch.msgid.link/20260331-ecc_panic-v2-0-9e40d0f64f7a@debian.org

Changes in v2:
- Panic on MF_MSG_KERNEL, MF_MSG_KERNEL_HIGH_ORDER and MF_MSG_UNKNOWN
  instead of MF_MSG_GET_HWPOISON.
- Report MF_MSG_KERNEL for reserved pages when get_hwpoison_page() fails
  instead of MF_MSG_GET_HWPOISON.
- Link to v1: https://patch.msgid.link/20260323-ecc_panic-v1-0-72a1921726c5@debian.org

---
Breno Leitao (4):
      mm/memory-failure: report MF_MSG_KERNEL for reserved pages
      mm/memory-failure: add panic option for unrecoverable pages
      Documentation: document panic_on_unrecoverable_memory_failure sysctl
      selftests/mm: regression test for panic_on_unrecoverable_memory_failure

 Documentation/admin-guide/sysctl/vm.rst     |  65 ++++++++++++++++++
 mm/memory-failure.c                         | 102 +++++++++++++++++++++++++++-
 tools/testing/selftests/mm/memory-failure.c |  84 +++++++++++++++++++++++
 3 files changed, 250 insertions(+), 1 deletion(-)
---
base-commit: 4c406406070d57dbefeaad149181785330c23f92
change-id: 20260323-ecc_panic-4e473b83087c

Best regards,
--  
Breno Leitao <leitao@debian.org>

