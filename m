Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34EA3FFAB4
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Apr 2026 15:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775058359; cv=pass; b=qGJE/plCMkfJi6u2EvTYSeu3YYN8ap/fr4dINXiQUIpv+gcQ2RT9lyfHmBVZNJgv+5vD1xb4WD+cZHkGapsYmglPGHLAEAYekPlWd+EGHo9UEM7wuoHYq6iwQYN1fbHKx/ooaS+HhgAtQNI4dW9lwmcOqHYBN7BlM8zajGKm1HI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775058359; c=relaxed/simple;
	bh=Esi9wO43FQaxJx4NMB7aYQXsx9C91N0Mmye513u0YKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iphmPpAtxi0y/kpcnaLiSa20cnv6Oq0g1ZdUYb8wZZ5XnLECbKKH/AJd918aRLUQwzHUYENZz+Jkk5CF6IspIObB0VSTxnZ/5FoSflY8FskYXfs6pEFLAebhPXpeN5V3aMsSxVJbODtb0xfxeamrA2XOM0Sgsl7HBmMO6yT5Bj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gx5iIZAk; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gx5iIZAk"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-794719afcd4so39739187b3.1
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 08:45:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775058353; cv=none;
        d=google.com; s=arc-20240605;
        b=OmyPYkbXz6fPQzjjUj0cE9GcKQgfxMMcE8hUWNwquufAC5p5bmZsF4tKgdTGPIqMYX
         //iGEKq6NMjOIUCFkUlgxSUGPlTpKxMWlArYygPFEG+rYWTE/neO1eotrEmIaSYAKoLW
         s5VhvCb3/nIhLpH+OZgJO054VXahkqgm7nbybxWzsvfb6c94qC+EsjP6WQfPIkQjX97d
         HPK6TYZTaKSiGvbm4U+54rNTmTp0UVZj9glcDvKXkc9AG7zhAD97oV8INPMN3clNN5ec
         4joTiVWN3wQWiyAy6+gis6u6k2txHAuPU3GSie2JMV5il9BXzbXBDHNRlF4DApZDadry
         PkXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rTGAJWv4JOiM3HwPkO1OOuIYpA+0TL54i8InJFWzsWQ=;
        fh=THI912vIoTeIx7OwaJrmU5f8IDnvz2hew+E0JKWwfBE=;
        b=fJFNpaEc/sDXGQp/TXF0QQkAgIdyvL8DLdx7nPDKoBoarO4y+VuRh6Am9icXT0puZF
         9GiCyqe4i89nSm5pfasW91xgDbQStD36ey2XbKfidup42/1IFNXCx5ViWW7Sv2defoKs
         osv5/nOBt2xbmKH8xRPHKQGaReMzqpTvsI3/Ow7HYYK8Vc5VzDZyPvFYOFmUVkqsJouY
         wVu2X9dDbww5u93OowuPkyrD7ANvLL7SxKbI3s9qvlczL2CrajIuTv9QaLI1aafEGN8b
         O6zxmkYSgycJrBbdvypwEaCGJ3OiQvHOm1ac6oU/8tniKXwnOep5GE77tpD7Zh3++lm9
         QI/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775058353; x=1775663153; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTGAJWv4JOiM3HwPkO1OOuIYpA+0TL54i8InJFWzsWQ=;
        b=gx5iIZAkZSP7OOBNHaL6XrF5y7/BQnSrPLwGqwKlm5sPejjpLvsRRU/Y984Lze24Bo
         Lk0i3p70fe80fNQH9v0i+Rr0ghokHQxEVTsfIItOk69AAWg6zJbl1L9g0CXYvhTeyN24
         TVWk95m+qFTbBSgwih4plH437afxucD3fvtPl5a6DYf9h6oPgHErNCySOpRjw6h1Ikvs
         2LS91pQjtI2f+tSg3izZC11aQ6zv6jIUeKCzHnBCwUxMEw9A97LVU2S3slx3JsShmyOD
         a5MyHSQ+aK9qZIm26PvBEF2nHh63ECQin7Rh9nxNrTm2H0u5ianugmA9TbeiENjb9XKM
         eOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775058353; x=1775663153;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rTGAJWv4JOiM3HwPkO1OOuIYpA+0TL54i8InJFWzsWQ=;
        b=s/R9P8P0vaMLbOHbtwMcbtEv5jTeUMCKCNEtQwtn8VGEBH2QyTbgpEEjf6WZHdWId4
         wnXkXMr/eZzfPRwY83RsCeepWtoxl65OV7iWe3So7HZr2VTlyskqB4jkd3cORMGcGiiS
         UhqQfCN5wJzXfD2vWahLzeC8SRvg9JpaV1TBAvRuO3NZOlLMj8eIwXcRPrN8RmJHl/TV
         9zM8qwR0fPOiOVIftCvZseOmRYLOlOx1+yriBATtj2uRlZrVwGU3/lzUlPvus/B+OCD0
         YUQ845JMZyDHwOJKKmqa5GMFom11YoBJp3KUGHE0FDZbnUa2IHOuAl3RS/vlrtbSXC3C
         u50g==
