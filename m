Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E731C5474F
	for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 22:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787092295; cv=none; b=EaWTP76JhyNoeqEOJGKMer9W5oeiScBxlrZWi2qjP7Wvq1b70eWDMy1Bl42TL4Qs0MGhxquHkHI77+WVFMcjXDqvEHQPy9/DJO0hwXrTJi0mgM0sMH7KEPXUcBNrliQ5Y6j2dxmIHHWIynvZsJ/fZSxS0OpqJHAhnlntNGf/ZPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787092295; c=relaxed/simple;
	bh=uuQkTIjteO35Ck9wft7z8E25w0ojFQnZ5h0DvgiWKa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OR9L0ci/8odUaJsjfGcd2N4G/Be4bLycQcKyI5zGcSoNnY9lzgSLjsfaf4pRudoYu6FFeO3EPD+N1058hgunnVW3EdPcKj0V83iMioBitBCungZipxcGxyxOPxjVNzpsXjQJh7UPCpDNP5AU2l+u8fc6sDF7bUlIjAWw6JKeFOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s/A5qmfb; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s/A5qmfb"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso671613a91.1
        for <linux-kselftest@vger.kernel.org>; Tue, 18 Aug 2026 15:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787092293; x=1787697093; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EFl0Ov2rpc3xev/n5APT5V/efpbjI8Ad2gYSG/EUGz0=;
        b=s/A5qmfbuM+5ecriHmwzNPk4HIcLd+JECC9r2BEWPEHoIA7Tm8ve+21b9T6s9gpkga
         OJa2uKTSnLIQZOvUihDOiHo9sgNGKdwWzjoy74s3vGW5fxnoLXSNV7zjgIRnSW0ipRjM
         HtpXOJuKrNZAp+1IOFEm8GK5ne01k6KgKLGN69AxRqW56cRUOdM+zGbaZ321KEdvu20C
         QhbX4qDq2I+gjeCV8/P8IvlUFWJfGafqzHr+u/ZauF+F+0u5BTDZs6FdhMuRLTH2RRXy
         IzGmNAd5OLK/npqItfncg+b9R6Bbx5c/Bq+J3qXmFHzEVb5wY41BO4xKJnbhsdhYXOFO
         oRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787092293; x=1787697093;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EFl0Ov2rpc3xev/n5APT5V/efpbjI8Ad2gYSG/EUGz0=;
        b=iN7inOoGE1bjX5EPzissOqXo4x19Gi5sAFdmzK/ilTf9IDay8kUFPmiLjNvsMo92CG
         cpdL8VvC2hCJlJjUyQCoNSgYGu5GuSnQdKAvIek0wi2Pdq8CqTVgV2KbWZK6wmBlnVJV
         He8LPknDGYk4iv8WHnT4d4ZfP+Q0Uw8kt/1ZVj5v3wz0B0h/q951XCyDza8kAUVMgG5P
         G68rlPYTLxvVI9VXcOUCzEYtCr9PptIKv7LnR8i1KiCG+bF+4MG3piHpfMZvj9sq4qeh
         f66c6Bji3cZ4vHLW8Kvl+aTFSA9OMpe4kGXavfHMdQfAyRoFJWyvZMpZT7d8sBia+Jsj
         LUKw==
X-Forwarded-Encrypted: i=1; AHgh+RoeUVDSdRPSiRri3NSYq68mcv3NAn+ZkLIvF1S8ukNWlybvDrA2VIMG7V5KndapmiZLPef25a6kEPNXLuJWssA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaKqIgsypZ4GpCmRwjOlmBEC/hOg2Am4APu9BzlL+TMv5vGcLz
	vLInsW94XhLKpRJIiDrpyBys0QqWssHYN0YiUm/01IHDmHZlQlvkPZlL
X-Gm-Gg: AR+sD114bOzmpol56PtqY4T2solGqGTvViNsFtU5npbZFq07mteyuvzzBu9QBItaotX
	SqnKWz+gUAx1UH8NNHUi+Q9rkdhClVfqN0sFSTaZpo3aVf8Ef7CFmWjg/XBCMsqgey1k9GTGqUB
	+9+ZD5t+OUD7Vno/Vn5Mwo9r0E4HWx6sUG62fpllUwv78HNmBysJ9j9y+u8ctjYzo40bd50CEEq
	7lLjnyIPL75CcMkZwLNl+XK/zis/auoZbD5vsewRwLioC7WsEoxTZJMd9Ij+KUQSkP0IQ0xgpgo
	ADoMJvsF6sahwuodMssDY+tjEAoI95024hMN7Us5YtmjNVu51YJPMTwi/4rHijsqtlkrI/e3ZIP
	NK5BZveCm+BtUIrZBe9LP1XP68HK43i4ioM2FbudqENCddkrSEgGJYpl/SrmNFU2EnxuIUHxlT0
	nxIfS/TbQi07KKuD4vypUl87z28QP4Zs8nmc35oD4Fy/5cHhA5M1JfsBMS4EEUw95BENYt+Kyaz
	Pl6VLZc
X-Received: by 2002:a17:90b:2685:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-3958049d47bmr482556a91.0.1787092293365;
        Tue, 18 Aug 2026 15:31:33 -0700 (PDT)
Received: from devvm16600.scu0.facebook.com ([2a03:2880:9ff:40::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ae14162sm404407c88.9.2026.08.18.15.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 15:31:32 -0700 (PDT)
Date: Tue, 18 Aug 2026 15:31:29 -0700
From: Ziyang Men <ziyang.meme@gmail.com>
To: Tejun Heo <tj@kernel.org>
Cc: kernel-team@meta.com, Jens Axboe <axboe@kernel.dk>,
	Josef Bacik <josef@toxicpanda.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	JP Kobryn <inwardvessel@gmail.com>,
	Mykola Lysenko <mykolal@meta.com>, linux-block@vger.kernel.org,
	bpf@vger.kernel.org, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] block: add BPF kfuncs to read blkcg io.stat
Message-ID: <aoTdQeLZZuRirNHE@devvm16600.scu0.facebook.com>
References: <20260817214205.723267-1-ziyang.meme@gmail.com>
 <20260817214205.723267-2-ziyang.meme@gmail.com>
 <aoSUob1s8WBQ3buO@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aoSUob1s8WBQ3buO@slm.duckdns.org>

Hi Tejun,

On Tue, Aug 18, 2026 at 07:21:37AM -1000, Tejun Heo wrote:
>Hello,
>
>On Mon, Aug 17, 2026 at 02:42:04PM -0700, Ziyang Men wrote:
>> +/**
>> + * bpf_blkcg_flush_stats - Flush a block cgroup's io statistics
>> + * @cgrp: cgroup to flush
>> + *
>> + * Propagate I/O statistics up the cgroup tree. Root statistics come from
>> + * block devices and include all cgroups' I/O.
>> + */
>> +__bpf_kfunc void bpf_blkcg_flush_stats(struct cgroup *cgrp)
>
>Either @css or @blkcg, probably the latter so that each operation doesn't
>have to verify subsys again. I'd make this and the cpu ppatches into a
>single series. Add blkcg cast there too.

Ok I will add the casts bpf_get_blkcg() and bpf_put_blkcg(), and remove the
check of css->ss in above functoins.

Next submission of this series will be together with the cpu one.

>
>Thanks.
>
>-- 
>tejun

Thanks for your review!

Best,
Ziyang
