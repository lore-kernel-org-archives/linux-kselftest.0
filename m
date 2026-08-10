Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A22928F5
	for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 22:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786402023; cv=none; b=ZNt7cCchagkv2AwI+H8Gjuo5VNCFkYyztaqZbL7ponytzff+1LECjo6qAYFHpXpFyXMg/PxxA7dP9SC1rckV5vo+kzTd3a/YqKBrwSVWArzce7vvl+vsGMKfTg89uihNOUAL9pcO9beOh5HKqI5W6WKFI3Oi4ikP8SYWzzbC0+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786402023; c=relaxed/simple;
	bh=j0OQmT53umZb7i6H00ow16BYQr6XaIiq74a3wXvSmQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bpWi+yHqMAZPRTTDSftt4IHXLQstBIcj0avjZkw5ObVwKVtN+pbIIa1SJeepPtjVvrHG8EoKJgBeTHUAmB1tf2uH/haAJD8IfehjCpX3tgRRCwRIUTM1ILEuW4wEucgoSBIVm/0JVkJOFognlj5EesSt/kC6jv6jA6UM3FBkzok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4xuI4HE; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4xuI4HE"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ccf2360620so21963475ad.3
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 15:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786402021; x=1787006821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GSgLjB/IGBoUiOT3dGu6Xr2ioiybikIeSufKLnKV+5A=;
        b=P4xuI4HElZe7p0IfsOkFrq6eCDodfYTXhFcQNQWxoRUuTeBDMCKOZsPq46j3udl9gD
         CCfBbGrzAs/UmB3BootdJTmI5qcwMC1cQq214S0kDof/0IrinaO8MFYcMv0QG8TNjKY2
         8jjOwMLeSwOd4o9MviyO/Lu49ePL46ifdbBcbCfRdnq0x9PlmUzyLSjk0hUmTsipmBdy
         UD698jqBj1XhCKFGnJdDN1EwhwFQU+3BkNjozdSxDhyRF7Jv4UZlnDtpEP6Of/DJzBXe
         SGhYkBnkAlA01IRiwATSvei8pEZ5NEbwiYjr19E3z4KZG+DysjOsuzv1RXjleJQc8Vhx
         FI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786402021; x=1787006821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GSgLjB/IGBoUiOT3dGu6Xr2ioiybikIeSufKLnKV+5A=;
        b=FdsrPbgFs1XSRfsPlJnpQk5kpzAOeY+jp5fbFQh6mVthIFzp1wc1ExO/a/mEAw0MSw
         H/izjd7XakDoM7QjI2qaSoI4ASg5BvG4E0DjmTWUXGDTfrfRZu2+2uw1Opd3Y3q6QhQZ
         nCQBVeXtFh8RALB/rEGn4GwOEWT+U/CVXcpVuvP/oe3pGWwbJfh45PM3IruxMlrB19Yu
         Rij+owrEOsxjzljTNQyoIab0rB/hta28kN1YF1TerTfpgoz694JHQQgXPcW+qGNzhKIG
         EnfawNYhFW9jBv9M2oLDZVz8LnXy/dN76WvI1HY8HmPdFo9jAMwjrnKNYP4LIqfbjbIq
         o17Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro81UlVh3evC0lcWZupGxZG0291XZmykad+i60GL5hOB2LyAD0Dakqp7a88zae/+/y72CSDbKWJVRy6pbafv/s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn4oMOFHIAQCWJZHdWfJ5k4L+dVhrO1KIiFMC+yV9RHztQn7g6
	E0Lry77RC2fM6MmcRP+83QxJdliqCe917HYQuPvRx1N5Lc7LO0bnJGtX
X-Gm-Gg: AR+sD11RB4PDvDDyTEZDtcRHBikRF3kuOMfAFoJcl2rAnf2K7GGHVYgWJBIGw1DQ2mj
	RgIPlE19HPAwpHSinYgRgLF7dEropZUzaHpjltTkc72BwMu+haz38rm55IxLwRWnH9IXU9EfjDY
	4ZJ8Blic8vTQnoA+Qm4l8aPihHualBd7sLPB52bvH5xFL8Jy3rwfO6lLK8GVXLQ6+rTSyB3GuYt
	hvlbO5rb1ibwTyW7hD60ayVyoAgm5TH3gYjur2HMBKADXYXLcxdcs6iev5su+i+I303HTcq+8Qt
	ySmhPPua5zl0hm070f8E7gic86MeJU7tFMRmYqfE/kAm/8+PeIEXGqtSS4JZJJFMAmWknEYI8+I
	Ez+uhIByF30dyehlqLRdLtzEolRtnJT8fo383vXuSIxLcJ+AXp352jF4UkcNWt2lyWC1cEfqT3D
	zT+GWR+5rgILvNM7pjg8V0V5zpM1WBEABWiRUsRx8tHlZMp9yi8WHdkV0rNFEK2xJdIlOuM/ezk
	4hE3KnG
