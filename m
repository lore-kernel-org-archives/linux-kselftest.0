Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33A3175A8B;
	Sat, 18 Jul 2026 00:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784332815; cv=none; b=brdFbDPu6QMGx/i2/sdzrWumFxYQHqw0TB7cdeUKuIGhTvg1G4352Do5i3wsepg5m8eGkAjaUDJk6mTlVvZM03QAnJhqkiuaT4KgZLS4ufMRXAgzUB462t4xLfyHBEuIH0IZmzuMmgzf2EQzGqQbJQlOTbLgOvOaIVAANcelfxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784332815; c=relaxed/simple;
	bh=S4MjSJH8kKZ5cbatkGmWZOhsb/FhATKRz9HOMUbArYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lsFFkxOahuO7/wsORbXhdXxeilpOF75joFbV7C3gr+l1TvmRSzlXvui2Tr4OnoqYjigEdiiQw7mXg+XWxfUR77zb2jcaLUO4EggdvPcsseXTM1vqEsWuvvR7ZU+7JnDmU+HXIxBLbxWFsc+jelYQGpm2tJZQ9OKWk+EtvJMTEIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CiHGZQni; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CiHGZQni"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117AD1F000E9;
	Sat, 18 Jul 2026 00:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784332813;
	bh=vx/1W3ASfCVSI1+TnaFoLicuyre8k2pmNf54ghLrbFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CiHGZQnihy/9CHtgE2dzXcNtjhnY8ODCogd+7UndlAkGpnJ2bb1JAElCFAbo0FHMK
	 4VVFWkymezZgoYcdFBFTTJqFXRhPVI4b/M21qR6aAvCKVQsT0Gcav3gRLQtSPylB+j
	 PMDwY2bEvzNmCcbdwL9aF7a8jVy/NNd9RbSNxVdFA5iY1Qy4+eOQ3GPvIaDl8yd6Ae
	 x5GN3PygEIWU6v6lbSrCxbng3EbgUwISSxq+nbcrQ64K6RhGGJjDXpk+qWtIikFzCs
	 537GY8yikzEGB6YZlso3AWqySHeeVj1RsXrRZVBGv36KC3Bg8slcyRkovweMfunv48
	 Vr9cwPpywSmJA==
From: SJ Park <sj@kernel.org>
To: Hongfu Li <hongfu.li@linux.dev>
Cc: SJ Park <sj@kernel.org>,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hongfu Li <lihongfu@kylinos.cn>
Subject: Re: [PATCH] selftests/mm: Fix BUG_ON checking wrong variable in mremap_dontunmap
Date: Fri, 17 Jul 2026 17:00:09 -0700
Message-ID: <20260718000010.85576-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260717070251.73212-1-hongfu.li@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 17 Jul 2026 15:02:51 +0800 Hongfu Li <hongfu.li@linux.dev> wrote:

> From: Hongfu Li <lihongfu@kylinos.cn>
> 
> In mremap_dontunmap_partial_mapping_overwrite(), mremap() stores its
> returned remapped address into remapped_mapping, while the BUG_ON
> incorrectly checks dest_mapping instead.
> 
> If mremap() fails, dest_mapping still holds a valid pointer obtained from
> the prior mmap() call, making this BUG_ON never trigger at all. Correct
> the check to validate the actual mremap() return value stored in
> remapped_mapping.

Nice catch.

> 
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
