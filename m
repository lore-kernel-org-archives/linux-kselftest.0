Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041533264D0
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 23:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782861656; cv=none; b=oUMqrxoxu82+xKJOWorH4sNWMt40f3+w4/xfkLdKFTb8lHOAnX3ziWMFbbeLNuXP444YL1Qh8eKzupv43DimMuQeKr1Lf3MiX9Ma/scZGX6jHD2BCPahBwqLRHLIVBkNyhOYsi2/3zj3vbP4iTHGoxxDk8Hs9q0jYekyNnMUmLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782861656; c=relaxed/simple;
	bh=MyCniKPbL+Lqz0L65ltscAhVa5RtLJou0ccIhfIbqqM=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:
	 References:In-Reply-To; b=LJizQ9jjLgDuSr5Rm0cTDLcOrxl9H7XSSSN3W4Hi25/3pa6oi6jZMxiR3vQr9XRSUyZvD1GkKXRupdgjayyfdG+AZbLsd7fQMvho83Vwd/Cqe8E5fwEWPleXRuQmVB6bCI+bvfpHKECz/DWgsEW5Ks2rqSCFQOWMMJBziTbJ6t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VzNNrkAt; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VzNNrkAt"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6a1888969ddso22790eaf.3
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 16:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782861653; x=1783466453; darn=vger.kernel.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cB/ZP5ypFx7PVtX4ppcUb1XeE8gYOmi+BvjetO5FJh0=;
        b=VzNNrkAtr3vorUdKjBcmEOX/USgnVzzkhlPWtka584Vgz/IoNRu1z9NPYEmrCdpGoD
         T/goRJRJtuLRDQJ2EAvmoLQh3tMkw/G/tHpRw6xVpA7ym1ntBYQd0YAYJZduCLLA5VrP
         oW47bR1oNIrvTTNdZHhQq85wj+x26Tm/yvBdiT3dBR4Q8ChN85UwYC9qd7euygesn8nM
         4XZyxkg3fbj4Dvgj+dobyXV4jCXMZZsNsOvVigmzhpcvqVOadGDCOKLX8PS6m2+QjSCp
         hTlfcPGqoXltU5VRQDdgMB3p7VSyP38DaHsSm+sFnTx7Q28Tzs7LoN+UCuGR9gxrjEAY
         VuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782861653; x=1783466453;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cB/ZP5ypFx7PVtX4ppcUb1XeE8gYOmi+BvjetO5FJh0=;
        b=LcgyZaR1mCL1WSWmCQnDeFQNSHVxF6mitLifOJv4Vk3q8gEooX74HCJixuXboWfOKL
         LOyNhQ0/Z8ABAdRUYSsjZ0lSWDEV0tghGbkKYMFvLNldt0j7rSKRM4HpkihcPfpmmYPw
         g03P8mt5rKqdAFx/TLwNEY140ZLBgqJni4RAqM6u8uZcVFMTVPCJyy1OWiy+oX1y1zDD
         tn5w1P6wFBsFNpimtJRagqYiwe8B7T1IA9InDZWL90YdeFgAvC/qQht7+aGx/SUxgziL
         xbuj5cE3N4+0QhDnhnZoGAaCCrN0fo5INYXKjEHpGe2NY2OP58sO7jzL7O7h3kvJQ17/
         6zNQ==
X-Forwarded-Encrypted: i=1; AFNElJ/WmJvk/ckLtaqX3coqfMnuEx4X0nnYbxqigUbzcyz3dEMCngxcVeP0ZiGKUuBogJmKcmeB/XFuK7VNJJKTnZg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvapG/hmDilnWhkiDPoMGwVtfgZDOk1Wdxk+BziJ5ILAHA15GD
	fV4c3LsquPSg61VifRwB9KyYit8G7F+jXrZCCFtxQJ3IcFoW1Pw/ne2h
X-Gm-Gg: AfdE7ckKQdSfHQuCUEeXtTxJv2hHf9hYLUBla7XVYb7bUh4CQnKlc+j3/WKUcyN1SQT
	ZGBdbM+EWbfPAzXEUXkezJqBLTARli0weMCOQEcip4uAbK4EEOaYPBAslZk4la2C4BNrabzVcps
	1Rxk8sw2T3XUqsbudfym3wGjFK+KDYTW03Jz8v9uZJeElpUfq7jO3eePdpxYK1bsFABi7B7ojQ8
	clZK3h6bgwLGo4vAymHLK4+8dl8XZwv8gNUsZQyLIU/jg655a52CPUzRiRVdOWGGln9W5ZloIsC
	4JCoTQwYORAcKJKorTE1jCcKUUzed0DyyQBoNvvHSN9AuJndU6iFcQl14oVH+paP28mvc7SYBt9
	224PS4fGtsL9uapd6B7Ph1Pk2wAICQfHDddkJuHlZHwDI/t7IZdQ5cIC9XTXLs6sGsJzDaqdK2b
	uTYf9lMhuM8vWh/9YjDUauoEQ9zFth9LMFd+D9BYlEZEZTfxFXHM5XfdMFneyFvcvaKy8TPn5w5
	PtQ4XE=
