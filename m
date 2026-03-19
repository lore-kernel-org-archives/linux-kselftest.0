Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAE43A8F7
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 14:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773931684; cv=none; b=jzZ0ECssFWluEefV8Icjha98Sb2TR04G6B5IOBPfSF7mGSwOoOFC452aPV1dWV+paIYMkSgRluNV1rzRu/MjvCOc51z1pjeyEFC1bvYEJif6zYZiKbUSpgZ94BGpBKMie1RYzWL/J4R12CN1DFnJD4Aweti7L2XxSYp8wiWJV5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773931684; c=relaxed/simple;
	bh=TQ6tZAv1X/MiSG/35LnRm1f4p+urmkd1+tRCg1aX+AA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVvFdswNEu1RWdDVWALaz/v4RRbFxLa6xqe5SgbcOeE8o0AckHanQuaSGyYiwn6pSMXOSNQoOQKjQ4uj8e4J2wXsmmB3EWkvjJapOqVbL2I2RnjuRyXbAJ26pCIn6xjW1e7GRBPwJDVvqHsNeGtyFcB3kNGZ2OjCXGwCNNUgYSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dnZDrRgy; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dnZDrRgy"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so10876995e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 07:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773931681; x=1774536481; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3194ASGyEgYHpaXFn0Ug3zQCPiBCKFdTtdy3JOZVwi8=;
        b=dnZDrRgyX2+JxmALePqhzr2/7SgJtiQzpUZUkUMFfRputLBtSIKS7EMMp06Sq9MO9d
         5iHwiwYSeZVgjh33sUZAfC75twJw4VVCY0E9X9K5fk4R6CO9tojhKuhczz9PcQ5IhR24
         kAjCUJBQStdQKbEU6Bn1TF8TkaDrFr1XrSbBIOoR3l9jfxkBNBtCe5r2PxJjNeLTz6EV
         sNE9LH8kiggPti+QzH0VnruaVn52XyQe0aRnw2Gm6quv0VRR7JEP1tU9XAkzGg8h1Gdq
         Iy3XGWJzAqv5bYG1PRczDZe0skwvVebj1fp5aBzxh6GR/1vCsEs5dK4cjAys2kaF/ZO3
         7xWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773931681; x=1774536481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3194ASGyEgYHpaXFn0Ug3zQCPiBCKFdTtdy3JOZVwi8=;
        b=ExJYTX5GBese3/22wQZOVV0cHMlh7A7+otok7IwKGBIKe7XDVyl8uCo/x2hXrvM8QE
         5SlQsYzHidLvsdjZDPfDT6eTfgoQOdwBGY+POi5W12kYb5MdZszeaWj67E3/v+PRgWoQ
         KaH27t7ube7CjsLX4VjnpO8PjsU5d1aHgNahXYQeiDMhx+0DdthIkzDEeJZhMpAi3nI+
         v5dLr8RhdB4hiDgaU3HAhMWwzGr0oLpk3MrdrkGGHaXPK+QVyapjDOSBl5zXJLVJaKVe
         io4AuadgKnzpA+slQcozwM53SMGmQ7H3yF4FAPXdFSae289+Gezl2Bza18JmDyk9Nz9p
         OK+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXruTocCNogA+D2r9BNW+ITSYFTXMMBV1/CrBznZMysjZ3gFMrR6T9fkhFWCtAzpTUK3NoEIeT3gjeSHhYG8cA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPHdQ6krqVeDOVgolazhvTLmRsfXQDAW5YNRyNqbcA4fJNsJ9t
	eTQkpfSvR0UdARehVVGOvZJTlH67M3EwbTU9tEw2EyhPEgyz13NO6Lkj
X-Gm-Gg: ATEYQzzCl9fszAP9oVWpua6yh7Lgzc7AalRfwmjLY/UjHbhFrNDWVP+VAnaS6ZqQnhx
	fDlwvH2frtuOWVXLHwhMdnSiwf0uZsEA2y0WSYNs+LWlangu3UW9DfcAZVNyO6ecp7321RDeewt
	VNZVcBiO9fw7FqFiAJxhxaCodlnlpwUDNndUmO/TH39ObOnyZ98fGRXmCiOk28VPVAxgxYWMBjP
	shBNeLwiaTgkCXF3cuhxe7A6k4bqB72Dw5CORiFjxty3K0EMSg+n1SpI/ftg2iujRisyiIx20Fb
	/GKawYk95L5i5YpNk35FHo2qSl4/7RxmNlT2xF4RnguK0GQ+YtgbQ1COkhz/xzkNxRfiNPjKZ0H
	/yGN3QLsgDJqywIL7Yc7Ibc1Rg9T0iLCIXFj+x3FcQbPOq7ukESLongSbVoAYTso5s7Gyl4JjUN
	rWPzxmG6q0Tg4P/VDDj/F8GS716Ksr/GdaKblVLpsOirQCwRJx4cMxY5mVfaTNIbvSfkPaIKZTE
	Q5XUgtcJranPiWwg8v2vanYTTx7yBRPWD2ajg1JGgx0PONiMqUP2zuYk+nFBe0=
