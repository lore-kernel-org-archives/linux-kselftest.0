Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E1F3C1F37
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 06:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779085919; cv=none; b=aVnh56M0seuDx69Za3SM6Ik/VMyPOSZ6NM7muhvOkjuKyzYHisW8E9m0Yf5pyNg5dzD3F9qQBtBvkAZs9bAjgLZlhND0NuXilwEXlnFfReKjWZw7bF4s5E9mFQKp4SBirGtXJPuQDAorCSEYRDvHQGXufUt7OhvlCnF5owekyaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779085919; c=relaxed/simple;
	bh=MlEkCgLfLAET7HePrdJoisimifxqtQFmEEEd1oJx1CU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fv4SHBs8wxOAmGanwV4yPDr61VfRzJx+LX/G3q5A6y81bWPYzu4koUqToU9Aw4tckMsNU0a4Uif2mI73ZbBICKaaD+IKXCd7n/Iz28eiOPj1+r2hpfDvNV9L6k2FgzsA5ZAhQNVv06ffCfxXQKVx+g0xR3R5sFJw4DzWKOBQoH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cuAGr4Dn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cuAGr4Dn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F20C2BCB7
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 06:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779085918;
	bh=MlEkCgLfLAET7HePrdJoisimifxqtQFmEEEd1oJx1CU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cuAGr4DnkaFWPiMnoO48Yvv80BrIorHG/0iLTHalhudgVSdwvPoapErFdIN+NFMz2
	 phLGmFTNoU5bC3WLQ6i8P7+rbKg89ysZTCsBcgzIz6Vz4bIjOgfYeqfplU+dVj8yLh
	 W6Rj4kkSmJN3NlQR97SIRGnYtluBo0phXonMWeZsAmo7QkpAt2gj9kboK68pC4kAI7
	 JlR1I8OQHsDoQysR1HWWgP4pQlJy4VQMQiI6kRLU+7N/KPp53TTWyfRZiLQIHMP1et
	 +5icBoIoHPPt+nOhGNZ5UsVbyVzaGJz0bEjBOoCWDncGwWIW+tknxhYVmJpb+Lh8Gm
	 2kXg3SVX2YAig==
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-90cbb2b50ccso154783385a.0
        for <linux-kselftest@vger.kernel.org>; Sun, 17 May 2026 23:31:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Jxn9HNOdBpNFSzds3MimqD54nOULqVRW9O/DHStmPP8ttqmzu7IjFnL6Wxk7nGrq29K21GXfaQy2z48JooiM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy88/an1TcFsu86bzfJ44IJ1HzjLQQrn/O9zvZfOy43Y77tk7nb
	fPVS+B7VMULUvQKNUB4mnkmD71rnwDdI+IB9iCjfXEnmR2/VX1FH+EFZX5Puj+yB1rB/iX2qGG8
	ubDxBpOy7fnmDVNSLuUjpeKrWXxTYOCA=
X-Received: by 2002:a05:620a:ac0a:b0:912:61f8:cab1 with SMTP id
 af79cd13be357-91261f8d5b2mr1253868385a.25.1779085917789; Sun, 17 May 2026
 23:31:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507070547.2268452-1-sashal@kernel.org> <CAHC9VhTwDt2Bx8n0io9Qge_fUEnrHsxrFAQY+KaemKWqJqBQxw@mail.gmail.com>
