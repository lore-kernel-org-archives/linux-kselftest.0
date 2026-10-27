Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119030;
	b=1Y8/squLIwu+P9UByEtQuCsj4HMAdEuO1V3x3gzoGmzW/TGnmCSxQDo48lp8Oe9aujZH
	 WyYxLcEwaPzMSeozB3+1xzVg6nYS8lRJWxmX9b1YGriDspTlCW+9btl+4VjQ8Ui7VHcz4
	 kyIhMCOJSOQN1WH6ejozpT/lgZ9uISZOu6DjzmFLoBrcuc5wyanbDuek0ONqY7ApOLhpP
	 EgBVK9kvqVOqNHdzXKDdWO3CD6i3V2y34TNZFGygYBTLyUaDYKtdz9Wi8tVM3iyH6BD4f
	 OC/1wzZcNlnR9MmNKeZJK2JKsCiTIRb9bhcj9AdNXRqVoyOI265lbNc22OIS0i4kqhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=+X+xT+MsVt3lGpJbnEZ9ySkDtUCJMEXiKO19vcrDGU0=;
	b=WU3sbDyFSdOYIwvZ4VfWJN001f7A9RiFH77OgmkuIwfcclMY1o6OApE4fjkiffd3pn2R
	 DzHmHDQ8wFZM5vuQbbZw/jyf320iQwygILbYO1tNvfrGUoVYKsaaOMUYcTG7tziUZ1RrQ
	 52+ZdPrZ9AeWWFXHRzlWOdWJVpu0eo9bpuuDFWHz46ir6Zb2EaaF8mFpxJRi8uWBDy7hX
	 NVXyxiY43EGJSvo7b8vn8U0g+d4dsqYhD164YYarRbMZf4ld3//UXq829ahl9n8Mg0G30
	 VSg0tgUqgOsv0OLbJKvVbEXoBWra0GVZMMfkX+u7rZdSr8OTTVh7ZDJ95B9WeWUKRAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=tZacLRqx;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53313606A31F
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 16:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53313606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=tZacLRqx
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3adf5f6833cso59430a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Oct 2026 09:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793119029; x=1793723829; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+X+xT+MsVt3lGpJbnEZ9ySkDtUCJMEXiKO19vcrDGU0=;
        b=tZacLRqxH99A8UkRZg7EIpYVsa2ClCCKpGUA1pyOPVa6AV+Gx7hFYSgg1JrQV6TnJH
         ahwGbAHP5zt6PqkUDUr3X9oIMHqTHbUUqjHkbqg/tU9+RrzJko/hXR03U7b1wrKJyV51
         9xNzAc6lgvjfRnh8nv3JqxqKqlvQebyVnR3Uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119029; x=1793723829;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+X+xT+MsVt3lGpJbnEZ9ySkDtUCJMEXiKO19vcrDGU0=;
        b=16n22ga1zFVAADd84Ph/t9KV5Od/Tb0i0Vkr7lat2/7sQUSb0BLlAwUtIzNqT3Osds
         rQMzAveWkXLdWVZ/pG4rJIFr3CDplTPY96xC+yaOQU+Omvk8kRyvQIRmddA4INU6T6CE
         WOxN9syFmH7FXWsL730/PHJh29LO0Sp8JNWfBIvmXE1x8k17Gybgdb4m/WxGbEo8NsbR
         aw8qXqRV8F8K3vwzbo/szBNRe9Pwfw1WMvyuk4AVYp4eAVSD1ylpgZAZDVlG/V91eVS5
         Y+xMdWwPjvgafnpSlnfX0opA8uj8muJTFi7rFOPhvlGTEdYu9Q9ySz256RwIg67mtYKs
         IYIg==
X-Forwarded-Encrypted: i=1; AKwUvByzoP6LYjWwGoieH8DSjuDA/N6nm3+Cg1nLsP35eISK0g7asuB0sRRAiT2bnjE1xonCsK0WEwLZiuaB4OI6pgA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYCCpjzz65SUWIuZPNn0AHK2tjptv0U+mrV70lJ7cCZT+1xxak
	4nOi6vBpLkmM6qfKlZpgdTw50+d0DyBPdUea+DeJLvlC5jHMp8ewskSZAxG8QMMSghg=
