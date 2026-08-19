Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9998E3D3498
	for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 22:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787178022; cv=none; b=jLDbH0ZguqnYGZwQUYH6+n/d+gG/eBYzt2IUw5q1ydiTcQJdy1064bCsj2UIk+fRae+7irzJUYo8qbfRKADRecQIhXfj9ylEf66QcqYH6EuHzJIIFORcWExg4m8I2gNlwO7BG2lWjw2ckrs6mRLvGbAF7LV9hOW0zdib/vAgLFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787178022; c=relaxed/simple;
	bh=M1VXUNwqUwGEgfRS0NgJ6OgY6SeOvTMhCU1xDOQSQ24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/j/UlY20p+SDku8ti62GeD2AJm8Ql43SniTeiFap0Dr4hzaF1+YBF1wV5Z/b0M2P/659zTktwVXBMFf80oE1YOdnO3BoYfbjE/WQ7peucB+UiATF5XWwkfN8RLW8Apnui5kJJELEPZpW9HjdaRgCg23pU1UzSm1tUB2BHC/lPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VkPkvuFK; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VkPkvuFK"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38e7109321dso1058004a91.3
        for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 15:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787178021; x=1787782821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3pxS+zsXhr0mdIotv7+6gGRpeyumkKfkIec1uTTrutY=;
        b=VkPkvuFKv07HXhD/1isMbBl/+FiF6yPnHEATZ7cVaAcMOyo8Xx6ZVC3M6oMpUV4oAx
         Fs1sQmlI9IuXKdPqObUeL24zwpgXdkhshi08r+GMiVIlLFgB6+cV9JL9nrH42jCPsBU4
         +aNfi+MdOTO++mJ4d/w9hcE3kXSekoVs8HX/52jwlol1JLZNZWfgwyLTXlUVSM1zuKeC
         he8bVI8a2Tpgm4m7yXMAiTfSv1upeehI3xX7vQJ6npmGRGaw/J3kKdowBAPqZ8Fug7gy
         Mk+VQq92T8xT9b7ez/0VPvD8CzjhLqkCSLSaRrqtKeo/3uFgetXWYVO2dGJavaY4O2gm
         IUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787178021; x=1787782821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3pxS+zsXhr0mdIotv7+6gGRpeyumkKfkIec1uTTrutY=;
        b=LNsIiDatXFeZpa0PtiEuJDhsoL+g1pE+/dl8BZ7HK0mI6wzcxL/I5eGuWwc8UHFM7A
         sSiwhvZPcGhwnofFkq4+C8cXfoAnVaKXsCS4WaNtB91/Fe1T7Y0GQizgbUPJ9cBHnmQf
         iBeSBW9wrH0CvLt24XXA6hOiNE/VW3x5UZWvl7AGlMWTqmmA1fV8xotyCFMGmYoH/oHf
         B1PiQlqvCaJD+2gLPGsacMaXL1ebN1eUv+4QrHQQs6KANN/yhvlT8eQ8715yKEn5oGFZ
         Z1Rl/58BvXu6jULK/i0cj9wI2xAxlm6IKh72hIn0RO77BI0VuMOZYcrUQa+4Fx8fOI3w
         hTSw==
X-Forwarded-Encrypted: i=1; AHgh+RpDAu9LdwyxLKMQOE17fH0RqBO01R9Jikz8KnSsdCfM9u1obbzigRfEWCH/NVLjdSWxLxp4LZNenkF+Nb6TO6A=@vger.kernel.org
X-Gm-Message-State: AFuF++lyMeIjsHHoBQEc3rdDArhZDTB2EFy81tz+fqTH5D9/feYKeV3J
	DLVxZWNDq/J8s27Ybj7VA4Hmnv+MzFpxnZvVKvx4s7zwHp2WHsuWlaVP
