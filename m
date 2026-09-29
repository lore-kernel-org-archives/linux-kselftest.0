Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F176D3E51E4;
	Tue, 29 Sep 2026 16:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699856; cv=none; b=owfBK6HGEUxPKSodL6LpOgHR42jLYAXIFN6Z3lhthJDQe41F2Ib2yxXRyStGh0V06FxGbc4S/iC0E30/khlJceHpXe9IJ44hOtG3yPWDUxFpKhqFJtklsKap9b1ED4aY5LsylVoge4/wr+jXyfpIc5kvy0VXdhsBQtkTk6jv75c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699856; c=relaxed/simple;
	bh=VqPVe5jdZHSMK21th7P0CTNSSi3A/lFHupEQJO+I5K4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d1Y+y8rmMr3FPf07EGbD5Z6eFhmYmT0hAzwR6NvKZrG5+UGAWjx8Yb7zdrWOgsJFKAngzkEDj1OscDSAmZWV8cVHGOv3bWcW2hzAvseDMK3M7V4WWpXSn4+g3Yjvw4XqeNPmYkAu8PMRCRMlyHatKkkUi18zlG+PW+h9xI1q68w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=enXWmmDj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="enXWmmDj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C488B1F000FF;
	Tue, 29 Sep 2026 16:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790699854;
	bh=Nm0X7HVhBHi1V4ocPJ8HnheSkGY858C2+8yJ4S9tuFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=enXWmmDjT15YehQixPtN5/s5s4rpKbmg+zfvG8kW6UY3f9aUF+fEb0V86AVKjVdCx
	 CuJLzvFLVG4px5qCn/DIKdTZDpuhHAEc8Q7D4IYd30AOXTSJtMO7czwr+LWksMpq3p
	 bfxNdwRF9+9XihqkFbqTUe8sH+TPN3PrpMFUK8NVnPU6NNJdjVRIB3vfKwulBlkxoe
	 Mv6dHgsu5fanIC1pVpBkQBe+bkLS6midKJ1ySC3ZYiD//bkvKMFxATshb3ZLAJ3dSW
	 VaX9wYv8Oaqtl7DYCIbDs8ZQB7PpWgb6VPoiCKsochcXZXHb2ZlenW2Il00JXOU1QU
	 gSs7wNPYrWlgA==
Date: Tue, 29 Sep 2026 17:37:29 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 05/11] kselftest/arm64: Exit with an error code on data
 mismatches in fp-stress
Message-ID: <arvoLC3LnBbUQ-oe@gremlin>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
 <20260901-arm64-fp-stress-kvm-v1-5-31bce995b49b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-arm64-fp-stress-kvm-v1-5-31bce995b49b@kernel.org>

On Tue, Sep 01, 2026 at 06:06:45PM +0100, Mark Brown wrote:
> Several of the fp-stress test loads have blocks at the end of their barf
> functions with a range of commented out options for how to exit the program
> after logging an error. Comments indicate that these were intended to
> interact with some long gone debugging code in the kernel. At the minute
> the option selected by all the programs is to delivera SIGABRT to
> themselves but there is no need to do this over a normal exit with a non
> zero status. In order to facilitate running as a KVM guest replace these

Same comment as before re: bare metal. Not sure on nomenclature however!

> Signed-off-by: Mark Brown <broonie@kernel.org>

That was some hairy existing code :)

All seems sensible so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

One nit - there's still a:

function barf
// fpsimd.c acitivty log dump hack
//	ldr	w0, =0xdeadc0de
//	mov	w8, #__NR_exit
//	svc	#0
// end hack

That sticks around in the files, should those be removed also?

--
Cheers, Lorenzo
