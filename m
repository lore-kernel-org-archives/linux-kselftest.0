Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A0536F413
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 08:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774254277; cv=none; b=HokwhOFJvuu//mJnheXIupsz8FNnQuHo2bB5yucluKnEhIygiKlJbHTJiDJY9Gy6QommJ6jVUCznyNnLMCKoOY7ckYPgOgT5kYGbelMgFNdntFd9SBpOE076130oCNCRnZoQvLxYoQrQ2ERv3w7hKf0onfUlyfmNDU/CyoRChic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774254277; c=relaxed/simple;
	bh=df45W3b6valvoQMlkMLb0VHRpJX8Uz+L2ySSMYD4XXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JI+IpbSDOGEO643Qn1NQPf1hWra44F6l8bmnzUwMi1CNlflKRq7uHOzsqHFB2uzwA65rEre2PC4kNmgGmMMvnTjkkKZyHMVgf9EtAswMzkNb1AOpKtUobmrwRBewrZAc3pFzfbY0MNIOBuJSxNsSxbm6fTg7ayREok598XrNB48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PK0Z+1AC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=c9FYhFWW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PK0Z+1AC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="c9FYhFWW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774254273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l4FYRZcJce0iqsefU7RH85JSFRG+Uej7mvnkE77jdLA=;
	b=PK0Z+1ACDmH9j7VFdO7z4ZSvKB+27PG4nToCwjcTC2cACQj7OLhgiTzrHZBYTAgwHx2Bif
	belFffgdOLXm82jZV91JoFt0T6SWbDF5hvhosFPQ0iAuGjJmjMLrp8lu9glgkFJ6g7/Ojy
	EpR3Uln6MkR/3KaPV91zQflBrYXwDIQ=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-gT6MNGsHNGa_aOYy7S1Qwg-1; Mon, 23 Mar 2026 04:24:32 -0400
X-MC-Unique: gT6MNGsHNGa_aOYy7S1Qwg-1
X-Mimecast-MFC-AGG-ID: gT6MNGsHNGa_aOYy7S1Qwg_1774254271
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b059ab124dso32847865ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 01:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774254271; x=1774859071; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l4FYRZcJce0iqsefU7RH85JSFRG+Uej7mvnkE77jdLA=;
        b=c9FYhFWWRi2AaYoVWUfTGwqs/GLD2qRipVQK3OCa2/MIGQQWusjRbYuR5XdMYueUjV
         UwvMsWav3yfYMo4N03Q7rqcoCqKwGImrHzb9pK0x1mYPewE8x2p85YOFWnLU3NIP/177
         KD1NW2Buqb9i8ymifPtr/2KXuAYlBLatqKJt8VAgINXQNVPSYXx8jof/otWW9bwtEJ/C
         YyNuAlOotLCl+Sxq929n0Wg4xeqKJrvilfiB2CQObpvZbikBm38kI72TzdiVOGhH2FLa
         xZWakjeO8zKWgb32e/Lh3EQni1WKxq/xUeaIhhb0ev/XOWneML6vPxi+VB+aAlKgyTWi
         ATcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774254271; x=1774859071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4FYRZcJce0iqsefU7RH85JSFRG+Uej7mvnkE77jdLA=;
        b=qrMGFXqm2voPdC9wDLzcIj+CId/omUshKmetu2ZSTklUolOFuiy6P/UkJf/TB+kSkb
         Z/8QNsbBoEYb25VcV6WeVJZflW5WxWiBT20GMKH7eZhvVBh1Bel3E6Awr8hun4ON7K8n
         MM/fHPxR23C6YpxNgxduzwKEia7PclXG9eqRtP9w+6kaQS2px/qI14Ca/qM8sTAnWHuJ
         wc4JaPlxVnDwtI/oEsOpdNInkyQNNYgtiUDgVi/m/oqGM3eRZ5civ8XC0DPFlKp9xmrw
         yNrCYf7qtTNSLV1ohNQc/nvNyVpCMxKyw/fxYxDrgiUL+33rW3ZVO7g6J/9bP30rNeVI
         jEfw==
X-Forwarded-Encrypted: i=1; AJvYcCWmqicGJW2pnm88zxSplqNJY4TZXp/ih1XC7A8oSGpForL/VR+i0HgpZBGTM9PrqyAMxUtjv+FSvSnoMnHoQ2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlTTNd74hnBy91WXM+4o466Fz7DKNZDkODtjHLLTcM2eIbYqd/
	gsZHuseM5Sr1lHKEedvOlHHtmmuNPARGDmovg9xFByqO7yKBgaqk+wt7auiDx8Zz0T5QDxK0bRf
	ChzrIfL/BEKE96av1lAdjGo4oFXgzEc2JculfOykH7A2YowMbQyo7n5oA+dWWVgdUInQCCA==
