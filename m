Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D3B4DC524
	for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 20:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781211546; cv=none; b=i+DBvlxo5Y+VQMNeJtNuizWf1AjjT1h5dgX2H0erxTlDyORwpl6wbabgW6/ep7Nr62UioJlyQnl/9nxBnD70KHbuc9hRP85oZsGTIdvObEvn95B0w3VnxKdkq8ZVkOj4urtF83ZxrQxnLXbgwN9Zy1mJKYI6Z0rrPPiEbFZ8i7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781211546; c=relaxed/simple;
	bh=XJ+ja/54XWFissrUkUu3n9x2odHK0qJ+G6SKeMvhhvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhqvZmnwuClbKBgT4t7VzMMc6A03DRU00hyxo7hbD1aObanwhxONxfDTFyvIBcOg03KS1eBw9TNM795GM754A+4g+DXGa2ZA0TRG9p2LpFTrOjunh8yVqdlKPDb8APE94R96WrC3MWx59N75awnrq+Ip0GOfTJuVGHjKeH5qFho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=multikernel.io; spf=pass smtp.mailfrom=multikernel.io; dkim=pass (2048-bit key) header.d=multikernel-io.20251104.gappssmtp.com header.i=@multikernel-io.20251104.gappssmtp.com header.b=OWhyqt0a; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=multikernel.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=multikernel.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=multikernel-io.20251104.gappssmtp.com header.i=@multikernel-io.20251104.gappssmtp.com header.b="OWhyqt0a"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-307d0405e07so482206eec.1
        for <linux-kselftest@vger.kernel.org>; Thu, 11 Jun 2026 13:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=multikernel-io.20251104.gappssmtp.com; s=20251104; t=1781211543; x=1781816343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MUGEJTphEZFGdBsrL1Ap3pgZRMiQ/Bb3HajFXRKP6PA=;
        b=OWhyqt0apsb5ldefUQUx0QDXAeUCvu828Usuw4DYmK7mnUs1hf0w4Bp/OGBSxip9as
         25BF4piEcq7qlQvwAgcuID8W0ZwuO01+rORm94NkPF6NvdVOKPX9uJD3EoxhMpNCyuY6
         BiHXM7mulpSEwGvatodRJtVmNnEJqpGuwKDsep2XmhYwAvC/xGZ8cfkGxs8NeQtoEcE6
         vio/Ppk6wMh9y1odvbZoweuX8Ic/wALtDaV2IbzkCo/8Nwt3DhITXbvf8pPaPeP/w3sW
         xxf3YMsNkQCDTLOFAJLfpA7QKeH6AbQfA9T0APFzzK+8lwCRIkfFRfauaBElKIBQQGPb
         k3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781211543; x=1781816343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUGEJTphEZFGdBsrL1Ap3pgZRMiQ/Bb3HajFXRKP6PA=;
        b=dxYW4kTb5fw2SDAW63jbqQNDC0loKt62QkSk9MiitF1yTwt/xncZwGxo+tzgTrrgY2
         /IXyUKbjHqsytK6uySy7g4tWOxGRRe1VNpn4Ythk5puVjDywdf++2vS/dOe1X/v5rSW7
         nQFAyqAC0C4iz440V0//9XOPtPtikLsLYzVlWaA/mvnwZsgOCgmXXqVurJSfzTCcMynJ
         oRZnKQihB6Dj1ruMLqt53h0FGVEsfZR7P8uG0KPeUrBu3+gefrm5ohKfoPJy1CzA/mHi
         HLzeUSmMexvxUWedAVMRQlFzcVHTeZyY/wTXIkZXPIS2YKR4PfC4bcHsV39DakBPDn/t
         z1Sg==
X-Forwarded-Encrypted: i=1; AFNElJ8kptrBDfFKHya66gQ5Sw1KKnlh0QyPjbhB7Ycj73XpGCtEHiYc55DS7xI+QgRo/VFzxhm3KmzgiwgR/N8CoVE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIaiMJiEGAD+9qddP6QjkqPA9VVEP7bxL7NIZy+JhE9sBqjoxg
	XurOwNB6kLj0im6uu0e3BgetYdBttcs1tt/UOGRprr6LtZTOR36RK094UiPb+VXgfB0=
X-Gm-Gg: Acq92OESYNhAzbUNnvPvjbyOD0bLHKENYYTCNJrz6pp0I6ckUBVJAmH89A/5dyxdRHE
	/jmXS7LKWOHU3Xqm1GkfGiXVfF0nHLdmIebzXooUQZTtt2nTXcHemjtsSvUhyI5pPR6mcyDpzfz
	7ustF8Fu5hwI3COn083Za6FAHffelEiWdhRISyuvIq+Mk9ErL34KMQoQ1PomoklCP2dsVDNubal
	LVdPkItN7wHlE8b6/vljrEi7lyOdPgXzJp/50LIeGa1VgFFx2aIzWcRJiciwmFgBkmSfEz4KX95
	/p8UE9tGlICQ+JaNug+6touZzAbnAhRA2TKD34mp/zz2fp0KHqQ7PPkCgmHr0hE0b1w3C+9MifP
	5ghUzQpPZtumo+cnMOdbtzpRemSfaZWNf72AhgOvl69qA3ZFlgAm5MDWjHD8hLCc6XlOQ1V36hL
	eyJaE/Gp7xbmumR7u4O1LIkXongRJpLzRoL+qAd7SmnWRULUwz+zv8dg==
X-Received: by 2002:a05:7300:2393:b0:304:b93a:511a with SMTP id 5a478bee46e88-30804b8d667mr3459122eec.28.1781211542621;
        Thu, 11 Jun 2026 13:59:02 -0700 (PDT)
Received: from localhost ([129.210.115.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm416981eec.10.2026.06.11.13.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:59:02 -0700 (PDT)
Date: Thu, 11 Jun 2026 13:59:00 -0700
From: Cong Wang <cwang@multikernel.io>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: bpf@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jakub Sitnicki <jakub@cloudflare.com>,
	Shuah Khan <shuah@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Sechang Lim <rhkrqnwk98@gmail.com>,
	Cong Wang <cong.wang@bytedance.com>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf v2 0/7] bpf, skmsg: some fixes for skmsg
Message-ID: <aishlHQXerhy6Mio@pop-os.localdomain>
References: <20260611123538.156005-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611123538.156005-1-jiayuan.chen@linux.dev>

On Thu, Jun 11, 2026 at 08:34:08PM +0800, Jiayuan Chen wrote:

Please wait for 24 hours before re-posting, this time you only waited
for about 11 hours:

	Date: Thu, 11 Jun 2026 09:35:43 +0800

For your reference, this is the rule in
Documentation/process/maintainer-netdev.rst:

```
tl;dr
-----

 - designate your patch to a tree - ``[PATCH net]`` or ``[PATCH net-next]``
 - for fixes the ``Fixes:`` tag is required, regardless of the tree
 - don't post large series (> 15 patches), break them up
 - don't repost your patches within one 24h period
 - reverse xmas tree
```

Regards,
Cong
