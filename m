Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274398;
	b=nD4ZJPCYYiiYEJ3XxOgIQv/PFga9xdaNCg34qAlu70rRB1ePiQRrMGkM4jhrSS53Dbhn
	 JnyoyPtSqFL3R31BO749y9WpdkdF9cnAuiRu3ij6/QB3v02a5i7MVeWdVTFxhu4nWz+Km
	 1KOlIj1YSFQ1E3brMwbW3cdfR5yoybV8c8McFVCGhNQp6LPiU2gE9edvTda8PPlHK6B/p
	 Y4nh+UHdpbuo7z6ITI3Kqv7HrblRVrPwdMUe4iFe/qQw1VvQw/eFoNz17evUMDv8V9rb9
	 V5XVgU3h3Ks24sCgpSxgD1BXsf5EM40YaJmb/mtO0jLcoL05fcDqEWil34fI2P3nG5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=d3tI+lsKyAfo2SvveMIf16nV49egeDWrXlEVyRU8qIQ=;
	b=zz8xAQukDSGTZSOA/QfZrEob6tex62TkQzVYdeIq0fBHjaS5ojPXz9I+xY628bQ6qGQH
	 uXvoG9aULKg5H17JcTPTU09JstPA7PBAc8Nxw+xlkzJMT9j/gAxavvG2ttT6ty9ucOjbs
	 BQfQV24K+BlJwhis5jgwFkOoQSBYP6VALVsz5DHnXXCmMMwsekuGDqLmnUXNGfTXu/M8r
	 l5uSeBUbA44a44s0+t39BVm8JV7/MSGfNNNgIM7L1aOLetmonz5iAAMB+GobTzruimmcn
	 3zfHFAdtN5nSF64RR3WskJUEwgol1NpBh2x2mTdKfn6PAN2AxJL8DQ/bgV1VEKsrmmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XVHGU9Tl;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD11606A31C
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 01:33:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FD11606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XVHGU9Tl
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7f84a55e31aso853467a34.2
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 17:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794274397; x=1794879197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d3tI+lsKyAfo2SvveMIf16nV49egeDWrXlEVyRU8qIQ=;
        b=XVHGU9TlCNvn8SAG6DT6WOXE24tSSOdY7Yd54yFIcu7jisGEApBnVZrvrHK64dCFPO
         mdfCax0KkOeN7fRgNTL3zzXk4waBuQhuPjKPkYUz+PwmPKIZBY7aRroR8HQj7ECAfyrc
         c9jbN+Ob3ehQIQNLnACmUlk71fN6mFqVMLEQkqn2FaW8e44hSLuK/6sb2o/3YvFmwAp7
         1PwvKvydQ0PodW18+InPS1Vk8+3c60dT7bjoS14XSdDRoSnxrFw5v0bJrE2u9VsnsYtc
         UWydCUPHZKyy/HkDOfNsWpoHLN3tyxOfR+aBfO7CdC8n5h0QUBbZ4kczyMBiZl/vXLsp
         cPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794274397; x=1794879197;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d3tI+lsKyAfo2SvveMIf16nV49egeDWrXlEVyRU8qIQ=;
        b=S1B8d3lp5EP4psog70vpjeueBQ9rKEGSr3YPg+YDoNmjcvDRNQt2StfUvT+7y/VSi8
         pERt3DZuJcU7E6wv/HTdPER2iNKqNm0zyh5n9eVYKQ59zOj6gaLp51xI1nivQzCpbt84
         KaJEnWwqNlRffmB/E+AmNvgaKHScM4R6Kuu4qpP7eb6cU1hIlKmK/6to7B9jmDhE4tQM
         WBOGKpZfoKYfzFoyGkRqYRmgWH1RILebRv7fcYcnRSZLpQzjjtk0WCkDzbmFVQkRZ8yc
         LxvE8XEf77I0eLk9Z3bKHQ7jMADH+wOFiukvLyBViOiyPQZ0AU8iAX0ud3HaXL5njVc1
         9ZGQ==
X-Forwarded-Encrypted: i=1; AL+hErH38R+9VcNqlBHR3zMuA0Jgq9FpkxdJt/cpD2S9EZxDhMQz4/jc/Tpf5cP1Env+Bg396KsowcBLxPl8QAtKbvM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/h7ue20PN8mb2Y7uw3LgA6Om12gfu3exoxrijHqKK5LJ00DXyk
	9hVDdvpujjLpkZmmDakRxWjPM14KqNwdGVOeQFjmH8oRwwbg+kAcYfnC
