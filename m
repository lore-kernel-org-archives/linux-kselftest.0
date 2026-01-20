Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F4D378D8F
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Jan 2026 11:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768907896; cv=pass; b=c3zZRsaWHppkMCHb9ycpXHy24e/Y2nGDJHjMvwtKx52dqr3N8oe1CPgDbmrpmHM/LJ33I9fuDbnDWkx1Mz1uVnNhJpzMbrKwCraN8s9q63ul1FzwlZlfiyAbRQvezylME4sJKE9N5hREfwUWaZhhSZXyGFZxuUWpX4fBkIj4VOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768907896; c=relaxed/simple;
	bh=IdT7Cnqlw0gbduzUyd6rGZsiu6oNpbZ6fLa8v0srGMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pGLE6fh+swCOmzRX2cdPP2otU/TCUjZWN4vMCJl5ok0ELGgkwyIAXx4UJMwmjOWa6P1+aVsJQ/hcVwn8uiwtnWiCObK7+c2SkDVekPQJ3ynil+EI12HrMDCyp+bOAu7P6vvsP2v9I/tuxrK4kiaiSeMai0h70L6YwltynPmqyIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RuFIMCT+; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RuFIMCT+"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5029901389dso33385371cf.2
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Jan 2026 03:18:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768907894; cv=none;
        d=google.com; s=arc-20240605;
        b=IcYd0qwRFbbHp4mublFEUSuP/cx70nWct3Cs6ELPin5lLa82CbnLI5KtNMwqVTRV26
         nFqTCk1N1UKc8FMrHPHJfg4A/gE5TfmRveqqOjiPqT70XRTap+FOENiiaUU40rWwOQV8
         bTLqNeXVaZ6Gws3yAcEphMbn73MdQfr+A2Ih/xpCTa50LjpGwuSm4fvAutasvW5sS6nh
         gadGUDmOiWRTRyibdnNlofkNcXDcLqA2YILd0YxHFThRM+mBZi7tMWVKqNXpUAgjsAwL
         +Sg1xcuyMqJo9UaZH9D7nDfDpl/ktzv4mHDqrmv23Pmawuue2rcrdNP82kq6dmZC84UD
         JEuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LUXil22tiizCYyaIA03hv+e6KoZWp5K7Bky9alaR5BI=;
        fh=QgwBNKRRHjB2ZG/JnUcq/QzsULDo3+icrRXeOGmI87U=;
        b=ZsV1FDwYvODghdUpnewyZMFcsUh+/eG5LgFW/KaaRw7uQM34JbO5ngK8OCHzLS4xG+
         +8q8hOpShOPZiaNbrKFsFAX7DmVpwNti6InihS6kzKP6JHe1SUtRHMFuyXzgHVU2Qlum
         ijn89gfFvuWjaLUd8yWv3XUIg4NU28XoBD95LrYVbHvQVUAoLFmdXYPU4BH2RHqMXlzz
         j+g+TUK6Yw1YAqu8DlYqcYBLIVg/HArcvIG1WYUDaBzixKvTVwdpkAx/xlvCF1jbIo0K
         Gk6SmOr8yhr3jDPEEL2/JvSMU6Rw2lthQqYwVrxv2uWS3sdYLAgb8ILikZdjbf62zgyh
         y2mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768907894; x=1769512694; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUXil22tiizCYyaIA03hv+e6KoZWp5K7Bky9alaR5BI=;
        b=RuFIMCT+LVz7niNHIRJQfbaoPRSsdO8Hqz0Z/J3m63nr6LKihwAtY76EjTAxL7Y5He
         DTI0+HBc2DA7Wws9P3a+ky+IPgAJiu38WkSpaLB9WI4HPkcQQJa1O5OABpYGa+wOaog0
         2Xbxu3SsZ+voGu4vgCZtfGmL2Jx9v9GWUY1tMOd4nk0RZVG6ynthaiaHNcQoixfRAI/x
         eQphwNh2B/mS+Kq3XTCmbTH89oN2NySA/zUtUdQYuoihubFh6NZjZW4Z0lv5RxuG5udH
         jlwtVEf9G+ok8ktVWOYSAZZ6NkFiMIZO0+uEHNZYn/kHcdsP++8gMj3Q8f5KClcKCmsF
         lhvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768907894; x=1769512694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LUXil22tiizCYyaIA03hv+e6KoZWp5K7Bky9alaR5BI=;
        b=WtMFudHpO36GrUFrtDBwbgLBzWVtHy3ZxFsAjr91mQfRXLetJ1YEA855bwymNma7mA
         FncFjW3sxTYuUnVKw2WojSaC9vCWXUYYltK7i/YYjAmETapfu7PgOwohMH8pfgDOC3lB
         OuCiw9813leVZKXIxgpa6KRM/w6KxxaAluoaR3DLowyW7jCZgOwiOqljM4DYSDbiX9EC
         IwRjaLOKGbOgeWIYoWBCm+8m/bMqMzKLTBxs225KYUc+wWiJ/ooYYMye+DUGUIvPsi0b
         j4IjLuYGLlmOeF+3gqrpGAr70VoWzU6yzkRd5uKajf7tDHJzO2KLNtBrnVXt2EZHbcWf
         rIuA==
