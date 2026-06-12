Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4951C1F91D6
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 03:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781233788; cv=none; b=qLNYx0dZ2DAid+O3iDJDp0BnChuE3GGR6GgazyH3aYTbQQLX9IiWyBocYAPJwr3yQwwLlnUU7oBgriojIICuZM/YFcwP/s9JLOhO2kx7ocnF7OeQW1bSMWeODyVyZKOTQlVe8dNH1/vU3eqY6lj69OqEg6VXUnbD+dN7/i/bFVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781233788; c=relaxed/simple;
	bh=oUr477V1FUB4UxQqQUDtbuTlE6dQOuaPh7NG5xJpmQo=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=otUyPItI0Ji363GPhhMs7vpRopDGFzOPzqj5HHRRJOtdqwUfMSzTF07hk15BFXWLT/hwL1QgUPi/TJ69myqIEoT7c8VWdIMMx/ZQSiSF3BvvYlXskGPGUJN2v+Qed5eUxrjVhVNlxOP96jrxieEgN2LLK9uukP0VeWrc0OG/KGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Iutavs1p; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Iutavs1p"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8ccedaf0b54so4227046d6.0
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 20:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1781233786; x=1781838586; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZ0G2csavHzp4cLk+LuAsALDwxkSg2fUWirgVu1989w=;
        b=Iutavs1pjXX2RyG9EfDymyYdGd8cZUFhlhCyGJ2ONOCZRdi2FYudcS3UEeeyFiuqdu
         K4kZyA8bIURT9yOz+//yviCy5cgk4BX6d8lBJJ8RkhqiZrsjK2doZI38ap1RfSUiaOed
         C1Q3A6zqMwpLuwDfMaZ4BFpUiZH8wYULMTGIBo4VX9Yyk6Z2AS5MpcbRdgxIJvI/nsut
         IVAKLbzhgJ8YpQmS14nYc1qcUG0QWVcp9KzWdznnuywv7EY4SVTxpU1UXbv2GdlbHE1w
         sXvoT/H+T6ubi7RxfZ/5WMUFYAjMjLk1YZZvN4hsYlSUwX3LciVNHz/u9ZDP0hNTR6sz
         drNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781233786; x=1781838586;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZ0G2csavHzp4cLk+LuAsALDwxkSg2fUWirgVu1989w=;
        b=gxwyWJ+v4mU1pjo6lxsZ8UpB0q7Uqoll8A1tNmaZpcrKJOkQfBiLuWQTRpLJsGklis
         HnraotSbMywvBMxLiVkJxXfX0nQBMYJidPbptlm0hDDZVFbGfyiO4wiaLKq7eM36YzdF
         WJimjx4Vd3yACNSkycfztyzq86abPy6YkNFdCuejcAhUSOq1nMQa05GpZNZJ3CTtxOAa
         0D8yjDjdRrO1yS8K5LIvwbjCkow2vuitZIoQe/yMSMsMeSyFwpokf+3YpgF6uwPt1m+x
         +g4TgCGZBP/QdG4ORCiCPqxlhIcUYyNQdxYwPhQiINbRQaKvGKe66A8k/db58lkwSXq6
         rMFA==
X-Forwarded-Encrypted: i=1; AFNElJ8ZctxGecyU3EWAsUqgPmn+7qbT/oO3DwxXfSyvkbJ4m++wn1uc2t++0RG7wkHk/pilkuO0/n0PNx8uYpGEwdI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc17xa8sZ+r/ZQZIBKDSrBBLH3JVX5bmzSj0W6xoGY/AotQqFJ
	Gqt/vIB7OLF8nk09T0lQgle5k7YghaX4loysWgvlK1aJENdvujP8c/LY2vwF+F4/5XAtV93buk9
	Eqj3A
X-Gm-Gg: Acq92OGX0AREK1GTvKRg+NV4uNS74qfnPEULOwmHRpO7Wms2xa56D0xE+aGswo7ypl/
	+cgL0Of/pnDA8m+ZTEqHx+z0JBluDuva+87ISn3hJoCDWJWmzRGTNymn/jINg/0bG62SlzEGBV+
	chxxP2mtKsgtj8vEAeTIMm4CXBEdO12ipR/BZ3uhc/nNvb2LvxRMhL+QI6k5rP7khAXuzShqdlM
	8PSKCZvox04fRtFdQXFu8WhnqEIZBcDxGvU/TgK7Y5WzjniLpEOkHaoEsccnepIWBQkZG+JnPHT
	dgYcPE0RoIDeZd7+zWgaoLhl4qePM40/lC/vQ5fuEPRcwrgP0gra1s+RWNy4dzT0eklfmT//o1E
	oix0GpefGLp8JcPMPiMfr8iB6WViD4iHzWrEDG7ixiDNYQEK6aQoUSRi8q63nHqLKnjxQx6jnZk
	yGRBM8CDYcigIJK8/fGogHBGjVgnXo96sAJ8K4WS9NmjkcOrroAI1U/r2Hp5Xj
