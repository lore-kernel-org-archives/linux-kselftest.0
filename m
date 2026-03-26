Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E41BA21
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Mar 2026 00:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774483512; cv=pass; b=T3y/NX4togVYHvM/cWb7oHxP92g+osAz6DGjtXytUoIXZKC7Hmv3CYCae8DwQ02roqtO8PEocwW6Jji0f1JQfSBgP2Jp2v8h7ee/vmZv2PpD5dnZTCRvLqAE5flJ2SWac2XfOpWXNXojZOH15hiMAjP2vfcNDbURgJXTy1fiFBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774483512; c=relaxed/simple;
	bh=09LknHMDIYhGkY37GVaHUaDbkJkl2uyKia+bWoJPBlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lGVZRMna6TOq2ERs2TCgguxaus2tazmBClUWCu+C5XwIO187hEER0mjdEMnkduXF1NXTssHeX1AzDI3gr4s+bCzSpN7/acIV43cSNSn7azJDnLb2q4giHiqbNZ2NGLDnq5y16rlq3bvFvhRxiqE29YI2KkN20yNggkRfAxeEZmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iNC/XIXw; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iNC/XIXw"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c0c955a481so566869eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 17:05:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774483510; cv=none;
        d=google.com; s=arc-20240605;
        b=Y1z9ajl9VvKlQcT/saG/L3Wxm4YpnAuqfb6wNThLvGli2MP/vN+6isLE6uxvlZZXfh
         cZ1DY6bUkq9PPIvQKNyJfk0tNVWpHkWogoRCZMz3op6Nh5PBRIMhhQpMAVniI32ucADM
         Vlne62ffS29D7Jo2R0s4til4lgOBZ9OeYEQoz1MjUosAzVh4CadFTSCWccQPmA3TFNx1
         0v6CWshUiQKOmE0KeS1st29fbgh+3QymYVXHGFF7bVkRyiGPjTYGBfp1RxKAi53vlQK/
         FTHy5wZIakRmhfpYlpRDx3zr0nVnqUvi7lGKqxXD4hk7o+tt0Q1L9RPLMyKP9bp1ANAt
         zE8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rOHw2g9ZBT/hyeGef6C4r595s8lKM1vTjJzS7pLxOUk=;
        fh=wbS9lYqLVI6gZnaR6vM1PaaMMk+E7DWVJfra5rkthRo=;
        b=fSfu2ynddFI8Tkyp5ObxRaIxI3Geb5CxTdK73RJanCcRVFZITn8z7S9YNdUrF2LXb6
         qcE00uTUc43bS2sfyCa6wXxTodQT08/ZVpPbvrTByHjALe9TX3n6sIrxX2XoqrwXuLHN
         1jnqsHBS9B5+fv2dEha55nb/uYdu/FIVOtp6yPPDfvyc8UZaCQ82xzVvnRPtAWGMu7VQ
         2xQsy2oPxDCipLh2ZYHxgpmykfTvKZuVpEgNdu1hUWjzRAq4d6EDEuNGI4KBWaBl4ib5
         caZz1K4HGmIfLBpuJqtSeDHQkNO8WQhmLsf+l9oDG4MdpqPYHUZwUYsKi7bK2d+baMD+
         4eAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774483510; x=1775088310; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOHw2g9ZBT/hyeGef6C4r595s8lKM1vTjJzS7pLxOUk=;
        b=iNC/XIXwBdW6onX6kBucVt5AW0ywZEL/36nFVVNRw0BVP3zttsDfXrkqROE14rpnMI
         5vNplrBt7VlOp7jwsKt4HWW6mV15jqxZLVbK0AMUnmmD7LUeiqNjBusiRvNBI/fwf3Jp
         40ypgmmIVB4vvaFDQa4dRr2aqMt0oje1Yy7u3P5FxoKciEOCYiVrDPXvM6Q1OqaF2oUD
         HCLSQYB13i1gRAoQ6FQ3eu88/j47TDbkY5GWeiuqgYNLF31b8y/FuHAQCsK3Yqhl0n+B
         /Vo6Ae/+L4DWpLGc5aCi+EE4Zrc2+6YVCCilUA3njVOgjs86r6Oe4Alzd5FH9MgNx62w
         DOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774483510; x=1775088310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rOHw2g9ZBT/hyeGef6C4r595s8lKM1vTjJzS7pLxOUk=;
        b=hHarkei2NS3sIWBldADUT14gdzbAU+emOhaUONVnw8wN8GqNvymfhlq+v/dnIIW4z9
         nBO933+sAoGXEY9f2T3PGZTjSAPJNLjszc4DOdbCfCFShdxbwnP65nXHukbRYVfOoptc
         v/oh3LE1fwoLMl5VbDtyygSvXYMWNGmOkKSPQEG7sD5BthHktcxix2IpgHQ06eotID4O
         CSW6PajiruXTQNQcfksEcBazUm/7jU4ePifwe56tM22OrV0pfyvzDORx6tbfJs4SUP60
         18+jsxtYdzPCsDtdoI2mvF0514yLs/M3MzGQXYTVZUkidsuFosoaNjxnHdrKWWYvGKcC
         2m+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWcI8AzgOKxtI16bRV66ugxHkebZhA227vxaIPfDElvfnvSgfn8fFg87QpjTJCwHdXFqinfrrEsycV5nXdhDAY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHj5XETvRtMDUl2/C8vByknoyCrENqU1wfDOcw68aKEnrg4KrO
	31IqzVXp+sZTRwTrPEw+c0Nbu0GRcVzIW+nh6j4OLBU8ReB+WgD3DlL4tPv8Hpwl+S8HDKU7/pB
	9QnxNJEl/wq8/9K/1o4h/e13G1FvFIq9ZetQLyVEi
