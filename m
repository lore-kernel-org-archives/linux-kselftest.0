Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243FE46A618;
	Wed, 30 Sep 2026 08:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790757685; cv=none; b=aw9AS26xjyhQu9cSB+XoUV+2ZRs8y/dHB+VStEgyQCu0ofEsXqexyo7bVe8n64xEGAkbpySgfOBnkp5sYXqbLo/+MSaoyeC8mY1eNEn/3AurCrLXa6L7HgWHvPC7xB9ijuyGP1oyoU9u5uv7guBuhGG0dK9AfRt+8XX4hbAMmiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790757685; c=relaxed/simple;
	bh=8u2gb3KMo67glqbPwoMMfM8CXuNu/lEjAWa4yVIksu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qlpe2O+pJIlLBxIz3riK3DCHb+M/D712aBpaVhmEQ3dig82RCWZ7XaocIUhbjD/Cn8MRHFBsVusbzvdPXJcAXIeNMda7PBg+BfSb2Kcz9d+PMwvfkXsjP2S4duxDWbP755GiHkA5njQgwHjm5jVvMLSG8MbaQVcdBFD1C1LltBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mhzhUa9u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mhzhUa9u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309C81F000FF;
	Wed, 30 Sep 2026 08:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790757682;
	bh=sFCvsXZLdxLKdHXwpS2nWXBpKLwepoPfVilE5Kh5WMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mhzhUa9uS6ktb80BJuDJGmtAxdhIqUzAP/HXGJ7IC4X+tI8VvcgkCZyJtgdQx2F1r
	 Wrle757SiP9fvECGBPdskTJcuCihZHNIm/GJhqcohJbrZB2acm3rOqVKdBesQcDel3
	 H5g3r9F32WcMdawUsIdP66lqstfbNKTT1MAPHwlZLn+LtqwQv8RCPfFpRGUam9zGqn
	 F9lPkFmZw32empK7ClckYchozBtr3NMoeTGgUfu1WrZJ1OOOwgPU58lZziwN85tUul
	 Sd7cFoXEFut1UZHCZ/WBLqsiKcQO1NHumtPIYYmPHhxLFt7tDRXPS0/g5bUvJUiaKX
	 6ozrSPKWxej9A==
Date: Wed, 30 Sep 2026 09:41:16 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 03/11] kselftest/arm64: Move exit calls out of fp-stress
 loads
Message-ID: <arzHLZdKJ0qJFNHg@gremlin>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
 <20260901-arm64-fp-stress-kvm-v1-3-31bce995b49b@kernel.org>
 <arvjKjrh1NU4CKPE@gremlin>
 <636db593-b6b6-4338-b9b0-e87c54111d14@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <636db593-b6b6-4338-b9b0-e87c54111d14@sirena.org.uk>

On Tue, Sep 29, 2026 at 10:56:10PM +0100, Mark Brown wrote:
> On Tue, Sep 29, 2026 at 05:22:44PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Tue, Sep 01, 2026 at 06:06:43PM +0100, Mark Brown wrote:
>
> > > No functional change.
>
> > I don't think this is accurate, as you're changing the register into which a
> > value is loaded (x0 instead of x1).
>
> > That seems to be correct to me, but worth calling out that you're fixing that up
> > in the commit message and dropping this line.
>
> That's actually an unintentional bugfix, the original code just uses
> whatever random value was in x0 as an exit code.  Probably that was
> non-zero so it all works out but still.

Yeah absolutely, it seems that we just got lucky before with it which is
slightly ludicrous :)

--
Cheers, Lorenzo
