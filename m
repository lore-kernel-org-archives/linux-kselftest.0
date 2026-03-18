Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AD723C8A0
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Mar 2026 05:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773811844; cv=none; b=miCB1oIMRKHYjlF8orjzlYvlK1+1F80kiU9qPc4zaMwwL7ex9aYIF7RPGCr4GDcYkb5kXTP06jXu6Rh/DU/afgs+kV9Z2ghEJlhgcueY4cvgum5UEAQv59nfWYU3jLiZH+WheNj0rBB3NJa4MJtoil9oJdmBNKxtB47rk3ljQzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773811844; c=relaxed/simple;
	bh=ZvCJFeDSd/BSxhIBtIvsyeHsiy2szlH0v6CxPZqYnqc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RNj9pYuCJ0LvFaWSSYZTWk1s8EagXP63PAkR1hV7jufeHga740qRPAWerA4E1uPpqNgZiX/tX+mlDAwobzKMjiFV+ECfwCl9oAiZ/F/2B0QUa/18dYKkzFKNxG4ClyhUPiTQRtpj0xBbekjA7Znl4cVQJ5NeNhW2dG7mrmYlc8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kzalloc.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kzalloc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a8fba89cb5so8948275ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 22:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773811841; x=1774416641;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=km464EwkBVLUM1f6zH0j5r/iq0Pwuvbh+QT1ThGEU8g=;
        b=Ni8G1tfqPxhOn5O88nHvRcwDfLKXDmrGK9Lyb7Hr5ljqYapITjgT/31DaJN0wOV/2x
         3u1GWdlejfUgup7As39gKYh5TOLDfrHQfS1K11sNV3hCuyjcumfgH/pBFyhrUA3nURLG
         80/XBh8ta+7bTN0lRSYIkFczeLfhpburar8T6PYqDHDiOvQ1hdzcTRURUcZBxQFWAiZR
         8ei+V9phlPW+qrhq1C754IJlkS0QaCatRuzPouX4I1JV+AsurpNswY6+uuGUzEMR79hD
         8aaC23a5BAuj5f6JCmdMQ9y4ez3ehj+LI0sSSITDl3H4cW3Sr4yEGNrf478NhQoPzjOf
         zaZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfGgHEIyij0fiDXIt114C8JbJ3g4xsM8gZw+jp7oL6LcipnuFlyd+cGY6w+WemtbvJkH3bIpkWzK5G7URhRFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLfrhK8iP9gH6Lrvqow5dagIhH3mmaPgxUPzY01X0iU9koS0nl
	lIOVPRAWLIStig31lVTEIDMyZvjqYfe7bEmzzimrsTEolOPcNdikaSLr
X-Gm-Gg: ATEYQzweDQGd+CkXG73KojJyQqxVQ3+TIr5OzaJ6iqfneISzr3TjHfo7os/6zsOHgHF
	XSUTh26Yi9IyL8fBpgquuCgEt4mQwy1bAmnzpoCR7JBQq9hR2tqHDRc2eS0piUEUylPeRPkXgsq
	ce66oelBn83jxNgBbbtMIZ2LtuVJBM7wKAyqVViVuou92U/+d5tgCv7haeTXOyhWL8WoeF9IVVP
	zedes2uQZkwuEdd5I+SbTeLqxacRONQSbSQSkJD7qILujC1SX4IGfd1u5FshuYilEOMCR9XmWxB
	U2zBCtFiPQRxm6Y9XesJYCbVashjWl7NEF0/HanyDcjmuzkyIbfn2tW73UNclTWZbIU7l8yFvTZ
	DMKoHp40An9mWcSGeX/ZSxm3909ZYJSXXIQbqBvIJwMVntDarcykJLRwHHYpBhzoxKBR+RPE8V8
	jTWABUrvud4E4ayDbwwr95NWhrCiqgTvjRuJ9OdYt8ntf1sigOq+7kjJ9Tuy6bhCNhxANErP+ce
	taU6XeB4ld8Sl3X1tFbJ6DCIoY=
X-Received: by 2002:a17:902:cecb:b0:2ae:ba08:a491 with SMTP id d9443c01a7336-2b06e21c10cmr14208845ad.0.1773811841439;
        Tue, 17 Mar 2026 22:30:41 -0700 (PDT)
