Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B2429E10F
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 10:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769594471; cv=none; b=f+OU+zV2yO4tJHzMCPfb12cws6WOTIdzUS+CyrH0uG0it6eu5GJBvKQS1L5zdoGsnpm+JP3KG+mIfqtEgcctPErBfXBCrGhZuYqTHsDPxhwQPuTHrQVBt560IaW9kn+5Ir9KGmJib6cZMQYLud0h2bhybSH5YOzwG1n/5KL/AF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769594471; c=relaxed/simple;
	bh=U4hxo0P0wLLb4tcsdP3vh7lnsHn2SNsS2hcjR7uGGoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQRhLZTzi8e7jw00/zVDrQ82H4n0oTihs1VCALttUlZSB/VcH0YMC2fmR1X2J3SaGF5Ban5WqQbhov3GV0NMk9DwgvLhcEKUvi84tkFUg6uNQ0AzhF3nVRMkkLk5VFqunKEPptM+ooDnU6KMC8aS6jKlbFM3rFdj/g3dNkEHC+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=LEsGQ/jM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="LEsGQ/jM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=U4hx
	o0P0wLLb4tcsdP3vh7lnsHn2SNsS2hcjR7uGGoM=; b=LEsGQ/jMMDvYadSCQdCk
	5JgtQAiaHCKsGfUJd16sgVFXOoCnfE5m2RJNyPdO1VPLnvusl1aZR4OL3oP0P8OB
	I5dfR/PBirtZdpEUPCrXf3bQZ97iHsKKzd20ooVE0/ZpSZIhmkhE/xOExykt4JB2
	4mmSIqcqWfMQH9JyguH0Yqol5RgjOM+oT07SZNsgsMX2AwShCzg4yySOsflGKXbi
	uWUYVq0GkxDy/CbIqU7zycBTbqTOqZPUH2pEIMh2ZB678Xgeai5Eekf9BpN7G3os
	yvEknrtmP7B8MoYHwEYmoTZABLoqVSRaaS63gjVSIIJrG/e9xCD9hpW6rpz2X835
	YA==
Received: (qmail 3579376 invoked from network); 28 Jan 2026 11:01:04 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jan 2026 11:01:04 +0100
X-UD-Smtp-Session: l3s3148p1@cFtt0W9JPOgujns0
Date: Wed, 28 Jan 2026 11:01:03 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Message-ID: <aXneX-aZofvuk8gl@ninjato>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
 <20260127235232.GS1134360@nvidia.com>
 <CAMRc=MfP1_fH91AVjerbnwVfhA0oqBKV+CTX0_1n32g1t-Pvuw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4tvbrEKQRMYzmolo"
Content-Disposition: inline
In-Reply-To: <CAMRc=MfP1_fH91AVjerbnwVfhA0oqBKV+CTX0_1n32g1t-Pvuw@mail.gmail.com>


--4tvbrEKQRMYzmolo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> One exception is I2C where the logic is so broken we need to first
> rework a lot of drivers.

Let's say "bitrotten" instead of broken. People used what was available
at that time and they prevented the kernel from crashing, at least. And
up to now, nobody had the bandwidth to improve that part in I2C.

> Wolfram is on board with that though.

Ack. I want to emphasize here that for I2C the SRCU part goes into the
subsystem, not into the drivers.

(Disclaimer: I don't have the time to even read all the mails discussing
'revocable' despite it maybe being used in I2C. I am busy enough
handling the preparations needed to improve the I2C core to handle the
lifecycle issues. If 'revocable' is the final piece or not is a second
step for me. Maybe even a third.)

> > The reason cdev keeps coming up is because there are few common ways a
> > typical driver can actually generate concurrent operations during and
> > after remove that would be problematic.

Let me point out again that Dan Williams already had a PoC-patch for
handling the cdev issue generically [1]. Dunno if this fact is present
in the current discussion.

[1] https://lkml.org/lkml/2021/1/20/999


--4tvbrEKQRMYzmolo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAml53lwACgkQFA3kzBSg
KbaDKA//f0CIM1RNWSco1prrtoj4LYZvyS2BaiYJL1AFcpgvmwUL0WXxTrJIMO0B
vBbr8NRqCjI37T3MlR6FACKtELlAdfE4gB+Rg/YLiD33kZHV3vsN3bRfsVLU+veI
Kr5IM/K01xDJGirqN9xX6dZohQ4O6vPMN+l2khEjKd5qszT1AaEXV19mVCVMQJ/Z
qSA5veeLKHUV9HfzbkVFzRjOrSjZFY/kpgnTwiEwfDIpCHNTDEEzz7XE2B01yq2J
p1zvNQYGEYMZ3AV6aeMUxCtj3O8imeZ4k/EuTapkSN5K/ckTWlzjJALD2EdPxUZV
vOiAn8sZuWGGfy59svX/Be5pHcEQ9Em/UNUADxESQePXcNZGnIqGw34Erpm24Lze
KNq1ANkfD6voAwfM+bxN44WeC2wao/o88X0TB/EbKZk6uPCPIPUdBfZTtWQXw9rR
x+btXyg8MrOty5EYnaCxXiiCeZqZlpSuI1ASFfXYpBw56dZTaJAhFthP3msvVHfB
yONtbnpgGPypxlWUkVx1GOOgv5wKptCw6w002FAdm2tUUwEIar2yqV9IQ0IQDIiq
tcRrz3M7zej+8qQ3/h/gWmBBFRJZuxQfitvSFnDCj239ODPmL7y/DlV2bR1ilQmL
di7LNsaTEHLa9SyOCS4OaJpf55XTQzt9uVcTpDR7C+k8p6RvBJ8=
=eI/U
-----END PGP SIGNATURE-----

--4tvbrEKQRMYzmolo--