X-Gm-Gg: AR+sD13/8+ObLfF1EkD5ShMTfubBNWEiS0QcyQEXBD2bKYUuotb6NWitwK+9zAOYMdg
	1g10EzVhXoLmtIMNELhVMBO8Or9lDBLwPhOGbK/cQN52kC8H/ZJL0wuliZIOc66EWdrCj3bgW2m
	0n57uq5QWBMFteHQ80IwjgG/3946AbovLE9+u6BfhhmVl/39mxVDZrAgxcTUUHw2aKQE8JihRSW
	C3rxwCUxHU2m1J6zDpM8+hxrCJskQ5f3IlnXtwjvUEH+IqJnRhly8GAuv6lSJ8JKQ9rdFBmiMD+
	ReHmX+ml++9bX2+zrCX9X5yYBhGpDm5dfz2Y974E3sFDyfpTdiZIojIeY05XtqGxrzPkAo90jCP
	pEXUNp3vpCTZRMkxFH+rKL6YvZh4pwIZXkJBDqszgJ6brtAeluO9XZjH5UYE2pG8w9nR9zByNWd
	X3Ze/SuneHDhd4tLLT0ynUQCJyWfbN8f87tQzEgGNLX838+XzCql50f8QApN01VV+hpUcdFFT7r
	Czz65fAMEWbWjM5ahs=
X-Received: by 2002:a17:90b:4b8b:b0:38f:efed:5448 with SMTP id 98e67ed59e1d1-395812aa117mr13843288a91.8.1787178020794;
        Wed, 19 Aug 2026 15:20:20 -0700 (PDT)
Received: from devvm16600.scu0.facebook.com ([2a03:2880:9ff:64::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad699c9sm10555337c88.8.2026.08.19.15.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 15:20:20 -0700 (PDT)
Date: Wed, 19 Aug 2026 15:20:17 -0700
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
Message-ID: <aoYsIYnoFDvjkzKp@devvm16600.scu0.facebook.com>
References: <20260817214205.723267-1-ziyang.meme@gmail.com>
 <20260817214205.723267-2-ziyang.meme@gmail.com>
 <aoSUob1s8WBQ3buO@slm.duckdns.org>
 <aoTdQeLZZuRirNHE@devvm16600.scu0.facebook.com>
 <aoTf7u20mo9s6ADj@slm.duckdns.org>
 <aoTkZhQDoaQKpPe3@devvm16600.scu0.facebook.com>
 <aoYVh1ihBH-TWvi3@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aoYVh1ihBH-TWvi3@slm.duckdns.org>

Hi Tejun,

On Wed, Aug 19, 2026 at 10:43:51AM -1000, Tejun Heo wrote:
>Hello,
>
>On Tue, Aug 18, 2026 at 04:01:58PM -0700, Ziyang Men wrote:
>> On Tue, Aug 18, 2026 at 12:42:54PM -1000, Tejun Heo wrote:
>> > On Tue, Aug 18, 2026 at 03:31:29PM -0700, Ziyang Men wrote:
>> > > Ok I will add the casts bpf_get_blkcg() and bpf_put_blkcg(), and remove the
>> > > check of css->ss in above functoins.
>> >
>> > RCU_PROTECTED is probably better than get/put().
>>
>> Yes we can make the blkcg* RCU_PROTECTED but then the bpf_blkcg_flush_stats()
>> needs to take the @cgroup* since it is SLEEPABLE. Does this work for you?
>
>Do we really need that function? css_rstat_flush() is already exposed and
>css can already be obtained, right? blkcg_fill_root_iostat() is just
>accessing system-wide bdev stats, which you probably don't need to begin
>with or if necessary just access through bdevs.

Yes the css_rstat_flush() is exposed but currently it is marked as SLEEPABLE, so
it doesn't accept a RCU_PROTECTED css we proposed. This is not a problem for cpu
ones since &cgrp->self is a trusted pointer. 

Best,
Ziyang

>
>Thanks.
>
>-- 
>tejun
