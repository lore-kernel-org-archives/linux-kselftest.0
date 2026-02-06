Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC5527381E;
	Fri,  6 Feb 2026 15:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770390441; cv=none; b=U9/qDCVWrHHVAGTSpe8KHgrqEOlUsiDaJxYXjomKw7G19+LANG5YQbVTBo1rhBXkQcoP9CKPAkhm9TnjHIefFh6Tu+PuMT0pNV9Irf+Cj64iVhKMt8zRqPOYyDL2huPOFSYzkGFn3L+Ak0ZY8eVpiybm9gU8b0i5oCqbJoXfQXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770390441; c=relaxed/simple;
	bh=kui+rp66NObqhCZ5Bqj4PFC3PthfR7x9lEBEylzf8tA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUKAG0mp0SRciuXImym00wb191opYnGORZ3K0LlRNKuRqN6UnRbO8w2qMa/8ox6uUiQDlEjUb8UTRlgfUMIChvsanX7h3QkWS1xG/ssu1CKl4hR/msHyguNRqmabIQR1V7q7yNYK1nGkitSUa3RzYGGZqxX8DfRTUdszVDUDbI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NoBEQLFL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NoBEQLFL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CD9FC116C6;
	Fri,  6 Feb 2026 15:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770390441;
	bh=kui+rp66NObqhCZ5Bqj4PFC3PthfR7x9lEBEylzf8tA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NoBEQLFL6v8ayYZsTdH8L0SQEmvUAFuXPDzfqQcwoZ4pJt3f9t1bmw97lCQnmNWCA
	 UdS8TH+EdaXMtGOozje7+SxHGSoY+yYTjIoXSlvMqp7N6kNfjU80H46622OV2ihafa
	 1YjU2razOJbjpMVwufpT/Am+gY4rNVeeqOCpjymvj1+i12keYq6DCdxu7v4hujxuE0
	 MABzDUCMnjF2iXafocJ4dEhbLMNJY0BEjcntD0oWx12z23oBYy42XGgGJpAfS6ylYI
	 2dZr+39Vyz+R2gxBePhceCAlXqK3q/M1oYGmf+0KprgMdYplv97rfUCNxprD7J3JRR
	 btY1OijCZRXpQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1voNQQ-0000000079i-4Bvu;
	Fri, 06 Feb 2026 16:07:15 +0100
Date: Fri, 6 Feb 2026 16:07:14 +0100
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
Message-ID: <aYYDoqpZx88gV1hh@hovoldconsulting.com>
References: <20260204142849.22055-1-johan@kernel.org>
 <20260204142849.22055-4-johan@kernel.org>
 <aYRaB5wI3mS2J54K@google.com>
 <aYSjKaUGdTngCXWK@hovoldconsulting.com>
 <aYWw5XvrYKlY6y5V@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYWw5XvrYKlY6y5V@google.com>

On Fri, Feb 06, 2026 at 09:14:13AM +0000, Tzung-Bi Shih wrote:
> On Thu, Feb 05, 2026 at 03:03:21PM +0100, Johan Hovold wrote:
> > On Thu, Feb 05, 2026 at 08:51:19AM +0000, Tzung-Bi Shih wrote:

> > > You're right to point out the issue with copying the pointer of revocable
> > > provider.  If a consumer stores this pointer directly, rcu_replace_pointer()
> > > in the producer's revocable_provider_revoke() will not affect the consumer's
> > > copy.  I understand this concern.
> > > 
> > > The intention was never for consumers to cache the pointer of revocable
> > > provider long-term.  The design relies on consumers obtaining the current
> > > valid provider pointer at the point of access.
> > 
> > But that is not what the selftest does currently, nor is it what you
> 
> Understood.  As mentioned in my previous email, I'll update the selftests to
> reflect this.  The test case somehow is simplified to setup the scenario it
> wants to test.
> 
> > need for your initial motivation for this which was miscdev where you
> > don't have any reference counted driver data to store the pointer in.
> 
> You're right that cros_ec_chardev.c needs to be adjusted before using the
> version of revocable.

That's part of the problem here. It's unclear what problem or problems
you're trying to solve. You started off with the miscdev issue, this
thing morphed into something else, and now everything is just a big
mess with unclear semantics and a totally confused implementation.

Look, I'm not blaming you for how we ended up here. This thing should
not have been merged until there was a general agreement on the
usefulness of the API (which requires a problem statement and use case).

The right people clearly didn't look at this in any detail since they
did not expect it to be merged any time soon.

And it's just unfair to you to have to redesign the whole thing under
time pressure a few days before the merge window opens. New code is
supposed to be ready weeks in advance, not be created and merged only
days before.

> > > In the latest GPIO transition series [5], the usage pattern has been refined
> > > to avoid locally storing the pointer of revocable provider.  Instead, it's
> > > fetched from a source of truth when needed.
> > 
> > Right, but then you don't need all the RCU stuff. And revocable becomes
> > just a convoluted abstraction for a lock and flag (as was pointed out
> > early on).
> 
> I'm not sure if I understand you: as we're discussing about the stale pointer
> of revocable provider consumers might cache here, do you mean it doesn't need
> RCU at all to protect the race you reported in
> https://lore.kernel.org/all/aXdy-b3GOJkzGqYo@hovoldconsulting.com/?

Right. It's not needed. You have a refcounted structure and you can use
the refcount to prevent it from going away.

> > > I agree that the risks and correct usage patterns need to be much clearer.
> > > I'll update the Documentation and the selftests to explicitly highlight
> > > this limitation and demonstrate the proper way to interact with the API,
> > > avoiding the storage of the provider pointer by value in consumer contexts.
> > 
> > And again, that's precisely why we need to evaluate the API in a
> > non-trivial context *before* merging yet another version of this.
> > 
> > > > Essentially revocable still relies on having a pointer to reference
> > > > counted driver data which holds the revocable provider, which makes all
> > > > the RCU protection unnecessary along with most of the current revocable
> > > > design and implementation.
> > > 
> > > (I'm assuming you are referring to the example in [6].)
> > > 
> > > I'm not sure I follow your reasoning.  Per my understanding:
> > > - The reference counted driver data (e.g. `gdev` in the GPIO example) is to
> > >   ensure the pointer of revocable provider isn't freed.
> > > - The RCU protects the pointer value from concurrent access and updates
> > >   during the revocation process [7].
> > > 
> > > These seem to address different aspects.  Could you provide more context
> > > on why you see the RCU protection as redundant?
> > 
> > I wasn't thinking of any particular example.
> > 
> > The struct revocable_provider is already reference counted and you don't
> > need anything more than that as long as you only take another reference
> > in a context where you already hold a reference. (And struct
> 
> The reference count in struct revocable_provider can't protect the race
> reported https://lore.kernel.org/all/aXdy-b3GOJkzGqYo@hovoldconsulting.com/.

Yes, it can. You just need to make sure you hold a reference. And
redesign the API to let you do so.

> > revocable_provider should be renamed struct revocable).
> 
> Probably no, struct revocable is for consumer handle.  It needs somewhere to
> store the SRCU index.

Yeah, you'd need to store the SRCU index elsewhere (e.g. int, typedef,
context struct).

> > SRCU is what prevents the race against revoke, no need for RCU.
> 
> No, without the RCU, it can't prevent the race between revoking and creating
> a new consumer handle.

Yes, it can. You just need to take a step back and redesign this thing
again.

> > But this is designing yet another version of revocable. And that should
> > be done out-of-tree.

And that should be done out-of-tree.

Johan
