Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF39740EB9D
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 16:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790267096; cv=none; b=K99OxOoaHOlPQpS/0AQrmQLBVq9R0bzug5yB/3bGj041b9bEytn11KbvWhhTF4wswsuepMFIy3dWkuzNewHC41LhRqsHyHOY98WvEzRz5SBkNKqM0+7uZxDo6+bBEbdQxWXY7Uf+LQuHLp/1vKPBkxQY7u09GGYoAt3LIVTZrfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790267096; c=relaxed/simple;
	bh=440h9dFKjB/gL6Kt8Wwp2sOdSQZbYHU2D2i/qlxYifE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=aqiOHLTVtSfm2BEhn+PI/wzppbv9874ypgx8qZDMlIcHjIGRRzbZMPWDnNlbo7BXkYa84kdNvBAe0A9aCviG7iVXLgpygEvkASKDkgCt0THIMeHZg/dwjPgZiYhCf+bv/bdQWmLUnu45EjrRq/w8VzBLY7XU/ciabWxLnRLyl2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=amgVEXlD; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="amgVEXlD"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-89666ee9b3bso63037b3.0
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 09:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790267093; x=1790871893; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4EdeJyFvDx7/h+uSzbqlt1nBcvAWTDwgRsH1W939sSc=;
        b=amgVEXlDw3WXRKkw5jFf6JpviEeeFfSBTxlJqyFOUZQQcq75eahVQc4AgIH9Y+x964
         LXSA+pPeDYsb4frucnXxAQClFs52vbiIi/rdKjiGB3NVsxadrU/FetTvPESDGytbSQ+d
         EzIRWq6/pPGSJu4kKHNl/ElAI4NORTdY+jsRLTgMkeJAk/u/KrxIdJGEr5m4Kp8+EoAO
         6MOOCfrZgcGU8dL//sUrhvpl9d+f6uDvbA4sTnrILiSLJcF2L5qfXfO5/gZDkGJHyxCd
         dR+jpg0YePr46Zy+3kZBxFB0xJYtKcErl89nkXDiveIYLHiDkIVnD5jSoVtBpi2WjZ/C
         c11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790267093; x=1790871893;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4EdeJyFvDx7/h+uSzbqlt1nBcvAWTDwgRsH1W939sSc=;
        b=dkcg3ra+otKYH/0H7l0kM/aQ7rk1Z+8wiM3+M8X/t8XfuCsNluGA/aU6WrMgEmWXOD
         JAaPjzL9G1LQVQt8JlZcSGYAgIM2HSkyWPZh5KabpFK/b9Bl5s9400rj0Mm9IPydxMMm
         3VJb26bcRR7fTzwUZ0hvdBwFHuY0AW65hIDRJuutYxYHKAaTsodCddx7DeOfFaYsQja2
         dyfn0SzSXkitOHlMDFKXvIeaKKMd9/rPuI5VBhQAMyXgUBMzwi3EVnP+z7olyYJ0Fljo
         8trF2I6+bEsz0WH6PpwLAYAU83YMFmlSrOxc0Xt23Kc4YNFZG1MaD+pTA/5Aa/3M3ahT
         yFHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUOoYzawVA05pVJWrBt9T3CrYe8yp/wHd81HdpiNMzIYsDG9VTSvJnNiogQkoWplEEHgVLmP62JzIZGEc+EbI=@vger.kernel.org
X-Gm-Message-State: AFuF++mT2WrKXX2u8rsebEFrxZGGNnFCoN0FBFimHYilMPmnvG/EGGlt
	290sSG8JDoVJ+A9posPi6FfOMCFaRCV3Kai0cT4hL4ve5ReHIrxpOKAQtSnklA==
