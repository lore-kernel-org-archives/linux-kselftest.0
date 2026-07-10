Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7083E7166
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 22:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783721738; cv=none; b=GVgP5BI5ryIJVyOWAU8wsXjjO9EgHL6o4sBccIK/Mp02jPGZ2tzWbqkecIw6py1mKRRgulS6vr4dK9ZK+TCHwCwJ8vutH9FykqKRHGYkLUhx5pnYar/g7GiTzZmCVH323a7scwhQuPeA/qHCUS0D/Ufoq4hudI1i+kHdfg0g6CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783721738; c=relaxed/simple;
	bh=uaM4SEXuPZIUBVgYlCgE4J6D6Y5Vs2jgE7C6PgJwmlI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKYW0xcsOdEYbSg/OrTOFIJ5VY5Xqs1AJmU9+rMqvHuLe/SDyEWfn8P+7QgJeCKyY6zj6I1qB4NXmjLtVuL/NDyqOEy2YOjczC4FCgfGuyNO4kfwJDL5NRjCKmc8+1f1mCLFXtlKa0IQWx3vO4S7FTldxPGJ5fE7kgpht6e9DJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CfIeOSyt; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CfIeOSyt"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493b27c7451so30884165e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 15:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783721735; x=1784326535; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nw4xOGZJI03sw5DnV/fNZMO0t1pk33oBCjfm8PcbuU0=;
        b=CfIeOSytoLA7/xaHekomUt4KHzt4qrauOqFizfvD/l6aiBzWpImjeeovZbEm130ZXd
         9jWBHllw4jVbURE+/3GmQ5UVd3lBIzQKTn6DTOqz7X1R+uedlWGNRjmUvT8zpju/8c0H
         2E8R3T7zmg2ivtjvHg82pPkKujZbB80dVbtbsD0hYShs2pF3JeQxX0jUzhTdU0WlYtW3
         sURNnesm6rmFIP8DKAf0oKvetZTRof9X8i+fWbcGnA4DVF4PLC5N66rxd0nTtrnm1zp9
         oymWNbe/ELmKjUFbGgilDt4N26QUJvS61JB35hv0GQcObSO1ePO1xEWmrOFKIeGUONLx
         xW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783721735; x=1784326535;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nw4xOGZJI03sw5DnV/fNZMO0t1pk33oBCjfm8PcbuU0=;
        b=K8EyVRBwaUJ3Hxx3EkFSVchQ5b+jjTu2ZIQ88YJqdiK2WzM1VvlKvA6S2ySzUoV3UV
         mzXbLMu4evg01H+Q1exxbPfPKYd9nPlgFjWI0/nQkGZh7dAsvtcghtjHJ57wz8s5ODHD
         ohGz9DGrzunprj8XMYqQ3yRl7cKTLoI+KD2ybLxdTTy9aCOWmNa11G9c9JFUD+7QxRDh
         6OFAX1yfrmyiVCmHEEZabl6bTHXT/377ojRvBXUxy3f5KmfUd2dXPW1oVZqFxoT3GLJY
         2agHCJ1fE07u7Od2if6qhHIAlvN+pi5jseIcPFmnpClC5IzcW+JGpSMJ8JDDZBCpWkaj
         +yBA==
X-Forwarded-Encrypted: i=1; AHgh+Rruvz5llaWdDbxxHENTCO9bSq3aZ05m5XYmsgdtpAtRFsonYjiDKFk+F5MQwDRinIPOz3j4IDDWQuEWekztvJk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYAfPix0ah8HXIN/CZKbxGLe+sWAYFBuPRD8pfFIiOGJHGyfoM
	5zJT9shJGGJXQ5X8GE5klJqFy94X1jxqMrmbzhTwEOj7dl/AGdvi/JaF
X-Gm-Gg: AfdE7cmKgNiKixuNFxKq02RY1tcLe07d2POYWVDZ/fX4PEzTMDMfQ0WbLKDL/l2XN8L
	7M6Pk+MdssbYIqbzLIbP1Hlbbop+ZOiDbpRmkibsImWqfDYCZj4M82bDHo9vcZR/5QWdrQAYIDH
	6VFQTP9WmAfrGqB0fQ3ixB3JCBYYy4V2+bQVCKhLhlxHLNnZkbSMXpaEs3WZoPRtLfgYrdFUc4k
	/bK554NRNc5XJhAV2fJGsCEep8hnRq3tog6kEpYDeMBDvekdtsC/xyO6eVDYv872MTQChAIW2FV
	SbaLx6tSz7Eh4a2eNOih6h/d1EyYnuFTB8/1r9q9nGJnoKDV/W49hHfbn2s3Eb6OE4THj51DlvK
	MkhtE/heJ+8GCV5CNezgFsOYGpiM93e3xpjtjX2WRdHhFxB/aGTM5jqOWJK0OrX5lcFs7xbRSyX
	hs
X-Received: by 2002:a05:6000:200e:b0:474:c3a5:4132 with SMTP id ffacd0b85a97d-47ef695b898mr6515298f8f.9.1783721735256;
        Fri, 10 Jul 2026 15:15:35 -0700 (PDT)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039b126sm62059480f8f.24.2026.07.10.15.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 15:15:34 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Sat, 11 Jul 2026 00:15:33 +0200
To: Leon Hwang <leon.hwang@linux.dev>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kernel-patches-bot@fb.com
Subject: Re: [PATCH bpf-next 1/2] bpf: Mark tracing_multi trampolines as
 ftrace managed
Message-ID: <alFvBaC7moSlJMh6@krava>
References: <20260710144734.78203-1-leon.hwang@linux.dev>
 <20260710144734.78203-2-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710144734.78203-2-leon.hwang@linux.dev>

On Fri, Jul 10, 2026 at 10:47:33PM +0800, Leon Hwang wrote:
> Since tracing_multi link does not set ftrace_managed, it would fail to
> release the tracing_multi link when attaching tracing_multi link and
> then attaching fentry link.
> 
> [    3.714215] WARNING: kernel/bpf/trampoline.c:1727 at bpf_trampoline_multi_detach+0x20b/0x240, CPU#1: test_progs/97
> ...
> [    3.733170]  bpf_tracing_multi_link_release+0x14/0x30
> [    3.733890]  bpf_link_free+0x58/0x130
> [    3.734414]  bpf_link_release+0x23/0x30
> 
> Fix it by setting 'ftrace_managed = true' in register_fentry_multi().
> 
> Fixes: aef4dfa790b2 ("bpf: Add bpf_trampoline_multi_attach/detach functions")
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  kernel/bpf/trampoline.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
> index 1a721fc4bef5..6eadf64f7ec9 100644
> --- a/kernel/bpf/trampoline.c
> +++ b/kernel/bpf/trampoline.c
> @@ -1536,6 +1536,7 @@ static int register_fentry_multi(struct bpf_trampoline *tr, struct bpf_tramp_ima
>  	if (bpf_trampoline_use_jmp(tr->flags))
>  		addr = ftrace_jmp_set(addr);
>  
> +	tr->func.ftrace_managed = true;

I wonder we could set tr->func.ftrace_managed early in bpf_trampoline_get,
but we could do that as follow up

Acked-by: Jiri Olsa <jolsa@kernel.org>

thanks,
jirka


>  	ftrace_hash_add(data->reg, data->entry, ip, addr);
>  	tr->cur_image = im;
>  	return 0;
> -- 
> 2.55.0
> 
