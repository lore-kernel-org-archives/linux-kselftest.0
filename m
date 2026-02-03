Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E082D3EF2;
	Tue,  3 Feb 2026 12:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770120959; cv=none; b=V1/LoF3k1j+kqnSnJqE5CrOwY9KECSR99zCEEd2rQMkwxuMbgk/dol88EmUMnjavKLrEJkbZ/ehsSFA64dejXkkDbht8/12v1lX3haE1GDtDC1IZc1YMhg3nmzR8Mf26JvnRGNAt71sKLgVrrnSG7TnQr01BKnLmgDWhGpI2Y5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770120959; c=relaxed/simple;
	bh=0tgWWPe1UAb5aPh8jx+QmAskTHZWRtPqRfmI4WX7ldM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q/JYW0ZgNOVQiLpVdWpMGiuOD1UqoHvmSmVj2PCPByvP6a3llGzU9IqgoucjU+8RXj5u4LIq7xhSJAT7450Sfvke9RC2taWwXkBw3xfqDx9DpSIaZY5GkskbEP2ySORKHxMRFbMR7ZtLzIf7Av1WS7O9QGmtsHDeleXp6NLDqx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eW0z/khw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eW0z/khw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FFEFC116D0;
	Tue,  3 Feb 2026 12:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770120958;
	bh=0tgWWPe1UAb5aPh8jx+QmAskTHZWRtPqRfmI4WX7ldM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eW0z/khwpmlTNY1mr5g+T2gvWgSCfMd9O78c2dF8aqB9WY/36WW8zycINZ+Yz5CmN
	 jB7ANaYUFQoqzDWJThltImC3NZXvohC1J9QhQR5j7v9W5lnAT181zEtA0/BdKzGyie
	 beatnvOOsCDGFthWIt7Ojz9trw8ewVKWFPJiYP6ODl+87qsYaSeVXX7T8E8FL02icI
	 hEbu7/AJrpQfCjPTpIDsEiqYhs+eevGB9rDxsU+lruNn45s7YvDmj1+ClAdfb2P/IJ
	 UDQCnG7cGn6v5Y3ECFm81Tp3a1o4YbnUMYamYGgq4aUO9huduHc0lxrImazBRHvyt3
	 +DfO2SbRmXc9w==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vnFJu-0000000025F-0muV;
	Tue, 03 Feb 2026 13:15:50 +0100
Date: Tue, 3 Feb 2026 13:15:50 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
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
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Message-ID: <aYHm9pr0e7myeqS3@hovoldconsulting.com>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXdxDBXdyqLFfKKI@hovoldconsulting.com>

Hi Greg,

On Mon, Jan 26, 2026 at 02:50:05PM +0100, Johan Hovold wrote:
> On Sun, Jan 25, 2026 at 01:47:14PM +0100, Greg Kroah-Hartman wrote:

> > True, but we do need something.  I took these patches without a real
> > user as a base for us to start working off of.  The rust implementation
> > has shown that the design-pattern is a good solution for the problem,
> > and so I feel we should work with it and try to get this working
> > properly.  We've been sitting and talking about it for years now, and
> > here is the first real code submission that is getting us closer to fix
> > the problem properly.  It might not be perfict, but let's evolve it from
> > here for what is found not to work correctly.
> 
> It's a design pattern that's perhaps needed for rust, but not
> necessarily elsewhere. But either way there is no need to rush this. If
> it turns out to be usable, it can be merged along with a future user.
> 
> Dropping the revocable_provider and revocable abstraction split should
> even make it more palatable.
> 
> And with a new interface and a non-trivial user we can see what the
> end-result looks like and decide where to go from there. 
> 
> > So I don't want to take these reverts, let's try this out, by putting
> > this into the driver core now, we have the base to experiment with in a
> > "safe" way in lots of different driver subsytems at the same time.  If
> > it doesn't work out, worst case we revert it in a release or two because
> > it didn't get used.
> 
> Please reconsider. Perhaps I didn't stress the point enough that the
> current API needs to be reworked completely since there's no longer any
> need for the two revocable abstractions.

I noticed that you picked up the proposed incremental fixes to the
issues I reported without anyone even having reviewed them. The fixes
being incremental makes it a lot harder to review, but based on a quick
look it seems there needs to be further changes.

And again, what is the rush? Anyone wanting to experiment with this
functionality only needs to apply a single patch. And exposing the API
before it is stable is just going to be a mess as subsystems may start
using it from day one.

So please, just drop it for 6.20. You can still merge this for the next
cycle when the basic functionality has been fixed.

Johan
