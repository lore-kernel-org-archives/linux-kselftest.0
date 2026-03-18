Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009CE369202;
	Wed, 18 Mar 2026 07:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773818095; cv=none; b=BiLsnje+mkAkIIbUs0lvVirn3d0xqs4UtyPSvVMC8s5T5aobOWi59m5DkgUqsLH0NQmgmcHMhowxQ8g44qKhsZh0AzDMxOqyF+5lQP4IYqE93Raj+AAbkxYVo74YxWSD/pU+YmhcxGgMk1IeFBAhoR0swM3N6E1E8V/dZLzAAZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773818095; c=relaxed/simple;
	bh=Zv7Cg2XLcFPwRgksghRWizVcr027bWJBFbKuA/65BiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lplVY3jwjNdD7LLGMZWm7aqaRtrmIAZ+EHysCGPc/kQtbLPGU0X43+4Iwni2HzB8L0/J6QlAX/KjMy6UR/02pvxs2YLviUZdz+4/9vkVJN5P+hi+FFhLqGRAKDHUE8dXdlD6nVj9RHbhXBO3LckGlc4ySkU7Gd3mw4BRfzHMxF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5+9UMJB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5+9UMJB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86097C2BCB1;
	Wed, 18 Mar 2026 07:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773818094;
	bh=Zv7Cg2XLcFPwRgksghRWizVcr027bWJBFbKuA/65BiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V5+9UMJBL8DVdZ1zKyXJXjD2uT1BNv2qwOMf/snDCDF7UVJqMr4QpTcH5XFAMHTSa
	 EDlKjyBCgeDYj6UDzhxyNuq5ekn/JAdq+Rjc13r8q7Hq3/CG+UI5NdvCUiAG/MB2js
	 WPrFKfZXstABcu50agWDlQmud0xWnBNYIRyn4nC38b5YkrwXEKeh19kV5JT4L6eXPr
	 nGp4Eq3KfArCBIIBBNNFkgSW+z3UqpWQg80VFOMKxL/RBM+UTCEhXs2rAxd4D3IdyK
	 ARv8UPOdzTk3d3OaKGVkadsFIEKA00ni1YveTG7pNYjs9u8rSTsbE3riEMEXR6kthu
	 t2/dVBwHUD8tw==
Date: Wed, 18 Mar 2026 07:14:50 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Yunseong Kim <ysk@kzalloc.com>
Cc: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>,
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
	"max.byungchul.park@gmail.com" <max.byungchul.park@gmail.com>,
	Byungchul Park <byungchul@sk.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Yeoreum Yun <ppbuk5246@gmail.com>
Subject: Re: [PATCH v3] lkdtm: Add lockdep related crash tests
Message-ID: <abpQ6j48SGQv9a3v@google.com>
References: <20251215072539.2580180-1-tzungbi@kernel.org>
 <0a6b3cae-802b-4229-a130-4392fd49c5c9@kzalloc.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a6b3cae-802b-4229-a130-4392fd49c5c9@kzalloc.com>

On Wed, Mar 18, 2026 at 02:30:37PM +0900, Yunseong Kim wrote:
> Hi Tzung-Bi,
> 
> Thanks for the great work!
> 
> I'm very interested in this work as it will be helpful for verifying
> whether kernel crash dumps are correctly extracted when a deadlock is
> detected by lockdep. I really hope to see this merged.
> 
> I have a couple of questions regarding the organization of these tests:
> 
> Is the intent of this new lockdep.c specifically to validate the lockdep
> infrastructure itself rather than providing general deadlock.c code It
> feels like "deadlock" might be a broader category. For example, DEPT
> (Dependency Tracker) can track wait/event dependencies for PG_locked/writeback.
> I'm planning a follow-up contribution to cover these cases that DEPT can detect.

