Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA0337CD2B
	for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 11:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610257; cv=pass; b=GE3Dip0GS8aqAf1e48GEtJpA2hOL0cfvI81LLiyxNKpdzK/7E+RRaovTG7ZPwCiVxskqhsLTQ/gZOrhIKJx6TUYBO1q8NWwDha90Gyi0HxWbF5jGVc65cJDl6J5RIGHaK52BCrhHnaScToNc7IfLjTrAS6BNgUZg4lBgTY9ZWQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610257; c=relaxed/simple;
	bh=sc+ctbMEtPXqnNW2VqGgYbEiSZNF9yzcW9CQDAxrVCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cDabPmwlMzXo64stARIW6TrOPv5aO9f53nouu82XV1eZmKSR/pgqWwvC+rZNeDgCI0/3gQcIziD7zHPoQAufz64uc2HoM5pB6D0zKESMMAnevyfLchi2KRrmonkzPU9HdIV/oD2zIZzkS+1FxtR1RYK7Sjpp9yDw3KuC6ZbYo4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LlOi26wG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YM/5coRF; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LlOi26wG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YM/5coRF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781610255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pe0GDMYgO8x6PXpCGVU4s0eHlaJU+A8ohfueQbK3R8s=;
	b=LlOi26wGCAL9dhd9CbVA/bSm2s83AETlag50uAX14vlZte+mMwUID/EyjPEcg2F3Llm9+7
	3JZhcN53eyhQHexz2G6X5Zqnci2Gq3nGtAJ0zZmGO7y/8RF38m0XAhO3zvvPkzW2OJ9PGs
	F6ORNRQn1+TuDMaV6ccWYYk8O22S2CU=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-JMX0EOVBPOqaTbVzTip3lw-1; Tue, 16 Jun 2026 07:44:13 -0400
X-MC-Unique: JMX0EOVBPOqaTbVzTip3lw-1
X-Mimecast-MFC-AGG-ID: JMX0EOVBPOqaTbVzTip3lw_1781610253
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7ebbe5b410eso73377637b3.2
        for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 04:44:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781610253; cv=none;
        d=google.com; s=arc-20240605;
        b=jMNpvERzWAc10VpBgQhGJHNofloP/AnXDgUFmFTHHeuqxOm+anmjhdaIN7bxQTS6kh
         7rSBSbvz+QkDSBmg9pawnDKaI9vjnqDqmpQKoPvd9vXpvUdyiCJr6kCpRr4YYmH/dATV
         yUTiuDtaL3IWoq1AuoCcLTQVU7xs2Sfu+irzwOPGMEdwE6NGlTlVXAlKDfq274gHxB3u
         PwY3JjMLKfebyu6Kujk0dVjfi8ZVv/QXHU7RyusopboadnuvDPDtYzCVWIyv1Wf8mA1s
         bY/ZTbzRf1bI7X+ywHxJKDJ8eF7vzatGGsuFqr+4CK/Y0udX6wTCzcUN271Mw4+o4Hap
         E2eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pe0GDMYgO8x6PXpCGVU4s0eHlaJU+A8ohfueQbK3R8s=;
        fh=O1LXrsu3vH6N0753DZOd3Af7LxqKxBgg2NvGSl1STLk=;
        b=f1qoV4YwbQu/pXNkkMBMQn/NSjmTNdp69WUcKiLODdGLOPfgXXCfEsW2ejpn1qHA2W
         2kdKY4wp7MaAwrdWBWCX8zv/eEV7qju1b2YmjlVUp57ZvZU7kHsYuCu+x8xJ0L8B0Rv2
         B2oZcE3Bk3R784G55cumTPfs/+o9FYTatVqvd0Sxbr5Icx94m2LgEQyK+31QzbBPbyXd
         QgRDVpbBwjWwB6Q06HIuEq0ZZJIpv1qvXmtnWbraJ45k1hyX++hbk9B6qz6HWqdM6xDf
         HbiE/IHR8t4T+gKuOss3gxv5YDpnnJlrEkxG3q+Wy9BrrGdJQIGt4K+9bogJFIIHCIbt
         H2BA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781610253; x=1782215053; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pe0GDMYgO8x6PXpCGVU4s0eHlaJU+A8ohfueQbK3R8s=;
        b=YM/5coRF+FuIC4lhQ8XsiuLR22aUd75M8/Ta4CtB+dwfwcrrOYqxZ5cGoxlKPuFBLA
         Vj3xeeMsnUXIITYxu63edzs2ax4lomDcDGfG/h1gPeMqh7nR0ZHplYmYCg4GZsFrI3ga
         1qQzINu1htS8wjV91IhiwfvplUtXo0MD3mKxdwubatKQP6YfOxvRUL3xOcoU+umwWRph
         rGvfqE6Uxfbdx34w1IAf/14n1VvPfDLB41wUMm7lzaHq+BVxY42klmNwkLyyASpFg4nZ
         4wjzPDWaHGtWT2JmbV3gguNWJNlu7z8deEwqD6ym7BsO+bMI9KAN5ZLwA2dtAcYxtedB
         Umbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781610253; x=1782215053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pe0GDMYgO8x6PXpCGVU4s0eHlaJU+A8ohfueQbK3R8s=;
        b=lEo46V/XybxrImQYgoX3dnkSl63+RbSEnoQt7K1NRdiYkAcyMKqaEUzylVQ97Idrzp
         L0rNvkgJ0gseCRKHiEkDaRj0Iyg7GrMGJ2apyQOA5p5EcvfdyhgzwUBBzB8UZjssb/Yq
         AY1adJBr39A6RdlAFEY4Iv2r4xoUuIV8xqPUwgfVNhgBSo5mX4oDJjgmA7pqMNdQWlha
         gT8LT4qExlqGJ2E5NaI8SmIrnI8g3NaIvH/wtvw65mfxFHS31C0BXnWTJ3L1GGpoUXoe
         nRq1oE78jSM2tg4vJ6uQGu9Kxux0aWyf7PDIfGuwp+OOYawjQD5ZqnGEavsfpKBsnuNW
         OvBg==
