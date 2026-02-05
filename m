Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EF435B644;
	Thu,  5 Feb 2026 08:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770281499; cv=none; b=GrS8w8RQyP5oogclnHKElFcnEc+7A8iicBJTdFapreacuh1Bfrd1KJ9wbOqVuXtrTWplBRKMz2R8YhgCk41dQD4UjioeEHHYgKTx383c+J1zJwFBMKSrHlT5yD1W8mw1KoVrnwq8yoGWLFxa6NL9ExofwaeLxJKQk4Y7m9mLZfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770281499; c=relaxed/simple;
	bh=3gYcD8s2ae4bFtwEr9I/tEvXmqGVfIFmkeFLr6QDj08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TPDXntiNkEJm9QjEqpY9+e+v4m6xLECXIOnT23RowFvssRwLBrsiYIkCME/f30U3KhTMXDwYDu4oSlImayD+T4+FDqXAmm4pAgdY7WL+TrUtE/VCBZqolDzn20LQbGvLOJ8lVOazKwEQdbkB9Ulz0os0Y+c6NyiNuzuLFN1j9Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KaTp2KwX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KaTp2KwX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A291DC4CEF7;
	Thu,  5 Feb 2026 08:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770281499;
	bh=3gYcD8s2ae4bFtwEr9I/tEvXmqGVfIFmkeFLr6QDj08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KaTp2KwXBnUoZ3XV4OhQXSc1+a4Pw+CXemtipPrLDP7c+dLI0nOTtxOG1Shof9TgU
	 R/PpvvcSx5RYXtApZ0oQIV4XXIOTOhBOJQc5oKMImbgylGVRr0VN2zVs7hO+M+y4cK
	 AkL9yhkGQIsaWLY+a6n1xRBPc36kk67mDW5jP5NDDB2M7tkQpviGXnuRmEogAR3Qcj
	 rjJ5gS3jb2Okb582nFEeJtoXEGYwWUY1+TBf4r5Yw7FsS4mekWjUcAsf7jveE1XTH6
	 rQQphAkK7XUw8yLYXaprjerdwzXg1/AM3WTO/MTT+cY2XJBcD0NOGtmmiZB0EsxenP
	 7P+5qhL8vIycQ==
Date: Thu, 5 Feb 2026 08:51:34 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>, Johan Hovold <johan@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Dan Williams <dan.j.williams@intel.com>, linux-gpio@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v2 03/11] gpio: sysfs: Remove redundant check for struct
 gpio_chip
Message-ID: <aYRaFs6DmjDQ6aHq@google.com>
References: <20260203061059.975605-1-tzungbi@kernel.org>
 <20260203061059.975605-4-tzungbi@kernel.org>
 <CAMRc=Mf=gUMEaeExH6mVrhMSNWbCchRfkrugr492Ccp-j3V8Ag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mf=gUMEaeExH6mVrhMSNWbCchRfkrugr492Ccp-j3V8Ag@mail.gmail.com>

On Wed, Feb 04, 2026 at 04:33:50AM -0600, Bartosz Golaszewski wrote:
> On Tue, 3 Feb 2026 07:10:50 +0100, Tzung-Bi Shih <tzungbi@kernel.org> said:
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index a6dd07be126c..3137e6f1108a 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -1281,7 +1281,7 @@ void gpiochip_remove(struct gpio_chip *gc)
> >  	struct gpio_device *gdev = gc->gpiodev;
> >
> >  	/* FIXME: should the legacy sysfs handling be moved to gpio_device? */
> > -	gpiochip_sysfs_unregister(gdev);
> > +	gpiochip_sysfs_unregister(gdev, gc);
> 
> I understand the intention here but I really don't like passing both gc and
> gdev here. We can get the address of the gpio_device from gpio_chip so why not
> do this and pass only variable?

Ack, will fix in the next version.
