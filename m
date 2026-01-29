Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D4C37B3EC
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 09:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769677920; cv=none; b=ekdifEsqQYyvKNIBe1x7F5t/N0bZOXoRyfcGTcCuLxyH6TB/Yppj4Ev9dTTLB8KsAmmwJCpNOWV9afkOA0lv4mqAjxxCuzEOFwtwgLc+eWrgrKXr/KhRMAqYVqCi57v2g2/3I1EvIxdUQ3l3r7lt/QDAxwSHJT8uDBnK7rvORYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769677920; c=relaxed/simple;
	bh=IM27Sa2k/oXCkhqkpD7vIY+H3Y0dwKhibURulmNjI8M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ALEmMyr3pG0tIlYWjEY1dlyeKSH2Xu9NQhuQoXZTeF9m4qsq4e04XdvgvcbYqd49HcaB+22raIBKsDKU0MPMvknOtXbw+gFD3n8sNq9Vjl+WvAIBKMTRp040O8EeJaqzwi0CxWooOQRO2B5FF8P+eDPoTL2uN7LPjEHs/IXKvWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cz+cGuWW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cz+cGuWW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03102C2BCAF
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 09:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769677920;
	bh=IM27Sa2k/oXCkhqkpD7vIY+H3Y0dwKhibURulmNjI8M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Cz+cGuWW+gUFOsNxKBTPtwdpL/uYw02WmwSI9N3kZAODUs9X0C1umAz5LtIg7zaqG
	 q8MfGq6pBGijcPN0zpm7fGm8o8ISQLOwguiFVSZLkj6ElIzbtvEtFdc2a8QBmc334P
	 s9mmCTbdsYAsO6rGyTI05oSMVlzzJOZJRPFwDf8vm7iAHpSbVNKRS/xL3o1NmH9tXP
	 pvY8yFYjk4aBqCiRv69SJRRxCHUb9tKwhAahGFV1VR8888QwVkb/wNer+fUZrHYrUP
	 xTpdFSTkczzlH/hpjvlok8Q0txmh6ZeTTaKnFe9vMxReAoN7hU/T+SEegaSD+g5fjr
	 9vYu5a9oRe6xQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59dd54b1073so782988e87.0
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 01:11:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV7vaIboAU+cBFo90CoFkSk6R4VLbcYqL4ub0TGGSWdOFjKInvNoLoprZFUabZ+bpRSzhnbn6NEl9g1ntq0s8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJNaRiISOISfMqRV+WY7iIEtsfPQZ/8bP0+Sfh8J7p71NoYHVu
	uhCYBLAzUTcHXgN5WKUNKlqWP3Y7oVrqsSJAOxlNIJ1Njq8p5Y/q0l8+kjrEFv9yNsG3C4wia+Q
	zepTAN7Orzvl3q2iPKdTQadPwQI+0fVAdwqBdC/4uWA==
X-Received: by 2002:a05:6512:239a:b0:59d:f451:2484 with SMTP id
 2adb3069b0e04-59e04012db3mr3401848e87.3.1769677918508; Thu, 29 Jan 2026
 01:11:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260124170535.11756-1-johan@kernel.org> <DFX20SA67PF2.VONCFNDOZOZT@kernel.org>
 <2026012554-chatty-policy-42a1@gregkh> <aXdxDBXdyqLFfKKI@hovoldconsulting.com>
 <CAESzEGiA2DSp79pkjxBA5X-DWmSAAgyAF7usKn253jkGpYJMew@mail.gmail.com> <aXovtrAM1r1UyWxA@hovoldconsulting.com>