X-Gm-Gg: AYBFou1qwBX4gpN+kCAoOzkGsOudHbkl4UDSWZssWxuRG+NjGplEZPQSrR2l8c9/JJZ
	MHFO0glXXPoSBZ5YJnvQ3QNaRTfYKvSo8ppLWfhRAS8UbS2+a88Ji+BAh1N4zSIZ70jaACKXJhR
	wYvdCLnA4eJpW1UBWKEakz6XQ77rdS6xeQG+3M5WSDdXnnlmYBqpIosS+Sb7pUKaNnzimgCk0RD
	8eh96CSL9YWOC+jLx+VqKIvlBvdt97fRznOnb6A1Fpz+zYDWJTv0IFTm7UTOdaNQowgZ7u5fCZ8
	+8cXR6I3gQawyROkhC9iCAKBJuiveFK/UcCuA4SFWsy0bDxq2CLPxuxMx7H4gd5VL/ec1L61fs3
	Dt4L4LBI3vEsQPd3oI5kT1NRuWphMiY8RaCtFPzQxm2i08AbvTzLwbsxY6BoS6loWueN/pfoyHk
	F9Y5Ak7cT3RxHZ0IPDDr7+CHw1uVx8tRj/yCMBnFQBcLPD3UwAilrCjteiBjLRAGk/OY2gvIaso
	lhWHyT2DYChv7eCYfJiIm6mSKQZ3HhzkaJ+BEj57vH/8+1UmeGfcXiFGcJaiCWiuU5qvDC/S7D9
	YByq8hEi9Tb8cgEEKs9MHXsOHHYpX4bPeNh5JBa2TeCNPtNGeJCwJqpej8/j43bW4ud/l8aIPcA
	1VwVHTxifRp+9RgrINdiHWMKtleiv9MI=
X-Received: by 2002:a05:6808:2216:b0:4d6:90f4:48b1 with SMTP id 5614622812f47-5683cd641efmr969958b6e.51.1794274397045;
        Mon, 09 Nov 2026 17:33:17 -0800 (PST)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504e7dasm802773b6e.5.2026.11.09.17.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:33:16 -0800 (PST)
Date: Mon, 9 Nov 2026 19:33:10 -0600
From: Ming Lei <tom.leiming@gmail.com>
To: shao.mingyin@zte.com.cn
Cc: shuah@kernel.org, linux-block@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: ublk: propagate recovery worker failures
Message-ID: <avJ0Vn9G7XhZv-XL@fedora-laptop>
References: <202611092358134332uegNg75loROSwL53Em6A@zte.com.cn>
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
In-Reply-To: <202611092358134332uegNg75loROSwL53Em6A@zte.com.cn>

On Mon, Nov 09, 2026 at 11:58:13PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
> 
> The recovery tests update ERR_CODE in background subshells and use wait
> without PIDs. A worker can report a failure while the parent still prints
> PASS and exits with zero. Calling _show_result() from a failed worker also
> removes shared backing files while other workers may still be using them.
> 
> Wait for each recorded worker PID and aggregate its status in the parent,
> keeping failures ahead of skips and preserving errors across batches.
> Return worker and device-creation errors without reporting or cleaning up
> from the child, so the parent can finish waiting before shared cleanup.
> 
> Fixes: 57e13a2e8cd2 ("selftests: ublk: support user recovery")
> Fixes: 533c87e2ed74 ("selftests: ublk: add test for UBLK_F_QUIESCE")
> Fixes: 63276182c513 ("selftests: ublk: add user copy test cases")
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
> Tested on native x86_64 Bash 5.2 with the recovery scripts and common
> helpers from the unpatched and patched trees. Device and I/O operations
> were replaced by test-only stubs. Single-worker failures at every launch

Please run the real tests next time, it just needs one kernel with
ublk enabled, and stubs can't cover what the tests are supposed to
verify.

> position, multiple failures, skips, signal termination and device-creation
> errors no longer produce a final PASS or a zero exit status. Successful
> runs still pass, and cleanup follows all worker exits. Prerequisite skips
> still exit before preparation. The 71 scenarios passed their expected
> checks on each tree. This does not exercise real ublk devices or I/O.
> 
>  tools/testing/selftests/ublk/test_common.sh   | 23 +++++++++++++++++--
>  .../testing/selftests/ublk/test_recover_01.sh | 20 ++++++++++++----
>  .../testing/selftests/ublk/test_recover_02.sh | 20 ++++++++++++----
>  .../testing/selftests/ublk/test_recover_03.sh | 20 ++++++++++++----
>  .../testing/selftests/ublk/test_recover_04.sh | 14 ++++++++---
>  5 files changed, 80 insertions(+), 17 deletions(-)
> 
> diff --git a/tools/testing/selftests/ublk/test_common.sh b/tools/testing/selftests/ublk/test_common.sh
> index af2ea4fa1..c5adb4d29 100755
> --- a/tools/testing/selftests/ublk/test_common.sh
> +++ b/tools/testing/selftests/ublk/test_common.sh
> @@ -379,6 +379,26 @@ run_io_and_kill_daemon()
>  	fi
>  }
>  
> +# Collect recovery workers in the parent before removing shared backing files.
> +_wait_recovery_tests()
> +{
> +	local pid
> +	local ret
> +
> +	for pid in "$@"; do
> +		if wait "$pid"; then
> +			continue
> +		else
> +			ret=$?
> +		fi

Nit: the above can be simplified as:

		wait "$pid" && continue
		ret=$?

Not a big deal.

BTW, test_stress_*.sh have the same issue (ERR_CODE set in background
worker + bare 'wait'), which may be handled in a follow-up.

Reviewed-by: Ming Lei <tom.leiming@gmail.com>


Thanks, 
Ming
