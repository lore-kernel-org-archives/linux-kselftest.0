Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794190393;
	b=eFDaPUjieteNriI7RK42GsCByitA5b0B+hzQi8Yzpb125ifrl3Dw/jMl5DX8eUoTRdTg
	 tTwjGb0NY0cFpX3hSkeIa8kzZluaVPsVpZoRzv3IYnR43yvoCH4Qga3xdwKfs77Mkaelw
	 VEOeLoovqb7PqQQtJlB7lc2ozHzNamjKHzmBw5zXcpt2hb+TA4/0iKMxo5jD6EFjOnf+u
	 QJ3EEmHZtUFz+T+M9i0+3aElA09B1c5/4C8bpdKcrg6VyjkICM0P4gm8FMfYczB3NXfVY
	 vSjS3MDvo/lPt+cpcQzST1KsLHXEVI1S/nBCv6O+XhIQDwbRzepAc9xrL021Jrsfasw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794190393;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=2Hrqs/JVKUcbfDET+jPKh8H9v2r5yy3K1PZrEbt8Ns8=;
	b=QE1LwSK9dOXL3M16/nlH4NBlAxoB5VNkto6fvRoGgzV07YHZmoz454r60Mrrsyo82ciy
	 3mgsIH4fiEPdcIGAG+buzz2LBy/zGGSmaLZhWLdUqFxOEbdOAV98BLTO66EfCI72SluLT
	 7jMrYgD7uzjdIJkCYbeW6D8LZtz4sZr2N1uI1Psgdkrr0C5HamN9sUure2sSQItNo3/og
	 c+DXTWBMpUtCij03G/MgkoYyk0SuG2EXQbofnN2lQhyT2wQX2xFeVCPowc/QyQgpUfDB9
	 5tSSX2VQgWumLOaezbPC+2qtGR1Mxb2Gbh0U9hLPkWVo9wsdHHlkEKR3xuquEx8127A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DjlQzerJ;
	arc=none smtp.remote-ip=95.215.58.40
Received: from mta1.migadu.com (out-40.mta1.migadu.com [95.215.58.40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F260606A322
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 02:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F260606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DjlQzerJ
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nunKtJw2pkzgi9VVF0VjIUIjGkEovgWbt7tbN/jur34=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794190390; v=1; x=1794795190;
 b=DjlQzerJmxVwZSoGIC5wn1fGAYeqaYdb0xmd0166dhd89K63DpTCiFCUxA3JOLHOCISkGpxz
 fCX+oGa3oTiS89WVQew6IaaqXTsUOWLtk7bDqIOQkpuHvSeWoCP0edT4f2oehSpnoOvuvKMuQlP
 dj2HW6m42/B01Se11MWUPnNE=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id f1189d88acb6bb10;
	Mon, 09 Nov 2026 02:13:10 +0000
X-Mizu-Trace-ID: f1189d88acb6bb10
X-Migadu-Flow: FLOW_OUT
Date: Mon, 9 Nov 2026 10:12:51 +0800
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Stefan Roesch <shr@devkernel.io>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 2/5] docs/mm: ksm: describe how smart scan picks the
 scans to skip
Message-ID: <avEsIwSBUFygAdq4@dgvxl46587.localhost.localdomain>
References: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-0-86be8fe77e7a@gmail.com>
 <20261108-bug-mm-ksm-smart-scan-align-skips-v4-2-86be8fe77e7a@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-2-86be8fe77e7a@gmail.com>

On Sun, Nov 08, 2026 at 08:22:51PM -0500, Qiliang Yuan wrote:
> Documentation/mm/ksm.rst covers the stable tree and its reverse mapping,
> and Documentation/admin-guide/mm/ksm.rst only says that smart scan skips
> pages KSM has failed to merge before.
> 
> Neither says how often an unmerged page is looked at, or that the scans
> are picked by the global scan number so that identical pages of
> different ages still meet in some scan, which merging through the
> unstable tree depends on.
> 
> Add a section on smart scan that describes both.
> 
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> Tested-by: Andrew Morton <akpm@linux-foundation.org>
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  Documentation/mm/ksm.rst | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Reviewed-by: Xu Xin (vivo) <xu.xin@linux.dev>

> 
> diff --git a/Documentation/mm/ksm.rst b/Documentation/mm/ksm.rst
> index 5a80573162def..f954d221e8017 100644
> --- a/Documentation/mm/ksm.rst
> +++ b/Documentation/mm/ksm.rst
> @@ -75,6 +75,22 @@ The whole list of stable_node "dups" linked in the stable_node
>  The frequency of such scans is defined by
>  ``stable_node_chains_prune_millisecs`` sysfs tunable.
>  
> +Smart scan
> +----------
> +With ``smart_scan`` enabled, ksmd skips pages that it has already tried
> +to merge without success. The ``age`` of a page's ksm_rmap_item counts
> +the scans that went by while the page stayed unmerged. A page younger
> +than three scans is looked at on every scan; after that it is looked at
> +every second scan up to an age of five, every fourth scan up to an age
> +of eight, and every eighth scan from then on.
> +
> +The scans that look at a page are picked by the global scan number
> +``ksm_scan.seqnr``, not counted per page. The unstable tree is rebuilt
> +on every scan, so two identical pages can only be merged in a scan that
> +looks at both. As the periods are powers of two, every page is looked
> +at on each scan whose number is a multiple of eight, so two identical
> +pages meet at least every eighth scan whatever their ages.
> +
>  Reference
>  ---------
>  .. kernel-doc:: mm/ksm.c
> 
> -- 
> 2.43.0
> 