In-Reply-To: <aXovtrAM1r1UyWxA@hovoldconsulting.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 29 Jan 2026 10:11:46 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeMW4g5em_b9qGBR9OmQZNzyQp-S=zKDCPFu506ixy-cQ@mail.gmail.com>
X-Gm-Features: AZwV_QhhSLr8YAIXF7lJ_123cqit1s77klpkJVNwzMvoknu_qUS3sKQBknj_Hjk
Message-ID: <CAMRc=MeMW4g5em_b9qGBR9OmQZNzyQp-S=zKDCPFu506ixy-cQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Revert "revocable: Revocable resource management"
To: Johan Hovold <johan@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Dan Williams <dan.j.williams@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 4:48=E2=80=AFPM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Tue, Jan 27, 2026 at 10:18:27PM +0100, Bartosz Golaszewski wrote:
> > On Mon, Jan 26, 2026 at 2:50=E2=80=AFPM Johan Hovold <johan@kernel.org>=
 wrote:
>
> > > It's certainly possible to handle the chardev unplug issue without
> > > revocable as several subsystems already do. All you need is a refcoun=
t,
> > > a lock and a flag.
> > >
> > > It may be possible to provide a generic solutions at the chardev leve=
l
> > > or some kind of helper implementation (similar to revocable) for
> > > subsystems to use directly.
> >
> > This echoes the heated exchange I recently had with Johan elsewhere so
> > I would like to chime in and use the wider forum of driver core
> > maintainers to settle an important question. It seems there are two
> > camps in this discussion: one whose perception of the problem is
> > limited to character devices being referenced from user-space at the
> > time of the driver unbind (favoring fixing the issues at the vfs
> > level) and another extending the problem to any driver unbinding where
> > we cannot ensure a proper ordering of the teardown (for whatever
> > reason: fw_devlink=3Doff, helper auxiliary devices acting as
> > intermediates, or even user-space unbinding a driver manually with
> > bus-level sysfs attributes) leaving consumers of resources exposed by
> > providers that are gone with dangling references (focusing the
> > solutions on the subsystem level).
>
> What I've been trying to get across is that the chardev hot-unplug issue
> is real and needs to be fixed where it still exists, while the manual
> unbinding of drivers by root is a corner case which does not need to be
> addressed at *any* cost.
>
> If addressing the latter by wrapping every resource access in code that
> adds enough runtime overhead and makes drivers harder to write and
> maintain it *may* not be worth it and we should instead explore
> alternatives.
>

Alright, so we *do* agree at least on some parts. :)

I agree that any such change should not affect drivers. If you look at
the GPIO changes I did or the proposed nvmem rework - it never touched
drivers, only the subsystem level code. The latter especially is
really tiny, in fact:

  drivers/nvmem/core.c      | 172 +++++++++++++++++++++++---------------
  drivers/nvmem/internals.h |  17 +++-

is all you need to make it not crash in the situations I described
under that series. Runtime overhead in read-sections with SRCU or
read-write semaphores is negligible and typically we only have to
write on driver unbind. So that "wrapping every resource access"
sounds scary but really is not.

GPIO work was bigger but it addressed way more synchronization issues
than just supplier unbinding.

For I2C both the problem is different (subsystem waiting forever for
consumers to release all references) and the culprit: memory used to
hold the reference-counted struct device is released the supplier
unbind unconditionally. Unfortunately there's no way around it other
than to first move it into a separate chunk managed by i2c core. But
that's not the synchronization part that leaks into the drivers, just
the need to move struct device out of struct i2c_adapter.

> This may involve tracking consumers like fw_devlink already does today
> so that they are unbound before their dependencies are.
>

During Saravana's talk at LPC we did briefly speak about whether it
would be possible to enforce devlinks for ALL devices linked in a
consumer-supplier fashion. I did in fact look into it for a bit on my
way back and it too would require at least subsystem-level changes
across all subsystems because you need to add that entry point at the
time of the resource being requested so it's not a no-cost operation.
But it is an alternative, yes though it'll require a comparable amount
of gap-plugging IMO.

> Because in the end, how sound is a model where we allow critical
> resources to silently go away while a device is still in use (e.g. you
> won't discover that your emergency shutdown gpio is gone until you
> actually need it)?
>

Well, we do allow it at the moment. It doesn't seem like devlink will
be able to cover 100% of use-cases anytime soon.

Bartosz
