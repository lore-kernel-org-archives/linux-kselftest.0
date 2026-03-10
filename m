Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDB93E928C
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 20:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773173489; cv=pass; b=qKAHShmT4XSi81thrVAFixP1Hg3asp+dXw85f9gN4eQ+/dVddb0N67VflirJ7dv5aaF4WVCs8y25Zb8erXaKurqk+pjCUO9Sq3JNGRHw3tDYz1vUJySXmw3saXUVh9He7GiN+IxgdZKX/kYUPBi0MVScX2Lt/BzXOqOVWZL4fPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773173489; c=relaxed/simple;
	bh=ibUs8AJ/dN5iUBOGd4EoUhQ0y6ATrIvVnV6MMEAOtus=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gYrqf4/FGaJi0lcMe1VvBCbzBJzX9FnVQiw7dLAeB1GMr+Hrtbnd0SEwogjUSnPrAUcPov/SJPI4H+0sfAZaSq8U0czCG1wtIWPrd47uYVn5Q4pGKmZz9MaieD7m8VN2SPNEywzeGunrfJ2pZ06imzsv/9MSLVCw7yXDaz8zOFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5OBdHPg; arc=pass smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5OBdHPg"
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so3147774f8f.2
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 13:11:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773173487; cv=none;
        d=google.com; s=arc-20240605;
        b=TXONuPrDPOFQT0f/fj68XXcb+grzED0tr/8QIvIPeQEM1BbJZbx7uryXK2qswK/x6L
         ZeekzMo9kObTK7xRg5MqabIkaICWXsbHg8RO83c+UsjFRphIKaXIc99Vv71qYrRol0CA
         1KLZCCf5ZydkHAJiVrhgFnIAT/ZECZPsyQsQKd57olE9iZBQGvav942egtnTHi5mWqTT
         MtAyP79u7tTVeJg1k2kDN3Xu7BEyPC9RhLKxPWeEEcvIlJDNEigatTGStsY4fw2+3/JX
         PtZHWQkwnoOwV4yYpin3Z46IbPhaf5pB/+67gWRxX95lKWZak4u2L+M6ZfVXpUqlCL8C
         /MJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ibUs8AJ/dN5iUBOGd4EoUhQ0y6ATrIvVnV6MMEAOtus=;
        fh=KHx0RN8gL3cfUVJHWAswOYEjPuyN2IdBeo067Bwd4z8=;
        b=KTJ/5OpznvHPR3+okn4aIq3xBjOZQaZdidBXu0Ajsc/LLGeGjmP23rQgfA7LI/eZMU
         Xijuj5zJGtdUVZX5T9fhoV/gKLkOfDgUI2oZZAUz3vosX7XKMEe5Px//hCPBvzdzCGCK
         Gbs71iRUxUHoLYEsEU2qn03QvediDjTrznF1nWV/s2QZkx20ULNpfEvZCMu3SMu/IedD
         6x+CAJxhcciEIQTf16xal4mBkoIvq4Lb/2Ul14PwSxNBJLQDYz3SePaR83Y3lG6zIvpD
         85/Ow4jIT+bJ02JQ2pq5JBHJOwnZXjM9d7x/LmL5/+m3looM1HUTfTsMtBQ43axlPFee
         u16Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173487; x=1773778287; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ibUs8AJ/dN5iUBOGd4EoUhQ0y6ATrIvVnV6MMEAOtus=;
        b=B5OBdHPgs334r7x010aTA+1AX+DYvyPTwoA7DyjzbwGHT+TxAvEC+sjrJMWcyib3+3
         HhqLdst9LU9ONQFGD3FiFmu76KEWGXEj+yYPiXWFZks1heFcFtJXsexu02J5gzAdNxlC
         T/1XhRVRfP6icaPC9gUl8muH6jxYLDDdec28R9m3qOD+JVtYyHuRZs3jgk8qWnCIvgR9
         zY7oh1U4d2JTMmFEvLfomp713jXcUJ0D9b6dDR0z6i8qRH1FgyUvLWBuwftbUAbL96/B
         q6r1E0hWV3gZOyMaO1R6rVz0cfVHsVT3n5C0jjVk1JZFuI2sd32RYfolOxIW448qsAHc
         5z8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173487; x=1773778287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ibUs8AJ/dN5iUBOGd4EoUhQ0y6ATrIvVnV6MMEAOtus=;
        b=qSc2FdccAzwvzraFCr1jC5TKepsHMMCoY1Q/iAmXZqrPb6SMgBZ4WuOakLfS9A9Ebk
         8gRH9nTS7dLbs4x0EprxlCQSkaEMy/jt1F62HJOjczAuhWZQ4k1NyeMieQ1J+70rY/Xq
         UGfAZJ2LlAu6DO552GQJEnnJcKdtGTeacMKG8SVFX29/lrfhpder9wsM5FEOnc0NUTqc
         ytJFwquqOmx/2zBcdH4GjxxRQmENxrHxpGpqTl45mWLjWKiIAhR/1RqlWhvpfvDrwUfs
         WphN8qYv3E41rEMoQPXxVIG6TSlc5KpdDoVG+ZIsA/pWjIFFeZgst1ibPkuu7YR2sOGU
         jxrA==
