Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB1337FF71;
	Thu, 29 Jan 2026 09:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769680588; cv=none; b=JBfFvj8JfKiwcR5q2U+3l2YDh24jhZvsABNcYmpeQkjvmMk7e6LevDJhhSXIRBws2lG46UWVpVYJOsqZzZPNsstODUqx7oda887GXs+UqSGNRU68hFffYlSc0a/5ZxqhUHI5wi3OOo3HJ7BI8Ru5iRd8LTc3JjNef3O3drI55IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769680588; c=relaxed/simple;
	bh=k+7jfZ6Yviri9BOTiWfmcCbQ57HE6M45FRRRW8CNURg=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=mpg7sZGdz1m/bWB86TihaojRuzxQlzH3RHPO6wITZX7mPdt4Wyv+CI17bIvt7J4iKS/vzFwLVtaKC5+2tB2zpecPkH7k7yQMkdp4V8uHsicIIu+30oRudq7K+7ZMvHqBruqIvspGgG2ElblvljLm4YdAugnIlawAktJ/SqIRtHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyyhQgIn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyyhQgIn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4C6EC4CEF7;
	Thu, 29 Jan 2026 09:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769680588;
	bh=k+7jfZ6Yviri9BOTiWfmcCbQ57HE6M45FRRRW8CNURg=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=CyyhQgInB22xhQNKRsB0DkRe2/p/90GJDDNdnTKgfBifl6Rh/cKaesf5YKliMVXGr
	 jJzBSguftNLWTe2KcV3UgMrynYXKJzDICBTlsnWvHgbFy4/4md3VfUpB7XeSzIujez
	 KOtXiV73ufvlZpL40TEvE+WkJYsOPWcYZKXNtW/uYfFeYOtcVnLvtN1S3DoTUgeViM
	 jTbebehs5tx0BWDOoac1IOqpQ4kko4nTzEyit3CqHym/Rs/k6eB8vjT96ITesjdKR3
	 RKeqWD6D1ZxZCbwSRA3XDQ2e5jEEgyH9m/MRlQk6KixK0HxsNflwqCBZKz4TzkCYqk
	 UA+2Razsic5aw==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 10:56:22 +0100
Message-Id: <DG0ZES9SRSKD.11UBH7B75WNSX@kernel.org>
To: <dan.j.williams@intel.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Cc: "Jason Gunthorpe" <jgg@nvidia.com>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Bartosz Golaszewski"
 <bartosz.golaszewski@oss.qualcomm.com>, "Johan Hovold" <johan@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Tzung-Bi Shih" <tzungbi@kernel.org>, "Linus Walleij"
 <linusw@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <shuah@kernel.org>, "Wolfram Sang" <wsa+renesas@sang-engineering.com>,
 "Simona Vetter" <simona.vetter@ffwll.ch>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Bartosz
 Golaszewski" <brgl@kernel.org>
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
 <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com>
 <20260127235232.GS1134360@nvidia.com> <20260129010822.GA3310904@killaraus>
 <20260129012322.GC2223369@nvidia.com>
 <697ad713ea124_3095100ee@dwillia2-mobl4.notmuch>
In-Reply-To: <697ad713ea124_3095100ee@dwillia2-mobl4.notmuch>

On Thu Jan 29, 2026 at 4:42 AM CET, dan.j.williams wrote:
> Jason Gunthorpe wrote:
>> On Thu, Jan 29, 2026 at 03:08:22AM +0200, Laurent Pinchart wrote:
>> > > The latter already have robust schemes to help the driver shutdown a=
nd
>> > > end the concurrent operations. ie cancel_work_sync(),
>> > > del_timer_sync(), free_irq(), and *notifier_unregister().
>> >=20
>> > One a side note, devm_request_irq() is another of the devm_* helpers
>> > that cause race conditions, as interrupt handlers can run right after
>> > .remove() returns, which drivers will most likely not handle correctly=
.
>>=20
>> Yes! You *cannot* intermix devm and non-devm approaches without
>> creating very subtle bugs exactly like this. If your subsystem does
>> not provide a "devm register" helper its drivers shouldn't use devm.
>
> I wonder if we should have a proactive debug mode that checks for
> idiomatic devres usage and flags:
>
> - registering devres actions while the driver is detached

In Rust we already enforce this through the type system, i.e. we even fail =
to
compile the code when this is violated. (I.e. for all scopes that guarantee=
 that
a device is bound (and will remain throughout) we give out a &Device<Bound>=
,
which serves as a cookie.)

In C I don't really see how that would be possible without additional locki=
ng,
as the only thing we could check is dev->driver, which obviously is racy.

> - registering devres actions for a device with a driver that has a
>   .remove() method

This is perfectly valid, drivers might still be performing teardown operati=
ons
on the device (if it did not get hot unplugged).

> - passing a devres allocation to a kobject API

Well, this is an ownership violation. Technically, devres owns this allocat=
ion
and devres releases the allocation when the device is unbound. Which makes =
this
allocation only ever valid to access from a scope that is guaranteed that t=
he
device is (and remains) bound.

> - invoking devres release actions from a kobject release API

This is similar to "registering devres actions while the driver is detached=
" and
falls into the boarder problem class of "messing with devres objects outsid=
e of
a Device<Bound> scope".

Again, I think in C we can't properly protect against this. While we could =
also
give out a "Device<Bound>" token for scopes where we can guarantee that the
device is actually bound to a driver in C, we can't control the lifetime of=
 the
token as we can in Rust, which makes it pointless.

So, the best thing we can probably do is document that "This must only be c=
alled
from a scope that guarantees that the device remains bound throughout." for=
 all
the devres accessors.

There may be one thing that comes to my mind that we could do though. While=
 we
can't catch those at compile time, we might be able to catch those on runti=
me.

For instance, we could "abuse" lockdep and register a fake lock for a
Device<Bound> scope and put a lockdep assert into all the devres accessors.

However, fixing up all the violations that come up when introducing this so=
unds
like a huge pain. :)