X-Forwarded-Encrypted: i=1; AFNElJ87trGczP/4tA2D7GV84BL9NaPTlViabikZAl73THwAUGHBFaABkgfRJIUtUECBgQaVie6++BDCXMiloI4m6Ms=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDstR5lmRCZmx7+Hi8VADzXwj35F+OV+LWXBYyp8jVJif7Pcnn
	mCUweekz14jM+ZpYf40S+Jw+RBkck0ovqsnZwkDL0mJnv0swspppnfR9w8Gs0QCsX8eE19g9wB/
	4nbAGO1MaDyw/EGUfdzDEeEKmQnMwzvZ5FwGGWyrW5HJplOeO7d3/7za5yPK1su6vUcE7w2N7bf
	4unbOtGy29BZ+M2cz6QFfzSzViE44qtQyMW3xSkLI6KpsX
X-Gm-Gg: AfdE7cmHWCGOBy58H5YRLtsLRWN1x/NHCMoWUERneFkS9apWSr8C3F8j4vWVKd6HF28
	Oba1SpbAZBm/fw5aBt4yBt8h2Asu+Uz3j1jdqxydmCkqHuNyHaWoUTz9ZMze2qinN1alNwEXWwx
	rSX7vXqB3m9ODIfm7lFO715HoX/61m93C3G7MRoE23V60i4u8Q1lFR7+6cqC1nsC3NsWbwejqHd
	A2zBw==
X-Received: by 2002:a05:690c:e3ef:b0:7ef:dfa0:c6ac with SMTP id 00721157ae682-7fcfd03fb31mr31669327b3.2.1781610253045;
        Tue, 16 Jun 2026 04:44:13 -0700 (PDT)
X-Received: by 2002:a05:690c:e3ef:b0:7ef:dfa0:c6ac with SMTP id
 00721157ae682-7fcfd03fb31mr31668877b3.2.1781610252538; Tue, 16 Jun 2026
 04:44:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260515-kunit_add_support-v13-0-18ee42f96e7b@redhat.com>
