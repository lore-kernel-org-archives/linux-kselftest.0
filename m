Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD9D3C942B;
	Sun, 17 May 2026 17:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779039193; cv=none; b=BHLBXEG2H6ceE3b1o8nIHuO5/q5LcZv48cWnbCt2jnf05QEvQ0QfsqrIvHTv9Ah2XKHKcFudPSOwc0quOuxQCfnwJ3zqzoemqnnOOdR4xT1TnUgK8vDf8bL9267yHW7V7X6s+E7MKjD1OI4fvytGKeXQyYc3JOC0I3DWQWmlwgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779039193; c=relaxed/simple;
	bh=MfKwn2SskewqeDZpjMen9el97DJDPcfqGZU8duSRb4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tsflXRvmBB3D8eR9tD+lhd46bRjokHSudM4paK11xlArk/ykWszOieEPUkVX0+zCX7RG05o9W/0Q++q8LgqAUmfdEf2R4M67gGlR0e5yGTcKYadKdDroZfnSbZE1iiApMwmY6rysGG96DnUPFJCHMuUfE98DME1BoI1UrzV+pA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s2dxYeVo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s2dxYeVo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1C9C2BCB0;
	Sun, 17 May 2026 17:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779039193;
	bh=MfKwn2SskewqeDZpjMen9el97DJDPcfqGZU8duSRb4A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s2dxYeVoaZOazfHyFr5HmEW7yEF2kyENZxJLO/bkIVU+4YswTAsFte42VtYXPpwAp
	 MtiXJVjzK3d+sKMWBdG2ylnIFkyg2p3nCbnuoHEAd+Hl9tLlsD1bnHV8FWqBp6OPoV
	 9WDfFCEaxEkER7apciERu/epb8TpNRMc5JU8Pp7i33WFUAClkZpW54tXiz4HDyFsC0
	 CpaESd73RCAGj4mgv0psl0EnT+vo+NZWn/bsnaQS9hAvuI+kqkCC7QTWGMJrIrozan
	 brMnso4HosoEQucy47O1jFex/dzPDgzd0Zg/QeTqyxC3z3lL89e0+EYCIsqIiF9LIi
	 VlOFgH3C1ubzg==
Date: Sun, 17 May 2026 20:33:05 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net, dmatlack@google.com,
	kexec@lists.infradead.org, pratyush@kernel.org, skhawaja@google.com,
	graf@amazon.com
Subject: Re: [PATCH v2 06/10] liveupdate: Remove limit on the number of
 sessions
Message-ID: <agn70Rol6l0Okp9B@kernel.org>
References: <20260514222628.931312-1-pasha.tatashin@soleen.com>
 <20260514222628.931312-7-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514222628.931312-7-pasha.tatashin@soleen.com>

On Thu, May 14, 2026 at 10:26:24PM +0000, Pasha Tatashin wrote:
> Currently, the number of LUO sessions is limited by a fixed number of
> pre-allocated pages for serialization (16 pages, allowing for ~819
> sessions).
> 
> This limitation is problematic if LUO is used to support things such as
> systemd file descriptor store, and would be used not just as VM memory
> but to save other states on the machine.
> 
> Remove this limit by transitioning to a linked-block approach for
> session metadata serialization. Instead of a single contiguous block,
> session metadata is now stored in a chain of 16-page blocks. Each block
> starts with a header containing the physical address of the next block
> and the number of session entries in the current block.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  include/linux/kho/abi/luo.h     |  24 +-------
>  kernel/liveupdate/luo_session.c | 105 +++++++++++++++-----------------
>  2 files changed, 50 insertions(+), 79 deletions(-)

-- 
Sincerely yours,
Mike.
