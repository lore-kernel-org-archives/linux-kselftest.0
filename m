Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C2336EA8A
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 07:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779261946; cv=pass; b=EUx1UToGr8gSAbJFjs9gRLxCaZ9BGCt2KtzJRRjIEbHrGwapYXgLBHRJW9DLHcE21Y51mWTMdDu3OJRC1d0Jj8I4zto+IfsSwx5FlVQnjGyJXayfsofOoKhsuSg25k+7UkNbMBFw139CT6ajHcoOpnx6S4PynabSuWcgXYKSb9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779261946; c=relaxed/simple;
	bh=DpuQ8Poe19voowdeiVQ8ziD67bSszQ9be7fcUPBKxIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=idc1/3hkCj8dCGpHuEzW4o84YgVhMjgfXk5XHBUmrYIBoPNzTaFoTgqxvaWoqHxm0wgcWAYazASJCHDNs760pRa9GocrdanXifFRQSFgERLOAkH5eOEpKpmHugcSQKnexZ9pz8Hc5Yk3EZNWua5oCq2f4jBpt14W4LmgSJTvurE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=elAByUqz; arc=pass smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="elAByUqz"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-90caad2e944so484919485a.2
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 00:25:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779261944; cv=none;
        d=google.com; s=arc-20240605;
        b=PHem2voEXbSDubJczrQOc429IxrWzPmCTyf8Umhc2AHugdTxnSXMjRroypKRTjo3ye
         dzcwQJJw15kxRk/i3SJ+CWpnPd3M08u473wCYdWNw8K5Vw6j6CLDOpGQRJ/deo7+Fb4I
         JlznkMCa/IfqgCyqPNiXdIt4iA7eTp2xHWY4O/ZSoUA3ZqpeJgpeMUpP52V+FAk5nmdQ
         +BdVU48pMN8MgjNlCJfA9TufBIovUtzLkY0B9gl5PqfS2X/3IHGxMhTNURKNy3XG83yR
         lhIlSwT8MtusQC4sZhLd/dCpRVS8ISDsy63umIJCgDldDfJXVwoOXiLMWRofnjW7+Ms6
         ZsUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=576nO/YV1iMXtGVxB8ckBZBIVkpdxC8JVKo+7JWN4sU=;
        fh=6HoNpbW57EvN5jXgmzEnCdDG+EWodPW2nslNmDO6u4Y=;
        b=frw5CBKnfnZ73rh1YOi+Ow6yvAxEGHeWvceU+HftUeYJD/mdVfndnfw4vGA3uxW/Sl
         XHXzTikL7XfYXsv7/EG0SBCiv6LvPd+qKpzPZex9a3DSPpCOnV96q0ZtGVh91XQ3Svcr
         kNSa/rXsyHLeaebXSz88l3KhTDk7d+DKyVcBge+lSOn0US7w8ovI0L2VxDL35Aj7XF9Z
         UFAyNjJVJoFWzKpF/Hgyni9HebhwFOxTAkFhs2gEjjCYIw8PiwtdQz+FsXg/LISor//S
         jm1LvjU3fBafItDtB99LB+gDQcmCNJ4kCYwLlMLPdlpB66nCXNbOVjcDLVWjR1tPtTeI
         vftg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779261944; x=1779866744; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=576nO/YV1iMXtGVxB8ckBZBIVkpdxC8JVKo+7JWN4sU=;
        b=elAByUqzdu+FsutTNWjq7d88iJhdXgyI7+cBlKN4EHhS8S32JoSOMuiCFkRFdyTxvi
         t2x4Xy+C9oICuCwbE0mzeD7CbhpM+uFBjWrt64zaWc5jPDEZJUUIo628lJCdg2opSsVz
         0JEAX16jjsxrJkecHiLhH1xDr7LmuYAsQ8D3NNMf5tvoQNp//KEF6Fv8N7zmYCvED+j6
         8sL2ocEx+l4T0+6HREpFKdhttv+RmmXS4R0zl2bEAVyVnReZgmqQj1bnL1w6QBQwI3EI
         l+K2aTWhLKD3Z+UbDZJyEBGLH6jZm6ZDDbW8Rj8XSTnBIonoC78sW4KwifHNbV7EmZCK
         8s5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779261944; x=1779866744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=576nO/YV1iMXtGVxB8ckBZBIVkpdxC8JVKo+7JWN4sU=;
        b=sJmlTZZkZqb2sOpal/r0EGdyjl20PMSGDVZTthcwFMHxYdROnpg8uS6KQYzvu0oV+p
         u96a1LygcbClM41ScKjdXADJAFcLLaR57uu79lSEVi47MNvHAeYZoVCnwmfB13pOn+9E
         hKoXvB773yXLp9mluA9QZ35R+JKBN3nP4dCyqN4Ils/7ylncbG5zHwUfYX4TiNwG/T9a
         DyWJRh5pKmJNB03X2N5iwCpmooT+J6G/JmeQPRUrwkcRkXTlY96Sn04+aeNJBqwhyt49
         hw06meatCmj4cXlrGyW/94V2HELq48ZmvEdEiGR9dpqhO+Y9cShZjnp+tP9w/l70Jm2V
         vf6w==
X-Forwarded-Encrypted: i=1; AFNElJ+xy54EnwzaGZ41rgPLjfAD7uQhZogjNkGNMo7em6jy7csycgLSptlRhsEf9Y81+Vt6NxEd129zkAK37a0XIvo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmABiYGnL5SH8P1F7sC1T+XpD+qmMDAMTK1LkET3AIuLgs7hgp
	o4jkSTRGmluvsdiUc/rrCMrYfU8vQfxa6A3Tl+guYHNHjKRHU0OHe+fd67ckPHkqZ8VAQS4nxLk
	oRvl99ybdCk1imDawPUiH+5nhyvasAphi8UOYGng7