X-Received: by 2002:a17:90b:590e:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-3909d301d9cmr33764302a91.0.1786402021510;
        Mon, 10 Aug 2026 15:47:01 -0700 (PDT)
Received: from devvm16600.scu0.facebook.com ([2a03:2880:9ff:68::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec26a46sm47194173eec.27.2026.08.10.15.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 15:47:00 -0700 (PDT)
Date: Mon, 10 Aug 2026 15:46:58 -0700
From: Ziyang Men <ziyang.meme@gmail.com>
To: Tejun Heo <tj@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Josef Bacik <josef@toxicpanda.com>,
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
	Mykola Lysenko <mykolal@meta.com>, kernel-team@meta.com,
	linux-block@vger.kernel.org, bpf@vger.kernel.org,
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] block: add BPF kfuncs to read blkcg io.stat
Message-ID: <anpU4oV46MDVDixj@devvm16600.scu0.facebook.com>
References: <20260807193732.4073299-1-ziyang.meme@gmail.com>
 <20260807193732.4073299-2-ziyang.meme@gmail.com>
 <anot9w6mg9538RWm@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <anot9w6mg9538RWm@slm.duckdns.org>

Hi Tejun,

Thanks for your review and suggestions!

On Mon, Aug 10, 2026 at 10:00:55AM -1000, Tejun Heo wrote:
>Hello,
>
>On Fri, Aug 07, 2026 at 12:37:31PM -0700, Ziyang Men wrote:
>> +__bpf_kfunc struct blkcg *bpf_get_root_blkcg(void)
>> +__bpf_kfunc struct blkcg *bpf_get_blkcg(struct cgroup_subsys_state *css)
>> +__bpf_kfunc void bpf_put_blkcg(struct blkcg *blkcg)
>> +__bpf_kfunc void bpf_blkcg_flush_stats(struct blkcg *blkcg)
>
>I wonder whether making the above deal with css's would make more sense so
>that we don't end up with per-subsystem iterators. If casting to per-subsys
>type is necessary, we can provide RCU protected cast kfucns.
>

Good idea! These do nothing block specific and we already have some common
helpers for it such as the bpf_get_root_blkcg(). What is missing is a way to get
one controller's css from a cgroup with a reference held, and the cast. So
I would add in kernel/cgroup/

   struct cgroup_subsys_state *bpf_cgroup_css(struct cgroup *cgrp, int ssid);
   void bpf_css_release(struct cgroup_subsys_state *css);

where the @ssid is an enum cgroup_subsys_id value. Afterwards, the only piece for
blkcg left is:
   struct blkcg *bpf_css_to_blkcg(struct cgroup_subsys_state *css);

Note the bpf_blkcg_flush_stats may keep its current shape as it mirrors the
blkcg_print_stat() which skips the root.

With these helpers we can also replace the existing ones in
mm/bpf_memcontrol.c as well:
	bpf_get_mem_cgroup()
	bpf_put_mem_cgroup()
	bpf_mem_cgroup_flush_stats()

they map onto bpf_cgroup_css() plus a bpf_css_to_memcg() cast the same way.

Hi Roman, JP, Shakeel: Do you think it is worth applying above changes for
the memory controller as well? If you are happy with the direction I am glad to
send the conversion as a follow-up once the generic kfuncs are in. Would you
take it?

>> +__bpf_kfunc u64 bpf_blkg_iostat_bytes(struct blkcg_gq *blkg,
>> +				      enum blkg_iostat_type rw)
>> +__bpf_kfunc u64 bpf_blkg_iostat_ios(struct blkcg_gq *blkg,
>> +				    enum blkg_iostat_type rw)
>> +__bpf_kfunc u64 bpf_blkg_dev(struct blkcg_gq *blkg)
>
>Ignoring 32bit split reads (do we really care for BPF accesses?), the above
>can easily be done with BPF_CORE_READ(), right?

Agree, these parts will be removed in the next version.

>
>Thanks.
>
>-- 
>tejun

Please let me know whether the above ideas works. Thanks very much!

Best,
Ziyang
