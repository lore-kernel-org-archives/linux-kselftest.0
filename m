Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45AF28AAEE;
	Tue, 27 Jan 2026 15:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769529404; cv=none; b=UJp6faAhXQrGiPP6wIZ2qhvPEgHFebbJbg2Kunzx1JpchGpXLOEL+h1zCFWQ2LPWGj46KpfdpOuUHRnoqtkukcWq4W/CrglyWs2B8fqr2vikHapcZhgIM9G6bgmNmP5kjfTCw00q6vOZIDzbIMSizSOvH+auh7hS82q5LryhJeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769529404; c=relaxed/simple;
	bh=Ew7hCSheEXnd37I1gPTsKYpC9BbT8MdweTT2b/6Hmz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7PmK5TupPKpNZT0GioD955ejD5cS9WDNpWa3oBfdd/szX512+yGjpASK2pOZDy6aBl+JZeVwlLsYL5llibYhXwQDAxBZqStU/4zrIk3S6g3FhYeMLyZNq/CkXcatRHUTOKpleoSNZVX47ywk4SPeGPq6o0Hi6DP6l+oD0axu8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tdbkFkTU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tdbkFkTU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94484C116C6;
	Tue, 27 Jan 2026 15:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769529404;
	bh=Ew7hCSheEXnd37I1gPTsKYpC9BbT8MdweTT2b/6Hmz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tdbkFkTU5CRN3W5LhfCQ6KICm6LpdRFet4vLhYTuDg5eEgNodBEeMrvTClp0PNhkE
	 H2V4eC82r0Y2zu0Tg29osuH/wQTnUy665zj71XvljOyrx0WyT201cMuOl5fDLOzA9D
	 0ZGkEQDF0u9bYYanSqD5WTkN3++ymB99/e/UDcdh+DcHIPQ19mw2GtiJb6F2LJ5RD5
	 mfOZcGZHNLfd5JcUQ2tBPf4Thfd4dYudFPKNuktq6daUaCDfYFaNwWPdV/5Bu97pjW
	 kialUZ5b7GnOTPfi7udoQOGplOI2jbWCZzc/0c/16FMVn/ADJUgSFcBT4KX7Cis7WH
	 X9DJUMRK4yFKw==
Date: Tue, 27 Jan 2026 15:56:39 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Benson Leung <bleung@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 22/23] gpiolib: Leverage revocable for other independent
 lifecycle instances
Message-ID: <aXjgN2jGsaNQgP9o@google.com>
References: <20260116081036.352286-1-tzungbi@kernel.org>
 <20260116081036.352286-23-tzungbi@kernel.org>
 <aXT45B6vLf9R3Pbf@hovoldconsulting.com>
 <aXdy-b3GOJkzGqYo@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXdy-b3GOJkzGqYo@hovoldconsulting.com>

On Mon, Jan 26, 2026 at 02:58:17PM +0100, Johan Hovold wrote:
> On Sat, Jan 24, 2026 at 05:52:53PM +0100, Johan Hovold wrote:
> > On Fri, Jan 16, 2026 at 08:10:35AM +0000, Tzung-Bi Shih wrote:
> > > There are independent lifecycle instances (e.g., other drivers) can save
> > > a raw pointer to the struct gpio_device (e.g., via gpio_device_find())
> > > or struct gpio_desc (e.g., via gpio_to_desc()).  In some operations,
> > > they have to access the underlying struct gpio_chip.
> > > 
> > > Leverage revocable for them so that they don't need to handle the
> > > synchronization by accessing the SRCU explicitly.
> > > 
> > > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> > 
> > >  static int gpiod_get_raw_value_commit(const struct gpio_desc *desc)
> > >  {
> > > -	struct gpio_device *gdev;
> > >  	struct gpio_chip *gc;
> > >  	int value;
> > > +	DEFINE_REVOCABLE(rev, desc->gdev->chip_rp);
> > 
> > DEFINE_REVOCABLE() is racy and can lead to use-after-free since nothing
> > prevents chip_rp from being revoked and freed while the
> > revocable_alloc() hidden in DEFINE_REVOCABLE() is running.
> 
> This was supposed to say "revocable_init()" (i.e. revocable_alloc()
> without the memory allocation).

I see the issue.  Thanks for identifying this.
