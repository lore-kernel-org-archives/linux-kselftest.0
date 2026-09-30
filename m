Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391A750B439;
	Wed, 30 Sep 2026 14:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777848; cv=none; b=jTVX/Dha/ZwxLDeTRsl5NBNJmBma1DdgPNnnO2EILCfQLXeXL0RZ5XwVrDE514/LwAWV/J47ZABT69lo1t9T4RXPfF/ubhPCfOV40fI9/7VAkvlstxFItgSmyQvMGw/SlhQzBxacRWmzl94iFHG8EPi1peVk/3BjnneDujNEH00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777848; c=relaxed/simple;
	bh=k9X39krSCIV5mzuKxtwb13RjYJ1Mo7Wm4Xz5RoYh6xw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8etY8HBY51crVqO0CFObT0+MTEPxZ1DO0TjAVx/liMUcIV/Ns8xpWa7vM2I++IUy8qqUjyVmnFXTs16UqO41967juNaUpQ/V7nLG81fuiKBU01zqPopKCDwnQDr2NCb1ZkPWPN6qFOH7t99GQs4BltQ87MzWvd7KNNOcBjbG1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qi1jme5F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qi1jme5F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BFCC1F00893;
	Wed, 30 Sep 2026 14:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790777837;
	bh=k9X39krSCIV5mzuKxtwb13RjYJ1Mo7Wm4Xz5RoYh6xw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Qi1jme5FUMK17oOBbaBrDU3kYs55uiylLWiHux3LbfjO2PULoUIfzJt9/EG3b04r1
	 6Svj13TomjSscAhVcuasLxxYSoGt6omZAXHEd4RWsyO9aMA8FtadkL/blP5jBXlHPL
	 tv2UR9UKzDF9Fk0p8deUb1YAnC4m0nDxBjSIBDB1zcdzY/3EVhy0EscmcBrkKqCva9
	 pY86fY6n6Av9rMmQ19uP+Rjb8mMYrXjCGhORinNvP/Tz4yIlax1+eeicBOW1ry0qnj
	 DhTFB5VgXu378POq4fC/Hh07yvXmNquVODgh/r++He7iHrQM8cfBi7rJTivJE/5oO7
	 2WwGiL7o+WKfA==
Date: Wed, 30 Sep 2026 15:17:11 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 07/11] kselftest/arm64: Remove the sched_yield()s from
 the fp-stress loads
Message-ID: <ar0DF2P1BdEaGXrM@gremlin>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
 <20260901-arm64-fp-stress-kvm-v1-7-31bce995b49b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-arm64-fp-stress-kvm-v1-7-31bce995b49b@kernel.org>

On Tue, Sep 01, 2026 at 06:06:47PM +0100, Mark Brown wrote:

> Signed-off-by: Mark Brown <broonie@kernel.org>

Had a good look through + all looks sensible to me, so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

--
Cheers, Lorenzo