X-Gm-Gg: AYBFou2KyAO1En0sxw1QJP9Gta5GFBvflyWgSQvsXvEPxTNBokZSiOktTMJYLPlyYE7
	2tR3CEEUEdvPWEO/mLVXTCh8SXwTRo7ovcod+S9nWTsnUQG3TtXnJn8VgEhe2X5lPE96ls/OGwS
	Rrb59Rvmjg8u70b5XsEkI3H+xheuhGlDWAqlX2vfgWFWdYFgHxa3IouiDMdCzZmp8bnnVjJYyAa
	w0j59B1hZKf66Lgq4fw36I72Kbr1eDbTk62zb4jSNnGXmyh/Vlw5sszKs60beT++HkvH5BxRTWL
	S51jtBkGzY+ZeOsk6fPjhuKeMe1dNBKNpkLcyXsXQaG/ecX0F0DGoE+bli6+leHDSgJz/+TBfe7
	5W8PPSnB1eujTHq9y91rOOSm76N38hKjkr6hb7PZDZQa7bxJUaTRpCsEsCTTHFWVGrBHqV5ISM5
	I+WV17Ad6m+q6756DTCT++hyIWrTMKtHMn7m+4cD3+Aduc0rrL5OsDJC6+0WRcSD7Yf4NRcn4rb
	K28lHnS/+guxMmXToZOeJpPSljNwZcAnDVA475nBoLurLsSlSQ/wYj3EtWtPgrg/dk+hv+WcQKe
	QA8=
X-Received: by 2002:a05:690c:39b:b0:89a:63da:cbe1 with SMTP id 00721157ae682-8a649f614eamr21784567b3.39.1790267093494;
        Thu, 24 Sep 2026 09:24:53 -0700 (PDT)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a652715b65sm10602237b3.40.2026.09.24.09.24.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 09:24:52 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Sep 2026 16:24:50 +0000
Message-Id: <DLNOPVM33JL0.4IW7LA889QQ2@gmail.com>
Cc: <qmo@kernel.org>, <daniel@iogearbox.net>, <andrii@kernel.org>,
 <eddyz87@gmail.com>, <memxor@gmail.com>, <martin.lau@linux.dev>,
 <song@kernel.org>, <yonghong.song@linux.dev>, <jolsa@kernel.org>,
 <kuba@kernel.org>, <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next 1/2] bpftool: Don't report an empty map when
 key iteration fails
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Maxim Skokov" <skokovmaksimevg@gmail.com>, <bpf@vger.kernel.org>
In-Reply-To: <20260924160732.485650-2-skokovmaksimevg@gmail.com>
References: <20260924160732.485650-1-skokovmaksimevg@gmail.com> <20260924160732.485650-2-skokovmaksimevg@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, Sep 24, 2026 at 07:07 PM Maxim Skokov <skokovmaksimevg@gmail.com> wrote:
> This is what every local storage map (sk, inode, task and cgrp storage)
> gets, since their map_get_next_key returns -ENOTSUPP. On a
> BPF_MAP_TYPE_SK_STORAGE map holding storage for five TCP sockets:
>
>   # bpftool map dump pinned /sys/fs/bpf/tc/globals/cilium_lb4_reverse_sk_v2
>   []
>   # echo $?
>   244

cilium_lb4_reverse_sk is an LRU hash in cilium. It's not sk_storage
and bpftool dumps it just fine.
So where did this output come from?

[...]

> Fixes: 71bb428fe2c1 ("tools: bpf: add bpftool")

That's not a fix. The exit status was non-zero before and it's the
same after. Drop the Fixes tag.

[...]

> +			p_err("can't get next key: %s%s", strerror(saved_errno),
> +			      saved_errno == 524 /* ENOTSUPP */ ?
> +			      " -- map type does not support iteration" : "");

Local storage and ringbuf return ENOTSUPP.
Bloom filter and arena return EOPNOTSUPP. Queue and stack return EINVAL.
None of them can be iterated. The hint is printed for the first two only.

[...]

> -	} else {
> +	} else if (!err) {
>  		printf("Found %u element%s\n", num_elems,
>  		       num_elems != 1 ? "s" : "");

The subject says "Don't report an empty map", but when the map has BTF
the elements array is opened before the loop and closed after it,
so stdout is still "[]". Only the line on stderr is new.
With -j the error object is printed inside that array:
[{"error":"can't get next key: ..."}]

pw-bot: cr
