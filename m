Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794778017;
	b=w1INWbqA1u/YAUJR2zonnbFr15celdCl8InoyQdHh/ccP1M6xGdqX/Q7CA9homMh+hX1
	 dLxfjhtRjkEo0dyhf3ENUoP4aGXHjxXp0y9eXGHGIfb1hcnoahxfQJfPx31WiFrnsfhez
	 TFZF5bLrJbQu1OYuyYvHjbEGkcFqJhYgw+Uzu24zQc6SKMPN+JyAUuxwMeWC1DdY9MzP0
	 xwDdb7hDAK8LmtH50+lth+dWrjtpX+sTTYjFi5qhpBzbvtIQmjfpvtEZfKT3CvLpCtJPh
	 nfJgEOT56LofRlL1yq6UAEz+Vtws3qg8R7XAKDx2kYhFr5TK5BVu60xM5sadFkGJctg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794778017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Content-Type;
	bh=Nwu6vL4nnJhyf28I3Hp9RT6yqlvZkPwzRk4lPxIAvmQ=;
	b=IrdNYoIvXHF0ki1n9pa7KqYxTZ2TkCXGMdehaPaPvw6/bk0AuwlYD+Uxw387MXz/MLsk
	 OousfybV+jfwaEWOvgdUJKVS2HZOuFdUbwT4JLYVNzhMeg2rPs3rphQO1h01Wa+0TFgpw
	 kZCzSz4zeA1zCUPuI33LShzlyqhVmVQwI94FbzjBmSj8dS8+A/iEEw9yC3q3+M/Bw/+/Z
	 Xg6/G7TgyDiDDd4OUFzumig+Ajn0h+o7YErV4+vjnjM5fqDlY4Hg7oDt1xVW1t3ivqILl
	 DXUfEWLrXVyK2ha8GVM6uG+dWfdW+8C8r7Q8A4nWaQvA5DMwpz2Km6GMj0DxrYQMAJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hWAteIYt;
	arc=none smtp.remote-ip=209.85.218.72
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638C8606A323
	for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 21:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 638C8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hWAteIYt
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c50715e8328so197198866b.0
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 13:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794778016; x=1795382816; darn=vger.kernel.org;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nwu6vL4nnJhyf28I3Hp9RT6yqlvZkPwzRk4lPxIAvmQ=;
        b=hWAteIYtvjbr4pgr1FdtepfuwZdmJPP3uv3vfCM9OyjEy6liBMXxN6ZgyLpgTH7Fd0
         VZTBP8jaCtsA2mroH+cQLnLoCPrUjJZ0ypMHvNZ/6xpNZD7oJ/trT/Hvu7AcVvTwUWVO
         Fd7ekI244XQYWqbu3iQtdhdyn0P2M/5LDloZjIlbq6eETBFUNYUApcnMa26EIpxWYlNf
         R0u4sKMygkbPoJo+MvYL0+Pv1EZ8LKLBT1qcDYTK3OHhjh3oEBZVa5pB9PHSyOMJZ0iC
         vBYzYBzptLDV5FL0Ot7oM4r9BcTJiYGi7vUDoZzVvPZ6h2ktUBJBUgGzQJzP6VW3kQGo
         nSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794778016; x=1795382816;
        h=content-type:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nwu6vL4nnJhyf28I3Hp9RT6yqlvZkPwzRk4lPxIAvmQ=;
        b=AvMS5UZcO/+TE9h65wL1wkRVjkHNYxpj67RePOwPHVWoEDwOcHDDc71ni5NVRNp6y1
         ApSAfTanZw5pr3uVofywWaOSP1Y79+CTR8H2UCV84USjswObKSObqoX8FTQ694doA9zy
         pj43OkdqHDht+qqVYKNF5aJeby4jqH5+XJn7LcYeuJFlE4dJXndSM45XIPWQANN4SZAu
         CGQRSShuwcbZEUdwttC0+hCSQxAXzRrM+jvqB5TK0qUoOiskfzod203+mhJkii1qSIUC
         LgRx7XExK4LINVbPPDmlG5RhR6am4Knve7cXHh+t82999Zu8mSsHFj+BcJYnAt09Dm47
         NJUg==
