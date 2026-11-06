Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974681;
	b=hBN+j8dzPX/mXiGV+xIQ1MIWWnk/VIX7f8SPn1FA/BQdDkZpYrN535S/A/AUvtwfHyop
	 y9AR0YP28l+rwiKkZN52l54GHUfmzLeZwosJqMRifFeSdzYxY8x91Dz8q1gx+hbwGw/1l
	 sq5Bxavrq8zxWEYVu5dOSYRbtk0ESwt5Wagxy3LHSysW4wlgzzzjbMy0fph3G5nDsntf+
	 Yf0B+cakfUIZtJLhNKYDpDoq5o0SDLDq+QfJ3Vgl33XzOBLIg9GiwJier8Rc2/P7ML8kc
	 FHWh1Fx1rWJ9qLOsfDzcJSaRdEMhZM0LiuvKCDf+eIl7eMvqZrTiknpZgIYUohPPR9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974681;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=CKIHf3OuOvVhhpjIT2Z7Y0q/g50O7bhUDTdoEBDp0pM=;
	b=4KJkfQhh1Gkl/VAQAOEEsjzxZTo+vAS403YnZmB7/uHTK/E5kymcRjAV5p9dfH27X1Cy
	 A5p0fN4l6VRueBnmkJuXjSGLJXLNSuRedS2cQ1KmDdi749RZWAR77eJH5yvDHcau5Ustt
	 W9Owot3n2wNZjRQhDBApXx4vckzyim4BUJW2vVdinn+IrwK+TXtA0rz83Cm/+poRu4Gxq
	 X70DSKcC+qq0XoMatrBaoo8ilDUJda8cd3io+M5/30UPWd3c8/EhWByRd+HTMdGr6+QBS
	 4M1vA0ROc4HyCzsF3T9OAH01p7GdPQM7FDSPOxXDeX7/owGql+i48sFqAldsBlTsIug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wk+SZxiM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4493F606A329;
	Fri,  6 Nov 2026 14:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wk+SZxiM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 880DA1F0089F;
	Fri,  6 Nov 2026 14:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974680;
	bh=CKIHf3OuOvVhhpjIT2Z7Y0q/g50O7bhUDTdoEBDp0pM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Wk+SZxiMm5gTpWtlAhHjoOQe/HhgStlQ9toblskRjXi8q7qfd6NHBiNw6XchB2NsU
	 0wlsp0v2HXwnkk+X5Tw7V1imz/B/XsJwAR2HOyZxWq8MHX8WfX63KY6OVx2WrJDrUg
	 bJou11opbt4I0rq2CxLnQBFEYk4rTVlVv1Ub0NGpEvsnMkuvTqjlcQF4H94fJaSVIy
	 BjrAKPAD0Md+/eJJK3i1A/S8qr/EpUFNrUO6kQTqPKTFwx4i6iD6KNBP0xWRotz7Ad
	 TE+DyscmrEDjGiKUft4vu5tloisCvjpC1tsGPE2K4UyIIYPpmTkOySzCIaBW6K6oGO
	 ZIfppdults0OA==
From: David Hildenbrand <david@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Sasha Levin <sashal@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@kernel.org>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
 Kiryl Shutsemau <kas@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261105171801.2189772-1-sashal@kernel.org>
References: <20261105171801.2189772-1-sashal@kernel.org>
Subject: Re: [PATCH] selftests/mm: add CONFIG_DEBUG_FS to the config
 fragment
Message-Id: <179397467526.9397.17872200045070830000.b4-ty@b4>
Date: Fri, 06 Nov 2026 15:17:55 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Thu, 05 Nov 2026 12:18:01 -0500, Sasha Levin wrote:
> The split_huge_page and gup tests need debugfs, and CONFIG_GUP_TEST
> depends on it. Add CONFIG_DEBUG_FS=y to the fragment.

Applied, thanks!

tree: mm/core.git
branch: core-7.5.misc

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[1/1] selftests/mm: add CONFIG_DEBUG_FS to the config fragment
      https://git.kernel.org/mm/core/c/194b6319

-- 
Cheers,

David

