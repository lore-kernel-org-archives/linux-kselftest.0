Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986353F825A;
	Thu,  6 Aug 2026 12:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786018809; cv=none; b=jA9E53zXPPDq4S9WrdiZF3P3nDh6b9wbwYIQo+W+FaUhUvrXgaIcikwzbssuQHmqUsPc+OiAjA4y+sGugprqM/iA9NT+w+7wuxMartJYWgXlUmsWP9HEFr3O8NrW4VDiJeJRvSMsUF1nXi10JolkT5rKusY3XY1KYn0Y7thBwAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786018809; c=relaxed/simple;
	bh=/6NSNy4+LnPKF4OkSSDMH0CGyaDS0qRTalBg5O8t+IM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rg7o1hpyIV2GhQrMnarb1W929ZmnK/eKZWvBOGwGquZbNS+p/OPat87/gY5j0K1S12Kd97CTBexbNa8UxktPApK4aX1l9YIJ6nrKYARJQLk9O+29fP+JTEimb5uqr8m6zcLk+6XXUyyojBKBrUrqlICsgqkqgInx5cDmCSpIFLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gfG3LPxe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gfG3LPxe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427061F000E9;
	Thu,  6 Aug 2026 12:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786018808;
	bh=7C1FpHXQHhaXmJHx/8OCdTfxUT9wAJECfFf7MxmJFok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gfG3LPxeUPq84Xp2JFwWxR+xz6vWQPO9xA8azlKyQaXXtCueQNjKnnBacy/zVDZrL
	 l5traZsL4ERhfpYjx7Qb7DuwGzVBKWZvoS7u8rKbX2a9NmHWqCqZJLLwBA2c3FUt5O
	 HecAcRZGO7uHXHhjlvEaPT1Nz8oO/w5C64IJz8GIMrxBsuKTPJvdGgSLo4XkOBu1j9
	 +b0ZdUKkwzYUEAtvniztZGUdWmdFB0JPVpRu0kf9VZTSuJKDO/sSu19jQp6xnMyqol
	 WSRDf5gED372yERjG3MA5QbKh9w1yUmGhZutyJvevaA/0kz2W2XDYhZ6wMxrdTI6t5
	 vbsW7qxqelqYA==
Date: Thu, 6 Aug 2026 13:20:02 +0100
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
Message-ID: <anR78qO5RGalbFNo@willie-the-truck>
References: <20260729004255.15630-1-kmehltretter@gmail.com>
 <178566413306.4141663.7146790540592743319.b4-ty@kernel.org>
 <21702e5c-2dcc-46ad-bffe-26cd76d844b9@sirena.org.uk>
 <anRoiIbOFVjj7qPN@willie-the-truck>
 <be47f939-bc44-46b8-ba38-988403dd87b0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be47f939-bc44-46b8-ba38-988403dd87b0@sirena.org.uk>

On Thu, Aug 06, 2026 at 01:15:25PM +0100, Mark Brown wrote:
> On Thu, Aug 06, 2026 at 11:57:12AM +0100, Will Deacon wrote:
> > On Wed, Aug 05, 2026 at 10:27:18PM +0100, Mark Brown wrote:
> 
> > > As noted in the changelog applying patch 1 as a fix and this only for
> > > -next blows up the fp-ptrace test rather impressively in any
> > > configuration which can generate headers only reports:
> 
> > >    https://lava.sirena.org.uk/scheduler/job/3075737#L3231
> 
> > > for the release.  Both patches really do need to go together.
> 
> > By "blows up" you mean the test fails, right? That's the same behaviour
> > if anybody runs the test on a kernel without the fix. Both patches are
> > merged in for-next/core.
> 
> Right, the test starts reporting 96 fails which doesn't look great in a
> dashboard.  I'd misread the original branch as being merged as a fix but
> I see it's not been merged into the fixes branch, sorry for the
> confusion.

No problem, thank you for running the tests :)

Will