X-Forwarded-Encrypted: i=1; AL+hErFIy6SFXozpdizSN6sBn+N9pCvJIBlNj8HqJwI9uBojL1pUjt+DV53taqePErmANOdn2t9h+doosxHDw/RifL4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8rXJzkmUlGwrUHsYBR1pMW4HnyO64sFAA5DDiYryZ+Q1sRnZj
	PrVJQC5qGvBzdLoQgCpwl1RbZxUM4Ry+dij8euZzYPgkKbay/gnNI3RZ6OBqoYjwVbCXq2xzHW2
	hUBMEvk6LO4IWC73AUQ==
X-Received: from ejgh12.prod.google.com ([2002:a17:906:3c0c:b0:c33:b3b5:5260])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:1b2a:b0:c41:285a:46a9 with SMTP id a640c23a62f3a-c5096847651mr661397666b.46.1794778015420;
 Sun, 15 Nov 2026 13:26:55 -0800 (PST)
Date: Sun, 15 Nov 2026 21:26:54 +0000
In-Reply-To: <20261025174017.3870481-1-pasha.tatashin@soleen.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261025174017.3870481-1-pasha.tatashin@soleen.com>
Message-ID: <9huzzev9n5up.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v2 0/9] kho: add read-only Kexec Handover mode
From: tarunsahu@google.com
To: Pasha Tatashin <pasha.tatashin@soleen.com>, linux-kselftest@vger.kernel.org, 
	rppt@kernel.org, kuba@kernel.org, enelsonmoore@gmail.com, bp@alien8.de, 
	shuah@kernel.org, david@kernel.org, akpm@linux-foundation.org, 
	linux-mm@kvack.org, ljs@kernel.org, mhocko@suse.com, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, vbabka@kernel.org, 
	dapeng1.mi@linux.intel.com, linux-kernel@vger.kernel.org, corbet@lwn.net, 
	surenb@google.com, kexec@lists.infradead.org, pratyush@kernel.org, 
	rdunlap@infradead.org, elver@google.com, graf@amazon.com, 
	lirongqing@baidu.com, liam@infradead.org, jlayton@kernel.org
Content-Type: text/plain; charset="UTF-8"


IIUC, this series will be pciked after the kho feature flags [1]
Should it be rebased on top of [1]?

[1]: https://lore.kernel.org/all/20261110050202.529473-1-tarunsahu@google.com/

~Tarun

Pasha Tatashin <pasha.tatashin@soleen.com> writes:

