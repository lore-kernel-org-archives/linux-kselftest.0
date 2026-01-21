Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B416633B6EB
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 14:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769007230; cv=pass; b=YxBpbDIwczUmkSELOhK+h92pCL0Hx4nVX/1K5hPdQmP622LZGrPuZb/AHh2B0tORFIKwoLKXG0CevSwr1d9mfr5l+OmC4SQj7gcfS6KfwOZPYLJqqMIY3b+BfxZ3DqMB+h+exQNHsNJZxRwAS8hYx17mn/OLvsz0Iqr8bsWTDg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769007230; c=relaxed/simple;
	bh=fzzbb3QnFJsxDqCdwHKZh0HE+sgF9Ktls9W4VFfaNa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pXelfaa0cFBMtaqF9N0/oNiZDDNOxucY43u4uDH6atBO6oxjA22t4xJ+mSMgzozCKO4eTBVYHuh7E0x6NnBVKdw/h1uDq8aFSe4HvHeegrtbMBseJ9dqrfEpgFby3/1fAEh57IEJIL5+PNJsJpobLyWjDqgHb59j0TyezsDGRno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YCRWD+mF; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YCRWD+mF"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-502a98c66f7so42051751cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 06:53:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769007228; cv=none;
        d=google.com; s=arc-20240605;
        b=Is3BCHxdbdaleQDbtZ7NBV3vyF8rjxIhRGW87kF+5u3zxBTjRHMdJFeBIQS0mQ0pM3
         GULLyY8fCOBnBPyzez75FNnjGXPO0r6ubI9RGPL8vAhd5lu8i9UxmwJ4qDJdw4Uhu0ed
         ngxld3KtWgKTty+kkylX6mFfhW5QH0LOhIeI5VjGpRtRY8zcf2b389Ds+p6zc17p1kxS
         Yq3XS0caDzJPZHYm9YglkDHEO9ZBMGZluuFIPB5WbyjnpYFUBxa/AzsqLGE51/jrLlqf
         2bATwZluqWkzUbUUuSlSGfP3qamIA5gCGgb3ISSnXswowpPVsxIY7kCHnzq5vkIv+JUe
         QPoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c9qXnOSUTaJRqoKVmmvJ/aC55OLxhDJSo/Of+Pk4eZE=;
        fh=BXXPyy4/2qwsIjUvnWaHp8SEvFDFgBxwtthsH8PH3W4=;
        b=O1dnDzTrwUS//Vg8VuIp5suFqb/zjLKizVisc/w4DlsTUgOQHdmZTPA31srGMPQLkV
         Xa6hQ0hHb8fqacbr3UubAW+skaJ2JvjRnHgs1qvQDQmTCpT0wPT2e6IvyA0XGot+nxCR
         j57ECAPsDjDbc+oUIGOxumZ/2iF7y+vhe+AQiByjVZBs1dXUzcOkysFPZmJ4GaMpQOGJ
         xekit6xbd5UU5c96j9J8DSZSQBZLe01eUIWKUADollMuIhlNo4VF1UNqkvneT8ak6Ww9
         t8iuf2oZtRnxwhMb9JzGgMEx5QFwRyCpeX+Q/VVZ78a77Kr069JnbzLasTpIJi7hWxVe
         vvgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769007227; x=1769612027; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9qXnOSUTaJRqoKVmmvJ/aC55OLxhDJSo/Of+Pk4eZE=;
        b=YCRWD+mFIOKM5HQ3+01g/xz3wtxwx5SlnwrWw6d/uiMV6QbsHYC00G3TdvAI9D0ZxM
         DDAs26O+GVH632Ai3G0rxdJK2k7b1gR2EgCcyoyQpQiYjvtH1NdsL3wEJXulolQM7nlh
         zJoNwGDfmclV1Hw/rkc+dDMIvZjqhgs0SWN2m2fHpsBcbTBwCH7LoLI1QjeWR6r3rkKL
         91yrpTuIjkt2VCPGbo1eMBFcxaRqd5GoW9M9f0pdCnp74lTJtSxaGRjJra76P1NPxq9u
         71ENWv4plPZmGy8AZDgxGA1kIKBSuIc9HaHDoS6ntwNsa2zKFDddEg7JxbvquIyEa0MO
         qO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769007227; x=1769612027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c9qXnOSUTaJRqoKVmmvJ/aC55OLxhDJSo/Of+Pk4eZE=;
        b=dFCA/DVup9vQrNiVIebhjYNEhbJ9cyYXihuyVGLjaztU3FGUXW2n2bZuLWKmtTn49e
         9A1mqFnbfsQdwBa+Yj9i6GNJFuAbv6/Agej0SfnIYwZLW4m+9xJISeYKNdQ2reDyecFw
         Se27kokoRTPhJB3hTQq39VKUtQJiEfhChytTn512h+9MgntVHmfVoUnEA7RBtaL48xbh
         U4OnaovOsE6NXoO0bApSXgNTVvMXvVag/N9pKnx3hDShJAft1vVRgJFqHR0bH4+O0eZp
         59V/LhwXqxYkysZ5F2lYuzjcvugOA5nYZq9qmwZWegTZsacc7DJD9mTGiEFO6TbUql4R
         oXSA==
