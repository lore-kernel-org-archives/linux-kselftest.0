Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC92499F31;
	Mon, 19 Oct 2026 08:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399422; cv=none; b=GovAG6Bm2b8EQqcTEqRJsAAajghUTTIapOWbZf9sUprRI3d0F2jxr4ekHa1zLLkqIAyQx30nIKoQIXWwQAWEDOz7dJuUjym3oGyK+b5PYceugdGHe1x/68wmqyFIoFyHFTUFw3O4E+x0UjSRFDvDHVdav5WxmIPXxt4ohxfLneM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399422; c=relaxed/simple;
	bh=MhBi0tOU15TuSVtmzTAWS1mGzQCHjqPVTw8i0JLakIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dvg5/YSx/+O8t7KkOMjLdBtcjNoci+XwUWQRE/QR533c+sDoD2VI7B5yQie4XxekyiwFmVgyf+tPBqr/fzVFWU+OLWGhSrd1s/eTKJ0Rw2LSJybWs8YXGgXCJLY2lATMZyvpNOY4RqoNx3kQsaYbkQyHnCtMExf2sy/jDazPpbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PSqmWsFb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PSqmWsFb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94B2F1F000C4;
	Mon, 19 Oct 2026 08:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792399420;
	bh=fy26aZDFXGwTKUczlKhKEkeMGJBaoVyPi8d9QO/iEBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PSqmWsFbqFiDSBjC/53uW07HkSAkEyNdAnioC4t11fPnuQQjqwXCsz5QZxWNzvtKu
	 s4NT+DDvVz7C79CnHxcyBjU0f4l1lKcg5JTEH0QsCEE+8STWWee65KsizEA7dyjTZ8
	 rkrYYVcPNOk4KIz5Z/pwmWfNg68KxagnnLostsYKXPvc2hAccesbB0SaU8mDWIty5O
	 I9JdWqLvfLfMIr1zOwfQVK1YEFlz4FRAdFPltQBGqL4TTTSOZTSQWBe8UD0uxFlE/K
	 QqHRKz9awTFYvfx42xk5lPAuTxtswSLDF0anNn02GSjw67Aj0OcQsuvULQ0XP4ToYp
	 XHWqil432b9Uw==
Date: Mon, 19 Oct 2026 11:43:28 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, kuba@kernel.org,
	enelsonmoore@gmail.com, bp@alien8.de, shuah@kernel.org,
	david@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org,
	ljs@kernel.org, mhocko@suse.com, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org, vbabka@kernel.org,
	dapeng1.mi@linux.intel.com, linux-kernel@vger.kernel.org,
	corbet@lwn.net, surenb@google.com, kexec@lists.infradead.org,
	pratyush@kernel.org, rdunlap@infradead.org, elver@google.com,
	graf@amazon.com, lirongqing@baidu.com, liam@infradead.org,
	jlayton@kernel.org
Subject: Re: [PATCH v1 0/8] kho: add read-only Kexec Handover mode
Message-ID: <atXYMK5tmW8f23gs@kernel.org>
References: <20261019021111.990394-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019021111.990394-1-pasha.tatashin@soleen.com>

Hi Pasha,

Some brief comments before digging in.

On Sun, Oct 18, 2026 at 10:11:03PM -0400, Pasha Tatashin wrote:
> This series introduces a read-only Kexec Handover mode, enabled at boot
> via 'kho_ro=<pa>' pointing to the physical address of the KHO FDT.
> 
> In standard KHO, the target kernel takes ownership of preserved memory
> during early boot, initializes struct pages for preserved folios, and
> reclaims KHO metadata and preserved pages back into the page allocator
> as they are restored.
> 
> In some scenarios (such as a caretaker, inspection kernel, firmware), a
> kernel needs to inspect and consume preserved KHO subtrees, radix trees,
> and serialized metadata without taking ownership of or modifying the KHO
> state, leaving the preserved KHO tree intact for a subsequent kernel.
> In this mode, the KHO physical memory lies outside the kernel's direct
> map.
> 
> To support this cleanly without duplicating KHO traversal logic:
> - Patch 1 exposes the physical address of the outgoing KHO FDT via
>   /sys/kernel/debug/kho/out/fdt_phys so userspace tooling can pass it
>   to a 'kho_ro=<pa>' kernel.