In-Reply-To: <20260515-kunit_add_support-v13-0-18ee42f96e7b@redhat.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 16 Jun 2026 13:44:01 +0200
X-Gm-Features: AVVi8CdNVq7XqceKqYuD-I39NjX_b_RMajVLLaSPX-I7u2X3eoOcSjHF2FKnres
Message-ID: <CADSE00+typ3Zi5Vf0Z276+e0G7PuS7mt7oA9h5awBu3YgYKw0g@mail.gmail.com>
Subject: Re: [PATCH v13 0/4] kunit: Add support for suppressing warning backtraces
To: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, workflows@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	peterz@infradead.org, Alessandro Carminati <acarmina@redhat.com>, 
	Guenter Roeck <linux@roeck-us.net>, Kees Cook <kees@kernel.org>, 
	Linux Kernel Functional Testing <lkft@linaro.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Dan Carpenter <error27@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 2:29=E2=80=AFPM Albert Esteve <aesteve@redhat.com> =
wrote:
>
> Some unit tests intentionally trigger warning backtraces by passing bad
> parameters to kernel API functions. Such unit tests typically check the
> return value from such calls, not the existence of the warning backtrace.
>
> Such intentionally generated warning backtraces are neither desirable
> nor useful for a number of reasons:
> - They can result in overlooked real problems.
> - A warning that suddenly starts to show up in unit tests needs to be
>   investigated and has to be marked to be ignored, for example by
>   adjusting filter scripts. Such filters are ad hoc because there is
>   no real standard format for warnings. On top of that, such filter
>   scripts would require constant maintenance.
>
> One option to address the problem would be to add messages such as
> "expected warning backtraces start/end here" to the kernel log.
> However, that would again require filter scripts, might result in
> missing real problematic warning backtraces triggered while the test
> is running, and the irrelevant backtrace(s) would still clog the
> kernel log.
>
> Solve the problem by providing a means to suppress warning backtraces
> originating from the current kthread while executing test code.
> Since each KUnit test runs in its own kthread, this effectively scopes
> suppression to the test that enabled it, without requiring any
> architecture-specific code.
>
> Overview:
> Patch#1 Introduces the suppression infrastructure integrated into
>         KUnit's hook mechanism.
> Patch#2 Adds selftests to validate the functionality.
> Patch#3 Demonstrates real-world usage in the DRM subsystem.
> Patch#4 Documents the new API and usage guidelines.
>
> Design Notes:
> Suppression is integrated into the existing KUnit hooks infrastructure,
> reusing the kunit_running static branch for zero overhead
> when no tests are running. The implementation lives entirely in the
> kunit module; only a static-inline wrapper and a function pointer
> slot are added to built-in code.
>
> Suppression is checked at three points in the warning path:
> - In `warn_slowpath_fmt()` (kernel/panic.c), for architectures without
>   __WARN_FLAGS. The check runs before any output, fully suppressing
>   both message and backtrace.
> - In `__warn_printk()` (kernel/panic.c), for architectures that define
>   __WARN_FLAGS but not their own __WARN_printf (arm64, loongarch,
>   parisc, powerpc, riscv, sh). The check suppresses the warning message
>   text that is printed before the trap enters __report_bug().
> - In `__report_bug()` (lib/bug.c), for architectures that define
>   __WARN_FLAGS. The check runs before `__warn()` is called, suppressing
>   the backtrace and stack dump.
>
> To avoid double-counting on architectures where both `__warn_printk()`
> and `__report_bug()` run for the same warning, the hook takes a bool
> parameter: true to increment the suppression counter, false to suppress
> without counting.
>
> The suppression state is dynamically allocated via kunit_kzalloc() and
> tied to the KUnit test lifecycle via `kunit_add_action()`, ensuring
> automatic cleanup at test exit. Writer-side access to the global
> suppression list is serialized with a spinlock; readers use RCU.
>
> Two API forms are provided:
> - kunit_warning_suppress(test) { ... }: scoped blocks with automatic
>   cleanup. The suppression handle is not accessible outside the block,
>   so warning counts (if needed) must be checked inside. Multiple
>   sequential suppression blocks are allowed.
> - kunit_start/end_suppress_warning(test): direct functions that return
>   an explicit handle. Use when the handle needs to be retained, or passed
>   across helpers. Multiple sequential suppression blocks are allowed.
>
> This series is based on the RFC patch and subsequent discussion at
> https://patchwork.kernel.org/project/linux-kselftest/patch/02546e59-1afe-=
4b08-ba81-d94f3b691c9a@moroto.mountain/
> and offers a more comprehensive solution of the problem discussed there.
>
> Changes since RFC:
> - Introduced CONFIG_KUNIT_SUPPRESS_BACKTRACE
> - Minor cleanups and bug fixes
> - Added support for all affected architectures
> - Added support for counting suppressed warnings
> - Added unit tests using those counters
> - Added patch to suppress warning backtraces in dev_addr_lists tests
>
> Changes since v1:
> - Rebased to v6.9-rc1
> - Added Tested-by:, Acked-by:, and Reviewed-by: tags
>   [I retained those tags since there have been no functional changes]
> - Introduced KUNIT_SUPPRESS_BACKTRACE configuration option, enabled by
>   default.
>
> Changes since v2:
> - Rebased to v6.9-rc2
> - Added comments to drm warning suppression explaining why it is needed.
> - Added patch to move conditional code in arch/sh/include/asm/bug.h
>   to avoid kerneldoc warning
> - Added architecture maintainers to Cc: for architecture specific patches
> - No functional changes
>
> Changes since v3:
> - Rebased to v6.14-rc6
> - Dropped net: "kunit: Suppress lock warning noise at end of dev_addr_lis=
ts tests"
>   since 3db3b62955cd6d73afde05a17d7e8e106695c3b9
> - Added __kunit_ and KUNIT_ prefixes.
> - Tested on interessed architectures.
>
> Changes since v4:
> - Rebased to v6.15-rc7
> - Dropped all code in __report_bug()
> - Moved all checks in WARN*() macros.
> - Dropped all architecture specific code.
> - Made __kunit_is_suppressed_warning nice to noinstr functions.
>
> Changes since v5:
> - Rebased to v7.0-rc3
> - Added RCU protection for the suppressed warnings list.
> - Added static key and branching optimization.
> - Removed custom `strcmp` implementation and reworked
>   __kunit_is_suppressed_warning() entrypoint function.
>
> Changes since v6:
> - Moved suppression checks from WARN*() macros to warn_slowpath_fmt()
>   and __report_bug().
> - Replaced stack-allocated suppression struct with kunit_kzalloc() heap
>   allocation tied to the KUnit test lifecycle.
> - Changed suppression strategy from function-name matching to task-scoped=
:
>   all warnings on the current task are suppressed between START and END,
>   rather than only warnings originating from a specific named function.
> - Simplified macro API: removed KUNIT_DECLARE_SUPPRESSED_WARNING(),
>   the START macro now takes (test) and handles allocation internally.
> - Removed static key and branching optiomization, as by the time it
>   was executed, callers are already in warn slowpaths.
> - Link to v6: https://lore.kernel.org/r/20260317-kunit_add_support-v6-0-d=
d22aeb3fe5d@redhat.com
>
> Changes since v7:
> - Integrated suppression into existing KUnit hooks infrastructure
> - Removed CONFIG_KUNIT_SUPPRESS_BACKTRACE
> - Added suppression check in __warn_printk()
> - Added spinlock for writer-side RCU protection
> - Replaced explicit rcu_read_lock/unlock with guard(rcu)()
> - Added scoped API (kunit_warning_suppress) using __cleanup attribute
> - Updated DRM patch to use scoped API
> - Expanded self-tests: incremental counting, cross-kthread isolation
> - Rewrote documentation covering all three API forms with examples
> - Link to v7: https://lore.kernel.org/r/20260420-kunit_add_support-v7-0-e=
8bc6e0f70de@redhat.com
>
> Changes since v8:
> - Rebased to v7.1-rc2
> - Remove KUNIT_START/END_SUPPRESSED_WARNING() macros
> - Add KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT checks to drm tests
> - Link to v8: https://lore.kernel.org/r/20260504-kunit_add_support-v8-0-3=
e5957cdd235@redhat.com
>
> Changes since v9:
> - Fix silent false-pass when kunit_start_suppress_warning() returns NULL
> - Fix RCU lockdep splat for kunit_is_suppressed_warning() calls
> - Move disable_trace_on_warning() in __report_bug()
> - Make suppress counter atomic
> - Mark helper warn functions in selftest as noinline
> - Add kunit_skip() for CONFIG_BUG=3Dn in selftests
> - Fix potentially uninitialized data.was_active in kthread seltest
> - Add kthread_stop() in kthread selftest early exit
> - Initialize scaling_factor to INT_MIN in DRM scaling tests
> - Add include for bool in test-bug.h to fix CONFIG_KUNIT=3Dn case
> - Link to v9: https://lore.kernel.org/r/20260508-kunit_add_support-v9-0-9=
9df7aa880f6@redhat.com
>
> Changes since v10:
> - Remove synchronize_rcu() to avoid sleeping in atomic context
> - Pin task_struct refcount to prevent ABA false-positive matches
> - Loop in suppression selftest to prevent use-after-free on kthread exit
> - Skip DRM rect tests on CONFIG_BUG=3Dn
> - Link to v10: https://lore.kernel.org/r/20260513-kunit_add_support-v10-0=
-e379d206c8cd@redhat.com
>
> Changes since v11:
> - Use call_rcu() to defer free without blocking
> - Remove #ifdef CONFIG_KUNIT guard in lib/bug.c
> - Remove stale config checks from selftest
> - Replace skip on DRM rect tests with conditional expectation
> - Link to v11: https://lore.kernel.org/r/20260514-kunit_add_support-v11-0=
-b36a530a6d8f@redhat.com
>
> Changes since v12:
> - Reverted to the v9 synchronize_rcu() approach
> - Add in_task() check at the top of __kunit_is_suppressed_warning_impl()
> - Link to v12: https://lore.kernel.org/r/20260515-kunit_add_support-v12-0=
-a216dc228be8@redhat.com

