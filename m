Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB534A0139
	for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 07:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051036; cv=pass; b=LR9EYTGFUJaVWMdpLHtburrCiCleLMWMPsVWbinAKrnXXDKgiAmggU47Zj/zA625sRjzmgy96SMA0yXdSpJVVM3N8CSPQXpAwkGXsi1VMc0CgoobqIlsePuFns+zTLTHza3ZK1jz8A/5UKf/KOCULfsKVdEluwFeXvtUgt99l6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051036; c=relaxed/simple;
	bh=7f7sfQlh7zgWV+V7b3mXETPDQ22iJskv8tJ/E7Q5QQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eD1lwgmPZie/mbACGrEw8voBqf15Dy6mImgJ4N0lxO4D0jJL2PK8c3IBld9I6QkFkLQdf64C0UZlm9RVnYZeMlKsuVrc2D0N52We87eUOcwo9rIQQLwTrQs5szxCfNlV9Z/R/wu2tpl0CEIRS02SGa+3ZqxS/PISIb+VHQlgckM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kRs0HGYy; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kRs0HGYy"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so4545a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 15 Oct 2026 00:57:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792051032; cv=none;
        d=google.com; s=arc-20260327;
        b=hcIc1zV4CpoNQ4/FHc0OIdBSUp5bXVvdDboS2DjoqosIqvOF2z9L+syhT2EO5Ar2I9
         YCQcweJkcK2woC+UJxNG+Iz0mr3xTBWOM2Mwl2LdvYCe7yAgSLpiZqy6fkc2/WEmrt4x
         x4WZo4KZYu7OepN3YCjLuSqRkq4rg9jZjyJA/FISQStPLiA3Wk7bATcqWjZzVjrxFeWY
         JdtrVjY4y0wb1YlHPY4oQ89LVYHI4Cbx4pgyfFPLR8FEsk6ieUSUSWSwdkncl/HdobMn
         /wd5kTfNK5+bhZrnLkGVrV0QNc9+xLd2p+83qlA1RCEBuAwr5C/JNg6wlbUqQkW5d9Z1
         xTOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RKkl1w7R6dA7DfPVUlzZJ5GxAp+b4J3TCzk6G6Mb5QE=;
        fh=c8S/GFPHimehEf5Yd0QUq62zSQs1X5jHCTa/q1hQn84=;
        b=p2aKvFypHFCsSte0s/R8cRpjSLiY+sKtW8+KNNq7GIEHldMk2UwZecI4BlF9BwCK6J
         jfPwfCM3LuVewWHdfK8rtgKWIs3R4E8Qzj0b2EzK15rcTUP1Zx+jKrZsJW6S+JIQ0V1E
         jTDCjr14PI4m9mAIgnV+902+ZiGtJlsvzlBqzShE4rorppchlrVtDZ236aPUoRU0e5dj
         jeL5QRrdMoAPgiCphg+waRIx4F9SzvLNDFZkhkJjJtbX/vtTzOG7hzqr6ZmqtPnyMtyG
         vcxfBGGhVbnwtgi4cinQ5HVNCpTqpBS4qw5uyemRoB7aq9QbBdZxaGvTyVuu3MzvSd+t
         h1lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792051032; x=1792655832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RKkl1w7R6dA7DfPVUlzZJ5GxAp+b4J3TCzk6G6Mb5QE=;
        b=kRs0HGYy1hviCGVNCB3IK8xTgTFuhCHkYMTjUA0QOJoGlldLWqLwJhl9BtRjf8SaH+
         fapb/1OknCoe0p1uyQCAiwxA9lGWplkceeGwf+4yBxp7q05nuwc6I0OgUtUcceDq3oX6
         +srzg7/gU1Uz16ODUeNbDwSKAWiZi9bJY9xTn56DG/rYcpe2AXSg7DfW1HvRetN8NCf7
         n0jypJlYBHpGi5TDt2F/3kkrfp9PMXQebd0xaFJpkJyOu0jsoYnGVyIjz57RwdDMxKZG
         wCiwttGWNHkd2XnLxatQDHLyXcNIEMyxOX0xmqP8W3QKvNWfKPDAJHJIm0ubzZf//+4u
         04tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792051032; x=1792655832;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RKkl1w7R6dA7DfPVUlzZJ5GxAp+b4J3TCzk6G6Mb5QE=;
        b=t5Gn43h84CnOaNno0JmA0iVH7b/m3X7GYYZq+22WhvKWAZR3CjAyp7g5IVz4Iaz/Ag
         1e2ZMJa/y6UP1yaqW2XSoq14Sr0DiFOpBVoPezeo0ZJe1JyWnt/XWuyquW9mrG37DlRv
         UCnKgesLE0bbURa3o6cKw2TBSLK0rDkPbpaeYEEwsBFky9aF5Xhb2Hd3/4OYPggEYizK
         7+xgSLBQm+xRnAnZspMPOhtfwpJ5Cqu5+xBSZ6yvDtWerXbIZoltQ/QfSNobdSMsLuwy
         6aLbVpvhoHgRU8jWPIU4f5fGiOU3rznFKwXRFadw4L3LUhLGpAefVTJIXK79p6b+jeAr
         SYPg==
X-Forwarded-Encrypted: i=1; AKwUvBwRg1BfUuVqBK7HGLCs84s1A84Mg/o46UYCEfUJy9rnoqIrzHTUxMbK3pindM81nHqy3OE7bgQfx4aSseAeF5k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdxemMn3Olh0mE6at+6zYikjME4dJeX+xkgcAB23ajTabeCrcB
	hi34WB/IGn+X37ZEW1NGNyqkAX2EadRB+i010Tn6ueznqqTm727aQuF1IrGefqojqyudEWuVUdy
	rb+EIXNdvHRXnHvW7Avd9itkToI7UG1rt1jRZlN6j
