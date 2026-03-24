Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1052BF00A
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 14:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774362500; cv=pass; b=ERW/rgzlN1llB35gHfSCHGpgPqzJ694PSLBYdLH/3S+qLgiULq+5U02NE3Q577bEUgE1VbOaJeSAln4ELsxnrFbwYLniwGorRv5Sg/03Z1VXOtyQGTR+O1Tq/hnWHsqm5XrHohNT6OV1DlZjuaCKVruEEXhOU1pyfy2lVi7vZxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774362500; c=relaxed/simple;
	bh=L3CuNiDuwieUnOiyL7wgyvC6rJNK4h8dNhkwpoI15G8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WxBfdudCRdFB6y2a6tTDU1lOXS1SK7MR9HHsJ/xMF2GCW77hzcgZ4iMOQB8jCTDvGZUw222WaXloF/X/2/I06iApNMNHEkLRKjuFkaqlcYgafWcNBku+bSniKRHDshVZNjzf8Vf15K/BX9cWDyQr8mEvp0TlTGbZ5gWZFf+Omeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZonTuQeh; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZonTuQeh"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-50b268fba9aso11638761cf.3
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 07:28:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774362498; cv=none;
        d=google.com; s=arc-20240605;
        b=ZMci4/MebbN/qSyBP4JJSMTgbwZh6vSlZ4J/KJnGdRKJ0o17xkUV6noPdAZdUOdFsE
         QdyxoN3tgjsQh3MqH6w6X7apU2XzZvdve9Qlzm/khIrFRPB6aexKLSiySyechdCOQ+I1
         FitOG1RWiINdDUNig5+/4nJhurxpZL4rDdxxh8su6ziFYiytgZAvqelpaXynQrltZ6Mn
         sVZuvRjivVxtn+jOKaLhNZhxvtBVglrCvOMjDOC5lukAZvxn07zPlrc5NQcCg6FzuQSb
         MmKMUV+xtSTau8QLtuBBRcayC/63nkz3cb2DpVgTgTYLg2JqFWggGkXkdqaMfzfZhTtz
         NYTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ULO39KvKl0c7cILigXpdtzqRgBfcJj+jT9Utpz3M4js=;
        fh=2FUGT0T5FCbLFGh7/a3LDC1sNRjHZtXZj9LMZBSgm38=;
        b=U5DnLMVq8jhNWF9GZEeHvn9GG1IC1DG2lDFPSLS/341t3yXiLzJqgykLkRvnAU7ZmB
         STQRN8wB58jxIh71fNmBDbxX4RnNoI2yHiQn8NXAxPjrrKXUwO7SjvwL9FnOdLM47oee
         khU5ZGbdhkeRAGo71oh8C45qj5h69a+eqOCPooHV/o+j1ne6pL9FqNlvfaSA7NurQ+TC
         +uTzsfP6FH5E+gCVLP3BtUVxnP/EMfbC9n7XWEdK2J6+BxPsizzqcB6zIbyrqTBeNtC+
         V1YH9wEiySgoGMxY1zAmFXr7xV328AEQaXrBJ7zHn1/uEkvm7/1jGnxfQKhxnPyYHjyS
         eM2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774362498; x=1774967298; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULO39KvKl0c7cILigXpdtzqRgBfcJj+jT9Utpz3M4js=;
        b=ZonTuQehrYqbCb1jdqTMl+RsCaS69eCImQi2BFqFAq55T4En/06d1+BSeG6zl//2ar
         /A3AB4LEo0Brb1zuZBG6fk5lGnXt/RBSDrFBqI250Ez3uK+zf13m/vUO0uj4rSRxt8Ss
         zh9b1+8UEUDaiQUA60pEZ00/RMU2qKA/RNVayB2u+lRlfpTNQetNoGrjzNWha9kCcYv4
         hxvGNF1urTllraA/XAfvmJCryfAMRcVU5Q1cBk79T3Z3o4zbmFLkTN9U3qNb+GVUfnVC
         wolPEoFhMGqSFQAGWtTZzbJE79AXnE+5wlrlE8akVfmgKtUIhpjLQzjX/eoi+b7QdDh1
         TFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774362498; x=1774967298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ULO39KvKl0c7cILigXpdtzqRgBfcJj+jT9Utpz3M4js=;
        b=CSsPEyI9g5Ki8leIDsO+zgb37YitVOxgx4Ow+0NFgmJP43VbnazJosCWExF9oIUtN2
         +r3e8eMz3T6aHlgWd3Vgf1tCQ/1cKh6dtusFHbI4pRKViNEe7HWAhJZa3cAE/sUX6K0x
         LliDf5osfxnZj8Llm40rFm92imPSZNUAq0HhCVdQ83RAzIPm/SWBvJhFNbp1ybcyUHhZ
         ZodpR7pVjYpcrjZVogzwwl1rXhFT56qjXGrPaf749fmt+PD9+0LUF4RQul28rFCcLu0E
         vDr+786kiWV3YBBQdM8WIC9R+RMjQqJytFk/GmHYTAV1+LSABrEkoebz1x6wkYFxAflV
         nvTA==
