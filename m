Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041D32DBF75;
	Fri, 21 Aug 2026 12:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787316136; cv=none; b=QiAAJEJulor9ZNF9VfXRJXD2YMFx1ohS36lf9hp6hjZTMqzXqdSQ/7kA8KwRHtPfGIaoc/ouK1WyJFNWi0np4syJ+bX4r3IE24QIwpRiYSk44LRAvnuafHiIO2O3T8241pk7m/EJ9M/T6FKaxKIznCnK6g5yzWBga1OwAVQuGyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787316136; c=relaxed/simple;
	bh=KmFGYOXLZGqHz5ycu/ItQhSxIHuNWnO0joAUwva/odw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XE3rq9SPAhwf0S8tpbHva+LNvMW/oms6Ba/q6hq2ulAA1myLRmbOQ2QGVm5nROACauxT9Vxhslfpg7UqewVkBL/6Gm02n5D7hEfIa888D5fi5p5xdfU7yQ0BROI68Kq3bYC5AZCBRHCmU6uKlrr8zP3DKItPhKZ2hpU/cyiL+54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=Y9E2wAHe; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="Y9E2wAHe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description;
	bh=XlHkLSycCKjRtAr9aanGA8R5h+hYrAcj5N82YfUc02A=; b=Y9E2wAHelJ1b4m2JSM/zsZDHfv
	hVM9LrDZ3tR9J/ImwsqMNXafQt8a36Q3jonTNfsmqEVj9xL5DZ8WoZYM7RAeyYBXbQ8tnrn21smpN
	xWaojcvYMtMoaiRp+xRU3jPVS2+kTDnXl2eMG7suwqP8NRGVzvCFUkKKPb54cSPLWIMeOmj2WQMuI
	OPgAY1Lvmy4QT77ZbgCd9YwMyt4DpQOjYADCkKEugo1KMrB6Zdm7qwN1NMzNBAnRut9eub/RYMVcb
	UPMqq0TwvwMl/UTKi8BUGHIEOUNHPccBzJEU0UnQJ7Wh8atiC2X4wSZUvikWqpIGbz0PJAybEGb+Q
	TM1gHmPg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wxOZK-00BLOj-1B;
	Fri, 21 Aug 2026 12:41:58 +0000
Date: Fri, 21 Aug 2026 05:41:51 -0700
From: Breno Leitao <leitao@debian.org>
To: Gustavo Luiz Duarte <gustavold@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, paulmck@kernel.org, davej@codemonkey.org.uk, riel@surriel.com, 
	asantostc@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, samuelcrossley@gmail.com, 
	kernel-team@meta.com
Subject: Re: [PATCH net-next RFC 4/6] netconsole: tell the target when the
 rate limit drops messages
Message-ID: <aohGyZjH-2lfMpGN@gmail.com>
References: <20260818-netcons_ratelimit-v1-0-8c5d2d17789c@debian.org>
 <20260818-netcons_ratelimit-v1-4-8c5d2d17789c@debian.org>
 <CAGSyskXshZTuBwiOPzp1j-d3He07Sx9OZGqRq4k6SG_kBwuKMA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSyskXshZTuBwiOPzp1j-d3He07Sx9OZGqRq4k6SG_kBwuKMA@mail.gmail.com>
X-Debian-User: leitao

On Thu, Aug 20, 2026 at 09:49:47PM +0100, Gustavo Luiz Duarte wrote:
> On Tue, Aug 18, 2026 at 11:30 AM Breno Leitao <leitao@debian.org> wrote:

> > +static void send_ratelimit_notice(struct netconsole_target *nt, bool extended)
> > +{
> > +       int len = 0;
> > +       u64 ts_usec;
> > +       u32 drops;
> > +
> > +       drops = netconsole_take_drops(nt);
> > +       if (!drops)
> > +               return;
> > +
> > +       if (extended) {
> > +               /* append the extended headers */
> > +               if (nt->release)
> > +                       len = scnprintf(nt->buf, sizeof(nt->buf), "%s,",
> > +                                       init_utsname()->release);
> > +
> > +               ts_usec = div_u64(local_clock(), NSEC_PER_USEC);
> > +               len += scnprintf(nt->buf + len, sizeof(nt->buf) - len,
> > +                                "%u,0,%llu,-;", LOGLEVEL_WARNING, ts_usec);
> > +       }
> 
> This additional message with sequence number zero in the middle of a
> stream looks awkward.

First of all Thanks for the review.

Agreed, but I don't think there is any other solution rather than a 0,
given this is coming from printk(), and we don't want to
conflict/collide.

> I don't think we need to send a notice about dropped messages to
> extended console targets. Those targets can detect dropped messages by
> tracking the sequence number in the message header.

I've come up with this "extra" message in a say to get it very clear
that some messages were rate limit.

We can certainly do it using the sequence number if we enable message
counting.

What would be an option to tell we had ratelimited for those not using
message count?

Thanks!
--breno