X-Gm-Gg: ATEYQzzU+7h32PN3t/R7bwGJOu27Gudd7MnBIdI8CLuyWK6tSBhxsX7RuT3hPanwIMJ
	2hnwfqcWZgDgGdiGOSWL5ZAaSFLEXvepMo4OpDwoDOnNkTSQSWT+LO5wxVFKB1w//wh7rceh3IO
	dAmYxnzhi5b4qRezN6hdlxeomaIn9f4YDTBRecXKPyC4hOlN27xc7Z0zMDTAeHAcPOunciPEF8L
	WhlJuTWwX/N6o84LzBFRKqF6l4jZfCiFkuXkXCY2e6mEpgT1Bghgyn0xkhesD8wwMCs2fSgTUIw
	YuxOVYnyZL9/jx7zAymHu+4N+NjL4RTOtDqdwDFgBPYQ1o48/jxGqDT0jvxXEi5w6vSPrg==
X-Received: by 2002:a05:7022:ba5:b0:128:d967:466c with SMTP id
 a92af1059eb24-12a96ed373bmr2822619c88.24.1774483509090; Wed, 25 Mar 2026
 17:05:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323105510.51990-1-jiayuan.chen@linux.dev> <20260323105510.51990-2-jiayuan.chen@linux.dev>
