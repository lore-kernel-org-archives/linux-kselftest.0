Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367492C1598
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 10:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771410376; cv=none; b=LVFv2YlvobGnn2UbGSF8KdDio4OLMTJ1cbTPAKvnSGDcFq746IacqDW6iqfYKOaJX2BlH4NbYG4euATors4ZSQZivxwm0j4GuwTapi6BkDfDQ8gVj3rJFaYjODaTceMfIUcVFbs35D8UG5ijFCU5CdngLScT/b4pIpmLS8TUTCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771410376; c=relaxed/simple;
	bh=kTpNK5Uls22jdkIeIXDKmi8A8vUQjxKmxX+QdiP9Byo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SWoRliGGtNnxV9JQoEgZ/Wu8CnEmAW9dwQPWkWQzAXF7g9nsX7mJRKfQMHMFNmulF6hJPfCuKZTEzX71aFeVgyVcBYodzrEgr6Kdwui6ZzK/VueykCvkJ581U2vbbWyJCZfoonCZnhcx1kbhEMwaJLzHJftSFx5zQdydLhq7G/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNfQNc7X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNfQNc7X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B06EC2BCB2
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 10:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771410376;
	bh=kTpNK5Uls22jdkIeIXDKmi8A8vUQjxKmxX+QdiP9Byo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KNfQNc7X0Pn1AtUSzFaxhkWnLtLX+6MMuVjhGu9Xhaiq9C/VjQT4jdW+fZXTH+MJ/
	 dAeWcbhPHLhcoE51fD1LnGdiycuu04FqyanSbB4sK7X+3Wpoc2ldnC4bFDrE8G+5ej
	 DJIsk6EYudhOzfFEjqgvU1cE/LdcR4meq7tugQFFGIY7J4XbWIpUkjnXHCQ33BK1LA
	 anIkrY19fyV5c2aYHeCBo2AwMbaemeS+aw5yxrPWN9kasn77+riIsmPgSu02O3cRur
	 PfNbafFHmvL1hxMQKBggENF99lrwj/NqI4Wco16c+dV/ZSePYU/LjgEwYB62QRbBdY
	 tEgjQbBqgXEIg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59e62834439so5834517e87.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 02:26:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUmUaBnUgeIhFBE10240KLxrcZdgwrYNt8zktiplYFs2c2wW/B+EX+/gsd68hXGTMXQUuAB4Ec7U+HHq6P2OK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYOe3VVbpJee7a4adR4Vb972X44eQU2TOq2tI2OpljfkXpA9rP
	62KyacgtqIdvgPbHZhEEz/GFDLCGii0Tu/CqWhS4Zd5qsxAx5i/rVLuDtVcSmuLHDntYc1lyIF9
	uUQNzJtdk1nJWu3lfPpCyJzoYr3W7Nlma7pKEoM58PA==
X-Received: by 2002:a05:6512:239c:b0:59e:3934:fe38 with SMTP id
 2adb3069b0e04-59f83bbf105mr525374e87.48.1771410374647; Wed, 18 Feb 2026
 02:26:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213092958.864411-1-tzungbi@kernel.org>
In-Reply-To: <20260213092958.864411-1-tzungbi@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 18 Feb 2026 11:26:00 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfQumD1ULx7yU4W2sx=35wyQf7-v4tSf44OqEu3JDBUAg@mail.gmail.com>
X-Gm-Features: AaiRm50s_5yOYiMTA-IQER-1K05oUgtj1rsfNhuxVP-poaWxOx0gFtAG0Bv4_TA
Message-ID: <CAMRc=MfQumD1ULx7yU4W2sx=35wyQf7-v4tSf44OqEu3JDBUAg@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] gpio: Adopt revocable mechanism for UAF prevention
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Johan Hovold <johan@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, chrome-platform@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026 at 10:31=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
>
> This series transitions the UAF prevention logic within the GPIO core
> (gpiolib) to use the 'revocable' mechanism.
>
> The existing code aims to prevent UAF issues when the underlying GPIO
> chip is removed.  This series replaces that custom logic with the
> generic 'revocable' API, which is designed to handle such lifecycle
> dependencies.  There should be no changes in behavior.
>

Patches 1-6 look good to me, I think they should go into linux-next
after v7.0-rc1 is tagged to lessen the burden on the subsequent
revocable work.

Bart
