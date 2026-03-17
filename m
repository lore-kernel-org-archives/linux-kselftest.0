Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A2237C0FA
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 10:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773744849; cv=none; b=gRRHu3eSJuQUmumB6Q372CdgT3e5dqnzkDSQEvo5QnN7uZOQIfguoIn/R7rfALcbgnpevrB+vdDMzVVhlejC05PPceW+NoZ7Hnf22Kqt7eHwdCbsp1/O+7swAudTn/pQY9936YwrDarwyoAFVJ5vVUWJxgbDXcLVKH7lH+blp3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773744849; c=relaxed/simple;
	bh=P9BFaqiVAHISRH1/Ftr1F7bJPDlJE0OkKEIBF/sU00Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QaLyJf47jqgmWLKaAlE6kxiWmOiLngClVU6ubG0nYSa+V9jTRI4EAbPOvpsENoeEAvqZkwl4UZAJ5inRjzc1erd9NmwlFuwPfA6l5TG4p5Rb1joAk3VVLPzGjtqHD7rm6ME2QOZEaBFFoTSjQ2fv/ypSOrOhNVKS2X0ixpsrM98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJalPmVu; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJalPmVu"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4856cd3f1ffso14511105e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 03:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773744846; x=1774349646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWnPu/gx7qeFux1v3KRj7Gsdw359R9/cx6A/cAlvbPE=;
        b=gJalPmVutSjdHwj+Btg6YFlJEHlIADkXdOmfpLHmymz+Z6tHy89P68IdUlqI6fEj6h
         CW8U0EIOxDRG/pjK/zVZ4/0WfpLy4oNeIscaZ2YisLAdKdlUaUbWIugp8OCaIvZR8UfC
         lrW+bR4BXHYsBSe2v3TEY7E52Cd3DygRFbqdzorqCwVbCD4U4UJHc9/+9hG7G6t43xFx
         PPypNNdnXbmr3YdJraXXfg1HFQasIyi4/WmJx3r2AUnjrK/XkC9D77R+8zK1igTA1fZb
         I4KlSCso3tb3unUdf0tJvFeW+8pfKCmYnXJfZHhS53ZB0m9Z/wmXYlEcAyiWluWLUZGf
         PFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773744846; x=1774349646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZWnPu/gx7qeFux1v3KRj7Gsdw359R9/cx6A/cAlvbPE=;
        b=d33mY8pU0ZLWYpfpsw+jTGUWv38s+9WpxeTWhNJE9oGPBrIENG0AGyO0zj1Vry4SiI
         wwKPrk/MZY6LwKd4GOy4V1sEbnwaWv0wFwrX5aYVLf2eRFUkfzXMuyHlZPo25uQX69un
         kQuH+gp68r/L7p05iWrWLNkLV6Sk7tUAlaQJc/JZVZzLbbfUKzv7CQ6VD7MxiB2bE6rc
         J5bFxoNKr+L4dW++AJjV51gKEGDKMV4bWwmTOorGPrSfjZA8PaKxKeuwtibTHpW2JpKn
         JX91KKom9RQkaZODOwvdkhsWsDTwma7Pp+VW+xf2jeOxjB4QdsgitL+Kixt1hk+LnRfX
         GBCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgxUAgzkYW/53RoC4pxrSRxsE7Wd0rPyhOrWnhHTRG0xVIOa7vJEna1/F30sDEA1jJjTjQmnjzkdR5X5NHNnk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA54j7JnjXy9lle3CZLOwJtQBvIrwiQqIwwCYXztiYEbPhUD8R
	DAWv4qjf5ANaWxR4Us2c/yITOjs8JwoU+Hv/eX0WvgQbND2XZxKY7lF2
X-Gm-Gg: ATEYQzyy2RCZLIqSDqjrkXYXz8OSsEQL8gv790srnaj1hovuAgckxnMgh0hPRU2HA7m
	O8N1P7FD5116NcO/pIbQEaEdusVBaI91yF0hYtDLPdwBzcBZ5FSjGL4tCpGuUy9bdoA46w77yig
	gZsSYI6ny7m9Fmdgxk/ObVThxVMZ5weA8piIRx3fps0Zf8FdE1FtAXLLxNg3iDA2pZ/r43hx7dL
	rY6n9kO1apfhucQWlWi32mcRrheYopvZ4LugNIUq6FuF34Bu3QdG4UcYyInZaCzbrKjm3SKOdXx
	mutjwSPheaYh19OspRX5/mZN4j/X8fgv67NoCRNfKEXxTVA4Lnhe20iy6Oh7QvQj/TnFIzckAEu
	/PF3XgoNijlsyaAyUrWOdDy/3LGnV6NC3HT8HBxxU4WZeZBozTo40XJBmwxL/33o+uTJgbmSSom
	88MTUo2SSrQ1AoNS9CkLMHpOageKu9tUKkLoZJGNZvWU0tRkOS2NZUWoZjG41U87jexLozwH1w/
	QaCRF092YLwd+q01rA0ZXjlF4Ka4pw0F1mKguG32mkkUuTQCHxww1INrB2ZRmhDm+0BaYDfTIgz
	A+Vtup5vXQ==
X-Received: by 2002:a05:600c:1d0f:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-485566ca95cmr267107525e9.5.1773744845991;
        Tue, 17 Mar 2026 03:54:05 -0700 (PDT)
Received: from mail.gmail.com (2a01cb0889497e001bd1b8260f3f46ac.ipv6.abo.wanadoo.fr. [2a01:cb08:8949:7e00:1bd1:b826:f3f:46ac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856e850634sm105395885e9.0.2026.03.17.03.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 03:54:05 -0700 (PDT)
Date: Tue, 17 Mar 2026 11:54:03 +0100
From: Paul Chaignon <paul.chaignon@gmail.com>
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net,
	andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com,
	song@kernel.org, yonghong.song@linux.dev, john.fastabend@gmail.com,
	kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com,
	jolsa@kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	shuah@kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2] selftests/bpf: trampoline_count: use dedicated target
 function
Message-ID: <abkyy4ss0q4D7Y2l@mail.gmail.com>
References: <20260315054227.118344-1-sun.jian.kdev@gmail.com>
 <20260317010209.8779-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317010209.8779-1-sun.jian.kdev@gmail.com>

On Tue, Mar 17, 2026 at 09:02:09AM +0800, Sun Jian wrote:
> trampoline_count fills all trampoline attachment slots for a single
> target function and verifies that one extra attach fails with -E2BIG.
> 
> It currently targets bpf_modify_return_test, which is also used by
> modify_return and get_func_ip_test. When those tests run in parallel,
> they can contend for the same per-function trampoline quota and
> cause unexpected attach failures. This issue is currently masked by
> harness serialization.
> 
> Add a dedicated bpf_trampoline_count_test target and switch
> trampoline_count to use it. This keeps the test semantics unchanged
> while isolating it from other modify_return-based selftests, so it no
> longer needs to run in serial mode. Remove the TODO comment as
> well.
> 
> Tested:
>   ./test_progs -t trampoline_count -vv
>   ./test_progs -t modify_return -vv
>   ./test_progs -t get_func_ip_test -vv
>   ./test_progs -j$(nproc) -t trampoline_count -vv
>   ./test_progs -j$(nproc) -t
>     trampoline_count,modify_return,get_func_ip_test -vv
> 
> Tested-by: Paul Chaignon <paul.chaignon@gmail.com>
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---
> 
> v2:
> - add Paul's Tested-by

FYI, in general, unless there are merge conflicts, you don't need to
resend just for the tags. Maintainers can apply those when they merge.

[...]

