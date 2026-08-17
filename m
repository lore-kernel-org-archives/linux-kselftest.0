Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35433112B2
	for <linux-kselftest@vger.kernel.org>; Mon, 17 Aug 2026 04:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786940362; cv=pass; b=UhGnE1df2PEIirRcQCbm4Ne+wZfFsdcKQtVC67FM72QZ6S8KU9rbaIJrshxdMP8zG65k0kEVW0w+qWubcHC3cZ9DoQoc2K7i9YWjEZ+Nl9z6TvxYlWSM37Kmun+OTwNnW2Ry8djM3oJoQWXpPscLi30IuhKHHd4gP32BsGL7vzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786940362; c=relaxed/simple;
	bh=lpIs2XFFMgCO2eDKG9XpvrzJFsvhZRkiOhUb37vJUuk=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=puHfzcopYTG4NfFiyAOCTcF8quhKn24B78DELoL7CTominIdJkDTTSUvPHH4K0FbWMY4xHrbwTQuSUo+61RkbhMkUtVlwVmmqaKZABRGpa2C+H2zkXGjGgwWRtUbGgOSbNzqO4qrXKPsqBR1BLNbCLnFlo4Jmy0ZVoCekFVLNPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d4Z1qDgx; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d4Z1qDgx"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ccf2360620so28509445ad.3
        for <linux-kselftest@vger.kernel.org>; Sun, 16 Aug 2026 21:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786940360; cv=none;
        d=google.com; s=arc-20260327;
        b=Q80YO467fBWRkxkTWmUEvFbsUtI4VApxI5t+QkQasRfcXWJLOqFC7Fan3mFF7wK1Sa
         mTikjComztIGjGZyPIF8azjQ9LBVbhmQs8zuYCWWeBf2Gaia7NCB8KV2BYBI61mrvqSv
         AOjR91cAKP59UKCJqTOw2OIPuyrqJMMVfJPai/e1zbyYM1tLAr7AWJrBrCunGtXbgTti
         C1A/8Hj4lC0vMtkdAOI0gC8iQRMtmGGs0QybtnDDHwPVqrov9bWRKQ2dobaDKSc5I+oU
         eJrXtWZxJ793ZJHOP1SVnrhawsfhvI+QWgW0dvV0dbdJqDHk1VUgti0qNtnX8azEQB5Q
         eSQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=xivEul2vQ6DVrmdcX4kLhJE8WzqBo4aY4NPSm+NocTk=;
        fh=3NvnZ2Psvo/lkHQN+ZdshkbZnWSwBm2U04dKSaoyKnY=;
        b=Qs5rv1RQCW5Uv0RZJMCx5m7fS2sHPsoWz7YQ59scncr+oxc9HKu33Q1qxp0LRIfsNC
         WuAhxH8mpQAG6pwWjNpXk9XPSis4vFBp7yMWbH9R53UJnSg9RBMJwmSg1E98g/urt+j9
         w7EsD2cK5zUxRlMzmzazfXUxmY04Hys88Y+eixIuMSC7CAizr/2Aqhw+u2yzVE6dYcDH
         jmkVVGNWIFKgMSAxj/Nw8o4IqqH6w29rZebCfxhbHc2lqLyDGvWUX5EHJXIrs5Uh6f53
         H0+NvPqJt81KQu6jigegpeodJvPeZRg9kTFneRpguUOzs3IEUIU68YlDsJ9WmQKPaPxA
         6lpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786940360; x=1787545160; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xivEul2vQ6DVrmdcX4kLhJE8WzqBo4aY4NPSm+NocTk=;
        b=d4Z1qDgxn//0BBIeicBMU83aBpv6v4tsbWYbUbIbSVWScYdFNjNy6C4K6w/Ow0EURs
         I6R75I8GF57mZEt3CfTmnNDvZmbzHlUitckQjbTItPENaCMf+5+bi9nLe+OjcODUWQnh
         BA6k1m5oq//xD4QG2+MRyxsfvIKbOk/9z1eUkIgimDGTS/5w6UbtzFfKWUaxtgBsZgQO
         J3pX1wsUVan4fCuTH/sYLY1fKB3gZNXm5yED8i5TsQUpOpdj0H6Ql7AxkgmFUEol8yLm
         8MYJdbE9mTnbIiNDL9GPzIqx11IbJy4+gdtTzOraOEU4c7MzXGoiCo1rBp2uEu5TTkvu
         QJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786940360; x=1787545160;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xivEul2vQ6DVrmdcX4kLhJE8WzqBo4aY4NPSm+NocTk=;
        b=YgKsN+NKqWS4utB4RuI6z0uYp31eRPb4cjlOVOq+AWCysOpm4ZYW+QcrwT4mUUITbv
         aF2dVRbcUyg0r3nRjRYQecU834sMkBglP0GtUWVEuwpdOivB++fWmfH7MUMyAKdNotl5
         7x+TcMNMysSSl+m2wfqF4HA4fpAgfVElhLKkD9VHwyHu/sObQOHQeh4+1nNVPlOZ7Bpp
         wdt1cS3cNtcxhD4wRAeySK5BABq6cLLDQVOV81/22PIq0AEJNSKwtIWFWyBybztJlHAj
         /wP0o6qK67WW9cTUvd+ksYTR8zIqV3naG70khH0gyvqa8zLnGu8RqhJ8mE5iQvZAngWn
         I0xA==
