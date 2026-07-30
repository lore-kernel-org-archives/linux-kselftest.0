Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555DA423782;
	Thu, 30 Jul 2026 14:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785423371; cv=none; b=WRc7alABqS8ln8gCTg1AmSiv1fZj1vC05shBFBzYnF8K8NygqQEhKi2OsdBWfYgsxbUM0MOqbkGR8gz2abj5IkMaMOxMpvbPnlke5jBvr/2UAAzVwxWjNxlM4kDYZkMq2BrcIsarUkbTdyWa5c/rBsuvt8tD5e1oQ4w4UzVJEJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785423371; c=relaxed/simple;
	bh=kXcMxAJWsM4oAFeGyUQmH45nAj7AtZr0Z4ppu7c+hiI=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ncYMu2n4tln0NysMLNqIHdBk8ei9+/dwC3Qfl5UXTwjsTJII0uDZ/+ptdbSOrxt/5brLAyiY6EIK0VEMgKT5vgIlOvxdCwuN7RQUyM0+yq5XeW85/8CfzIbuaOc7rr9kvprF4/HcRCHYPHEMORcJET+xY/NszU0oSXfZUq8jZyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=erWz8uJv; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="erWz8uJv"
Message-ID: <23996589-fe21-4f39-bcbb-91eb1df56bd7@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785423357;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zUUDKd2U6LDtxoRgmCJwB3udrKdBg0xqgfAlInbPBio=;
	b=erWz8uJvvnGk0b/SFuwEq3Ug9fuf9+ZaNsBMPmXhZrUuUwf4yAAjBzDYA5/gqMNzSvx1iF
	mmwb8n7vBuZq/LMWl5EOjdONqFzFImyUy0+cj9DaQWcIatr+D9tVeaSix6W8Nwod+BbMQd
	pFhr+q+x93XnQJqVqKTHuAc1olyZqXw=
Date: Thu, 30 Jul 2026 22:55:41 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: cui.tao@linux.dev, cgroups@vger.kernel.org, hannes@cmpxchg.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 shuah@kernel.org, tj@kernel.org
Subject: Re: [PATCH v2] selftests/cgroup: add user_usec sanity check in
 test_cpucg_nice
To: Shaojie Sun <sunshaojie@kylinos.cn>, mkoutny@suse.com
References: <amnqUlrPxhTobE1E@localhost.localdomain>
 <20260730130717.1236233-1-sunshaojie@kylinos.cn>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <20260730130717.1236233-1-sunshaojie@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



在 2026/7/30 21:07, Shaojie Sun 写道:
> In test_cpucg_nice, after the child process exits, user_usec is
> read from cpu.stat but the value is not checked. Add a sanity check
> to ensure user_usec > 0, analogous to test_cpucg_stats(), so that
> the test fails early if CPU usage wasn't properly accounted.
> 
> Signed-off-by: Shaojie Sun <sunshaojie@kylinos.cn>
> ---
> v2: Instead of simply removing the unused user_usec read, add a sanity
>     check (if user_usec <= 0, goto cleanup) analogous to test_cpucg_stats(),
>     as suggested by Michal.
> 
>  tools/testing/selftests/cgroup/test_cpu.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/testing/selftests/cgroup/test_cpu.c b/tools/testing/selftests/cgroup/test_cpu.c
> index 7a40d76b9548..5a44705ed3fd 100644
> --- a/tools/testing/selftests/cgroup/test_cpu.c
> +++ b/tools/testing/selftests/cgroup/test_cpu.c
> @@ -291,6 +291,8 @@ static int test_cpucg_nice(const char *root)
>  
>  		user_usec = cg_read_key_long(cpucg, "cpu.stat", "user_usec");
>  		nice_usec = cg_read_key_long(cpucg, "cpu.stat", "nice_usec");
> +		if (user_usec <= 0)
> +			goto cleanup;
>  		if (!values_close_report(nice_usec, expected_nice_usec, 1))
>  			goto cleanup;
>  
Acked-by: Tao Cui <cuitao@kylinos.cn>