> This series introduces a read-only Kexec Handover mode, enabled at boot
> via 'kho_ro=<pa>' pointing to the physical address of the KHO FDT.
>
> In standard KHO, the outgoing kernel shuts down or serializes all
> devices into LUO state, releases machine control, and passes the KHO
> FDT physical address through the kexec_file_load() reboot path to the
> next kernel, which becomes the sole "Machine Owner" (MO), initializes
> struct pages for preserved folios during early boot, and reclaims KHO
> metadata and preserved pages back into the page allocator as they are
> restored.
>
> In the "Linux Caretaker" (LC) model (as well as inspection kernels or
> firmware), a minimal LC kernel runs concurrently on dedicated CPUs
> offlined from the MO scheduler while MO is still active or undergoing a
> standard KHO-preserved kexec reboot (Live Update). LC is given
> read-only access to KHO so a minimal VMM inside LC can keep VMs
> responsive (<30ms VM blackout time) by servicing software-only, fully
> virtualized devices (such as virtio-console, pvpanic, virtio-rng, etc.)
> that do not require host hardware interrupts or global machine state,
> while leaving the preserved KHO tree intact for the incoming MO kernel
> to retrieve normally once it boots.
>
> LC is never MO: it has no PCI support, does not handle device
> interrupts, and is booted inside a small LUO-preserved memfd region
> (e.g., ~128MB of RAM on a host with terabytes of memory). Because LC's
> direct map only covers its own small memory footprint (both for
> isolation and to avoid struct page overhead for host memory), the KHO
> FDT, radix tree, and preserved memory all reside outside of LC's direct
> map. Furthermore, because LC is configured and launched from userspace
> while MO is still running rather than through a kexec reboot handoff
> from a shutting-down kernel, userspace reads the KHO FDT physical
> address from /sys/kernel/debug/kho/out/fdt_phys and explicitly passes
> 'kho_ro=<pa>' on LC's kernel command line.
>
> Both CONFIG_KEXEC_HANDOVER and CONFIG_KEXEC_HANDOVER_READONLY can be
> compiled into the same kernel image, with the active mode selected at
> boot via the kernel command line ('kho=on' vs 'kho_ro=<pa>'; passing
> 'kho_ro=<pa>' disables regular KHO).
>
> Overview of the series:
> - Patch 1 exposes the physical address of the outgoing KHO FDT via
>   /sys/kernel/debug/kho/out/fdt_phys so userspace tooling can pass it
>   to a 'kho_ro=<pa>' kernel.
> - Patch 2 moves the shared radix-tree key encoding, indexing, leaf
>   lookup (kho_radix_find_leaf()), FDT validation, and
>   kho_retrieve_subtree() helpers into a shared
>   kernel/liveupdate/kexec_handover_common.c compilation unit with
>   declarations in kernel/liveupdate/kexec_handover_internal.h, while
>   also checking that fdt_totalsize(fdt) does not exceed PAGE_SIZE in
>   kho_check_fdt() and using get_unaligned() for 64-bit FDT property
>   reads in kho_retrieve_subtree().
> - Patch 3 hardens kho_restore_vmalloc() and factors out shared vmalloc
>   helpers by introducing kho_vmalloc_validate() and kho_vmalloc_walk()
>   in kernel/liveupdate/kexec_handover_common.c to validate the
>   preservation metadata header and walk the chunk list.
> - Patch 4 avoids modifying ser->next and bs->head_pa in kho_block_add()
>   and kho_block_set_shrink_one() when operating on an incoming block
>   set, as the chain is already linked and incoming blocks must not be
>   modified in KHO read-only mode.
> - Patch 5 adds CONFIG_KEXEC_HANDOVER_READONLY and
>   kernel/liveupdate/kexec_handover_ro.c. When booted with
>   'kho_ro=<pa>', the KHO FDT is mapped and validated once in an
>   early_initcall, and radix-tree nodes, leaves, and folio/vmalloc
>   mappings are cached on first visit in a unified RCU-protected hash
>   table for the lifetime of the read-only KHO kernel, providing
>   kho_is_ro(), kho_ro_lookup_folio_order(), kho_ro_map_folio(), and
>   kho_ro_map_vmalloc().
> - Patch 6 wires read-only KHO mode into KHO core (kho_populate(),
>   kho_memory_init(), and kho_retrieve_subtree()).
> - Patch 7 updates kho_block to map incoming serialized blocks read-only
>   via kho_ro_map_folio() in read-only KHO mode.
> - Patches 8 and 9 extend test_kho and tools/testing/selftests/kho/vmtest.sh
>   to build a single kernel with both CONFIG_KEXEC_HANDOVER=y and
>   CONFIG_KEXEC_HANDOVER_READONLY=y and test both standard KHO and
>   read-only KHO handover when preserved memory lies outside the boot
>   kernel's initial memory range on x86_64 and arm64.
>
> This series is based on liveupdate/next commit 27be83a12b24 ("Merge
> branch 'lu-pci-preservation' into next").
>
> Changelog:
> v2:
> - Expand the cover letter with the LC architecture, explaining why
>   'kho_ro=<pa>' takes the FDT physical address on the command line and
>   describing the expected users of the read-only KHO APIs (Suggested by
>   Mike Rapoport).
> - Patch 2 (Suggested by Mike Rapoport):
>   - Move the shared radix-tree, FDT, and subtree retrieval helpers into
>     a dedicated kernel/liveupdate/kexec_handover_common.c file instead
>     of static inline functions in
>     kernel/liveupdate/kexec_handover_internal.h, and factor out
>     kho_radix_find_leaf() for radix leaf lookup.
>   - Check that fdt_totalsize(fdt) does not exceed PAGE_SIZE in
>     kho_check_fdt(), drop the "setup: " log prefix from FDT validation
>     warnings, and use get_unaligned() when reading 64-bit FDT properties
>     in kho_retrieve_subtree().
> - Patch 3:
>   - Move kho_flags_to_vmalloc() to kexec_handover_common.c alongside
>     kho_vmalloc_validate() and add a shared kho_vmalloc_walk() chunk
>     walker used by both kho_restore_vmalloc() and kho_ro_map_vmalloc().
> - Patches 5 and 6:
>   - Allow CONFIG_KEXEC_HANDOVER and CONFIG_KEXEC_HANDOVER_READONLY to be
>     compiled into the same kernel image and select the active mode via
>     the kernel command line ('kho_ro=<pa>' forces regular KHO disabled).
>   - Split the KHO core integration (kho_populate(), kho_memory_init(),
>     and kho_retrieve_subtree()) into a separate patch (Patch 6) so
>     Patch 5 only introduces the read-only KHO backend.
>   - Map and validate the KHO FDT and preserved-memory-map root once in
>     an early_initcall so kho_ro_get_fdt() and kho_retrieve_subtree() do
>     not sleep or map lazily.
>   - Replace kho_ro_restore_vmalloc() (which allocated RAM and copied
>     pages) with kho_ro_map_vmalloc() to map preserved kho_vmalloc
>     regions read-only in place using kho_vmalloc_walk().
>   - Cache radix-tree node, leaf, folio, and vmalloc mappings in a
>     unified RCU-protected hash table (kho_ro_map_ht) keyed by address,
>     size, and protection for the lifetime of the read-only KHO kernel,
>     and drop kho_ro_unmap().
> - Patch 9:
>   - Build the kernel and initrd only once in vmtest.sh with both
>     CONFIG_KEXEC_HANDOVER=y and CONFIG_KEXEC_HANDOVER_READONLY=y
>     enabled, running both the standard KHO test and the read-only KHO
>     test on the same kernel image.
> Link: https://lore.kernel.org/all/20261019021111.990394-1-pasha.tatashin@soleen.com/ # v1
>
> Pasha Tatashin (9):
>   kho: expose physical address of outgoing FDT
>   kho: move radix tree and FDT helpers to common file
>   kho: validate preservation metadata in kho_restore_vmalloc()
>   kho: do not modify incoming serialized blocks
>   kho: add read-only Kexec Handover mode
>   kho: support read-only KHO mode in KHO core
>   kho: support read-only KHO mode in kho_block
>   kho: test: support read-only KHO mode in test_kho
>   selftests: kho: add read-only KHO test to vmtest.sh
>
>  .../admin-guide/kernel-parameters.txt         |   8 +
>  Documentation/admin-guide/mm/kho.rst          |   3 +
>  Documentation/core-api/kho/index.rst          |   6 +
>  include/linux/kexec_handover.h                |  44 +-
>  kernel/liveupdate/Kconfig                     |  10 +
>  kernel/liveupdate/Makefile                    |   3 +-
>  kernel/liveupdate/kexec_handover.c            | 284 +++---------
>  kernel/liveupdate/kexec_handover_common.c     | 298 ++++++++++++
>  kernel/liveupdate/kexec_handover_debugfs.c    |  22 +-
>  kernel/liveupdate/kexec_handover_internal.h   |  47 +-
>  kernel/liveupdate/kexec_handover_ro.c         | 429 ++++++++++++++++++
>  kernel/liveupdate/kho_block.c                 |  78 +++-
>  lib/Kconfig.debug                             |   2 +-
>  lib/test_kho.c                                |  71 ++-
>  tools/testing/selftests/kho/arm64.conf        |   1 +
>  tools/testing/selftests/kho/init.c            |  38 +-
>  tools/testing/selftests/kho/vmtest.sh         |  65 ++-
>  tools/testing/selftests/kho/x86.conf          |   1 +
>  18 files changed, 1121 insertions(+), 289 deletions(-)
>  create mode 100644 kernel/liveupdate/kexec_handover_common.c
>  create mode 100644 kernel/liveupdate/kexec_handover_ro.c
>
>
> base-commit: 27be83a12b246b6b3783e7d3ac5c378ff7520f25
> -- 
> 2.56.0.307.g5fe7bd680c-goog
