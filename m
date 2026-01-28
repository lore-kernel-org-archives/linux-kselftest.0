Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B75128C2BF;
	Wed, 28 Jan 2026 15:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769615295; cv=none; b=S2T/ce7H+0k6vQpF4g9MSwMuaqVjmgzfu212EUdf9zK5HWjcilNuXjs1VSomXjdlaAPRvvGxw0MskHRMfYl7FN330PKe8lCsy598xFotI/rx3iJKlP0FinIzAIzvLnf3idZA3qMEblbVpx+d9iKVbnQXaRiOKtPMRnq3EcOuKtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769615295; c=relaxed/simple;
	bh=GhvCltR9evGDOD3D/98nyGTFabPfwNc29yamsj8Z7OA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CRgFFys+77GQopWxrT8XXh+P1KwYYMg0f/iN6s8wPuofW7g/nk3UyA0ez+gu0RFtyQHkkJGj7Qn6ATjIPKW0KOKNdAbzIWH6ozrOs1E26Yie1T1P2UrekJKupsNDwpyFPJEGL6/v+gpPn85dwUhV696lifzQJBn11NXxnbVLVc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tmWOTJtu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tmWOTJtu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8BCC4CEF1;
	Wed, 28 Jan 2026 15:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769615295;
	bh=GhvCltR9evGDOD3D/98nyGTFabPfwNc29yamsj8Z7OA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tmWOTJtuqKJJrdq7jzTfq6R/kGyog2bKlj4TQUKs4DyWYhTMnxh4hU34hjjOXNm0w
	 ga6n61AcamtYXTZVNA1oJUDSCTJj+w23L5BG1uPpfAZSq6qXhwgKLf0xuDwsIHVD4E
	 IDns0ljMp/lnDhBG1l8awhhuNGhTShmnYlCLeLsXfQUPv9j0xLqm7B7W/EgZICj9Vz
	 NuehJVqPLhdJ+iWfkrhBILLoCVANi3hG/4XixJRKy4tiVUUnPHKUmhi4n2pDClZ0D8
	 OpZcJdkc3t9mU/W/eSjDYMB4uSH+IwmPTB4icIE82FlSkxqm/k7VwQc1mR1rkxh5CR
	 dC0jpZak4KWhg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vl7m2-000000004xq-2oNk;
	Wed, 28 Jan 2026 16:48:07 +0100
Date: Wed, 28 Jan 2026 16:48:06 +0100
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Dan Williams <dan.j.williams@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Message-ID: <aXovtrAM1r1UyWxA@hovoldconsulting.com>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>

On Tue, Jan 27, 2026 at 10:18:27PM +0100, Bartosz Golaszewski wrote:
> On Mon, Jan 26, 2026 at 2:50 PM Johan Hovold <johan@kernel.org> wrote:

> > It's certainly possible to handle the chardev unplug issue without
> > revocable as several subsystems already do. All you need is a refcount,
> > a lock and a flag.
> >
> > It may be possible to provide a generic solutions at the chardev level
> > or some kind of helper implementation (similar to revocable) for
> > subsystems to use directly.
>
> This echoes the heated exchange I recently had with Johan elsewhere so
> I would like to chime in and use the wider forum of driver core
> maintainers to settle an important question. It seems there are two
> camps in this discussion: one whose perception of the problem is
> limited to character devices being referenced from user-space at the
> time of the driver unbind (favoring fixing the issues at the vfs
> level) and another extending the problem to any driver unbinding where
> we cannot ensure a proper ordering of the teardown (for whatever
> reason: fw_devlink=off, helper auxiliary devices acting as
> intermediates, or even user-space unbinding a driver manually with
> bus-level sysfs attributes) leaving consumers of resources exposed by
> providers that are gone with dangling references (focusing the
> solutions on the subsystem level).

What I've been trying to get across is that the chardev hot-unplug issue
is real and needs to be fixed where it still exists, while the manual
unbinding of drivers by root is a corner case which does not need to be
addressed at *any* cost.

If addressing the latter by wrapping every resource access in code that
adds enough runtime overhead and makes drivers harder to write and
maintain it *may* not be worth it and we should instead explore
alternatives.

This may involve tracking consumers like fw_devlink already does today
so that they are unbound before their dependencies are.

Because in the end, how sound is a model where we allow critical
resources to silently go away while a device is still in use (e.g. you
won't discover that your emergency shutdown gpio is gone until you
actually need it)?

Johan
