Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9097E39D3D2
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 08:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786611326; cv=pass; b=aStnsfW5WM+IlILXzz//v8ftT5yaZEg8G+kx0XzJU7rM9DAJI+Xolyg9NyoMQcVp9ZpBK7dHCi+Rga4CH2z7/SvTo2uBsDWYoPeiEBu0PARR1yHQHUg+N0MbcFvN6fSE+Kxv4WJmhdNABdJ6Cja5BWN24OHHSK2TZ4RZk+GyNBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786611326; c=relaxed/simple;
	bh=Jzc8k1yrWfBTMmPd/uTV9o0ew6ZOvHlbY2BVlHKCDmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ii3yzb5F19tZDT1wfpuR5E/BSbFcGRiczfrYv9FB5XGA9oZWdOI5L6uo1MPmpgEXRRbJG65ZaEpgqf4NrFIO/WTsYIsMeNx4cWwwdtMq6owvTlEmqvcCa1kEPPsV61t+GQ6/NPELNaedWLs/BXQiCazkuVPnBIY5Sg/pSTp7tYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HbbGxqob; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbbGxqob"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so5571915ad.1
        for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 01:55:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786611325; cv=none;
        d=google.com; s=arc-20260327;
        b=eQJ4XY/yx42rRj8RFAfdKfkAf6TmwvFKCm1z0rP5O9SzOVTaM7+uy4E4nSsdmgSkKq
         oaNHpTuOMtYl1z66Sb++2mYwwqCCb3qhLkPCZfCG0BH3/uKe1I9zy3BHEaEluYLH1rkC
         Fyn/1un0vo8vt/T7cbl++muUzOGB0qje1DoAqCRFJgydRDEhZDaIGnX7oKcUhbKGuOPX
         WuDOBqXL+b3zFs889cTPQmxrQQtoigVA54pts6f9Xr7QpZ1+N87mDTQWMMdqLRqQZH00
         4iK90f/WxqL0pxMYiKxeOQJKfe9Hwxyl3jHlU7eXLtpfG5TRfwxrmhtx7WLn3ovVxvVS
         9X9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iQkBGHUJCah+5IraL6W1VGnCKmw1qeB0IxjLs3arhcU=;
        fh=p6+vsUhdUbtqEwtRRMPu66M0A1Ky8LBCjm5zLexpitY=;
        b=UcR16dUxfCpvqKXEicHzmlbRStX2V2ZSh6nJymbD6nlPqlz/NEnjMrKON2vIqtxolj
         WMj1yZOrEElMDOTnj05sQgizsoM62tevRljz0WymN6JnBYXYB/JTm5Hr6gC1E1Y6dxkN
         ABJmwr7RB0mBqLEroLXalIMpG+01vFujwoDljtdb2aqMQTziVA/kl3FreVrTlOowrquT
         L9Y9bXE3WmZoY9U1Fc5DZHBrHMB1ubCL29wT5ZM8tnQTWj7rb17e3fn7RUpZarYZDeB0
         N3az2h73sX72DUbE5dR3RHlxpnhQEHZO6noOq4fRGhwIdg8SB2PR7+imfIV/sfVVANH4
         qsuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786611325; x=1787216125; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQkBGHUJCah+5IraL6W1VGnCKmw1qeB0IxjLs3arhcU=;
        b=HbbGxqobFGq6jQ6lr3AJYabpK7r73QkMm2744ocBEgZnA+6LW1VXrJFvpPuRvh7/I6
         TkJKTnNGFbwPfPQkY7vkUNbj4DBRuQjSPrawZdDMGbvp3sfiPH5dD18PB77MjXzZA/qY
         XPo7ahdVsKJJYMaLNASbJYMiZtJ3FafVpzNeEnE/PnWlf476KRrykV3FhC0tMDv4WnNk
         m0y7kATTGB+afK+bUQQPp4AkzCAB81Xl36TrhqC9hE1NujciAOnmDwqF8d/3lvCK9nW1
         K5Dw1FSSyXL13cknl9NsxPbL3l/9WzZv36eVpZthyccF8dHS7UWpyPrQ/uxlaDZPpdzk
         1zsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786611325; x=1787216125;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iQkBGHUJCah+5IraL6W1VGnCKmw1qeB0IxjLs3arhcU=;
        b=gDoXqGM2VL5/6zYK7Y+40m9S47qGTydBkhZoI+XM7KePnbeoLRn0L5ysGBMaEO8cxl
         s9M0FOEatSZEv6cIEuzGNEDRKTugS+8dLofEdzcm2kYymAFYrszzoNWtv+cIGYPVPsLs
         LLGy10guq/l2b0StDRycDpDzsl7CyQyA7jXyULrZXAU4TGBxX6OC4bopnEEtdbHUpzYA
         ZXG1NxCuqgOQLst0EUAb2PfXT8vpbZunA/PC2fm/y5i6jnxltgAqQlLmQ6mg00U+cAkZ
         uVi+XxxuYC2Jmaaiqorot4Q89mjUgYv3c3ZTZbng5Q6TYxS7QuukeTAFJrbH/pvcQirp
         d0ZA==
X-Forwarded-Encrypted: i=1; AHgh+RpgB3JhnPescBZSl6f+QwoIaKAPZMUU6RrruRpR9epWs+YW2dGMfbKUP+hQxGjyDDf+IQAQ47kgD3oD2tdn9u4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo998KqdtZgLfoRn0wX67TL9IYckD31sQfUgm2kvHGc4SfzJYn
	1hEDL5eX8OuiYo6f5jOHC8R3tZCl+0OuIWcueraEScdP/fow74/ZArdXPsqxwc3r/gbJvzyWaqM
	LGnjlFpPwRg8hweVf9TSVK3VDIoILJ9g=
