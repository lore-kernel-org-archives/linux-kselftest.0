Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B63347BA3;
	Fri,  6 Feb 2026 09:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770369258; cv=none; b=tbbVLsITFLEsvuokz08tZ+51lMI6BkDqoXJhhHvqbVRCTK1Yp1x9tAdce06d05IIH7vHCqwPN3PnJOksxtS68T7jgFeh/PTX13vVFsjxEr+gVG2x4FcXpDgd2Zm/hcn3NwLG1JT7ucvScXzDybbmuB0TJv4vsL8HPbTY5u61Org=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770369258; c=relaxed/simple;
	bh=DPIISEjah50JVXvIFZoKuCrhOAwTQ0PYYsQaU9iDaAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F99EV9C5XAfE/CPaEUS5j5dwMMr7L+KWmQbKfct5WMGx56o7ZS4LEbz6AiLqKxUbTKdJcTviZHDsDrbLqYLV4OeM2ssk/d+gW8AcZbxQ/XaVxNaxAnxjiR0UZQAEZO3BgtCtQ8vMRazD+0fcM0tDMTZPQ+i8P9HAFRq+u+2jclM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEdcZlkC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEdcZlkC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5554C116C6;
	Fri,  6 Feb 2026 09:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770369258;
	bh=DPIISEjah50JVXvIFZoKuCrhOAwTQ0PYYsQaU9iDaAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IEdcZlkClxMp2vstwFFQ9cZgwQv+HxnPh3MUkTJEA1kBDAHLVVsXoyAMHpSeNI+7e
	 eDIj62U0OzExrL2KLypoVGwR15HEneGCwYcVK125AxZmfJ8S5eshf1V34XXlkJSnR4
	 2MhVvvL8ONLGlGGmQwU/9viTQ8NOaSmyAJKLusDFKdqJmmWxQ/zA1pfmEUeYXtVy0i
	 JEMabE9Bn4zjx6fZ8irINZUIc8U+R8Nc5Rvx1D6MqekGQOLFt6URLgCe5Ay2rCAyQA
	 TO3D+Qs6927CetZWrCE1Jp+ycdeqa/pZ4f2AJhuGB7KqAsjNJviAuoyXKGKnHrrswh
	 wnQzfMe/lpFig==
Date: Fri, 6 Feb 2026 09:14:13 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] Revert "revocable: Revocable resource management"
Message-ID: <aYWw5XvrYKlY6y5V@google.com>
References: <20260204142849.22055-1-johan@kernel.org>
 <20260204142849.22055-4-johan@kernel.org>
 <aYRaB5wI3mS2J54K@google.com>
 <aYSjKaUGdTngCXWK@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYSjKaUGdTngCXWK@hovoldconsulting.com>

On Thu, Feb 05, 2026 at 03:03:21PM +0100, Johan Hovold wrote:
> On Thu, Feb 05, 2026 at 08:51:19AM +0000, Tzung-Bi Shih wrote:
> > On Wed, Feb 04, 2026 at 03:28:49PM +0100, Johan Hovold wrote:
> > > Specifically, the latest design relies on RCU for storing a pointer to
> > > the revocable provider, but since the resource can be shared by value
> > > (e.g. as in the now reverted selftests) this does not work at all and
> > > can also lead to use-after-free:
> > [...]
> > > 	producer:
> > > 
> > > 	priv->rp = revocable_provider_alloc(&priv->res);
> > > 	// pass priv->rp by value to consumer
> > > 	revocable_provider_revoke(&priv->rp);
> > > 
> > > 	consumer:
> > > 
> > > 	struct revocable_provider __rcu *rp = filp->private_data;
> > > 	struct revocable *rev;
> > > 
> > > 	revocable_init(rp, &rev);
> > > 
> > > as _rp would still be non-NULL in revocable_init() regardless of whether
> > > the producer has revoked the resource and set its pointer to NULL.
> > 
> > You're right to point out the issue with copying the pointer of revocable
> > provider.  If a consumer stores this pointer directly, rcu_replace_pointer()
> > in the producer's revocable_provider_revoke() will not affect the consumer's
> > copy.  I understand this concern.
> > 
> > The intention was never for consumers to cache the pointer of revocable
> > provider long-term.  The design relies on consumers obtaining the current
> > valid provider pointer at the point of access.
> 
> But that is not what the selftest does currently, nor is it what you

Understood.  As mentioned in my previous email, I'll update the selftests to
reflect this.  The test case somehow is simplified to setup the scenario it
wants to test.

> need for your initial motivation for this which was miscdev where you
> don't have any reference counted driver data to store the pointer in.

You're right that cros_ec_chardev.c needs to be adjusted before using the
version of revocable.

> 
> > In the latest GPIO transition series [5], the usage pattern has been refined
> > to avoid locally storing the pointer of revocable provider.  Instead, it's
> > fetched from a source of truth when needed.
> 
> Right, but then you don't need all the RCU stuff. And revocable becomes
> just a convoluted abstraction for a lock and flag (as was pointed out
> early on).

I'm not sure if I understand you: as we're discussing about the stale pointer
of revocable provider consumers might cache here, do you mean it doesn't need
RCU at all to protect the race you reported in
https://lore.kernel.org/all/aXdy-b3GOJkzGqYo@hovoldconsulting.com/?

> 
> > I agree that the risks and correct usage patterns need to be much clearer.
> > I'll update the Documentation and the selftests to explicitly highlight
> > this limitation and demonstrate the proper way to interact with the API,
> > avoiding the storage of the provider pointer by value in consumer contexts.
> 
> And again, that's precisely why we need to evaluate the API in a
> non-trivial context *before* merging yet another version of this.
> 
> > > Essentially revocable still relies on having a pointer to reference
> > > counted driver data which holds the revocable provider, which makes all
> > > the RCU protection unnecessary along with most of the current revocable
> > > design and implementation.
> > 
> > (I'm assuming you are referring to the example in [6].)
> > 
> > I'm not sure I follow your reasoning.  Per my understanding:
> > - The reference counted driver data (e.g. `gdev` in the GPIO example) is to
> >   ensure the pointer of revocable provider isn't freed.
> > - The RCU protects the pointer value from concurrent access and updates
> >   during the revocation process [7].
> > 
> > These seem to address different aspects.  Could you provide more context
> > on why you see the RCU protection as redundant?
> 
> I wasn't thinking of any particular example.
> 
> The struct revocable_provider is already reference counted and you don't
> need anything more than that as long as you only take another reference
> in a context where you already hold a reference. (And struct

The reference count in struct revocable_provider can't protect the race
reported https://lore.kernel.org/all/aXdy-b3GOJkzGqYo@hovoldconsulting.com/.

> revocable_provider should be renamed struct revocable).

Probably no, struct revocable is for consumer handle.  It needs somewhere to
store the SRCU index.

> 
> SRCU is what prevents the race against revoke, no need for RCU.

No, without the RCU, it can't prevent the race between revoking and creating
a new consumer handle.

> 
> But this is designing yet another version of revocable. And that should
> be done out-of-tree.
> 
> Johan
> 
