Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B4F32E7165;
	Fri, 24 Apr 2026 15:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777045891; cv=none; b=mTwNzO/N6dTV1ifqI8LjxTajVIeObJu3AID9gQFCXsb2qKce1/2c9reyxmR7rR5oLv+MuIqPGK+rwTXbkFnAJsrjY1cYrjNa4tNzCcQMBvPDA0ODrF+wxyjG3pgjD4qEu0E8UN9mMLL0UCusD/7SwVfcLQlf+JZ6Q4/sA4kGgKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777045891; c=relaxed/simple;
	bh=NC/mMOGrg8wY36a31hnnuUB+YEhuJPHUoFBs5yStwWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=srqYaRYEGQ8zQOhvXj4N5RBKPUvV0vmaziefj2UdX98s20VCav9NVl64HSjA1yTgs8XvWJjdOqeBgGhcFMO1WWXjHiIJr7NHObKIIKcZNmhjS+hEuf52LE2RP2HvkK/r35xlsedXn7Wup3KXEOdIYVrjLwSYa7S/w9WEC+kSwKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=d61djaKJ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="d61djaKJ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1AC18358D;
	Fri, 24 Apr 2026 08:51:23 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A1253F7B4;
	Fri, 24 Apr 2026 08:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777045888; bh=NC/mMOGrg8wY36a31hnnuUB+YEhuJPHUoFBs5yStwWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d61djaKJSu2S/PBDlhMBtiPsVG0Ltr3lfMEBD58Pcv7/JiwCkGHLqzvF8aemlAt2B
	 8J8BUV1MzkgXSOHQE5Dw9OC5mATVPGW6lrVCedYJlxPw1k+c8AnL1NGA4MJ8AzEknL
	 q15plqZe1mS1LYkh3ryLptk8LKYYApQD+NCRA18M=
Date: Fri, 24 Apr 2026 16:51:24 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kselftest/arm64: Fix build failure with GCC-15
Message-ID: <aeuRfEeOUWEHzPix@arm.com>
References: <20260422-selftests_arm64_gcc15-v2-1-c0134de8838a@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422-selftests_arm64_gcc15-v2-1-c0134de8838a@arm.com>

On Wed, Apr 22, 2026 at 06:42:54PM +0100, Leo Yan wrote:
> Building on Debian sid with GCC 15 fails:
> 
>     CC       libc-gcs
>   libc-gcs.c: In function 'ptrace_read_write':
>   libc-gcs.c:142:25: error: storage size of 'child_gcs' isn't known
>     142 |         struct user_gcs child_gcs;
>         |                         ^~~~~~~~~
>   libc-gcs.c:142:25: warning: unused variable 'child_gcs' [-Wunused-variable]
> 
> For GCC-15, NT_ARM_GCS is defined in the libc header, causing gcs-util.h
> to skip its fallback definition of struct user_gcs. This leads to the
> compiler error.
> 
> Fix this by including <asm/ptrace.h> to provide the proper definition.

This is not caused by GCC-15 as it doesn't provide these headers. AFAICT
on Debian we have NT_ARM_GCS coming from glibc and user_gcs from the
kernel asm/ptrace.h uapi header (linux-libc-dev). We also have
NT_ARM_GCS in linux/elf.h as part of the kernel headers.

While the kernel exposed the macro and structure in the same commit, I
don't think it is required distros to align the glibc macro with the
linux headers. Glibc does not even use the kernel's linux/elf.h for the
macros, it just adds the definitions when they turn up in a released
kernel.

So you can have a glibc that defines NT_ARM_GCS but a linux-libc-dev
package that is not up to date to include struct user_gcs.

I think a better fix is to always define struct user_gcs and only
conditionally define NT_ARM_GCS (IOW, move the #endif higher).

-- 
Catalin
