Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B895366561
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 07:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779262072; cv=pass; b=QEPhOWcK83vc4tpnLwehYev98qYcETEbNHMSXuvrR3HFtUCWY3ZQvVIzW26bgcRFrwmv1jFVOuB5G5FgAsXgH4IrLny62E8r9a3lCOd4hUb7IxrLmYZTr0tBXzErA7B68Z1XrKbQU+gi9cStyxSpsHh0W3shEiqbL/Sk4O4PwiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779262072; c=relaxed/simple;
	bh=26j5PnrbpQm8XEb9ANX80wT6LvLHehW7AQcShY/SYFo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kAk1/Aq/QKEX4kY8Xodiue/CsUQJacNKPBsyKGN3IYz0UmIoCPZjG1+4qeVebWxbquWStP9WLdjztZT2v7/oivT72x+kQ30GNOjtRrSW7RpHriCxnXk3GHHpqjpJAW35/ollIf/+AKspc++by/t3C2uLTG4nVtzapSK6LEDEWRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J3ucB1jk; arc=pass smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J3ucB1jk"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8acb3daf2aaso79441286d6.0
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 00:27:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779262070; cv=none;
        d=google.com; s=arc-20240605;
        b=Qj3mkwyH+sr7QOl3i+wbt5KjjD9ua+sOStVdD6oqrhckPyBaSQB7dY61hJFrVXrvQR
         vjQUj8d3AlTrt9EUgZ3aDD3uF4l72YXQQGwex0NydAn+KNI5SsBHf+zTVejGOtjRHmGM
         xHgWKgbw7wJmkMieunhZIY8uNte8+bGuOeohRFudlCrGc0M5odbLX4pzFSbZ/VgSQwSz
         D/gXrlhAmbrle/qtT8jsSoLhKLiZ5h3/wbo4fbF4Fyl+btPpUox+DmGKKYxL2iX3vmDR
         Jd9ErJZTHh+fmLMa6ntZPnfs5wNOfK4jtr3eAOTvWWHRb2/0mLc/LQBacHNGkh74QedG
         7ypQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6TWUWPUGYIqERhMMFki3MCHcvxh+u+UVkFu6uEBr1GA=;
        fh=p029RD26hlbwoLleCk4bjGP3oCZepjIIwQzYeAgLg1o=;
        b=iuJpmhy5yYwSOh7CQ9Rj75EkzIR5bs3hs56pL6yMsLLi5usOTw+0RfDC+ESqrGHoA0
         heEB8npooGR+RBF0XDyyzMsQeFm+PyEbUbgGwsPawxRvCqqyBzDdarLnBfHB9fVR4hgA
         KYc+MwYVq/CIvfu/pF3ULb8f4oMkORxmIhAPch4WGBHi/5SJncxG384cnDoFlzMmm7Rb
         1msX/HQ11eUJKEP/k+yAtDQ3AdE8vK8CT6ULOtA28Zxbl7m3p846ZIClbiY2sMhvhF+i
         OUJGgN1ReUrQhr/taV/tJttdi2ob2Ki+F6G2kQaGhXh2QwL3UHfJNJynhL7C9x21rc75
         stmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779262070; x=1779866870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TWUWPUGYIqERhMMFki3MCHcvxh+u+UVkFu6uEBr1GA=;
        b=J3ucB1jk8NrgQVflRPSrss+ErIo8aeQ5KUUengDp9cBQ9QD0+hECHCmaI03WtA27Bg
         N/8t+GqZuD9Nf8dhlfTvj5ab+KrwqRjqoRcvhHUZ0vlwdeEEpHc7FHq+3IdzDPcZ/GBt
         YyUf8SLSFGnMJrGV7XtnZyD34rfvm2KsXuhQsDHMs5REDzKS1JeoSa/Z/1MfV+tlBIcm
         ka3grOZ68AUtRu1xHpMGbPFxOA+86gtquctcSewO5ds7hdPviG7bi6xdFH00eLxTj3sc
         2Qd3+xVldn+QZe88+qhDKTiIWh704y+dY8HYLawyy7s7o0+C9II0ad4JHNllsIKC9zFi
         Pkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779262070; x=1779866870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6TWUWPUGYIqERhMMFki3MCHcvxh+u+UVkFu6uEBr1GA=;
        b=nQQzp70aNSxQJbARmtlpkstCIigZItrQBWu9OtUhhAkoYlo2PaNwiWHmZBX8zIwRgC
         LdTdaSU1yrdK2bVvgC3QSv+8gPVEYuTC5MxXR4hx9kuoozwyWLNjjUlqIPzHNl2lzl9M
         OVS5kawVQl/OHRwPTL3ca3ya540mwQa/ypI8KagTA7Ng59PgoNXQC8u1vLwOPDDJXJjk
         52mNFSsnw0lLNRdTcAGN61aPQIfe5jrxh1a2nKR5kqO5ef3A/sz36Ajx2VHhKyH0ogpi
         1A2ygYMdut1v3o6zw4CBcqyPS9/VVdFN7gbQcxhQpcckCKeB7Saoe7hl1JmfoUhl/hXA
         X0iA==