Received: from [192.168.1.11] ([121.175.158.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e60526dsm16054815ad.62.2026.03.17.22.30.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 22:30:41 -0700 (PDT)
Message-ID: <0a6b3cae-802b-4229-a130-4392fd49c5c9@kzalloc.com>
Date: Wed, 18 Mar 2026 14:30:37 +0900
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] lkdtm: Add lockdep related crash tests
To: Tzung-Bi Shih <tzungbi@kernel.org>, Kees Cook <kees@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
 "max.byungchul.park@gmail.com" <max.byungchul.park@gmail.com>,
 Byungchul Park <byungchul@sk.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Yeoreum Yun <ppbuk5246@gmail.com>
References: <20251215072539.2580180-1-tzungbi@kernel.org>
Content-Language: en-US
From: Yunseong Kim <ysk@kzalloc.com>
Organization: kzalloc
In-Reply-To: <20251215072539.2580180-1-tzungbi@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Tzung-Bi,

Thanks for the great work!

I'm very interested in this work as it will be helpful for verifying
whether kernel crash dumps are correctly extracted when a deadlock is
detected by lockdep. I really hope to see this merged.

I have a couple of questions regarding the organization of these tests:

Is the intent of this new lockdep.c specifically to validate the lockdep
infrastructure itself rather than providing general deadlock.c code It
feels like "deadlock" might be a broader category. For example, DEPT
(Dependency Tracker) can track wait/event dependencies for PG_locked/writeback.
I'm planning a follow-up contribution to cover these cases that DEPT can detect.

Do you think it would be better to implement deadlock detection for LKDTM
(like the ones DEPT handles) in a separate deadlock.c instead of
lockdep.c? I'd love to hear your thoughts on the scope.

Best regards,
Yunseong

On 12/15/25 4:25 PM, Tzung-Bi Shih wrote:
> Introduce various lockdep related crash tests.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> v3:
> - Add some entries in tools/testing/selftests/lkdtm/tests.txt.
> 
> v2: https://lore.kernel.org/all/20251117033337.3730681-1-tzungbi@kernel.org/
> - Fix "warning: suggest braces around empty body in an 'else' statement [-Wempty-body]"
>   reported by 0day test robot.
> 
> v1: https://lore.kernel.org/lkml/20251114062535.1827309-1-tzungbi@kernel.org/T/#u
> 
>  drivers/misc/lkdtm/Makefile             |  1 +
>  drivers/misc/lkdtm/core.c               |  1 +
>  drivers/misc/lkdtm/lkdtm.h              |  1 +
>  drivers/misc/lkdtm/lockdep.c            | 98 +++++++++++++++++++++++++
>  tools/testing/selftests/lkdtm/tests.txt |  8 ++
>  5 files changed, 109 insertions(+)
>  create mode 100644 drivers/misc/lkdtm/lockdep.c
> 
> diff --git a/drivers/misc/lkdtm/Makefile b/drivers/misc/lkdtm/Makefile
> index 03ebe33185f9..830b71c8e6a0 100644
> --- a/drivers/misc/lkdtm/Makefile
> +++ b/drivers/misc/lkdtm/Makefile
> @@ -11,6 +11,7 @@ lkdtm-$(CONFIG_LKDTM)		+= usercopy.o
>  lkdtm-$(CONFIG_LKDTM)		+= kstack_erase.o
>  lkdtm-$(CONFIG_LKDTM)		+= cfi.o
>  lkdtm-$(CONFIG_LKDTM)		+= fortify.o
> +lkdtm-$(CONFIG_LKDTM)		+= lockdep.o
>  lkdtm-$(CONFIG_PPC_64S_HASH_MMU)	+= powerpc.o
>  
>  KASAN_SANITIZE_stackleak.o	:= n
> diff --git a/drivers/misc/lkdtm/core.c b/drivers/misc/lkdtm/core.c
> index 5732fd59a227..43e91388940f 100644
> --- a/drivers/misc/lkdtm/core.c
> +++ b/drivers/misc/lkdtm/core.c
> @@ -96,6 +96,7 @@ static const struct crashtype_category *crashtype_categories[] = {
>  	&stackleak_crashtypes,
>  	&cfi_crashtypes,
>  	&fortify_crashtypes,
> +	&lockdep_crashtypes,
>  #ifdef CONFIG_PPC_64S_HASH_MMU
>  	&powerpc_crashtypes,
>  #endif
> diff --git a/drivers/misc/lkdtm/lkdtm.h b/drivers/misc/lkdtm/lkdtm.h
> index 015e0484026b..d2d97e6f323e 100644
> --- a/drivers/misc/lkdtm/lkdtm.h
> +++ b/drivers/misc/lkdtm/lkdtm.h
> @@ -84,6 +84,7 @@ extern struct crashtype_category usercopy_crashtypes;
>  extern struct crashtype_category stackleak_crashtypes;
>  extern struct crashtype_category cfi_crashtypes;
>  extern struct crashtype_category fortify_crashtypes;
> +extern struct crashtype_category lockdep_crashtypes;
>  extern struct crashtype_category powerpc_crashtypes;
>  
>  /* Each category's init/exit routines. */
> diff --git a/drivers/misc/lkdtm/lockdep.c b/drivers/misc/lkdtm/lockdep.c
> new file mode 100644
> index 000000000000..e029e9e60ce6
> --- /dev/null
> +++ b/drivers/misc/lkdtm/lockdep.c
> @@ -0,0 +1,98 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025 Google LLC
> + *
> + * Tests related to lockdep warnings.
> + */
> +#include "lkdtm.h"
> +#include <linux/cleanup.h>
> +#include <linux/irqflags.h>
> +#include <linux/mutex.h>
> +#include <linux/spinlock.h>
> +#include <linux/srcu.h>
> +
> +static DEFINE_SPINLOCK(lock_A);
> +static DEFINE_SPINLOCK(lock_B);
> +
> +/* For "WARNING: possible circular locking dependency detected". */
> +static void lkdtm_LOCKDEP_CIRCULAR_LOCK(void)
> +{
> +	scoped_guard(spinlock, &lock_A)
> +		scoped_guard(spinlock, &lock_B) {}
> +	scoped_guard(spinlock, &lock_B)
> +		scoped_guard(spinlock, &lock_A) {}
> +}
> +
> +/* For "WARNING: possible recursive locking detected". */
> +static void lkdtm_LOCKDEP_RECURSIVE_LOCK(void)
> +{
> +	guard(spinlock)(&lock_A);
> +	guard(spinlock)(&lock_A);
> +}
> +
> +/* For "WARNING: inconsistent lock state". */
> +static void lkdtm_LOCKDEP_INCONSISTENT_LOCK(void)
> +{
> +	lockdep_softirq_enter();
> +	scoped_guard(spinlock, &lock_A) {}
> +	lockdep_softirq_exit();
> +
> +	scoped_guard(spinlock, &lock_A) {}
> +}
> +
> +/* For "WARNING: Nested lock was not taken". */
> +static void lkdtm_LOCKDEP_NESTED_LOCK_NOT_HELD(void)
> +{
> +	spin_lock_nest_lock(&lock_B, &lock_A);
> +}
> +
> +/* For "WARNING: bad unlock balance detected!". */
> +static void lkdtm_LOCKDEP_BAD_UNLOCK_BALANCE(void)
> +{
> +	spin_unlock(&lock_A);
> +}
> +
> +/* For "WARNING: held lock freed!". */
> +static void lkdtm_LOCKDEP_HELD_LOCK_FREED(void)
> +{
> +	spin_lock(&lock_A);
> +	spin_lock_init(&lock_A);
> +}
> +
> +/* For "WARNING: lock held when returning to user space!". */
> +static void lkdtm_LOCKDEP_HELD_LOCK(void)
> +{
> +	spin_lock(&lock_A);
> +}
> +
> +/* For "WARNING: suspicious RCU usage". */
> +static void lkdtm_LOCKDEP_SUSPICIOUS_RCU(void)
> +{
> +	struct srcu_struct srcu;
> +	void __rcu *res = NULL;
> +	int idx;
> +
> +	init_srcu_struct(&srcu);
> +
> +	idx = srcu_read_lock(&srcu);
> +	rcu_dereference(res);
> +	srcu_read_unlock(&srcu, idx);
> +
> +	cleanup_srcu_struct(&srcu);
> +}
> +
> +static struct crashtype crashtypes[] = {
> +	CRASHTYPE(LOCKDEP_CIRCULAR_LOCK),
> +	CRASHTYPE(LOCKDEP_RECURSIVE_LOCK),
> +	CRASHTYPE(LOCKDEP_INCONSISTENT_LOCK),
> +	CRASHTYPE(LOCKDEP_NESTED_LOCK_NOT_HELD),
> +	CRASHTYPE(LOCKDEP_BAD_UNLOCK_BALANCE),
> +	CRASHTYPE(LOCKDEP_HELD_LOCK_FREED),
> +	CRASHTYPE(LOCKDEP_HELD_LOCK),
> +	CRASHTYPE(LOCKDEP_SUSPICIOUS_RCU),
> +};
> +
> +struct crashtype_category lockdep_crashtypes = {
> +	.crashtypes = crashtypes,
> +	.len	    = ARRAY_SIZE(crashtypes),
> +};
> diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
> index cff124c1eddd..7b32dece3d3a 100644
> --- a/tools/testing/selftests/lkdtm/tests.txt
> +++ b/tools/testing/selftests/lkdtm/tests.txt
> @@ -83,3 +83,11 @@ FORTIFY_STR_MEMBER detected buffer overflow
>  FORTIFY_MEM_OBJECT detected buffer overflow
>  FORTIFY_MEM_MEMBER detected field-spanning write
>  PPC_SLB_MULTIHIT Recovered
> +#LOCKDEP_CIRCULAR_LOCK Lockdep can only trigger once
> +#LOCKDEP_RECURSIVE_LOCK Hangs the system
> +#LOCKDEP_INCONSISTENT_LOCK Lockdep can only trigger once
> +#LOCKDEP_NESTED_LOCK_NOT_HELD Cause a deadlock in subsequent lockdep tests
> +#LOCKDEP_BAD_UNLOCK_BALANCE Lockdep can only trigger once
> +#LOCKDEP_HELD_LOCK_FREED Lockdep can only trigger once
> +#LOCKDEP_HELD_LOCK Cause a deadlock in subsequent lockdep tests
> +#LOCKDEP_SUSPICIOUS_RCU Lockdep can only trigger once