In-Reply-To: <CAHC9VhTwDt2Bx8n0io9Qge_fUEnrHsxrFAQY+KaemKWqJqBQxw@mail.gmail.com>
From: Song Liu <song@kernel.org>
Date: Sun, 17 May 2026 23:31:45 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4TJRqQKXgcBYog8YgFLU2h2Zq9ReahxTYp_zpDyvO8AA@mail.gmail.com>
X-Gm-Features: AVHnY4LE6Uz9P1F7Ei7__uZGPqS4LrmpPDUToLlmTi9orUT0m2IrTepJoYB0Usc
Message-ID: <CAPhsuW4TJRqQKXgcBYog8YgFLU2h2Zq9ReahxTYp_zpDyvO8AA@mail.gmail.com>
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation primitive
To: Paul Moore <paul@paul-moore.com>
Cc: Sasha Levin <sashal@kernel.org>, corbet@lwn.net, akpm@linux-foundation.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	gregkh@linuxfoundation.org, linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 8:48=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> On Thu, May 7, 2026 at 3:05=E2=80=AFAM Sasha Levin <sashal@kernel.org> wr=
ote:
> >
> > When a (security) issue goes public, fleets stay exposed until a patche=
d kernel
> > is built, distributed, and rebooted into.
> >
> > For many such issues the simplest mitigation is to stop calling the bug=
gy
> > function. Killswitch provides that. An admin writes:
> >
> >     echo "engage af_alg_sendmsg -1" \
> >         > /sys/kernel/security/killswitch/control
> >
> > After this, af_alg_sendmsg() returns -EPERM on every call without
> > running its body. The mitigation takes effect immediately, and is dropp=
ed on
> > the next reboot.
> >
> > A lot of recent kernel issues sit in code paths most installs only have=
 enabled
> > to support a relative minority of users: AF_ALG, ksmbd, nf_tables, vsoc=
k, ax25,
> > and friends.
> >
> > For most users, the cost of "this socket family stops working for the d=
ay" is
> > much smaller than the cost of running a known vulnerable kernel until t=
he fix
> > land.
> >
> > Assisted-by: Claude:claude-opus-4-7
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > ---
> >  Documentation/admin-guide/index.rst           |   1 +
> >  Documentation/admin-guide/killswitch.rst      | 159 ++++
> >  Documentation/admin-guide/tainted-kernels.rst |   8 +
> >  MAINTAINERS                                   |  11 +
> >  include/linux/killswitch.h                    |  19 +
> >  include/linux/panic.h                         |   3 +-
> >  init/Kconfig                                  |   2 +
> >  kernel/Kconfig.killswitch                     |  31 +
> >  kernel/Makefile                               |   1 +
> >  kernel/killswitch.c                           | 798 ++++++++++++++++++
> >  kernel/panic.c                                |   1 +
> >  lib/Kconfig.debug                             |  13 +
> >  lib/Makefile                                  |   1 +
> >  lib/test_killswitch.c                         |  85 ++
> >  tools/testing/selftests/Makefile              |   1 +
> >  tools/testing/selftests/killswitch/.gitignore |   1 +
> >  tools/testing/selftests/killswitch/Makefile   |   8 +
> >  .../selftests/killswitch/cve_31431_test.c     | 162 ++++
> >  .../selftests/killswitch/killswitch_test.sh   | 147 ++++
> >  19 files changed, 1451 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/admin-guide/killswitch.rst
> >  create mode 100644 include/linux/killswitch.h
> >  create mode 100644 kernel/Kconfig.killswitch
> >  create mode 100644 kernel/killswitch.c
> >  create mode 100644 lib/test_killswitch.c
> >  create mode 100644 tools/testing/selftests/killswitch/.gitignore
> >  create mode 100644 tools/testing/selftests/killswitch/Makefile
> >  create mode 100644 tools/testing/selftests/killswitch/cve_31431_test.c
> >  create mode 100755 tools/testing/selftests/killswitch/killswitch_test.=
sh
>
> If we made Lockdown an LSM, we should probably also make killswitch an LS=
M.

I don't think killswitch can stack with other LSMs. In fact, killswitch
can be used to bypass other LSMs, for example:

echo engage security_file_open 0 > /sys/kernel/security/killswitch/control

will bypass all hooks on security_file_open.

Thanks,
Song

> For the LSM crowd who might be seeing this for the first time, the
> original thread can be found on lore via the link below:
> https://lore.kernel.org/all/20260507070547.2268452-1-sashal@kernel.org
>
> --
> paul-moore.com
>