X-Forwarded-Encrypted: i=1; AJvYcCUsoI0A2oVHwo6u2mUGa9DQ+bDzqEVyZ5mYY1qBo4dSKrsCpHIORLqon8gGvgH/iG+lhgIwSOFAY0QYjzruCe0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxha2lDs01u8TpKS5r/BmOX4+3wPcQfgba7pQQRY5lkl28oIeRC
	Om32ECQOkoTs2NX5+iKsL9SDzKOHF+c2mh1NfsRa7hc6Xjg7IPqVJWpjw5LRRzPTnUz9/ezSEnv
	hiJPxlgFJNPif0bpWHtyfr9rnD9S2h8y6xnwj73vN
X-Gm-Gg: AZuq6aLO17iUMUooNG0ZLbM4RdKY1z8uqXwP3v7Tp0p13qyfwJJ7LNWgsuKShTWj0Wx
	wWy17c/hoOv6HS260KX52rwjvOs7+kpSv84U/nyEZ1zBf+mlm7FH1w3tc2ONdvjFcSNoH0tcDU9
	pwK6y1Nu8Hu+5epJF7ncfBOn1HDdv1qh/l2EkqGlyDkL68sNPoyOiv8u9mPkFdScFWlY2N+p19+
	v+Hv4Ovdvr05V+FAdZdFdifDzBU20LmppmIx/gRc5vA5+HXtBcWB7M9cGcXlg0vvQOM7c4=
X-Received: by 2002:a05:622a:11ce:b0:4ed:a7ba:69c with SMTP id
 d75a77b69052e-502a17dbec7mr276708241cf.83.1769007227139; Wed, 21 Jan 2026
 06:53:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121143215.14717-1-chia-yu.chang@nokia-bell-labs.com> <20260121143215.14717-13-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260121143215.14717-13-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 21 Jan 2026 15:53:36 +0100
X-Gm-Features: AZwV_QiGb7YuJm7CkwrDqLPsRX6j1FfwcEyo2MwarcIKsN7ZaUyiwGIstnxbToI
Message-ID: <CANn89iLvMkeKG_VBrJi3vA5agDxc5+VLz_L3JNT0ALsRUF32xg@mail.gmail.com>
Subject: Re: [PATCH v10 net-next 12/15] tcp: accecn: detect loss ACK w/ AccECN
 option and add TCP_ACCECN_OPTION_PERSIST
To: chia-yu.chang@nokia-bell-labs.com
Cc: pabeni@redhat.com, parav@nvidia.com, linux-doc@vger.kernel.org, 
	corbet@lwn.net, horms@kernel.org, dsahern@kernel.org, kuniyu@google.com, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, dave.taht@gmail.com, 
	jhs@mojatatu.com, kuba@kernel.org, stephen@networkplumber.org, 
	xiyou.wangcong@gmail.com, jiri@resnulli.us, davem@davemloft.net, 
	andrew+netdev@lunn.ch, donald.hunter@gmail.com, ast@fiberby.net, 
	liuhangbin@gmail.com, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	ij@kernel.org, ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com, 
	g.white@cablelabs.com, ingemar.s.johansson@ericsson.com, 
	mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at, 
	Jason_Livingood@comcast.com, vidhi_goel@apple.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 3:32=E2=80=AFPM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> Detect spurious retransmission of a previously sent ACK carrying the
