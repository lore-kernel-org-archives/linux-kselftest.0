Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B9031F995;
	Wed, 22 Apr 2026 17:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776879673; cv=none; b=Hwv0mI9w8qeAQMsR+oyLfjv3w4C0pnaYlkAmVw+od1eL211NQSgBlaFagoKYjk6KU0gTiY/8r4KoVsQqqBt54C5aHDeN8xY1G1hdFYyCCLk3Qbjh0yUYeZrodnsEtWjgxrhTGqxIwdKvtlBdN0uHgVYAXjyWswgOOCc7s9A5/Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776879673; c=relaxed/simple;
	bh=SDXmukG7l7h+xJ1AEJmVhi1UVR+p1wd9EMCwF0OlEAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MT+JGSqq0wFKtmUMa1Ja4k99I5FfjX6h+Fm1RXNREAwPorIicxDcMyyES/+r7ECEeHrmFJKyZXBHWLnh4B00QaYOCgfD+yw5PPKprO6cdMgScpMx1KIVoD0PpRvmNfmRrTUFRtg4r8ETSvwr2qQURP1KSAVlIFIbvT9GCzx/pIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=hfRgKZX3; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hfRgKZX3"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9FC61E4D;
	Wed, 22 Apr 2026 10:41:05 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81E6A3F641;
	Wed, 22 Apr 2026 10:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776879671; bh=SDXmukG7l7h+xJ1AEJmVhi1UVR+p1wd9EMCwF0OlEAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hfRgKZX3uEiOFEV7kY9Tay4H6mKe7cEnZc+dLtZ17e/cVfUpxNOtyVv5GSaCnhB8/
	 d1830fmzO+7o0rk5z8b/52msFbm7i/EqyrjBrz7PGTAN/lgjNuckZcPh3kYjunr8Sh
	 z2MAZ91z8KEHFYiP5PHsRy1wgqokSUgeT+QyjAnI=
Date: Wed, 22 Apr 2026 18:41:08 +0100
From: Leo Yan <leo.yan@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Fix build failure with GCC-15
Message-ID: <20260422174108.GD929984@e132581.arm.com>
References: <20260422-selftests_arm64_gcc15-v1-1-0d919ea5ac5f@arm.com>
 <8690e67b-3637-45de-8956-e27486470866@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8690e67b-3637-45de-8956-e27486470866@sirena.org.uk>

On Wed, Apr 22, 2026 at 06:20:16PM +0100, Mark Brown wrote:

[...]

> > +++ b/tools/testing/selftests/arm64/gcs/libc-gcs.c
> > @@ -16,6 +16,7 @@
> >  
> >  #include <asm/hwcap.h>
> >  #include <asm/mman.h>
> > +#include <asm/ptrace.h>
> 
> Shouldn't this be in gcs-util.h where the local definition is?

Will update commit log and this one. Thanks for review!

Leo
