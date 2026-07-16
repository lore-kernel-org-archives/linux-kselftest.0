Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A54841A564
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 11:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784201711; cv=pass; b=amJuwwQB3mUDlfRlAEZd7zjfq6GEz7wGMwAlLO6gJ+o+Tr/iMMXdJ2Pfeen8gCWgWOxsipUznVVjPg+az2URGtLnSDbZYpVqyI2Ig9EAiGiw3to3RzBnCrJ85TSxCjdmsi0iCvMdPvCuUUCDWwfVqQJhG3Oq4SiWOBSO69HfvJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784201711; c=relaxed/simple;
	bh=2g36lJG3U42LVhfO3LNLyoyHEf6Sd6nntXHxonOuu3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h7uTJ87ggHyw2Irv77/jeb+8ZZxsuFj2A/cC38n7H/whNvO0BfhciOMo4Rc5MtNNHZSMUny18arvU4rWTwj+69qGVGrKpSKgeFwT6asRMZxqCuMYBbeC7zUjzdUeuO0BErXNQTOAOiEJ4uUQVxjN4hraJQZNRNhmu3+NXH0/9KY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sH6DVVXq; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sH6DVVXq"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69e08ad526cso2695263a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 04:35:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784201708; cv=none;
        d=google.com; s=arc-20260327;
        b=DzX9kqBtZggkahP4T5h58vsR9hnTyOiogUtVZpjvGolirfFp/M5K/9OxmdX/fI0+8o
         eQY/wEd7FmLza0MjmBkMA4kGkJiPVvmKnW/pQbBjSuHsNXQbgJuDuqKwMvAR+P/KA7Gk
         2PdkNhfvvIEdHmCE1dgN5/2SAQDH//ns5RUOacGOBR3tXARGQ1B21qJ2xw6cIPhRxnvd
         +JVdyZjYg3wWDWRozitjzLruqxaw1Usbtk7vYWIe0P1F8v+2l2ZJP58GqXywxsdVR3mu
         6nN6rscwqVwoh8VwbUgmqOS55TmGgZzYl6p+eSlZhQFFzr7tgJd7PCWfSXQBETMxrcFI
         u4ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ysGs6NJRebtieFYvmOhVVH9xTxOC+fxmBEZ2c6/Mloo=;
        fh=545aDpsmzWSBD+xDH6U2S5SG10qlK3K0eadpJaQ+dCM=;
        b=ekl6r6oPi1ZkQTUCsEPCO/fT91tP9jH8PgiTX9CpW4emIX9chLLLymNAdRYqHFCJ98
         +HR0rqepidewQTNsUnLsb+vIWJkx6u+5yNwhAWjd/UCv+28k6EV9FuYtMCL3OOljWe32
         CRTsE1wY2tutOYPURzNx3P0wJQVHQbSni8EavetnNCF7rnGSXII21DvZS3wrU18vF6/9
         B51WxqalhIZR4ACWmrPl41huycHLAm9GlWYbt5lmTICY39OaQP10t25TFIC/HdvEDJhG
         NcHGsowI1S/Jzu//0BF/qdVm9Bf5Xy6/RCjc5CCDmLlnCqVJZohFWVau7vDVXKm+T5w/
         GSNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784201708; x=1784806508; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ysGs6NJRebtieFYvmOhVVH9xTxOC+fxmBEZ2c6/Mloo=;
        b=sH6DVVXq+0bg3bPner6VRTSqoa2TnmHudaeImn8Q9khwE6G+Wj/ZRDZQCNMvYMGE6c
         U0Jc2n2nTwe28DA90oSUI/88WWw+vm0zezAwWXQDekmVbUEjKui8EcgZuDwgzDRFf3lI
         NvwK1U6x1WNnf4xyZxH+Uoj3f7zDUvGJkDuo9xlWqxM6mbSbqVDf9B/FxDrInBek/6dg
         2hXrFapKo31BWuZnufLfLc/xkepV4JWiLPxhgI/d2hNf7bT9pOpML7e1W2glo47PUl42
         nCyhgutrfnWV71ebMaVGA8tcod4ZSL1Ng/FjndAN0owl8CRTmggDyjc7/VKtMIsjV13I
         0+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784201708; x=1784806508;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ysGs6NJRebtieFYvmOhVVH9xTxOC+fxmBEZ2c6/Mloo=;
        b=Dz7jNvjd2iYsRFN+tke6Pw81UltonvHfmG/k+uRZ1VfvdiUwLbYNrjXVbbSwRZhfBJ
         oWTk71q1VC/4vx2OGvkMpDjk/6mm/fK0Uzm5t7JivpCTWTnQCrDv2RhZq/ONVUCcjwZz
         PVqBmM4nWkEhn8WvlLmbE5VD+LL3l6dXqdirxl/R7jqgQEOP/l7/7QnZO8B0rawmMI4h
         Jn452esUe96n6/ehlzkq0sD7SDMTCsUii/7ezZQYGjYjU2Yyq5UJm90fkb8n8+EAhitJ
         0M12LwfvwbwAKPAlqDg6Eb3X3g0oKRvWuWdAnk2lIBVTD+bLmI8XGP39jUnDevn0omEf
         B7mA==