X-Forwarded-Encrypted: i=1; AJvYcCXfFsMhpxJjArPLLcYGsyM7XlaaRELCCakpQBwFoxMUfPtSluqFc+Pqh7WQa6X6AMyRp6juIzFkximBIGzs+f0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqtntsDWreqSIbUvrYaJ96DzHUhqjTygOQ/M2fDEEA+kGzlOTy
	3Cax6axkjxvmTfgPY/u5YB6EatY3ObKOIntUn5YUg8Il0Jvvn88/RvNLUpAad7mFqtuo0SYdx12
	gtfjeb0/L7BuIugZjJW5uhF2jn2QQG/GJRijna2G1
X-Gm-Gg: AY/fxX4AxuoODBoXZTe8NzAnioZXleG7PlOdy6ajoSEEqe1a8Jtnk6J5Q0qwm3Zud5c
	gdMyzxA5XeegHR3ANeFrvRVKx/i4k/4hlJMx6NEmNzK6+1MvDM5H8fX0YwBM0k86szowR6fDS3Q
	e9VqIwF04UFm48R+HiJhNLHDf1Kj26VGuMUZr1jCLYOc6ecs3y4PU4tWXHR0h2lAixKmn4vjzSt
	kx+KknncLq6XgM54eNVmSMlOxmOspPbPq2GZ6cpZ6iWdeAr0zVKtTWA71aeeOiIP3V2cIw=
X-Received: by 2002:ac8:598d:0:b0:4f4:de04:2434 with SMTP id
 d75a77b69052e-502d84b0bdfmr14314171cf.11.1768907893248; Tue, 20 Jan 2026
 03:18:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119185852.11168-1-chia-yu.chang@nokia-bell-labs.com> <20260119185852.11168-14-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260119185852.11168-14-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 20 Jan 2026 12:18:02 +0100
X-Gm-Features: AZwV_Qgc8lwWGTeaXcXgJnQwinHD3Ss17Aa4vUO4GXRwqkl214KVxmDeii_C688
Message-ID: <CANn89iKhAs3rMWFdmM-rma1wS-Xd7mf9PBUQKL8YMKhB81Jkkw@mail.gmail.com>
Subject: Re: [PATCH v9 net-next 13/15] tcp: accecn: add tcpi_ecn_mode and
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

On Mon, Jan 19, 2026 at 7:59=E2=80=AFPM <chia-yu.chang@nokia-bell-labs.com>=
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

Are you sure Neal Cardwell really is ok with this patch, saw it and
gave his SOB ?

> ---

>  struct tcp_info {
>         __u8    tcpi_state;
>         __u8    tcpi_ca_state;
> @@ -316,15 +334,17 @@ struct tcp_info {
>                                          * in milliseconds, including any
>                                          * unfinished recovery.
>                                          */
> -       __u32   tcpi_received_ce;    /* # of CE marks received */
> +       __u32   tcpi_ecn_mode:2,
> +               tcpi_accecn_opt_seen:2,
> +               tcpi_accecn_fail_mode:4,
> +               tcpi_options2:24;
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
>  };

tcp_info is ABI.

We can not add/remove fields in the middle.

You must add fields at the end of it only.