X-Forwarded-Encrypted: i=1; AJvYcCVaX+F6IAHyKb/xzB0jhpbNhRXKYRrYVs/YEeqMcsPCHvpgWhmraGXswdQcfswu+v/jMLsazy5KmDIbndS8JMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YywdE9fwBjJtoj4ez8neyZCBwthXWhL5q5aUv7/IqakW7rP3gJz
	ets3si3H1+x7K+MRYjSWtTHpjeiR/wLwOpUGhvzNtNXiPEnZrpK27lZgPFKuEe7IMQfLVgyIWjV
	d41K+PtF+gy0mS0PJPGi71vjVlUJPGpww6M0iL0e0
X-Gm-Gg: ATEYQzw+MmjUysJ2x2JhhervQO94KaXHPdN1vxcfWSYavN93ifx50Xe1nXS3Rr4ABdu
	hU7pZVsxuEGQEqmJtnoFlRRm+BjQIcrYEGybNu3e/EZjJElDilYIp2p2O0fR+l42iWvuPnKY1cQ
	Cu29/fLs6a2y8/NXtdiqGtpk4jaSJsvnuHES+lrH/fLwSjQvtf8rkTrauGTU56Imo4ekFUijfLJ
	ytRLSKe2xp96P3GSBC+IIkEGdMVwhx6pxnygaLQkKwFyX3NLJuAPjt3qkgM3SzLCFsx/gsh6c6r
	CNqk9w==
X-Received: by 2002:a05:622a:34a:b0:509:34b8:a373 with SMTP id
 d75a77b69052e-50b3747c5dbmr246789041cf.32.1774362497318; Tue, 24 Mar 2026
 07:28:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324060410.1137199-1-atwellwea@gmail.com> <20260324060410.1137199-2-atwellwea@gmail.com>
In-Reply-To: <20260324060410.1137199-2-atwellwea@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 24 Mar 2026 07:28:06 -0700
X-Gm-Features: AaiRm53b7oj3q18mF1VjTrV49jKDyaAl_yIR_9EKLfbAe9kjBY-d8l_Wq9ugm6w
Message-ID: <CANn89i+1mW0NRUoqB3W6JxO+7bywcuH=RP1=39EjZmu8xshC8Q@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/3] selftests: packetdrill: stop pinning rwnd
 in tcp_ooo_rcv_mss
To: Wesley Atwell <atwellwea@gmail.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, davem@davemloft.net, ncardwell@google.com, 
	kuniyu@google.com, dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, shuah@kernel.org, gmbnomis@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 11:04=E2=80=AFPM Wesley Atwell <atwellwea@gmail.com=
> wrote:
>
> tcp_ooo_rcv_mss.pkt cares about the OOO SACK state and the resulting
> tcpi_rcv_mss update.
>
> Its exact advertised receive-window value is incidental to that test and
> can legitimately move when unrelated rwnd accounting changes adjust the
> ACK window.
>
> Drop the hard-coded win 81 checks and keep only the ACK/SACK shape and
> the tcpi_rcv_mss assertion.
>
> Signed-off-by: Wesley Atwell <atwellwea@gmail.com>
> ---
>  tools/testing/selftests/net/packetdrill/tcp_ooo_rcv_mss.pkt | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/tools/testing/selftests/net/packetdrill/tcp_ooo_rcv_mss.pkt =
b/tools/testing/selftests/net/packetdrill/tcp_ooo_rcv_mss.pkt
> index 7e6bc5fb0c8d..0b19de9f9307 100644
> --- a/tools/testing/selftests/net/packetdrill/tcp_ooo_rcv_mss.pkt
> +++ b/tools/testing/selftests/net/packetdrill/tcp_ooo_rcv_mss.pkt
> @@ -17,11 +17,13 @@ sysctl -q net.ipv4.tcp_rmem=3D"4096 131072 $((32*1024=
*1024))"`
>     +0 accept(3, ..., ...) =3D 4
>
>     +0 < . 2001:11001(9000) ack 1 win 257
> -   +0 > . 1:1(0) ack 1 win 81 <nop,nop,sack 2001:11001>
> +// This test cares about the OOO SACK state and the resulting tcpi_rcv_m=
ss.
> +// Keep the ACK/SACK shape exact, but do not pin the precise advertised
> +// receive window here because unrelated rwnd accounting changes can adj=
ust it.

I do not think we need a comment, the change is captured in the
changelog just fine.

Most packetdrill tests do not have 'win xxx' in their xmit packets, we
do not need
to explain this.

> +   +0 > . 1:1(0) ack 1 <nop,nop,sack 2001:11001>
>
>  // check that ooo packet properly updates tcpi_rcv_mss
>     +0 %{ assert tcpi_rcv_mss =3D=3D 1000, tcpi_rcv_mss }%
>
>     +0 < . 11001:21001(10000) ack 1 win 257
> -   +0 > . 1:1(0) ack 1 win 81 <nop,nop,sack 2001:21001>
> -
> +   +0 > . 1:1(0) ack 1 <nop,nop,sack 2001:21001>
> --
> 2.43.0
