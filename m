Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61D03A0E99
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 08:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785399774; cv=none; b=HJwUVzMprSUPrpyB0pxvnmsDCgZ8xl4Uh9qlslVOi6qR+zbGhhWZeoh3B/lES3pA3YASNwLXNj55DmcCTJMbwYJN62XGJDIEkVEBFP2iFignsfoI7OcOHd7Yp5xq6nnU1F80ZMAp9a+CodCLu3EC4v2FvWDaBbnq0SMycAxKpP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785399774; c=relaxed/simple;
	bh=YVHpfijMFvXwFYtYcEbYOzUGDrBKkxr0rE81ZuLCUDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hynrPptAC0846XDfWYUPrAONiewoe7Ui6nS5uv9iiEhLwlti8R9LmrByYWoLdh/7m3fmRC0LFXzAlmpWHKW0JUGt+BrgJkKRaKctK+9HW8N9d4b4L2JZIEaa83eX8aucXLx51CmVf+Lz8tQr4XUc53Ok5f5QDqllzkhVyUI1R4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=POeCWXfH; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="POeCWXfH"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49553515a8bso21977775e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 01:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785399770; x=1786004570; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nv5MqGnJrlRE2FZIwkXhHOAq/BZNAwk3GFn3XVUQ1R0=;
        b=POeCWXfHaaaZr9y9ym1fLeUu3TtJgtUvEOWyvlbGcprHHOBLHJ93vI2A62bCHo4AMl
         lShZeT2r5Jd7QK/vlGfQQcMmSlDTEbO949rZUVQ3vTIl93iswjT38k/HTTL5SrEp/45B
         laWbmT4lL0Ev+hSWgVrw/e+LpQhdbOipdF+JeN1BueJTJfxLKqKojmptLycYQ8cbsI/d
         2RnCAxQqt6A+dag5nYewdq7ohD24G+P9173R4pODSFxnZfdM3IcQA0SOTtFUrJ9ne0K8
         qx60b9Qu+tL/EtEF/OHrRXve4ZvzmbkRJ2c9BtHRBWMFPKaJKCkbJoe7vrvRd76VwIv4
         USGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785399770; x=1786004570;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nv5MqGnJrlRE2FZIwkXhHOAq/BZNAwk3GFn3XVUQ1R0=;
        b=LYEG7cWU1GS8ioWnDKQyxJv1JZ6pVbjJyUYkoj280/VQF61gYEZ4OGAlLmF0ANW5zW
         ee+GZPhyQo6utjX8dwh5AZOcf1ZjzjBUuUMIkSHGYs3JuHOYradGgmuIPLkeOPK8zDW0
         /InDUDSO9qvP7jZqVnwkeWRo/XfoRq5uJ7k3G2eB0VS1l/BR5a6WXLBNI1GU1pNrDF76
         RdDEZVJ6qfdU1/0DvygHDZMiyxaqOyI0xRmMJ6pKJtJADbK/XjtuUM9+3lN/wLOBfyHa
         GRa5lL74QO66CiXjKLMpkbEHfMBWqMsKc4/qQC8Irg18Ypna+HCjsFr/sX6SRFsiQXEa
         ghtw==
X-Forwarded-Encrypted: i=1; AHgh+Ro4yTziOX8UEbQxTQ/M7xJx2WYnLByS2QskmmOzvL1ODg4skEsYMLOuZU29qx/hw1qRPc88NaG7WYCPK/CsKA4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYhh1loNaiAd0t3AhO07+ZmBckrYPGxBompe2Wif7rq/KC1w3O
	1Af1iUIwZw+iDTP1i/1EkGHRmtEZSRdPHEqMVF8g+OC8bdgthOztIblL4xNM+SmpovAzGWhHVL7
	iSSFVDF+oqw==
X-Gm-Gg: AR+sD11vd+X+kxM42cEvem4dt83xlwjwlDnUOpq9k7w31Hmcga4HvOvjphY4ihiTSQn
	M9wd053hwXmvKawyVLJWSXdLi26TFaBSQ/pBYLfNxWWD4EkX/JCikeo5Ba2jtXxvjeYb5U6MyXk
	qaTfYxqI4zf9nRvy1vcZqTi2Ixn4vmTvoOkqc2ogCVhJQjT/oySSRQciDq+ex8vLnxE0E2KoJcd
	MnqSxpMf0qjV68MQZKTZY9KuYHh4/RdAg4ajx7Z+ASSXMy1I9gTSZ2BkwrWFBO9AIYeJyO7WGY1
	sZ1DXMXiWiEvTgIUjG3SxC3GR7x8Nx1WMFq/B2IgrXQqExWlTxdDGToPCwB4LeAz1CZg0DUIwlo
	pdbJ7udC7FKFwcFIiq49/NZXfn5WlbKgL/UJM191piux52TiYV6bmuTC5xn9YyqN39iVSrjpdvq
	C+2vZydHIt6EIeyC3t/UQ4SaX6P3fQduPDbV+bU6+o2qVCmYLUzKEC+IqjoqCjm36OBdFetZUag
	jRTtAaa3iaRi4c=
X-Received: by 2002:a7b:c3d3:0:b0:495:62bc:a022 with SMTP id 5b1f17b1804b1-49800e749abmr13357955e9.13.1785399770061;
        Thu, 30 Jul 2026 01:22:50 -0700 (PDT)
Received: from u94a (61-227-70-26.dynamic-ip.hinet.net. [61.227.70.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d480c5sm29881120eec.25.2026.07.30.01.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 01:22:49 -0700 (PDT)
Date: Thu, 30 Jul 2026 16:22:41 +0800
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: chenyy23@mails.tsinghua.edu.cn
Cc: Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Daniel Wade <danjwade95@gmail.com>, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf v4 1/4] bpf: simplify sanitize_err() signature
Message-ID: <amsJt7qoxbqhNKM3@u94a>
References: <20260729-c3-035-public-bpf-v4-v4-0-8ee297e2346b@mails.tsinghua.edu.cn>
 <20260729-c3-035-public-bpf-v4-v4-1-8ee297e2346b@mails.tsinghua.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729-c3-035-public-bpf-v4-v4-1-8ee297e2346b@mails.tsinghua.edu.cn>

On Wed, Jul 29, 2026 at 03:18:27PM +0000, Yiyang Chen via B4 Relay wrote:
> From: Eduard Zingerman <eddyz87@gmail.com>
> 
> The sanitize_err() function is called when:
> - ptr += scalar
> - scalar += ptr
> - scalar += scalar
> ALU operations are processed.
> 
> This commit drops offset and pointer registers parameters from its
> signature to simplify the follow-up changes for 'scalar += ptr' case.
> regs[src].type is safe to access, as it is not mutated by the callers.
> 
> Signed-off-by: Eduard Zingerman <eddyz87@gmail.com>
> Signed-off-by: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>

Acked-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
