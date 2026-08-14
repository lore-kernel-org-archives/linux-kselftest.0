Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659AE46F48F
	for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 13:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786714040; cv=none; b=mm01xvI+8oNcdpkv/1ztxxGnGhQGhP7iH13AVFmOnqVXIzthfYFHFbDDfzHjLkxN/5ckrX9PqsokTDxybjhywH3skn8gqz/w+cWq0F41B546EaY8UH34uvEQ9bKAzYhfC4mtu70DQU99zqByXCxKb+0TZtrnoO3kNL3VrVmHf8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786714040; c=relaxed/simple;
	bh=CChEzwWKHqvAbDe82pqB+EpRVBOCxUp7FVLoHlKhGNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSrO4lXU5pDOJt2946uaFyBE6h5FjYLaO6BHDZbQXoQTlq4x1jQzmnN7mI8a7RpmJ2Iw79c5Zdomz1rWTQBhai+Dk6PUqXq5rQqj6FAv7ocFM8/CoCusR1+MS7k1pyc6WZmlMW0agR4xlk3j4sTP6euNR4qZ4zQEkxTXA9qxaYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=TCpeiH/x; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="TCpeiH/x"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66c70d3abc7so1316041d50.0
        for <linux-kselftest@vger.kernel.org>; Fri, 14 Aug 2026 06:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1786714037; x=1787318837; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n4ArN/eG59F6/a+Z1l3n9inh5iDgTQHyg71JvETU2wM=;
        b=TCpeiH/xCWeDcYJotQrUKR+96UF0MG/Njhh1rbUlHRGBrpdQAImKs6oRWI41Q8Eczj
         +mTDkleatlsNeXhOUaGWaFyd3U50OBJvlvu77XCYcYzSq7ARn4Or8iIhiP8w6JBZAK8W
         oAd1trrpj6Ef0CklV1H2zSfBzIviHXmk2sB71HcaujcqJrFDI2zHP23dmMR4YDojp+3v
         GBSdAv+vPbaIHQHbjNZQzTtWNO8h2nh2HWBKxy6PVDPoHfw/brhOp2p2xqx48wXcX9eT
         697sKEtDAhvD4AyqB7mtbV3UuRSbV7yerIPuq30uagL3Wo2jyOy2OULMcp8X/mprik3I
         2+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786714037; x=1787318837;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n4ArN/eG59F6/a+Z1l3n9inh5iDgTQHyg71JvETU2wM=;
        b=kKPyANuc+QOa6/Qad1qQE/lAESoMa4MhfcG/JpgQD40kXp5SCnTXgHvn+3RmMfcf3m
         G7IK5n6ZoK5i3v2youfJpHCznIQcdZedqsauV6UrhMOWn9VgH+vlEgmCy0kUm6xh1S0O
         PGbaGYoB8lHY3qhO24urN3IxgaV0UTLYzZpgRIr7dWIVZD2YN1xr9HItfbXK2Smo3xDV
         x7377fT60SBVrJcIWaGK6BpFh3+eZ8KujqUnaDma8/E08k6pkoyYvVhlTpoZ7mGr8b24
         OxBoLpw91NVPpO4o04DaYhQK4tWvaLZ2L6s9hQ47w1iJMYkBnFv6XGOOgRJyrtQPsLlM
         CAHw==
X-Forwarded-Encrypted: i=1; AHgh+Rr9G7fIErjFtOww52pU98DROSprmja63S9U0Q5entWnKYiMHNL20kJN7R3ia2QLc/59vEOmtqGvJc4QtL84rdw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGmesZ8QFIo4T18IV3EfJvzJrOMIdZIMH64MRZhJZbAKqXIMA4
	M3Sp58PXOftr7nu3V8isf4DORaHMhodJ0g0vMkNuz6ER0tcyyLn4xskU3AyxY1p6ZMA=
X-Gm-Gg: AR+sD12D9RxC85ErzREMzpI3IArewmtoKiY8utmU6KJCXeYAvR23osjgrzOmOBX2mP/
	RicWuMyOHJjdO2biF5GXvgQVAG9fGDLpYLMPR/zPsCHxyIUJ46mt9e2vT041QlEMDNyEbD1hWoI
	tQ5Qt1QAcxsFMgvtL8WxK4OBfy8FhOOkrRzT2nRDldV3mexDqdYV379xMZYiB0NDgMf9DnSJ5V6
	FkX81nzrx7dxJEgOkmOFiVJzweA3iWQmj5g46Yd4FjglMIh9XE2BOfZHNt8eGh6fhDeem7l/pO+
	UyVZIG1xU8K0hXlwPNG5ZaRzcGOb5Ak+ScVZRBW2ukuNIKqWL2hT7dozSJm3AcC0FAtEvZC4EQx
	nmAvhjFCFJGur8J4MevaigJu6/9FHD9H0L8jO+fnmca0unCiljrELA+sMOX7q4U3nsJo+uVODOr
	AR+VXeEvyaEVq0Wuawnup6B1T/94Xk1ieJOB8=
