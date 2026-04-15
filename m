Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E5D393DCD;
	Wed, 15 Apr 2026 08:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776240599; cv=none; b=o69KLZMmexIjYGBhwmagOZoN9hDSazQoFu+wfIaw8IY+ZBGyh+uxB7fiAOF55AG2T8zqQfFDG3xGfrl+WG94aFifXfxSSvCBDkU6edivmg9jKGBpA4+kELxmz8CV4BGJMyhsZkeiAEXAXp5nuQojGmdwFJ3/hH2zShbtzxalCUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776240599; c=relaxed/simple;
	bh=OXrb+0YI5chogZ453hZG4hR0T4d+2x4jCT8A9v7REVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wj7v7D5qt29X8lTgZEH1MDZy/8CAIgXwf6qJyXFWiGh5Oz5aFG2e37cjYW4bzhILjk8Hmv6bTL4WFJ8qTj8N+z4vCfx3hi4RLOKTbUx8gda8oHdsgXYYysAikBqXe8gNadysTnGM0nEBuKwG06JwqYLJPeCub0qWnOiOcA7ogAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=HD4JJ/1G; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="HD4JJ/1G"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C35494FBA;
	Wed, 15 Apr 2026 01:09:50 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DF5E3F86F;
	Wed, 15 Apr 2026 01:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776240596; bh=OXrb+0YI5chogZ453hZG4hR0T4d+2x4jCT8A9v7REVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HD4JJ/1G1kgD5UVmQwAX6OSbffYQA+GeAIj1cX4zpoPJddLjAn0JJ0f5SH+Ixvu0u
	 gok/JlYNdFMj98h6jjaoZcEIj+KI7YWSWcwQ2k5ItHWLdEFYFc5tyWpq90r1qcEgcU
	 4/sDp90N1D9VmffyTc/0YYUYZTWazFBu0pE2OjsM=
Date: Wed, 15 Apr 2026 09:09:52 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/8] arm64/hwcap: Generate the KERNEL_HWCAP_ definitions
 for the hwcaps
Message-ID: <ad9H0BiD4le07P-a@arm.com>
References: <20260302-arm64-dpisa-2025-v1-0-0855e7f41689@kernel.org>
 <20260302-arm64-dpisa-2025-v1-1-0855e7f41689@kernel.org>
 <8745494.GXAFRqVoOG@steina-w>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8745494.GXAFRqVoOG@steina-w>

On Wed, Apr 15, 2026 at 08:24:22AM +0200, Alexander Stein wrote:
> Am Montag, 2. März 2026, 23:53:16 CEST schrieb Mark Brown:
> > Currently for each hwcap we define both the HWCAPn_NAME definition which is
> > exposed to userspace and a kernel internal KERNEL_HWCAP_NAME definition
> > which we use internally. This is tedious and repetitive, instead use a
> > script to generate the KERNEL_HWCAP_ definitions from the UAPI definitions.
> > 
> > No functional changes intended.
> 
> Somehow this change causes to delete and generate kernel-hwcap.h on each
> make call. This results in compiling essentially everything each time.

Does this fix it:

https://lore.kernel.org/r/20260413-arm64-hwcap-gen-fix-v1-1-26c56aed6908@kernel.org

It's queued, it will go in before -rc1.

-- 
Catalin
