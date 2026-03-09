Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834F538B7C0
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 10:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773050636; cv=pass; b=W30ydlgowgtQ5AwItxALLmkFpNgkH+bl3urqLA15ItpmgvJ84OsokCx0qe+KBDP/i1DyxuGGJX5hnciPkpKOXIiwwKMhcaLl+apmeqsipCb2AH3L5y3Ra44DuA01CeAgPA0q/LLRGTyWmfC91wG3ncJTHESOa+NqoccTk9UbjE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773050636; c=relaxed/simple;
	bh=o3jaNkGDYBQTzgUWXmPXPeMrbrWzb0oNlGozzYke79U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KyAznF86yEdEQx1DPGUQHyR+Zj51wSdnSmdUopeFXkUZTY0GTj2gP+4di3yiV2Y4BzypQ39pzDjklWNRDqu2IllXoT52CYcoFaxgAndh+7VoMzdyUVCYnS5lcaOw/xHwf9DK+v16VaKiAVk0Qc32z2y89VsoEO0zX3aCBAVDx8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3+sG0PfG; arc=pass smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3+sG0PfG"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8cd7c372929so163707785a.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 03:03:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773050633; cv=none;
        d=google.com; s=arc-20240605;
        b=Ps3figu9DnOQ5+8m1WXWmTPo4jbDSoQyuisNoiYPd4yvVh0ObBn7cVvyQoQ6ovF4aC
         dB6gpuH00W1lwW8hY3Pr4qFgGt1qbYx7ivdkTY25S35At6MRtP9D4UcH0OFWPDT+tatA
         +AWj5MRcSQ2NQ9MeEMUDNRt8jg/cKVAYFGspyviUmP8TowQf28beZHKHKobOJ4Z+lZfX
         y8mt2Nfn/YzKYmAn3EOO6hKr8m9Mnd5WJc/ip7FLYatOfigpbYUesU4C7nAJ5T2Lk9kn
         9Hnmf/pevowuTS2zi0YrBwPwGrVSG6x4bb+mkQ4KS4DNfkHyQjkw4y7gZpa/PR+mesj1
         xlRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xSfqXtScotu5XTRky9yvHGfmaaQCdm2/cA82kCXoKvk=;
        fh=r/cIukDSE1O1FUewse9ywqTqzKTLH9BWuBP1jgWI110=;
        b=TFe2QZmUi7biy8Ah9Gm7NYn6AYhSoFcDzHPTHV2jYnHdVykQ+f6aLdfnjRbP0zOKaa
         LF1i3BuLx3Kxl03OgDYqPRzzWzljceD9T0oUgkItsP+yd5oxEJ1Ytv/OLjhUTDCLScw2
         QixNhnEsRo2rHpoIXURlmoRLDRoaOEaSvjgVXC7MHCw4lD2lNQhkj3kmMXeR6CgA+o1z
         Ox20GYudHIYac+ihBo+y5EEzi4aYkIRfHeP5wrBO4x8qlmh66q3EcLpjMvc47GeOWViv
         YgBW+zQZkNpjxooPRVY6CTmLmbD96/KEv1d139Ewf1S3ftxxV2LgfC3e9vwIhc/M4pC1
         N4aA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773050633; x=1773655433; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSfqXtScotu5XTRky9yvHGfmaaQCdm2/cA82kCXoKvk=;
        b=3+sG0PfGTyUzCDwfs/kJwQ+GcjEKPuEyH5UMgH5M24tXRbvzoZcpTax6FvqrXhHZOS
         j935Kjock946dX76BZv5xOfU24Y1X/PkzDuViSOE6fU1ClF8mPpkus9PzCVjZzB8jhzy
         8ypI9a+g+VoeYH6b2NUu5h+kW+BXdzSp0nvLXSoE/+d1nUS2YSinoAekHcROOyLFthFX
         PjKBJuKRxhBKgQYaN/ycZjTeNR71M0TrsmBVZy64sbcgpsUmjMswb+XDz1zcUAlGDasq
         K0qUV98vSvk7l28G2SCeoQavfVLdkEc2M3Rc8NV5lb+3dmrwsJRjLVyUQ8BJA9Rc/8L8
         7UmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773050633; x=1773655433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xSfqXtScotu5XTRky9yvHGfmaaQCdm2/cA82kCXoKvk=;
        b=Mw12JJj858jfGGIJHYTQkeu+1k4ZbmFioOyD50HzIFK1zD4TUBYt+1LGz+H+Npf90Z
         L4ExphEk+AEDjTQ6l3b/ZUTaf5XaQh5DtYncg8e2HnDh45cRg2v8LQWC/04/aQOFtUnd
         mscC218f0SYAa773FUZDiZgkhr6ibU4cQ3tbUGfsH0/XutDMNxF+FhmW5jGj9tmikyqL
         ONU3b7A+AXfXAeNGUCY17IkqGPq6hVbWDLp1CEAdFBZFxI/Ustk+UPK9c/A2Ch7wXMdL
         yotRIr+zZJEm1Y4hYzEM8JZh52ckbtm/ODTYZJSU4CbiSLuOHVlBv9sFgPDEMsrADOfp
         uPRw==
