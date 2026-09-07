Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E94346E43
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 23:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788824086; cv=pass; b=KrjwBbhnwv5NkWoPO6ufiHovdCcqVmaWVv7hiWDslb4RDqJjuUTfNxG1xg+yjmemHuJ2BRY8RXDJkXb8234JDnyBSuAbkig5Rjx8P9Cc5k2W+/aBXz8y6u99TV/8eXFkZG4fodPvwLyKy9wXcGD+RyiPY3+wje2MIgSs6OKd0dY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788824086; c=relaxed/simple;
	bh=l6bwwoVueCaG8E45kbLYaQURVS5qLWt2C7NdrvXHikY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XFSK7vRR2AaA0idx7Qq2oZE8Oneb4+47ZE2ZZ7oBosTLloPw86StEJQWGvXuwCgdT5HNziRHnP0Wvecg4MNou46K/W1oB1TAVxjcUnUuetlxHNGToKaPK54LS4k3PIHXSWcUbMfLsaiacuUOWpQo+RQX1Aq9mWY2kj1NB6GeolQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LueDEPZr; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LueDEPZr"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-381b831d535so6422015a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 16:34:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788824085; cv=none;
        d=google.com; s=arc-20260327;
        b=KIvp3ONcfaqYs50O9wZy9wm6kRJHTmGl45L0Zm011DJnLXqz5moeebmg090HLB38Fx
         bgJJaqfjS6H18qSF8CE42lyOHQ+Ue52IaRGSaXjONcC+iodBfWN/8VvmkrIbLfJKJ5Mq
         1/d3SHWrrwQNOuPDsSSAYmgYq6oKjS5nCCtXQGGNscI+xaG4oUbKFfr55F7+aqEQwio3
         /1ww7oJMuNcIPViD6qFAkqtaWSbIvU+qHXHBXYq/lM4COevj2gKWp3x9dJaR/EfQLEeh
         SfR1MWv2ckgMAuSLyu+c/o5L9hRjF/+k1TJV2b43N2YZvJy9RZ/5yEHavdPXbXRW61yq
         +37w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Awv3H1wnvCKoXScc4pcndUyTglaueBmQi2mzpL4GQqA=;
        fh=eVC+0FhxXF+1aImTiE8702u33R0uJUiguqekEDEFQ+g=;
        b=iqNatYYB/jyzqZ677Qd2//WAczhZ6JHbXrdaG0JnMqwMcWIxbTojQhNaBUhp0fW8Ea
         h8ziB74H3ySqWj98F7qmfnykz2EEWdovUVoCmA5Cb6/TQXpnuRVaBQ4dE/t7GlMBu0Lj
         wE1OnB6ur2lsH8nTx4rSh/Tpgl7qr9p/X6wmyJWIA71Ngy7O7L5BvTm0TzT834wkDjBz
         kCVWEWIIaxCsuBdtGaBCONAjq8177vmkxAbMhIRHcRIPMsrXOP0HdegaxQ8ZE11gKAA/
         P4Eb5AXLSH8g6+eXmQ7OrR50CWFQP+dsyz4CU8Xo1lIPmv297gqEW9fQ2Ji3fYTlLcH4
         JxCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788824085; x=1789428885; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Awv3H1wnvCKoXScc4pcndUyTglaueBmQi2mzpL4GQqA=;
        b=LueDEPZrwERRQSqM4jQrV4y5AcPQiFDDOxYgL798newQ1GTpIjbL3H5vEICl9llvd4
         Y92DZADnXzh2vJDaQPscrI/URK4PCO33pne9encxE94MXh6t4BQ2eeu+mDP3InZkgve4
         7vbvzttqw0aiGB0pI082mmpMQBE2Zo5Ef4cg0YlV8Pge0uITCSJ9YqYDpUUAKteDsOZl
         svnjiO2HuX0cHbYXpXQH3gCGtMYzg6tTM8oxMt7tDr4BSffy5A+mdjJHoeBAzt3qqeD3
         o+4c+M2UC0vgAZQBjKcwNV1eF2Vr86KKswB8/Ttv80E5547Og37X9ZGnyt2tL3d1RoBo
         rmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788824085; x=1789428885;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Awv3H1wnvCKoXScc4pcndUyTglaueBmQi2mzpL4GQqA=;
        b=hhB0eWaToU2sM8V17mbypUjUrkm1SiLHN1jI5/0ypr7M+tkCKgDaNIoaXThf1tJf6A
         AxbZxGxkJNkVyHFQYiMOjxFjsOqdMK4EERvoEO2sFwDgtoxu1HDvbEi+e8CvaWdKdwFy
         C3yJkd4CfWXSWtNk8S3iR3XfXO7kohW9L/gbDXtJ6kbY/Uu+eVRBpqBLeH4sl9mCz70T
         Xcts5GaaJwrZ76Imsz4ZftDl3wT243OzLrJUJw0xsw9eA+a4yIMfat+OW/zn/s7U+WzX
         SCIgaoe62nNt9KsQJS/WXFmBSwjokPYy6fmNHk9+lSXjj/WuB0QF8rS+/TbESOd7Q8e6
         TG0w==
