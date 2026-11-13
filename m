Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559052;
	b=shn+DvLJb1LP167jg4dxyZUQtcw+2NwXWp+R0oZXyelo4DQ41lrLQjBgKO55coEL2aML
	 aaJAgkr7tCuVYSf6FT4PmXW8Y0sjaqQjhMbvrG0jUR148ZqgsM9tsgeT3oIJLY2CNn0ic
	 572EE4AfWzlCkg8jRc+ujkgVr7bG2Wep7CJ0UTwMZmEkecFK+KiLj4uTMTICAemrBUNED
	 UMOL5NXSqoy3T5ZRpWImgSD+0mh1AP1ZebkA7DyHUyQENn3ZoVqVHg+NCHo/E2tWJLfoX
	 2jdrb+Cm2WE+cmllV5i7l12fy3aLJ0CtQfhNAQlkY3QtzrtLTJq1Tfj6oak99ZWp0jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=sJIOxVLfQnp7+n8nARFfMr89PNvEkzC0ewnXg1DK67c=;
	b=ao9KFWozC+0IUMqZKHM2/TcQBmanF35PIMyQXQrjR6ssoECYuKI8uEiKCqqiDnKV9lLI
	 AOUaMIxFxStrJqWxX1Rq2uhw6pc0l9tVgneMJmHQ1lxUIue19j5lZAMoRyq+pv2JvziqE
	 Oxsl1EMeSbi4GL76mmI1yYDCH5UBqAmzTAX+GkARiu5cY0fSmlzUYjwvZglcTfCXvPFkL
	 cgrg2QFxzkP7IdOX1gwUIXJ3FgLnB/wcbCc5go0P/NWVL2Zxf2Qo5jrPxllUoPrBOd4xf
	 hZR2BscErWCxGf+nAaaAuaUM6Q/Li3yCY3n8Ao5hwMoYYSNJQho32ChssUVi9YnQibw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=kqvuemHk;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279A560A5BC7
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 08:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 279A560A5BC7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=kqvuemHk
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ed1414df17so5056805ad.2
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 00:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559051; x=1795163851; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sJIOxVLfQnp7+n8nARFfMr89PNvEkzC0ewnXg1DK67c=;
        b=kqvuemHk79RFnSsKnGqcfaCFlZsslhnlt13wX/OUB5ofsLkrIWggKEmEwHtZeYNUed
         cHUXB7/QF/2P3xKfMCBKIikUlfB4RfHXhRcgJQHQjdOKGwTRFlMN+nvnkolIcdTpEHZX
         2Ne3YX9PJzZJDR4Z6rIiPDlegs0QpGRkNB87Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559051; x=1795163851;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJIOxVLfQnp7+n8nARFfMr89PNvEkzC0ewnXg1DK67c=;
        b=wiNSDAbRlEKZbnjhKxBbxaMUltAaY/aH6c9EYhI7VQk2iZ53CjMQ/oOx++TKGgBgHY
         fLhq7C36kle/Awh7c7+82b0f6ujWm4dBtwoEVIzpRoNhhb97rFCsns/9NDOH7PDMxuYf
         BB+DLJZyU06rtQoO6bxDBxudMyfZ+PJQDzQskgnn5W3hB+PSQDvg9HTDya45cWTH4hkr
         5FTuH1tzj0R1cyK4XV+U3Oc3Ymn9nybfw8R/DdY67yklO9jR2LmL4csZauiDMAU/GiMq
         0vBTxUf55qtkOPvaHIw9fV1Z0k1KGaazWG4pq7qqEOsfm5qBpWFsHjCc6bZdWrbIPOi2
         mgag==
X-Forwarded-Encrypted: i=1; AL+hErHMOnzKRtoDalDl108DWg4qlUyEUmK6qFqaoyii3sZaw0N08cL4cCqllVp17m75H215yF0AYJu4sw9DKoaOMbs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pIDPBLiYfHz+Pwc4BGKAWl8Gq8xRlUlVHvoG42KGkkTcbG0eu
	webaqgfjsLeHUSfHtOgsANUFic1GMyUMn3HyeYH3qoHcuQTi8BNUKcwwmHmmk0XA+pA=
