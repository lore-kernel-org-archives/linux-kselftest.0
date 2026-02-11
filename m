Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852542F0C6A;
	Wed, 11 Feb 2026 02:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775530; cv=none; b=iKVZU3rZEpPisRX2OI8pHD0nw20XiBodoyyZ78miikHlWeySjLi7sYkzWk51EJbYpx7yGlywvAwqPAwb4ummHYAHKrzEjC5Z8uKqSyvoW0arxXlBsnTxJ7eWlY1oNlhiYRj1xDANtrk2v3JI9HfiKS+vV7Qtv+mOmYpGIk4/91Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775530; c=relaxed/simple;
	bh=mq82685wUv7wXQeQIeQd9ybDzA4WIRKloSSUCitGcpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BAohp1gdln5czKTTexWfie4NvppvcRBucMBPaYijH59LCanJ9gXitrTv34QGTqBTccrlx2cp27+pNq4HPejsFH+RVLeXsHTwjmAmMhy9XKBN7vi76F6Sss4eYbC/ySqRKiYwkfrVFdUGohi7lx9dITJ4LxK3ruWSVq6FyYubAYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IzfFouI5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IzfFouI5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88624C116C6;
	Wed, 11 Feb 2026 02:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770775530;
	bh=mq82685wUv7wXQeQIeQd9ybDzA4WIRKloSSUCitGcpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IzfFouI5o8HHhM61yNuuNcyN8ksRXhrHY0BqTaxTuc3Ujx0+t8ou2PLD/gBE5aBjM
	 Vh8xHedB2qyTRIr8x/w4b8sEq71mfbiOimVWssFrnHIEzYCMzjdjn06WUvOKVyBDka
	 puX5sJTPQbXMdb5KNslBAOmdNZU2anT6A5EmOr/bUUkZvV90PaSiqJ34WPb5mTtTa0
	 6xPFiQ0JA2n6xsWzmaIUVe8jS6EsZXaDEGP4E6LbtvPi8IATo6ZlBB4YZjwmi35ar+
	 FHJm/u7SJNatJo8qruGUxT/CMqD2vAX5V2S4yt5B17VYoBMbRtyvglJvjdHYJiBHe8
	 0JNWrgSzLdm1w==
Date: Wed, 11 Feb 2026 02:05:26 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: paulmck@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kselftest@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] revocable: hide the implementation details from users
Message-ID: <aYvj5h4tEZI-habX@google.com>
References: <20260206103216.38623-1-bartosz.golaszewski@oss.qualcomm.com>
 <fc68da89-7c2b-432b-9a78-6ab55fcb0e9e@paulmck-laptop>
 <CAMRc=MeHWkDCi0GvXFYxDhCeWMydjT9wOw3_d1d+c+VE7y0-7Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeHWkDCi0GvXFYxDhCeWMydjT9wOw3_d1d+c+VE7y0-7Q@mail.gmail.com>

On Mon, Feb 09, 2026 at 05:13:17AM -0600, Bartosz Golaszewski wrote:
> On Fri, 6 Feb 2026 23:02:44 +0100, "Paul E. McKenney" <paulmck@kernel.org> said:
> > On Fri, Feb 06, 2026 at 11:32:06AM +0100, Bartosz Golaszewski wrote:
> >> Revocable stacks two layers of SRCU on top of each other: one to protect
> >> the actual revocable resource and another to synchronize the revoking.
> >> While this design itself is questionable, it also forces the user of
> >> revokable to think about the implementation details and annotate the
> >> pointer holding the address of the revocable_provider struct with __rcu.
> >> Hide the real type of struct revokable_provider behind a typedef to free
> >> the users from this responsability. While adding new typedefs goes
> >> against current guidelines, it's still better than the current
> >> requirement.
> >>
> >> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >> ---
> >> I realized that one important person was missing from the whole review
> >> process: Paul E. McKenney who wrote and maintains SRCU. I had Paul look
> >> at the SRCU usage in GPIO and I think he should have also signed off on
> >> revocable before it got queued.
> >>
> >> Paul: I'm Cc'ing you on this patch to bring revocable to your attention.
> >> The series that implemented it and made its way into v7.0 is here:
> >>
> >>   https://lore.kernel.org/all/20260116080235.350305-1-tzungbi@kernel.org/
> >>
> >> Could you please take a look and say if the design looks sane to you?
> >> Especially the double SRCU on the revocable_provider.
> >
> > The first patch in the above URL adds SRCU, and the other
> > two add various tests.  I do not see a double SRCU, just an
> > srcu_read_lock() in revocable_try_access() and an srcu_read_unlock()
> > in revocable_withdraw_access().
> >
> > You are allowed to nest srcu_read_lock(), if that is what you are asking.
> > *However*, nesting revocable_try_access() on the same revocable structure
> > is buggy because the second call to revocable_try_access() would overwrite
> > the rp->srcu value written by the first call.  This could result in both
> > SRCU grace-period hangs and too-short SRCU grace periods, more likely
> > the former than the latter.
> >
> > Or do you mean something else by "double SRCU"?
> >
> 
> This series didn't have it yet, it appeared as a fix to a race reported after
> it was queued, sorry for the confusion. I'm talking about this bit[1] here.
> It returns an __rcu-annotated pointer, forcing the user to keep and manage it.
> 
> This is because when revoking the resource[2], the pointer storing the address
> of the revokable provider is also managed by SRCU - in addition to the
> revokable resource itself which seems to me like a weird concept. I understand
> the race condition it fixes but I assumed the whole concept of revokable is to
> free the user from being bothered by the implementation details behind it which
> leak out of the API if you need to keep __rcu around.

Please hold off on reviewing the patch and the "double SRCU" usage for now.
I'll remove the second RCU in the next version, which should serve as a
better starting point for a clean review.

Side note: It was actually one SRCU and one RCU, not a double SRCU.
