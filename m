Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8487247ECDE
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 10:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768992134; cv=none; b=gVxXUsM93G3UKIXLP+DUzf316xOOG7zd5hO4OLLKruW7ZcubLgF/DQwG3Wvh74TrA2Y7S3FZTBYh81StnOE02Qo7vPJ5FTndSEJCTQgbcxDuB8Hv4YRRG+AP22c9jZTYc+Zwbb06V15w2rLl7KFEfFQ2KA7u6ZRRcb/7F0TPplc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768992134; c=relaxed/simple;
	bh=R21oflyt7SrGqIaCohBGqYGY1hSCnp/1MlBXab+sm7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L59+3Zb9QASv7axHrIs5zkllMjuPZG/+1axFqPfTXPrnGmqzMANFyGmRZx26HMh0jwyY8XbMfxCvcS3p+UriND+Sda1xDF8caNy/cj8tXWcqly6ZvQIaZ8o8+W0U4M+VW2wWSzpHtZM2oUK6T64Vw4wwk0QiBmLE76quFjApD+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uuCWDPzK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uuCWDPzK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33B8DC116D0
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 10:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768992134;
	bh=R21oflyt7SrGqIaCohBGqYGY1hSCnp/1MlBXab+sm7k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uuCWDPzKoVZZXKxa6bPgjmxODXrRoGoTMwAHaeFS5xCYfS7W94ziXycYAkvQxJIed
	 xi7iXbpER2Ppeil+4pGZf/Gw7wJAyWZVKQcfwlTsTo4OTM8/HL48VY3cFuTDAl/qls
	 B29+xNFEplPYwPldths9i3RppCwheWuWuDY4Xxhm8mM9/tZCyi9B0bM3VLVPHkrUfn
	 DOTJSSAmCTxEJpBwohJE/9YxbPtIEGAm+1OhfmwwaiPiQ+tS2BwDRa1jeXv4aeneNA
	 lEF/VG/DfkebuMKfh043gRFiWh5CiHPF08ovRPjuUbZcqAIgIwhAYHNZw2EHuntFry
	 9PQxXxfuud5ig==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-385bdc72422so440041fa.1
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 02:42:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUummQA3qDo+QfrFSkEuIVLKXbpSIRt7VTYBvOH80TIVi1Whh0+m1pxzQUaggPfNe3e96to3BD9JM3gCRb/c64=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6G/OtEuPFW1i+zjnZBDZGHAfuzn6SX4TxnbDZo1sQG+vCVWU9
	ZzSDWV5kjJ5Ty4c9+Ao+Ac906ulRIyx5PIeaRzB7LBKNARDF3klHhPPdQIyr2ddeMsvf+IdRbw4
	Qwbq2QZMHDIzH73omBq41z+fb0tUJtiHEpKHkS1MYMQ==
X-Received: by 2002:a2e:bc0f:0:b0:383:2537:f13b with SMTP id
 38308e7fff4ca-385a546efc7mr18343981fa.27.1768992132870; Wed, 21 Jan 2026
 02:42:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116081036.352286-1-tzungbi@kernel.org> <CAMRc=MdOCvEb81k0whM9dGCE8Hp=tdxZTUuiFeiL3+WsEei9EQ@mail.gmail.com>
 <aWuFBqIfJpDL9g-J@tzungbi-laptop> <CAMRc=McrFa42mNWmZtD1HKKKZ+USUKpQAAME50wbfxPM7L72gA@mail.gmail.com>
 <aXBTPG9rUHMgbHYp@google.com>
In-Reply-To: <aXBTPG9rUHMgbHYp@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 21 Jan 2026 11:42:00 +0100
X-Gmail-Original-Message-ID: <CAMRc=MejWmGb02akR6TZVPzM4rnZ041TRkJG94=JDYdA5z=xVg@mail.gmail.com>
X-Gm-Features: AZwV_QixHT71jBAW6CYhhCzIJ7SgSnL_P7SnAvqNGHxkd0_5haa6k71I4bYVShY
Message-ID: <CAMRc=MejWmGb02akR6TZVPzM4rnZ041TRkJG94=JDYdA5z=xVg@mail.gmail.com>
Subject: Re: [PATCH 00/23] gpiolib: Adopt revocable mechanism for UAF prevention
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Dan Williams <dan.j.williams@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 5:17=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Mon, Jan 19, 2026 at 09:33:21AM +0100, Bartosz Golaszewski wrote:
> > On Sat, Jan 17, 2026 at 1:48=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.o=
rg> wrote:
> > >
> > > On Fri, Jan 16, 2026 at 11:35:00AM +0100, Bartosz Golaszewski wrote:
> > > > On Fri, Jan 16, 2026 at 9:11=E2=80=AFAM Tzung-Bi Shih <tzungbi@kern=
el.org> wrote:
> > > > >
> > > > > This series transitions the UAF prevention logic within the GPIO =
core
> > > > > (gpiolib) to use the 'revocable' mechanism.
> > > > >
> > > > > The existing code aims to prevent UAF issues when the underlying =
GPIO
> > > > > chip is removed.  This series replaces that custom logic with the
> > > > > generic 'revocable' API, which is designed to handle such lifecyc=
le
> > > > > dependencies.  There should be no change in behavior.
> > > > >
> > > > > This series depends on the 'revocable' API, introduced in [1].  S=
ome
> > > > > build bots may report errors due to undefined symbols related to
> > > > > 'revocable' until the dependency is merged.
> > > > >
> > > >
> > > > Hi Tzung-Bi!
> > > >
> > > > Thank you for doing this and considering my suggestions from LPC. I
> > > > haven't looked at the code yet but I quickly tested the series with=
 my
> > > > regular test-suites. The good news is: nothing is broken, every tes=
t
> > > > works fine. The bad news is: there seems to be a significant impact=
 on
> > > > performance. With the user-space test-suite from libgpiod (for core=
 C
> > > > library - gpiod-test) I'm seeing a consistent 40% impact on
> > > > performance. That's not really acceptable. :( I will try to bisect =
the
> > > > series later and see which part exactly breaks it.
> > > >
> > > > I can also help you with user-space testing with libgpiod, if you n=
eed
> > > > it? Some documentation is available here:
> > > > https://libgpiod.readthedocs.io/en/latest/testing.html
> > >
> > > How to get the performance data?
> > >
> > > I tried on libgpiod-2.2.2.tar.xz:
> > > - ./configure --enable-tools --enable-tests
> > > - make
> > > - ./tests/gpiod-test
> > >
> > > There is only TAP output.  Also I don't see the difference between:
> > > `./tests/gpiod-test` vs. `./tests/gpiod-test -m perf`.
> >
> > Yeah, no, there's no dedicated performance measurement in GLib tests,
> > I just timed the test-suite and it runs 40% slower with this series.
>
> I think this is mostly introduced by a redundant synchronize_srcu() call =
in
> revocable_provider_alloc().  Proposed a fix in
> https://lore.kernel.org/all/20260121040204.2699886-1-tzungbi@kernel.org/.
>
> The replacement still brings a few overhead (e.g., for allocating some in
> the .open() file operations).  Especially the test approach can accumulat=
e
> them.

People do care about open()/close() performance, please see the
following discussion:
https://lore.kernel.org/all/20250311110034.53959031@erd003.prtnl/

It required us to use raw notifiers instead of atomic ones which call
rcu_synchronize() to fix the performance regression.

Bartosz