X-Forwarded-Encrypted: i=1; AKwUvBxKv0bM3kZZHohtuKCSZ3DRQ9rcVCO+VCPa+X1zXw+gXmixsREev+bCftf6cg3WJIEGQznt0gRwb1wW1K95DGk=@vger.kernel.org
X-Gm-Message-State: AFuF++mow3meYNv/74E/+48qae3i0alYvPpDj+i023R36ieIBwnwg+gH
	CMXBWKP5cxzG3azx2hUNS9O8PXjeS1JaAWbzQ9+KPf9eHAwYM9Z+jJEDuZtlz849u2fQWfIOwIk
	IXTLKDFas7xMGIvwWVEfNSjaTNYown88ZBy5pInSW
X-Gm-Gg: AYBFou0QQARslqYXq1qLfdV/uiJrEZJyF/HpDv/S1gCT9uiXlMgtInPMe07YwDd2CRg
	ZhwcuPjEePUlsJrWXTxVuSITWChu8gNUmv4KX/rtRp4zTmcnuFbCsNeHsE6R5hpzeEnfjir6xdA
	D0Y4B5itURONfasT6BVX+w2dhsP0I+a1ij8th+4OglyUa2AkJRP0JH1SAHT+UfAjbYYrHdWPEWR
	CooDXwKiDaG+gApUI4U1RZKq2/Q5NKfhHyNTY9oV5qiWoClmXKR9jmQUGAjHdwwLCeMBqSskwkn
	lkzfTwCetUT61yZ6JlT/8ZDGTeiAz+oJExLdXG3MCJqkGPVxfOhoSPPGYN23xsjQKoIREbyKDMW
	yVGv0CZVBfvujwDnoHY9jmRxifzFwZ06z76UIVOBwAGvCzXI3vI3lZ5FO
X-Received: by 2002:a17:90b:570b:b0:398:deed:6e1d with SMTP id
 98e67ed59e1d1-39b260de5bbmr39739841a91.5.1788824084339; Mon, 07 Sep 2026
 16:34:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906074135.185212-3-jiayuan.chen@linux.dev> <0aa6425f9e8f32705ae827f6325b29079234c3f3d0c7b2cdefba3e5b50432766@mail.kernel.org>
In-Reply-To: <0aa6425f9e8f32705ae827f6325b29079234c3f3d0c7b2cdefba3e5b50432766@mail.kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 7 Sep 2026 16:34:32 -0700
X-Gm-Features: AcwNN1UK4ePHf92C8dfodAq8wlNSEQxGqv1s9W_oplqA5uHsM2tjuHOURyVXA5A
Message-ID: <CAAVpQUBztYDHyiCN1fnhdxCPv_5AZ09yCMQfNW96SzZyw0LhHA@mail.gmail.com>
Subject: Re: [PATCH bpf v2 2/3] tcp: Skip cond_resched() in
 inet_csk_listen_stop() under BPF context
To: bot+bpf-ci@kernel.org
Cc: jiayuan.chen@linux.dev, bpf@vger.kernel.org, daniel@iogearbox.net, 
	john.fastabend@gmail.com, sdf@fomichev.me, martin.lau@linux.dev, 
	ast@kernel.org, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, 
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, 
	emil@etsalapatis.com, ihor.solodrai@linux.dev, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	ncardwell@google.com, shuah@kernel.org, aditi.ghag@isovalent.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, martin.lau@kernel.org, mason@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 1:23=E2=80=AFAM <bot+bpf-ci@kernel.org> wrote:
