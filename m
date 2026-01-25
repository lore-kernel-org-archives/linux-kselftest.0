Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427AB23ABB0;
	Sun, 25 Jan 2026 17:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769363601; cv=none; b=SoNr04UzhAftZkldvbHamd+slxREMHlZuydY9/RJB/JwQIsXI9CBkh3GC0Vw66wIt5/UNi63VpGkpmfVJMuFlkH8afJSFYUfM2DRIYFG074YpdUDAMBgU45ufMTHHHm6DjATDpPSnmVv6bpjhtoTZkYLEMad2ulK3nueLfJIr5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769363601; c=relaxed/simple;
	bh=Ya143pLnp+mt64WgHf4q1czND9Wa21il7OcjnI5INsQ=;
	h=Content-Type:Date:Message-Id:Cc:To:From:Subject:Mime-Version:
	 References:In-Reply-To; b=U8+FVxnIzxhPtywUNy4t6H4Z1A5Ywn00RFvBuhqqpISWBsIyOobQmNiBdUOksdIuq2X8yT6haxKI2t29z041yKl2YbO7ZWD5BGqRpf7Jq/DyaerX2ggR22eZYg3oMF3dJ240T2vWQGFps/qGjoMzVqvptc/+D2G5c59Hel44BsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e3GCqhiQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e3GCqhiQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CC2C4CEF1;
	Sun, 25 Jan 2026 17:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769363600;
	bh=Ya143pLnp+mt64WgHf4q1czND9Wa21il7OcjnI5INsQ=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=e3GCqhiQeIm5xovvXbiG3RAEPcRyiAPSgOxptRKcPChegT/8XpB/NL6NiTKkNERgg
	 4LtKHnWKlQsw7WvWG7oGbwsvmqfn+dkebZKOhV/vvfAqwgnXMFmve94dZyyOZvq1nm
	 mYdrwUUkxrFvMppXVhkrDdLJYmdsoA7heAsRSz5dxoaxA4Hy8G8PLC0JTON5S9rg1O
	 bzHv5JToGTvrn0TxPDyQQLQlFbZSbCns/UoFvS0Q5HQU4dbhT7keqbQVVEoYB1KPUf
	 Scq+i0ociiBdhfMk4zt37JPbe1jo8SmhoA3+Cu/B9csQy3E9rUO4QF1aNNFfWTzDW2
	 fcYg3zWBH72/w==
Content-Type: text/plain; charset=UTF-8
Date: Sun, 25 Jan 2026 18:53:15 +0100
Message-Id: <DFXV1QMQMTRK.2W8SWGVHS2K69@kernel.org>
Cc: "Johan Hovold" <johan@kernel.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, "Tzung-Bi Shih" <tzungbi@kernel.org>, "Bartosz
 Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>, "Linus Walleij"
 <linusw@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <shuah@kernel.org>, "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
 "Wolfram Sang" <wsa+renesas@sang-engineering.com>, "Simona Vetter"
 <simona.vetter@ffwll.ch>, "Dan Williams" <dan.j.williams@intel.com>, "Jason
 Gunthorpe" <jgg@nvidia.com>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260124170535.11756-1-johan@kernel.org>
 <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh>
In-Reply-To: <2026012554-chatty-policy-42a1@gregkh>
X-TUID: cc8RHMit42Rm

On Sun Jan 25, 2026 at 1:47 PM CET, Greg Kroah-Hartman wrote:
> On Sat, Jan 24, 2026 at 08:08:28PM +0100, Danilo Krummrich wrote:
>> But to be fair, I also want to point out that there is a quite significa=
nt
>> difference regarding the usefulness of the revocable concept in C compar=
ed to in
>> Rust due to language capabilities.
>
> True, but we do need something.  I took these patches without a real
> user as a base for us to start working off of.  The rust implementation
> has shown that the design-pattern is a good solution for the problem,
> and so I feel we should work with it and try to get this working
> properly.

I agree, it's a matter of figuring out the best way to adopt this pattern. =
(For
those reading along, [1] details the Rust implementation to illustrate why =
it
may not make sense to adopt it in the same way).

