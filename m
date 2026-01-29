Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5940227A91D
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 13:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769693273; cv=none; b=GU1WBwiTZWpFRvGIeuxSvQvDa8gLbRDer5kYpt7MH+/j5s3hTN8ns2hRJh4MJlbgJ/3+xLcPdiXAkgi8s42r8BfeB2IpgZu8SAi+/SarMqDu1Rsox69/a1s/Uryrb6Ydq5S1cwnlDOHPpWSyAudS7o4L2AxwL9qJ5EIAuRIskzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769693273; c=relaxed/simple;
	bh=Psm+sqOn+lU6WqolTua2QloJaIgTKAUHlHWHCdmIZpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kU2cL7WqTLtrNxuKueZG63AYcAmeYgCLriSPP1cJiI9rI9y06A6qKH3cfqmRKgl9gFs5K1SwBDpF8VNmrV2/tHE965iV6+t0wnxkxpKhMhNXENjoRCtqr9syWjMBqCLTXP0FZsyrLY0jmj0vF5VeKJwfK62Hczjh+ptW8Da5ePw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=On+7JMl6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="On+7JMl6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1838C2BC87
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 13:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769693273;
	bh=Psm+sqOn+lU6WqolTua2QloJaIgTKAUHlHWHCdmIZpU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=On+7JMl6rfNv+eYR0ryFJKK225y0dgUo3ySFLVThp6BbnEjRrx8S0Q+eTmFzhqhMi
	 wf3jxYww4M5FrXEmHQQXymE9Ss/zfIm3FddC7HWLaOUSDaTHvsDUq1OxojqMdCOLgA
	 g9aCTWTu776KGhQmzPqUzMmm4zAGcPnOq1V1IsE4DhnAck3gqu0TCY1TVKChScDhhE
	 nthSQbJZkkVF071DFP11mqGk7dwR0rMWB6lnuXHHpsFs90UlH3Xa/rW4fmHCyeyEQp
	 nD4FvbykkHMbr9BrPZkMt1xaWcfaXcpESYWXI7i7+G/9ti5FLygFA1i0oQAof/tdJX
	 3z1ScMfRCvhiw==
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64997a4dc0fso901577d50.3
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 05:27:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWDVD/gbsm1U4pHT4QszPMOs4eu8gVCwTIunJ2ArOOU58/0VY6X3icr3IMo5mTgTvOBeXCSOoGdJWzy9t49icA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdYnq1cVDPtBIJ9tWeRoGBdLr7LHUZHAgiNEM1jwGCNIf2ngQY
	S8Qpc3Ug+zaJwGG86w64LFTQCZJ8xA/7uS643XZsX/6ChWjj0VweAM6gE+yiSvgmC6Xa4P8VOdQ
	LGUUpYsPw9OX+4HUeohx2Snzq/cO5K8s=
X-Received: by 2002:a05:690e:4006:b0:645:527b:bc08 with SMTP id
 956f58d0204a3-6498fbe9699mr6570371d50.11.1769693272290; Thu, 29 Jan 2026
 05:27:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260124170535.11756-1-johan@kernel.org> <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh> <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com> <aXovtrAM1r1UyWxA@hovoldconsulting.com>
In-Reply-To: <aXovtrAM1r1UyWxA@hovoldconsulting.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 29 Jan 2026 14:27:40 +0100
X-Gmail-Original-Message-ID: <CAD++jL=8ajGZa1RRdH9xERLp7VukGPgJCN2QP1_M6MNDoLPM_A@mail.gmail.com>
X-Gm-Features: AZwV_Qik7SCPARxotDNzrWFsla5u6OCpEZeJYH1X1viUiMQxMXQhsyNGoPkMZn0
Message-ID: <CAD++jL=8ajGZa1RRdH9xERLp7VukGPgJCN2QP1_M6MNDoLPM_A@mail.gmail.com>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
To: Johan Hovold <johan@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Dan Williams <dan.j.williams@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Doing a quick interlude here,

On Wed, Jan 28, 2026 at 4:48=E2=80=AFPM Johan Hovold <johan@kernel.org> wro=
te:

> What I've been trying to get across is that the chardev hot-unplug issue
> is real and needs to be fixed where it still exists, while the manual
> unbinding of drivers by root is a corner case which does not need to be
> addressed at *any* cost.

I agree with Johans stance here.

I might have a skewed view of history and be a bit self-delusional,
but at the time I began the work with the GPIO character device, what
we were seeing were these GPIO adapters on USB.

Those were/are hot-pluggable, and provide GPIOs that are not
for "system critical" things, i.e. not critical for the computer/system
it is running on.

Instead these are things like the Mikroe Clickboard GPIO expander
and TTY, or these GPIOs that come on FTDI USB adapters. These
can and are certainly being used for things that are critical to the thing
they are used for, such as regulating water reserves for your local
hydro power plant. Of course only a madman would unplug that,
but from Linux' POV they are very hot-pluggable, by their very nature.

[Side quest on what are some insanities industrial system people
do here... but these adapters are *very* popular.]

Since they are hot-pluggable and will never appear in DTS files
or such, a character device or other userspace ABI is the right
abstraction, and it needs to be able to come and go without crashing
or wasting memory. Plug/unplug the Mikroe clickboard GPIO
10.000 times should be fine under any circumstances.

And that is the problem that need to be solved *first*, before
removing things on (local) I2C buses or unbinding random devices
from sysfs making them unpluggable in theory.

Yours,
Linus Walleij
