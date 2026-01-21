Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15E148C40B
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 14:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769007490; cv=pass; b=ZcaNUw/wnz2OPhDyKBHpIxfIRKRu6/x4BbtIeqQpZPQa9iDHj+GnSUG9C9bOmzzlxFQuFi+oAhqrHd8ibkO3kJmT5azPvbVsOW/hRH6fNtjHoIRn5tg1hmtpcllUOyowrv8tvFsYeyisC23/TCxf3vmnNoEHxThb5Zew35Tbpb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769007490; c=relaxed/simple;
	bh=pXnTl94BbhB/76UcLMWFQmfo8hdhUhMeAxYtkkN1M+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R04hOkBFjhCWZs7LTGCc7TmeTadiURawGYIbKL+z+CdnFYfLb4tbnNMe4cz5qlJ5bYas7SL0EAOg2IX1XcQ6j1NiPYC6scBdD/ho2N2fIWFEEIFig/HtDfLFtsUUSjgiF2Hvs/COFsD/z1NBULLggqzONynhoFETtObXtWyhlLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZjExIxLc; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZjExIxLc"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5014d4ddb54so71410261cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 06:58:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769007486; cv=none;
        d=google.com; s=arc-20240605;
        b=EpSjmR5K0I6gmaVVpCkYinx8g3tlVcjcgZAupSbTmZRG1wU8/Z0QKMyYL0gH7E5/Cu
         lewwGZbj65b7WyQM+0aejJw9jbte4FPf5/CGyXUF5EkopG3R+jW1b6zG+xrL8nSeWM/o
         hzFO277cFo7NDcBSMgtdA+jFsohillZCHtmpBx7xOOuGgMe4JfqI3vbPzM0m51EQ6fqD
         TjOwKrZ4O7Sxjj03ET+3QhuH7ntHIU8HyrHUNUZ31DibhB1SDz3g8LyMSuJjGcUDui2d
         U0drLURDEFgG3Vut3pbyXGZSh1ZggexevUoaaNuHPL+4lrmGyj1DPJwYCWGVBMP/TSwn
         gtWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F/VqqIhXdgX7j/dXUyWw4LxUrc07WTrCM45z7FHNuOc=;
        fh=zgfp4sipyPeNep1j4V5FSwg2XPBK1lHfdkO7bPHEv7s=;
        b=IL3V1Uay/5WpEe1/8HwDx0oK4jDJ/pM5jztaO3vve2ABHKOLOFgZLAmDwetTeoGc+S
         i5+71qG/pZ4UUpeCNp2gcG8LHFxxS35dTltaMsaiRUnEkjzC1F3TF4i6UKtvCGBiJSXi
         k8UEthhB4R88Iw/xbRvWFPNcOlXUNpfGVmAyhUmsF0Rbimy4giVctyhpopiWsipNtgJY
         7TABgxcX70L1Z3f2iRdxu/v2sKIlcUAqd6Pl6UEUx2EyP4gvVYxcANGc1ZLZWQ0/apKb
         aBDETvyDIvhrkRn8K0J9Yqq92DCDeVLSWLrLCDqMGHrxeO6jSEIa7JxL2WaYNhCmcTLJ
         Yo2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769007486; x=1769612286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/VqqIhXdgX7j/dXUyWw4LxUrc07WTrCM45z7FHNuOc=;
        b=ZjExIxLc2LNqlP24QAI+e6v0pZxcrEgpu+95SusdGyi51+bDN1XnBwncQP1b0ZlZUy
         HQH1KhN4CzuV41ctbFYWvDmZ4TWXX4kHgXU3DH1EIUgxX2Ud+34hG2A55SeTLmqKw9c1
         xnSA+aOQIIPWSvVGNDVLVmsIFwOFlyKyj7G9UJgbULURinDg1hgwAFme6ZzFNbfz4Ef9
         54O0ojMRsFrIZOCsXVmWH/wmVupVjp+L05gNkjOHsl73Nf7cDtHXpqZYLIov2KCctP8m
         kzLCuiZIAzeZo0n+Zh+KLbGphBEyzIwMC/HNlRnPyKtj39Cv/lnT0vaOOZapIHLFhZtU
         Jm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769007486; x=1769612286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F/VqqIhXdgX7j/dXUyWw4LxUrc07WTrCM45z7FHNuOc=;
        b=OS+38EfIpDnFnnODUVVZj2JKqeZhVKF6zsoyD9g0EOZWDeuVhdRN0NUmOzJQiKAQfQ
         P60xZMEqfqyLKPzxHU8vl9U+JmzKi8P4thXuYLRsEBjDAUKHLjrgJnDtwtIQoM9hmqLW
         +5um9jOCWDPpl8iNX1lAXRFDMZkyWn1HZycHmpSlaj22usCZ+6Eu643OmuPNxyYqjNlG
         +JM2/3jV26w1dUqte0jc9L+70h4FEMevL7Rk3xxTKSsX0FAUIIN0z+jfcljEas/NzEVY
         g5qqwbURe346+NUO+LZsetEXce1BZ1EDrjKhDDw/up03VTDTT6sKx9rc9B4NtzmEk7kL
         hmdA==
