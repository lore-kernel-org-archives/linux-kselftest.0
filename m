Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F06C334374;
	Thu,  5 Feb 2026 14:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770300208; cv=none; b=BD0I7XDJGZmnaFKnluZ0+GnfAG/kt0/farAQSHvfpdjcnexHHxF53EZSm6oXVtiK834Ud7SehBbYdCf1joH9+t1HnrDYJgsHbcPY6TnwySqyujdSplIVOxAWywl71De+njJH2w7tKA/q1UANMS0+V2+leESUm/J/kWeIGNE20iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770300208; c=relaxed/simple;
	bh=JVbJvrsP3hVFvb66ENZiWRE1g74g9hAd9aW7lxA4BD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JvR/IMd0TJ0Q3WE0LdrANsoen0d2O6I/rAn8YCue/a9raiooe8zRG2ijvj9aOMkAoHDZa1XBKKyTv/LdQE3VAUGDLPpvNoyIbxIX6NE5Te/5NDsy+CgHOk0CSiqseAklUoDU7IWZpmPHTb39/r6nskdEV/bHdcYbnrcTq4+i9HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uumh975x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uumh975x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04AECC4CEF7;
	Thu,  5 Feb 2026 14:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770300208;
	bh=JVbJvrsP3hVFvb66ENZiWRE1g74g9hAd9aW7lxA4BD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uumh975xxFVtaDo3bIgivLnE7loIlu7xKlaPPF4sJ+K2KQ4hpB+at6FbLB0nd268W
	 tiLfz7+e0gi2ot4Ei4PgGQfthqs9XP5FA9bSmax/EW41mgdKZZpMT+CbH/s3ulQcVp
	 nnyGRMGU49SnBJ8hFkIH6N54AvRjgPmEV6kdX86mdDvytSD3rHVhk1+T8Id34+aU8j
	 f5FQmDavsCedrB+pr8W5sAezDjNoRv8J6rwOPHW+vZyE64cK7sdRNpzFjzkwUbIU/H
	 hsPFcXJwvr1UZ5vqtcmQSTEqex1eObLdoIKWCX/ofcztxeKFELS77CZ484aycmb6Zm
	 sc98g4bDLjljA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vnzx3-000000004t8-0n96;
	Thu, 05 Feb 2026 15:03:21 +0100
Date: Thu, 5 Feb 2026 15:03:21 +0100
From: Johan Hovold <johan@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
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
Message-ID: <aYSjKaUGdTngCXWK@hovoldconsulting.com>
References: <20260204142849.22055-1-johan@kernel.org>
 <20260204142849.22055-4-johan@kernel.org>
 <aYRaB5wI3mS2J54K@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYRaB5wI3mS2J54K@google.com>

On Thu, Feb 05, 2026 at 08:51:19AM +0000, Tzung-Bi Shih wrote:
> On Wed, Feb 04, 2026 at 03:28:49PM +0100, Johan Hovold wrote:
> > Specifically, the latest design relies on RCU for storing a pointer to
> > the revocable provider, but since the resource can be shared by value
> > (e.g. as in the now reverted selftests) this does not work at all and
> > can also lead to use-after-free:
> [...]
> > 	producer:
> > 
> > 	priv->rp = revocable_provider_alloc(&priv->res);
> > 	// pass priv->rp by value to consumer
> > 	revocable_provider_revoke(&priv->rp);
> > 
> > 	consumer:
> > 
> > 	struct revocable_provider __rcu *rp = filp->private_data;
> > 	struct revocable *rev;
> > 
> > 	revocable_init(rp, &rev);
> > 
> > as _rp would still be non-NULL in revocable_init() regardless of whether
> > the producer has revoked the resource and set its pointer to NULL.
> 
> You're right to point out the issue with copying the pointer of revocable
> provider.  If a consumer stores this pointer directly, rcu_replace_pointer()
> in the producer's revocable_provider_revoke() will not affect the consumer's
> copy.  I understand this concern.
> 
> The intention was never for consumers to cache the pointer of revocable
> provider long-term.  The design relies on consumers obtaining the current
> valid provider pointer at the point of access.

But that is not what the selftest does currently, nor is it what you
need for your initial motivation for this which was miscdev where you
don't have any reference counted driver data to store the pointer in.

> In the latest GPIO transition series [5], the usage pattern has been refined
> to avoid locally storing the pointer of revocable provider.  Instead, it's
> fetched from a source of truth when needed.

Right, but then you don't need all the RCU stuff. And revocable becomes
just a convoluted abstraction for a lock and flag (as was pointed out
early on).

> I agree that the risks and correct usage patterns need to be much clearer.
> I'll update the Documentation and the selftests to explicitly highlight
> this limitation and demonstrate the proper way to interact with the API,
> avoiding the storage of the provider pointer by value in consumer contexts.

And again, that's precisely why we need to evaluate the API in a
non-trivial context *before* merging yet another version of this.

> > Essentially revocable still relies on having a pointer to reference
> > counted driver data which holds the revocable provider, which makes all
> > the RCU protection unnecessary along with most of the current revocable
> > design and implementation.
> 
> (I'm assuming you are referring to the example in [6].)
> 
> I'm not sure I follow your reasoning.  Per my understanding:
> - The reference counted driver data (e.g. `gdev` in the GPIO example) is to
>   ensure the pointer of revocable provider isn't freed.
> - The RCU protects the pointer value from concurrent access and updates
>   during the revocation process [7].
> 
> These seem to address different aspects.  Could you provide more context
> on why you see the RCU protection as redundant?

I wasn't thinking of any particular example.

The struct revocable_provider is already reference counted and you don't
need anything more than that as long as you only take another reference
in a context where you already hold a reference. (And struct
revocable_provider should be renamed struct revocable).

SRCU is what prevents the race against revoke, no need for RCU.

But this is designing yet another version of revocable. And that should
be done out-of-tree.

Johan
