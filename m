Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E598133B6E3
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 16:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772813705; cv=none; b=aSNtIPRmOvdshMM7VAoO2369Ll/6B+o3IBb8UypMYkF4HOK8XQAwlPIMapE3emKFmyAUkAzeVms3XS4/ixF5P8hgEOXLRmxWh4fQbub8MP6Rbi3cMKKIpYSSgl4/jIbPQ4KU0uHYAjY7GAvXHdbLEUrxzFDF09hzkeBEfdSZWE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772813705; c=relaxed/simple;
	bh=ZZ0W6nD9OBV5DaYZIwOImJ+cwH7dOfWfHd1We7Vj4NU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MAOTManGA1OAWnU0hhRewHCBuY8WjVwGIN9aoa+LW3CXNGrrysILYm9wgB5fm/QHQb9wT3XvJrvLBHrBYYovUjL7G6XOjm4N+BBszoxtlbTr4QzYoidDK2SSsUYQoEwoAzFyrcs3+RZYrJJmixeHAKkGUWiDAs0e1fgbaA26U4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cdtkp0Un; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cdtkp0Un"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-483bd7354efso123275395e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Mar 2026 08:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772813702; x=1773418502; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=occXS8oae/w92EkdqzWgWwMsYESYdwlcKweLDrs0LpM=;
        b=Cdtkp0Uncw1CKdi0ogz3+JO9ZmACUPIUo9n1++E6WwWcdHClzakO+shjzwFeBri4Uv
         SQ42RICgE59TB9j5sr7z+Zh4XI0fhqvOBzrZ9PI47LxsYE7/c9pDQI3IUxtbPOxSmIC/
         thMZQZf4xx8U5RYQuOFoIcTOiU3ITvTb4h4pHzo4DIg1Cb1rLr1jbBy8JLKte3ae8hqB
         0Gpypy8ilgDFQGJqMJ8LcgTgNQdc2QgsrqItzUWYOV8NQajBTgCHxysWqFpZFNYZ0/IC
         j+nxyTYUGPdlq5+X6rIXHKv30hpe6lEkB+FWzqkb7TEKaga3GK/EDYmhKIhqdg4psfVj
         9Fhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772813702; x=1773418502;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=occXS8oae/w92EkdqzWgWwMsYESYdwlcKweLDrs0LpM=;
        b=S7/kGd0Y5NFtL+pvHgbu8BOoGMqy+pw/0ONgyfP0J7lCUUuS+tPXJf9EKhLPjywck3
         0vKTPQ4ZGMl7GMCEpOZK5bmumwdHZ3gmfV8d8HSDOzL+348h7mjmAi5feq3LQhEw7Pfj
         5mIovaHJwlorqNpTueo8AboQJJ/7zmu+yYYRLirf90sF9rzheK640L15UeOCnQJ1o/T1
         lju6q/H76r0Va3/1ieEBL67UhZZ0J1+x3CHT0qsAXXQaJPUPNy1vYosKt0YAjYBcunyq
         fDH7wCemHdiW461GXMjYO4+MFHeGKia5OUcvwygG5RJP0oDQI5h30xnFIQKeRIZHDifZ
         3JlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLZForHcwPS//zN61VjL6bmcnquc6SP/wUXBYJowwaKfIqPRNnSoMAqmgChCEISfHpjONN+o/gofCa9Xh+dio=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqx7Hnlnc4U7BjMhgBFwwzt6BrXlXPw7A0jj/shZ4GQ5itYZEK
	0xDEbfs1oPw8Jrh42Ou5Jrb0gHaSF3hwN9zdMajjbu7WRDuGeVWFx2mY
X-Gm-Gg: ATEYQzxc7jkzf0OSfhFH2ZGKEZwpSXEAxzKB6G9xZ68ruxBeQMsghElNZWUquWVJM/c
	AMt0y2ut8GZkikBA7llAS19w2Q5zDe1UtSEgHaoG0kpVByoiKoreKaM8Fir0qYAHlPD3KwYfbbm
	sv7sRZAjEi2xEBfnhe7xg8198P7tFyiXYyeABccYFpPrh3efFVXYCO6FcLX7zDDJ/rz9/H+OSOS
	xsTAnvNJ/baXOUL0zQjrq6YIcNu70PNpFtANJ0l4bqRrPLqizPS3uIYgrb2ukSAMpxm2ZeyRm3I
	Bx8t6BwJkUf+2Csf7cja7aQF+n9cGiqyOHNp2EREWE4zZ7PLpXc/k3K0p2hYrtEPQXjvTS4SE/k
	mG3FoOpJ/X/1kEiarQfGIo0g0/Gnn7aqSTGmSzXNDf274Age46OzEraEn4qWGIpmxcnrRiAeZOT
	rM0IDU9CrzRSw69GUQFEbw5BPtPnNL+NR0HjLOWMohnQWIHuNBne9ZGRAnJJGv8vncsLFzak9R0
	yykw1Opawc/f8YNWv6yN6PnALH9UskmHjE63Z2WxjLxkKbuBriXgHO18KtZeqaM4J2xmcWBo6DA
