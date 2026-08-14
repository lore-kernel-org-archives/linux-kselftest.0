Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFFF35C6AC
	for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 09:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786700075; cv=none; b=O5gw9D+G+UHtOqULFzK5aHBNfaTTFNURBb41675kFx/qfbdXF+dHVl7taioynw7x7hT/HbGKni9SlBLWHRJ95g6mzfU9QSjKpo9z7g0vF+no6Dwf8VKSW0l+QyrwjvmUoe1klDz/iVXH23EWnBLOKiIT1Z4tq6Cysi0lGY0Biwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786700075; c=relaxed/simple;
	bh=lMzUbEZh04TxJ0pwQ90XgaHCU7qNhHRSIA295v8I/Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSmBX1A7hEOQcTvZ1yujDD41kEHelI7KtmdlEuV+x1fEsjYJ87t7/Dxx4i133hAz6dfdVtuquA68Xp/mYnwFGWymFi8y4zfkxHR7lPdixaC5kQsVl6FUYRXXWg3Nhlc0cw1No/yHCx6eK5Cd7zekjFFEc3uyhiH4TuqkhXbJbFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=hhF35gw/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vTQ+Ghzt; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kRByEFa+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=xeRQuVjC; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="hhF35gw/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vTQ+Ghzt";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kRByEFa+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="xeRQuVjC"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DF7DC82E4F;
	Fri, 14 Aug 2026 09:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786700068; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cLUyFxQVLdSjfBmCWkDLy4B3Fcl8gZoDogFSRwHO4t4=;
	b=hhF35gw/LYvLOC7bzOPZX7IAX7VCpsmamR8rPAxK4T9PEQeKITw8G9Gk/nhimMZKHzB9A/
	YK+VqcA95PYvxi33jvnkplohRdY6j62ZXFmi4eSNC9zzHiLOxeRjinAIhZvySZvk6PzoGx
	U8ckiR6gwAfxvMb8u34EmEtlyUhfSbo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786700068;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cLUyFxQVLdSjfBmCWkDLy4B3Fcl8gZoDogFSRwHO4t4=;
	b=vTQ+GhztcQ/SYxO3i4hqHl6/agTaIKB2p264q6D1J8JFym4w7q6xS64wAW1UcG/0akaZ50
	tcYqZh6IgghUoDDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786700063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cLUyFxQVLdSjfBmCWkDLy4B3Fcl8gZoDogFSRwHO4t4=;
	b=kRByEFa+u64c03zl4c9aZGcACEi89BLMiT0kj5hSqyelmNEeKzfOrT6xSIJeFiGn7THeHA
	RIiL4BDbwL0X9guSRyLAPzlTNDPCU7++tfZZVetuTTKJVuZGonK8UEJV+udzKIVTQqc/VW
	4kscmoaC3F0F3ZNohYOBVRo6J+ag0YE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786700063;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cLUyFxQVLdSjfBmCWkDLy4B3Fcl8gZoDogFSRwHO4t4=;
	b=xeRQuVjCrGpluq4gLB1As2xY/vI2RmDCzwDRwZU1ukp3fmj7DP+sKd4qYA7Z6kx6YwV7wW
	bQghStLan0/QwwBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DF8D1782EA;
	Fri, 14 Aug 2026 09:34:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Xf7UMh7hfmrabgAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Fri, 14 Aug 2026 09:34:22 +0000
Date: Fri, 14 Aug 2026 10:34:21 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Hajime Tazaki <thehajime@gmail.com>
Cc: linux-mm@kvack.org, geert@linux-m68k.org, daniel@thingy.jp, 
	Shuah Khan <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, linux-kselftest@vger.kernel.org, linux-um@lists.infradead.org
Subject: Re: [RFC PATCH 4/6] selftests: fix build errors on alpine linux
Message-ID: <an7eC0oBvfjB6g54@pedro-suse.lan>
References: <20260813063401.1786548-1-thehajime@gmail.com>
 <20260813063401.1786548-5-thehajime@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813063401.1786548-5-thehajime@gmail.com>
X-Spam-Score: -4.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,infradead.org:email,imap1.dmz-prg2.suse.org:helo]

/me puts on his libc hat

On Thu, Aug 13, 2026 at 03:33:59PM +0900, Hajime Tazaki wrote:
> Some nommu architectures only work on Alpine Linux, which doesn't use
> glibc for the standard library.  It uses musl-libc and is implemented in
> a different way as glibc, resulting build failures.
> 
> This commit fixes this issue by adding missing definitions. The fixes
> are now only covered to TARGETS=mm which was tested for the moment;
> future contributions are needed to fully build/execute tests on nommu
> platforms.
> 
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@kernel.org>
> Cc: Lorenzo Stoakes <ljs@kernel.org>
> Cc: "Liam R. Howlett" <liam@infradead.org>
> Cc: Vlastimil Babka <vbabka@kernel.org>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: linux-kselftest@vger.kernel.org
> Cc: linux-mm@kvack.org
> Cc: linux-um@lists.infradead.org
> Signed-off-by: Hajime Tazaki <thehajime@gmail.com>
> ---
>  tools/testing/selftests/kselftest.h      | 43 ++++++++++++++++++++++++
>  tools/testing/selftests/lib.mk           |  2 +-
>  tools/testing/selftests/mm/hugetlb_dio.c |  8 ++---
>  tools/testing/selftests/mm/mdwe_test.c   |  4 +--
>  4 files changed, 50 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
> index ae18c491ae53..ac21bf3d802e 100644
> --- a/tools/testing/selftests/kselftest.h
> +++ b/tools/testing/selftests/kselftest.h
> @@ -58,6 +58,7 @@
>  #include <string.h>
>  #include <stdio.h>
>  #include <sys/utsname.h>
> +#include <stdint.h>
>  #endif
>  
>  #ifndef ARRAY_SIZE
> @@ -81,6 +82,48 @@
>  #endif
>  #endif /* end arch */
>  
> +#if !defined(NOLIBC) && !defined(__GLIBC__)
> +#ifdef __LP64__
> +typedef int64_t __fsword_t;
> +#else
> +typedef int32_t __fsword_t;
> +#endif

