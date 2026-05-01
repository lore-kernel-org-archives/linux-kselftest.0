Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC303F23DD;
	Fri,  1 May 2026 16:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777651951; cv=none; b=MKqq45VBPmSsjqvmYRJ0R9SMd/mlcQK6k61/eLMucVE/Stz1tK4061g1ubaNxIyHHiTEfBT/Wg1pMNplWkZygQcYsDK2C9qeudtSn4Rpq/jxNN5hoiHjoPT6f8CrtiBGB7Wn34z9aAUeooEc5i/xW9t49feeZo3qIB5rbVdIofs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777651951; c=relaxed/simple;
	bh=FtBtOxZvtGvKVPXrUeKJbvmPCYJAAULmrd5Bql1Cxps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hzpu/dvoBX267CAcAaDhz9dnLKiSxslTRZ8E+oAPkw3NDzDGPpvgL9NAmHqBwS5Y6QvcBw5biUle9vaztWepCR33kIKRmmq/q3RW5Pf3yqTxtmBREfLZkv4xDFOcgDwDsTEYGWGIDNt8s5MZ0sBN1MIIjAJ4LrTAqJGrmHweiSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=WGrCZJb2; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WGrCZJb2"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A16641691;
	Fri,  1 May 2026 09:12:14 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D55653F7B4;
	Fri,  1 May 2026 09:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777651940; bh=FtBtOxZvtGvKVPXrUeKJbvmPCYJAAULmrd5Bql1Cxps=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WGrCZJb26uUArH9CX2HyLE4lekYG9COjNhDSiOtGW+CDCTeS3tRDOwbt0/FE2CkFl
	 nuY/hSjv5WlgoKtQJLxdNY1BlyoZb7RC9dj4Uzl+v3KY525NJ1NRnIZwvULoF06Ryk
	 GrEnyAktiVbDd6TGrqqj8J2VG8TllC8GMtHLkMBA=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Leo Yan <leo.yan@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] kselftest/arm64: Include <asm/ptrace.h> for user_gcs definition
Date: Fri,  1 May 2026 17:12:12 +0100
Message-ID: <177765193276.1028853.10273937865638236209.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260429-selftests_arm64_gcc15-v3-1-7fd68be56b83@arm.com>
References: <20260429-selftests_arm64_gcc15-v3-1-7fd68be56b83@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 29 Apr 2026 15:30:10 +0100, Leo Yan wrote:
> kselftest includes kernel uAPI headers with option:
> 
>   -isystem $(top_srcdir)/usr/include
> 
> Include <asm/ptrace.h> in libc-gcs.c for the definition of struct
> user_gcs from the uAPI headers, and remove the redundant
> definition in gcs-util.h.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] kselftest/arm64: Include <asm/ptrace.h> for user_gcs definition
      https://git.kernel.org/arm64/c/bb7235e22688