X-Received: by 2002:a05:6214:3289:b0:8ce:f900:ad81 with SMTP id 6a1803df08f44-8d32b572637mr18844576d6.9.1781233786246;
        Thu, 11 Jun 2026 20:09:46 -0700 (PDT)
Received: from [127.0.1.1] ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d301b271e7sm11280296d6.14.2026.06.11.20.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 20:09:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/2] selftests/liveupdate: Add helpers to
 preserve/retrieve FDs
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: pasha.tatashin@soleen.com, rppt@kernel.org, pratyush@kernel.org, 
 tarunsahu@google.com, skhawaja@google.com, shuah@kernel.org, 
 dmatlack@google.com, linux-kernel@vger.kernel.org, 
 kexec@lists.infradead.org, linux-kselftest@vger.kernel.org
In-Reply-To: <20260610230909.876546-3-vipinsh@google.com>
References: <20260610230909.876546-1-vipinsh@google.com>
 <20260610230909.876546-3-vipinsh@google.com>
Date: Fri, 12 Jun 2026 03:09:32 +0000
Message-Id: <178123377287.908199.15268768789704684712.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1001;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=oUr477V1FUB4UxQqQUDtbuTlE6dQOuaPh7NG5xJpmQo=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBqK3h3ZFEFqasalQR1mWTXPbHrWqj5zJZ2sZ+qu
 k0YSHMMMnmJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCait4dwAKCRC7dyhM23N6
 3pDXD/4/VZec2bu52G8fL13M92xQ2xWGdrzvM+V2QWvkWEFb49iIEcbouXWcfg91XHsKLU/MSEt
 me8O8owott8CM2ZL3viFflul8zZKnmgXdUJKI9gQAjYA56k4R+KX2iS3RqZuIzmjcW/G3faV01D
 YJ+1UeIsiiCii+dbZ2tF37OXsTmh3LehoARHEyfLk/DYmRto73KY8LPuzzJpbtmmualo3flen2k
 aVySnAuG9o3IcEUa06/yifHfY/ANedT1zhLn/Y5v+Fzou3SMF9/LRtH4AuRWrNm9gx0tFpT6Pgu
 UKj4WJWUYxC7jY0r4fAcp2xD8wU9GnSx/i88IeQ/NMPFnsbaxXfc+nul7PP2a70Bc8HF+Cm+/gJ
 BT3yuyuR67qfxEWdZOrE26j6ydjzHPysupx8qYTqRzccxr5ZmZ/Wu+kKWW1jROfiGcYZAMzPKzn
 0g9KQhnPw2bUYhSqxIRvnTGDVg/HC2hqAHdu0hclXEV50mgsDPPe306BK12d/pwjKghxXjSsrd1
 TIk5+SUQADrM+Q8vHIme5DhOUZxt6bavVimOPUwmHUn3MmJmYHrFCbAiYv3Itb/luc+OxaUH7dx
 kp2B7CxZ7346MO4AM5DYP9cZ9+zbtnVt1Y1HxOZMy3FI7zcqUBcQTIFqTM2qotcB8cP8QL5nmX3
 dI+E0eClFabbGng==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Wed, 10 Jun 2026 16:09:08 -0700, Vipin Sharma <vipinsh@google.com> wrote:
> diff --git a/tools/testing/selftests/liveupdate/lib/liveupdate.c b/tools/testing/selftests/liveupdate/lib/liveupdate.c
> index 897c200f3845..961a732b541d 100644
> --- a/tools/testing/selftests/liveupdate/lib/liveupdate.c
> +++ b/tools/testing/selftests/liveupdate/lib/liveupdate.c
> @@ -78,9 +78,35 @@ int luo_retrieve_session(int luo_fd, const char *name)
>  	return arg.fd;
>  }
>  
> +int luo_session_preserve_fd(int session_fd, int fd, __u64 token)
> +{
> +	struct liveupdate_session_preserve_fd arg = {
> +		.size = sizeof(arg),
> +		.fd = fd,
> +		.token = token,
> +	};
> +
> +	if (ioctl(session_fd, LIVEUPDATE_SESSION_PRESERVE_FD, &arg) < 0)
> +		return -errno;

We do not return positive values on success either, so !ioctl() would 
be a tighter check, but < 0 is also acceptable.

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha Tatashin <pasha.tatashin@soleen.com>
