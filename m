Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE8A43CEFE;
	Thu,  6 Aug 2026 10:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786013839; cv=none; b=YTJtgkTxB3wUM8ccaxsv3eqNnvarBV+O2jVYalmq9UjupFczaL98kNz1/x19+0TIwkXsDTw37HpqPlBiuj82Hidk/YDItcyOPOLGR72oiPWwYYWIqSVXz2s2U/eZTIqf8yMSm10IEBk23SFauoQeI+R4AD0GxG4Ys11O/WNjaY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786013839; c=relaxed/simple;
	bh=G9joZGss5XqTR0oAhYWVHwiW99xI9KLFoRAjXW5ptx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FT7/XLt9uHlfh4uHWh43mRi57HsqwibEc4sXjDqLnh5C8LI/cTzht/TD1aaGltkZwGJpUf25pRzF48gKfqQARK+77ylQiwsDDKg+txL2BIaUo64QiInmqyofDcf+98S6rbvh5HItTc2eJ5gqGZ/9uVujkV8N0vHd8xzFjvzxAwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LPp3cDUe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LPp3cDUe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F4E01F000E9;
	Thu,  6 Aug 2026 10:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786013838;
	bh=ERPAPKSxnpd0vSAax2oMcQVD/OrrkZRHuzs0BledQMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LPp3cDUeYthW9eFgy+ZxuPxn1z1C0iNeN+ZS+amHMCB5eIAjgAswzl3PJpsstV/jR
	 9iZLIioD3mlI5QAr7WNMvQUIZ5b0kEd6HPieGOj7XW03XR1m7HxSKRCA1CeuF6CENK
	 U7gWUKlJUuccmgA1AYoS281ONmuTxu4DiafcHjdkxbaCZvYZqilcSMRyR8UqrnBWKQ
	 LbOm5j1ZIvF2gUDY6VWNx/7NYqbll11RV9qobV1hfb2woOzsmdlkev6wskJpQBh3Pe
	 x/gC160PM72LCp8J5jkke/ZmQg2Gu/J9/EgnNDuDF79MYoBCd+MA6njivIQMAiusYk
	 B3B4qcH3ka04g==
Date: Thu, 6 Aug 2026 11:57:12 +0100
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Karl Mehltretter <kmehltretter@gmail.com>, kernel-team@android.com,
	Mark Rutland <mark.rutland@arm.com>,
	Oleg Nesterov <oleg@redhat.com>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64/fpsimd: ptrace: Fix inactive SVE and SSVE
 regsets
Message-ID: <anRoiIbOFVjj7qPN@willie-the-truck>
References: <20260729004255.15630-1-kmehltretter@gmail.com>
 <178566413306.4141663.7146790540592743319.b4-ty@kernel.org>
 <21702e5c-2dcc-46ad-bffe-26cd76d844b9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21702e5c-2dcc-46ad-bffe-26cd76d844b9@sirena.org.uk>

On Wed, Aug 05, 2026 at 10:27:18PM +0100, Mark Brown wrote:
> On Sun, Aug 02, 2026 at 01:12:24PM +0100, Will Deacon wrote:
> > On Wed, 29 Jul 2026 02:42:54 +0200, Karl Mehltretter wrote:
> > > sve_init_header_from_task() takes header as a pointer, so for the
> > > inactive mode
> 
> > Applied selftest update to arm64 (for-next/selftests), thanks!
> 
> > [2/2] kselftest/arm64: fp-ptrace: Fix checks for inactive SVE and SSVE regsets
> >       https://git.kernel.org/arm64/c/bd290e7fc245
> 
> As noted in the changelog applying patch 1 as a fix and this only for
> -next blows up the fp-ptrace test rather impressively in any
> configuration which can generate headers only reports:
> 
>    https://lava.sirena.org.uk/scheduler/job/3075737#L3231
> 
> for the release.  Both patches really do need to go together.

By "blows up" you mean the test fails, right? That's the same behaviour
if anybody runs the test on a kernel without the fix. Both patches are
merged in for-next/core.

Will
