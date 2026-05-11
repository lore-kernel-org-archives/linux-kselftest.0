Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056A437268D
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 11:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778500754; cv=none; b=VStV/niETriF4zWH5haDykAFPZpJTJgT3jMj2wVlDoF2iy1KmGWqbdUitdkgWTwxs5OJb7Vk7QD6o8TrVO0rjefwCCj0XBDqJ9AOR54k2A6Boi7jS6Kzwwrx1cxKXALWkO9jZD0l7w8Yx/xyNj68ramAhCIu+Tg8Ip3Fzonvnx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778500754; c=relaxed/simple;
	bh=E/TJvFs4t4lBs160Q7ddNOnGS+1yrt+GmYwsY8ieCxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tl3cVSIWOR+ncgKY9EVTrr7c9bJBqKr21N0wmx51aE2n5jbMPg2+JmEM6JO1fc7fxlZ0qGL6BuKT8/KVJUUGlbYwICim5iGMuZrNK+p85TObdTMwVr+TxP4zOdJikCQI1i/4Z0BQ3eIGGwBB8c2FtXFd0D+M7B6tlDFj/dsjzL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crVZvZQp; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crVZvZQp"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43fe608cb92so2621687f8f.2
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 04:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778500751; x=1779105551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=btlqUdi0qGhMKZ3fIin3gDvxyyqT63yde/F745AE8nE=;
        b=crVZvZQpDtP2iYrYETO5PJ5Zteho20POdFeIfBtnrH/7TGw21YcyeLQq8AzeyTJGhh
         /nvqZXJ1gcsV06WBca+TVHOIK+yLbtS5TK6T8NBCeWAfRrUQN6hww4WxWQ/kXNZJq05X
         9sqW0FfCqDD/TwHGq6pXTHnYit95O1g+pRuLKbOZbnRWSm1DR9a7cndIn4BrlumGoc1t
         rIW/DMlWreE7P8fcZ6lSpJeiOeFHVEqaseNaraKpYWj7ByqBMtGqe2ucX4NOqUmqFeQb
         VLeeQs+s8pSmZM0/7LjtRcRE5YIEdZV2HqMwnflNxHs6k+wOXj4eShGIsj1J0zQML7nb
         4HUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778500751; x=1779105551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=btlqUdi0qGhMKZ3fIin3gDvxyyqT63yde/F745AE8nE=;
        b=KvvwLMo4NR368YK0RIKU5DttFpXuHppp2XBSNyKlTlIAPmfgRqMF3Tmvy7lZBP2mSQ
         rWCbBwtKo8BTNTL7T9iKVR8zdDbqL6Bm8Rx6RegAKzgGMMeEO2YzPwQMEWKNaqFiCLS4
         T37nayl4l1ONcOi2fIinmoLsqCW8u20KAghMQhKnLPyyVz8HNjfZ9d6Dh1cEwoCrQPlf
         zvVsBhzlRwY+h7pfeuWU6bWRIwM1lV3nIDGW59fxWSW7CW9ARFuxfZ+E4bAM0x4K1s5x
         JKGTOguorfObDyQiSXbBJtn2C+/xuTmzjZDjK8AKHzOrQ5+tLCOkT7GeYhbcZXrCg11h
         mp3A==
X-Forwarded-Encrypted: i=1; AFNElJ9Myz2XDbkpnDacK5zXKn0YrQP+4uf7o9/MpKNqFiVIaGqAIJIYTEpvLrLd/adefuvpo26b7lh7VdPDVZR3K8g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVbipFAxkq2rBp9ez6QAGOl0hCd4w6OhBtSiL310KHM/OL+xlU
	h6XSahFF8tmG03u6rxaRom+vGfKkbBTxtphJkXrFIsKcz8V43UKFeYOp
X-Gm-Gg: Acq92OGBrY5R4XiI0WkrWklb02rZz6/2iIKLTV4eN4KAnE4WI0gG61NoCbLPs/K6KCq
	0CEqIdUYcFjPzuAYi4sdP+cjOGsOHz2Bj25HW3mWvkA10EYd+pXver649jdTj5/0PWaEV6yqE/t
	qBKH9MxFn/mWItciplh8Bk9kmSjvF8j04oCmRdDf/C5lrDK5lijKndOUEo7YfRS7O8jwsIii3al
	PYK8KLi05YN04N2rmi4oO1CCKTe0EclH3DOKwEneMh4AGPbwM14CdP/EChjFhQTgx2EJ6GwWl7I
	7VMFBeFKRFWkBVl8ln7/yA+R2i7uAxomxNX7KaA75E9xrMkBqrJFjL8+Cnh4MlE2ak6ewiZ6cnq
	9eG/FCbIopomHj5tQL7Ku58fSZjEtyp0vmIo+e8QFi+GX1MSs9nAmoKGOMPbM6xPpltZVXHhEIM
	BClZ+Nd+/qastZWAuRHcmNoJLpAq+kw3c7RcB6KjuP1gAHODMkDNdFd470n6xNtiKf1MFmvbjCj
	AHe0h2hzX//
X-Received: by 2002:a5d:588e:0:b0:43d:184:8aa2 with SMTP id ffacd0b85a97d-4546140b235mr21067301f8f.16.1778500750944;
        Mon, 11 May 2026 04:59:10 -0700 (PDT)
Received: from fedora ([185.193.234.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491bae13csm24580060f8f.29.2026.05.11.04.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:59:10 -0700 (PDT)
Date: Mon, 11 May 2026 12:59:08 +0100
From: Vishal Moola <vishal.moola@gmail.com>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev,
	shakeel.butt@linux.dev, muchun.song@linux.dev, tj@kernel.org,
	mkoutny@suse.com, shuah@kernel.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/cgroup: check malloc return value in
 alloc_anon functions
Message-ID: <agHEjG7_fHMAnQrw@fedora>
References: <20260511021615.1768623-1-lihongfu@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511021615.1768623-1-lihongfu@kylinos.cn>

On Mon, May 11, 2026 at 10:16:15AM +0800, Hongfu Li wrote:
> The alloc_anon() function calls malloc() without checking for a NULL
> return. If memory allocation fails, a NULL pointer dereference will
> occur when accessing the buffer.
> 
> Add proper error handling to return -1 when malloc() fails in all
> four alloc_anon variants:
> - alloc_anon()

Just a nit, It looks like the below already have proper error handling.

> - alloc_anon_50M_check()
> - alloc_anon_noexit()
> - alloc_anon_50M_check_swap()
> 
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> ---
>  tools/testing/selftests/cgroup/test_memcontrol.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/testing/selftests/cgroup/test_memcontrol.c
> index b43da9bc20c4..8ef9c99a82eb 100644
> --- a/tools/testing/selftests/cgroup/test_memcontrol.c
> +++ b/tools/testing/selftests/cgroup/test_memcontrol.c
> @@ -61,6 +61,11 @@ int alloc_anon(const char *cgroup, void *arg)
>  	char *buf, *ptr;
>  
>  	buf = malloc(size);
> +	if (buf == NULL) {
> +		fprintf(stderr, "malloc() failed\n");
> +		return -1;
> +	}
> +
>  	for (ptr = buf; ptr < buf + size; ptr += PAGE_SIZE)
>  		*ptr = 0;

Every malloc() call in this file has this same pattern. Maybe we'd be
better off making it a helper function?

Either way:
Reviewed-by: Vishal Moola <vishal.moola@gmail.com>
