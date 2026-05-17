Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452B91F875A;
	Sun, 17 May 2026 17:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779039247; cv=none; b=UoWSQOi3QBcKL1NG2morOtJ3db2pY9TjhZRwN7zRkbpcrDd2F1KpyGK/mLt82zqNnVWjSNZI6HKfFxI1Yr5U8z4HlPjcH9TLXiQcDKuwn6iQxVlVr944hrDHbYxCxm3eKqJKFYzM3PrV9U6cyWHuyblT0KmeKppMrgQkY6X70Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779039247; c=relaxed/simple;
	bh=b1CihbG6Lv3rAko83KCLGmjfW/rZKCyOv9GyH40QTlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZlmCiOSZ6T0hn1665K0iSQqOPp3hiRujWJ/Mnc0KI7XHmcOsGY3DyN+OOn+TLaRVAM9NPbq2eiS8SODZKsbHzCsxRJPI3V1nTXAwJEuc09u0/o8Oy+f/QK63dkuv/Uq1huMo6Gf24hCM/YEOz1FVXjF47CvUZEguBGzOCjBiCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LZ1GvY8f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LZ1GvY8f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1CC3C2BCB0;
	Sun, 17 May 2026 17:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779039246;
	bh=b1CihbG6Lv3rAko83KCLGmjfW/rZKCyOv9GyH40QTlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LZ1GvY8fdnO+l/zGvP4VDMRnDRsgS23EQXBw0Bhc9SCHNm2fQe7oCHrcfFa0Yayt8
	 4KLpNnniSchkf2IFw75iOUdlxhDlHwo1IIpx/7a/KudFTColN2WspHtOZnrvS/UbHN
	 MIxGswkl9C8QFvcc4zHB4n91IvOS45YuDM8TL0EVJbH6u0O1x4aGLtDsaA9VLfniHP
	 0PyAgLzCHJBByLBAs2QRtW1r1z94kc25XwF+iv4PgVhf1p5BT1yJjHpt2O2mOksKSo
	 53r3aUZnlbpowcIbUScvst4A/x4U6s+WapVuJwS8oLIrkSq0K/0YtK9/WVbPs4gjPA
	 dPI8qsdP8mfxw==
Date: Sun, 17 May 2026 20:33:59 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net, dmatlack@google.com,
	kexec@lists.infradead.org, pratyush@kernel.org, skhawaja@google.com,
	graf@amazon.com
Subject: Re: [PATCH v2 07/10] liveupdate: Remove limit on the number of files
 per session
Message-ID: <agn8B_OIH1fQjwa5@kernel.org>
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
 <20260514222628.931312-8-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514222628.931312-8-pasha.tatashin@soleen.com>

On Thu, May 14, 2026 at 10:26:25PM +0000, Pasha Tatashin wrote:
> To remove the fixed limit on the number of preserved files per session,
> transition the file metadata serialization from a single contiguous
> memory block to a chain of linked blocks.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  include/linux/kho/abi/luo.h      |  13 +--
>  kernel/liveupdate/luo_file.c     | 142 +++++++++++++++----------------
>  kernel/liveupdate/luo_internal.h |   5 +-
>  3 files changed, 77 insertions(+), 83 deletions(-)

-- 
Sincerely yours,
Mike.
