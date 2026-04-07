Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838C13A6F15;
	Tue,  7 Apr 2026 10:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775556363; cv=none; b=QxU3+qYwSGwFz6OocB62r/2nOmjoJbKVP9IdRQeDFEbGP73DmuPp0kVtlHKjcidr0zCEzFcHgup2z4P/stfl1GGsfFpadHb6kUzKy5luy2HvG/B9JfDTE5e9CDb+yhRb8dl59CoDNcGm3xZ6angUJhncL13YyjuDh0tXbcmM3xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775556363; c=relaxed/simple;
	bh=xcNXJlqieSYqhdO9b7zc1ja/wDpDdbkAoWgTKktXzBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uN3w8+DScVs3WsCy7NYrXs4F6+iABQWSzvyOw7qJTcnKUwEWoj63AtPTWFJn6ifa9kEmq0rTUtFF8RsTXZ1gJcZGwcUbMM0FvEuORJyXbREhns7ADKS5Fx96BzQgwiHp4fKrAHOIkb3yjm2KEAbXwMxwP0E2gxSeNjR1BGPkFn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KDe3atUF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KDe3atUF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12C9AC116C6;
	Tue,  7 Apr 2026 10:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775556363;
	bh=xcNXJlqieSYqhdO9b7zc1ja/wDpDdbkAoWgTKktXzBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KDe3atUFrLcha8dZqpU20XliIYXYYBRVu4cdpDmyL3Y4twRJ7HmKqINPOZimaf9lq
	 P+MFlkMryiizs/wkxZXHmNoRUXXZNSD3GEBM/W/TiAR7Lalggq9/hhOctfAdMe7Coi
	 hEKxD/OfEBpOhJdeOYOX/pM48DAJ6+TIYvKJAdT2Tgyww/sTwF01ktJSmMkJLamRns
	 7E7TwHKpXq9XSPbb6aba+k7c9QVkdqTo2TxWiv8NlO6/sM4CA3WNaq8+L7gJk+2zmn
	 9YIQIlcFk0PSc/C+WrMyntX8vAVEgXSR855RWxo//guiaJz2NsKdb2fWvbyxvrhUsq
	 ySUTkLZNQa3eg==
Date: Tue, 7 Apr 2026 11:05:57 +0100
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Anthony Yznaga <anthony.yznaga@oracle.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, akpm@linux-foundation.org, david@kernel.org, 
	Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, jannh@google.com, pfalcato@suse.de, Jason@zx2c4.com, 
	shuah@kernel.org
Subject: Re: [PATCH v2 1/2] mm: fix mmap errno value when MAP_DROPPABLE is
 not supported
Message-ID: <adTWtnIMxao-_Fhd@lucifer>
References: <20260402235933.10588-1-anthony.yznaga@oracle.com>
 <20260402235933.10588-2-anthony.yznaga@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402235933.10588-2-anthony.yznaga@oracle.com>

On Thu, Apr 02, 2026 at 04:59:32PM -0700, Anthony Yznaga wrote:
> On configs where MAP_DROPPABLE is not supported (currently any 32-bit
> config except for PPC32), mmap fails with errno set to ENOTSUPP.
> However, ENOTSUPP is not a standard error value that userspace knows
> about. The acceptable userspace-visible errno to use is EOPNOTSUPP.
> checkpatch.pl has a warning to this effect.

Hmm, weird it was missed on initial patchset, but checkpatch.pl is
unfortunately overly noisy about silly things quite often so things can be
missed fairly easily.

>
> Fixes: 9651fcedf7b9 ("mm: add MAP_DROPPABLE for designating always lazily freeable mappings")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Anthony Yznaga <anthony.yznaga@oracle.com>

Nice catch, LGTM, so:

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

> ---
>  mm/mmap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 5754d1c36462..2311ae7c2ff4 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -504,7 +504,7 @@ unsigned long do_mmap(struct file *file, unsigned long addr,
>  			break;
>  		case MAP_DROPPABLE:
>  			if (VM_DROPPABLE == VM_NONE)
> -				return -ENOTSUPP;
> +				return -EOPNOTSUPP;
>  			/*
>  			 * A locked or stack area makes no sense to be droppable.
>  			 *
> --
> 2.47.3
>

Cheers, Lorenzo
