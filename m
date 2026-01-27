Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1353F3624CA;
	Tue, 27 Jan 2026 17:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769533483; cv=none; b=Nzy99Z9szafffBUfHRnP6+2AMRvQ7uYvtd3Q4CzbkcpMhqGvf6B49PZuJVjzws87EdKYrhPVfhaECtTYNQ5NxYDtFD6kxBmm3AVbVRrOUbwd8/ntMyGF90x3QZYFn3PxoaO+Slm0L51wW+hve8T79I+Nrqe7gtnW+RbHBJagf1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769533483; c=relaxed/simple;
	bh=YTCShUFzAaqSuSCHRFqs0c9DV4DqEpv+MFTFEQyHWgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BZvb9cWzjVVCbheGRSJMFQVmmtaJkb6wP6KYm4FNy6XNPuutUXN6NEcriGQK2fAZjlKBTl4gh8s3Quavf8INJ0bqRXb0pG+Id8AcHLJh7GAfSitA4qsbx29SWjwodwmfycAGDh9LmoF7nvKJHygvRjfm5aBJBzfKLn5Pdvg8Ydc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JLHsNhV8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JLHsNhV8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EFD1C116C6;
	Tue, 27 Jan 2026 17:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769533482;
	bh=YTCShUFzAaqSuSCHRFqs0c9DV4DqEpv+MFTFEQyHWgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JLHsNhV8srvXH2ZlFjDoHXST6eInOLIA2mrPFbzDx8Twwnq2yGK0YR6iYkROJqASA
	 H3ggx3lRQ1l4ucmB6WUJd4RDQJGpMHILE5Elf9RT3DV9g6MDRq8AnYcgolVZCLA1ww
	 UrqlQjH6lVMuYlM0WT+7PjNp94MhWz/dnd7nBQ2W7JgBcdRFV9f5Y/T3Ay+o22Gw2L
	 /x+bBMw3EvMJKEHznh6rY5W2pW9z7dONFmzer3vBhPO2N1f02HccBRAVZ0U03xAtkC
	 99QDuLmAxR34r+zOss4tpzFUlBiFVfELyjCGCpFz19alsui8E7qSjzSW1NTm9qBC+4
	 RvKSNBaaLwMZw==
Date: Tue, 27 Jan 2026 17:04:39 +0000
From: Simon Horman <horms@kernel.org>
To: Junjie Cao <junjie.cao@intel.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] selftests: ptp: treat unsupported PHC operations
 as skip
Message-ID: <aXjwJ-p47nn1GfYO@horms.kernel.org>
References: <20260126061532.12532-1-junjie.cao@intel.com>
 <20260126061532.12532-2-junjie.cao@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126061532.12532-2-junjie.cao@intel.com>

On Mon, Jan 26, 2026 at 02:15:32PM +0800, Junjie Cao wrote:
> Some PTP hardware clock (PHC) devices may return -EOPNOTSUPP for
> operations like settime, adjtime, or adjfreq. This commonly occurs
> with timestamp-only PHC implementations that don't support full clock
> control.
> 
> For background, syzbot previously exposed a crash risk when PTP clock
> drivers lacked required callbacks[1]. Subsequent work[2] made callback
> presence a registration requirement. As a result, some drivers (like
> iwlwifi MVM/MLD[3]) now provide stub callbacks that return -EOPNOTSUPP
> for unsupported operations.
> 
> When phc_ctl encounters such devices, the "Operation not supported"
> error should be treated as a skip (device limitation) rather than a
> test failure. This patch:
> - Adds [SKIP] output handling in log_test()
> - Detects "Operation not supported" from phc_ctl and returns ksft_skip
> - Returns ksft_skip if all tests are skipped, preventing false-positive
>   results when testing timestamp-only PHC implementations
> 
> Link: https://lore.kernel.org/netdev/20251028043216.1971292-1-junjie.cao@intel.com/ [1]
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=dfb073d32cac [2]
> Link: https://lore.kernel.org/netdev/20251204123204.9316-1-ziyao@disroot.org/ [3]
> Signed-off-by: Junjie Cao <junjie.cao@intel.com>


Reviewed-by: Simon Horman <horms@kernel.org>

