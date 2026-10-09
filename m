Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C280331EB3;
	Fri,  9 Oct 2026 17:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791565786; cv=none; b=nIo1sITI0ZOkKF00BRpkVwN0DN+ePUSm9LZNxh03HWvBnMc+5YMIC34+ttVsJL69qHyyrwEF1Xiep/rnPzY8VvmuTbXQ1C9AwQ5kJ/fSkN9qPp/PjGzrF/mMxi1P8avwFUshPsfUTw40ejxqxHw3h0BsGSYfp8fWZcGXLM4OS8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791565786; c=relaxed/simple;
	bh=L39BGipx8T/Si3gig56Sb6NQaW0bdVeLyT7Ys8WoqsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFesBfJ8DzqpSUgCEypTIjumx1JRacVBiL7Isef1cR7lxUL1z/vX5FaAib9URnoNLvW3jDTLqA0nsMlzqNrhBJlMUBIj+tnTzdVVf1ZsFXnix1G6IbfLAed1iYv5DmvNGOQ5dCpxI1Ue1srW6pnTbD7Vy/2NzPtJBhZGR3m8ujY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XYIr18xk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XYIr18xk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 765921F000FF;
	Fri,  9 Oct 2026 17:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791565785;
	bh=ZCni05apCN4AGczMKeaXj5fPa7qrOY0NPOadW6AQ6ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XYIr18xk/PfHlCiJ9uVydxG+LXkusM11uyVcteF+bHxB9w/ilw6rPRDbCeyVjbPx0
	 BvmfcTfqOVz+ZaWe5ws3WvvsV5Mqn3A/WZVrsCudMK4Knvvy9oAnK9e+6vWVo7p8gC
	 Fnrt+bw2Rwfbc1GFoYiGclga1LYr1uotDrB3j1JpFeBdwVpr1UTjii086tPjt/MON2
	 pfrmUrlNq75UDN19OUlB1Z5OLWsTvdpYrnlpEvEqS3kni+e4aBOVEG4Jyspy1Qk2/j
	 xgZJHSPYncdERMClrK1e1V6qSIb2PiBDDOcfdKBIUmDSxEEvawt14muDNX922jcbC6
	 vV103NQsAgrdw==
Date: Fri, 9 Oct 2026 19:09:35 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <nico.pache@linux.dev>,
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
	Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	Sarthak Sharma <sarthak.sharma@arm.com>
Subject: Re: [PATCH v5 3/3] kselftest: mm: introduce size_to_shift() helper
Message-ID: <askfz-q4KLY7QMKW@kernel.org>
References: <20261009-fix_hpage_macro-v5-0-54378ae45add@arm.com>
 <20261009-fix_hpage_macro-v5-3-54378ae45add@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-fix_hpage_macro-v5-3-54378ae45add@arm.com>

On Fri, Oct 09, 2026 at 02:27:34AM +0100, Yeoreum Yun wrote:
> Introduce size_to_shift() for future users that need to
> obtain shift of a huge-page which is other than pmd_psize().
> 
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  tools/testing/selftests/mm/vm_util.c |  2 +-
>  tools/testing/selftests/mm/vm_util.h | 12 ++++++++++++
>  2 files changed, 13 insertions(+), 1 deletion(-)

-- 
Sincerely yours,
Mike.