The code should not be using __fsword_t. Per statfs(2):

       The __fsword_t type used for various fields in the statfs
       structure definition is a glibc internal type, not intended for
       public use.  This leaves the programmer in a bit of a conundrum
       when trying to copy or compare these fields to local variables in
       a program.  Using unsigned int for such variables suffices on most
       systems.

and indeed if you look at musl's statvfs definition:
struct statvfs {
	/* ... */
	unsigned int f_type;
	/* ... */
};

so it should be perfectly cromulent to use unsigned int here. Or use an
actual usable interface :)

> +
> +/*
> + * for a workaround to avoid struct conflict under
> + * musl-libc (<sys/prctl.h> v.s. <linux/prctl.h>)
> + */
> +#include <sys/prctl.h>
> +#ifndef _LINUX_PRCTL_H
> +#define _LINUX_PRCTL_H
> +#endif
> +
> +#ifndef PR_SET_MDWE
> +#define PR_SET_MDWE 65
> +#endif
> +
> +#ifndef PR_MDWE_REFUSE_EXEC_GAIN
> +#define PR_MDWE_REFUSE_EXEC_GAIN (1UL << 0)
> +#endif
> +
> +#ifndef PR_MDWE_NO_INHERIT
> +#define PR_MDWE_NO_INHERIT (1UL << 1)
> +#endif
> +
> +#ifndef PR_GET_MDWE
> +#define PR_GET_MDWE 66
> +#endif
> +
> +#ifndef PR_SET_MEMORY_MERGE
> +#define PR_SET_MEMORY_MERGE 67
> +#endif
> +
> +#ifndef PR_GET_MEMORY_MERGE
> +#define PR_GET_MEMORY_MERGE 68
> +#endif
> +
> +#endif

This looks fine. It's the same old problem with musl and kernel headers.

> +
>  /* define kselftest exit codes */
>  #define KSFT_PASS  0
>  #define KSFT_FAIL  1
> diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
> index f02cc8a2e4ae..2cc819006424 100644
> --- a/tools/testing/selftests/lib.mk
> +++ b/tools/testing/selftests/lib.mk
> @@ -197,7 +197,7 @@ clean: $(if $(TEST_GEN_MODS_DIR),clean_mods_dir)
>  	$(CLEAN)
>  
>  # Build with _GNU_SOURCE by default
> -CFLAGS += -D_GNU_SOURCE=
> +CFLAGS += -D_GNU_SOURCE= -D_LARGEFILE64_SOURCE

What needs this?

>  
>  # Additional include paths needed by kselftest.h and local headers
>  CFLAGS += -I${top_srcdir}/tools/testing/selftests
> diff --git a/tools/testing/selftests/mm/hugetlb_dio.c b/tools/testing/selftests/mm/hugetlb_dio.c
> index fb4600570e13..aee6be530ccb 100644
> --- a/tools/testing/selftests/mm/hugetlb_dio.c
> +++ b/tools/testing/selftests/mm/hugetlb_dio.c
> @@ -22,12 +22,9 @@
>  #include "kselftest.h"
>  #include "hugepage_settings.h"
>  
> -#ifndef STATX_DIOALIGN
> -#define STATX_DIOALIGN		0x00002000U
> -#endif

Why doesn't this fallback work?

> -
>  static int get_dio_alignment(int fd)
>  {
> +#ifdef STATX_DIOALIGN
>  	struct statx stx;
>  	int ret;
>  
> @@ -43,6 +40,9 @@ static int get_dio_alignment(int fd)
>  		return 1;
>  
>  	return stx.stx_dio_offset_align;
> +#else
> +	return -1;
> +#endif
>  }
>  
>  static bool check_dio_alignment(unsigned int start_off,
> diff --git a/tools/testing/selftests/mm/mdwe_test.c b/tools/testing/selftests/mm/mdwe_test.c
> index 647779653da0..031c79ed067e 100644
> --- a/tools/testing/selftests/mm/mdwe_test.c
> +++ b/tools/testing/selftests/mm/mdwe_test.c
> @@ -1,5 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
> +#include "kselftest_harness.h"
> +
>  #ifdef __aarch64__
>  #include <asm/hwcap.h>
>  #endif
> @@ -14,8 +16,6 @@
>  #include <sys/wait.h>
>  #include <unistd.h>
>  
> -#include "kselftest_harness.h"
> -
>  #ifndef __aarch64__
>  # define PROT_BTI	0
>  #endif
> -- 
> 2.43.0
> 
> 

Honestly, I'm surprised you needed so few hacks for this! But if I am to
guess, there are certainly much more problematic selftests out there.

-- 
Pedro
