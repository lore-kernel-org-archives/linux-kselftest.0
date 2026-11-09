Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794191579;
	b=vNHUAhf7K6Hg+Nc3zwz38UGWhA7DBU2KIQ8pZgP4BIQ9foUVsg3R0W3CyxX1GC/ptQi+
	 g4pUOLKLYIsCWRGf0urvDdkWOrZnnY9e2yXoCw77VYqhQIoNBNDa4nVaK/G1zSGo7oRaM
	 97kDZsjmzZYW0PfFnaj68BhZoqiCBshdnzbI3GWNglANMgpCEcu54sMMKMvgvJRgj8iif
	 amkViNINXgZ94b6qtT8eShJ/IbfxqQDPA8Q9/jqnEx6SvQB0og5Y4JARkragBf9qTRc1r
	 X3hhcXJB4GWzS3ivpQHGzQXaWp9cjwyGNgHr+JEHbJpIDDAb8SuE1YuDvsSYEePn1Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794191579;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NTJQRFg4ZLfC+WrQK17Fwq2xbU+TlVAHwMAwagSHegE=;
	b=g5AvqbUWcVrpReH8IybNsqpFYpLOBuACynE/WPAvL7EtXLKT1m51nCRXZNtB8bF1jezr
	 GmNA/2X/MMYrFVBtsL07SfqAkYW7B3aoFvND6TEqRNxzbX48IVWd2uLSHf+KPba4U+G1h
	 MCe+MlAXWVDVEUvyYm7jX9P1bl00JI/NoAzvqHAcAi+1lkQ/gSNnvIhlQAj/IR+u/R3Tv
	 pi5xeWBgdjmcBDkYSXLy6qI0063Asg1v81/+iCYGiGazGL9Z4VIe4PNNOEj/GpAdxea9z
	 ipC3rSQkLYgACuPGYj4r4+YTTwVLz3cbYvcAedNILJdWkDJaz8AZQqWX5Gv9KtzAvMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=F2gaGqHO;
	arc=none smtp.remote-ip=95.215.58.159
Received: from mta1.migadu.com (out-159.mta1.migadu.com [95.215.58.159])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EC1606A321
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 02:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66EC1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=F2gaGqHO
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+0SMLJkywubB1aX8z8chXAoTRSPPEPx3GuRAB7UvFQQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794191576; v=1; x=1794796376;
 b=F2gaGqHOZ1AzwzNGFTyHvBkAEUf7G89vTgOoeIwbAckvPxfQhqVMkBB2kH3sUGFDcjEKtIGH
 twNceq0jMlUWbbHmoP6jAGAwuYbnLtgfqPYgo0/JatIYj8+eAiR7KbcPZVs8NZG0Za0JiFI4uze
 3JZQGOjOtF/5i7JjuUMbxc6w=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 87ec61e94bf44d6f;
	Mon, 09 Nov 2026 02:32:56 +0000
X-Mizu-Trace-ID: 87ec61e94bf44d6f
X-Migadu-Flow: FLOW_OUT
Date: Mon, 9 Nov 2026 10:32:45 +0800
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
Subject: Re: [PATCH v4 4/5] selftests/mm: move waiting for KSM full scans
 into a helper
Message-ID: <avEwza7YqonhwgO+@dgvxl46587.localhost.localdomain>
References: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-0-86be8fe77e7a@gmail.com>
 <20261108-bug-mm-ksm-smart-scan-align-skips-v4-4-86be8fe77e7a@gmail.com>
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
In-Reply-To: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-4-86be8fe77e7a@gmail.com>

On Sun, Nov 08, 2026 at 08:22:53PM -0500, Qiliang Yuan wrote:
> ksm_start() enables ksmd and then polls full_scans until two more full
> scans have completed, so that any merging that can happen has happened.
> 
> There is no helper to wait for a number of full scans while ksmd is
> already running, so a test that needs one has to copy that loop.
> 
> Move the loop into ksm_wait_full_scans() and make ksm_start() call it
> after enabling ksmd. The count is now read after ksmd starts rather than
> before, which can only make ksm_start() wait longer.
> 
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> Tested-by: Andrew Morton <akpm@linux-foundation.org>
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>

Reviewed-by: Xu Xin (vivo) <xu.xin@linux.dev>

> ---
>  tools/testing/selftests/mm/vm_util.c | 31 ++++++++++++++++++-------------
>  tools/testing/selftests/mm/vm_util.h |  1 +
>  2 files changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> index caea045fa7d46..8184691211acc 100644
> --- a/tools/testing/selftests/mm/vm_util.c
> +++ b/tools/testing/selftests/mm/vm_util.c
> @@ -992,35 +992,40 @@ int ksm_use_zero_pages(void)
>  	return ret == 1 ? 0 : -EIO;
>  }
>  
> +int ksm_wait_full_scans(long nr)
> +{
> +	long start_scans, end_scans;
> +
> +	start_scans = ksm_get_full_scans();
> +	if (start_scans < 0)
> +		return start_scans;
> +	do {
> +		end_scans = ksm_get_full_scans();
> +		if (end_scans < 0)
> +			return end_scans;
> +	} while (end_scans < start_scans + nr);
> +
> +	return 0;
> +}
> +
>  int ksm_start(void)
>  {
>  	int ksm_fd;
>  	ssize_t ret;
> -	long start_scans, end_scans;
>  
>  	ksm_fd = open("/sys/kernel/mm/ksm/run", O_RDWR);
>  	if (ksm_fd < 0)
>  		return -errno;
>  
> -	/* Wait for two full scans such that any possible merging happened. */
> -	start_scans = ksm_get_full_scans();
> -	if (start_scans < 0) {
> -		close(ksm_fd);
> -		return start_scans;
> -	}
>  	ret = write(ksm_fd, "1", 1);
>  	close(ksm_fd);
>  	if (ret < 0)
>  		return -errno;
>  	if (ret != 1)
>  		return -EIO;
> -	do {
> -		end_scans = ksm_get_full_scans();
> -		if (end_scans < 0)
> -			return end_scans;
> -	} while (end_scans < start_scans + 2);
>  
> -	return 0;
> +	/* Wait for two full scans such that any possible merging happened. */
> +	return ksm_wait_full_scans(2);
>  }
>  
>  int ksm_stop(void)
> diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
> index b5d59729d4327..7e00030077d2f 100644
> --- a/tools/testing/selftests/mm/vm_util.h
> +++ b/tools/testing/selftests/mm/vm_util.h
> @@ -162,6 +162,7 @@ void *sys_mremap(void *old_address, unsigned long old_size,
>  long ksm_get_self_zero_pages(void);
>  long ksm_get_self_merging_pages(void);
>  long ksm_get_full_scans(void);
> +int ksm_wait_full_scans(long nr);
>  int ksm_use_zero_pages(void);
>  int ksm_start(void);
>  int ksm_stop(void);
> 
> -- 
> 2.43.0
> 
