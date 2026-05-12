Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0049F3A59B7;
	Tue, 12 May 2026 14:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778594950; cv=none; b=G592Xlk2Gqf/Guspsor9qXZC/Fbf4XiFvbC8o2H1yVtg+pdSuKW9cRaG7VnW2Vwky23BxCO6Qf/hwvRtBIYFfb2XeD6nmWYcdaquYbS57thdSaYBis8O9LyZxl8bL2d8Xmu1GT6v6AGQUSHUDw96lLlKIeKdPFRq0g84GG50Yt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778594950; c=relaxed/simple;
	bh=kH+DBH602R/NCMQ8TNdgFnfzcA0HQ7TM7TcnLEWnzJc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bTALqIyELHs4dAuwwUcn5hPCkKgP2QLocyh1BOK8oQC18adcaxhHBwFHTI20SBLe15m0zd+w/RTaKAegwGaD8bakjCtrEYcDjNZgP3VW9B0OSIa+zM7+aV/aW2E42HL2iOD8BaQmtQ5RjIO8McE48RC0nVTFigoV0RZiUV/bids=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YXy7tjHe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YXy7tjHe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEE69C2BCB0;
	Tue, 12 May 2026 14:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778594949;
	bh=kH+DBH602R/NCMQ8TNdgFnfzcA0HQ7TM7TcnLEWnzJc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YXy7tjHeVafWgkoh9kZB1s2WPWxRJwh4XA7F5ZYdpJ6KoFS3923iDL7eSbj9ghHBy
	 WEnYBAPKilqVYayl34sHEjYVC69JVD9Bigj3GJC2RaIY1ftgbrh9AlP6r+Y5KuxvEH
	 VEBUpDmxRymvetc5ItvkvIldJvreqDWFy2vAt50XQmCaWnM6wZbEIpCBIJ4U4xoS3Q
	 yyMe5OzzolcfMf8q8KL5uKNv69XgqVgX/ToKmTXB6tY/CvMIbeoDm87e/Ey1ZfX7Jh
	 uAYA1JEJPmOrSKV6mCxTYTftUsfm9YswWSYMiyiSiBRTErbDFnidoWtLK6DPSJfBtC
	 8MRuSkpinkQ2w==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org,  rppt@kernel.org,  shuah@kernel.org,
  akpm@linux-foundation.org,  linux-mm@kvack.org,
  linux-kernel@vger.kernel.org,  dmatlack@google.com,
  kexec@lists.infradead.org,  pratyush@kernel.org,  skhawaja@google.com,
  graf@amazon.com
Subject: Re: [PATCH 4/5] selftests/liveupdate: Add stress-sessions kexec test
In-Reply-To: <20260414200237.444170-5-pasha.tatashin@soleen.com> (Pasha
	Tatashin's message of "Tue, 14 Apr 2026 20:02:36 +0000")
References: <20260414200237.444170-1-pasha.tatashin@soleen.com>
	<20260414200237.444170-5-pasha.tatashin@soleen.com>
Date: Tue, 12 May 2026 16:09:06 +0200
Message-ID: <2vxzlddoafel.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Apr 14 2026, Pasha Tatashin wrote:

> Add a new test that creates 2000 LUO sessions before a kexec
> reboot and verifies their presence after the reboot. This ensures
> that the linked-block serialization mechanism works correctly for
> a large number of sessions.
>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
> diff --git a/tools/testing/selftests/liveupdate/luo_test_utils.c b/tools/testing/selftests/liveupdate/luo_test_utils.c
> index 3c8721c505df..37c330b9bb36 100644
> --- a/tools/testing/selftests/liveupdate/luo_test_utils.c
> +++ b/tools/testing/selftests/liveupdate/luo_test_utils.c
> @@ -20,6 +20,7 @@
>  #include <sys/stat.h>
>  #include <errno.h>
>  #include <stdarg.h>
> +#include <sys/resource.h>
>  
>  #include "luo_test_utils.h"
>  
> @@ -28,6 +29,30 @@ int luo_open_device(void)
>  	return open(LUO_DEVICE, O_RDWR);
>  }
>  
> +void luo_ensure_nofile_limit(long min_limit)

Since you are adding this to luo_test_utils anyway, I think you should
do it in patch 3 and use it there too.

LGTM otherwise.

> +{
> +	struct rlimit hl;
> +
> +	if (getrlimit(RLIMIT_NOFILE, &hl) < 0)
> +		ksft_exit_fail_msg("getrlimit failed: %s\n", strerror(errno));
> +
> +	if (hl.rlim_cur >= min_limit)
> +		return;
> +
> +	hl.rlim_cur = min_limit;
> +	if (hl.rlim_cur > hl.rlim_max)
> +		hl.rlim_max = hl.rlim_cur;
> +
> +	if (setrlimit(RLIMIT_NOFILE, &hl) < 0) {
> +		if (errno == EPERM) {
> +			ksft_exit_skip("Insufficient privileges to set RLIMIT_NOFILE to %ld\n",
> +				       hl.rlim_cur);
> +		}
> +		ksft_exit_fail_msg("setrlimit to %ld failed: %s\n",
> +				   hl.rlim_cur, strerror(errno));
> +	}
> +}
> +
>  int luo_create_session(int luo_fd, const char *name)
>  {
>  	struct liveupdate_ioctl_create_session arg = { .size = sizeof(arg) };

-- 
Regards,
Pratyush Yadav
