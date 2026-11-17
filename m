Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794896949;
	b=GNxlZALygoFlIIznsqVG+hp9TF3qBWvDak3CzrgQiDLmfXVlnG5T/Jf6YIpDWeplGVHp
	 iDxkJxSynAJh71QYgvGB9q9JxTCi7EvczZm3vvbXqcwANTLCpqqjd7xtuBuVpUG2HnvAT
	 Lto3WNcKWYLWAVAsQdGr+Ol2wRqIDQOde39OTfcOktQVwCMT84GG5Q1KZY3hHS/yyLSGe
	 EKwdN6V4HpqG85ldT/QeT4ocXtGujwnp5KBwwozMxdscwk0Stqc0hMBoSpK2zhkcQIXu+
	 YwACGQbcLcWjlxf03443/5MTDoodzR70O1d/UgzdSMPf4U/KtHQFuen2VS3BXybfE/A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794896949;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=G0iDvC+B4B0fRKTR2Ol02uhhw6NV01CbR7lNEbBKZ3s=;
	b=mB7IpGreG1eVCmuBykHGsllG3kd4750PUtWSWoaT1mqzKwwhRGivTJXXKqzYNcX361V7
	 rI/aV6W/shru+b4YhJGptqE8wNYsq97cX4YKwwUKvndSvqcBOPhocj5HH/9bGg12KvJdJ
	 ErUaZabHFX59OpByHhofLGzs58zxJrm4QwFoW59dkgB4DQxs9z3wEoPU/EwovMC4Ahq2w
	 93bSc/m0XBYP1xZVFV4l5VV675HXnZVKsA9m0f89p4isQsdCYPwMsParFNnUd637YBqTj
	 gUfL8LuaNETMMxtulUiCWTOe8ttIdZjZocnW6y7zIJGEfpDK8/VH872xq+4LaayOBHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b3uaHFKF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E79606A329
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Nov 2026 06:29:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82E79606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b3uaHFKF
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-492690dd5daso4015045f8f.1
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 22:29:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794896948; cv=none;
        d=google.com; s=arc-20260327;
        b=l7N3T76iwfVydJ2h/FCKnPo9yd1bvgBdTX19Cn4SYL9VKUvg+gczXmGpF5Lr/HXLB8
         K/a5qW9T4rUmozi8FFC8kb99qqtUHh/sFwotOk1dpD8ZLJtXc9sDPGzj9RYyAiE7yphc
         W3tgJFwcvgRcXEIYLME5EGM1/Rink3z7O6EqOnuyGqowL3r9unONdBqlKmUUO/IbLl0e
         q8meWBMq18dmQhVZbWQduzYa386cDM/2VSRxfQLk6B1EwXotGHYg/bXoXS6+4GwFnRzL
         TiQUNG0nqwfv5K8wZJ2pmLkknmj4Vkt4I0GFbefzqDIzZ5Ngu4+q+9Rg/hlO+hCIvhpX
         SHuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G0iDvC+B4B0fRKTR2Ol02uhhw6NV01CbR7lNEbBKZ3s=;
        fh=sRPl6P7ifybPt5ZEfDYmppBKz/Wb8bdTyhkW+q+ByBI=;
        b=cmlraJ0EAcOKipO9fbZ+T5deH3XnTUvnMj17RA8Cvc3A2QGTUV7xpXQadq1/l63YU+
         arPs2lmSS7lR/eLcWcx4TwPK2OVZiQGX3w8YJP+HbX6MXCwH9OZf+NFBU5VHwr+QqnUh
         PSKrW/bKEBEKonHuweDHguZbetdH+zlhAFX4hpp801X/lvfkcmz1CFPDo6r5cIQaQWkE
         ZNKgAULlcrVms8dbL74YQ00PLJwdTZsHthctjZec9cm3z5z5gM/thZNTST+OEGqfPc1D
         BgspBNkWikD6pkcX6U4ZX5BBlW1IgJuQWVkNixPywYDFSp4vLWpe6h24vhXsXEW9n/rD
         U//g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794896948; x=1795501748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G0iDvC+B4B0fRKTR2Ol02uhhw6NV01CbR7lNEbBKZ3s=;
        b=b3uaHFKFRmNqhgR4HFR08IC0FriEQ2Fm87S5nwb0GiRNXm4Mv2ykktFuKoqXe88p7E
         EOlRr4WxCb1NQGTzgSujdzYz6gxyavsZt254VavABpnJdfFqijDlw0Xpmrfww/Z8yu5m
         ah1034GnPxUBYajPQqRqvec0qo5LxSAswVwNXmHjrKT3eb1sK0vGspKCE7jnpEsKMnjw
         7OueI+lCjem7RIvtTX6tH465zKabqZlrzxVxbyRdsoBmS2cBhuqI4LLZZL19r0On82rt
         BtzfKduW9sT6BC2CjMTnYNt2uJ7+WO+Bm6alWy2hZM+sg4xjWw8dUhXpoWMzWtLz6vnj
         KuQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794896948; x=1795501748;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G0iDvC+B4B0fRKTR2Ol02uhhw6NV01CbR7lNEbBKZ3s=;
        b=cdnDPBWv7pVmOQKucC7m8yZLTaSE8LJcNqQaqnUtk05PpVV1+gp2qd3/RR2sVyd8QW
         djHl9fLw4Yn0LnaJues4OTnMw1vDDaxKNmXv/jL1ty54/nsDMDZNYEHSNS+e6EiVFNHP
         NFZDqZMoUNWOA7upf0Q81X1tKpwZx0c2OZ3YPpwN+uYxtg4x3n5bco6i/wQAeioUDkH4
         DH97GdKRfCG6o0MTKyRfqI1o5p7Pe4b6Dbg0OegjIjm3pj+LAa9x3wJBW+Y7NWEunt+Q
         12MoscGlGNvuHjn7zfOOOSx9n7m88/V5ecQBFMzb8qyniUxzq2HYSkdLOHya2MZm7h+B
         6FWw==