X-Gm-Gg: AR+sD12x+E63SQXvlFI/qrSMz6rVjzGXo7brmgjw4FZJhko6kG0G7rjyzkjYS8v9TgQ
	xPNlb4rbt7QIyv3Oz8c7cY+uCj28i5UvrSYk+7hVPnsoLQ0gBqYCCxwP8ttWJ5RRcgA1arUHVF5
	uC8WzjHCJSuZ/FsILpU7nUkTUbhvqB9A6/uh6V2TemedVGMTnkEf3XbWLjkzjOcuw4xyE0g17FW
	Ibl6LcesXbIOyD21pocsxCjboqJ0ztxXZz3oG1wP4Evl27E8tQFaCFGgRrlVNGZqsAqWVqOYs2e
	K7/8jPDz9NP7hMPVwGR79j7SGpnbk4T2T6YPro2xVehGHkM=
X-Received: by 2002:a05:6a21:150b:b0:3bf:8604:9a3c with SMTP id
 adf61e73a8af0-3cc553f513emr5787899637.28.1786611324791; Thu, 13 Aug 2026
 01:55:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720193431.3841992-1-gourry@gourry.net> <CAM9Jb+jpJ-Ui4qDHxsp2WiERiv8gmrQfKQ8Z0BmabefeQ6pg4A@mail.gmail.com>
 <an0cAMh_m8ZhGIm2@fedora>
In-Reply-To: <an0cAMh_m8ZhGIm2@fedora>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Thu, 13 Aug 2026 10:55:13 +0200
X-Gm-Features: AUfX_mx5aRT_GeBsew982Oll4m1v2zeTSERp4DtDb2YI-VK1slYjLWUFWPkF2ZE
Message-ID: <CAM9Jb+jmxPdL-CdWQHYMT5G=qmjB6z2WFg+4K8Fod5n=2N6YCQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/36] Private Memory NUMA Nodes
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, Zhigang.Luo@amd.com, arun.george@samsung.com, 
	balbirs@nvidia.com, brendan.jackman@linux.dev, yuzenghui@huawei.com, 
	apopple@nvidia.com, alucerop@amd.com, matthew.brost@intel.com, 
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
	djbw@kernel.org, "Gupta, Pankaj" <pankaj.gupta@amd.com>, vishal.l.verma@intel.com, 
	dave.jiang@intel.com, alison.schofield@intel.com, osandov@osandov.com, 
	jannh@google.com, pfalcato@suse.de, jackmanb@google.com, hannes@cmpxchg.org, 
	ziy@nvidia.com, pbonzini@redhat.com, osalvador@suse.de, 
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, 
	ying.huang@linux.alibaba.com, kasong@tencent.com, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, baohua@kernel.org, axelrasmussen@google.com, 
	yuanchu@google.com, weixugc@google.com, yury.norov@gmail.com, 
	linux@rasmusvillemoes.dk, longman@redhat.com, ridong.chen@linux.dev, 
	tj@kernel.org, mkoutny@suse.com, sj@kernel.org, jgg@ziepe.ca, 
	jhubbard@nvidia.com, peterx@redhat.com, baolin.wang@linux.alibaba.com, 
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	lance.yang@linux.dev, usama.arif@linux.dev, xu.xin16@zte.com.cn, 
	chengming.zhou@linux.dev, roman.gushchin@linux.dev, muchun.song@linux.dev, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	driver-core@lists.linux.dev, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-debuggers@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-kselftest@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

> > > Bonus Configuration: HBM device memory tiering
> > > ==============================================
> > > echo 1 > dax0.0/private       # make the node private
> > > echo 0 > dax0.0/adistance     # highest tier
> > > echo 1 > dax0.0/reclaim       # reclaim active
> > > echo 1 > dax0.0/demotion      # may demote from the node
> > > echo 1 > dax0.0/user_numa     # mbind()
> > > echo online_movable > dax0.0/state
> > > echo 1 > numa/demotion_enabled
> >
> > I am bit confused by the HBM device example being discovered as a DAX
> > device. Is it to
> > only to showcase the use-case? Or we see HBM device is actually
> > expected to be discovered as
> > DAX device with N_MEMORY_PRIVATE?
> >
>
> "actually expected to be" -> no.  there's no requirement HBM be
> discovered and boudn to DAX, DAX is simply a convenient intermediary
> to memory-hotplug.  This is at best a demonstration.
>
> A device driver could very well just call memory-hotplug directly,
> or its memory could be brought up as a private node via a boot
> paremeter (which I have sculpted for v7).  The former is preferred,
> but there's a bit of a chicken/egg scenario for bootstrapping.

I find this interesting as this appears to be evolving towards a vendor
agnostic framework for hotplugging memory directly to private nodes.

How you see this working? In particular, How would the kernel know which
memory ranges correspond to HBM or other device memory?

Please also CC me when you post v7: pankaj.gupta@amd.com

Thanks,
Pankaj
>
> Most of these UAPI extensions are going to be consolidated into a
> debugfs interface for testing purposes only in v7.  I've been working
> on aggressive Linux Test Project test expansion to ensure there is no
> UAPI regressions.
>
> ~Gregory
