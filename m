Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172A39443;
	Thu,  9 Apr 2026 18:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775759792; cv=none; b=oABixeDRZJkpmbdmz6ZmVj/q3y6jE4EvV0lL7GE3s9TeVTZyStp8ymrq5sNl2GPIg8l1VPIQSR6cIJTQzBV9KWp806Eto0aIOkLKFjEI9SGzA1FwHm7xM2t/lxyOkEeRdWocHQ7VyDk2RyiavTF63lmBn77HAgcslQvh1w0elyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775759792; c=relaxed/simple;
	bh=vhaTaS+I0ispCPoVsE0c6h4Z/axqbsHv07VodjiFYds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cKkGWfjck21BdMaOagtUUIPBqVQdXm0Zq7XHP6lx0hTRLtvfivY4Aj1iJ8LnV7gI7tXYBDKC7oe+JmukNcbVwaOy58QBTiforOP7D8XkbaBBrNPURgt25m7mx2CKHm+WRNlUZD1pYcl2mBBTU3DFw+Jil0cuMsTk6H8XrNCyr6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=gcOFdvwo; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="gcOFdvwo"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E35416F3;
	Thu,  9 Apr 2026 11:36:24 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AFC83FAF5;
	Thu,  9 Apr 2026 11:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775759790; bh=vhaTaS+I0ispCPoVsE0c6h4Z/axqbsHv07VodjiFYds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gcOFdvwoN1UmteXI/cDb4y9h1sxDsg847QlQiRGkj1TNEMD9/efui7tbWdMR85Cmr
	 DKVohDJdtYaMCXoadaIehRHCSb+gm7nMxpJrf1t8jxDdiIBSnER4relRqJlsQcAVXW
	 hApYiqqUcuGPD76n18LGDZfRqKePYx7XTMi2WqKM=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: (subset) [PATCH 0/8] arm64: Implement support for 2025 dpISA extensions
Date: Thu,  9 Apr 2026 19:35:02 +0100
Message-ID: <177575970227.3883927.939712260390088306.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
References: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 02 Mar 2026 22:53:15 +0000, Mark Brown wrote:
> The 2025 dpISA extensions introduce a number of architecture features
> all of which are fairly straightforward from a kernel point of view
> since they only introduce new instructions, not any architecture state.
> 
> All the relevant newly added ID registers are already exported by KVM,
> all non-RES0 bits in ID_AA64ZFR0_EL1 and ID_AA64FPFR0_EL1 are writable
> and the updates to ID_AA64ISARx_EL1 are all additional values in already
> exported bitfields.
> 
> [...]

Applied to arm64 (for-next/sysreg), thanks! That's only the sysreg
definitions as these are stable. I also applied the KERNEL_HWCAP_*
generation on a different branch.

[2/8] arm64/sysreg: Update ID_AA64ISAR0_EL1 description to DDI0601 2025-12
      https://git.kernel.org/arm64/c/b964aa8d68f7
[3/8] arm64/sysreg: Update ID_AA64ISAR2_EL1 description to DDI0601 2025-12
      https://git.kernel.org/arm64/c/bb5e1e540501
[4/8] arm64/sysreg: Update ID_AA64FPFR0_EL1 description to DDI0601 2025-12
      https://git.kernel.org/arm64/c/d74576b51ba6
[5/8] arm64/sysreg: Update ID_AA64ZFR0_EL1 description to DDI0601 2025-12
      https://git.kernel.org/arm64/c/bf56250f34a4
[6/8] arm64/sysreg: Update ID_AA64SMFR0_EL1 description to DDI0601 2025-12
      https://git.kernel.org/arm64/c/306736fd5155
