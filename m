Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619EA379EF0
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 12:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778501102; cv=none; b=OnrUNXY47Gn9iaou4O2RaA7n0aq24OviOq6LENd+lq9fkPXCXV+6yt6T/I4qnyu2Q/T9yJ9KhcyvEAEWSoNLdo+zPL6enVVP6fHecUWx5K0ICKyV6wp5r1NMsTaJZI/S+zsNI+wKbXUtCPUdZiR7TaI6reGx6rRF0eFi0n95Cc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778501102; c=relaxed/simple;
	bh=+i9nY4yS0mmOkbjwKmwBLgjJ9pvH9NuVOTXbzoovY1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c98L9A/aGzCujEsfbeP7ki9u+hdBFY6VQR/B+QVYBNHItDe8ELf/1ZfmhTEKqcDPa9vEV5eg91u/KooJ58gVKGL0Qe1SF5pHVtLIjoMUP/q24eCj+iJOK72pSR+DpRUVdLd7PPkwXfXNtEoAayNAMud4bvvNn2n4hQ7ANuxP8Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=idsgeYUT; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="idsgeYUT"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48d102471a4so41829825e9.2
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 05:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778501100; x=1779105900; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cqTnF9n3Qex9jOfxNTk7/2y9GOIfeHPZuAdK9XxmLL4=;
        b=idsgeYUTnnQaeJsP7mq0J3y4XnHB8z8WZRQpeZGpl8ikv/KA9Q4NM0684iuFMn8uAa
         yjdkSlf2sXCuFnMQUCKU/tdPBm42S/pzQGWVgfjntq3P1BFvvFT0Tt4EDJGioktxsIwW
         UYhOk+0xwcSqDnUr/M2Yi1pu+SYp9EnxjoNDkOEpgQG/Ye/s4r4JBm8YvnvduiLr3o53
         vE+ShIVz5GBv19VbFR448lV4dDnxix1XfO2596CFkyBnSyBd+q1vrQ1vkyUjAg+gsVYs
         5YaVLt0WTyH2mqJ0S/EyIkQT5oHWK7pcraODrp5Xvcpvw5kwZtxGSRaENJ5cPR/VU7c9
         JLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778501100; x=1779105900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cqTnF9n3Qex9jOfxNTk7/2y9GOIfeHPZuAdK9XxmLL4=;
        b=Ye4oMlvE+sgUo5O4JO1uQYvq5KhYgoNZ1jwZT0fK4uwI/XG3dx5Y2aG1upc/EYb9Fq
         FaiYBvJPmTCDr2P+iHrvnLnkMlYr0aA1e93n1agBrFjFObLzWG9nTfPOMWDmThVJ3bXL
         Al/7/9BHkKIE5m0CqHMpjL/EUjbujzk/KzgpL1Eup7nagVZ40KBQVAWfqiXWQeHC9FTf
         2RNaMa7dKorQvqIj1kXoFVUl35jBPJbYJGe6cDfQ+blmCG3ypP9pa/KGkXdnEK+9UBjd
         nzPfimkG3bFrTWOF8f8eeFW0Yru1cBUzWWRGk6P0eBLyJw4DgDQZbLaARVr9NMaF8ngv
         2PZg==
X-Forwarded-Encrypted: i=1; AFNElJ9Libk0ZGycnPqKfogPlQNajQ7t07X26sz0kulU4HZLBVmye5/HWZDMCoD4dRS6tNpBGTphF2WPay4SpoSYGLU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv2Gdd7zEWVtRZQoPzsy+3Vaj5ZULXnmZcMHi2k90HIVmomR3D
	rX55MkdSOCTl4BebvbJE4xpRSmYCqRoOf0yUXPvFYjdRVsxSufErtN6k
X-Gm-Gg: Acq92OE3m6x9KCOoVhVGkVl6gYFLgqmDi6zPVvYB0mNUdCmaSIgmiJTdbmBmGi8w6XQ
	KdTwdoLfaMXQvR2fsFoRXWAtxKER7vTQXVI5OG5wiG+BoBHyySAfdHheiPUqrKn2ICjUW/WzQtt
	SyPFlq6Vx/QBMuakJZwos4GRFGEMZxi2oglHnrq4/GGg1XlrEG3ub2Ey0EWAB5gPXGB75WR7zyn
	sSqOzlhlljISJZnCvog07IBCEWqvyq1ylg9D9IZhpgBgjPaP4wxU9uqou5OMi5+yhk1SHdASKqI
	Owo2my/qjbRE9WO/4XtVQiqLeoxKzOVreyjBmMc5aODgqjJYnPP2Wx0QxaZxbLqdU09gv8cOt+i
	/XYcyJSattwHcmERsjvgFD0uDtPm6o2j0+hVVt8xOg+w4LOnpdo13Kp6rRsrSWjSy9wToYJZDYW
	VRGyt4BhFnNJQtszIEL+w9yvrsGDxNwTpXlCYXMcqumVCUMNOhr7vzmUeUFIEkY4YnmS4I5uBTn
	w==
X-Received: by 2002:a05:600c:1908:b0:489:1cd2:610a with SMTP id 5b1f17b1804b1-48e6767dfa2mr228143905e9.9.1778501099495;
        Mon, 11 May 2026 05:04:59 -0700 (PDT)
Received: from fedora ([185.193.234.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491ca2fd6sm26106273f8f.30.2026.05.11.05.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 05:04:59 -0700 (PDT)
Date: Mon, 11 May 2026 13:04:56 +0100
From: Vishal Moola <vishal.moola@gmail.com>
To: Hongfu Li <lihongfu@kylinos.cn>
Cc: tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com, shuah@kernel.org,
	jthoughton@google.com, seanjc@google.com, zhangguopeng@kylinos.cn,
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/cgroup: Add NULL check after malloc in
 cgroup_util.c
Message-ID: <agHF6GQg9MpwSfPa@fedora>
References: <20260511060853.1873161-1-lihongfu@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511060853.1873161-1-lihongfu@kylinos.cn>

On Mon, May 11, 2026 at 02:08:53PM +0800, Hongfu Li wrote:
> Add NULL checks after malloc() in three helper functions to prevent
> NULL pointer dereference on memory allocation failure.
> - cg_name()
> - cg_name_indexed()
> - cg_control()
> 
> These functions allocate memory with malloc() but previously called
> snprintf() unconditionally, which would trigger undefined behavior
> if allocation fails.
> 
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> ---

Reviewed-by: Vishal Moola <vishal.moola@gmail.com>