X-Received: by 2002:a05:600c:1d0c:b0:485:3d00:efd with SMTP id 5b1f17b1804b1-486f442df4bmr118060715e9.7.1773931681208;
        Thu, 19 Mar 2026 07:48:01 -0700 (PDT)
Received: from mail.gmail.com (lfbn-ren-1-685-61.w81-53.abo.wanadoo.fr. [81.53.253.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184962bsm16644574f8f.7.2026.03.19.07.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 07:48:00 -0700 (PDT)
Date: Thu, 19 Mar 2026 15:47:58 +0100
From: Paul Chaignon <paul.chaignon@gmail.com>
To: Ibrahim Zein <zeroxjacks@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, martin.lau@linux.dev,
	andrii@kernel.org, bpf@vger.kernel.org, jolsa@kernel.org,
	kpsingh@kernel.org, linux-kselftest@vger.kernel.org,
	haoluo@google.com, revest@chromium.org, john.fastabend@gmail.com,
	shuah@kernel.org, sdf@fomichev.me, yonghong.song@linux.dev,
	song@kernel.org, eddyz87@gmail.com
Subject: Re: [PATCH bpf-next v3] bpf: fix out-of-bounds write in
 bpf_bprintf_prepare with %pI4/%pI6
Message-ID: <abwMniHt2AZcPBas@mail.gmail.com>
References: <20260319124901.9207-1-zeroxjacks@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319124901.9207-1-zeroxjacks@gmail.com>

On Thu, Mar 19, 2026 at 12:49:00PM +0000, Ibrahim Zein wrote:
> In bpf_bprintf_prepare(), the bounds check for %pI4 and %pI6 format
> specifiers uses sizeof_cur_ip (4 for IPv4, 16 for IPv6), which is the
> raw byte count of the IP address. However, snprintf() returns the
> length of the formatted string, not the raw bytes. For IPv4 this can
> be up to 15 characters (255.255.255.255) and for IPv6 up to 39.
> 
> tmp_buf is then advanced by (err + 1) using the full string length,
> which can push tmp_buf past tmp_buf_end. The next iteration's bounds
> check underflows due to unsigned arithmetic and passes, allowing a
> write past the end of the per-CPU bin_args buffer.
> 
> Fix this by checking against the maximum formatted string size:
> 16 bytes for IPv4 and 40 bytes for IPv6.
> 
> Fixes: 48cac3f4a96d ("bpf: Implement formatted output helpers with bstr_printf")
> Signed-off-by: Ibrahim Zein <zeroxjacks@gmail.com>
> ---

Please include a changelog whenever sending a new version. That's
typically the first thing I look at, to get an idea of the current
state.

>  kernel/bpf/helpers.c                          |  2 +-
>  .../bpf/prog_tests/test_snprintf_ip.c         | 54 +++++++++++++
>  .../selftests/bpf/progs/test_snprintf_ip.c    | 78 +++++++++++++++++++
>  3 files changed, 133 insertions(+), 1 deletion(-)
>  create mode 100644 tools/testing/selftests/bpf/prog_tests/test_snprintf_ip.c
>  create mode 100644 tools/testing/selftests/bpf/progs/test_snprintf_ip.c
> 
> diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> index cb6d242bd..dcaa822ba 100644
> --- a/kernel/bpf/helpers.c
> +++ b/kernel/bpf/helpers.c
> @@ -930,7 +930,7 @@ int bpf_bprintf_prepare(const char *fmt, u32 fmt_size, const u64 *raw_args,
>  				goto nocopy_fmt;
>  
>  			sizeof_cur_ip = (fmt[i] == '4') ? 4 : 16;
> -			if (tmp_buf_end - tmp_buf < sizeof_cur_ip) {
> +			if (tmp_buf_end - tmp_buf < (size_t)((fmt[i] == '4') ? 16 : 40)) {

Maybe this code could be improved, but I don't think it's going to cause
an out-of-bounds write as the write into tmp_buf is done with snprintf.

>  				err = -ENOSPC;
>  				goto out;
>  			}
> diff --git a/tools/testing/selftests/bpf/prog_tests/test_snprintf_ip.c b/tools/testing/selftests/bpf/prog_tests/test_snprintf_ip.c
> new file mode 100644
> index 000000000..5b000d6d1
> --- /dev/null
> +++ b/tools/testing/selftests/bpf/prog_tests/test_snprintf_ip.c

This new test is always passing.

In addition, when adding selftests that cover your changes, it's
preferred to introduce them in a new patch.

[...]

