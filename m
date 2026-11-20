Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795193757;
	b=GO264KexRjg3aC41wxQFFj0hnyB9Sv2l4HrvM40vzGppPwq8Ja7BU9WGE/Td1iK6jCs5
	 Q+dQGnlLXvktr8QRBFNeCgfZkv7cfh6vVWi0Nkas38XiPJqEI0IImjDGEtH+AY/P7iO1A
	 6LBiWnVpxgW+8MOsKKBNslk/MKelwPTerlDzCasCvYlYuuJyS/Xli+X0CFNYmIGvFqK07
	 oTdBOwefUz3LEzae/dE9zp6VnSMWevIo6q/XQdiwoOGXcT5uUoXbWHuS9AVNg6BSWrrko
	 1Wi103yPjLnEOTYqb/7xVcbdHRXgzCa3RoGh0+Shb+Nrjxn6XKAbNOWPue+I8JtOoEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193757;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BJDYdb4P/olInFrA40dkka0MmC2ZyiMvcWyibk/vzAM=;
	b=pf/sJTmQFvQ36ZVmUZQN7NgZmu4vxQteKRu3eipv7Ll6xFiSzRwu0DwjmIa9MKmQjn0+
	 pLyuQqRUL93MOJEpxN4A5t07ANAYvYp9E9R5Q6e9y44XVDUZTlLfs0HWry2j7brGQHNqk
	 nqVOaj+YD4DaFJMGzVC8L/Jp4mVDD7h1rFT53cQpOb6stP9tbRa13Ol8kQ97SJAC2OiPx
	 HeXQPUFy/1NpOi02ADqb/m3+iazkRbzVsiEwUNeBEVbLL+Xdem2IbxjkEZW7AvkcErFvo
	 XAfA60tiSMPeBkeuRyNoCs+iskQvft0yRyfch2i4IQ6WPt23ZQJXd72xCWOnepO85Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Fq/5IE27";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B295060A2615
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 16:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fq/5IE27
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 575C11F000E0
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 16:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795193757;
	bh=BJDYdb4P/olInFrA40dkka0MmC2ZyiMvcWyibk/vzAM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Fq/5IE27WvzJMFscUB1bCw5izPLaXn5+97xW9bYVUY++ukPf28cF2J3YW7pHuwy6+
	 OZuIn0GixT0+2Ik3bzniOVOiNdDoUfJ0yl0RIkpex/zP8u/VSH/77qoqnk+Vy2mCie
	 f1vsDqOhccB1MOrynxCT6XMSil+NhUPvxLvPE2j1yGULwVIb65VR1IcZhlX8/gHgTf
	 qcuA98BdzefYqnUl6S/gWFd+iu0vXIojG6ewN/nBcQl1c4RuhSzbHxKBXw4r3BK8aV
	 uHg69tEzL4t6d0JhJx4CEIl3tMrTfMNYD93HGxOqbhbK1GzAKINIZb+MYHHteiYiva
	 1xeZlqvOcTkAw==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3adef977ad9so9015041fa.1
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 08:55:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFlKpD97dRXznD6jvHO3WZjNISNtPf2wmrh2OZn0CWOL3+mXmv2J2JGcHkJrtlNxFpV5bE2n9AuVsUhJn5SnHU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+swlsGISQofBEYaQAZATB6La2hSEIHtRPgsN1lpeS0X5E74uLS
	luoRzOml1l/NWdT95J5uhEbRaiTVAfYTpv6MGMF9yh6G+iPBcCuUJzT+OYhMwc/1UBe2TqnMa/F
	CqchIq6lqBr+N0Hl3v4fbCiX7zDPCyOY=
X-Received: by 2002:a05:651c:542:b0:3ac:f258:618b with SMTP id
 38308e7fff4ca-3ae7f9a05a8mr13045271fa.6.1795193755714; Fri, 20 Nov 2026
 08:55:55 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113163951.1510082-1-gyokhan@amazon.de> <avvmWA6YX2I-ovJy@vireshk-B250M-D3H>
In-Reply-To: <avvmWA6YX2I-ovJy@vireshk-B250M-D3H>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 20 Nov 2026 17:55:42 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0huaCmgy127J-5_V__dCCgJQg-w9NzQBA-zhHdjfHjFTA@mail.gmail.com>
X-Gm-Features: Aa3M54qGvidR4YxFoTFAjVhSP_68rz3ap42qWF3hFBaP-5_P7AZDLHhLT31-6cc
Message-ID: <CAJZ5v0huaCmgy127J-5_V__dCCgJQg-w9NzQBA-zhHdjfHjFTA@mail.gmail.com>
Subject: Re: [PATCH] selftests: cpufreq: Disable the runner timeout
To: Viresh Kumar <viresh.kumar@linaro.org>, Gyokhan Kochmarla <gyokhan@amazon.de>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 6:30=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> On 13-11-26, 16:39, Gyokhan Kochmarla wrote:
> > cpufreq_basic_tests() reads and writes every policy file, offlines and
> > onlines every non-boot CPU five times, and then shuffles all
> > frequencies and governors of every policy. The amount of work scales
> > with the number of CPUs, but the test runs under the default 45 second
> > kselftest timeout.
> >
> > On large systems the hotplug loop alone does not fit. On a 256 CPU x86
> > machine each offline/online pair takes about 0.5 seconds, so the
> > reboot_cpus 5 step needs more than 10 minutes. Even with the timeout
> > raised to 180 seconds it is killed in the second of the five loops,
> > and the frequency and governor tests never run:
> >
> >   not ok 1 selftests: cpufreq: main.sh # TIMEOUT 180 seconds
> >
> > A larger fixed value would only move the problem to the next bigger
> > machine. The basic test has a fixed number of iterations and does not
> > wait on external events, so disable the timeout with timeout=3D0, as
> > ftrace, timers and net/forwarding already do.
> >
> > Fixes: 852c8cbf34d3 ("selftests/kselftest/runner.sh: Add 45 second time=
out per test")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Gyokhan Kochmarla <gyokhan@amazon.de>
> > ---
> >  tools/testing/selftests/cpufreq/settings | 5 +++++
> >  1 file changed, 5 insertions(+)
> >  create mode 100644 tools/testing/selftests/cpufreq/settings
> >
> > diff --git a/tools/testing/selftests/cpufreq/settings b/tools/testing/s=
elftests/cpufreq/settings
> > new file mode 100644
> > index 000000000000..d3e07370a7e4
> > --- /dev/null
> > +++ b/tools/testing/selftests/cpufreq/settings
> > @@ -0,0 +1,5 @@
> > +# The basic test hotplugs every non-boot CPU five times and then walks
> > +# all frequencies and governors of every policy, so its runtime grows
> > +# with the number of CPUs. No fixed timeout fits every machine, and th=
e
> > +# test always terminates on its own, so disable the runner timeout.
> > +timeout=3D0
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Applied as 7.5 material, thanks!