X-Forwarded-Encrypted: i=1; AJvYcCWWK8gTv68Ujsi0A0Bm4rJbP0uNp3JlibwpZjEw8LRjMYV9WMXjjH9Au1RsQp1aiWQ9lnm3603a4FjBcnn08HE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk78lwkeqQPUEInZUq7xveOKDwJQnrCDlZowlnKJJPM35OPfcD
	a//Kcu+QUJGvd24ihRqRBzCy5E9lyXUvmreMEGdDDLj+NV7ymXltU0tJY0gTT62HaAd2xkhkZ52
	bNZqnQXvC+ADsSioFXOUlvfFw7aAWdFxDw14r6OsM
X-Gm-Gg: ATEYQzzG19c18IR9TzAo574If0dVHWdKkX4LlLtfrJRcZsQlBzscnI6Y52Zv7C3aCKW
	DKW7e6gUw+4enNpnM4t4tylXNM70xPkvvILTbL5e9ZYD0XY+fI+fyonlsxPsWKOQHnDaPGpCzF+
	kSGbkIYf+Kfct58nE0GelJ6JhXIsQw8fCMBN82vfejJTTj0mSIb37o60ceCVT6v5sv6ULhzr9d2
	M4rtklY+PT9McvZEjEWGZpHTMmtpMjzYTK4V/W3khNJLfQ2K5SWEPm4HvONt6RxnT+qCpoN1gxE
	fay10+0=
X-Received: by 2002:a05:620a:1726:b0:8c6:ed3d:be60 with SMTP id
 af79cd13be357-8cd6d4a14ccmr1309367085a.71.1773050632954; Mon, 09 Mar 2026
 03:03:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309030702.128520-1-jiayuan.chen@linux.dev>
 <CANn89i+SCJmUuQo2pSVv_4YhjvXGvnGDH_HNo2XY6KxDX1Kcgg@mail.gmail.com> <903543b24e6e124ff970340e265185af176880f6@linux.dev>
In-Reply-To: <903543b24e6e124ff970340e265185af176880f6@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 9 Mar 2026 11:03:41 +0100
X-Gm-Features: AaiRm51p8jwAE1iwbL1pN91qOyZJ3zxRXnsqElk9iOsk_BoOPc9YpeO-w-VwnW8
Message-ID: <CANn89i+k2i85Yn6gd_AxJtLD48XoZo366OGu1sLNRiU8ExOjmA@mail.gmail.com>
Subject: Re: [PATCH net v5 0/2] net,bpf: fix null-ptr-deref in
 xdp_master_redirect() for bonding and add selftest
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, razor@blackwall.org, jiayuan.chen@shopee.com, 
	Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Jussi Maki <joamaki@gmail.com>, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 10:41=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.de=