We already pass the physical address, why adding a boolean kho_ro is not
enough?

> - Patch 2 moves the shared radix-tree key encoding and indexing,
>   vmalloc flag conversion, and FDT validation and subtree lookup helpers
>   to kernel/liveupdate/kexec_handover_internal.h so they can be shared
>   between standard and read-only KHO.
> - Patch 3 hardens kho_restore_vmalloc() by introducing
>   kho_vmalloc_validate() in kernel/liveupdate/kexec_handover_internal.h
>   to validate the preservation metadata header and flags before
>   restoring the vmalloc area.

The diff for kexec_handover_internal.h 

>  kernel/liveupdate/kexec_handover_internal.h   | 171 +++++++-

seems a wee too large. Maybe some of this should move to a .c file?

> - Patch 4 avoids modifying ser->next and bs->head_pa in kho_block_add()
>   and kho_block_set_shrink_one() when operating on an incoming block
>   set, as the chain is already linked and incoming blocks must not be
>   modified in KHO read-only mode.
> - Patch 5 adds CONFIG_KEXEC_HANDOVER_READONLY and
>   kernel/liveupdate/kexec_handover_ro.c. When booted with
>   'kho_ro=<pa>', preserved KHO metadata is mapped read-only
>   (PAGE_KERNEL_RO), with the FDT and radix-tree nodes mapped lazily on
>   first visit and kept cached, providing read-only implementations of
>   kho_retrieve_subtree(), kho_restore_vmalloc(),
>   kho_ro_lookup_folio_order(), kho_ro_map_folio(), and kho_ro_unmap().

What are the expected users of these APIs?

> - Patch 6 updates kho_block to map incoming serialized blocks read-only
>   via kho_ro_map_folio() and unmap them via kho_ro_unmap() in read-only
>   KHO mode.
> - Patches 7 and 8 extend test_kho and tools/testing/selftests/kho/vmtest.sh
>   to test read-only KHO handover when preserved memory lies outside
>   the boot kernel's initial memory range on both x86_64 and arm64.
> 
> Pasha Tatashin (8):
>   kho: expose physical address of outgoing FDT
>   kho: move radix tree, vmalloc, and FDT helpers to internal header
>   kho: validate preservation metadata in kho_restore_vmalloc()
>   kho: do not modify incoming serialized blocks
>   kho: add read-only Kexec Handover mode
>   kho: support read-only KHO mode in kho_block
>   kho: test: support read-only KHO mode in test_kho
>   selftests: kho: add read-only KHO test to vmtest.sh
> 
>  .../admin-guide/kernel-parameters.txt         |   6 +
>  Documentation/admin-guide/mm/kho.rst          |   3 +
>  include/linux/kexec_handover.h                |  53 ++-
>  kernel/liveupdate/Kconfig                     |  16 +
>  kernel/liveupdate/Makefile                    |   4 +-
>  kernel/liveupdate/kexec_handover.c            | 142 +------
>  kernel/liveupdate/kexec_handover_debugfs.c    |  22 +-
>  kernel/liveupdate/kexec_handover_internal.h   | 171 +++++++-
>  kernel/liveupdate/kexec_handover_ro.c         | 378 ++++++++++++++++++
>  kernel/liveupdate/kho_block.c                 |  92 +++--
>  lib/Kconfig.debug                             |   2 +-
>  lib/test_kho.c                                |  68 +++-
>  tools/testing/selftests/kho/arm64.conf        |   3 +
>  tools/testing/selftests/kho/init.c            |  38 +-
>  tools/testing/selftests/kho/vmtest.sh         | 103 +++--
>  tools/testing/selftests/kho/x86.conf          |   1 +
>  16 files changed, 881 insertions(+), 221 deletions(-)
>  create mode 100644 kernel/liveupdate/kexec_handover_ro.c
> 
> 
> base-commit: 27be83a12b246b6b3783e7d3ac5c378ff7520f25
> -- 
> 2.56.0.176.g3575e65682-goog
> 

-- 
Sincerely yours,
Mike.