X-Forwarded-Encrypted: i=1; AL+hErFfY54azJXe8buUegypEABQ0assM3JoutMOXh3BtS70mPtz4G8b2FFEHkJ5DQaoqAHLldWfP7rGcToF2uXq17w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TPPaLan31GfzvXlkhYIItiqFNrGwvpVzdGL/DvQc+Y2Dk917k
	st9g381+VW+k2WVu4NdNgK9I27a3sfNfzAS4zVgJAxFISji6QV80KCokpA0rt6NiigTfG5ie35q
	ek/lsJxOnQQE2xRy4KoCBi+z/kgsnWaHyMlWHZhI=
X-Gm-Gg: AZFdTZc2TmZC8E6UQj2omGdZTXTj7GrKfaFoldw07Q/L6oWby6lIMdmgDuHn4o8z49n
	q3jL/VMemuuo2OF3Tshg27baZKQfWvSwOonsY37T9utsdLhIrYJaRwUxokXslIe2B/wbCN/Ch9D
	M+jpieJin75AwPvlVDXVCy/m0J1F6wpLkfhtUCq/k4DKltnyPB4Ai3dN5zRs8cq09MheGFz0iX2
	Kh51A1sFnjhlB1J6YryIYIHkIwuJxtcJiTIvav+XaRlxddYE0Jo+yXQlSpJW2JvvahNQZppa1cb
	YeOvciDfuHRaHFj5P2LAMrLLq2DyUE9rGPYHiFpD9JYfl/P28gL6drV/205jnyBxUuCVP5MkabN
	7WCWyaYqSjixUS3ouBQgcl1Rmibj2cm4LtVbzfQqx3Ab2LDPte3TjFSDl8sXSntOtnzQ7eVpLpF
	xc5w35E9MIbr2T65RhEAvPmbiEZNL1JSFYKDXWf4WUkv+g9Os5qHdUmgTiV99u0ok4XSki2vRes
	Yr3Zs3dOlxoFodmBFJEvRpD7ofrADpSK5a4mWPWREEerOMKafvpkg==
X-Received: by 2002:a5d:588f:0:b0:48b:a4b:5a2c with SMTP id
 ffacd0b85a97d-49c6d4538fbmr30173022f8f.3.1794896947228; Mon, 16 Nov 2026
 22:29:07 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116192638.233125-1-mathieu.desnoyers@efficios.com>