X-Gm-Gg: AYBFou2OajifmfGJg9VYhsqJLyByUDbnSxBDSAZcyb9ZMAAfkaSc5IZrzgsiYNTLGSI
	0jrTm5yogInx+F12MU+u/WCA12sYcXzRuoMWEmTgqOPywNbtfiniPx/pP8c+FyThqDCY+BgUpPf
	wqC6B7VkH788w4ReHv6NwLoXhJQsdRDcUJ69tje/uNdlyMmvGsrcT8CO4nyyPZ3EBd5sXSZ9ZUQ
	y1HMmHI2QCrLJDDgFTG7c6X77D4Dru5+TveZiWTTo51a88ufEAeVZWbtZYJF3iW6ezsCfpbPRdf
	Llytki48HXF5qII/v4bHTN9NaCxF9WWuj6HCNzkbfN+GZ1yNLVH/dLG8/ZrBHpAui/Zv8sCjKKA
	iFrCE2rtVzfsr6WKzJqCvtacHDr6iA0IWK2uZX7NpNwEhgTIkNZH63KH6iG3wV6ngR0Lz85azvW
	iEIJ01tggA1cYp2aznJQ8skuYOZWd89q8MnAfPNTFNSqLlotWTaJereQmk7kK4XR19VYxsUZl4I
	EV3v9G9BnGg6REr89FX5PfvMlKJ4SrCJWT0SG4IabwlSAhrgXYOcgidTQrT26ksYV79G/IKsttr
	Ksn7nyJSTqHoFrxEqxcxdB7MYoM/fnuQtd1ZmnByGJ62foePwe8AQG7b/co042+QD5WdFU0y6+1
	/2nXM5eLnFy5gfwZop4FjD63Uhlz4J+YWwwHLw73N1gnwg7DD6v9DLutvpXycPZTRuLmQhupp72
	afaHkawodBGKrZAQHnmVZ8Kl1q/Jn79R4XzNcr+s0DMVt4WjROmVW4rYNOzK0=
X-Received: by 2002:a17:903:2b07:b0:2ed:3057:4f79 with SMTP id d9443c01a7336-2ee0de41b68mr16715855ad.20.1794559051439;
        Fri, 13 Nov 2026 00:37:31 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75dde9sm6785655ad.22.2026.11.13.00.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:30 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:29 -0800
From: Chris Down <chris@chrisdown.name>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Kees Cook <kees@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 2/3] sched/core: Add sched_stack_end_check= boot parameter
In-Reply-To: <20261027101703.GB2668564@noisy.programming.kicks-ass.net>
References: <cover.1793082868.git.chris@chrisdown.name> <3d2bb6a8508b9d801878bb82c88165a1b1ff5f40.1793082868.git.chris@chrisdown.name> <20261027101703.GB2668564@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113003729.4a4222d8270db2bd@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Peter,

Peter Zijlstra writes:
>I just noticed that there's a number of task_stack_end_corrupted()
>checks that:
>
> - do not also do task_scs_end_corrupted(); should
>   task_scs_end_corrupted() be put inside task_stack_end_corrupted() to
>   make sure they're always done in tandem and the shadow stack check
>   isn't lost?

I had a look at the other callers, and I don't think the shadow stack
check is being lost in any of them. Two are the oops paths in the x86 and
powerpc fault handlers, and neither architecture has
CONFIG_SHADOW_CALL_STACK. So putting it inside task_stack_end_corrupted()
would only change __might_resched() and the stack tracer, and only on
arm64 and riscv.

Both of those are about the task stack in particular. __might_resched()
got its hint in
a8b686b3af44 ("sched/debug: Check for stack overflow in ___might_sleep()")
because at the time a stack overrun could corrupt thread_info and trigger
the warning on its own. The stack tracer checks right after it has
recorded a new maximum depth for the task stack. Neither has anything to
do with the shadow stack as far as I can see.

schedule_debug() would also still want to check the two separately, so
that the panic message keeps saying which stack it was.

> - should these other sites also respect this switch? It seems weird to
>   only have this one site affected.

It is a bit odd, but I think only this one should follow it. None of the
others depend on CONFIG_SCHED_STACK_END_CHECK today, and the switch is
only meant to be the boot time version of that option. They also only
look at the magic once something has already gone wrong and we're
printing a report about it. The stack tracer is the exception, but it
only looks when it's enabled and sees a new maximum. So there's no cost
to avoid by turning them off.

If they did follow the switch, anyone who leaves it off would lose the
"Thread overran stack" hint from their oopses.

So I've left both as they are in v2, and the changelog now says why the
other callers don't follow the switch. Let me know if you'd still rather
have them folded together, though.

Thanks!

Chris
