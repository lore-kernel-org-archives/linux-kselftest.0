Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426588;
	b=3PntGXyv+fhKg8ZcoX9T6NVjRdBeLc4MWOkNtg+fSjqLis7QXEq8WB1RRVq7urbgFLoD
	 lpiQAbddubqS+q5cOYBZFgHGU+069m/JG01nau/DWIpUu61WOy1fXQf2O1/874I6cYV70
	 /RtWCcm44GPeHfkZU2LH9me1tu2P+8rO+EW71jAnbhi/4Wmwi4cKRMpO/ZcyUW3D35V4I
	 KU3lVS9CRQ+BtxWEtbOQpFXh5QK8hoQzL2a6bcBgFtRgYkaEWX24dinH1gZu8hmGZJuJ4
	 VnnDjYZIgLtpF+r6mmBePYaiGgljlB5dK/9WV3K+VfsYnATqPe9a0YwBFiQnURGwnnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426588;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=zrvPkJULyEyiiTV7s5r2ZxB5yrxXRBtYdQX97+mN3Qw=;
	b=ZDPN3C1gca8l7S4fRG++1oOAf3TOoqQN3mshQFWUKXXc6WcLm9IM3GsDIKS8fzEYLQW6
	 XJGs1dvfcvuYuqI1Q4AYRf6iIjupaqf/BN4+XPGJjkLltAkHag6L8ldfWirTXXLKfT3j5
	 LFP4QfuVpZrg8LC4myuCKujmSVYjUv8lurOuZuUbTAPvfhWQa64O5PZvIp6ZLxluE3osu
	 XLj8TlC6lIvmkrYBYNGAxoyEIKXBYj1cThBaW7feccuD+3h2U6qwWWsWdkZUzQCXWaQdc
	 W2wot4d5uxZTHjyCDV7T9umD+A2oF7FON0VHgzx4AO0sENh1ic81pULGIU1O8bXNrqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Avl+JJgH;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C91E606A31C;
	Wed, 11 Nov 2026 19:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C91E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Avl+JJgH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zrvPkJULyEyiiTV7s5r2ZxB5yrxXRBtYdQX97+mN3Qw=; b=Avl+JJgHnfZt5VxJgZOf12120G
	P1BzDPzgqQruxE1dTjcEezmt45xaOjJNw/FXIl94c6SOcW+WFg2gXY8/SSm6BY3jQckDwyVcwbGSy
	/5Vk85yvw93AjywByPWi8S05ojcDoGBj1Sx7Y+NdRdW6uuNXeCGMA7ltQVNjSyKoLpEqoD7gtxqFv
	y+DkEDepySNk9YjNdBPwxmlP7KRwfsx6TrrcqVtQDO9urYOHNRyhfNxJDtJDGRH1ZDC0g6qaBUGQn
	riwWO/ZaZpWqn79A327n5cHZEtTwEdYDB4aFcaBGyRdR+6BeXKInaY6qSD2HGVmxLJBMxyyVnTAsL
	LkqDOFtg==;
Received: from [38.23.173.23] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xREKJ-00000007ZIj-0Mya;
	Wed, 11 Nov 2026 19:49:47 +0000
Date: Wed, 11 Nov 2026 14:49:44 -0500
From: "Liam R. Howlett" <liam@infradead.org>
To: Hongfu Li <hongfu.li@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hongfu Li <lihongfu@kylinos.cn>
Subject: Re: [PATCH] selftests/mm: mlock2-tests: fix fclose(NULL) in
 is_vmflag_set()
Message-ID: <t4vjvdkdvmqcagvhw7z3p2x67p3iopcjqllrapwrzd7qyothb4@un6bq6otzb7w>
References: <20261104-for-mlock2-v1-1-57e6dd74c2bd@kylinos.cn>
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
In-Reply-To: <20261104-for-mlock2-v1-1-57e6dd74c2bd@kylinos.cn>

On 26/11/04 04:49PM, Hongfu Li wrote:
> From: Hongfu Li <lihongfu@kylinos.cn>
> 
> is_vmflag_set() jumps to the shared 'out' label when
> seek_to_smaps_entry() fails. smaps is NULL on that path, and the
> code at the 'out' label calls fclose(smaps) unconditionally.
> fclose(NULL) is undefined behaviour, so the test crashes before
> it can report a test result.
> 
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>

The sending address should match the sign off.


> ---
>  tools/testing/selftests/mm/mlock2-tests.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/mm/mlock2-tests.c b/tools/testing/selftests/mm/mlock2-tests.c
> index 144b550813a6..85e6cd24515a 100644
> --- a/tools/testing/selftests/mm/mlock2-tests.c
> +++ b/tools/testing/selftests/mm/mlock2-tests.c
> @@ -66,7 +66,7 @@ static bool is_vmflag_set(unsigned long addr, const char *vmflag)
>  	smaps = seek_to_smaps_entry(addr);
>  	if (!smaps) {
>  		ksft_print_msg("Unable to parse /proc/self/smaps\n");
> -		goto out;
> +		return false;
>  	}

This looks better.

The next function is also messy with the goto usage/ordering of
unrolling and should probably be changed in the same way.

>  
>  	while (getline(&line, &size, smaps) > 0) {
> 
> ---
> base-commit: 74d73ffcffe03804f97e9fb82301dadf75671282
> change-id: 20261104-for-mlock2-a67f86dad498
> 
> Best regards,
> --  
> Hongfu Li <lihongfu@kylinos.cn>
> 