X-Gm-Gg: Acq92OGuAuxIoF2ORJIGg43a8o0N2g7YpuMJDNGKVJftvGXogNlN/7OMDQfXIuKU4pw
	XTEc8QVn3wXPV+nEwKHTPqIXJVJutgWFd6hXsAjQEzQNr7Bj/r9uYvpIicnMOkOr8Hgjt6EY31v
	D9HQ7lk511aIWsF6lhMNpUupwhZBNznAYnYVMTz+pyEiE4bN0a6yCxp0X84Z9TG0lS7CcdDWX2V
	+HO3PZJRlrEMELhb6AO6HvMPIK1IF+tFJAynmt79FDOxFKpe6WMIAHWTEE4gOX/S+gWZg4z5F+f
	8fOLBgQQTzJTVrMhQzX2oUrDPtJSymRpD2xYG1TJoKd1cF150FznL4HwoRHoGJA7JTHbkPzk0EX
	atfROPO5hFOdyPmJnHungeQs1YAifYjCJS1OLhvDA+BFyyeS9lr1F+GmPlpdV0BUX
X-Received: by 2002:a05:620a:2685:b0:90d:b6b7:ca93 with SMTP id
 af79cd13be357-911cef0364fmr3314735185a.47.1779261943125; Wed, 20 May 2026
 00:25:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520064310.4154268-1-ntspring@meta.com> <20260520064310.4154268-2-ntspring@meta.com>
In-Reply-To: <20260520064310.4154268-2-ntspring@meta.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 20 May 2026 00:25:32 -0700
X-Gm-Features: AVHnY4JA5ULcAD8FHiBt5X7hD0S7aFEuUITtlQpIRKTp5El2DBtrGA8XL-7n_ec
Message-ID: <CANn89iLoHtMa+94G5NHC5L9Cp4dbkQPKnZneNo08ak4Z6ZzAtg@mail.gmail.com>
Subject: Re: [PATCH net-next v7 1/2] tcp: rehash onto different local ECMP
 path on retransmit timeout
To: Neil Spring <ntspring@meta.com>
Cc: netdev@vger.kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, kuba@kernel.org, dsahern@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, martin.lau@linux.dev, daniel@iogearbox.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 11:43=E2=80=AFPM Neil Spring <ntspring@meta.com> wr=
ote:
>
> Currently sk_rethink_txhash() re-rolls the socket's txhash on RTO, PLB,
> and spurious-retransmission events, but the cached route is reused and
> the new hash is not propagated into the ECMP path selection logic.  Two
> changes are needed to make rehash select a different local ECMP path:
>
...
>
> Signed-off-by: Neil Spring <ntspring@meta.com>
> ---
>  net/core/filter.c                |  1 +
>  net/ipv4/tcp_input.c             |  6 ++++--
>  net/ipv4/tcp_plb.c               |  7 ++++++-
>  net/ipv4/tcp_timer.c             |  4 ++++
>  net/ipv6/af_inet6.c              |  3 +++
>  net/ipv6/inet6_connection_sock.c |  7 +++++++
>  net/ipv6/syncookies.c            |  4 ++++
>  net/ipv6/tcp_ipv6.c              | 13 +++++++++++--
>  8 files changed, 40 insertions(+), 5 deletions(-)
>
>

...

> diff --git a/net/ipv4/tcp_plb.c b/net/ipv4/tcp_plb.c
> index c11a0cd3f8fe..accdd83dfc3d 100644
> --- a/net/ipv4/tcp_plb.c
> +++ b/net/ipv4/tcp_plb.c
> @@ -78,7 +78,12 @@ void tcp_plb_check_rehash(struct sock *sk, struct tcp_=
plb_state *plb)
>         if (plb->pause_until)
>                 return;
>
> -       sk_rethink_txhash(sk);
> +       if (sk_rethink_txhash(sk)) {
> +#if IS_ENABLED(CONFIG_IPV6)

Please remove the #if IS_ENABLED(CONFIG_IPV6).
Code will compile just fine if IPV6 is not enabled, and is not
ultra-fast-path anyway.

if (sk_rethink_txhash(sk) && sk->sk_family =3D=3D AF_INET6)
         __sk_dst_reset(sk);


> +               if (sk->sk_family =3D=3D AF_INET6)
> +                       __sk_dst_reset(sk);
> +#endif
> +       }
>         plb->consec_cong_rounds =3D 0;
>         WRITE_ONCE(tcp_sk(sk)->plb_rehash, tcp_sk(sk)->plb_rehash + 1);
>         NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPPLBREHASH);
> diff --git a/net/ipv4/tcp_timer.c b/net/ipv4/tcp_timer.c
> index 322db13333c7..24c1c19eda6e 100644
> --- a/net/ipv4/tcp_timer.c
> +++ b/net/ipv4/tcp_timer.c
> @@ -300,6 +300,10 @@ static int tcp_write_timeout(struct sock *sk)
>         if (sk_rethink_txhash(sk)) {
>                 WRITE_ONCE(tp->timeout_rehash, tp->timeout_rehash + 1);
>                 __NET_INC_STATS(sock_net(sk), LINUX_MIB_TCPTIMEOUTREHASH)=
;
> +#if IS_ENABLED(CONFIG_IPV6)

Same remark here.

> +               if (sk->sk_family =3D=3D AF_INET6)
> +                       __sk_dst_reset(sk);
> +#endif
>         }
>
>         return 0;
>
