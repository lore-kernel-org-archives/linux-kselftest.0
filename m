Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794080896;
	b=e+X8zRjHSZ4/YUiiy6toyq5/iY/lluENolgZEojaMG8LavQZqrgzIFYDJ7jITJNu6Fjo
	 y3t+mcG7OJV/iUgjqCOqw8qabVuxGbxMPqgbxSQFLUMfFjoR67sRnRbqGrGmKfS/kCSnM
	 J2xiP5wWDyXob+/5H/UbKQXPkyyX8EW4Ye6nUJShamLIu7NZDqB6tS72B2B3NVLNfXYl4
	 Fql3WJhrZWMpmNAzAyVm5bLaEAnTp0fBsfJ9+ByRa3eey2kWIyS+GZm9lMtJoSBu8BmGJ
	 DjCDIb8+Z7fbBEPn0J8gKnOzBlSfb3utiSmndIJ1DrQ835rmzGAROMwlG3Df05RCRhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794080896;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=PgfupnOI9y63nTPBwUuVBVA9ftyhpGgpL4SadbS98oM=;
	b=vESpW8MByV/roQP+nP5rLIpnGFqhBkrWUdCj1rC3arNAk+LAuks4X1gkjNsz8rxtGzI/
	 kgHu7yQRZmuyQ1EISHPILQJfdCaPrHGQLb5vIvckYXuKr5gsFVExH5AQZLlb+XMGswBC/
	 kAGNSwENxCPeDNzyxHzywzruBlcCUT0u9RxLpAKii1ttTJL9WwUUra/MIBGRNLJ8ePflC
	 6SLr2P6eqN5oVMEHbL8QIR2nKwOOn+pRpX8DI9dwF5kBtu5l+7Lbw6E7GB98HDf6JK2k0
	 k+Rd245C276ZV2J49ngpaD/VdqKsN2vlYkl5/uu2TsofNBA3/OnmUpERrFc9qMdWskA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="A97LRtV/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DE9606A32D;
	Sat,  7 Nov 2026 19:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A97LRtV/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5808D1F0089F;
	Sat,  7 Nov 2026 19:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794080896;
	bh=PgfupnOI9y63nTPBwUuVBVA9ftyhpGgpL4SadbS98oM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=A97LRtV/UUHCQnkUrvGqtIgzlx3uxP7kbRD8h5sUFLlcyZ7oYisz4YMCY6RSdd6Sm
	 aGMqDDuK6P+5x9Seobd4qsGICa4HESW+Cz/F1qLcDQzVfMsYE6L5a7c8cXt5TqjdlB
	 4dhzoAL1Y52RPCY0ERC7LzQSxATD+urOPRwyUDyWq3EdlK73K/izVvC8jaUQ3IJSpR
	 +0HtFI4/RzJ8QAlpH5i5TJbibWEyZoUuLHW3ITklZGXyjWFSogroDc/g9fHJqQeoAZ
	 ZVGRJlud74lr1UcNyWAVexAmqn9fxBB6cWjp08cpvKEPWyNrZ3ikNWMFnA5vG+z/3y
	 PVLi6hgK3gFzw==
Message-ID: <fd2faf21-ce9c-496a-9bd5-4d8334cf5f13@kernel.org>
Date: Sat, 7 Nov 2026 20:48:06 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] docs/mm: ksm: describe how smart scan picks the
 scans to skip
To: Qiliang Yuan <odys.yuan@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Xu Xin <xu.xin@linux.dev>,
 Chengming Zhou <chengming.zhou@linux.dev>, Stefan Roesch <shr@devkernel.io>,
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
References: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-0-16d5ce8b5fd6@gmail.com>
 <20261107-bug-mm-ksm-smart-scan-align-skips-v3-2-16d5ce8b5fd6@gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-2-16d5ce8b5fd6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/7/26 17:57, Qiliang Yuan wrote:
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
> ---
>  Documentation/mm/ksm.rst | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
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

Yeah, much clearer, thanks

Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David