X-Received: by 2002:a05:600c:6085:b0:483:71f7:2797 with SMTP id 5b1f17b1804b1-48526930d9dmr45295675e9.14.1772813701838;
        Fri, 06 Mar 2026 08:15:01 -0800 (PST)
Received: from Tunnel (2a01cb089436c00026735364ee29b1d3.ipv6.abo.wanadoo.fr. [2a01:cb08:9436:c000:2673:5364:ee29:b1d3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dada9116sm4772407f8f.14.2026.03.06.08.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 08:15:01 -0800 (PST)
Date: Fri, 6 Mar 2026 17:14:59 +0100
From: Paul Chaignon <paul.chaignon@gmail.com>
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, andrii@kernel.org,
	eddyz87@gmail.com, ast@kernel.org, daniel@iogearbox.net,
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
	haoluo@google.com, jolsa@kernel.org, shuah@kernel.org
Subject: Re: [PATCH v2] selftests/bpf: avoid jump seq limit in
 verif_scale_pyperf600
Message-ID: <aar9gzh7QVhezeII@Tunnel>
References: <20260306120024.1032301-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306120024.1032301-1-sun.jian.kdev@gmail.com>

On Fri, Mar 06, 2026 at 08:00:24PM +0800, Sun Jian wrote:
> pyperf600 is a verifier scale test. With newer LLVM, calling __on_event()
> twice can push the generated program over the verifier jump sequence
> complexity limit (8192), failing with:
> 
>   The sequence of 8193 jumps is too complex.
> 
> Let pyperf600 provide its own on_event() that calls __on_event() once, and
> guard the shared wrapper accordingly. Other pyperf600 variants are
> unaffected.
> 
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---
> 
> v2:
>   - Drop runtime -E2BIG skip; instead tweak pyperf600 program source to avoid
>     hitting the verifier jump sequence complexity limit.
>   - verif_scale_pyperf600 now passes; other pyperf600 variants unchanged.
> 
>  tools/testing/selftests/bpf/progs/pyperf.h    | 4 +++-
>  tools/testing/selftests/bpf/progs/pyperf600.c | 7 +++++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/bpf/progs/pyperf.h b/tools/testing/selftests/bpf/progs/pyperf.h
> index 86484f07e1d1..c02c49c52c77 100644
> --- a/tools/testing/selftests/bpf/progs/pyperf.h
> +++ b/tools/testing/selftests/bpf/progs/pyperf.h
> @@ -343,8 +343,9 @@ int __on_event(struct bpf_raw_tracepoint_args *ctx)
>  	return 0;
>  }
>  
> +#ifndef PYPERF_CUSTOM_ON_EVENT
>  SEC("raw_tracepoint/kfree_skb")
> -int on_event(struct bpf_raw_tracepoint_args* ctx)
> +int on_event(struct bpf_raw_tracepoint_args *ctx)
>  {
>  	int ret = 0;
>  	ret |= __on_event(ctx);
> @@ -354,5 +355,6 @@ int on_event(struct bpf_raw_tracepoint_args* ctx)
>  	ret |= __on_event(ctx);
>  	return ret;
>  }
> +#endif
>  
>  char _license[] SEC("license") = "GPL";
> diff --git a/tools/testing/selftests/bpf/progs/pyperf600.c b/tools/testing/selftests/bpf/progs/pyperf600.c
> index ce1aa5189cc4..31e8a422d804 100644
> --- a/tools/testing/selftests/bpf/progs/pyperf600.c
> +++ b/tools/testing/selftests/bpf/progs/pyperf600.c
> @@ -9,4 +9,11 @@
>   * the loop will still execute 600 times.
>   */
>  #define UNROLL_COUNT 150
> +#define PYPERF_CUSTOM_ON_EVENT
>  #include "pyperf.h"
> +
> +SEC("raw_tracepoint/kfree_skb")
> +int on_event(struct bpf_raw_tracepoint_args *ctx)
> +{
> +	return __on_event(ctx);
> +}

I'm not sure I like this approach. It feels like the 600 in pyperf600
wouldn't really be comparable to the 600 or the 180 in other test cases
since they wouldn't correspond to the same program (yours in five times
shorter). A low-effort alternative would be to tweak STACK_MAX_LEN and
UNROLL_COUNT, but I only managed to make that work by reducing
STACK_MAX_LEN to 180 and then I guess there isn't much difference with
pyperf180 :(

Ideally we would understand what changes in the bytecode with LLVM 19+
and mitigate that by adapting __on_event.

> 
> base-commit: 5ee8dbf54602dc340d6235b1d6aa17c0f283f48c
> -- 
> 2.43.0
> 
> 