X-Received: by 2002:a05:6820:4df3:b0:6a1:4592:eded with SMTP id 006d021491bc7-6a188e2a5efmr3936292eaf.0.1782861652634;
        Tue, 30 Jun 2026 16:20:52 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:56::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a18949b384sm2986584eaf.15.2026.06.30.16.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 16:20:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 16:20:50 -0700
Message-Id: <DJMRPJEUTY5G.30HYOMPLBGZOJ@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <chia-yu.chang@nokia-bell-labs.com>, <jolsa@kernel.org>,
 <yonghong.song@linux.dev>, <song@kernel.org>,
 <linux-kselftest@vger.kernel.org>, <memxor@gmail.com>, <shuah@kernel.org>,
 <martin.lau@linux.dev>, <ast@kernel.org>, <daniel@iogearbox.net>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <horms@kernel.org>,
 <dsahern@kernel.org>, <bpf@vger.kernel.org>, <netdev@vger.kernel.org>,
 <pabeni@redhat.com>, <jhs@mojatatu.com>, <kuba@kernel.org>,
 <stephen@networkplumber.org>, <davem@davemloft.net>, <edumazet@google.com>,
 <andrew+netdev@lunn.ch>, <donald.hunter@gmail.com>, <kuniyu@google.com>,
 <ij@kernel.org>, <ncardwell@google.com>,
 <koen.de_schepper@nokia-bell-labs.com>, <g.white@cablelabs.com>,
 <ingemar.s.johansson@ericsson.com>, <mirja.kuehlewind@ericsson.com>,
 <cheshire@apple.com>, <rs.ietf@gmx.at>, <Jason_Livingood@comcast.com>,
 <vidhi_goel@apple.com>
Subject: Re: [PATCH v3 net-next 1/1] tcp: Replace min_tso_segs() with
 tso_segs() CC callback
X-Mailer: aerc
References: <20260630120145.286497-1-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260630120145.286497-1-chia-yu.chang@nokia-bell-labs.com>

On Tue Jun 30, 2026 at 5:01 AM PDT, chia-yu.chang wrote:
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> This patch replaces existing min_tso_segs() with tso_segs() CC callbak
> for CC algorithm to provides explicit tso segment number of each data
> burst and overrides tcp_tso_autosize().
>
> This change provides below impacts on BPF struct_ops users:
> - The callback is renamed from min_tso_segs to tso_segs
> - The signature gains an extra u32 mss_now argument
> - The return value semantics is changed from "floor value passed into
>   tcp_tso_autosize()" to "final tso_segs value", bypassing autosizing
>
> As a result, BPF programs shall be updated, beccause retuning a small
> constans will now directly limit tso_segs instead of the minimum.
>
> Signed-off-by: Ilpo J=C3=A4rvinen <ij@kernel.org>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> ---
>  include/net/tcp.h                                | 13 +++++++++++--
>  net/ipv4/bpf_tcp_ca.c                            |  8 +++++---
>  net/ipv4/tcp_bbr.c                               | 13 ++++++++++---
>  net/ipv4/tcp_output.c                            | 13 +++++++------
>  tools/testing/selftests/bpf/progs/tcp_ca_kfunc.c |  8 ++++----
>  5 files changed, 37 insertions(+), 18 deletions(-)
>
> diff --git a/include/net/tcp.h b/include/net/tcp.h
> index 6d376ea4d1c0..7fb42a0ce7da 100644
> --- a/include/net/tcp.h
> +++ b/include/net/tcp.h
> @@ -824,6 +824,9 @@ unsigned int tcp_sync_mss(struct sock *sk, u32 pmtu);
>  unsigned int tcp_current_mss(struct sock *sk);
>  u32 tcp_clamp_probe0_to_user_timeout(const struct sock *sk, u32 when);
> =20
> +u32 tcp_tso_autosize(const struct sock *sk, unsigned int mss_now,
> +		     int min_tso_segs);
> +
>  /* Bound MSS / TSO packet size with the half of the window */
>  static inline int tcp_bound_to_half_wnd(struct tcp_sock *tp, int pktsize=
)
>  {
> @@ -1361,8 +1364,14 @@ struct tcp_congestion_ops {
>  	/* hook for packet ack accounting (optional) */
>  	void (*pkts_acked)(struct sock *sk, const struct ack_sample *sample);
> =20
> -	/* override sysctl_tcp_min_tso_segs (optional) */
> -	u32 (*min_tso_segs)(struct sock *sk);
> +	/*
> +	 * Override tcp_tso_autosize (optional)
> +	 *
> +	 * If provided, this callback returns the final TSO segment number
> +	 * and will bypass tcp_tso_autosize() entirely. The implementation
> +	 * must derive an appropriate value and ensure the result is valid.
> +	 */
> +	u32 (*tso_segs)(struct sock *sk, u32 mss_now);

I don't like this interface change.
It introduces churn for no good reason.
At least I don't see why you cannot live with the existing api.

