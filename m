Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3399329C6C;
	Fri, 13 Feb 2026 08:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770971287; cv=none; b=REVLxivWdMEOsVi9SLTWhcaKpbRxwPW1gb+6RsSP+O9FODFmzXSMKv+FtilKTenPG0XqSdCyGsYzlIcMDnrrC07A7P/5UDKgM2nUBFv7kR/6k+KTtN1Okn7P2uEip3XD+cJjowX34mS0n4ITcrZ+YZsHg/imzZyFf/ddqSmLpXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770971287; c=relaxed/simple;
	bh=a5f9nQfti0Tq2jhHV6xeyiyqksD8zxt8zYDfrv1119w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eZ/2eSaYGf1I89E/jwP/Imifj5nHughZMoa0Zp3XwYKqgUZNbthwPd+BCrnErlq0IimdGpj1Swioh6ehe1cNf8lOJ+1DW0pIMPQgnsFpqN8mcm6zzAByOEVLpohh9TeiVjaaLMCEjypW2COstm55iv6jSe5pg1fvBZBkDN7WErk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K7CPZY4f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K7CPZY4f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF88C116C6;
	Fri, 13 Feb 2026 08:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770971286;
	bh=a5f9nQfti0Tq2jhHV6xeyiyqksD8zxt8zYDfrv1119w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K7CPZY4fO8L37RcqMooOZp6M/1J4jq55hCH7xhyO8/eN6Uohf64LOjhAH+pEv9o33
	 mvRBITdPBpQJ2/mMg500hq9e+j/FW0JAqcGFWvLEgohBG8nvN1K7dO9z4ioV6RZ13C
	 KQJHJDvKvOGGEDhyMWVpHpwkk8S5r/N9/+zMwW4jKr6qcmTSyApe/jSoQlvce7/CaK
	 YoX9ipRfxcidgsi4fgRFUr6k0Pr+69INXGnH97FU6scb886xnUNsQroSaGZ1Qmbmh5
	 s0wx22PEml8b2I+FNqGZ0eH8CsPkUpGU72ppiUaN6B3vlyGYJSSWWMkl29ZKH0mvol
	 taWWQsP6DC3Ig==
Received: from johan by rho.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vqoWr-000000008Fr-2BJa;
	Fri, 13 Feb 2026 09:27:58 +0100
Date: Fri, 13 Feb 2026 09:27:57 +0100
From: Johan Hovold <johan@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH] revocable: hide the implementation details from users
Message-ID: <aY7gjQEcRq6kvHpn@hovoldconsulting.com>
References: <20260206103216.38623-1-bartosz.golaszewski@oss.qualcomm.com>
 <fc68da89-7c2b-432b-9a78-6ab55fcb0e9e@paulmck-laptop>
 <CAMRc=MeHWkDCi0GvXFYxDhCeWMydjT9wOw3_d1d+c+VE7y0-7Q@mail.gmail.com>
 <aYvj5h4tEZI-habX@google.com>
 <de233174-795f-4549-abfe-08060016c541@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de233174-795f-4549-abfe-08060016c541@paulmck-laptop>

On Tue, Feb 10, 2026 at 08:59:20PM -0800, Paul E. McKenney wrote:
> On Wed, Feb 11, 2026 at 02:05:26AM +0000, Tzung-Bi Shih wrote:
> > On Mon, Feb 09, 2026 at 05:13:17AM -0600, Bartosz Golaszewski wrote:
> > > On Fri, 6 Feb 2026 23:02:44 +0100, "Paul E. McKenney" <paulmck@kernel.org> said:
> > > > On Fri, Feb 06, 2026 at 11:32:06AM +0100, Bartosz Golaszewski wrote:

> > > >> Could you please take a look and say if the design looks sane to you?
> > > >> Especially the double SRCU on the revocable_provider.
> > > >
> > > > The first patch in the above URL adds SRCU, and the other
> > > > two add various tests.  I do not see a double SRCU, just an
> > > > srcu_read_lock() in revocable_try_access() and an srcu_read_unlock()
> > > > in revocable_withdraw_access().

> > > This series didn't have it yet, it appeared as a fix to a race reported after
> > > it was queued, sorry for the confusion. I'm talking about this bit[1] here.
> > > It returns an __rcu-annotated pointer, forcing the user to keep and manage it.

> > Please hold off on reviewing the patch and the "double SRCU" usage for now.
> > I'll remove the second RCU in the next version, which should serve as a
> > better starting point for a clean review.

In case Paul or anyone else reading this wonders, the "revocable" code
was reverted last Friday so that's why the links Bartosz posted are
broken:

	https://lore.kernel.org/lkml/20260204142849.22055-1-johan@kernel.org/

Johan