Yes, the lockdep.c is designed for lockdep; "deadlock" should be a
different set of issues (e.g., lockdep isn't only for deadlock).

> 
> Do you think it would be better to implement deadlock detection for LKDTM
> (like the ones DEPT handles) in a separate deadlock.c instead of
> lockdep.c? I'd love to hear your thoughts on the scope.

I think separate them would be easier to understand and review.

> 
> Best regards,
> Yunseong
> 
> On 12/15/25 4:25 PM, Tzung-Bi Shih wrote:
> > Introduce various lockdep related crash tests.
> > 
> > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> > ---
> > v3:
> > - Add some entries in tools/testing/selftests/lkdtm/tests.txt.
> > 
> > v2: https://lore.kernel.org/all/20251117033337.3730681-1-tzungbi@kernel.org/
> > - Fix "warning: suggest braces around empty body in an 'else' statement [-Wempty-body]"
> >   reported by 0day test robot.
> > 
> > v1: https://lore.kernel.org/lkml/20251114062535.1827309-1-tzungbi@kernel.org/T/#u
> > 
> >  drivers/misc/lkdtm/Makefile             |  1 +
> >  drivers/misc/lkdtm/core.c               |  1 +
> >  drivers/misc/lkdtm/lkdtm.h              |  1 +
> >  drivers/misc/lkdtm/lockdep.c            | 98 +++++++++++++++++++++++++
> >  tools/testing/selftests/lkdtm/tests.txt |  8 ++
> >  5 files changed, 109 insertions(+)
> >  create mode 100644 drivers/misc/lkdtm/lockdep.c
> > 
> > diff --git a/drivers/misc/lkdtm/Makefile b/drivers/misc/lkdtm/Makefile
> > index 03ebe33185f9..830b71c8e6a0 100644
> > --- a/drivers/misc/lkdtm/Makefile
> > +++ b/drivers/misc/lkdtm/Makefile
> > @@ -11,6 +11,7 @@ lkdtm-$(CONFIG_LKDTM)		+= usercopy.o
> >  lkdtm-$(CONFIG_LKDTM)		+= kstack_erase.o
> >  lkdtm-$(CONFIG_LKDTM)		+= cfi.o
> >  lkdtm-$(CONFIG_LKDTM)		+= fortify.o
> > +lkdtm-$(CONFIG_LKDTM)		+= lockdep.o
> >  lkdtm-$(CONFIG_PPC_64S_HASH_MMU)	+= powerpc.o
> >  
> >  KASAN_SANITIZE_stackleak.o	:= n
> > diff --git a/drivers/misc/lkdtm/core.c b/drivers/misc/lkdtm/core.c
> > index 5732fd59a227..43e91388940f 100644
> > --- a/drivers/misc/lkdtm/core.c
> > +++ b/drivers/misc/lkdtm/core.c
> > @@ -96,6 +96,7 @@ static const struct crashtype_category *crashtype_categories[] = {
> >  	&stackleak_crashtypes,
> >  	&cfi_crashtypes,
> >  	&fortify_crashtypes,
> > +	&lockdep_crashtypes,
> >  #ifdef CONFIG_PPC_64S_HASH_MMU
> >  	&powerpc_crashtypes,
> >  #endif
> > diff --git a/drivers/misc/lkdtm/lkdtm.h b/drivers/misc/lkdtm/lkdtm.h
> > index 015e0484026b..d2d97e6f323e 100644
> > --- a/drivers/misc/lkdtm/lkdtm.h
> > +++ b/drivers/misc/lkdtm/lkdtm.h
> > @@ -84,6 +84,7 @@ extern struct crashtype_category usercopy_crashtypes;
> >  extern struct crashtype_category stackleak_crashtypes;
> >  extern struct crashtype_category cfi_crashtypes;
> >  extern struct crashtype_category fortify_crashtypes;
> > +extern struct crashtype_category lockdep_crashtypes;
> >  extern struct crashtype_category powerpc_crashtypes;
> >  
> >  /* Each category's init/exit routines. */
> > diff --git a/drivers/misc/lkdtm/lockdep.c b/drivers/misc/lkdtm/lockdep.c
> > new file mode 100644
> > index 000000000000..e029e9e60ce6
> > --- /dev/null
> > +++ b/drivers/misc/lkdtm/lockdep.c
> > @@ -0,0 +1,98 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright 2025 Google LLC
> > + *
> > + * Tests related to lockdep warnings.
> > + */
> > +#include "lkdtm.h"
> > +#include <linux/cleanup.h>
> > +#include <linux/irqflags.h>
> > +#include <linux/mutex.h>
> > +#include <linux/spinlock.h>
> > +#include <linux/srcu.h>
> > +
> > +static DEFINE_SPINLOCK(lock_A);
> > +static DEFINE_SPINLOCK(lock_B);
> > +
> > +/* For "WARNING: possible circular locking dependency detected". */
> > +static void lkdtm_LOCKDEP_CIRCULAR_LOCK(void)
> > +{
> > +	scoped_guard(spinlock, &lock_A)
> > +		scoped_guard(spinlock, &lock_B) {}
> > +	scoped_guard(spinlock, &lock_B)
> > +		scoped_guard(spinlock, &lock_A) {}
> > +}
> > +
> > +/* For "WARNING: possible recursive locking detected". */
> > +static void lkdtm_LOCKDEP_RECURSIVE_LOCK(void)
> > +{
> > +	guard(spinlock)(&lock_A);
> > +	guard(spinlock)(&lock_A);
> > +}
> > +
> > +/* For "WARNING: inconsistent lock state". */
> > +static void lkdtm_LOCKDEP_INCONSISTENT_LOCK(void)
> > +{
> > +	lockdep_softirq_enter();
> > +	scoped_guard(spinlock, &lock_A) {}
> > +	lockdep_softirq_exit();
> > +
> > +	scoped_guard(spinlock, &lock_A) {}
> > +}
> > +
> > +/* For "WARNING: Nested lock was not taken". */
> > +static void lkdtm_LOCKDEP_NESTED_LOCK_NOT_HELD(void)
> > +{
> > +	spin_lock_nest_lock(&lock_B, &lock_A);
> > +}
> > +
> > +/* For "WARNING: bad unlock balance detected!". */
> > +static void lkdtm_LOCKDEP_BAD_UNLOCK_BALANCE(void)
> > +{
> > +	spin_unlock(&lock_A);
> > +}
> > +
> > +/* For "WARNING: held lock freed!". */
> > +static void lkdtm_LOCKDEP_HELD_LOCK_FREED(void)
> > +{
> > +	spin_lock(&lock_A);
> > +	spin_lock_init(&lock_A);
> > +}
> > +
> > +/* For "WARNING: lock held when returning to user space!". */
> > +static void lkdtm_LOCKDEP_HELD_LOCK(void)
> > +{
> > +	spin_lock(&lock_A);
> > +}
> > +
> > +/* For "WARNING: suspicious RCU usage". */
> > +static void lkdtm_LOCKDEP_SUSPICIOUS_RCU(void)
> > +{
> > +	struct srcu_struct srcu;
> > +	void __rcu *res = NULL;
> > +	int idx;
> > +
> > +	init_srcu_struct(&srcu);
> > +
> > +	idx = srcu_read_lock(&srcu);
> > +	rcu_dereference(res);
> > +	srcu_read_unlock(&srcu, idx);
> > +
> > +	cleanup_srcu_struct(&srcu);
> > +}
> > +
> > +static struct crashtype crashtypes[] = {
> > +	CRASHTYPE(LOCKDEP_CIRCULAR_LOCK),
> > +	CRASHTYPE(LOCKDEP_RECURSIVE_LOCK),
> > +	CRASHTYPE(LOCKDEP_INCONSISTENT_LOCK),
> > +	CRASHTYPE(LOCKDEP_NESTED_LOCK_NOT_HELD),
> > +	CRASHTYPE(LOCKDEP_BAD_UNLOCK_BALANCE),
> > +	CRASHTYPE(LOCKDEP_HELD_LOCK_FREED),
> > +	CRASHTYPE(LOCKDEP_HELD_LOCK),
> > +	CRASHTYPE(LOCKDEP_SUSPICIOUS_RCU),
> > +};
> > +
> > +struct crashtype_category lockdep_crashtypes = {
> > +	.crashtypes = crashtypes,
> > +	.len	    = ARRAY_SIZE(crashtypes),
> > +};
> > diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
> > index cff124c1eddd..7b32dece3d3a 100644
> > --- a/tools/testing/selftests/lkdtm/tests.txt
> > +++ b/tools/testing/selftests/lkdtm/tests.txt
> > @@ -83,3 +83,11 @@ FORTIFY_STR_MEMBER detected buffer overflow
> >  FORTIFY_MEM_OBJECT detected buffer overflow
> >  FORTIFY_MEM_MEMBER detected field-spanning write
> >  PPC_SLB_MULTIHIT Recovered
> > +#LOCKDEP_CIRCULAR_LOCK Lockdep can only trigger once
> > +#LOCKDEP_RECURSIVE_LOCK Hangs the system
> > +#LOCKDEP_INCONSISTENT_LOCK Lockdep can only trigger once
> > +#LOCKDEP_NESTED_LOCK_NOT_HELD Cause a deadlock in subsequent lockdep tests
> > +#LOCKDEP_BAD_UNLOCK_BALANCE Lockdep can only trigger once
> > +#LOCKDEP_HELD_LOCK_FREED Lockdep can only trigger once
> > +#LOCKDEP_HELD_LOCK Cause a deadlock in subsequent lockdep tests
> > +#LOCKDEP_SUSPICIOUS_RCU Lockdep can only trigger once
> 
