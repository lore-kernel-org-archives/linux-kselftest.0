Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8472FD7D3
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Apr 2026 07:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776669760; cv=pass; b=hvyApNAjzy+cUs6toDMCpKJ5F7YOXEl6DHhakqdg3tbgfixNGDXNIXDpO8uiYnz2STl9nOiRml51a5BBVXBpqUw6DtZud0R5CLFPIxYqk7U86t2j5oA31Dge3JoKkl7Zu/YhRSHOHJUy9FKaYolr1CVToanrri9D1NphEwuWLrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776669760; c=relaxed/simple;
	bh=z6RjGPSiK8r0oWXY5W6DEUzXSooC04ggiIIVzrIwlyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZmmC8DyXMdj+seVUuSWTkEN+6VDioH6BTG5wAlqgPTqwrhskQCD/wFRD8B+Yku8AlAg/SipbCQ/S565zNqUJv9iephmNp3sWbmCsmaPIBSOTrrHnrLGQgQlZrKeUU26V46Ai+K5xnQV4lgRbzr/J7ULY3EIa5my2leUX5aY/WhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UBFHCkDw; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UBFHCkDw"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50697d6a69cso14516561cf.2
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Apr 2026 00:22:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776669757; cv=none;
        d=google.com; s=arc-20240605;
        b=WbalRwOxdiH32JTWfC6oSy4DYOs0p1Ac4Aqp/N9tATlFSJEB6W6HZ0UFByGx3gzroY
         Dt7iBJfqPwYrPf3TFAbEToc9/NobZYGVc7IiMrxtxyCOXOpJ/YZ31aDqjwGJJZQpcYJc
         prBuk1KN/UEVTPkJVnpyqpJyTCgBK77qfG5gs+ngL4pjLWJwjoI9pI+31jy9VlWpBwku
         ppoOT66g2MuC1Gf/QES3675/LoBemj9+Q3e6BlELDLHnfBk863hr+ekS6NiHHST2ybD8
         rvZ0Xsx6ToOIOMdu9DAsaLjpxDcmNXeToQO06ODJlLf26GeklDn8QcemUaSj7p4rtutd
         iItA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KVOChXZq0zoMztJw+hJ88VSw+ye8042PpZuah7BunBU=;
        fh=nmbr7RSlHxYPuHsYUQmjzGaIv7P2Fk0WXiWJs34/lac=;
        b=M8YjeqOLMR4HPoQYOMHAeuK7xAvO4yJCnO430SIayChN3X9z1q6ztWrFBcxHayJeHw
         +vFJ3RcOjsYKzpfC4qfk9AhcBu7RL1mgcqoXyEcKZwm0t3DX4JNoe3Q0qHHRzK7fRaqQ
         8CxHgLrZH2uPtLWFV7783zp9lD8qioSvAPTVpJ2txAlh/EDmGsuUBgYOp4kLwvwEuUdA
         vO6Fpk8NO0+R5XWjNvppddYpF+aQr7y0ecVEE/AlicsTxzTUN4+Odp79heICku6ebxPV
         XDRlkW1woCqM6Oe2fJmbifPd2yhK5AoepvYjm0AtQ+Amcx0J+KeIQZbJ7OyWrv/8KE/K
         QC1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776669757; x=1777274557; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVOChXZq0zoMztJw+hJ88VSw+ye8042PpZuah7BunBU=;
        b=UBFHCkDwTHXb/dR8rzW28LgFTvbprdGUXDCFAdiGBymsgYRkIfpHE1C3RrCXLshQ96
         G73xr/Az/0nFi5t6WERBEFRG9uWqGnGRhQfisGFwn/oPmd95cxStLzX0m4wpcqo+Dy1s
         l14CrJ7CSHpDMPiUY+YVURsSfDATuIXQMIwzMx2djpIXP+sZCPJ7QvvgOb3/2O0lNK2p
         LoaKPPbfae3GJr/5VAxpMOEMvT6U62+uasKkQwbSpfEQzoa0DUUpnpYsoJqeIZV4SnhV
         Pe670EKs7HkgLatZKlLBXLArtQWYoSrSaiAe1irIJ0lIqgLGwfbY6jHhwXnXNbz0A5up
         f0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776669757; x=1777274557;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KVOChXZq0zoMztJw+hJ88VSw+ye8042PpZuah7BunBU=;
        b=YAkd0uYP2afVzYFZcNQkm+ZkF1P9zzCba/xvFbPrJriraJLEplVfen/B6DsAn71Fd6
         VCNxugHK/90T+E33QiW9N2Yq+zdvasdggMsUrOARHDXtN0bfABThdb13rc2nb8wlEnRh
         wQN0JTx9nCDTNn5weUNtk+7urhIUlxYZ4eR1QKaTUhuYHYHRb6DUybNP4T4gqiQi55lG
         kS6ExDgLw5S1GGR6VmPamR8d11tA2zXGAQx/UQkuAQk92lCTFYYnypymJldeRxs+R70q
         ld+LAwfiKbjxyK28NfaWPFcSIA/uhhEAV6jk/GrtTe04snl8AL9wjAekEhdJJQGcX9uv
         aI9A==