X-Received: by 2002:a53:c584:0:b0:66a:3662:409f with SMTP id 956f58d0204a3-66c72ba0d10mr1917799d50.10.1786714036424;
        Fri, 14 Aug 2026 06:27:16 -0700 (PDT)
Received: from fedora ([2601:19e:8500:d3c0::28fe])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66c75c9d90bsm1010793d50.8.2026.08.14.06.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 06:27:15 -0700 (PDT)
Date: Fri, 14 Aug 2026 09:27:09 -0400
From: Gregory Price <gourry@gourry.net>
To: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: linux-mm@kvack.org, Zhigang.Luo@amd.com, arun.george@samsung.com,
	balbirs@nvidia.com, brendan.jackman@linux.dev, yuzenghui@huawei.com,
	apopple@nvidia.com, alucerop@amd.com, matthew.brost@intel.com,
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, corbet@lwn.net,
	skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
	rafael@kernel.org, dakr@kernel.org, djbw@kernel.org,
	"Gupta, Pankaj" <pankaj.gupta@amd.com>, vishal.l.verma@intel.com,
	dave.jiang@intel.com, alison.schofield@intel.com,
	osandov@osandov.com, jannh@google.com, pfalcato@suse.de,
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com,
	pbonzini@redhat.com, osalvador@suse.de, joshua.hahnjy@gmail.com,
	rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com,
	kasong@tencent.com, qi.zheng@linux.dev, shakeel.butt@linux.dev,
	baohua@kernel.org, axelrasmussen@google.com, yuanchu@google.com,
	weixugc@google.com, yury.norov@gmail.com, linux@rasmusvillemoes.dk,
	longman@redhat.com, ridong.chen@linux.dev, tj@kernel.org,
	mkoutny@suse.com, sj@kernel.org, jgg@ziepe.ca, jhubbard@nvidia.com,
	peterx@redhat.com, baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, lance.yang@linux.dev,
	usama.arif@linux.dev, xu.xin16@zte.com.cn, chengming.zhou@linux.dev,
	roman.gushchin@linux.dev, muchun.song@linux.dev,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev, nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org, linux-debuggers@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org,
	cgroups@vger.kernel.org, damon@lists.linux.dev,
	linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v5 00/36] Private Memory NUMA Nodes
Message-ID: <an8Xrb5Phmvs0xE4@fedora>
References: <20260720193431.3841992-1-gourry@gourry.net>
 <CAM9Jb+jpJ-Ui4qDHxsp2WiERiv8gmrQfKQ8Z0BmabefeQ6pg4A@mail.gmail.com>
 <an0cAMh_m8ZhGIm2@fedora>
 <CAM9Jb+jmxPdL-CdWQHYMT5G=qmjB6z2WFg+4K8Fod5n=2N6YCQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAM9Jb+jmxPdL-CdWQHYMT5G=qmjB6z2WFg+4K8Fod5n=2N6YCQ@mail.gmail.com>

On Thu, Aug 13, 2026 at 10:55:13AM +0200, Pankaj Gupta wrote:
> >
> > A device driver could very well just call memory-hotplug directly,
> > or its memory could be brought up as a private node via a boot
> > paremeter (which I have sculpted for v7).  The former is preferred,
> > but there's a bit of a chicken/egg scenario for bootstrapping.
> 
> I find this interesting as this appears to be evolving towards a vendor
> agnostic framework for hotplugging memory directly to private nodes.
> 

Agnostic would depend on a common standard for such devices.  Otherwise,
there is still a need for per-device drivers - but hopefully the
interaction itself can be generalized.

> How you see this working? In particular, How would the kernel know which
> memory ranges correspond to HBM or other device memory?
> 

Device marks the region reserved at boot, driver hotplugs.

or

Device marks the region normal, but boot param sets the node private.

> Please also CC me when you post v7: pankaj.gupta@amd.com
>

Sure

~Gregory
