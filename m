Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D157B36BCF7
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 15:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769613616; cv=none; b=JHrtaL7pbkrcjYA/k4MzElXkt33x2UDvQl+eJBVuPsGTLWXJ3quUv3mhIeZmBnTWw8Y9y2b6vKcnclbMNVVKqayRg5/BmhVdPjwss+EKF6PstDpJvoFyGEKfJAd+lixRGvCyhzRjXZSCljSpPSFrWhfkAN8GQqwTbAdQmV6fxhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769613616; c=relaxed/simple;
	bh=HoC8LhG8WSClX2PBvFqAWN845DX/UYFRo5NSyvhIvhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SlRCEQzd3AG+KuYcia/ytngLWHGpNiWfXp9cnYwcPhgUjRZ5ZbIY3h78mf3egfJaiva05k8xRO+eOTpWxulsYb9zI1CvKlFK2tzDYZs+i500rlOZLXWaqS2Mie1I+LyAEMq/6jHqL8GcYdshuuxRpcQdB6hoGCZi1he5RDEUFh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBC6F6P2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBC6F6P2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B6C2C2BCB1
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 15:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769613616;
	bh=HoC8LhG8WSClX2PBvFqAWN845DX/UYFRo5NSyvhIvhI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jBC6F6P2KY/g2To8t3AiWtgEIGNETf+IG7YKYqoVXH6RLrz111MHNDq9EVl7Xtrg9
	 6OfJOVziTCCxYuxTwwUWokBqZe8TsNEkm0wj3c/7PSVChrAb1OqmPAMswKTUyE62T3
	 BcJx1iP5Lhc8ZFtJtfFHlizghCqzUifCJotIQHdf2FNDjXFki2N6dzTMr0KhYoFy/j
	 McBvZUOjjR//9dfIuGBbyKp8OOrjEig0rsWU0vsC8n7+xvb2qU+5nYZadOiLDHc4a1
	 t0dfwsOo/bPokkygpiLqevFARezutLu6WD8dzmMvnVSSIq2yhwPXQtJyllwfEn6mF/
	 bKXkLRJYxk4Og==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38320cd563aso77919541fa.0
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 07:20:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWDpA9Gyv/lics/mpF/l8hbi6DhuuE/b2NfBIQTkIWSBtUqP1rGZs5R1CGcJpSNO6TI9egyNN1Kvz8U1SV/n8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCIAglQrAxWrXmpCd9pu1kluIbfSbKZ9jxhvJXvxx2KN0XX2qe
	tYuwTdtPE/axZ65ujledldybDL9aexVAcXcaZNJenayaAKB9ZQBeVo04dWixF7uyuefaRpFY7to
	XPKi/GjEuTby7/cQyOBWPn73SyRaPu8g3kWBCOnS40Q==
X-Received: by 2002:a05:6512:234b:b0:59c:bf32:d72e with SMTP id
 2adb3069b0e04-59e04017940mr1986016e87.1.1769613614738; Wed, 28 Jan 2026
 07:20:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260124170535.11756-1-johan@kernel.org> <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh> <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
 <20260127235232.GS1134360@nvidia.com> <CAMRc=MfP1_fH91AVjerbnwVfhA0oqBKV+CTX0_1n32g1t-Pvuw@mail.gmail.com>
 <aXneX-aZofvuk8gl@ninjato> <20260128150538.GA1134360@nvidia.com>
In-Reply-To: <20260128150538.GA1134360@nvidia.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 28 Jan 2026 16:20:02 +0100
X-Gmail-Original-Message-ID: <CAMRc=McE5yTQ2hcLiR6asQWEi=Y1rhHzqq7G6FR58LCFZi6BAA@mail.gmail.com>
X-Gm-Features: AZwV_QixN1qjiYFVtBStiaYSvTbAVcPtvDTWFiixZhRpnNPlSRdbnunCxkXmlSk
Message-ID: <CAMRc=McE5yTQ2hcLiR6asQWEi=Y1rhHzqq7G6FR58LCFZi6BAA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Johan Hovold <johan@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Dan Williams <dan.j.williams@intel.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 4:05=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Wed, Jan 28, 2026 at 11:01:03AM +0100, Wolfram Sang wrote:
> >
> > > One exception is I2C where the logic is so broken we need to first
> > > rework a lot of drivers.
> >
> > Let's say "bitrotten" instead of broken. People used what was available
> > at that time and they prevented the kernel from crashing, at least. And
> > up to now, nobody had the bandwidth to improve that part in I2C.
> >
> > > Wolfram is on board with that though.
> >
> > Ack. I want to emphasize here that for I2C the SRCU part goes into the
> > subsystem, not into the drivers.
>
> I would just gently advise again that SRCU is not a pancea and should
> only be used if the read side sections are super performance
> critical. I'm not sure that describes I2C. rwsem is often a simpler
> and better choice.
>

Sure. We're not there yet so that's TBD. The reason for using SRCU in
GPIO was the fact that we have consumers that may call into GPIOLIB
from atomic context - so we must not sleep - but we also have sleeping
controllers - so we must not take a spinlock before entering driver
code. SRCU was about the only synchronization mechanism that worked in
all cases as the locking at the subsystem level needs to be
centralized.

Also SRCU protects pointers by design, which makes the split into
subsystem- and provider-owned data logical in this case:

struct subsys_data {
  struct driver_data __rcu *priv;
  struct device dev;
}

Bartosz