X-Gm-Gg: ATEYQzwDWa6MZPf6JHEqRvIhcV0drkYGU3jynFnOeZbLBXqjEZNb59mSTZXZSbXsdLA
	ab27TeT39qq7wx3KqV9BnQbZl+ltyajHQssrDS3eO9BkZv2Du6XkM/ZzyYF4ZPQkihrLz4ZgutO
	V4wFSGNwvGYbLuB43vJdtZ5zksLQOlaDiuEzIMcg4K6FDfXNqEvg+UMmzmvWv7orZE95A1qD/3u
	Ra5fLMmpn0nDkmaN5xTupL0NVkJuAyWtm0XhZDIfQkx7YBGzMZ4WdcDR4fQVajbL7KzgJKz+Oar
	DLy4J/bPU2qGNxzoPjkdWvmJyW6bjIsFNGY5FFya28RVUwd+hwIlo96VYWTUaRE6dS1Jknf+dcZ
	+U0+zjGeP3WkJ6/2rIA==
X-Received: by 2002:a17:902:ccd2:b0:2b0:5682:6973 with SMTP id d9443c01a7336-2b08273d0d4mr101278585ad.19.1774254271402;
        Mon, 23 Mar 2026 01:24:31 -0700 (PDT)
X-Received: by 2002:a17:902:ccd2:b0:2b0:5682:6973 with SMTP id d9443c01a7336-2b08273d0d4mr101278345ad.19.1774254270964;
        Mon, 23 Mar 2026 01:24:30 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08365a62bsm136181655ad.46.2026.03.23.01.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:24:30 -0700 (PDT)
Date: Mon, 23 Mar 2026 16:24:28 +0800
From: Li Wang <liwang@redhat.com>
To: Waiman Long <longman@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tejun Heo <tj@kernel.org>,
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	Sean Christopherson <seanjc@google.com>,
	James Houghton <jthoughton@google.com>,
	Sebastian Chlad <sebastianchlad@gmail.com>,
	Guopeng Zhang <zhangguopeng@kylinos.cn>, Li Wang <liwan@redhat.com>
Subject: Re: [PATCH v2 5/7] selftests: memcg: Reduce the expected swap.peak
 with larger page size
Message-ID: <acD4vGZKveXJ4GuW@redhat.com>
References: <20260320204241.1613861-1-longman@redhat.com>
 <20260320204241.1613861-6-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320204241.1613861-6-longman@redhat.com>

On Fri, Mar 20, 2026 at 04:42:39PM -0400, Waiman Long wrote:
> When running the test_memcg_swap_max_peak test which sets swap.max
> to 30M on an arm64 system with 64k page size, the test failed as the
> swap.peak could only reach up only to 27,328,512 bytes (about 25.45
> MB which is lower than the expected 29M) before the allocating task
> got oom-killed.
> 
> It is likely due to the fact that it takes longer to write out a larger
> page to swap and hence a lower swap.peak is being reached. Setting
> memory.high to 29M to throttle memory allocation when nearing memory.max
> helps, but it still could only reach up to 29,032,448 bytes (about
> 27.04M). As a result, we have to reduce the expected swap.peak with
> larger page size. Now swap.peak is expected to reach only 27M with 64k
> page, 29M with 4k page and 28M with 16k page.
> 
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  .../selftests/cgroup/test_memcontrol.c        | 26 ++++++++++++++++---
>  1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/testing/selftests/cgroup/test_memcontrol.c
> index c078fc458def..3832ded1e47b 100644
> --- a/tools/testing/selftests/cgroup/test_memcontrol.c
> +++ b/tools/testing/selftests/cgroup/test_memcontrol.c
> @@ -1032,6 +1032,7 @@ static int test_memcg_swap_max_peak(const char *root)
>  	char *memcg;
>  	long max, peak;
>  	struct stat ss;
> +	long swap_peak;
>  	int swap_peak_fd = -1, mem_peak_fd = -1;
>  
>  	/* any non-empty string resets */
> @@ -1119,6 +1120,23 @@ static int test_memcg_swap_max_peak(const char *root)
>  	if (cg_write(memcg, "memory.max", "30M"))
>  		goto cleanup;
>  
> +	/*
> +	 * The swap.peak that can be reached will depend on the system page
> +	 * size. With larger page size (e.g. 64k), it takes more time to write
> +	 * the anonymous memory page to swap and so the peak reached will be
> +	 * lower before the memory allocation process get oom-killed. One way
> +	 * to allow the swap.peak to go higher is to throttle memory allocation
> +	 * by setting memory.high to, say, 29M to give more time to swap out the
> +	 * memory before oom-kill. This is still not enough for it to reach
> +	 * 29M reachable with 4k page. So we still need to reduce the expected
> +	 * swap.peak accordingly.
> +	 */
> +	swap_peak = (page_size == KB(4)) ? MB(29) :
> +		   ((page_size <= KB(16)) ? MB(28) : MB(27));

Or, go with a dynamic adjustment based on page size?

    swap_peak = MB(29) - ilog2(page_size / KB(4)) * MB(1);

-- 
Regards,
Li Wang

