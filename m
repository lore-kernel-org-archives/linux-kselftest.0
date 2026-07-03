Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC65E26CE39;
	Fri,  3 Jul 2026 17:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783098719; cv=none; b=L/XZmugMwKpeMCfuAt0qsedroFOBlZPVszPiVntjeAJBX8xcujuq/YKOcZvVhxLcRTtqi5v0HZrs2zR/0QrFB9QzFQ6LHwFgDZ+2CpUWXK/XlzCgL6Md3HT+GQBKJ7V0IGwcyHJ03SzavtIp1sA++EQ9CcgG9rfZfAw5d0YR0AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783098719; c=relaxed/simple;
	bh=PVGhc102ynLSuCQ40lxSCLYB5ht1swFOMOHchkaTU48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eMvAtGfmTS0UDL9MmGKMbe4aykjXBZNrMfwMci+7oHU3dIozqx23G/ka+/3y0cgfBCboN7x8VlL181xwW0BX0YY1XKjhaV7z6jL1A2b20ptfF0c17d7+xjjEYWJtXurTbWFKYhvWY7aXLjIl8cOB906Det65RXh9S1F7zxm6Gkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=KYlDRCMj; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="KYlDRCMj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pb7TrLeGqe0b/bNAlrMgjLIiLoh7aG16nEZVkpvvbWA=; b=KYlDRCMj9Z9aprfDoC0OuuVSUt
	aAt90CVAPXFkHFoG5hzBMuAaOMFhnK4O6WYD4bQ5KjvqtsctuFQren0WOJHa8Z3MKEOwD8xSNWxbD
	l+Zy2RkUqkCwYo9oltROgpA4pkfi0CkGZ5KT513lP/g2lv+35+LQGW3hNsANPA0ToQeNN0sEgZpGN
	xZpH2+pbgnWw473psp1hwBauahFCEmIYkhPDLNZdOHAM/sXqFheIjqSNkEtLrGEiM0QvX2sFxdPqy
	aqL2jhscx5y4MjD7KZd2TFmkTyPqZdp2oMrHXb2ZPjnSKYUzBirMeSDCid2bzcKtpaRyd4nnkqFiW
	/F4hDR/w==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wfhQZ-009YIE-2C;
	Fri, 03 Jul 2026 17:11:48 +0000
Date: Fri, 3 Jul 2026 10:11:42 -0700
From: Breno Leitao <leitao@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 2/2] selftests/mm: test kmemleak's N-consecutive-scan
 leak confirmation
Message-ID: <akfsldIW1US1d69C@gmail.com>
References: <20260626-kmemleak_twice-v1-0-ab28f7cc0971@debian.org>
 <20260626-kmemleak_twice-v1-2-ab28f7cc0971@debian.org>
 <akYkKgWOsYnw6ETE@arm.com>
 <akZ4tzQw70x3RR2D@gmail.com>
 <akeX8mFiizd65pDw@gmail.com>
 <akfNeK7OOpvoZE9z@arm.com>
 <akfYImSNDh3OjIfR@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akfYImSNDh3OjIfR@gmail.com>
X-Debian-User: leitao

On Fri, Jul 03, 2026 at 08:43:27AM -0700, Breno Leitao wrote:
> On Fri, Jul 03, 2026 at 03:55:52PM +0100, Catalin Marinas wrote:
>
> I will spin this "fix" separated (CCing stable), and send a v2 for this
> selftest with priming enabled.

Quick update on this plan. The v2 for this patch depends on checksum fix[0],
given it touches a similar code:

	@@ -687,6 +692,7 @@ static struct kmemleak_object *__alloc_object(gfp_t gfp)
		atomic_set(&object->use_count, 1);
		object->excess_ref = 0;
		object->count = 0; 
	+       object->unref_scans = 0;
		object->checksum = ~0;   <-- Adde by the fix [0]

I will wait the "Fix" to land first, before sending v2, avoiding merge
conflicts and being able to rely on sashiko to review it (instead of having merging
issues)

Link: https://lore.kernel.org/all/20260703-kmemleak_checksum-v1-1-5e0ab7d6966f@debian.org/ [0]