X-Forwarded-Encrypted: i=1; AJvYcCXzRsUXKHaZS3P4gSaZi8bJOJ7ZDDiqYNw/db2RY/4nO7UgV5C4Ha8Vo8ohcNgYtRkRf1YAZ/UW+byM9rW+GAs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFFPpE48kdn5lTtYwrShorFAzFTIHN7ncs7nhVZBNczAAtAoaE
	N4AXtXHLT9s89MxkKiBzGjr9anvn6BJYZ6CUM8/fR7zMo1niQ8/cfNcnftBAlJonHj5EAuJD6Wb
	Gw4dCS1TAHtT4v0ZtWbPb/+XHJ4aFtFA=
X-Gm-Gg: ATEYQzx3lzFf6zIc+3a7X3x2cvfmzci0wifd+q4W56Cm3vdal2NQJMehfBFy0kNMvBv
	IA1C3lslSXuJpvkFPbSoBdy6VaSRA7lzyCWPSKO/ZNVxA9k9MwQHACBbfHRI1Rtalkti8IYNhWY
	LARm3w1H5Apr/OUH59+f5FXzf+EA84DHjkiFTaVDt5pYQi92Og+nuAy9E6XPbrzhkrE/L7BQ/i4
	YoRlBFtmeXOt0rL9k8kz1eIlJPNjRuBAFwBm8qPYq+4hBJFFtnMGLKxXfSeOdftQqCXTydBsYCz
	xfw/3oqM3FD4MkfHmCfoNfOMpJd/utdQYiWTz3qJp8UPl+esrtNXEHRwoSXH
X-Received: by 2002:a05:6000:186b:b0:439:b046:2044 with SMTP id
 ffacd0b85a97d-439f81f2334mr391642f8f.12.1773173486625; Tue, 10 Mar 2026
 13:11:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308134614.29711-1-pilgrimtao@gmail.com> <20260308134614.29711-6-pilgrimtao@gmail.com>
 <4f18c782-a09e-4584-8abb-0c81265840ad@linux.dev>
In-Reply-To: <4f18c782-a09e-4584-8abb-0c81265840ad@linux.dev>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Tue, 10 Mar 2026 21:10:49 +0100
X-Gm-Features: AaiRm52Oyt3zkGMAr9n346T0E13x1SZHHeDtnD6VAx-Cd1dkPohpqM6MF5aLI_M
Message-ID: <CAP01T74Xbg9HiGA6qwPzkOnaq5XfGu_MA+bKX6g-OE9UwOoboQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v7 5/5] bpf: refactor kfunc checks using
 table-driven approach in verifier
To: Leon Hwang <leon.hwang@linux.dev>
Cc: Chengkaitao <pilgrimtao@gmail.com>, martin.lau@linux.dev, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, 
	chengkaitao@kylinos.cn, linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Mar 2026 at 07:45, Leon Hwang <leon.hwang@linux.dev> wrote:
>
> On 8/3/26 21:46, Chengkaitao wrote:
> > From: Kaitao Cheng <chengkaitao@kylinos.cn>
> >
> > Replace per-kfunc btf_id chains in list/rbtree/res_lock and graph node
> > checks with btf_id_in_kfunc_table() and static kfunc tables for easier
> > maintenance.
> >
>
> Such refactoring should be the first patch? Less churn. Then, update the
> list only.
>
> However, is_bpf_rbtree_api_kfunc(), is_bpf_res_spin_lock_kfunc(), and
> BPF_RB_NODE should be excluded, because you didn't touch them in this
> series.

I think moving clean up earlier makes some sense, but why exclude
rbtree and res spin lock?
Looks better to me to do them all.

>
> Thanks,
> Leon
>
> [...]