> AccECN option after the second retransmission. Since this might be caused
> by the middlebox dropping ACK with options it does not recognize, disable
> the sending of the AccECN option in all subsequent ACKs. This patch
> follows Section 3.2.3.2.2 of AccECN spec (RFC9768).
>
> Also, a new AccECN option sending mode is added to tcp_ecn_option sysctl:
> (TCP_ECN_OPTION_PERSIST), which ignores the AccECN fallback policy and
> persistently sends AccECN option once it fits into TCP option space.
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Acked-by: Paolo Abeni <pabeni@redhat.com>
>
> ---
> v5:
> - Add empty line between variable declarations and code
> ---
>  Documentation/networking/ip-sysctl.rst |  4 +++-
>  include/linux/tcp.h                    |  3 ++-
>  include/net/tcp_ecn.h                  |  2 ++
>  net/ipv4/sysctl_net_ipv4.c             |  2 +-
>  net/ipv4/tcp_input.c                   | 10 ++++++++++
>  net/ipv4/tcp_output.c                  |  7 ++++++-
>  6 files changed, 24 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/netwo=
rking/ip-sysctl.rst
> index bc9a01606daf..28c7e4f5ecf9 100644
> --- a/Documentation/networking/ip-sysctl.rst
> +++ b/Documentation/networking/ip-sysctl.rst
> @@ -482,7 +482,9 @@ tcp_ecn_option - INTEGER
>         1 Send AccECN option sparingly according to the minimum option
>           rules outlined in draft-ietf-tcpm-accurate-ecn.
>         2 Send AccECN option on every packet whenever it fits into TCP
> -         option space.
> +         option space except when AccECN fallback is triggered.
> +       3 Send AccECN option on every packet whenever it fits into TCP
> +         option space even when AccECN fallback is triggered.
>         =3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>         Default: 2
> diff --git a/include/linux/tcp.h b/include/linux/tcp.h
> index 683f38362977..32b031d09294 100644
> --- a/include/linux/tcp.h
> +++ b/include/linux/tcp.h
> @@ -294,7 +294,8 @@ struct tcp_sock {
>         u8      nonagle     : 4,/* Disable Nagle algorithm?             *=
/
>                 rate_app_limited:1;  /* rate_{delivered,interval_us} limi=
ted? */
>         u8      received_ce_pending:4, /* Not yet transmit cnt of receive=
d_ce */
> -               unused2:4;
> +               accecn_opt_sent:1,/* Sent AccECN option in previous ACK *=
/
> +               unused2:3;
>         u8      accecn_minlen:2,/* Minimum length of AccECN option sent *=
/
>                 est_ecnfield:2,/* ECN field for AccECN delivered estimate=
s */
>                 accecn_opt_demand:2,/* Demand AccECN option for n next AC=
Ks */
> diff --git a/include/net/tcp_ecn.h b/include/net/tcp_ecn.h
> index bf7d3f9f22c7..41b593ece1dd 100644
> --- a/include/net/tcp_ecn.h
> +++ b/include/net/tcp_ecn.h
> @@ -29,6 +29,7 @@ enum tcp_accecn_option {
>         TCP_ACCECN_OPTION_DISABLED =3D 0,
>         TCP_ACCECN_OPTION_MINIMUM =3D 1,
>         TCP_ACCECN_OPTION_FULL =3D 2,
> +       TCP_ACCECN_OPTION_PERSIST =3D 3,
>  };
>
>  /* Apply either ECT(0) or ECT(1) based on TCP_CONG_ECT_1_NEGOTIATION fla=
g */
> @@ -413,6 +414,7 @@ static inline void tcp_accecn_init_counters(struct tc=
p_sock *tp)
>         tp->received_ce_pending =3D 0;
>         __tcp_accecn_init_bytes_counters(tp->received_ecn_bytes);
>         __tcp_accecn_init_bytes_counters(tp->delivered_ecn_bytes);
> +       tp->accecn_opt_sent =3D 0;
>         tp->accecn_minlen =3D 0;
>         tp->accecn_opt_demand =3D 0;
>         tp->est_ecnfield =3D 0;
> diff --git a/net/ipv4/sysctl_net_ipv4.c b/net/ipv4/sysctl_net_ipv4.c
> index a1a50a5c80dc..385b5b986d23 100644
> --- a/net/ipv4/sysctl_net_ipv4.c
> +++ b/net/ipv4/sysctl_net_ipv4.c
> @@ -749,7 +749,7 @@ static struct ctl_table ipv4_net_table[] =3D {
>                 .mode           =3D 0644,
>                 .proc_handler   =3D proc_dou8vec_minmax,
>                 .extra1         =3D SYSCTL_ZERO,
> -               .extra2         =3D SYSCTL_TWO,
> +               .extra2         =3D SYSCTL_THREE,
>         },
>         {
>                 .procname       =3D "tcp_ecn_option_beacon",
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 8b774019a3a6..472bd57913ae 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -4863,6 +4863,8 @@ static void tcp_dsack_extend(struct sock *sk, u32 s=
eq, u32 end_seq)
>
>  static void tcp_rcv_spurious_retrans(struct sock *sk, const struct sk_bu=
ff *skb)
>  {
> +       struct tcp_sock *tp =3D tcp_sk(sk);
> +
>         /* When the ACK path fails or drops most ACKs, the sender would
>          * timeout and spuriously retransmit the same segment repeatedly.
>          * If it seems our ACKs are not reaching the other side,
> @@ -4882,6 +4884,14 @@ static void tcp_rcv_spurious_retrans(struct sock *=
sk, const struct sk_buff *skb)
>         /* Save last flowlabel after a spurious retrans. */
>         tcp_save_lrcv_flowlabel(sk, skb);
>  #endif
> +       /* Check DSACK info to detect that the previous ACK carrying the
> +        * AccECN option was lost after the second retransmision, and the=
n
> +        * stop sending AccECN option in all subsequent ACKs.
> +        */
> +       if (tcp_ecn_mode_accecn(tp) &&
> +           TCP_SKB_CB(skb)->seq =3D=3D tp->duplicate_sack[0].start_seq &=
&
> +           tp->accecn_opt_sent)
> +               tcp_accecn_fail_mode_set(tp, TCP_ACCECN_OPT_FAIL_SEND);
>  }

tcp_rcv_spurious_retrans() has two callers.

tcp_send_dupack() checked dsack is enabled.

tcp_data_queue() : No such check.

So I wonder if tp->duplicate_sack[0].start_seq could contain garbage ?

Perhaps test tp->rx_opt.dsack ?

>
>  static void tcp_send_dupack(struct sock *sk, const struct sk_buff *skb)
> diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
> index 042e7e9b13cc..0cbba38ea87a 100644
> --- a/net/ipv4/tcp_output.c
> +++ b/net/ipv4/tcp_output.c
> @@ -713,9 +713,12 @@ static void tcp_options_write(struct tcphdr *th, str=
uct tcp_sock *tp,
>                 if (tp) {
>                         tp->accecn_minlen =3D 0;
>                         tp->accecn_opt_tstamp =3D tp->tcp_mstamp;
> +                       tp->accecn_opt_sent =3D 1;
>                         if (tp->accecn_opt_demand)
>                                 tp->accecn_opt_demand--;
>                 }
> +       } else if (tp) {
> +               tp->accecn_opt_sent =3D 0;
>         }
>
>         if (unlikely(OPTION_SACK_ADVERTISE & options)) {
> @@ -1187,7 +1190,9 @@ static unsigned int tcp_established_options(struct =
sock *sk, struct sk_buff *skb
>         if (tcp_ecn_mode_accecn(tp)) {
>                 int ecn_opt =3D READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_e=
cn_option);
>
> -               if (ecn_opt && tp->saw_accecn_opt && !tcp_accecn_opt_fail=
_send(tp) &&
> +               if (ecn_opt && tp->saw_accecn_opt &&
> +                   (ecn_opt >=3D TCP_ACCECN_OPTION_PERSIST ||
> +                    !tcp_accecn_opt_fail_send(tp)) &&
>                     (ecn_opt >=3D TCP_ACCECN_OPTION_FULL || tp->accecn_op=
t_demand ||
>                      tcp_accecn_option_beacon_check(sk))) {
>                         opts->use_synack_ecn_bytes =3D 0;
> --
> 2.34.1
>