> So I don't want to take these reverts, let's try this out, by putting thi=
s
> into the driver core now, we have the base to experiment with in a "safe"=
 way
> in lots of different driver subsytems at the same time.

I also don't think this should be reverted -- I think it makes sense to sta=
rt
experimenting to figure out what's the best way to adopt this pattern.

I think DRM has already shown interest in adopting this, and I think I have=
 also
seen patch series doing preparation work to be able to adopt this pattern a=
s
well.

Perhaps, to address some of the concerns, a good middle ground could be to =
mark
the feature as experimental with a separate Kconfig in the meantime?

--

[1] Revocable in Rust

In Rust (most) device resources are only ever handed out to drivers within =
an
opaque container type specific for device resources, hence it is named
Devres<T>.

The Devres container type uses the Revocable type internally to protect the
actual device resource; the resource is released automatically once the
corresponding device is unbound from the driver (for which it uses the "nor=
mal"
devres infrastructure).

There are mainly two ways to access a device resource with a Devres contain=
er:
Devres::access() and Devres::try_access().

Devres::access() provides a zero-cost access to the inner device resource, =
but
requires a proof that it is called from a scope where it is guaranteed that=
 the
device remains bound. This is achieved by Devres::access() taking a
&Device<Bound> argument, i.e. a reference (not reference count) of a device=
 that
is guaranteed to be bound for the entire lifetime of the reference.

Let's have a look at an example with an IRQ handler:

	struct MyIrqData {
	    bar: Devres<pci::Bar>,
	}

	impl irq::Handler for MyIrqData {
	    fn handle(&self, dev: &Device<Bound>) -> IrqReturn {
	        // Directly access the inner `pci::Bar`; fails if the resource
	        // did not originate from `dev`.
	        //
	        // (Internally, this is just a pointer comparison between `dev`
	        // and the device the `Devres` container has been created with.)
	        if let Ok(bar) =3D self.bar.access(dev) else {
	            return IrqReturn::None;
	        }

	        // `bar` is a `&pci::Bar`; no (S)RCU read side critical section
	        // involved.
	        bar.write32(...);

	        IrqReturn::Handled
	    }
	}

Since the Rust IRQ handler always guarantees that it won't race with device
unbind, we can provide a &Device<Bound> cookie and hence directly access th=
e
device resource with no cost. Due to the type system representation of the
device context state, this is checked at compile time.

We can do this for anything that guarantees a scope where the device must b=
e
bound. For instance, if we guarantee that a workqueue is torn down on devic=
e
unbind, we can provide a &Device<Bound> cookie for all work items scheduled=
 on
this workqueue. The same applies to subsystem and filesystem callbacks etc.

But, if we are in a scope where we don't have a &Device<Bound>, it means th=
at
this may be executed after device unbind. Consequently, drivers can't call
Devres::access() for direct access of the device resource (because it may b=
e a
UAF) and, instead, have to fall back to Devres::try_access() and friends.

Let's take some DRM IOCTL for instance:

	struct MyDriver {
	    bar: Devres<pci::Bar>,
	}

	fn ioctl_vm_create(
	    drm: &drm::Device<MyDriver>,
	    req: &mut uapi::drm_mydriver_vm_create,
	    file: &drm::File<MyDriverFile>,
	) -> Result<u32> {
	    // Runs the closure in an (S)RCU read side critical section if the
	    // resource is available, returns ENXIO otherwise.
	    drm.bar.try_access_with(|bar| {
	        // (S)RCU read side critical section starts here.

	        bar.write32(...);

	        // (S)RCU read side critical section ends here.
	    }).ok_or(ENXIO)?;

	    Ok(0)
	}

I think those examples make it obvious why a revocable implementation on th=
e C
side can't provide the same value and ergonomics due to language limitation=
s,
yet I think it makes sense to start experimenting how subsystems can adopt =
this
design-pattern in C.

One additional note, while this overall can come across a bit paranoid, it
achieves a clear goal: It becomes impossible for drivers to mess this up an=
d
create memory safety bugs, while at the same time causing zero overhead in =
hot
paths, that can be proven to not have a potential for such bugs in the firs=
t
place.