X-Gm-Gg: AYBFou2jDsxR7+JHsDfS3qVXKSr1b/M46dz5UdIc6lnLAF351hgamrT8Q3s3CZsGw56
	5gHYIzVGVKBTrHbzP620UEck43GJhocXSm+cAGhvw8JdQCpdbcYWYOElPaylAurbzybpj3b3HMo
	o3zheb2meqz70zHn4aZPPO52JAtNzo1Uxd3XpR0P0lKy+CK8LTJfACG+bbaUm0mSZEeJPkdHO7U
	qM/T8WL7kgeO2ux+o8aXIe8EefZ+JxYXeqVO1sEBEB0VuJmcV4lD1hoGDPuuejH7YJacUjBwXcm
	azsd0ZGxWvtZ6KHSVuRcB0VdVV9p+A/tyZSagLQ5YWnPtf24gQ5auFjBOqbJGLyK85nBH2BOzq6
	bVyye+1MVIcdSVA==
X-Received: by 2002:a05:6402:a6c2:10b0:6af:8433:3c7e with SMTP id
 4fb4d7f45d1cf-6b32bb8bfcemr13427a12.2.1792051031273; Thu, 15 Oct 2026
 00:57:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015073736.2944215-1-tavip@google.com> <179205021846.408196.14808616314279740107@kernel.org>
In-Reply-To: <179205021846.408196.14808616314279740107@kernel.org>
From: Octavian Purdila <tavip@google.com>
Date: Thu, 15 Oct 2026 00:56:58 -0700
X-Gm-Features: AclHuK8v7XQtgecDV0jsO__BHD8YwxutmfG-K5IsGFWan04ZMe1cAcKU4mLeRAA
Message-ID: <CAGWr4cS1rmo9+6gT==D1FGb34K9KW+uPO=se8-WV8YE-SJP8pw@mail.gmail.com>
Subject: Re: [PATCH net 0/2] tcp: clamp return value of tcp_wmem_schedule() to non-negative
To: netdev-bot+sinfo@kernel.org
Cc: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Willem de Bruijn <willemb@google.com>, Wei Wang <weiwan@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 12:43=E2=80=AFAM <netdev-bot+sinfo@kernel.org> wrot=
e:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>

The issue was discovered in production, here is an example warning:

------------[ cut here ]------------
WARNING: CPU: 1 PID: 939331 at include/linux/thread_info.h:249
tcp_sendmsg+0x10c1/0x1530
Modules linked in: kvm_amd hdi2_standard_ftl hdi2_megablocks hdi2
xenolith stg elephant_dev_num nv_p2p_glue vfat fat livepatch_v1(OEK)
k10temp i2c_piix4 i2c_via_ipmi i2c_mux_ltc4306 google_bmc_usb gq
cdc_acm xhci_pciJun 18 01:48:26.051200 rdht15 kernel: [66690.105140]
CPU: 1 UID: 368767421 PID: 939331 Comm: DefaultEventMan Kdump: loaded
Tainted: P S      W  OE K     6.12.63-smp-1400.86.0.0 #1
Tainted: [P]=3DPROPRIETARY_MODULE, [S]=3DCPU_OUT_OF_SPEC, [W]=3DWARN,
[O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE, [K]=3DLIVEPATCH
Hardware name: Google, Inc.
           Arcadia_IT_80/Arcadia_IT_80, BIOS 34.86.0-0 01/25/2026
RIP: 0010:tcp_sendmsg+0x10c1/0x1530
Code: ee 44 8b 64 24 3c 0f 84 ae f5 ff ff 48 8b 7c 24 48 e8 f3 a7 23
00 41 be f2 ff ff ff 4c 8b 6c 24 10 44 8b 24 24 e9 4a 03 00 00 <0f> 0b
31 c0 e9 7e f5 ff ff 41 80 8f 84 00 00 00 01 e9 00 f6 ff ff
RSP: 0018:ffffbaff64a6fc38 EFLAGS: 00010282
RAX: 0000000000000062 RBX: ffff9c45670d3c00 RCX: 25c2e5210d8ebf01
RDX: 0000000000600000 RSI: 00000000fff8427f RDI: ffff9c43f2fc0062
RBP: ffffffffffe4b17f R08: 0000000000000000 R09: 0000000000000002
R10: ffff9c4c187b6200 R11: 00000000000001b6 R12: 0000000000000000
R13: ffff9c4383ffc1e8 R14: 00000000ffe4b17f R15: ffff9c40fe838600
FS:  00007fe39fbaf700(0000) GS:ffff9c874ce40000(0000) knlGS:000000000000000=
0
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000010986487a238 CR3: 0000000973fb8006 CR4: 0000000000f70ef0
PKRU: 55555554
Call Trace:
 <TASK>
 [<ffffffffa5c218a2>] __sys_sendmsg+0x292/0x490
 [<ffffffffa5c6281f>] ? restore_sigcontext+0x15f/0x1c0
 [<ffffffffa5c6e1d0>] ? __pfx_flush_tlb_func+0x10/0x10
 [<ffffffffa5c6e965>] ? flush_tlb_local+0x285/0x2a0
 [<ffffffffa5ba1b29>] ? sched_clock+0x9/0x10
 [<ffffffffa5bd7900>] ? sched_clock_cpu+0x10/0x180
 [<ffffffffa5be362a>] ? generic_smp_call_function_single_interrupt+0x19a/0x=
430
 [<ffffffffa5f51848>] do_syscall_64+0x88/0x340
 [<ffffffffa6000136>] entry_SYSCALL_64_after_hwframe+0x76/0x7e
RIP: 0033:0x5580e3f28a3d.