X-Forwarded-Encrypted: i=1; AJvYcCUh7aMGgeXKgg9bEbx8O7XkQCB9SeO2RrIrgwJ70Kfg9sUHL6rdrc708pWCCW4RlFluc5gnum0AHheStac3nPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YylOrL00TT8aV2PrLiYCgWPeD3rJRnYKqVFNEN04vqu/tXabSGR
	euwm9WLLl1WtKeOJV1u3Nas2xuYdbI8ohirUp1KXXt/AkG0Y70PnIcW85phVitlnpGfB10hzfXA
	VpxbJ9/Ptg1jCL+gcuOWuJNU7nt8NdK4=
X-Gm-Gg: ATEYQzxHkTMFD/JV9qfY/ODtFF80QQM3T5fYf9QBgPBjAJ9kVVsOfJMfn6mxx/gDUU0
	nLJkzjNX8RRap0l0yNjiQdE+G8HysuHZFi9hqZGod6Lu+8nhdEaFzyG9ZdEIMELw+gyQC7+xBqu
	H0k373zLJ8nOo4uIwIEMQotgJF+TcRTq3xBHZFMu+5qL7Du7By96G0vi7hyd5/Nt1h4YuJ98tSy
	veRCpvt10WiJNjPl87mXGdHZON9kF7E1cVdHN/+A6ulz0m+wNV2C3Kqp9rFmJrLAx+Noc3/yqNr
	Mjkqwn8rAmGtzUU2sv0MEmJixaaNiZKHtDdI
X-Received: by 2002:a05:690c:ec5:b0:79a:b330:a8c5 with SMTP id
 00721157ae682-7a212338856mr46397647b3.38.1775058352686; Wed, 01 Apr 2026
 08:45:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330035604.133073-1-dqfext@gmail.com> <20260401081030.29b050d5@kernel.org>
In-Reply-To: <20260401081030.29b050d5@kernel.org>
From: Qingfang Deng <dqfext@gmail.com>
Date: Wed, 1 Apr 2026 23:45:38 +0800
X-Gm-Features: AQROBzDs2PPqt_rboD4nSJbhKsxG4xBUkUV-LUDRPkPIF5__1EilYpl7BBNQO7g
Message-ID: <CALW65jahWApDnVmFReW+Y3HDxBEmCwzsT1oyh03SW7X5ry6PzA@mail.gmail.com>
Subject: Re: [PATCH net-next v7] selftests: net: add tests for PPP
To: Jakub Kicinski <kuba@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Felix Maurer <fmaurer@redhat.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	"Matthieu Baerts (NGI0)" <matttbe@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 1, 2026 at 11:10=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 30 Mar 2026 11:55:44 +0800 Qingfang Deng wrote:
> > Add ping and iperf3 tests for ppp_async.c and pppoe.c.
>
> Hi! I added the new TARGET to netdev CI, the pppoe.sh test does not
> seem happy:
>
> # timeout set to 45
> # selftests: net/ppp: pppoe.sh
> # Plugin pppoe.so loaded.
> # PPPoE plugin from pppd 2.5.1
> # Send PPPOE Discovery V1T1 PADI session 0x0 length 12
> #  dst ff:ff:ff:ff:ff:ff  src b2:36:d8:0d:61:83
> #  [service-name] [host-uniq 9b 08 00 00]
> # Recv PPPOE Discovery V1T1 PADO session 0x0 length 73
> #  dst b2:36:d8:0d:61:83  src 4e:f5:66:23:13:38
> #  [AC-name vmksft-net-extra,debug-threads=3Don] [service-name] [AC-cooki=
e e5 e4 8c f0 87 72 d8 3a 60 66 4e 32 e4 ee af 6f 9a 08 00 00] [host-uniq 9=
b 08 00 00]
> # Send PPPOE Discovery V1T1 PADR session 0x0 length 36
> #  dst 4e:f5:66:23:13:38  src b2:36:d8:0d:61:83
> #  [service-name] [host-uniq 9b 08 00 00] [AC-cookie e5 e4 8c f0 87 72 d8=
 3a 60 66 4e 32 e4 ee af 6f 9a 08 00 00]
> # Recv PPPOE Discovery V1T1 PADS session 0x1 length 12
> #  dst b2:36:d8:0d:61:83  src 4e:f5:66:23:13:38
> #  [service-name] [host-uniq 9b 08 00 00]
> # PPP session is 1
> # Connected to 4E:F5:66:23:13:38 via interface veth-client
> # using channel 1
> # Using interface ppp0
> # Connect: ppp0 <--> veth-client
> # sent [LCP ConfReq id=3D0x1 <mru 1492> <magic 0x6db8fab4>]
> # Modem hangup
> # Connection terminated.
> # Send PPPOE Discovery V1T1 PADT session 0x1 length 32
> #  dst 4e:f5:66:23:13:38  src b2:36:d8:0d:61:83
> #  [host-uniq 9b 08 00 00] [AC-cookie e5 e4 8c f0 87 72 d8 3a 60 66 4e 32=
 e4 ee af 6f 9a 08 00 00]
> # Sent PADT
> # ping: connect: Network is unreachable
> # iperf3: error - unable to connect to server - server may have stopped r=
unning or use a different port, firewall issue, etc.: Network is unreachabl=
e
> # TEST: PPPoE                                                         [FA=
IL]
> not ok 1 selftests: net/ppp: pppoe.sh # exit=3D1

It looks like pppoe-server fails to start. You may check the syslog to
see what's going on.

Regards,
Qingfang
