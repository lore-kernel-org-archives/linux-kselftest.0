Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.214.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793661875;
	b=uFeh64d2HVpGoFNrPWnvQVejwu3qI5D2xtjGs9K8y6Tg2XI5SXp6k/NRCc+DEH/rQeIT
	 tkmeDOx8SkseiAp4CaY845Llwg2PVTM+F7+kb/nJ996bQpHU+iaSH5i1CrwbFm8MueP72
	 8ZJoIn8XSFv7Y9+sx11EBt2VAwd6FjzRxF3W6+Phqyj6g9mMz8tQsvOff+y8r/wK1dKI5
	 YKAcYd6TStR2SsCgBu7xqRa0yrBdJ3v8VBpbYu+ximhTnroiD629ppWV+v+oRc1EZsI9G
	 +xTSDyEYYK9eyMvhte/Vf4PlI2b+hsFlA1aGdHzBhFohWeXJG2adLN9FCK+1RiWqoLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793661875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=clGd0kEztycgStZjRN35b8z63U5kKCgKQbE7kXLWxN8=;
	b=ko2+e3xIomTj3tH2cASXlvuUfYIMq1tT9wBG1inJQ6o2btQIqmxttVJcl+L+W+mAGrq8
	 /hJZu9Lkza60iHizfa61s0L04zdV4sc1MblLVk1MCpf5O853Qh7ccCNdoarceofY/TmLS
	 JWBsRNwv/LKKz386QPHlUlLB5RW7vyZbC0Sx/92hew2iXMoVbmo2X41HbTVVrfe7Rm209
	 78kOqAofIIuRQmlfFoHZP47uMkA0HZL70RkQ8j1/nphdwgegHTvjY38RAFp9tprFEhCZu
	 M3uCSSdwNu7hM16pfoKqU94TJdE0FLH37noFAdOBBye2quooMf7wmP6e+akaj12ricA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sentinelone.com;
	spf=pass smtp.mailfrom=sentinelone.com;
	dkim=pass header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=lPNowPvc;
	arc=fail smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B992606A326
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 23:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B992606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=lPNowPvc
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2eb4a9a580eso4020435ad.3
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 15:24:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793661875; cv=none;
        d=google.com; s=arc-20260327;
        b=pIjNP70vo00HEj05QT7mhh/0V54GxhT+s/f7bNU77UTA8ei+j8aHA1j65I6v9c891n
         9Sg45BJfjcBLl6BvAuxICxoLAbnJS2RXkR1uwcadE7/kGdJAJQs5RH01DdzRdZsAnSjO
         FrpSzjr/6WR1uHGFz+7QlS0hNvtHZuozkyoMvP8S5W45tcTEwWFh33b4x6u1mbdIPK/1
         9m9fY1neEJvVlkE1I5Rs59W+bTlfhN9NeCxE97i0unTD2NeJb2LRq/ZC1ttbeL5mu5Vg
         R+YBcMDFelnvWzyZYzPJvt69k+aOXY7xFyAJqbXRaOC+8qoDTGwEbwCXoq4Z4nX2lP/N
         YAKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=clGd0kEztycgStZjRN35b8z63U5kKCgKQbE7kXLWxN8=;
        fh=kfgGSmmr0bUrsWCzvaEfgU5wIE9e4chM+aH1BpJIMhU=;
        b=ci0S16ABwq6TO0VrZItYLL8LBWla6YvGHWRf2kNjcbMkZABBmtp7qa5X8S1MTSUT8q
         mtRjMStcX2rYyWa17Rab+nIGt77YB96LXAb1X7s5al1ehhZmGVDu30Cu6PUG0uMeJnae
         JuoOLEYQ1euJLSnmJzIjNxOfAE2p4yV3rP/NCrVNU7TwbNY32WsgDwfxeVNVnEH5ijMt
         x1YMEd12q81iqf5buAfxKSvWV/MQ1zzSMljn7Y2gixbHBezQ+PP0X7jnc8LIWtDqxRZj
         1nVo8wvGBwZjKYQmQuNVAMIIUO9/+rFYVhGgx2LVtMFml+GlQq90IHukdQuda7dpJuZw
         FZcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sentinelone.com; s=google; t=1793661874; x=1794266674; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=clGd0kEztycgStZjRN35b8z63U5kKCgKQbE7kXLWxN8=;
        b=lPNowPvcJrNcgZcVmTAEbOq+QYlPf5qIaJfVayFML8doyDAU0rfgEOPiXNFqCofLgu
         gq6wvFBEYBDzEVNaIN+re2NUxix3aM/J18omnnVIUr0OZCKaLKVOWuDk5khl0bJifz8r
         eKb2U84UZfX7VFnzXbmaaHuOPtpq10ihd82JhQ3t9KKp4bjJ1zTFMWFVmogRrE9cR19O
         /yJmNG62lBW6t4DMj/zGNmTExT2plbfBQ1wZ6A3eRN8xHAfp53dfYDKyw+0gY44qraJR
         wI0HX9K8s2Y0K38xJU7tGnAo5FmneyllJ4fMQ6FVJBADUJUSBtg0pfaHBMeziROEHYej
         bRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661875; x=1794266675;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=clGd0kEztycgStZjRN35b8z63U5kKCgKQbE7kXLWxN8=;
        b=SwLBm6GYa9m00n6tJ0EIibjGTOxBDJzhBCKLC3kXvvlNla11VuZVvHvlZTiYgQ5CFi
         9CGKY7n94dk5WuQWQf63aV6AN/aa0TXIhE2Cl2/uytcGlHXv/NWJPTw3/L4jimPHR7r9
         nq4t9kc1Ub3/md6BXM/qbHhlzNE+mk5L7IwTLHda8juKOy4s7I5rH6ZRGEWjDqBwI+Wo
         1AvRVW6OULf1VzbWP3ybnFlTastKlHGKRCvLlE9RxiOJeAL+s5c9wqMOtf0C+c1XbFqH
         AusyaAhFuqMdYDXNK4oqPhmLEukWp7YIXHy/wlNJ60i+UdXOLWKJdiXiZrRqoG4tdmFw
         VU5A==
