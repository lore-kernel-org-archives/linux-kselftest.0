Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A73F39098C
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 18:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779387423; cv=none; b=foqqTyq4j8gbq1759WwngWfvoCseyQUQZ+G0DCX/U8aWgyVP4Zdbml8n0+fifyoKkOibQhji40POCQfX+eCEPRtcE1l30BhTPX0zyMIciHkGOT1QLWXD9fMFwPjkAP5zzT4QL/oX0/s3+guv5w1WlEBhCqgcCcg+zSsb6o9JjFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779387423; c=relaxed/simple;
	bh=+VWCLDENbyTrufBDf5/wO7Oma9uH1Q8L65+rax8aTO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i2r+BP0DGf6RsOw3bISYd0nHdgRbGzwmNLnLJyrnx0tLaOO6WbXMdHerH655uNlUN1zZkdL0+LOuGwLHMOgZcAjhMZ33KGOXtrHkEmr5XZUi039u27v3nva37ZP6NiS8aNQCEZcZG5+gw8TJlRHHOKwNBH6jQFGxdBqdAXv6NZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VuyXq1tq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VuyXq1tq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717281F0155F
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 18:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779387420;
	bh=+VWCLDENbyTrufBDf5/wO7Oma9uH1Q8L65+rax8aTO4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VuyXq1tqiHVI2YZ3Blv3BD2WCJdC9/dUivuyWddy+wydX2ooJe2bkg9Gm9++B3oEo
	 sh0UdIEN9umrNBhjufrQIqRV3lx0D0GA8Sb7poWd0s8udQW6ciJHHeZHcCK3RrRCoQ
	 bGWOb0NZbLBqj12BfjSZwfav5msDWT0Qq2t7Gmh4n2mSLQTSilf1F8j/1uecoi0PwC
	 ncOg8TwZYbC16t5C2LBE0N1MO/fsA442mc1wd4TmR96Jef0gJGQbZWXmNtulPenO/u
	 aQc0Km8pCckySifBInQIQvxQgvVAFm6CPvp2h04FbPQVgYDV+qLBCdJy5FkQDlrlXV
	 Lr+UDPJcnr6hQ==
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-63169437ac7so4902085137.1
        for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 11:17:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+chfKMvIqtpSCQsB4PfFXwMm+zldRZ0CwaoRBU6FuU3uXinyPM/zpONSk35MClTE6S5OId4mWtZIFVFuI4UUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0L9SfBxJoWWRIXrwahjIvbIcMvQPUHJbXaoEtl+/CIaKiqrp0
	SMiOzIhxVpYJDyojny0dIJh2eOvQiuA8w3OazJKcvTBjUc6rLTyXeo2UYPqap2ZPLz5aJKJ8rTI
	8s1GWGDc+zim394MOPqba3x3BDQ2XWcY=
X-Received: by 2002:a05:6102:5a9a:b0:631:28c1:154e with SMTP id
 ada2fe7eead31-6739772de2emr3100077137.16.1779387419475; Thu, 21 May 2026
 11:16:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508195749.1885522-1-sashal@kernel.org> <20260517134858.146569-1-sashal@kernel.org>
 <CAPhsuW4x8shWon8Moi5VgCq2n4E2EzaaauZ2HHpy42Rp1Y-J-g@mail.gmail.com>
 <agsVDqdALBoHEHlv@laps> <CAPhsuW44UX663Au=WwHz8MVwnQgLkjxOqpJSCKxNiv3=RpZvqw@mail.gmail.com>
 <b342c38b-7323-4b72-a239-8a574d6bc36b@iogearbox.net> <agzAwjKhOhuANz_P@laps>
 <3dd6d852-18fb-4c64-a1ae-0d79ef7c061f@iogearbox.net> <ag8lOe6dAOgnWmsQ@laps>
In-Reply-To: <ag8lOe6dAOgnWmsQ@laps>
From: Song Liu <song@kernel.org>
Date: Thu, 21 May 2026 11:16:46 -0700
X-Gmail-Original-Message-ID: <CAPhsuW7sbt5B+ZeGW8O2JMJ0ELPU-vhZFNvbB+0Q8XhZg6pKYw@mail.gmail.com>
X-Gm-Features: AVHnY4Ihdl75axpqRxaDxb23j1ycahjc8W-Yta5RRqXxUzFNMBCHqx-JtojbAKM
Message-ID: <CAPhsuW7sbt5B+ZeGW8O2JMJ0ELPU-vhZFNvbB+0Q8XhZg6pKYw@mail.gmail.com>
Subject: Re: [PATCH v3] killswitch: add per-function short-circuit mitigation primitive
To: Sasha Levin <sashal@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, live-patching@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>, Florian Weimer <fw@deneb.enyo.de>, Breno Leitao <leitao@debian.org>, 
	Anthony Iliopoulos <ailiop@suse.com>, Michal Hocko <mhocko@suse.com>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Christian Brauner <brauner@kernel.org>, 
	KP Singh <kpsingh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 8:31=E2=80=AFAM Sasha Levin <sashal@kernel.org> wro=
te:
>
> On Thu, May 21, 2026 at 11:11:16AM +0200, Daniel Borkmann wrote:
> >On 5/19/26 9:57 PM, Sasha Levin wrote:
> >>Sure, this would also work. How do you see this happening? Can we let a=
 certain
> >>user/pid/etc disable the allowlist if they choose to?
> >
> >I don't think we should, given then we're back to square one where root
> >or some other user would be able to just override/bypass an LSM.
>
> killswitch already disables itself when lockdown is active. We can easily
> disable it too when one of the LSMs that cares about this is active.
>
> >[...]
> >>How do you see this working with the allowlist?
> >
> >We should look at the underlying areas where most of the CVE-like fixes
> >took place (these days should be more easily doable given Claude and fri=
ends)
> >and based on that either extend ALLOW_ERROR_INJECTION() or (better) crea=
te
> >new hooks which BPF LSM can consume where you can then have a policy to =
reject
> >requests and tighten the attack surface. For example, the AF_ALG stuff y=
ou
>
> So we could grow the LSM tentacles deeper into the kernel, and we can see=
 where
> current CVEs are happening, which I suspect is the darker corners of the =
kernel
> (old unmaintained, rarely used code), but this definitely won't stay the =
case,
> right? Newer and better LLMs will discover issues elsewhere, and once the=
 low
> hanging fruits are picked off of the current target subsystems, researche=
rs
> will move elsewhere. We will be dooming ourselves to an endless cat and m=
ouse
> game where we go add LSM hooks after some big security issue goes public.

Do we really need to add new LSM hooks for recent CVEs?

The LSM hooks are designed to cover all the user-kernel interfaces. Then
with properly designed policies, we should have coverage for potential CVEs=
.
Existing LSM hooks may not be perfect, but we can improve the hooks,
potentially with the help of smart LLMs, so that these hooks can cover
future security issues. In some cases, we will need new policies, but I don=
't
think new hooks will be needed for most of these CVEs.

Thanks,
Song
