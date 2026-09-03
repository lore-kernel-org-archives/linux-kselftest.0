Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC4A2FF675
	for <linux-kselftest@vger.kernel.org>; Thu,  3 Sep 2026 22:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788474798; cv=none; b=sTQzdmzUpgbf0aWkeSmDijI9glbDK+n1eMMiyYbwKEQuYtIGYQFHSyM13j35z5azHkYFAP82v8W666hCkIKDFcAAZHddGXzyuzoYCZ03TNQkc1wkI9Ww22vF18XetxAUZ19yz9VpqMvM6J2NS0Q/bhVgrspbjUE/PLagdhxqC4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788474798; c=relaxed/simple;
	bh=4c3nfHzx6sq9eUFKnQag6UKfPOIkWmaO1ykpU7H4aTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EkeXXh9iIjPfI3HUEl+GUr9a327R3FqxtHZc2liSj212zKZeOS52m78lam3SyBiz9XQQH5wHIEoxBbxeXSSj8Xlo/PKHy16TB6nc/nKjC5/YSGom8FEC4q2FTvDss3//h8FLUwtLSLBV1FI0CiXBFxCy4X6qqrwamogrAtMm5Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FsHvcRhC; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FsHvcRhC"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so377747a12.2
        for <linux-kselftest@vger.kernel.org>; Thu, 03 Sep 2026 15:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788474796; x=1789079596; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fsb6fC2BuVNqBfvyOr4NyKSsD45FGtfpTAVkgi/kym4=;
        b=FsHvcRhCU6TMl+UeBx+bnI8iEyrnBLJwSmw9MOiZMDL29XawM5rsCzPt5uvYnfeCRd
         VxMzbh+f/Q2YjF3tjclhwcCrez5bxpwNi+ODuX9ExQ9kfWQAjhj0CKHLgW76roI2rDKl
         +Bnot7RxzAuGXtuPcLje3DjlYwFhqyU21vWhmqRI3S/U/IXncIUAKQ0oO0cUeBL+qiYq
         WEOHWLinVimGVZhqVOZb8E/SC1kbn7fXkpq3USuc+lG57dj32GGkVg24WpiAfAeBI069
         PnGalnKHaQyjpmO3Y/tlrVGVWV3mWWZI36WWV2wZnjlunR2MeRT0LiWqu1ky/vfizaYL
         ek7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788474796; x=1789079596;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fsb6fC2BuVNqBfvyOr4NyKSsD45FGtfpTAVkgi/kym4=;
        b=WnnE94JdbEKSjvJpOpNZOYrd2rxcHOnGc/zUB1M6ljz60bn7tWLjdUuQu/M5uy1mgz
         /ley+E8liMtI6z14vKugtWr6XVle/FVYBjX9UudHOy6/dWO1G9IbZuTTcsMzfICNuxa+
         5t0OPIyStZl6NjSkBGzOdxPCGfbEKcUY+w+hwD9/PJnPKbmYOSjQ/xeXxbGTHoTQZrLH
         2Ubm/ZlnFJO/h4ioutOXGWv8I7f6fhkNcIn+NmTs7B77Z1O43twrBYC649LIp4q1ocY7
         CUOjgUBPr1tjcfVZGqMmxVXHb57++PguHF0JeU3HgaYXZoNLqtyKjAz3nP4bI/urPjcf
         bcsw==
X-Forwarded-Encrypted: i=1; AKwUvBzqVNaPIJURg2+3sA2oFMHjFFOBBny31GcEWwds/g6VnckdlD3lNJorKKQEyQwN1OKSXGpoyw5DtcHWrrTevNE=@vger.kernel.org
X-Gm-Message-State: AFuF++kMBqFclm3O9T3v5HmDe5B3P/0sFeCX7hFTyBbtznu6ikxkg0YY
	p8cpABmj/zhUsEbMBWaEeq7JSYa8NYgUznN5nGyGyAArMvkNJt6LTMPC
X-Gm-Gg: AYBFou1gOXbIyB3g8io074cXDpI8qOU9j3RVmW0Z7mAK7VnCAZxFybcgoVhGy4IxWpR
	LkotzYUZkEVbmfp/TsMj1VCmKr5p8qZlZbBnXKO9hFsnMXL4XR07+Ol/B4Pg6Jzvs3N05Rhe7jJ
	vZfofMBfd6pcGWqX9SS1K53wKBYz8Exb60Ch5RQZi0IDFAlYfo8TUkwEdjLx99XxiZNDx1oRIXR
	WKv2cwPrkNGOu36qlt4lmDULCh2gReUXwzt7U3fi5gV9ayeS+PQvApsiZW272dfSzhIGY76POhC
	cnr3C1hT72RCNeEK2fwcRAGAen4WXJgIGDD3FI9NaNeqTVJasVN5wOP2Gi95dj3z6TE+Jkb6huX
	Y0QZVMd4tLkxsrwCWzkXQoifRn9zq2E9fIf7OhT2O6eQFExvGwbMgTkWgoVI6DRilW2kUxWfw8Z
	JOD0bPvqUN055zfLDxo0fgkBhjZke5TnZm65JuycGu4fSfyPLuctwV5dbS01fz75bC4uqy3LfP0
	ZPSo8Fu
X-Received: by 2002:a17:90b:268f:b0:398:c3a3:dbd0 with SMTP id 98e67ed59e1d1-39b2612eb96mr2849147a91.8.1788474796180;
        Thu, 03 Sep 2026 15:33:16 -0700 (PDT)
Received: from devvm16600.scu0.facebook.com ([2a03:2880:9ff:73::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534d25sm1797152eec.5.2026.09.03.15.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 15:33:15 -0700 (PDT)
Date: Thu, 3 Sep 2026 15:33:12 -0700
From: Ziyang Men <ziyang.meme@gmail.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: kernel-team@meta.com, Jens Axboe <axboe@kernel.dk>,
	Tejun Heo <tj@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Shuah Khan <shuah@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Ben Segall <bsegall@google.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	JP Kobryn <inwardvessel@gmail.com>,
	Mykola Lysenko <mykolal@meta.com>, linux-block@vger.kernel.org,
	bpf@vger.kernel.org, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] cgroup: expose cpu.stat and io.stat to BPF
Message-ID: <apn1qN+ic4A7elHD@devvm16600.scu0.facebook.com>
References: <20260820211758.3393984-1-ziyang.meme@gmail.com>
 <apX9KtGrmfA7u0zV@devvm16600.scu0.facebook.com>
 <apisezhyZe_3vp0x@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <apisezhyZe_3vp0x@linux.dev>

On Wed, Sep 02, 2026 at 04:10:01PM -0700, Shakeel Butt wrote:
>On Mon, Aug 31, 2026 at 03:16:10PM -0700, Ziyang Men wrote:
>> Hi Reviewers,
>>
>> Just want to follow-up on this patch series. Please let me know the possible
>> issues and I will fix them.
>>
>
>AI bots have raised real concerns. Please address those and then resubmit.
>

Hi Shakeel, 

I have reviewed the AI bots suggestions, and it seems the main issue is to
decide whether we want some kfuncs to be NMI safe, e.g., 

	- The `bpf_cgroup_base_stat()`, which calls the `cputime_adjust()` and in turn
	  acquires `raw_spin_lock_irqsave()`.
	- The `bpf_cgroup_css()` and `bpf_css_release()` to get/put the css.

The simply solution is to mark them SLEEPABLE.

Hi Eduard, what's your idea about this? Do we want to mark them SLEEPABLE or there
are better ways stand in the mid?

Thanks,
Ziyang 
