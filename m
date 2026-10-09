Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7296A46C855
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 14:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791554875; cv=none; b=M65FKremD7ineOxJvdLK8FjAiTMFhxLc2vlqKUMTTKZfSc4HQed8DvIuitzRWgkziX8CLs1Kti9nSNuF/J+8rU3KgzYIK7gRKR9bdn0KyRwbTIKFW8ElYsVW2N8SuylGjy3Qu2KET7NYxkt6FM126lZ3xyCSla0sY7fHFBWqft8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791554875; c=relaxed/simple;
	bh=jeqQT3ErQIqOUqUA3FctGusMYbwaLCcKXtg5hLRbWUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iL31JLQ2CUGSnzIT+nmbAPmuzqzEnpSODDwTXpnwta2DkLKWm0/hBeeGD0fwuBfOEgYMjeyBrRRoHOvJ9pFc1CZbS8cZJXcjucgqPpod4ZgfYzncTNOcKU29IEx9oRiG0vTeYZFcTZ6NrVqWM7zGxeiYgG7KLYrWPbgz5fxMirY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ejyh0Koa; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ejyh0Koa"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8ab37e44643so49826737b3.0
        for <linux-kselftest@vger.kernel.org>; Fri, 09 Oct 2026 07:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791554871; x=1792159671; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z7MLc2O7alo1H3cSCIlZHz4ofuIV762bYU89FsiyGvM=;
        b=Ejyh0KoaDT3GQDpyZ8WpL7PxfaQMAoSclGV+tjH7VKTSKi9Xlfo47Jbk5IioxWopev
         Mwm5UZhsku0GZyO9ffiZlIc65ZUjnm1cFhPkf6UvTpcwFyGafQdCaVlyZDIYjqNXt/3i
         We3FbQoKXqzo0GauUUjr0GpO32ZYkxgv8J9JdcfNbw0AA6LwE72JB89TaBn0V6j8SFMM
         hZVl/kl3xpJcdsM4vJeQ0bqO8MyAPYmedMjGREPdmGcZsEsbI8XAx6A+TSxIcUZIbMni
         oCxuiL8FPdQTgYFzG1kVuVVBHUTYdUjg4O+ep4wRSBLZtKD4zqLQ248i6fsvmgpiTeMy
         uVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791554871; x=1792159671;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z7MLc2O7alo1H3cSCIlZHz4ofuIV762bYU89FsiyGvM=;
        b=fT+KN0Cj0Eyn5nNvfQy64yLUbr9775Iglh0b+EMmV0Dla/D+r3RFHNkc34W/86/C8C
         m858bDAP96iAM+X3MiyEXxkKujo/RRCI8ftOGu7Pq/wHymNSVqMo7iluprGjO9agzZ6X
         tX5fy8gnYXedZGxPrHQwuuh1aI1XtHIumeZLp1rywcVD0GW4o6fQ5eSrPku2SYqve+F+
         tX0i1/QEaj2/kQXjmFy+WE5OPFQTomeX+rMIAlUF9KUjJhiRJqkYyWGDXxX5hE7nDlLr
         ZzJgGWy1fibRBMqUhD8vIiPnU0+2ObbGPq0FJEiaiRMWlYr49UhFuIIUYaWn4k4vwJVv
         zNJw==
X-Forwarded-Encrypted: i=1; AKwUvBxM1pEIFA7vXhcP29shQKTwlRqILscNFXkFgrJ7kiYVjxOA5l0GXD5RHCW+7S28tRjBx3C071JbALG26zLWKg8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEgWI6fQ7lEY717zxzMIB7jP5gj4xCgS0fTkuD1rY78f1/n+Bl
	Yxg95uJ4lD1SmRQemHjMk7OG6qZRDG7TRh/3O5wsY2q3VHxpvcGPHdHy
X-Gm-Gg: AYBFou14ksTrax3YRyxCOvcY685wBEjQ6oVSrhT8YEuo/l76/BU0Z0jhb2YQa2E5igs
	eIkNmBafOLB3tP0PWlyaTe49H8G6642/O963S0R9quMmvOM4TKnd2ld5htjiR8P0ADIjvNVaTj2
	ZLdvsMuYJmgQuX8u4CIaVD1PsLgSXIrkJ6pcMmdiGKUnc1nO+ecSOWGn8zsR0B7cE4OEBmHj/ZY
	KoaGaisHDYrzJ0GbtTh2b8hSyC1dBz2/t99brZ3IEnQ4SPd4JtICcWe9N05o99kevseXcRY1+Im
	ubJFuZXmgWg5fRAaShx0ibyNDDOef94US7CqPsV2djhrQ4UO2PCvo+LOUPyolVRwtUU6msvP/0F
	vWD8zcLFIyuqDDBuEuRyGdz1iGkzOE6XNvNp1S3SQ3S6UqOcbLz6YeiPkGo1EJ79UX2FUYWvSWN
	aXre+hR6BB8I4TuQ0stx3IudUqgVxKRZtSaKEGW5QlpOrBSfofJZaWGMtPc0K7y0bwhygLU2jDX
	Mfq7q437Nm+e0/JUTtbcv8uHPEXemmjsm4yCSQ6hIqWTIpsDMdE4ErR7DHyZ656f2JnLkDO1Q9X
	aJE=
X-Received: by 2002:a05:690c:ec4:b0:8b0:4f12:d28a with SMTP id 00721157ae682-8b07ed9e371mr4737677b3.65.1791554871247;
        Fri, 09 Oct 2026 07:07:51 -0700 (PDT)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07ee83bb9sm7228667b3.2.2026.10.09.07.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 07:07:50 -0700 (PDT)
Date: Fri, 9 Oct 2026 09:07:43 -0500
From: Ming Lei <tom.leiming@gmail.com>
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Uday Shankar <ushankar@purestorage.com>,
	linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] selftests: ublk: don't keep the fault_inject
 timespec on the stack
Message-ID: <asj1Lw8osFeQ65BL@fedora-laptop>
References: <20261008-bug-ublk-selftest-fault-inject-delay-v1-0-a96af7ead06e@gmail.com>
 <20261008-bug-ublk-selftest-fault-inject-delay-v1-1-a96af7ead06e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-bug-ublk-selftest-fault-inject-delay-v1-1-a96af7ead06e@gmail.com>

On Thu, Oct 08, 2026 at 10:45:39PM +0800, Qiliang Yuan wrote:
> The fault_inject target delays each I/O with an IORING_OP_TIMEOUT, and
> generic_06 relies on the delay to kill the server while an I/O is still
> outstanding.
> 
> The timespec of the timeout is a local variable of
> ublk_fault_inject_queue_io(). The SQE only records its address, and
> io_uring reads it when the SQE is submitted, after the function has
> returned. The timeout gets whatever the stack holds by then and expires
> almost at once, so --delay_us has no effect, and generic_06 fails
> because dd completes before the server is killed.
> 
> Store the timespec in the per-device fi_opts, and split the delay into
> seconds and nanoseconds so that delays of a second or more give a valid
> timespec.
> 
> fio 4k random reads for 10 s at queue depth 1 on a fault_inject device
> with --delay_us 1000000:
> 
>                   before      after   expected
>   I/Os            446927         10         10
>   mean latency   18.3 us    1.000 s        1 s
> 
> Fixes: 81586652bb1f ("selftests: ublk: add generic_06 for covering fault inject")
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>

Reviewed-by: Ming Lei <tom.leiming@gmail.com>

Thanks, 
Ming
