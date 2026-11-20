Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795207379;
	b=NKiaZsAe6ChE28PX2RnrBAmIDxsyzyW7xhK6uOi10mqiAROeh+iZo+G1IYzX/6mbn5cS
	 DSPts1VWUGeJyUFNjK/gZpT6QiijxxEkOnJ2aYmBso4eTitY7i5YyJPYUhbBYbpUk8dWk
	 IeHjlvLhhSM5K7N5YFxvLNw9Gzck4Mir+RnCibgkgdAI+FfP1gWicGee96OsNQf1vXoFY
	 NR5CUeikZRzc5MPYZta0s//boMO1hHZiLj1RWVt8Q2gCL9bke19eH9kEIyBrelKuSQY9l
	 9Ns08jS/WeHYYBpY921YhzpJwTORzstqOAT/ljdcUMNUMVlx9SVQltvXfxRh5Bm4NyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795207379;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding;
	bh=zmRf5gxjlnJH9lvYWVVBAgX4Un3YFttD1kKPZfXFXn0=;
	b=k8ul4ObxbmVWtLLgZp5ug4m/daDtUX/GswgXqS53tif3s1rKMSoQ3V41uzSLP0XJq+ip
	 idTgYGh0rtb8y1u/aLkOzlnyOeGpN9mnO2oaJD619zCCi+uh32pFOSI1GHh0FyVZm3GAl
	 Y+w6FZadx6ALj3nV/yEy9u3NOWtTiJXc003XRKWJZQP0n7ZjB4guTL4ybEUy7CLtUhZLb
	 TdKxG6xzI3xVjbsp0ld4FCR00YdIXL2utdHzFWCiMHYP5Tkw35o46MeiULMXI/pgr56BN
	 EcfnE6kjNI+Q2ot8lvgQfFrvhWOuH+WTg0z71xpGpYRqPpwnkYvYzEGKgaWN/FR0btg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B83F6070A5B
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 20:42:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B83F6070A5B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91c1f548f87so18869756d6.2
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 12:42:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795207378; x=1795812178;
        h=content-transfer-encoding:content-type:references:in-reply-to
         :mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zmRf5gxjlnJH9lvYWVVBAgX4Un3YFttD1kKPZfXFXn0=;
        b=qFu9g+j9mRm5CKqL9EyvSVNpQRIy6uWjljAEDdqtlAiDq5aP2wlsVwVWEP7L/g+/YS
         Ydzm9LIfH5mQfQJVrQFgcq3dh6+iAncENoh9mniQ617POPr3Mkf4ZO6cp8BEsujq2x9l
         siJrBbeRtP0Z48M3o2XkTIv3RP3Or392dtQjSbcNsazws5jcWbNkA0JfGPynuyJBZUU+
         s5oD6s71BuP9eVEt3dpxlMTwL67pRdf2TLyQs8FA4d/Ia2cm2gF4GjW9KkKg0R1x+4Bc
         zbfEwMhJXD32gwHtN9evnxu/fUvQiBivUlYdrO4IbzddmYtclSb/oJR6RSZh33kIcdJT
         6M+w==
X-Forwarded-Encrypted: i=1; AL+hErGWhBsNAgF4VQueGttLXusPhq67oqrt7IQeKB5n1DmAWPz+YnZ6Tm3B4AEyccUIAEsoBfWYc2wUMw0NzmX7G2w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1HMy5qWUQnyptqclHvwMQjXePM7OHgZJKSxvPU+yobj1iiGFI
	Zn9YydUwZhTNWrhwFkUtg/RB7uJ9nsmLgDa6KMuwNWuN1yKPS041G0qo
X-Gm-Gg: AYBFou1lNrsQ3x86ibn855jMKGYNl4scXB5PBWw6/20i2qY9pXhFQuqZhKgXpUkvrjI
	eW+/yDP8u9h49qY95Jz3gLs/O6s1oDtxUYMupF1+F2kDbUWscS6JHehDtuXy/0Oz7gomBl7CQ+V
	GCEX9E6Jp6A7IBDCbzeeTbCtwr5lN7fsA1V1JVJQwNeaijeqdNUsoFoR2raruPZ+XFIYQhq/fpw
	lJvLWC67Ef9N/VXJQhBROYg90sbqN0RrKCn2Wc8SKljFzPt3U+2+UOLBDEiq4jVK4aQM/dYGrVM
	usC/0Ac05Ne84YpluP9KhMiFB+JfWFZtWCXbVsbDpUxHu8bfE4S5AmG0My+KHfeNkJnhSuNjGT9
	5RIRz41NJ8rYa/Dria1Rim+UGnRkCbQWGNk8pI00KC+2JIku6507YsHPc6CHyACsIxOCk6GWMoZ
	ddbvPvc8TQ1vMljcIs2dyz3ZV4xed8RzqmMMhTzVNh3WdXOzsSRRdMc9IbWHp9ZA/HxgFuX9jFO
	PkrTd1v/tObzL2+2Q/MBm2bzd9M+akax/5vak/WwlEH9hVXNThrMKaeyF6+ropgjj52TWgv0xKH
	lxpXG++bo/qxNfh4ME4r5KSCNmP4LuBchgOmhliTJ3NgrmQiomej3jp+EpXST60FEluiO9Oo0Ul
	QybWWq1blpfKl5bTJpwGMGCO0hsMekjuzQ0ogOUxg3Dp61J2ZDbr4
X-Received: by 2002:a05:620a:8801:b0:947:8230:5328 with SMTP id af79cd13be357-949ba9cbc05mr698548585a.34.1795207378346;
        Fri, 20 Nov 2026 12:42:58 -0800 (PST)
Received: from localhost ([199.170.132.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb40ea12sm278707885a.35.2026.11.20.12.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:42:57 -0800 (PST)
From: Tamir Duberstein <tamird@kernel.org>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Andrea Righi <arighi@nvidia.com>,
 Xu Kuohai <xukuohai@huawei.com>, Andrea Righi <andrea.righi@canonical.com>,
 Bing-Jhong Billy Jheng <billy@starlabs.sg>, David Vernet <void@manifault.com>,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Andrew Werner <awerner32@gmail.com>,
 Zvi Effron <zeffron@riotgames.com>, Andrii Nakryiko <andriin@fb.com>,
 Emil Tsalapatis <emil@etsalapatis.com>, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH bpf v2 6/8] bpf: user_ringbuf: Handle position wrap
Date: Fri, 20 Nov 2026 17:51:54 -0000
Message-ID: <179519711468.18576.11537240668767230400@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CAEf4BzattX9GherSPJ7DBeKksfxsX_uKz4y4tYNU=gUjqkJP_A@mail.gmail.com>
References: <20260618-bpf-ringbuf-fixes-v2-0-33fde039ddf3@kernel.org> <20260618-bpf-ringbuf-fixes-v2-6-33fde039ddf3@kernel.org> <CAEf4BzattX9GherSPJ7DBeKksfxsX_uKz4y4tYNU=gUjqkJP_A@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> should we use long and then replace cons_pos >= prod_pos checks
> with `cons_pos - prod_pos >= 0`

I kept an unsigned native-width distance for the empty, ring-size, and
record-window checks. Would you prefer a signed comparison alongside
the window validation?
