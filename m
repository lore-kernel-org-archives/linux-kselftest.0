Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF6B28C009;
	Tue, 14 Jul 2026 00:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783990447; cv=none; b=eYm7m94dNsMJGjnONnABhORAhAU8MgLYY2dQ164WQVvE30kZ7Ob6l2C6cwjzI6OGptrQFff205cztdXmUT0wUWdK9xVNK5TiMTG3gPTBG/ZPzrt5u4conNv/BBtNSTonBTZK15jJhLqODnHTcw3v2cxEDAlwTbn7AeNjrY8gkpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783990447; c=relaxed/simple;
	bh=mfC3ncFpHlaw8o3OYUGj16d9Fp0NToJ1h9vWdIsKM2U=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=XlpWd0swgsTW92YENCdEQU/vumZSFpvGBqg//QCptyvynUcYXdZr9Z5u6bvz5j8xiYYt6kGu/0hb1303/eE11Z6T2ihtUNoh49D4KI/O/pHQUsncaFX3/+TtZDhOqMwFtwwMxigK9jqOU0seaX+/Sxlotx7duBVpvmZ/TUpVH/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dIdy7ooT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dIdy7ooT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07DD01F00A3A;
	Tue, 14 Jul 2026 00:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783990438;
	bh=mx4fDIBDz30G5ZiB41bQUQXLzkbvv7bupjE4vYMRmOM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=dIdy7ooTS2TlXzMThT9NYsmvtOqeDEBZaNWg3KMCD4CGz/3zUYuzC9SCEX35g5gqa
	 OdrbJsM4F6/w4yL73WsemTorfFR4xpoIgpIV/6l0ylZEnR6okFD8LI/lAANuCw3V5G
	 Br9EtkM7JMFhvo6sU4Xh88vL75+dYRj3CaxTahfY=
Date: Mon, 13 Jul 2026 17:53:57 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: =?UTF-8?B?546L57+K5ZiJ?= <wangyijia.yeah@bytedance.com>
Cc: <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <muchun.song@linux.dev>, Jan Kara <jack@suse.cz>, Matthew Wilcox
 <willy@infradead.org>
Subject: Re: [PATCH RESEND v4] selftests: mincore: count file-mmap readahead
 on both sides
Message-Id: <20260713175357.02fb4b78c6a22c17e2001035@linux-foundation.org>
In-Reply-To: <20260713094319.771550-1-wangyijia.yeah@bytedance.com>
References: <20260713094319.771550-1-wangyijia.yeah@bytedance.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 13 Jul 2026 17:43:19 +0800 王翊嘉 <wangyijia.yeah@bytedance.com> wrote:

> From: Yijia Wang <wangyijia.yeah@bytedance.com>
> 
> check_file_mmap() faults a page in the middle of a file mapping and
> expects the mmap read-around path to make neighbouring pages resident.
> The test currently counts only pages after the faulted page.
> 
> That misses valid read-around on systems with large base page sizes. On
> arm64 with 64K pages and the default 128K readahead setting, the
> read-around window is two pages wide and centred on the faulting page.
> Faulting page 32 makes pages 31 and 32 resident, so the forward-only
> scan from page 33 reports ra_pages == 0 even though a neighbouring page
> was brought in.
> 
> Keep the existing readahead assertion, but count resident neighbouring
> pages on both sides of the faulted page. This fixes the 64K-page false
> failure without teaching the selftest to compute the expected readahead
> window from sysfs or other implementation details.
> 

Thanks.

I continue to have bad feelings about this sefltest - checking on
internal and undocumented(?) behaviors of kernel-of-the-day. 
Pretending that these behaviors are ABI.

But oh well, if it causes problems we'll fix them.  And if we're to
test this at all, we may as well be more complete about it.

> --- a/tools/testing/selftests/mincore/mincore_selftest.c
> +++ b/tools/testing/selftests/mincore/mincore_selftest.c
> @@ -243,8 +243,10 @@ TEST(check_file_mmap)
>  	}
>  
>  	/*
> -	 * Touch a page in the middle of the mapping. We expect the next
> -	 * few pages (the readahead window) to be populated too.
> +	 * Touch a page in the middle of the mapping. We expect some
> +	 * surrounding pages (the readahead window) to be populated too.
> +	 * Depending on the page size and readahead setting, the pages may
> +	 * land before the faulted page rather than after it.
>  	 */
>  	addr[FILE_SIZE / 2] = 1;
>  	retval = mincore(addr, FILE_SIZE, vec);
> @@ -253,6 +255,12 @@ TEST(check_file_mmap)
>  		TH_LOG("Page not found in memory after use");
>  	}
>  
> +	i = FILE_SIZE / 2 / page_size - 1;
> +	while (i >= 0 && vec[i]) {
> +		ra_pages++;
> +		i--;
> +	}
> +
>  	i = FILE_SIZE / 2 / page_size + 1;
>  	while (i < vec_size && vec[i]) {
>  		ra_pages++;
> -- 
> 2.43.0