X-Forwarded-Encrypted: i=1; AHgh+RqBvzhsJZ+4DrDayVR/e56t/Y/Xx46HE82yVNDk3zkfA1xBKc6rHF0t7ed43KRRcmDKqXTAsAm/5w1sQ8cASZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN8LluINcW1Oso7WWpPb4SHOnnRUqFhN1hJezncwB8oyTOn52P
	cxmiwGsyv4LJEqHI/WI71Usbq5SUZSlD7Ayq9iLy9Qg83bSiARRFGjOHPrhM2LpBlkh8wY8NJ8/
	Hs2mQAnOiLHtl3R4pdvJSXsuX3ki99Y4=
X-Gm-Gg: AfdE7ckC0SLfy8NvOpyrRono0UNaahhbNxlSl2mjdRMHjdgDVSf3I0ot67oZ7t+gLia
	rYCNZzHSI7fno56LQtQtrejlfrdwXvArC7UcRaiXdm0Hn2d9QsvYwKh0n2WjxaTvhzCHi5Z60oC
	WfS1LMfbctHCzudHTFS3NQX/cPV3WKS89YHj6/KEe0J7EzGuuftyWi+Jx/oGUw+oRf0PTstRS+c
	JVpqYY+Lcf1fFhjIQlF5BGpCJdUSn9uvMhqyLcgpeo3zbD08B6bhi9gMwr/I6ecB3Qvr/NB5WLv
	Z2BvEbFCOXMJw31Ks+LF
X-Received: by 2002:a05:6402:320d:b0:698:50ea:2d97 with SMTP id
 4fb4d7f45d1cf-69c5f1043ddmr11746132a12.20.1784201708206; Thu, 16 Jul 2026
 04:35:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714020340.25014-1-akiyano@amazon.com> <20260714020340.25014-3-akiyano@amazon.com>
In-Reply-To: <20260714020340.25014-3-akiyano@amazon.com>
From: saeed bishara <saeed.bishara.os@gmail.com>
Date: Thu, 16 Jul 2026 14:34:57 +0300
X-Gm-Features: AUfX_mzK79CIL23jkyupbgkP8ZJeyWpMZHgLpxQaHMyTfs3qKuX1sAZ-6xeJP9M
Message-ID: <CAHfVqdWNk0QmvZBXi21eUKcU34DpXXZBNyJVUep+Tx1n52ihAg@mail.gmail.com>
Subject: Re: [PATCH v4 net-next 2/7] selftests/ptp: Extract
 print_system_timestamp helper in testptp
To: Arthur Kiyanovski <akiyano@amazon.com>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, 
	Richard Cochran <richardcochran@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, David Woodhouse <dwmw2@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Miroslav Lichvar <mlichvar@redhat.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Wen Gu <guwen@linux.alibaba.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, David Woodhouse <dwmw@amazon.com>, 
	Yonatan Sarna <ysarna@amazon.com>, Zorik Machulsky <zorik@amazon.com>, 
	Alexander Matushevsky <matua@amazon.com>, Saeed Bshara <saeedb@amazon.com>, Matt Wilson <msw@amazon.com>, 
	Anthony Liguori <aliguori@amazon.com>, Nafea Bshara <nafea@amazon.com>, 
	Evgeny Schmeilin <evgenys@amazon.com>, Netanel Belgazal <netanel@amazon.com>, Ali Saidi <alisaidi@amazon.com>, 
	Benjamin Herrenschmidt <benh@amazon.com>, Noam Dagan <ndagan@amazon.com>, David Arinzon <darinzon@amazon.com>, 
	Evgeny Ostrovsky <evostrov@amazon.com>, Ofir Tabachnik <ofirt@amazon.com>, 
	Amit Bernstein <amitbern@amazon.com>, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, shuah@kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Simon Horman <horms@kernel.org>, vadim.fedorenko@linux.dev
Content-Type: text/plain; charset="UTF-8"

>
> +static void print_system_timestamp(int sample_num, __kernel_clockid_t clockid,
> +                                  long long sec, unsigned int nsec,
> +                                  const char *when)
> +{
> +       switch (clockid) {
> +       case CLOCK_REALTIME:
> +               printf("sample #%2d: real time %s: %lld.%09u\n",
> +                      sample_num, when, sec, nsec);
> +               break;
> +       case CLOCK_MONOTONIC:
> +               printf("sample #%2d: monotonic time %s: %lld.%09u\n",
> +                      sample_num, when, sec, nsec);
> +               break;
> +       case CLOCK_MONOTONIC_RAW:
> +               printf("sample #%2d: monotonic-raw time %s: %lld.%09u\n",
> +                      sample_num, when, sec, nsec);
> +               break;
These three printfs are also kind of duplicated, I think mapping the
clockid to name first would save a few lines.
