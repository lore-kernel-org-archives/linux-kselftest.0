Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A6F5D8F0
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Jan 2026 04:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769747522; cv=none; b=MVJqELNt2R1X/eKxCxkEI3I/7oybbyBq5EKZgBx/+8BQhZpcPvX8+qsXixLEhzHkL0wEufSIJvuscmXxln7oRRVUOhS74AQguJog+G7xbf4I2q+ZWLbL89lj4IB/ktGewTCSSTIpM5MvVW2UQdLWw1M1j8C5aE9ORcQmZLtACOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769747522; c=relaxed/simple;
	bh=ZHv8euJ8jyvN/CScafSnAgaG1UP/EIZWviYpRbB2OXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=K/eEpAbshbVui5l23mfW34FWTjple/VZny0EmMkzYc31+/iehZBwzT3eD4JlkI1iYpVjvoVnj4cqy/6O4vHzC1Uln/vNCgV7CwZKzpDQxwkm1wN/gZC4z5jd2efPV8EhLcoBXJkhLVNwQJKcLoHCuYl7bGpXFNSd3XbZCxbk+vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kW/2yKLs; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kW/2yKLs"
Message-ID: <9da09064-5005-4b30-8f9b-9ac9b9858d46@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769747508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BP57FKsGTRYNiacGfD/Jpsxc5lHZKrk+/1cmuy4ArpM=;
	b=kW/2yKLsVMvSCnYT/58kcF44p73/tlFh4RCRSPcbe4ZyeBj2GzeGdaZhqGSiwm+cwwS0Ej
	4X0gAknG80hl0c4CO0+DRXEvalkkYoLysYa7gOYcLaCAGWsRAeiMuAZyVDibGX5CxDKpY9
	/0LxGv9qMV4pNPKNipFO9CJ+Qwbq7aA=
Date: Thu, 29 Jan 2026 20:31:34 -0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] selftests/liveupdate: Cleanup kernel optio
 CONFIG_LIVEUPDATE_TEST
To: pasha.tatashin@soleen.com, rppt@kernel.org, pratyush@kernel.org,
 shuah@kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260130042840.1469-1-yanjun.zhu@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Zhu Yanjun <yanjun.zhu@linux.dev>
In-Reply-To: <20260130042840.1469-1-yanjun.zhu@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2026/1/29 20:28, Zhu Yanjun 写道:
> The kernel option CONFIG_LIVEUPDATE_TEST does not exist currently.
> Remove it.

In kernel 6.19-rc7, this kernel option still exists in the file

tools/testing/selftests/liveupdate/config. Thus I send out this commit 
to remove it.

Zhu Yanjun

>
> No functional changes.
>
> Signed-off-by: Zhu Yanjun <yanjun.zhu@linux.dev>
> ---
>   tools/testing/selftests/liveupdate/config | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/tools/testing/selftests/liveupdate/config b/tools/testing/selftests/liveupdate/config
> index 91d03f9a6a39..80bd5d5e2976 100644
> --- a/tools/testing/selftests/liveupdate/config
> +++ b/tools/testing/selftests/liveupdate/config
> @@ -5,7 +5,6 @@ CONFIG_KEXEC_HANDOVER_ENABLE_DEFAULT=y
>   CONFIG_KEXEC_HANDOVER_DEBUGFS=y
>   CONFIG_KEXEC_HANDOVER_DEBUG=y
>   CONFIG_LIVEUPDATE=y
> -CONFIG_LIVEUPDATE_TEST=y
>   CONFIG_MEMFD_CREATE=y
>   CONFIG_TMPFS=y
>   CONFIG_SHMEM=y

-- 
Best Regards,
Yanjun.Zhu

