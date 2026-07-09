Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2762347DD
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 17:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616912; cv=none; b=owuY2gvMXiz0b1TVHtkmEJSW7TH5hTN2fK9/Uf+n//UUdbRkk7ejLASvq0b2Gl2iYB+dVbyZ3cHJNRjpfYyzimnswEAraeL6xmgUv1wefWnbOUVz1kpa3ul0MpW1iCbxFb09ae95VwcHM8qaDl08dFaiGPA46FDefrf11zg2EGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616912; c=relaxed/simple;
	bh=Tc4Cjqf1HiSK1Qa/FoMnQO2n3edRUeyX/DxX02s7Nyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C+8y/z8Ea1veoIgQBmRS6e63seFuukhqQqngsm95xqbLiszv5/jwFmP/K7vqOPYOnvsTV+eC92jA+9tP8oEnE19L/zsQX0rf8SZw+ts8b7JRqpe/11ZL9Q+hmCl00rQi9R/FGxtuqDc4X3sUeEbOJKx1YMfWcFoepdZZ///Fnkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=spodLv5k; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="spodLv5k"
Message-ID: <cd0a678b-1eec-42d8-b027-0d27b9c804a3@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783616907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HelTUO9OXDkSGYNwLi7hjDF9zbGVYpTrvUapcIhNbC8=;
	b=spodLv5k2gZn5QAYTrcUFb5Rb2syHI2IKF8Kz4krXv7NaRL6WS/PZGOQRNGrHgqqMCpLJf
	hpqhDfxNDz2H9p5BCTv36PTs9Ub8+nJ2PVW1t45f1LuK1gbsuZkxGK4dsN2FIn0KSVcGc0
	XHGRCqQ0jOMeXJz+7HHZRmCFINGcH5A=
Date: Fri, 10 Jul 2026 01:08:18 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 16/17] selftests/verification: Rearrange the
 wwnr_printk test
To: Gabriele Monaco <gmonaco@redhat.com>, linux-trace-kernel@vger.kernel.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
 Thomas Weissschuh <thomas.weissschuh@linutronix.de>,
 Tomas Glozar <tglozar@redhat.com>, John Kacur <jkacur@redhat.com>
References: <20260625121440.116317-1-gmonaco@redhat.com>
 <20260625121440.116317-17-gmonaco@redhat.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Wen Yang <wen.yang@linux.dev>
In-Reply-To: <20260625121440.116317-17-gmonaco@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 6/25/26 20:14, Gabriele Monaco wrote:
> The wwnr_printk test expects no reactions in some situations, after
> fixing the bash assertion, the test is failing because expecting no
> reaction after a previous step had reactions is flaky without making
> sure all buffers are flushed.
> 
> Simplify the test and run the steps expecting no reaction before the one
> expecting reactions. Also simplify the load function to stop loads as
> soon as a reaction occurs, this limits the number of lines to flush and
> makes tests overall more stable.
> 
> Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>
> ---
>   .../verification/test.d/rv_wwnr_printk.tc       | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/testing/selftests/verification/test.d/rv_wwnr_printk.tc b/tools/testing/selftests/verification/test.d/rv_wwnr_printk.tc
> index 96de95edb5..a23d22f6ec 100644
> --- a/tools/testing/selftests/verification/test.d/rv_wwnr_printk.tc
> +++ b/tools/testing/selftests/verification/test.d/rv_wwnr_printk.tc
> @@ -4,27 +4,30 @@
>   # requires: available_reactors wwnr:monitor printk:reactor stress-ng:program
>   
>   load() { # returns true if there was a reaction
> -	local lines_before num
> +	local lines_before num load_pid ret
>   	num=$((($(nproc) + 1) / 2))
>   	lines_before=$(dmesg | wc -l)
> -	stress-ng --cpu-sched "$num" --timer "$num" -t 5 -q
> -	dmesg | tail -n $((lines_before + 1)) | grep -q "rv: monitor wwnr does not allow event"
> +	stress-ng --cpu-sched "$num" --timer "$num" -t 5 -q &
> +	load_pid=$!
> +	timeout 5 dmesg -w | tail -n +$((lines_before + 1)) | grep -m 1 -q "rv: monitor wwnr does not allow event"


Minor nit: could we add a small delay (e.g., sleep 0.1) before dmesg?

Reviewed-by: Wen Yang <wen.yang@linux.dev>

> +	ret=$?
> +	kill "$load_pid"
> +	wait "$load_pid"
> +	return $ret
>   }
>   
>   echo 1 > monitors/wwnr/enable
>   echo printk > monitors/wwnr/reactors
>   
> -load
> -
>   echo 0 > monitoring_on
>   ! load || false
>   echo 1 > monitoring_on
>   
> -load
> -
>   echo 0 > reacting_on
>   ! load || false
>   echo 1 > reacting_on
>   
> +load
> +
>   echo nop > monitors/wwnr/reactors
>   echo 0 > monitors/wwnr/enable
