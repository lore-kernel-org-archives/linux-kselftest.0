Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E60627FB1C;
	Tue, 18 Aug 2026 06:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787035626; cv=none; b=e76LodTbSZEaz3a8GbTZhs6yUSic8y4y4lQTV1nLqnd9KA+TaY1OuyuuGTStn4zxxvazoZBJefUokJkyXxhCkvMKNxMRiJHSvmaOc3mIMldVJTSaerBD1PEn5PC0uJCUPHp7A9S+A7j2QH6SK2a0qVHWeinjVJPICI9Dxg4daxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787035626; c=relaxed/simple;
	bh=3Zdl+JzBl/JqXDZY6Efc0m/ZWyv2YZXvZZGVhQPbC6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7vgYEX+1lGQEeOQ15nm5IH4UPoVUDEmFqYifclX+Q0pPIuVxzMu6zJYjZHaU8dxnqjAPi0XFSQacTrC5MG3htm6uVkOdKF+kZZejtMTzeU7HaMLdJ+ZqeZ4DmH3EF2ns2j1BeaS4u8ksXNi/dwgiQAn0fB87gN8uSJKCdHZ1Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=CTHVIv0U; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="CTHVIv0U"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B2E2153B;
	Mon, 17 Aug 2026 23:46:57 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DC333F85F;
	Mon, 17 Aug 2026 23:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787035621; bh=3Zdl+JzBl/JqXDZY6Efc0m/ZWyv2YZXvZZGVhQPbC6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CTHVIv0U/vSSapBacgFU41CKb8IkCnpZ2DJDjzNcgunvVYqAzcJ2pDRsc5xebowoG
	 Ey8RR8j+a1OMG+VysbcrCElXu8ahSrFla9uVaCR7UY+2WcW937FvHWotXfIoHqURoj
	 OLC0x54W+TTyIjMJgw9uHmI0Fk+ngh3QzLIkTyqg=
Date: Tue, 18 Aug 2026 12:16:57 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Hongfu Li <hongfu.li@linux.dev>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, shuah@kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Hongfu Li <lihongfu@kylinos.cn>
Subject: Re: [PATCH] selftests/mm: Drop redundant open() in mprotect_tests()
Message-ID: <vgwwpyvb254quwnbpwbjc2nxzhmt66a5nuxqfpmkpr3y6gbybf@3p3ul7u6jbe5>
References: <20260817080616.52946-1-hongfu.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817080616.52946-1-hongfu.li@linux.dev>

On Mon, Aug 17, 2026 at 04:06:16PM +0800, Hongfu Li wrote:
> From: Hongfu Li <lihongfu@kylinos.cn>
> 
> Remove duplicate open() for local pagemap_fd in mprotect_tests() that
> shadows the global pagemap_fd already opened in main(). The local fd
> is never used in the function.
> 
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  tools/testing/selftests/mm/pagemap_ioctl.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/pagemap_ioctl.c b/tools/testing/selftests/mm/pagemap_ioctl.c
> index cfd1987339c1..eadc7159ca5b 100644
> --- a/tools/testing/selftests/mm/pagemap_ioctl.c
> +++ b/tools/testing/selftests/mm/pagemap_ioctl.c
> @@ -1332,12 +1332,6 @@ int mprotect_tests(void)
>  	int ret;
>  	char *mem, *mem2;
>  	struct page_region vec;
> -	int pagemap_fd = open("/proc/self/pagemap", O_RDONLY);
> -
> -	if (pagemap_fd < 0) {
> -		fprintf(stderr, "open() failed\n");
> -		exit(1);
> -	}
>  
>  	/* 1. Map two pages */
>  	mem = mmap(0, 2 * page_size, PROT_READ|PROT_WRITE, MAP_PRIVATE | MAP_ANON, -1, 0);
> -- 
> 2.54.0
> 