>
> > tcp: Skip cond_resched() in inet_csk_listen_stop() under BPF context
> >
> > bpf_sock_destroy() runs from the tcp iterator, under rcu_read_lock(). I=
f
> > the sock is a listener that still has children in its accept queue,
> > tcp_abort() ends up in inet_csk_listen_stop() and the cond_resched()
> > there trips the debug check:
> >
> > BUG: sleeping function called from invalid context at net/ipv4/inet_con=
nection_sock.c:1523
> > in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 628, name: test_=
progs
> > preempt_count: 0, expected: 0
> > RCU nest depth: 1, expected: 0
> > locks held by test_progs/628: 3, last CPU#3:
> >  #0: ffff8881158cee18 (&p->lock){+.+.}-{4:4}, at: bpf_seq_read+0x56/0x1=
210
> >  #1: ffff8881106bb858 (sk_lock-AF_INET6){+.+.}-{0:0}, at: bpf_iter_tcp_=
seq_show+0x32b/0x4b0
> >  #2: ffffffffb435af20 (rcu_read_lock){....}-{1:3}, at: bpf_iter_run_pro=
g+0x46b/0xde0
> > CPU: 3 UID: 0 PID: 628 Comm: test_progs Tainted: G        W           7=
.2.0+ #65 PREEMPT
> > Tainted: [W]=3DWARN
> > Call Trace:
> >  <TASK>
> >  dump_stack_lvl+0xc1/0xf0
> >  dump_stack+0x10/0x20
> >  __might_resched+0x3d2/0x610
> >  inet_csk_listen_stop+0x7b/0xbf0
> >  tcp_abort+0x23b/0x3b0
> >  bpf_sock_destroy+0xfc/0x140
> >  bpf_prog_448133d24601754f_iter_tcp6_server+0x81/0x8a
> >  bpf_iter_run_prog+0x538/0xde0
> >  bpf_iter_tcp_seq_show+0x26b/0x4b0
> >  bpf_seq_read+0x424/0x1210
> >  vfs_read+0x197/0xe40
> >  ksys_read+0x119/0x240
> >  __x64_sys_read+0x72/0xc0
> >  x64_sys_call+0x647/0x27e0
> >  do_syscall_64+0xe5/0x610
> >  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > RIP: 0033:0x7fad39b28aca
> > RSP: 002b:00007ffc381c61c0 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
> > RAX: ffffffffffffffda RBX: 00007ffc381c6a88 RCX: 00007fad39b28aca
> > RDX: 0000000000000032 RSI: 00007ffc381c6250 RDI: 0000000000000014
> > RBP: 00007ffc381c61e0 R08: 0000000000000000 R09: 0000000000000000
> > R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000003
> > R13: 0000000000000000 R14: 000055f077c1bbb0 R15: 00007fad3a0f3000
> >  </TASK>
> >
> > The commit that added the kfunc already guards lock_sock() in tcp_abort=
()
> > and udp_abort() with has_current_bpf_ctx(), but missed the listener pat=
h.
> > Do the same for the cond_resched(), it can't reschedule there anyway.
> >
> > Fixes: 4ddbcb886268 ("bpf: Add bpf_sock_destroy kfunc")
> > Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
>
> Is the justification "it can't reschedule there anyway" accurate?
>
> With CONFIG_PREEMPT_DYNAMIC=3Dy booted with preempt=3Dnone or preempt=3Dv=
oluntary,
> cond_resched() expands to __cond_resched() which can actually reschedule.
> The splat in the commit message confirms preempt_count is 0 while RCU nes=
t
> depth is 1. With preempt_count=3D=3D0, should_resched(0) can be true and
> __cond_resched() will call preempt_schedule_common() for a real reschedul=
e.
>
> Additionally, in configurations with CONFIG_PREEMPT_RCU=3Dn where
> rcu_read_lock() is preempt_disable(), __cond_resched() falls through to
> rcu_all_qs() which calls rcu_qs() to report a quiescent state from inside
> an RCU read-side critical section. That's a correctness problem beyond ju=
st
> the debug check.
>
> So the call can either reschedule (PREEMPT_DYNAMIC none/voluntary) or rep=
ort
> a bogus quiescent state (non-preemptible RCU). Could the justification be
> reworded to explain that the loop runs inside the iterator's RCU read-sid=
e
> critical section and must not reschedule or report a quiescent state ther=
e?
> The code change itself is correct and matches the existing pattern in
> tcp_abort() and udp_abort().

or maybe simply remove cond_resched(), hoping 7dadeaa6e851 would
resolve the scheduling issue.


>
>
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a =
bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/READM=
E.md
>
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/340203=
53095