X-Forwarded-Encrypted: i=1; AFNElJ9vFGwyMxzKzH/mXViQcPrP4qQzgomR9STNh4kchG7mOyoX80K9YW5npJv3yhJhvMKmLPH+0FtwNxARu/0rICg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIJ9WkhzqoqSRmgr/mpAK+kIe7jwmFKOJjP5lgHGWZ5Ws33fxy
	3rAAVTqkjKFM3oqALyfSOYsz2S6hPAn/CHS6cchpn9V9yjJd20iphbw8STUwr4koZ9vyEvU2qod
	n1JNddzPC0oRX19xXzO0TcCaTym3oatzmH9PsbmDT
X-Gm-Gg: AeBDietYXv1p/i7k2GGwot1VRLI2xtBUeYedm4uWl1EPCOZg1K0SJmrV8I9G2Mx6Ur5
	s//YsW87V4atNFmdt3lqx4fm6SGtXYF6dFEvry4v56dOa7Im3xtiFTWJHphxo2dWLBHrQmMYoE1
	gVHoGyPianWX7AdTV8VHiC16f7zXpaTsYs2my/et6QY8IrN+2DuBO1fljmErxLS57tpTp9zp4za
	QO4SZGrnj1r6n35ybj+dWrn6GWT/Z7a0hKrSs5uV6351Opy0HezbTzogdTD2w3Vbd3iTRBiCO1q
	86vcUAjIaihR6U+EhoFK0YMykLR/2aVzVHDdVFEa9YrTJpPApveANr6XD3cNS4k5wXjh9A4hXLO
	sQlCSwcXY
X-Received: by 2002:a05:622a:13ca:b0:509:1470:d3b2 with SMTP id
 d75a77b69052e-50e36ca15abmr179564361cf.60.1776669756390; Mon, 20 Apr 2026
 00:22:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420025428.101192-1-jiayuan.chen@linux.dev> <20260420025428.101192-3-jiayuan.chen@linux.dev>
In-Reply-To: <20260420025428.101192-3-jiayuan.chen@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 20 Apr 2026 00:22:25 -0700
X-Gm-Features: AQROBzDC74EX5M4Dk7Jdn6RBQi37Kbrc-y7UEen5QduIBRs6mrCuXqesYzBzsmw
Message-ID: <CANn89iJhHZH69ShAS5_V5RdgPgvfz19dZn7wsb_N3EAScVoR2w@mail.gmail.com>
Subject: Re: [PATCH net 2/2] selftests/net: packetdrill: cover challenge ACK
 on SEG.ACK > SND.NXT
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 19, 2026 at 7:55=E2=80=AFPM Jiayuan Chen <jiayuan.chen@linux.de=
v> wrote:
>
> Exercise the RFC 5961 Section 5.2 / RFC 793 Section 3.9 requirement
> on the upper edge of the acceptable ACK range, mirroring the existing
> coverage of the SEG.ACK < SND.UNA - MAX.SND.WND case.
>
> After the peer ACKs data the receiver has never sent, the receiver
> must respond with <SEQ =3D SND.NXT, ACK =3D RCV.NXT, CTL =3D ACK> and dro=
p
> the offending segment.  The script validates this exact response.
>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

Reviewed-by: Eric Dumazet <edumazet@google.com>
Thanks!
