Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B679F353ED1;
	Wed,  4 Feb 2026 08:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770193286; cv=none; b=qrdgqquppr42MyTTwVjeC8Maymr4c905D/k8+qm+xZaP2C9omv8lPYswjZFuuBroLmYl1jQNbairPwqew+aZu3AcmkkaN0oSXTyup1rqQj/1ScK4fk3wFaouP/sYnFU9wEIFJWh1fA4QQVefokXYlAFgtNpxxBHvX2JRIfrdjAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770193286; c=relaxed/simple;
	bh=b5jfxf3OMdMTagmLua3hKaJbPzROk5D81PnP+sya8Js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y+qWqyHzMk35lZPwCsomCtRuR0V5Ahza0LxV9qmJ+zPA2TSd+ktg7KNTqhLvxWFMnW1xNcP/nq98yi/loi/OTCA+5mrKagf0Lf/4NsP/rsvYOGh2JikBX1Qp9iFB2bm6/lEEF+thme2han6rCI0i/GcNgeDf6+sWOiA7KP6Te0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GjrAAE4y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GjrAAE4y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAA03C4CEF7;
	Wed,  4 Feb 2026 08:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770193286;
	bh=b5jfxf3OMdMTagmLua3hKaJbPzROk5D81PnP+sya8Js=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GjrAAE4yct4T0lC+ckrk7biqSyzTgFrkAXySy+fWkSRc3bth10JjZlLCcnog0Dp3a
	 gVEh6kWWjeq2k0Ngmm53Q3dyj08yN8SwEGhoMB2MB/z1ctCmQhq906XtSTw1gAoYyJ
	 ytp79pRnVudZ5bGU71EmVOQHuw6C+XnL3EaWZGdA=
Date: Wed, 4 Feb 2026 09:21:18 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: Disable revocable code from build
Message-ID: <2026020401-fencing-opossum-f5cd@gregkh>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <aYHm9pr0e7myeqS3@hovoldconsulting.com>
 <2026020315-twins-probe-d988@gregkh>
 <2026020307-rimmed-dreamy-5a67@gregkh>
 <aYKrdxw3fYf-y52P@google.com>
 <aYLY8lkSv4Lr2B2r@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYLY8lkSv4Lr2B2r@google.com>

On Wed, Feb 04, 2026 at 05:28:18AM +0000, Tzung-Bi Shih wrote:
> The revocable code is still under active discussion, and there is no
> in-kernel users of it.  So disable it from the build for now so that no
> one suffers from it being present in the tree, yet leave it in the
> source tree so that others can easily test it by reverting this commit
> and building off of it for future releases.
> 
> Fixes: dd7762c73b1c ("driver core: disable revocable code from build")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> Greg: I realized "driver core: disable revocable code from build" is
> already in driver-core-testing branch.  Sent this independent patch
> in case it'd need to.
> 
>  tools/testing/selftests/Makefile | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
> index 11b6515ce3d0..56e44a98d6a5 100644
> --- a/tools/testing/selftests/Makefile
> +++ b/tools/testing/selftests/Makefile
> @@ -17,7 +17,6 @@ TARGETS += damon
>  TARGETS += devices/error_logs
>  TARGETS += devices/probe
>  TARGETS += dmabuf-heaps
> -TARGETS += drivers/base/revocable
>  TARGETS += drivers/dma-buf
>  TARGETS += drivers/ntsync
>  TARGETS += drivers/s390x/uvdevice
> -- 
> 2.53.0.rc2.204.g2597b5adb4-goog

Thanks, I'll merge this into the other commit so that it all happens at
once, and can be reverted easier.

greg k-h