X-Gm-Gg: AYBFou2Cs04W8xKaTv016qjUruM2ByvNSrVqJeBQUG12hEq29/Mzy4x2k5YVZIR0LoU
	GTB36xMVara+ndKTGlhy1nTVCIhBNOizeI2s3yZfmccf4A2Np9eEe8Xmsne0IXXsA0bUvpbWhE9
	pMKQtMnSAHDZIbwj3Z/gr6QvNE9p8/hUQs9lK6/SQ1x+iXU1IOJAma/bOulClFDI04VxRsUXM6Z
	hdPMXQiceS7Zt0xHNFDh1zpDtbx9v4M44NDgTLH4UGzQ2lgMEiL7hbBFnfTt8GXMgTxayUaNTWX
	Twgg66TSHJN83eAJzgSEktgt0z43w/LkqSFhSQ1MhQekHsee1hxS22bzynPGldaGxcg5Wspw8XF
	UmO4zmLacxON5xxFy+VQyYWvae8oW/XyF/qitt1/YZkljseSlernBi8VeUUHSwJIx7D3UnAHv5F
	uxQCemHAZS4Jpn54puEywoyqKk76slnAUTh068fKopMZv+UKrvwdd2dcMomNlZM7xuxIt2w4Yc+
	SwEGlyGCeIaxDnn67ap8hzyDtGCmCen5YrBcbm9ZX4WdLabwnj8883jWokkaC20MqjEoSCjQGEE
	uHgaOhrlZrnEObwE1Alzyk143L9isEM6apXKs6QlehlkaW8uIS6TYybeH8l3gQ6u6aVuX6E9Opp
	ACqbcbKSVJflgii7y3v/oQIlny0lNes28GI/4Ytb+gsDhMrQifky2/H5CWdqsdIAKNBOz9UlE
X-Received: by 2002:a17:90b:4a4f:b0:3ad:4a8b:c6fd with SMTP id 98e67ed59e1d1-3adeabe5366mr7820847a91.28.1793119028562;
        Tue, 27 Oct 2026 09:37:08 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae55d63b7csm11729a91.3.2026.10.27.09.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:37:07 -0700 (PDT)
Date: Wed, 28 Oct 2026 00:37:05 +0800
From: Chris Down <chris@chrisdown.name>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	David Hildenbrand <david@kernel.org>, Kees Cook <kees@kernel.org>,
	Jeff Xu <jeffxu@chromium.org>, Andrey Vagin <avagin@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/3] mseal sysmap: Add mseal_system_mappings= boot
 parameter
Message-ID: <auDTMb6WMFUpxeZy@chrisdown.name>
References: <cover.1793094611.git.chris@chrisdown.name>
 <5bd3c89d733ad22224f296dfa8900769de937de0.1793094611.git.chris@chrisdown.name>
 <auCxjbvY3qPv1sV6@gremlin>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <auCxjbvY3qPv1sV6@gremlin>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Hi Lorenzo,

Thanks for the quick and thorough review!

Lorenzo Stoakes (ARM) writes:
>The existing implementation is a bit of a mess, so any work that extends it
>has to put in the work to improve things first.
>
>I _hate_ VM_SEALED_SYSMAP. It's a hack. A tasteful way of doing this is
>really required for a series touching this to be taken, honestly.
>
>See below for implementation ideas.

That's fair, I'll do the cleanup first in v2.

>(Also it's the merge window, so no more revisions until -rc1, when you need
>to resend, thanks.)

Sure, I'll wait until after -rc1.

>Could we have some actual justification for the use of the feature please?
>So far I've seen arm-waving.

Sure. At Meta, we build sealing into the kernel for our VM hosts, and we'd like 
it on as much of the rest of the fleet as possible. The problem is that the 
rest of the fleet also runs things which it breaks. Just as one example among 
many, Reverie (which Hermit our deterministic execution tool is built on) 
patches the vDSO of the processes it traces by injecting an mprotect()[0].

So right now the hosts which want sealing need their own kernel image, and this 
option is one of the things which forces that. We're working towards hopefully 
running one kernel across the fleet, and with a boot parameter we can build it 
with CONFIG_MSEAL_SYSTEM_MAPPINGS=y, keep sealing on by default, and turn it 
off only on the hosts which run those tools.

Let me know if you'd like more information. I can also put that in the commit 
message for v2.

0: https://docs.rs/reverie-core/latest/reverie/vdso/index.html

