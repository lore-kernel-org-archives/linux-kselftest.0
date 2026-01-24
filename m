Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E5A1C84A6;
	Sat, 24 Jan 2026 16:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769273575; cv=none; b=j0BH8yQ4mFZWyMpIVD7ljk1ULyFCfc0cJ+jtbnhRkrqNzXa2odUhEW+fLUb06yiCWY2WbrtwV5b/3iYVvqkRb5/Gpy0jVHqjFQB5Hxcw8kNVoJ/qpwhVUuFMtiikI3mb5o8LmWWid2vX2uKwB+Q548JEnYjK5gAQpOhnVZBxeHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769273575; c=relaxed/simple;
	bh=UAaftdieJkGS+xJ6t7+TUsQJMTUF25i+qZb/ukNBuMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fFBifLO1Hh4EVVZl93yxQj7x0pTXJ+urAAGVsItM1rdvGw8GWRqMHdhN+SzbHgOT2MGfxppTo7sj/jtWOPQMKaAg9G16q/Rrbx29Xw96+kt77f94C+uzgANbOF4MSG44t82EVWpUiDfLJCksu2Bs3R+IfDLt2DzXbwPBqg4IY6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fgE3ztxA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fgE3ztxA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07318C116D0;
	Sat, 24 Jan 2026 16:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769273575;
	bh=UAaftdieJkGS+xJ6t7+TUsQJMTUF25i+qZb/ukNBuMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fgE3ztxAyzxW7ngBwhkXQgu+7qutb1B1eF9Zf3FwH/w/OZVCsZhxSbYwPphVBrGQH
	 SPNrYEFwuCDA33X9vZO5cFaR1HaUOjoV0ebeZ1MI2VCoS2WFrmH87wIYTsuETIoIkZ
	 GDSfYfxwIkTEF2u8tH4mmw4tUFrECW2F5jhV0kR8j19at/ULg6/nDpEe4O4XyOxzRZ
	 aCyGwG6l8vRdFwSg9BbChjJCugPVAyWT/ni+i+i88+HBlAFW4uJUJ1rUtI1trd5OAL
	 vrFOz/Ig8a9mmj3PBM9pdbEvvlt0GFDBxs0Z1F2sIJPmOeHg58aknreMCkf6s3Ombo
	 6mNjSUtL9FnZQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vjgsW-000000002mV-3Liz;
	Sat, 24 Jan 2026 17:52:53 +0100
Date: Sat, 24 Jan 2026 17:52:52 +0100
From: Johan Hovold <johan@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
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
Message-ID: <aXT45B6vLf9R3Pbf@hovoldconsulting.com>
References: <20260116081036.352286-1-tzungbi@kernel.org>
 <20260116081036.352286-23-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116081036.352286-23-tzungbi@kernel.org>

On Fri, Jan 16, 2026 at 08:10:35AM +0000, Tzung-Bi Shih wrote:
> There are independent lifecycle instances (e.g., other drivers) can save
> a raw pointer to the struct gpio_device (e.g., via gpio_device_find())
> or struct gpio_desc (e.g., via gpio_to_desc()).  In some operations,
> they have to access the underlying struct gpio_chip.
> 
> Leverage revocable for them so that they don't need to handle the
> synchronization by accessing the SRCU explicitly.
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

>  static int gpiod_get_raw_value_commit(const struct gpio_desc *desc)
>  {
> -	struct gpio_device *gdev;
>  	struct gpio_chip *gc;
>  	int value;
> +	DEFINE_REVOCABLE(rev, desc->gdev->chip_rp);

DEFINE_REVOCABLE() is racy and can lead to use-after-free since nothing
prevents chip_rp from being revoked and freed while the
revocable_alloc() hidden in DEFINE_REVOCABLE() is running.

>  
> -	/* FIXME Unable to use gpio_chip_guard due to const desc. */
> -	gdev = desc->gdev;
> -
> -	guard(srcu)(&gdev->srcu);
> -
> -	gc = srcu_dereference(gdev->chip, &gdev->srcu);
> +	REVOCABLE_TRY_ACCESS_WITH(rev, gc);
>  	if (!gc)
>  		return -ENODEV;

Johan