X-Forwarded-Encrypted: i=1; AKwUvBy5FzNseGjf3u2T9qWNR7rsqXKQuftntt3ukxYNmgBNHfLU68ELVGxqllw2vYz+slDf7t2dnnG66flcnxNYuh0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TSgLiXe8CKu+dJ7Fy2FEWYEk/EQySuZ05RFdoNLTlF0U36/mU
	mYBtVjaeKlpEgb8d4LBVK/8WfZQ2h6hpSWud0W29DbTRoL55C1P29DNNpCIkGOZ5eIpwiHRBCdc
	K1o76r38Ch0gc+L0x2dum+EzO176K/ZllQZI6BY+f3g==
X-Gm-Gg: AYBFou2ChtQOXBPtBohVBqBHWwdALbbAkCzl7TDn//Z1WLJlgLNZolTZjAZl7PYwYKH
	BwXPVzpaT3W/sh2q69RBMveOzMSxJG/ZduVArkof2hHzVqceJOn3gT6Ne9MTRiLwXhstMg4zhjH
	pj4NSqrolZddBW/c7gHaE1D7ToRZj0iacdTiP0pL+3RXnJD4l1oEp6X3xWpHcL3VriI9qaw8pny
	cvsYqYzapUUzxc5DVS8KlJjHhSKAMYnOgk/wbGPst4b3rr84c+JiJ8bkCwYZ4y9X33sdBtrIAg4
	BXATZ12fBwvlKxVJEguL4yizH35r2kIr+AklAVO8wp4DN1H7mGmaPIE7TXC5+UrHo3yYK0o9c5P
	XNG85N7YBqyQvX1NGkBSKAjTZpYyDeVy6tkgO4WY/yxTtfkNBHbBrILMgJUoG
X-Received: by 2002:a17:903:3804:b0:2e8:3cf2:49a0 with SMTP id
 d9443c01a7336-2eb36405287mr188158475ad.1.1793661874532; Mon, 02 Nov 2026
 15:24:34 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com>
 <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com>
In-Reply-To: <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com>
From: Mike Bazov <mikeba@sentinelone.com>
Date: Tue, 3 Nov 2026 01:24:37 +0200
X-Gm-Features: AclHuK8h_cYpK4lk7OO76ee8Kks2WVPwHiw9tfTN1WU_Lw9F0nS26YCUvD9J2rQ
Message-ID: <CAPnbwjrB_je6jXt3BGD-1q1yFs_wFd-Yh9KzixKzLK_X3Stuag@mail.gmail.com>
Subject: Re: [EXT.MSG] Re: [PATCH RFC bpf-next 0/2] bpf: Do not let preemption
 cause false recursion drops in trampoline progs
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 12:22=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Sun, Oct 25, 2026 at 04:02 AM Mike Bazov via B4 Relay <devnull+mikeba.=
sentinelone.com@kernel.org> wrote:
>
> > Is disabling preemption in __bpf_prog_enter_recur() on !PREEMPT_RT the
> > preferred fix for fentry/fexit, or would you prefer a different
> > mechanism for reconciling preemptible execution with prog->active and
> > the per-CPU private stack?
>
> No.
> We cannot disable preemption, since progs are not short
> with may_goto they can take 1/4 sec.
>
> Sounds like private stack is the culprit.
> Should we disable it?
>
> pw-bot: cr

I think disabling private stack alone won't stop the false drops by
itself: for fentry/fexit, bpf_prog_check_recur()
is always true even when priv_stack_ptr is NULL (as in the reproducer
and selftest where stack < 64B).

So when Task A is preempted on CPU 0, this_cpu_inc_return(*prog->active)
in __bpf_prog_enter_recur() stays 1 on CPU 0 and skips Task B even when
private stack is not used.

To fix fentry/fexit while keeping preemption enabled, we'll need to:
   1. Disable private stack for fentry/fexit (so each task uses its own
      kernel stack), and
   2. Check recursion in __bpf_prog_enter_recur() per-task rather than via
      the per-CPU prog->active counter (still blocking same-task recursion
      and IRQ/NMI re-entry on the same CPU, while allowing a preempting
      Task B to run).

Does that direction sound good to you for v2?

Regards, Mike
