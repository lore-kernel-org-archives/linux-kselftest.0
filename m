Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5FA38655D;
	Wed, 12 Aug 2026 09:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786525798; cv=none; b=n6R4kKKFQoro+o+pWAECdDlceNSDhrZbzVYoofvASW6z0YiSpT4rPk23+FlgM3UN8geW3nCKDS2Niqphm2oHE5Yb2hoq95R3ZoMazqpVPovYxmz7BdTrtvBtdUIQ1wfhYsN3NnuKzA+QGuPwC00i3f/VdJIKw2EC7xyKQ6Ti8ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786525798; c=relaxed/simple;
	bh=LX8Nh4wdVXX5g3het+SjjqM7M/nDJ5ubrty1R5Hixk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YtoeclxHB/1wDrznF2HYXf+3WSgyOUD3bx71TKNLvEXn9iLCNpM+M5dpW3eDyAMw43OxvRgk2VyJf6ElrmXKfhSx5kQs1TapFdzduzPJYE3f75VYF6AC8Lk063jJarirJtw9SuSe7bMO9YmGeXD7RT/nD/aiSsxWuX9gOF/gc7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jxqYMvlB; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jxqYMvlB"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 584BC1596;
	Wed, 12 Aug 2026 02:09:52 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24BBF3F673;
	Wed, 12 Aug 2026 02:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786525796; bh=LX8Nh4wdVXX5g3het+SjjqM7M/nDJ5ubrty1R5Hixk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jxqYMvlBkL3ncKNzC5/Wt3s+N1Vc7pWerEEOg8PZJaipFROgrZRoMpbWvDpofPFLR
	 s0vjhD4OwtyjE/rLqRP4hXsO8POma4XhGEff6gnzOby5sUW28kyUEgw/5h0WazM7Vw
	 bJLPpIq8eAfXlMyZoOK1JErGVSa4CgFUY/ujiZ2w=
Date: Wed, 12 Aug 2026 10:09:51 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 3/4] mm: kmemleak: factor leak confirmation into a helper
Message-ID: <anw4X4mkepgo2-p3@arm.com>
References: <20260713-catalin_pto-v1-0-5b93b1131089@debian.org>
 <20260713-catalin_pto-v1-3-5b93b1131089@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713-catalin_pto-v1-3-5b93b1131089@debian.org>

On Mon, Jul 13, 2026 at 04:48:06AM -0700, Breno Leitao wrote:
> The reporting loop in kmemleak_scan() decided whether to tag an object as
> a reported leak with a four-term compound condition whose last operand
> also had a side effect (++object->unref_scans). Mixing the candidate
> tests with the counter update made the check hard to read.
> 
> Move the state transition into confirm_leak(): it returns true when a
> still-unreferenced suspect crosses min_unref_scans consecutive scans and
> is newly flagged OBJECT_REPORTED, leaving only the reporting bookkeeping
> in the caller. No functional change.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