X-Forwarded-Encrypted: i=1; AJvYcCX4Qzu+VtJWGgBSIfP1XRL9om4hu9DgxoYiFNC+TMT5ZMTrGiCe3rgwrFWjMOX0IKIe0f2OzbE8tUiAF93VUgY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/aW2KuWnOfAxUkY3gTIibGO7XqQisLYkP08SvqrgnKpNrwWQE
	Viq2GOTQmcrM5za5npaTp/I+Kg1CVUB+xae14uJhJgJ/3BH8yEi6NncYgPHtuNu4yQoPMpcZSvL
	hlhr8fSkarp6rwcYDIo2S/nz6uaqL6n+8zwPom4/G
X-Gm-Gg: AZuq6aJ9+rLli6d5eOg7sySfWiFsfEbDotzRIllWJuncbI4tjSidgj4F2Q5SVKhdmQH
	gnBGMKAZbkfqz/bbF5yyl8ipfFErV4Aww1olYfe1dggZoDUQIaetm/GULk06gcexYHGEkuBqbfO
	LXhKJM+dT+L6EC6G3NIZiQscVfQGEPSZCjRniXNGBuKaxjWOhNemsyctUxy02w1bR/8ZLL6e3e9
	qZQTWh/bf09qf8yjqtyh27UeF7+adwhELcTLLLXDu2BkCfeZldoJrWfLcwc4GQ/wkwre6c=
X-Received: by 2002:a05:622a:1b8d:b0:502:a026:3157 with SMTP id
 d75a77b69052e-502a1757181mr221595791cf.41.1769007486020; Wed, 21 Jan 2026
 06:58:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121143215.14717-1-chia-yu.chang@nokia-bell-labs.com> <20260121143215.14717-14-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260121143215.14717-14-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 21 Jan 2026 15:57:53 +0100
X-Gm-Features: AZwV_Qj20kr6mRoNXbwQWdkosCn3zjOMui9Vi7kFMCTUHw3XP2Q1RPMTHZwkrjA
Message-ID: <CANn89iK3DOU4DX4=S-C7cKy-57DemUjToYVpYMT926mjFmyajg@mail.gmail.com>
Subject: Re: [PATCH v10 net-next 13/15] tcp: accecn: add tcpi_ecn_mode and
 tcpi_option2 in tcp_info
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
> Add 2-bit tcpi_ecn_mode feild within tcp_info to indicate which ECN
> mode is negotiated: ECN_MODE_DISABLED, ECN_MODE_RFC3168, ECN_MODE_ACCECN,
> or ECN_MODE_PENDING. This is done by utilizing available bits from
> tcpi_accecn_opt_seen (reduced from 16 bits to 2 bits) and
> tcpi_accecn_fail_mode (reduced from 16 bits to 4 bits).
>
> Also, an extra 24-bit tcpi_options2 field is identified to represent
> newer options and connection features, as all 8 bits of tcpi_options
> field have been used.
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Co-developed-by: Neal Cardwell <ncardwell@google.com>
> Signed-off-by: Neal Cardwell <ncardwell@google.com>
> ---
>

 +
>  struct tcp_info {
>         __u8    tcpi_state;
>         __u8    tcpi_ca_state;
> @@ -316,15 +334,17 @@ struct tcp_info {
>                                          * in milliseconds, including any
>                                          * unfinished recovery.
>                                          */
> -       __u32   tcpi_received_ce;    /* # of CE marks received */
> +       __u32   tcpi_received_ce;    /* # of CE marked segments received =
*/
>         __u32   tcpi_delivered_e1_bytes;  /* Accurate ECN byte counters *=
/
>         __u32   tcpi_delivered_e0_bytes;
>         __u32   tcpi_delivered_ce_bytes;
>         __u32   tcpi_received_e1_bytes;
>         __u32   tcpi_received_e0_bytes;
>         __u32   tcpi_received_ce_bytes;
> -       __u16   tcpi_accecn_fail_mode;
> -       __u16   tcpi_accecn_opt_seen;
> +       __u32   tcpi_ecn_mode:2,
> +               tcpi_accecn_opt_seen:2,
> +               tcpi_accecn_fail_mode:4,
> +               tcpi_options2:24;
>  };

I guess this is fine, iproute2 got no support yet for
tcpi_accecn_fail_mode / tcpi_accecn_opt_seen

Reviewed-by: Eric Dumazet <edumazet@google.com>

BTW, are you planning to patch iproute2 misc/ss soon ?
