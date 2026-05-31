Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7362C031E
	for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 13:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780234553; cv=none; b=TQuiyaUmoNILdETSDvhOwAoyVyB/EUqXhT7V36sJ3s0SEd9c1CLnh+3SvjcUT0Y8PrA0Xs8JqCkUMHOix4icmICbWEgAzgPiFJmzze5571re6+l2SnR4+0cEnoL/LmCfSFJE0H61H6frcEUxn1rnPS2sWVajYumRrQAVy8wKQrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780234553; c=relaxed/simple;
	bh=wSZz+AzdlVOHc9rG+lsEwhIOCICN5R2ptJEM8nrsYKM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBtjaprBfAuc14ZgoRdDAP/zuSy7tXAqXFM3GL/j18WjpjNlYKgLkPUhn4qhbj9VmmqlD8OWIbLJSYcVyZDveqZKjz7Z83QiohhL2PZ9hkirBm0dK8KZFqq8GkXdTP08GXSOw1Tu8IUmJjSNdONRtQmCv6JN96n0mTenL1kX/gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=kG99phYZ; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="kG99phYZ"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8ce0f17a69cso6740846d6.0
        for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 06:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780234550; x=1780839350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ecmbfN6Hxv0wzfAQ6MM3bdc8Nu3WaBbGIPmE7GrM3yA=;
        b=kG99phYZ+rEyxpR1LQJ6oRzQ/wUnAdfJvSc+pplmMsP6OiJbEPKB0fnOOz6qSSkUUJ
         UYC5jvzU6RUZypAOoLyRHgKh8wzG0aUR9JPYWgoAKvX3LA6KmRjt4mNVwxNBHgF+qbPj
         SAbRIAT9YisQBcNZe8bjncHvd/AK0TvkiQYu77yGgza6aXi3WgfbF03gm6h02eaMVP59
         6KKcDWKEEHoTae1TctROW/mAmdkJiuRiv+OYnL0UwmESdW2UgNyj5yh/a/uwCmttRz5y
         UgXtMTVmQ0sBM04jv827GywAIpuxG9PpSHhKIvkM5bW+ehcuj57IozUNUNGSB5abip7s
         qghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780234550; x=1780839350;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ecmbfN6Hxv0wzfAQ6MM3bdc8Nu3WaBbGIPmE7GrM3yA=;
        b=tKOhtBmpxZedCGK0BR74DoqzHfaepnCM4gryyy5VG1o0wfcp4CJXNTXwOGQDMGzLed
         V7+b5M7CgW70eHiilFeDUXY7Sg4XWiZMXMoq23Z2o0feOaiJOwpGu0NkIeeuTDYdwDKW
         ReCedGy9D//3JpDKkTHxUykXNeluqg31Usi6oun2w8HnuP8L3ryZoBtgPZq6+BE14XqQ
         Q5ZVs4Uo9nH3DueNHakpMF5t+puFhzbxW+u6lnPtdWHxpl8mONAxM6TWHawND2xiq3OH
         EYZcPcqybIQQMC4k1fxj5NLdLgM4Ou/51mSh6HloKR3cK1yDDnfUO4yuLBZ4kyvV7zHR
         j7JQ==
X-Gm-Message-State: AOJu0Yyq1h72YHS436r+rCo/4QAZ92Xia43Zglf4Mnnz88lDVc6zLJ4j
	LblPLfeVtPKXkWhif8Zuvh6AuG8jh9jw87Y9pY2fVF+UtSqpVBxN0kWtR8v/6EoTyBgYrYJi1jo
	SUYqI
X-Gm-Gg: Acq92OGGDk3CJzC/Dm2jTwtn87hkvro2tsxQJlT2HIEP09trFO4/BOjoc+boOQhJ5WG
	9bOC6hAsyfDzTCJ2lC5N75nk1ZO5FC+SG3dbMoWww+C5gz+tmcEi+fN8GZDhVGB223a4ekzEgXh
	oy/qxIE2vfofQqYNoHzFpCDADDs/iSRdy3s7zMnpqFMuTfz+kVZiZCESAkQOTO/3jYnjQvlS0k5
	RzdTw2o4XnXyEoE5hZM0yReBsWg/l+tJwn/TNAA8O8/a8is/3jnF0zVOrJnQkeO3u62ON4ANiKo
	bxhFBI95GI2d27b+Ai2CgpQlyimC4BsYZ7RD5IjssNRUtXw+iVO4cFwrXatBgvCEaZ9AsXX2jnb
	ssWLcIUosgqMzAcLy8Y9cs3zRu8NZdyeXYW03PPNbaTUqIlBqp4tmBdbMBJWWnvSAbngUT5S68q
	6eBqlskGfOgCpzstvhzAoutPmQpHRd4JwOCvK8xgHgVL928NjeZH7tBYKP8tLJSg==
X-Received: by 2002:ad4:5f8e:0:b0:8cc:ee2e:8d9b with SMTP id 6a1803df08f44-8ccefd58403mr113278696d6.18.1780234549737;
        Sun, 31 May 2026 06:35:49 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea0425dfsm69984996d6.3.2026.05.31.06.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 06:35:49 -0700 (PDT)
Date: Sun, 31 May 2026 13:35:48 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, 
	akpm@linux-foundation.org, linux-mm@kvack.org, skhan@linuxfoundation.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net, 
	pasha.tatashin@soleen.com, dmatlack@google.com, kexec@lists.infradead.org, 
	pratyush@kernel.org, skhawaja@google.com, graf@amazon.com
Subject: Re: [PATCH v4 01/13] liveupdate: change file_set->count type to u64
 for type safety
Message-ID: <ahwv0ZiyQ6TzoCah@plex>
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
 <20260530221938.115978-2-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530221938.115978-2-pasha.tatashin@soleen.com>

On 05-30 22:19, Pasha Tatashin wrote:
> This improves type safety and aligns the in-memory file_set->count with
> the serialized count type. It avoids potential truncation or sign
> conversion mismatch issues.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  kernel/liveupdate/luo_internal.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
> index dd53d4a7277e..ae58206f14ac 100644
> --- a/kernel/liveupdate/luo_internal.h
> +++ b/kernel/liveupdate/luo_internal.h
> @@ -52,7 +52,7 @@ static inline int luo_ucmd_respond(struct luo_ucmd *ucmd,
>  struct luo_file_set {
>  	struct list_head files_list;
>  	struct luo_file_ser *files;
> -	long count;
> +	u64 count;

From Sashiko 1:
...
Since FLBs use a single contiguous block for serialization, an untrusted
KHO payload could provide an abnormally large count.
...

Answer: NO, there is a chain of trust during live update. The previous 
kernel acts as a boot loader for the next kernel, and performs all the 
necessary verifications. We trust the previous kernel to pass the right 
things if compatability strings and format matches. KHO payload has the 
same trust as the previous kernel.

Therefore, we assume the serialized metadata is well-formed and valid. 
Defending against a malicious or hostile KHO payload is outside the 
threat model of this system.

From Sashiko 2:
...
If luo_session_finish_one() fails (for example, if a file handler returns
-EBUSY), the early return skips luo_session_remove() and
luo_session_free(). Since this is called during the VFS release operation
via fput(), VFS will unconditionally destroy the file descriptor regardless
of the return value.
...

Answer: NO. A finish failure means that we cannot safely release 
resources, as they might be associated with devices and DMA activity. We 
deliberately leak these resources to avoid memory corruption and data 
leaks. When userspace fails to finish properly and closes the session, 
the only way to recover these resources is to perform a cold reboot or 
another live update.

>  };
>  
>  /**
> -- 
> 2.53.0
> 
