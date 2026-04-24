Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C99C3E4C7E;
	Fri, 24 Apr 2026 16:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777049072; cv=none; b=mKwTYdBss8z6eNcVxgvO3d/QSNUJMnbGQ4MZ1Vlic5oTAHIqoQJ2q8tfKooYlyoTBj8NsHm41kKSkmZXROrKkcjd5sp4r209g4+aZzTfscm1UO/w7sTMyhwmXnAOf+1YKNjwaEx/AuSljwUFT9lHXwTJhW09ZrNQxZChoPXR7A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777049072; c=relaxed/simple;
	bh=a6yyF/+Http6UHyckaBMmwbISlEebiB5pcVWoL92C6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tAuuIhr7vzXOCj1Ah/vTjObHyD7MvXrLVzDvSUoGDB1FLcbkXkc/Tng6qFAVBYWjWF2l6lFw8vToWfJctlP4LeUJMJRXWg0Gj5NeEk8QH/5xVJq1O2opybBucQ0Vfdw5a6oAmsAUZ1xTmHTXfrKdM+PPUzZ7yz4wjs/OpHeViOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Bt6hNc8X; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Bt6hNc8X"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10A751BB2;
	Fri, 24 Apr 2026 09:44:19 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 800E13FAA1;
	Fri, 24 Apr 2026 09:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777049064; bh=a6yyF/+Http6UHyckaBMmwbISlEebiB5pcVWoL92C6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bt6hNc8XUGtXJqMPNnKc6d+t8PZk5JFxhIZGt/dmjoo9jFel1zv/VHdDeBJZ6uIpl
	 8aRrEJs6rcclMxBf3OBdGsjU3L3NpTW0Rr2J2+MsyURBcbtk8Bnju8yGJC36Zvi89D
	 xebzjhSLX4oxrExwIJGuna+KzjR7NEb92ijcbT1I=
Date: Fri, 24 Apr 2026 17:44:16 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Leo Yan <leo.yan@arm.com>, Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kselftest/arm64: Fix build failure with GCC-15
Message-ID: <aeud4Hqxq4PNitMc@arm.com>
References: <20260422-selftests_arm64_gcc15-v2-1-c0134de8838a@arm.com>
 <aeuRfEeOUWEHzPix@arm.com>
 <63409143-f4eb-48c3-89de-1aef4fb57381@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63409143-f4eb-48c3-89de-1aef4fb57381@sirena.org.uk>

On Fri, Apr 24, 2026 at 05:07:42PM +0100, Mark Brown wrote:
> On Fri, Apr 24, 2026 at 04:51:24PM +0100, Catalin Marinas wrote:
> > On Wed, Apr 22, 2026 at 06:42:54PM +0100, Leo Yan wrote:
> 
> > > Building on Debian sid with GCC 15 fails:
> 
> > I think a better fix is to always define struct user_gcs and only
> > conditionally define NT_ARM_GCS (IOW, move the #endif higher).
> 
> I've not actually double checked that everything is wired up properly
> but I believe these days this should actually pick up asm/ptrace.h from
> the headers_install target so a current kernel copy.  We ought to be
> able to remove the local definition of struct user_gcs I think, there's
> still some weirdness with the NT_ definitions I can't remember but the
> struct should be fine.

OK, so it does look like it picks the kernel uapi/asm/ptrace.h. It
builds fine on Debian stable (no GCS anywhere) with including
asm/ptrace.h and removing struct user_gcs.

But I think we should include asm/ptrace.h in libc-gcs.h and not the
gcs-util.h header (for NT_ARM_GCS it's fine to keep in gcs-util.h).

-- 
Catalin