X-Forwarded-Encrypted: i=1; AHgh+RrDfrE9ipwx256tPNh2phjJlKiw56P01xB9ovaZdF04znn5g865IXooB/JtxyUI10+PLrzeCyXDOvQm+3qgiAg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Q3iUte5Ih1cSuST0Y9qZvllM3aNkevrtR3Y+rjidWaLE/NSt
	KIdoj4WO39huhFnUBfPzGCsozTYPQP4mtWNT8MDfn4hXqAS3hldtpD6pJ9BDq5pP+29npgiguGZ
	xuzCxMLzh93AlKTAR8pbAIhuyVMgTZlD33PCS/1E/
X-Gm-Gg: AR+sD12NxffBHZfzXNdpZEq+jfv8HkSsEUNlwvN5JjK0CXRuXEyA+kVOqYebgkCzYEk
	CNYGsZwXs/Mo3LpRlK4H/id5GqU6jgjwGUy0i2KCeXY99YGnRwWcBLmDkHDO3cyGZzZ7vYuNNUm
	A92jDwxB+xaUEVRdTvEExHpCAYDCt8RcXt9h619St/19LNVlcPo0xJ6U4/k0x717IUGMb8fDVLL
	2FvpzP46EUMc7BUFkD9jQjDBbQtwqMxdHdF7jtj2SGVPrhPY8tv88kKZYgY4ggKav9iZhhfP6m5
	ZONezzZOEzlIwGeTCZUI6EdqvV4HRMhasRe3lSNVO0ysbr2iZCAMDkDP8RsFVTorkLq6//f3PD8
	1VUw8JMm47qAx
X-Received: by 2002:a17:90b:4c92:b0:37f:c28a:de61 with SMTP id
 98e67ed59e1d1-3933b958b03mr19010729a91.17.1786940359155; Sun, 16 Aug 2026
 21:19:19 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 16 Aug 2026 21:19:17 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 16 Aug 2026 21:19:17 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <4828f8e29801adb29a4d48b8980d3b3a0a813e06.camel@intel.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
 <5a44a6925715e1edbd379ac0ea5526ec990eb819.camel@intel.com> <4828f8e29801adb29a4d48b8980d3b3a0a813e06.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sun, 16 Aug 2026 21:19:17 -0700
X-Gm-Features: AcwNN1VIHmwnnDA2bzacKAIVX0yEdPw0lSMkAp36cPs6xox3IG56dYLMbQiMxOc
Message-ID: <CAEvNRgELDhXvPFKaoz+w-yywoJn0WMWvA-Y2jfdnwJVSbCSWyw@mail.gmail.com>
Subject: Re: [PATCH v14 00/22] TDX KVM selftests
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "Aktas, Erdem" <erdemaktas@google.com>, 
	"Li, Xiaoyao" <xiaoyao.li@intel.com>, "shuah@kernel.org" <shuah@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "afranji@google.com" <afranji@google.com>, 
	"kas@kernel.org" <kas@kernel.org>, "binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"ira.weiny@intel.com" <ira.weiny@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"Chatre, Reinette" <reinette.chatre@intel.com>, 
	"isaku.yamahata@intel.com" <isaku.yamahata@intel.com>, "seanjc@google.com" <seanjc@google.com>, 
	"pratikrajesh.sampat@amd.com" <pratikrajesh.sampat@amd.com>, "oupton@kernel.org" <oupton@kernel.org>, 
	"wyihan@google.com" <wyihan@google.com>, "sagis@google.com" <sagis@google.com>, "Gao, Chao" <chao.gao@intel.com>, 
	"Wang, Roger" <runanwang@google.com>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>, "Qiang, Chenyi" <chenyi.qiang@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "jmcrey@google.com" <jmcrey@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Hunter, Adrian" <adrian.hunter@intel.com>, 
	"x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"

"Edgecombe, Rick P" <rick.p.edgecombe@intel.com> writes:

> On Thu, 2026-08-13 at 15:47 -0700, Rick Edgecombe wrote:
>> On Wed, 2026-07-22 at 23:13 +0000, Lisa Wang wrote:
>> > v14 revision for TDX KVM selftests based on kvm/next and guest_memfd:
>> > In-place conversion support[1]. This series needs some changes from
>> > in-place conversion v9. For ease of testing, an extra hack commit has
>> > been added. The complete code is available at:
>> > https://github.com/googleprodkernel/linux-cc/commits/tdx-selftests-v14
>>
>> Are you able to get sashiko review on this? Or did you internally somehow? It
>> seems the public sashiko cannot figure out this stack.
>
> Actually why is this on top of in-place conversion? I thought the idea was to
> break the series apart to get something basic upstream:
> https://lore.kernel.org/all/aJ-6JpHD6xhAvZPy@google.com/
>
> Adding in-place conversion tests seems to be going in the opposite direction.
>

