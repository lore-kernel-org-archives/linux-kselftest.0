Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304332BDC0F;
	Tue,  4 Aug 2026 00:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785801675; cv=none; b=fVZuXzSvxVIJSEP352TYBKX6Xe2rTso6R8oO37aV1vzGvYKFS8RIMlwAV5wHm6JSGV7+iCePCshSsseC2NeHpjAcAsMvGO4olVby81gI341VZg32sKRRrwWWKWcgcFW/tHYWHQYugxBhnDWy/x8sGCjIdwB8aIoJ81ZnNUnff/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785801675; c=relaxed/simple;
	bh=nMYK6k+wFeqrg0JetasvD3tO3vUkpRQ72piDvrTYtik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fzS6orIC0WXlGprP7LTSmb49Of7IAiniR78JMIZmwfkDTj5E4xxGnbaFXVw2Y/0KaX6fML/dAP29ceimF3uGBA2RuuBiZ+zdfPKeSQWW6LZSZHjoPynjNBJXY2goNmmYujb34h9p7DC57VL8X857vbLJ5EsomtXIUSxiTu1xYns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IlBFQwNa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IlBFQwNa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E7141F000E9;
	Tue,  4 Aug 2026 00:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785801673;
	bh=SrYwbPOy2yIk5FHEvKwglgY2XVDGPUlhU0jiXIg5xrg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IlBFQwNaqpm7L669/HlLVm5IY7RK+ZyhVhr2wlWZcfE2ruqfov3HOSfpBdMGygSEL
	 Mz5IxyTYcIE6mmym7kFHlk78ECyss49H3UmlJs47PvjVEABPcuZonRYiaIXkz7wSgY
	 vNxxceaNwYYZHRCewK1dgDKvO8eKikO4KniSDCr08v6CMzfHQgqbUCR55bMew/oOj7
	 LlZqfTJusXGFaiqbWnp7uKq9ObcF8BDR1KyyztH83FOQCxN/dblA4HlOG9qbFGUo1z
	 nN4wttmEw/3SMvdeYuH/JFNGblzW7mLMi5693/7fHWMEvYKgw1a5DTC2kJPAMpHDnR
	 Q6JoNH1Nk2H/Q==
From: SJ Park <sj@kernel.org>
To: pratmal@google.com
Cc: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Sarthak Sharma <sarthak.sharma@arm.com>,
	Yosry Ahmed <yosry@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Liam R. Howlett" <liam@infradead.org>
Subject: Re: [PATCH v4 2/2] selftests/mm: use pattern matching in .gitignore
Date: Mon,  3 Aug 2026 17:01:03 -0700
Message-ID: <20260804000104.88098-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260803221732.3651981-3-pratmal@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cc-ed Liam's up-to-date email address.

On Mon,  3 Aug 2026 22:17:32 +0000 pratmal@google.com wrote:

> From: Pratyush Mallick <pratmal@google.com>
> 
> The current .gitignore hardcodes each generated test binary by name,
> requiring updates every time a new test is added.
> 
> Switch to the pattern-matching approach similar to KVM:selftests.
> Ignore everything by default and then allow source extensions (.c, .h, .sh)
> and tracked non-source files.
> 
> Note that local_config.h was renamed to local_config.h_gen in a previous
> patch so that un-ignoring *.h files does not cause generated build
> artifacts to become untracked.

Looks nice and smart to me!

> 
> Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Suggested-by: Yosry Ahmed <yosry@kernel.org>
> Signed-off-by: Pratyush Mallick <pratmal@google.com>

Reviewed-by: SJ Park <sj@kernel.org>

> ---
>  tools/testing/selftests/mm/.gitignore | 71 ++++-----------------------
>  1 file changed, 9 insertions(+), 62 deletions(-)

What a lovely diffstat. :)


Thanks,
SJ

[...]