Hi all,

I am not sure if there is a decision to merge this series or if any
work remains to be done.

I reckon I sent a few versions back-to-back last time as I was
struggling with Sashiko. However, there are no significant changes,
the core strategy remains unchanged, involving only the addition of
safety checks and the removal of some redundancies to satisfy the AI.
I am just clarifying in case the last versions/respins were unclear. I
tried running AI reviews locally but Sashiko always found more issues
than my local model could.

BR,
Albert.

> --
> 2.34.1
>
> ---
> To: Brendan Higgins <brendan.higgins@linux.dev>
> To: David Gow <david@davidgow.net>
> To: Rae Moar <raemoar63@gmail.com>
> To: Andrew Morton <akpm@linux-foundation.org>
> To: Paul Walmsley <pjw@kernel.org>
> To: Palmer Dabbelt <palmer@dabbelt.com>
> To: Albert Ou <aou@eecs.berkeley.edu>
> To: Alexandre Ghiti <alex@ghiti.fr>
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> To: Maxime Ripard <mripard@kernel.org>
> To: Thomas Zimmermann <tzimmermann@suse.de>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> To: Jonathan Corbet <corbet@lwn.net>
> To: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-kselftest@vger.kernel.org
> Cc: kunit-dev@googlegroups.com
> Cc: linux-riscv@lists.infradead.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: workflows@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
>
> ---
>
> ---
> Alessandro Carminati (1):
>       bug/kunit: Core support for suppressing warning backtraces
>
> Guenter Roeck (3):
>       kunit: Add backtrace suppression self-tests
>       drm: Suppress intentional warning backtraces in scaling unit tests
>       kunit: Add documentation for warning backtrace suppression API
>
>  Documentation/dev-tools/kunit/usage.rst |  46 +++++++-
>  drivers/gpu/drm/tests/drm_rect_test.c   |  36 +++++-
>  include/kunit/test-bug.h                |  26 +++++
>  include/kunit/test.h                    |  98 ++++++++++++++++
>  kernel/panic.c                          |  11 ++
>  lib/bug.c                               |  12 +-
>  lib/kunit/Makefile                      |   4 +-
>  lib/kunit/backtrace-suppression-test.c  | 192 ++++++++++++++++++++++++++=
++++++
>  lib/kunit/bug.c                         | 127 +++++++++++++++++++++
>  lib/kunit/hooks-impl.h                  |   2 +
>  10 files changed, 544 insertions(+), 10 deletions(-)
> ---
> base-commit: 74fe02ce122a6103f207d29fafc8b3a53de6abaf
> change-id: 20260312-kunit_add_support-2f35806b19dd
>
> Best regards,
> --
> Albert Esteve <aesteve@redhat.com>
>

