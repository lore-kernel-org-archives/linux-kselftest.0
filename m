Received: from mail-qk2-f1.google.com (mail-qk2-f1.google.com [74.125.230.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE74C48F018
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 14:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965658; cv=pass; b=fWN57Kk6LDYFbBnQ/gsxc1Wgk4qceoCJppUzNnY+0+QcKUWoxw1auTbvYYTAoOYfrDypUJXzwXYUEVVz25rKAmDx69ox2w+S9ASXHEVwbc8I27F9w1WG/RApBxsyxdevQfm2UOkKklIX5FbZshaPhhxbp9uWs3L99OYCfseFdW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965658; c=relaxed/simple;
	bh=+Mkrm7KMoXH/0aW9c9AkpqwBihjracQhI+9N2aNSCYc=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kYs+LkfVmQCuEy72CEA4o38QjIbDHJ+jMvgugYvIN9W0ITK3sQNHnz0nfPAv7U63g6kQ+T9PlQrkuS6Z3PuGzRuQBnU7BjQhcdeoDnUCJ2TlJEQedNx+qaOm7w9NxxQ6eYCq9SpnqTVM6UXwdE2gxy2xeJoR+e/4bb5H0ydvE9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCEVtZPF; arc=pass smtp.client-ip=74.125.230.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCEVtZPF"
Received: by mail-qk2-f1.google.com with SMTP id d75a77b69052e-530888e5423so13421131cf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 07:54:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788965655; cv=none;
        d=google.com; s=arc-20260327;
        b=Acj8syBV4iEsqUCCKimI7dM+t4UiXmkZqQpCJUkOwo/D4rwzFJz75g67L8zdEoIWp/
         CtVrClhcGVpU3/EEg04TRppS5oc67MRz7aVQrojnlxWtPOHiRhDoEr+1qfZYPqmXQgEh
         Hypcr7IGmV5eV+YuulhLtfT4T1OUe8klCnNYkeY6VaX7L1InhIdOjDwV1TGoYxpVPOlB
         7Ab8TalS26kX8NgFXBAU3rukuy7OTh9SEZfHaDcUc8fyGuyPy178+UtkTaj/owT/0UJ8
         RWeoQ2nr3455nNZl+hTAYBI23Kcu7pEFvor3+we/z0g21pAdfFBGhaAEhNqVwPflesQp
         vNjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=+Mkrm7KMoXH/0aW9c9AkpqwBihjracQhI+9N2aNSCYc=;
        fh=K5+jIlA/cl+OClb15UyZb5TpWszlMSyKTh/ON4L9Yas=;
        b=WwA8t3pm0HIOq+UuZIJBB2lq9QdpsQ4aOLabQjeDof6kiMDMxY2mqs4ZcGznYU8UTl
         wRAADWFUWMHLIsEutli+NaW+9wcC/CTUroZ+SSBrGr2PD0nY5NuTjggUqOuAqspARQ5H
         pyUUBvaHl6Ramw9Ssqc3HUhOEFOsht9zhY01XOJXVnsAikom5/X48VA2B/Ou+Y+ptClb
         4W2+TFPAE4W5cHyTG7UFYfs1TZ8bBpNeXLmHf1I9nfdEhHrXnArFiSGuI/tU9/nF03ac
         /159NbG1gUl+80hl/nobE9VwBi0dFcb7y0yDYXKihil7rvsz0F58aSvBlxpdpQ2kclk7
         JkCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788965655; x=1789570455; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Mkrm7KMoXH/0aW9c9AkpqwBihjracQhI+9N2aNSCYc=;
        b=NCEVtZPFmKTu7ez0Rj/2pnu2U+BR3aX0jk1QUjVFrwSksni29KJRIA+BYgqjWouY6P
         CCX/XK+3puMb3pCBJm4gEx2GsZ9c0PkZToPsYGFo8ZSxAsdDaa1SM3HWhDnYYedKZn9Z
         DD+0TmehblUuoCzcSK61TbevBtgGiLD8w7OeDaXPP4Z2WuXO9u4DKUfiMktKRujttXw2
         0pwXqmNJA5hdoGFB9svnyGAIgRlaHWyW18G5VDmE2/0hBng3bG6+MMUSdTil3h8BdgcV
         yl8fnG9pnkm7EIFll5MiW1Djn3mZf/jWAzkRxZR2/L6jxlFFBuSCBrAP/7tmGPwt44d+
         iY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965655; x=1789570455;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Mkrm7KMoXH/0aW9c9AkpqwBihjracQhI+9N2aNSCYc=;
        b=pq4YF0uiFuQEEZL9/Qmu02ejyUUXZKwcQlVQTzUIGwMs7ipWWMh/kUtHEYhn++8I4c
         JRqxAOSt5iYMFlxXEpEDIILF8RjxQMxLlF4pFnWRG0y6UUym9sEwqEhuDKBfbmDqxMyb
         wVW8bAjxl8QQTNTf7AFZQVtIdh35sr1rWr+HWXwCXXHJuCUf8Oq2SMgnthZc79TOqdC6
         Ld/+Cxhz8g1PKEgwskU7AyzUVldrIGDsTLsloP6cLQ7PVvNAA/VzFXsWD3zmOVP3j/PC
         aUdKvFsHmyheHXMZwIUSqoSm31sihFkKgm7xXs6kv6t4W9jNZCviNya/Sx6S7w9PDbv9
         YePg==
X-Forwarded-Encrypted: i=1; AKwUvBxu5+QHAy/W7FCTOyA3ADCu/VOSvOZBk/LDLbcjLvHvRu52riQ2wMzpzCD5VPTds3FPVS45QUBYiPr+7ShR6hs=@vger.kernel.org
X-Gm-Message-State: AFuF++nP4u9XfoVqD7zEXrn2TeFQY1dJvYEfc3DAXPj+uXr49XIPgyK/
	VmmF0os5NzGuJsLLoLvqKk2dYIaRRdYe9uYKw8JaYxS0RgriO5FuQ3pDjEW3qMn6zLgtjaeW+h0
	s/hD5e9EC5tyzhb/9GdGgkIU+JqNdDL0=
X-Gm-Gg: AYBFou2G5/ovS53Cv3nhhMVEglI9zrBRBzASlwLLLIMMa3Zy4rwMHPBO7fHoznfP/QN
	/YVb4qHwvLocPzbJj8WtSRbJRu/MMsx+lFHkEceQRlYfVBL9hn9T5fMlSlyu436Nt8ISFbHkRjC
	9lARWkvD6nnGY1dYkBUbl+cTKgy595vDr4EzUMQS/GhuORHG+26OoAk2IpkriZTiMygffDwnzh/
	hRMVYrkvq4AH96VC0ChK8JlUQ5z6uZZToT3TqBQ1WJ/Yi9QyYBTxtT74sktJBdPqI6cWJf22FEf
	FaAlr3NvYH4RVYJrtp9XKb6/m5aG/WVSF4QoZwpaAOe828Ww3/QrD7A=
X-Received: by 2002:a05:622a:a15:b0:52f:aa6c:bc7d with SMTP id
 d75a77b69052e-530a2d00ce3mr103821661cf.28.1788965655200; Wed, 09 Sep 2026
 07:54:15 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 07:54:14 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 07:54:14 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tianyi Chen <diannaaav@gmail.com>
In-Reply-To: <CACGbirQ-xfWymbY9Z440sjbUseLRuaPFT17mBAwddeN7wqVi-w@mail.gmail.com>
References: <CACGbirQ-xfWymbY9Z440sjbUseLRuaPFT17mBAwddeN7wqVi-w@mail.gmail.com>
Date: Wed, 9 Sep 2026 07:54:14 -0700
X-Gm-Features: AcwNN1V0ayDgefnocqAHfW58sB0HIvDNfLVwuHlJzZzj3we-9VRYfcaM2bKPUBQ
Message-ID: <CACGbirQQ7dZ+Jaiv218CpW38jWCCz5DUkoSAKUShstLy1GoYpA@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] selftests/sched_ext: Validate select_cpu_and
 mask constraints
To: Tejun Heo <tj@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, sched-ext@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Tianyi Chen <diannaaav@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Tejun,

Following up on your review:
https://lore.kernel.org/r/53d04980eecb0e5f6eeea25a5cf0dcf5@kernel.org

My earlier v2 submission and reply were rejected for the kernel.org and
kernel mailing-list recipients, so I have resent v2 from this address at
the start of this thread. The code is unchanged, and for-7.4 has not moved.

V2 checks the selected CPU against p->cpus_mask and uses dynamically
allocated affinity masks, growing them when sched_getaffinity() returns
EINVAL. The masks are zeroed before use, and affinity restoration and
resource cleanup are handled on failure paths.

I reproduced the fixed-size mask failure in a guest with 2048 possible
CPUs and two online CPUs. V2 passes there, including with single-CPU
affinity. Testing with CONFIG_PREEMPT_RCU and injected failure paths
also passed.

Thanks,
Tianyi
