Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15B23D8128
	for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 10:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787741065; cv=none; b=q8RZlqjdX0DK9bILsgtEspJZ+6bKScDEt8ghtVuj3irx2UldbBApi6F1FQwgCuNKbkTjLyVuA1ILbwhcfkaeiyL5KgopGafnMoDE+UhwVZg9Vtnr5kWI8Bhw7+JgLjP73f3LSLV9lK/h8I+7swhVGLILyxZ94j+UzkhcYQNSbU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787741065; c=relaxed/simple;
	bh=SdMHSRPFPOdRrXYnOJuBx+37r+WD5EJCOrrI0x3V67k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUeGX7kHuYLjcfNyDWLV6tXtbZkQixKJ5sfM2mePcRQLqo6uWGexx994ki+rronkVc0Vd4VUCqYNY/B+hCeDBxFuA07ABjZ766tardHlLLt81CagEgiZDT0D9xMBuTUkoRPHbv0IFTjnpzd0udit8qm2vjj+N+2QWu0etUyt/5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FOyH1rPo; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FOyH1rPo"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15e2dab83eso119530066b.1
        for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 03:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787741062; x=1788345862; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pSxv4pYntTUwSidf4pllRCYgkIQxBJh+160AfjnZ5ns=;
        b=FOyH1rPoM2nAJahQPn56FnFwExKPO1/U0Ka95arPzKRDWfTuOtyhF9rsw6GX8rpTBM
         MxyTxE/SjRASR6/3E0ea6mpG8+F/B2ybqjPG8kwgGC/70efEHGmdJ/xCpvipfvYfsBY6
         aXNGxWqdHOT5wdKfYttNcKHwpUdeC58eZtinUoGOtwgEzC7OjYOlu68vjwN782CodE7q
         5WBvLnC22yPSYmpgmqyX2Vv8gGldbRHbMSyiNygfg1GYfSxutfWYK5UhLumpm5OFDGmq
         eP7AyOy/g/bHREWqqO9alnKe2H/PJNeE8M5pQeMGMQwnTE98ZiC+1VBhwFXaOFXLWn4B
         MgtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787741062; x=1788345862;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pSxv4pYntTUwSidf4pllRCYgkIQxBJh+160AfjnZ5ns=;
        b=NkSpXU7wuZBzpz4rWi7y6qFCtONQSCs/luXRD1vu7HMFY3PMvEWAiq69JgBCZvj1qe
         SwAZXgWYwq8uUFPElABcW8Wf3JbNqWo+WkYjIQrkR8SlAZ1LfuFybwKX3VYBb/gM/DT2
         NjuoQ7jfFij8RLO6bVbDQFHv2IuXwgOv4SqZzztntncpsqqOU2qyJy5RJYhSupz5r2UV
         U5NslTK5suGWLn10o+k/iCmaLVthVw88iA/kBTmScbwBN0WIeCPRpFyL0iepzaFv3Xkr
         uNi4bZLmoLx5gJD+9M1J5o5CJBhGjbnNuIOD3QYxx9vc98kVr1W4AVSfHe0Mzs4TD+uU
         7SNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr9jLxmIDg8AJhfjCG5ChkrpAlac/7aES1JuKufGkp6Tb1KWBsqhE56qcT0Rq7Vzqn0FCSN1snuYcC1Ur7NEUw=@vger.kernel.org
X-Gm-Message-State: AFuF++lbnSyLDo9bnAgC+5/DsjkrMgaj4tiD9ora3m5lGnsZw6BFaWiI
	LM+jSRxwaWtpx1nUtVssNCzfG8SZSQAA//AF4vazwD/fxlS4MjMN1rKpHTODCXBBDa1Zih1LRO3
	qORgKzGIc
X-Gm-Gg: AR+sD10KHKCijuf9zoCh/HO2fYjihmzcLFbQCrfCxu10fj4ZXnQkTC7kowWQpIUtiDy
	X4KrX9vgCKhic7Q87aGijimrJk7og/sEQRcQpUJLZ9yDi1ui4Ld0HPu3JB6a+hLDLFj83A9wKGE
	dYrSdT1Ryqc64CjrXmnblOlzWqCaXoSmAnZrprleFL9oATp9Csg6vuiOr2srRHm0uz1GK8+Z8pE
	Z98ZA54GQ4q0kT6hq6xBxnX2YSbUJ+UMQhO3Hq0v1fV3IReHDU9ByZBULbNf3suW/x0ROSN41a9
	o4Zh+GdKWTI82ygBHxd9PyAqxaZ0iQ0DGIajq7lqih2/n9zu5FgtybAjXspKcQW3HZknSoiNpQg
	KUBB7Ozu/9TWd7riApF7T2kvm7LXRhDHfyFPmn+kFA0PC3ohx4Mf+2wLmHaqUgsBwN6segmaK3u
	o4VwiRWaq52KTKqVhmJSBBn7uxG0HnCWTeWGIXd2Qw0gOo38TJGXMkDUyh1YUqH9jt+Af4DGyOo
	+ftdAcTM0XTMT3Ubfhltyafyas/Rw==
X-Received: by 2002:a17:906:ee88:b0:c12:83da:7eeb with SMTP id a640c23a62f3a-c250c3add0dmr673831966b.19.1787741061401;
        Wed, 26 Aug 2026 03:44:21 -0700 (PDT)
