Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF6433ADB9;
	Tue, 28 Apr 2026 08:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777363475; cv=none; b=ue0y+DS8P5NUh1DYVRPcgO0pt8cIqXWG9sD7GMTs7FuI+WH5r0hHNJ/vi5CZ6N9e53+qL0bN/aEp8ng0FOf+ay5lalFSEGRy4tsS+ShKYmk5ZBexeCn5S3dD+myFwYN1x1y0QF7k2x+IIYxJJed5RQQ5Z8Spnh2T6Q/NPbEnyWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777363475; c=relaxed/simple;
	bh=NtmIbjTbL8hS7vDBEGYOIeztzGgTPC9MZsx2eECcozo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W3vt1b72zEq7Ae6GLa2bn9mqQnsaYz3P760+mMKxxMWm9Kemc0dteMdlHD3coMViUZbyMqHwZyV/YV8t8EhW1JkcWIrcSvTTnzXxi1MHl7cF6aGKzu0K7S5zMmOItnMOjIWceMwSw07wwmtR7LFPDz9P3djumQknKlkr2/3gpzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XppfAnHz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XppfAnHz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4168C2BCAF;
	Tue, 28 Apr 2026 08:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777363475;
	bh=NtmIbjTbL8hS7vDBEGYOIeztzGgTPC9MZsx2eECcozo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XppfAnHz8MngFNTO2myVmeJ9/Oj2+/bCYRyj4mB900QrbG+dlkM5fWAW8Fg13lzUj
	 PFpSAXHkl5PUM9jVWjIVQ/MnIrvHJQUo3zhAj8FPw370qIkBr6xC017NzJoYajllmH
	 LXefxywCZ+Gsuff+chuFLBSjkY4RokZ8ARycGMnSz5pfHkvFz5zIRpIUHxVFJtmp9q
	 nb/hEpovJGyhAXWSQp8/gaVDZYE+nkvnV2pJlZHBnIt04rz4A2tQ8jsGorQgQc1lw2
	 /oyaMaQkDXhkcv8A4mh0Ws8wysE3wRfGaE8BL1nraNFpdSGhH/JckeHzO78cYx0Ta9
	 x56ZMyQqzSYUg==
Message-ID: <3abf09d8-a98e-4f1b-b8d9-77879a8a2733@kernel.org>
Date: Tue, 28 Apr 2026 10:04:30 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: khugepaged: handle partial write in
 file_setup_area()
To: Vineet Agarwal <agarwal.vineet2006@gmail.com>, akpm@linux-foundation.org,
 ljs@kernel.org, shuah@kernel.org
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260428062322.20417-1-agarwal.vineet2006@gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260428062322.20417-1-agarwal.vineet2006@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/28/26 08:23, Vineet Agarwal wrote:
> file_setup_area() writes initialized test data into the backing
> file used for collapse testing, but it ignores the return value
> from write().
> 
> If write() fails or completes only partially, the test continues
> with incomplete file contents, which can lead to incorrect test
> results and make failures harder to diagnose.
> 
> Handle partial writes by retrying until all data is written and
> abort the test if write() fails.
> 
> Signed-off-by: Vineet Agarwal <agarwal.vineet2006@gmail.com>
> ---
>  tools/testing/selftests/mm/khugepaged.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/selftests/mm/khugepaged.c
> index 3fe7ef04ac62..c13f06758750 100644
> --- a/tools/testing/selftests/mm/khugepaged.c
> +++ b/tools/testing/selftests/mm/khugepaged.c
> @@ -369,7 +369,9 @@ static void *file_setup_area(int nr_hpages)
>  	int fd;
>  	void *p;
>  	unsigned long size;
> -
> +	size_t remaining;
> +	ssize_t ret;
> +	char *buf;
>  	unlink(finfo.path);  /* Cleanup from previous failed tests */
>  	printf("Creating %s for collapse%s...", finfo.path,
>  	       finfo.type == VMA_SHMEM ? " (tmpfs)" : "");
> @@ -383,7 +385,19 @@ static void *file_setup_area(int nr_hpages)
>  	size = nr_hpages * hpage_pmd_size;
>  	p = alloc_mapping(nr_hpages);
>  	fill_memory(p, 0, size);
> -	write(fd, p, size);
> +	remaining = size;
> +	buf = p;
> +
> +	while (remaining > 0) {
> +		ret = write(fd, buf, remaining);
> +		if (ret <= 0) {
> +			close(fd);
> +			munmap(p, size);
> +			ksft_exit_fail_msg("write() failed while preparing test file\n");
> +		}
> +		buf += ret;
> +		remaining -= ret;
> +	}

Why are we even using write() instead of just mapping the fd and writing to that
area?

diff --git a/tools/testing/selftests/mm/khugepaged.c
b/tools/testing/selftests/mm/khugepaged.c
index 3fe7ef04ac62..a77f753ccf38 100644
--- a/tools/testing/selftests/mm/khugepaged.c
+++ b/tools/testing/selftests/mm/khugepaged.c
@@ -381,9 +381,10 @@ static void *file_setup_area(int nr_hpages)
        }

        size = nr_hpages * hpage_pmd_size;
-       p = alloc_mapping(nr_hpages);
+       p = mmap(BASE_ADDR, size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+       if (p != BASE_ADDR)
+               ksft_exit_fail_msg("mmap() failed while preparing test file\n");
        fill_memory(p, 0, size);
-       write(fd, p, size);
        close(fd);
        munmap(p, size);
        success("OK");


-- 
Cheers,

David
