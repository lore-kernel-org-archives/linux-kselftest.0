Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6659C2E6116;
	Thu,  9 Apr 2026 18:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775759974; cv=none; b=UoTtGrjfLL+XIlNIcImPKdhnrIP02wmkjitXKgtmJzIsn+CJ/SDn15RITfST42NBCrtjjopQ9f2x/XzUI7mWNlmiz9DvN9GXBlfjj9rn3CkOv9t94KD6emhTai1f2b3ym/gqAjeB6f/I43pN+n/LZfKxmMMbYLvJtAYlH3cvMIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775759974; c=relaxed/simple;
	bh=eLtatk8dvIzX0/T6Px2m9HfmszgWad2HE0vjpwe8k0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pTeOXDQYL0ZLj+uQSYYGdh4s7nBg2MamhggIg3Krh0AEZLXGATv65ZLq3WVx9aM9IQRHPBhsHlwCWXOrvSPp5r8pyTCQCFtyt6uCZo2mFDJd2tNXuvHpLo1u3xYRVs8Mjqz7/4GUiVbGFfIgY5HiuVyhpH7K5ldRCagKZTiGwl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=okEE0Vcj; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="okEE0Vcj"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 395F52008;
	Thu,  9 Apr 2026 11:39:26 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A69853FAF5;
	Thu,  9 Apr 2026 11:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775759971; bh=eLtatk8dvIzX0/T6Px2m9HfmszgWad2HE0vjpwe8k0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=okEE0VcjD3VfA/NdFrDuLTa0Sb7Ye2SjTOINsQMHerFH2eedXEEKqDo2auD0EHVjr
	 Kpf0wJbUtnuBSuU2oJGRsJxadRLviyPNMmtalU8DAVC49LkMGtbQqJvsO8c3Ofg0Si
	 hF4OhUyVa1l7HhzkAePFJ5u8TEmN8UzAPLFjyziI=
Date: Thu, 9 Apr 2026 19:39:27 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: (subset) [PATCH 0/8] arm64: Implement support for 2025 dpISA
 extensions
Message-ID: <adfyX_jaVIKeSy_Q@arm.com>
References: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
 <177575970227.3883927.939712260390088306.b4-ty@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177575970227.3883927.939712260390088306.b4-ty@arm.com>

On Thu, Apr 09, 2026 at 07:35:02PM +0100, Catalin Marinas wrote:
> On Mon, 02 Mar 2026 22:53:15 +0000, Mark Brown wrote:
> > The 2025 dpISA extensions introduce a number of architecture features
> > all of which are fairly straightforward from a kernel point of view
> > since they only introduce new instructions, not any architecture state.
> > 
> > All the relevant newly added ID registers are already exported by KVM,
> > all non-RES0 bits in ID_AA64ZFR0_EL1 and ID_AA64FPFR0_EL1 are writable
> > and the updates to ID_AA64ISARx_EL1 are all additional values in already
> > exported bitfields.
> > 
> > [...]
> 
> Applied to arm64 (for-next/sysreg), thanks! That's only the sysreg
> definitions as these are stable. I also applied the KERNEL_HWCAP_*
> generation on a different branch.
> 
> [2/8] arm64/sysreg: Update ID_AA64ISAR0_EL1 description to DDI0601 2025-12
>       https://git.kernel.org/arm64/c/b964aa8d68f7
> [3/8] arm64/sysreg: Update ID_AA64ISAR2_EL1 description to DDI0601 2025-12
>       https://git.kernel.org/arm64/c/bb5e1e540501
> [4/8] arm64/sysreg: Update ID_AA64FPFR0_EL1 description to DDI0601 2025-12
>       https://git.kernel.org/arm64/c/d74576b51ba6
> [5/8] arm64/sysreg: Update ID_AA64ZFR0_EL1 description to DDI0601 2025-12
>       https://git.kernel.org/arm64/c/bf56250f34a4
> [6/8] arm64/sysreg: Update ID_AA64SMFR0_EL1 description to DDI0601 2025-12
>       https://git.kernel.org/arm64/c/306736fd5155

b4 ty got confused with two emails for the same series, so only one went
out. The first patch is on for-next/misc:

[1/8] arm64/hwcap: Generate the KERNEL_HWCAP_ definitions for the hwcaps
      https://git.kernel.org/arm64/c/abed23c3c44f

-- 
Catalin