We wanted to have this series based on in-place conversion since
non-in-place conversion is on a deprecation path. Also, it makes the set
up easier :)

At this point I don't think this series is going to make it for 7.3, so
at best it makes it for 7.4 (together with in-place conversion), which I
think works out?

Sean, let us know what you think about scheduling. We can rebase without
in-place conversion if necessary.

>
> Also, the branch does not build for me:
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:26:
> undefined reference to `TD_BOOT_PARAMETERS_PER_VCPU'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:30:
> undefined reference to `TD_PER_VCPU_PARAMETERS_ESP_GVA'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:33:
> undefined reference to `TD_BOOT_PARAMETERS_GDT'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:37:
> undefined reference to `TD_BOOT_PARAMETERS_IDT'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:44:
> undefined reference to `TD_BOOT_PARAMETERS_CR4'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:46:
> undefined reference to `TD_BOOT_PARAMETERS_CR3'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:48:
> undefined reference to `TD_BOOT_PARAMETERS_CR0'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:54:
> undefined reference to `TD_PER_VCPU_PARAMETERS_GUEST_CODE'
> collect2: error: ld returned 1 exit status
> make: *** [Makefile.kvm:351:
> .../linux/tools/testing/selftests/kvm/demand_paging_test] Error 1
> make: *** Waiting for unfinished jobs....
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.o: in
> function `td_boot':
> .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:24: undefined
> reference to `SIZEOF_TD_PER_VCPU_PARAMETERS'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:26:
> undefined reference to `TD_BOOT_PARAMETERS_PER_VCPU'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:30:
> undefined reference to `TD_PER_VCPU_PARAMETERS_ESP_GVA'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:33:
> undefined reference to `TD_BOOT_PARAMETERS_GDT'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:37:
> undefined reference to `TD_BOOT_PARAMETERS_IDT'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:44:
> undefined reference to `TD_BOOT_PARAMETERS_CR4'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:46:
> undefined reference to `TD_BOOT_PARAMETERS_CR3'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:48:
> undefined reference to `TD_BOOT_PARAMETERS_CR0'
> /usr/bin/ld: .../linux/tools/testing/selftests/kvm/lib/x86/tdx/td_boot.S:54:
> undefined reference to `TD_PER_VCPU_PARAMETERS_GUEST_CODE'
> collect2: error: ld returned 1 exit status
> make: *** [Makefile.kvm:351:
> .../linux/tools/testing/selftests/kvm/dirty_log_test] Error 1
>
> If I apply these patches on 8cf3969a0b7d4 from the branch, it builds though. It
> looks like a few changes are missing from the branch:
>
> diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c
> b/tools/testing/selftests/kvm/guest_memfd_test.c
> index d6528c6f5e031..b099b09cbae3d 100644
> --- a/tools/testing/selftests/kvm/guest_memfd_test.c
> +++ b/tools/testing/selftests/kvm/guest_memfd_test.c
> @@ -14,7 +14,7 @@
>  #include <linux/bitmap.h>
>  #include <linux/falloc.h>
>  #include <linux/sizes.h>
> -#include <sys/mman.h>
> +#include <linux/mman.h>

I recall a similar fix [1] you posted, I think both Lisa and I are
relying on some LSP auto-including, we'll adopt <linux/mman.h>. Let me
know you know a good way to configure the auto-includes.

[1] https://lore.kernel.org/all/20260427204313.50741-1-rick.p.edgecombe@intel.com/

What compiler/version are you using? We'd like to reproduce.

>  #include <sys/types.h>
>  #include <sys/stat.h>
>
> diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/td_boot_offsets.c
> b/tools/testing/selftests/kvm/lib/x86/tdx/td_boot_offsets.c
> index b81cd16198ecf..7f76a3585b99a 100644
> --- a/tools/testing/selftests/kvm/lib/x86/tdx/td_boot_offsets.c
> +++ b/tools/testing/selftests/kvm/lib/x86/tdx/td_boot_offsets.c
> @@ -5,7 +5,7 @@
>
>  #include "tdx/td_boot.h"
>
> -static void __used common(void)
> +static void __attribute__((used)) common(void)

Not sure about this, I'll let Lisa look at this in more detail. I wonder
if declaring __used is necessary at all.

>  {
>         OFFSET(TD_BOOT_PARAMETERS_CR0, td_boot_parameters, cr0);
>         OFFSET(TD_BOOT_PARAMETERS_CR3, td_boot_parameters, cr3);