v> wrote:
>
> March 9, 2026 at 15:46, "Eric Dumazet" <edumazet@google.com mailto:edumaz=
et@google.com?to=3D%22Eric%20Dumazet%22%20%3Cedumazet%40google.com%3E > wro=
te:
>
>
> >
> > On Mon, Mar 9, 2026 at 4:07 AM Jiayuan Chen <jiayuan.chen@linux.dev> wr=
ote:
> >
> > >
> > > syzkaller reported a kernel panic [1] with the following crash stack:
> > >
> > >  Call Trace:
> > >  BUG: unable to handle page fault for address: ffff8ebd08580000
> > >  PF: supervisor write access in kernel mode
> > >  PF: error_code(0x0002) - not-present page
> > >  PGD 11f201067 P4D 11f201067 PUD 0
> > >  Oops: Oops: 0002 [#1] SMP PTI
> > >  CPU: 2 UID: 0 PID: 451 Comm: test_progs Not tainted 6.19.0+ #161 PRE=
EMPT_RT
> > >  RIP: 0010:bond_rr_gen_slave_id+0x90/0xd0
> > >  RSP: 0018:ffffd3f4815f3448 EFLAGS: 00010246
> > >  RAX: 0000000000000001 RBX: 0000000000000001 RCX: ffff8ebc8728b17e
> > >  RDX: 0000000000000000 RSI: ffffd3f4815f3538 RDI: ffff8ebc8abcce40
> > >  RBP: ffffd3f4815f3460 R08: 0000000000000000 R09: 0000000000000000
> > >  R10: 0000000000000000 R11: 0000000000000000 R12: ffffd3f4815f3538
> > >  R13: ffff8ebc8abcce40 R14: ffff8ebc8728b17f R15: ffff8ebc8728b170
> > >  CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > >  CR2: ffff8ebd08580000 CR3: 000000010a808006 CR4: 0000000000770ef0
> > >  PKRU: 55555554
> > >  Call Trace:
> > >  <TASK>
> > >  bond_xdp_get_xmit_slave+0xc0/0x240
> > >  xdp_master_redirect+0x74/0xc0
> > >  bpf_prog_run_generic_xdp+0x2f2/0x3f0
> > >  do_xdp_generic+0x1fd/0x3d0
> > >  __netif_receive_skb_core.constprop.0+0x30d/0x1220
> > >  __netif_receive_skb_list_core+0xfc/0x250
> > >  netif_receive_skb_list_internal+0x20c/0x3d0
> > >  ? eth_type_trans+0x137/0x160
> > >  netif_receive_skb_list+0x25/0x140
> > >  xdp_test_run_batch.constprop.0+0x65b/0x6e0
> > >  bpf_test_run_xdp_live+0x1ec/0x3b0
> > >  bpf_prog_test_run_xdp+0x49d/0x6e0
> > >  __sys_bpf+0x446/0x27b0
> > >  __x64_sys_bpf+0x1a/0x30
> > >  x64_sys_call+0x146c/0x26e0
> > >  do_syscall_64+0xd3/0x1510
> > >  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > >
> > Please, can you always provide symbols in such traces ?
> > You can use scripts/decode_stacktrace.sh to make the trace really
> > nice, instead of ugly.
> >
>
>
> Hi Eric,
>
> Thank you for the suggestion. I didn't include the fully decoded stack
> trace in the cover letter because the syzkaller report already contains
> the complete information. You can find it here if needed:
>
> https://syzkaller.appspot.com/text?tag=3DCrashReport&x=3D15448952580000
> https://syzkaller.appspot.com/bug?extid=3D80e046b8da2820b6ba73

Exactly.

Either copy the syzbot stack traces when they have the symbols,
or do not copy them if they don't have them, a link to them is just good en=
ough.
