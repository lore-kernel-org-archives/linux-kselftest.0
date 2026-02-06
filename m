Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1D92857EA;
	Fri,  6 Feb 2026 15:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770390784; cv=none; b=mye/CZX7lhEM9iN7fTk6SXVRMRL0NTlETV2cEGOzilqdOhO1Rjlstb4QlEQvTq+2TbS5i+Wtypp9GHm4iWPQATxxtPRVTCcw71TB8GvrFJPlTo2fX1P589Rb6vHqvkAMbPY1Ung0qAn+iWefOYoKRiB99cOCWTv4TtPAP7blnaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770390784; c=relaxed/simple;
	bh=jkGgDaN/QHDmhxym2ZnD+FsCncUfwyM3ZBNW0Zae7Mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H/R3DX6UAmmU6BWYLxpjhbVDF/ZS2iGjMXUe1NxXSMEngSWKRJkRSNTPMtKA9PW/X10U1WwYgACQlsS159NEtRL0/4pnQn7LBZ14jjzt8tB0fGBY3mCZZG2RzOH2hNjdoVpr7or2Qd+7f5HzcFDP+WqgKBkwZY4e+0ah7/eFOQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tNHme8Fq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tNHme8Fq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A576C116C6;
	Fri,  6 Feb 2026 15:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770390784;
	bh=jkGgDaN/QHDmhxym2ZnD+FsCncUfwyM3ZBNW0Zae7Mk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tNHme8Fqj0skeD9Wm0M1zoE1FRfne8WmshRZqn1vRdTnIK17dA63UDEkK4O6R/MYF
	 0gI8Vh4MsxQwXLC3jfx9TbmW3rvhUfEdeM/Udp9fr6+9GKSr/soQhbv7ArCpioxcga
	 C8aIGK3M3tX0E3bKRAAddBnALOI6+/7z4HE6dqCE=
Date: Fri, 6 Feb 2026 16:13:00 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Revert "revocable: Revocable resource management"
Message-ID: <2026020624-buddhism-clavicle-7a90@gregkh>
References: <20260204142849.22055-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204142849.22055-1-johan@kernel.org>

On Wed, Feb 04, 2026 at 03:28:46PM +0100, Johan Hovold wrote:
> I was surprised to learn that the revocable functionality was merged the other
> week given the community feedback on list and at LPC, but not least since there
> are no users of it, which we are supposed to require to be able to evaluate it
> properly.
> 
> The chromeos ec driver issue which motivated this work turned out not to need
> it as was found during review. And the example gpiolib conversion was posted
> the very same morning that this was merged which hardly provides enough time
> for evaluation (even if Bartosz quickly reported a performance regression).
> 
> Turns out there are correctness issues with both the gpiolib conversion and
> the revocable design itself that can lead to use-after-free and hung tasks (see
> [1] and [2]).
> 
> And as was pointed out repeatedly during review, and again at the day of the
> merge, this does not look like the right interface for the chardev unplug
> issue.
> 
> Despite the last-minute attempt at addressing the issues mentioned above
> incrementally, the revocable design is still fundamentally flawed (see patch
> 3/3).
> 
> We have processes like requiring a user before merging a new interface so that
> issues like these can be identified and the soundness of an API be evaluated.
> They also give a sense of when things are expected to happen, which allows our
> scarce reviewers to manage their time (e.g. to not be forced to drop everything
> else they are doing when things are merged prematurely).
> 
> There really is no reason to exempt any new interface from this regardless of
> whether one likes the underlying concept or not.
> 
> Revert the revocable implementation until a redesign has been proposed and
> evaluated properly.

After thinking about this a lot, and talking it over with Danilo a bit,
I've applied this series that reverts these changes.

Kernel developers / maintainers are only "allowed" one major argument /
fight a year, and I really don't want to burn my 2026 usage so early in
the year :)

Tzung-Bi, can you take the feedback here, and what you have learned from
the gpio patch series, and rework this into a "clean" patch series for
us to review and comment on for future releases?  That should give us
all a baseline on which to work off of, without having to worry about
the different versions/fixes floating around at the moment.

thanks,

greg k-h
