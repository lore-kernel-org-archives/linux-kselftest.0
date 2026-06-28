Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA84331EAC
	for <linux-kselftest@vger.kernel.org>; Sun, 28 Jun 2026 06:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782628675; cv=none; b=iKz5zR1QWFYKznot2Vw3vEH71iiTyPO0AkJzOE1HZ9IVlF4rI+hkdaXyp3rmshAYG1+OrGTGHqn9jG1Vz4TG9mAQcEsGC6J5HHN2pRbQ22xjyT7hx+1zbKkZLpQOa17nKBjNdo5b3yZqrlzRa3Lo1hskJzHk7nnh8IHID6t1rXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782628675; c=relaxed/simple;
	bh=qjynzZ6KOMkia6Kld8oKK1e11+mTHpxJS5f6P9dewpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZG+M5urpaFCuMV46eGx7g0I2/DKb75e7V6AOPkhZoA5hpzOIVLMFE6sd8ZrfRf8JfKxa3B+31RiIGqvGlGtT8IcEL1fezSTTwEC5EqURrDkja27w8rCnCDf8hkzx6+RcJgxiLhi0Vrs18uQ8cD1Tbp6JB/QXvcwq4ThwyiPhhXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bS6i/OQ/; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bS6i/OQ/"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c9dbd00f1dso2344975ad.3
        for <linux-kselftest@vger.kernel.org>; Sat, 27 Jun 2026 23:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782628673; x=1783233473; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XxbfFY4tow/cxVk3DBC5MbGr8rGt7hcXtDQR3cXybbg=;
        b=bS6i/OQ/FvNy4d3CNwFb2hAxCp1BFqnOLXSpKvJIOsAxLGWBbXZW4TsUqbhQy8lYbB
         U9QS6YpaU6UOLCzKPPyf5SHxWx8c+9QOvWMIu5P8zBcIvWLVgG3tcS0NXT9ZCdFOWrsO
         9GnLejjaoHVnya3nMMSwLiXI7BPd7hSDbCkcXYSLQU0QSozq5FWOEjt7kL8qv6xNsVNP
         4rSLXlbu9WWYrUnR6I5jWagE+bPGwNHOytg8fL9mAbVgJt9ssWcqzYOeZ84M8kXcQ6wk
         ot7O8PNFVoLp50crVLef6Jx/vUBzvVXd4F9KeyOfEZl+j9NsxFQyJCiNueX21XEGbOYn
         BIqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782628673; x=1783233473;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XxbfFY4tow/cxVk3DBC5MbGr8rGt7hcXtDQR3cXybbg=;
        b=VlD+x+XFMeuvpm7ss6YMZOCjBUKrp8I4ieCa1DSfxeV8GuID11xAbYwxlofwQjVHFv
         /Xtr9VdJ3NUJItuxc/bfeq0D3We8zjv7ZzDMGcWbFX21H865jJGz7Xv18zUoJ8lKDq1K
         LtmJTgXqSJI9WiNAGLNuwWca1ouCDArc03jimMiwioW/3Z6q/b6l4IiA0QMhD/6V/7AH
         NJ6YQ3TieFP7f3Ew4zjsFGNVyYOoZ5Z7zjf0ljLtnDoJ3OjTxBuMw5/Ii6DUnH9gg2dT
         j6y9PKxB6lq7JZ1yx6RGiIvG79tnZaDOxr92Tpp9Bc26C2st6QGw983L+lAR8BgsqDi7
         q5pA==
X-Forwarded-Encrypted: i=1; AHgh+RrwGFnmBj6cm3lFSVNHkM6kS5jiRQIY0M40DZe+okay9V40SwN1NrtjaCK7qXozJFSBBLa5WZtycOQ2BMkilqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeMGeTvoTc6pzXj2BWL1XU3rjQH6DbHVX/+on/PR4jgMou4ULK
	3XfB+gIYH9ZkpF3OxDmNArrpVl/WXg7xuBNw2Wc2OZjAzFjtYpYw7ZON
X-Gm-Gg: AfdE7cmBycUF8CmX4/lG3Bhr4ffRy2TYGFVXmd+nVqmgQglL8eXzQ7MlJFFnzDLrYIw
	TGz29hn+g9ehnl98yD5X6tijK++HKpt6+kwQZHqq+MfBlE43Bze6++TAVFaZg0TVZuUXR5x60UY
	tdLzOXUjk47/y1WQNY/TFLrFn7Ut7hNAGioODsrQrBU8jxcD5K2w/5tPR3TWbN9PEwVbj41ZDGA
	XilM9NJzqxpBCJ3yfZj0IKfMOCwH4a0BmALZPZ9ARIK63Q5HIwIvfnHcLDwY264aeIPcDIl8n2v
	79rq7tmRUx/Zdpc6beHtjTGOLOm+JNEFtboNPbbP+YR8XY7AhE5Gvdhp1yQDLTG4sf6+otczz4v
	/Khhgzfx+FUwv+ugr2jPqL+8QvidtDErJJirkvnEiTtnCTt1zswGW4EkWFTYcBaGdcNlnpCh4RL
	I3JSjKnN3A2g3i6Cdv4t7OwU9PD0ZjbXtxPos8dMU=
X-Received: by 2002:a17:902:e5c9:b0:2c9:97a7:327b with SMTP id d9443c01a7336-2c997a7337dmr51790045ad.44.1782628673499;
        Sat, 27 Jun 2026 23:37:53 -0700 (PDT)
Received: from computer ([2a09:bac5:3b4a:8aa::dd:15])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f64cfdcbsm68156965ad.62.2026.06.27.23.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 23:37:53 -0700 (PDT)
Date: Sun, 28 Jun 2026 12:07:39 +0530
From: Varun R Mallya <varunrmallya@gmail.com>
To: bot+bpf-ci@kernel.org
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	eddyz87@gmail.com, memxor@gmail.com, bjorn@kernel.org,
	alex@ghiti.fr, martin.lau@linux.dev, song@kernel.org,
	yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
	pulehui@huawei.com, puranjay@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
	martin.lau@kernel.org, clm@meta.com, ihor.solodrai@linux.dev
Subject: Re: [PATCH bpf-next 2/3] riscv, bpf: Add support for BPF exceptions
Message-ID: <akDBMx45h20In6EP@computer>
References: <20260621144259.288135-3-varunrmallya@gmail.com>
 <950216803ac2380e0537b27c94ff87dd2ae0dc689fe320c51d96b9095cefc614@mail.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <950216803ac2380e0537b27c94ff87dd2ae0dc689fe320c51d96b9095cefc614@mail.kernel.org>

On Sun, Jun 21, 2026 at 03:32:32PM +0000, bot+bpf-ci@kernel.org wrote:
> 
> This isn't a bug, but could the kcfi preamble, fentry-nops loop, and
> TCC-init instruction be emitted once before the exception_boundary /
> exception_cb branch instead of being duplicated? The same three-part
> sequence appears again below in the non-exception path, and the two copies
> must stay byte-for-byte identical since the tail-call epilogue skip offset
> depends on this fixed layout.

Making this part common in the next version. Sensible change I missed.
- Varun
