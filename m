Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADABF36195B;
	Tue, 29 Sep 2026 19:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790709147; cv=none; b=Xu0Um0t2rjRwv2PVhHGsudXiu7BsnQMweCQ6SeC6+k81gufjEY8MEtQY+91wWUZ427N9xLalL2OjrMglWJSQJNOmT71Nq7NYtl78lJ2b79XWbr8bnl57Yz3uviGy7iNDodD3VeNEe1vku3zadGHhPCZbWu1q/3FbfS9h/tBDngg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790709147; c=relaxed/simple;
	bh=jkWQchUzZPEw9Ir5IshOt1U+kJ6oPkBt+qACM9pY6Qs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eyAUx1NbpgRQN2Rf1j0SVRM7NnZOEpvEUFanDI4eMO7SIQafWse0RU3DGM2/FKxU6sp6Jf1MAdzwWwQ2BVS76SYrahRuIaXn0da5Hm6/eUpxDy1bNQbw7lu6WjV46DmyrSUX6uRXVJ69HP0dPGT2l/Tg8fewBzxY6TnaaDOF3B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FljcmtPm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FljcmtPm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB081F00893;
	Tue, 29 Sep 2026 19:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790709146;
	bh=CXEV9wJJNVEJvRW/hCUGKzPEa4M+mZaY4hUd4zg2NEY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=FljcmtPmHIgYStM/UH2+KN2iL9dmapAYloK0hx94eKzAR0WyKnfe4XcSmbRtwdvyx
	 /u0oVs3wVYTAkZC+LUniyP29S8URHjak+IAy30I6gLg9UNGL5nZc2xY2JH4ftIYQim
	 tBRVrmNSG688QzW7hTIYmhu971FLLGhQCqHMpfo59TPPG9QanIohRmYpS+nobUFI82
	 Xh+RUcj2TgHYel9oZS4kv6zyigz2NgTHExneisGtvUXP1Tq8s51jQu9uWQ24kHZuhU
	 yKqTgrjD4/a5kEgqBRudJVoZazzIEOxvs2nH/8KrhiGv/Zu55GnsA7y53Aygxr6APV
	 m8nat32PWLl6g==
From: Thomas Gleixner <tglx@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Andy
 Lutomirski
 <luto@kernel.org>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Shuah
 Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Thomas
 =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH 0/3] vdso/gettimeofday: Add support for ALARM clocks
In-Reply-To: <20260921-vdso-alarm-clocks-v1-0-617abb5271c7@weissschuh.net>
References: <20260921-vdso-alarm-clocks-v1-0-617abb5271c7@weissschuh.net>
Date: Tue, 29 Sep 2026 21:12:22 +0200
Message-ID: <87ld8jj2i1.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21 2026 at 11:53, Thomas Wei=C3=9Fschuh wrote:
> Extend the generic vDSO library to also handle CLOCK_BOOTTIME_ALARM
> and CLOCK_REALTIME_ALARM. This does not introduce any runtime overhead
> in the userspace fast path and only memory copies in the tick update
> path.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
> Thomas Wei=C3=9Fschuh (3):
>       selftests: vDSO: vdso_test_abi: Also test ALARM clocks
>       vdso/gettimeofday: Add support for CLOCK_BOOTTIME_ALARM
>       vdso/gettimeofday: Add support for CLOCK_REALTIME_ALARM

Patch "selftests: vDSO: vdso_test_abi: Also test ALARM clocks" has no SOB
Patch "vdso/gettimeofday: Add support for CLOCK_BOOTTIME_ALARM" has no SOB
Patch "vdso/gettimeofday: Add support for CLOCK_REALTIME_ALARM" has no SOB

Please try again.