>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index e75344f4e0cd..b1ec9a8a979e 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -4270,6 +4270,13 @@ Kernel parameters
>>  	MTD_Region=	[MTD] Format:
>>  			<name>,<region-number>[,<base>,<size>,<buswidth>,<altbuswidth>]
>>
>> +	mseal_system_mappings=
>> +			[KNL,EARLY] Under CONFIG_MSEAL_SYSTEM_MAPPINGS,
>> +			whether system mappings are sealed for this boot.
>> +			See Documentation/userspace-api/mseal.rst.
>> +			Format: <bool>
>> +			Default: 1 (enabled).
>
>You _have_ to duplicate the list of things this breaks here please.

Will do.

>Let's negate things first. Make the boot flag 'no_mseal_sys_mappings'
>rather than confusingly implying mseal_system_mappings=1 could enable it
>even with a config option not provided.
>
>Then add something like:
>
>static inline bool mseal_system_mappings(void)
>{
>        return IS_ENABLED(CONFIG_MSEAL_SYSTEM_MAPPINGS) &&
>               !mseal_system_mappings_disabled;
>}
>
>And call that in _install_special_mapping().

Makes sense. I'll call it in __install_special_mapping(), since that's where we 
already have a vma_flags_t, so it can just set VMA_SEALED_BIT without going 
near the legacy flags at all, if that sounds good? Then VM_SEALED_SYSMAP and 
all of its users can hopefully go away.

>The LLM overlords tell me that only uprobe trampolines would see a delta
>from this given the ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS restriction.
>
>This would improve things a lot.

Yes, but there is a wrinkle. Since 07c308eb2bcf ("uprobes/x86: Do not leak 
trampoline vma mapping on optimization failure"), __arch_uprobe_optimize() 
unmaps a trampoline it has just created if swbp_optimize() fails, and with the 
trampoline sealed that would now fail with -EPERM. I can see two ways to deal 
with that:

One is to seal trampolines too, and just leave a sealed trampoline in place on 
that path. It's already a WARN_ON_ONCE(), and get_uprobe_trampoline() reuses 
any trampoline which is in reach, so nothing is really leaked.

Another way would be to keep trampolines unsealed, but that means bringing back 
some kind of per-mapping opt-in, which is exactly what we're trying to get rid 
of.

What do you think? Either way I'll Cc Jiri and Oleg on it.

>> +#define VM_SEALED_SYSMAP	(mseal_sysmap_enabled ? VM_SEALED : VM_NONE)
>
>No, you don't use the legacy VMA flags API for new work. Sorry.
>
>See above as to a pointer as to how this should look.

Sure thing.

>>  static bool range_contains_unmapped(unsigned long start, unsigned long end)
>>  {
>>  	VMA_ITERATOR(vmi, current->mm, start);
>> diff --git a/security/Kconfig b/security/Kconfig
>> index f7bf6cdc6229..d5e83af1bfc6 100644
>> --- a/security/Kconfig
>> +++ b/security/Kconfig
>> @@ -67,6 +67,8 @@ config MSEAL_SYSTEM_MAPPINGS
>>  	  of writing includes CHECKPOINT_RESTORE, UML, gVisor, rr. Therefore
>>  	  this config can't be enabled universally.
>>
>> +	  Sealing can be turned off at boot with "mseal_system_mappings=0".
>> +
>
>'With this configuration option set, sealing can...' right now this reads a
>little like it's defaulted on.
>
>Also can we move this Kconfig option out of security and into mm please?
>This is explicitly an mm feature, and it should never have been added there
>(mm needs to know if somebody sets this default=y or something for
>instance).

Sure thing.

>Tests as separate commits please.

Happy to do so, but aren't you worried about bisect safety? Or would you 
suggest another way?

>This seems total overkill, you're checking whether a boot parameter works?

It was mostly there so that the existing test wouldn't fail when booted with 
mseal_system_mappings=0, which meant parsing a bool. With a negated flag it can 
be a lot simpler, but I'm not sure which of these you'd prefer:

One option is to skip if [vdso] isn't sealed, and otherwise expect all system 
mappings to be sealed. Then there's parsing at all, and it also stops failing 
on kernels built without CONFIG_MSEAL_SYSTEM_MAPPINGS, which matters more once 
it's in run_vmtests.sh. The downside is that it can't notice sealing being 
broken entirely.

Another is to check /proc/cmdline for no_mseal_sys_mappings and expect the 
mappings to be unsealed if it's there. That's only a few lines now, but the 
test still fails on kernels without the option, as it does today.

Do you have a preference between the two?

Thanks a lot for the review!