In-Reply-To: <20261116192638.233125-1-mathieu.desnoyers@efficios.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 16 Nov 2026 22:28:54 -0800
X-Gm-Features: Aa3M54raYIy1g-9GeSnu5j_oFGcUIQnF4PF3c5nPsw_P6oUqhgerrCyZAxXvPIY
Message-ID: <CANDhNCruzSQ3r3WKPz9J6J5-DEm+L4hC8g6PvnuYnx9SiBTKhA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/8] sched/proxy: fixes for proxy execution, with selftests
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, linux-kernel@vger.kernel.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	connoro@google.com, arighi@nvidia.com, akpm@linux-foundation.org, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 11:26=E2=80=AFAM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> Hi John, Peter,
>
> This series fixes six problems of proxy execution, and adds a test
> module and a selftest for them. I found them while I looked at how
> SCHED_DEADLINE priority inheritance could move to proxy execution.
>
> It applies on top of v6 of my deadline series (link below). Patches 4
> and 6 need it: they change code that v6 adds to the deadline bandwidth
> accounting. Patches 1, 2, 3 and 5 do not.
>

Just following up again after playing with your tests and patches:

So I picked up your test-driver and kselftest patches first. Initially
with my tree, only tests 5 & 8 passed (with sched_proxy_exec enabled,
with it disabled all but 6 pass).

Now, I know this series is dependent on your deadline series, but I
figured I'd try to pull the independent changes first.

> The fixes:
>
>  1  Reschedule when a blocked task is woken under a proxy, so that the
>     old owner stops running on the donor's context.

With a variation of this one, tests  1, 2, 3, 5 & 8 passed.

>  2  Wake blocked RT and deadline tasks through the full wake-up path, so
>     that they are pushable and another CPU can take them.

With a variation of this one (basically dropping the shortcut rather
then special casing dl/rt tasks), tests 1-5 & 8 pass.

>  3  Stop the chain walk when the blocked_on chain is a cycle, so that a
>     mutex deadlock no longer locks up the CPU.

Already have a fix for this.

>  4  Tell the class about a proxy migration, so that the load of a fair
>     donor is attached to the runqueue it moves to. The bandwidth of a
>     deadline donor stays in its root domain.

Have a partial fix for this already, but the deadline donor bit is
dependent on your other series.

>  5  Clear blocked_donor when the donor stops donating, so that the
>     unlock path does not use a task that can be freed.

I've taken a varient of this (only clearing on proxy_needs_return() -
happy to expand that but I want to understand your reasons more) and
have some related changes to clearing blockd_donor in other cases, but
as you mentioned there's no test case in your test for this logic.

>  6  Check and admit a proxy-migrated deadline task in its own root
>     domain, so that sched_setattr() no longer fails with EPERM.

This one I couldn't take as it was dependent on your other series.

Basically after the first two patches tests 6, and 7 continue to fail.
Interestingly, 7 does pass with proxy-exec off, so I need to look
closer to understand what is happening in that case that isn't
dependent on your other DL patch series.


> Points I would like your opinion on:
> - Patch 2 sends RT and deadline tasks through the full wake-up again. Tha=
t
>   undoes part of commit 7918cf369361 ("sched/proxy: Only return migrate
>   when needed") for these classes. Putting the woken task on the pushable
>   list in place would keep the optimization, but it needs a hook into
>   the classes.

I'm not opposed to dropping the optimization for now, but Peter added
it so he may feel more strongly and I'd defer to him :)

> - Patch 1 reschedules for any blocked task woken on a runqueue that runs
>   a proxy. A fair task woken from a delayed dequeue there also triggers
>   it. That is harmless, but not free.

Agreed.  Would adding the resched_curr() logic to an else statement
for the if (p->se.sched_delayed) check avoid some of this? As I
replied to the patch it also catches cases where the we're proxying
but the woken task is not part of the current chain.

> - Patch 3 also stops the donation on a ww_mutex cycle that the wound or
>   die path is about to break. The donor then sleeps on its mutex.

Is this a concern or did you verify this occurs? I thought we
wound/kill tasks before the cycle gets created (see
__mutex_lock_common(), before we call set_task_blocked_on()). Maybe
I'm forgetting something?

> - Patch 4 repeats in proxy_set_task_cpu() what set_task_cpu() does
>   around __set_task_cpu(). A helper shared by both would keep them from
>   drifting apart. I left it out to keep the fix small.

I've already done this in my version.

Thanks again for the extra testing and sending these patches out. I'll
include the one's I've picked up in my next patch series iteration on
the list, and hopefully we can sort out the deadline bits once your DL
series has landed.

thanks
-john