In-Reply-To: <20260323105510.51990-2-jiayuan.chen@linux.dev>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 25 Mar 2026 17:04:58 -0700
X-Gm-Features: AaiRm52AA_qp46xzo-zT0U_vZFvFfC3jyAgRm4AjFmf0jkfgDvGqPT6HupdXIf0
Message-ID: <CAAVpQUDpkro_cA-vP1=L=NhAQ4WDPGdm8nVrUBiooiuji3kXow@mail.gmail.com>
Subject: Re: [PATCH bpf v1 1/2] bpf: tcp: Reject non-TCP skb in bpf_sk_assign_tcp_reqsk()
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, Jiayuan Chen <jiayuan.chen@shopee.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 3:55=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.de=
v> wrote:
>
> From: Jiayuan Chen <jiayuan.chen@shopee.com>
>
> bpf_sk_assign_tcp_reqsk() only validates skb->protocol (L3) but does not
> check the L4 protocol in the IP header. A BPF program can call this kfunc
> on a UDP skb with a valid TCP listener socket, which will succeed and
> attach a TCP reqsk to the UDP skb.
>
> When the UDP skb enters the UDP receive path, skb_steal_sock() returns
> the TCP listener from the reqsk. The UDP code then passes this TCP socket
> to udp_unicast_rcv_skb() -> __udp_enqueue_schedule_skb(), which casts
> it to udp_sock and accesses UDP-specific fields at invalid offsets,
> causing a null pointer dereference and kernel panic:
>
>   BUG: KASAN: null-ptr-deref in __udp_enqueue_schedule_skb+0x19d/0x1df0
>   Read of size 4 at addr 0000000000000008 by task test_progs/537
>
>   CPU: 1 UID: 0 PID: 537 Comm: test_progs Not tainted 7.0.0-rc4+ #46 PREE=
MPT
>   Call Trace:
>    <IRQ>
>    dump_stack_lvl (lib/dump_stack.c:123)
>    print_report (mm/kasan/report.c:487)
>    kasan_report (mm/kasan/report.c:597)
>    __kasan_check_read (mm/kasan/shadow.c:32)
>    __udp_enqueue_schedule_skb (net/ipv4/udp.c:1719)
>    udp_queue_rcv_one_skb (net/ipv4/udp.c:2370 net/ipv4/udp.c:2500)
>    udp_queue_rcv_skb (net/ipv4/udp.c:2532)
>    udp_unicast_rcv_skb (net/ipv4/udp.c:2684)
>    __udp4_lib_rcv (net/ipv4/udp.c:2742)
>    udp_rcv (net/ipv4/udp.c:2937)
>    ip_protocol_deliver_rcu (net/ipv4/ip_input.c:209)
>    ip_local_deliver_finish (./include/linux/rcupdate.h:879 net/ipv4/ip_in=
put.c:242)
>    ip_local_deliver (net/ipv4/ip_input.c:265)
>    __netif_receive_skb_one_core (net/core/dev.c:6164 (discriminator 4))
>    __netif_receive_skb (net/core/dev.c:6280)
>
> Fix this by checking the IP header's protocol field in
> bpf_sk_assign_tcp_reqsk() and rejecting non-TCP skbs with -EINVAL.
>
> Fixes: e472f88891ab ("bpf: tcp: Support arbitrary SYN Cookie.")
> Cc: Jiayuan Chen <jiayuan.chen@linux.dev>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@shopee.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

Thanks, the fix looks good.
Just curious how you found this, are you trying to use this
feature for CDN or AI just found it ?


> ---
>  net/core/filter.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/net/core/filter.c b/net/core/filter.c
> index 78b548158fb0..fb975bcce804 100644
> --- a/net/core/filter.c
> +++ b/net/core/filter.c
> @@ -12248,11 +12248,17 @@ __bpf_kfunc int bpf_sk_assign_tcp_reqsk(struct =
__sk_buff *s, struct sock *sk,
>
>         switch (skb->protocol) {
>         case htons(ETH_P_IP):
> +               if (ip_hdr(skb)->protocol !=3D IPPROTO_TCP)
> +                       return -EINVAL;
> +
>                 ops =3D &tcp_request_sock_ops;
>                 min_mss =3D 536;
>                 break;
>  #if IS_BUILTIN(CONFIG_IPV6)
>         case htons(ETH_P_IPV6):
> +               if (ipv6_hdr(skb)->nexthdr !=3D IPPROTO_TCP)
> +                       return -EINVAL;
> +
>                 ops =3D &tcp6_request_sock_ops;
>                 min_mss =3D IPV6_MIN_MTU - 60;
>                 break;
> --
> 2.43.0
>