X-Forwarded-Encrypted: i=1; AFNElJ93u+NgKffkhUAeu/sNPrfLxN46oDlIb2r2JzRC9yMRmEtJrBkgdYNa3YCpgXAKxA08lnw8w86dlDdm3IlCZrA=@vger.kernel.org
X-Gm-Message-State: AOJu0YztNEHgvBSJdBdXDo9jNqDqwqaQ5No+zq52s3VdELARpcaqwxfg
	QR5UJIKeUZ1Nxv58gvMF0aamoEYaAVeJMPGquQ8CU+xZjNfwfZvEuxyfa4XjFwq2sg/Ku64bwHV
	/kkFsVatNgl8cjlOIdO/mlUAFUH+nsg71MiXoBsUW
X-Gm-Gg: Acq92OEiSgCuy0vHxS3i0szYiPnIl2f+9FLk3jjdpNkhYok703SbduzWFWRmnjQnsI+
	ED9+BR1iy7JE0lQL25mT0ahATFH2a1gsYojuk2/VeOp5Q9p7fFzkAuk8o6syXrxakAfBwtX5+G+
	peJZP8cfw2/ea0/F7q7Nts51oDop3iHoRVCGtHgMM+uaWRuLLNfBt2qxpOjzMpaGfRlwjWN8lu6
	TDXe9XFe0VAjQUsCJQixPPWT0i2zPI37/Ia886ZmUfZyQ+ofhzL9WvgJSDJQgA/FF2sVwjHFI3V
	Sff2Y8hWGDR7XaHc+P2tpOWtqXIoNng7lyJ4DFgJajYpPMfbIl6SClDx/9cLKtmhW6/Yv0IBoqB
	KmYVDlHs4iwGHmzXzHJf2C+eSGBtZaLoCd+2FpXsP9JMdYYL+UIju9xK7tJLRWo9V
X-Received: by 2002:a05:622a:2587:b0:509:238f:ad8f with SMTP id
 d75a77b69052e-51659fdeea0mr321928421cf.5.1779262069703; Wed, 20 May 2026
 00:27:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518183424.3144867-1-sbrivio@redhat.com> <20260519190352.45c8478e@kernel.org>
 <CANn89i+DknqarcKuZxku-XvoioqkXrd3sQd3PXW5fdFZBpPxjg@mail.gmail.com> <5c1de7cb-42c2-473f-8d67-0523a3c86464@redhat.com>
In-Reply-To: <5c1de7cb-42c2-473f-8d67-0523a3c86464@redhat.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 20 May 2026 00:27:38 -0700
X-Gm-Features: AVHnY4JD8oaBW3zadh01hZWF6u2hCLMPvpBIBzObevgCfqF7AtZO401ykCVikiA
Message-ID: <CANn89i+RqFMt8X48V1xkk8mveLvcBORBb5crDKhSAGAvipxNRw@mail.gmail.com>
Subject: Re: [PATCH net v2 0/2] Fix race condition between TCP_REPAIR dump and
 data receive
To: Laurent Vivier <lvivier@redhat.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Stefano Brivio <sbrivio@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
	Pavel Emelyanov <xemul@scylladb.com>, David Gibson <david@gibson.dropbear.id.au>, 
	Jon Maloy <jmaloy@redhat.com>, Dmitry Safonov <dima@arista.com>, Andrei Vagin <avagin@google.com>, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 12:24=E2=80=AFAM Laurent Vivier <lvivier@redhat.com=
> wrote:
>
> On 5/20/26 06:39, Eric Dumazet wrote:
> > On Tue, May 19, 2026 at 7:03=E2=80=AFPM Jakub Kicinski <kuba@kernel.org=
> wrote:
> >>
> >> On Mon, 18 May 2026 20:34:22 +0200 Stefano Brivio wrote:
> >>> Stefano Brivio (2):
> >>>    tcp: Don't accept data when socket is in repair mode
> >>
> >> Not sure Eric is on board with this patch in the first place.
> >> Sound like it's not the intended use case for REPAIR so IMO
> >> it's up to TCP maintainers whether we want to support this.
> >> And it's definitely not a Fix.
> >
> > I am not on board. Only net-next material for sure.
> >
> > While v2 is slightly better, we have the fundamental problem of adding
> > stuff to TCP receive path for features that almost nobody use.
> > (It took more than 13 years to finally complain about the race)
> >
> > This consumes Gigawats of power on our planet (and tons of CO2), given
> > the trillions of packets processed every second.
> >
> > Please at least add a static key as we did in:
> >
> > commit 020e71a3cf7f50c0f2c54cf2444067b76fe6d785
> > Author: Eric Dumazet <edumazet@google.com>
> > Date:   Mon Oct 25 09:48:24 2021 -0700
> >
> >      ipv4: guard IP_MINTTL with a static key
> >
> >      RFC 5082 IP_MINTTL option is rarely used on hosts.
> >
> >
> > But in my original feedback I pointed that we TCP_REPAIR should
> > probably only insert a TCP socket into TPC established hash table
> > only when it is ready to process incoming packets.
>
> The problem is on the source side of the migration and I think removing t=
he socket from
> the ehash table would trigger RSTs, closing the connection on the remote =
side.

RST is triggered anyway if TCP_REPAIR did not occur yet.

This is why a netfilter solution is generally used to make sure no
incoming packet is received until the whole state has been repaired.