Received: from google.com ([2a00:79e0:288a:8:7967:21e1:13c1:d2ae])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d69a7sm642416766b.8.2026.08.26.03.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:44:20 -0700 (PDT)
Date: Wed, 26 Aug 2026 12:44:14 +0200
From: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
To: Wang Yan <wangyan01@kylinos.cn>
Cc: mic@digikod.net, shuah@kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	Haofeng Li <lihaofeng@kylinos.cn>
Subject: Re: [PATCH] selftests/landlock: Fix snprintf truncation checks in
 test files
Message-ID: <ao7DflLdx7-lFyvk@google.com>
References: <20260626070016.61049-1-wangyan01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260626070016.61049-1-wangyan01@kylinos.cn>

On Fri, Jun 26, 2026 at 03:00:16PM +0800, Wang Yan wrote:
> Commit b566f7a4f0e4 ("selftests/landlock: Fix snprintf truncation checks
> in audit helpers") fixed the truncation detection in audit.h by changing
> the comparison from ">" to ">=" to correctly handle the edge case where
> snprintf returns a value equal to the buffer size.
> 
> However, the same pattern exists in ptrace_test.c, audit_test.c, and
> net_test.c and was not fixed.  snprintf() returns the number of characters
> that would have been written, excluding the terminating NUL byte.  When
> the output is truncated, this return value equals or exceeds the buffer
> size. The existing ">" check therefore fails to detect truncation when
> the return value equals the buffer size.
> 
> Fix these remaining instances to use ">=" for truncation detection,
> matching the fix in audit.h.
> 
> Fixes: 6a500b22971c ("selftests/landlock: Add tests for audit flags and domain IDs")
> Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
> Signed-off-by: Wang Yan <wangyan01@kylinos.cn>
> ---
>  tools/testing/selftests/landlock/audit_test.c  | 2 +-
>  tools/testing/selftests/landlock/net_test.c    | 4 ++--
>  tools/testing/selftests/landlock/ptrace_test.c | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/landlock/audit_test.c b/tools/testing/selftests/landlock/audit_test.c
> index 72b5612375dd..4bea8c880a4d 100644
> --- a/tools/testing/selftests/landlock/audit_test.c
> +++ b/tools/testing/selftests/landlock/audit_test.c
> @@ -31,7 +31,7 @@ static int matches_log_signal(struct __test_metadata *const _metadata,
>  
>  	log_match_len =
>  		snprintf(log_match, sizeof(log_match), log_template, opid);
> -	if (log_match_len > sizeof(log_match))
> +	if (log_match_len >= sizeof(log_match))
>  		return -E2BIG;
>  
>  	return audit_match_record(audit_fd, AUDIT_LANDLOCK_ACCESS, log_match,
> diff --git a/tools/testing/selftests/landlock/net_test.c b/tools/testing/selftests/landlock/net_test.c
> index 2ed1f76b7a8b..aebeafd80466 100644
> --- a/tools/testing/selftests/landlock/net_test.c
> +++ b/tools/testing/selftests/landlock/net_test.c
> @@ -2777,7 +2777,7 @@ static int matches_auditlog(const int audit_fd, const char *const blockers,
>  		log_match_len = snprintf(log_match, sizeof(log_match),
>  					 log_with_addrport_tmpl, blockers,
>  					 dir_addr, addr, dir_port, port);
> -	if (log_match_len > sizeof(log_match))
> +	if (log_match_len >= sizeof(log_match))
>  		return -E2BIG;
>  
>  	return audit_match_record(audit_fd, AUDIT_LANDLOCK_ACCESS, log_match,
> @@ -3072,7 +3072,7 @@ static int matches_log_connect_bound(int audit_fd, const char *const blockers,
>  
>  	log_match_len = snprintf(log_match, sizeof(log_match), log_template,
>  				 blockers, addr, lport, addr, dport);
> -	if (log_match_len > sizeof(log_match))
> +	if (log_match_len >= sizeof(log_match))
>  		return -E2BIG;
>  
>  	return audit_match_record(audit_fd, AUDIT_LANDLOCK_ACCESS, log_match,
> diff --git a/tools/testing/selftests/landlock/ptrace_test.c b/tools/testing/selftests/landlock/ptrace_test.c
> index 4f64c90583cd..65cf2d82f721 100644
> --- a/tools/testing/selftests/landlock/ptrace_test.c
> +++ b/tools/testing/selftests/landlock/ptrace_test.c
> @@ -302,7 +302,7 @@ static int matches_log_ptrace(struct __test_metadata *const _metadata,
>  
>  	log_match_len =
>  		snprintf(log_match, sizeof(log_match), log_template, opid);
> -	if (log_match_len > sizeof(log_match))
> +	if (log_match_len >= sizeof(log_match))
>  		return -E2BIG;
>  
>  	return audit_match_record(audit_fd, AUDIT_LANDLOCK_ACCESS, log_match,
> -- 
> 2.25.1
> 

Thanks for the fix and the reminder!  The fix is correct, because snprintf()
returns the number of bytes that would have been written *excluding* the
trailing NUL byte, whereas the buffer size passed to it *includes* the
space for the trailing NUL byte.

Reviewed-by: Günther Noack <gnoack@google.com>

—Günther
