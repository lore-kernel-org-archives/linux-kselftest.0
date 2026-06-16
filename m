Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7238B30648C
	for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 13:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781616835; cv=none; b=MGaAsA6x1FE1V11wCqLWJm7ZuB1KncucbMPmfCm4dtlsKvbe/X3cDPhB+iesTgvyz46ucel1r46tMZJH++2LTahgxu1Y38PvuJ3U/Evm2Zv0lsDtBEfI/SuVEPCFGgJP3BT8+8SaP4hFKpLi3RqmasCdBZwlOaY/ZAkuKIJtinM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781616835; c=relaxed/simple;
	bh=Sj4HWP9QisEzm9JzhjUCOB4XKgrZNOLEhL7geAA/29c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cPtm8Uci1ymZz8fHBiRoYJDcwML/fzM8HdzkLWrxBAcMZFQW6qphaPZtmWBTty3+N+ES/HZ6S+Ji+0O/W/OkNdwlOfkMEAYLExWG4FbjPWzTFZVrfPHL+ROx//IU+9JQ/ieIj/T7nXyuGsibuyZDYKtnaoTuXXkK6xwegyWtPJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mYrtHlTR; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mYrtHlTR"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso3102415f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 06:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781616833; x=1782221633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lvYxCng4UXLcQ/XoznoR8Er/jzsFv5UY/bjt0wk6M20=;
        b=mYrtHlTRdxgA3QyRxqM98M3oCUow0xVbxWsJIoBCSQB5kHzUCYSvhTWJ5vFzmEdvih
         tXJzr/GCI+jNAMdr8g9ipvNeUMn57kf4iKxAPO7yXDKMCdinPWG7PDPGmdMKmRLP6DHF
         60khKnZY3ImNbn+QlfBD/s3IHOTA0gWX0P7qmmgICE/fhtsg2PYR8g92tKpdUtJMQuKt
         M2P8bWOOQ6Q5POIH8JB70Tipi7QXKTTQzTnCag53sXEq/mJa01dH4AjESnuPkdlPEhf9
         JMybhn1k2kqUbjsHf5ZAJxop9Nwl02qvn9qa0uftl/MkUq0hqMVhMZ783kmzvT9yQ6DI
         1mhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781616833; x=1782221633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvYxCng4UXLcQ/XoznoR8Er/jzsFv5UY/bjt0wk6M20=;
        b=BRlCd7Ta2t+0vW37b6Qy7siMQR14WvW1L/RCiOUN4ObgIsYaI9D3nX5D1Sy3f8sNl1
         IF1V1w7viQdu0dj1IxwuyPkcDPMayorPMSGCfxClWEIpc7REYxof1PPAAdsSw/87feVE
         2GTFJMXBJeln1azwaE2C5tPTz8/LbOtiqfzVNR49tO+miqyBurLY7nKXExRnTtw3Rfff
         +eJKiC5wegsjVAnU9q2ZRI/LDqOVlZeiRprefNBmJd5EqLYoxwUWHEsl4scr1AdLtPJA
         4+8gOTMUdk3ixj/y1SzoZADD6sg448HVophAoaA1V1LhbUzVyCY6rtHfeRcM+TtiAEax
         nV2Q==
X-Forwarded-Encrypted: i=1; AFNElJ9vrnkUUY3nk/p0fOvG1mGbQXx9KAESceiW4WZAvjytNghDyCM+RVGK/L98jsLAnE5+c5XQVOB2Vx9FKlXNrOw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpt6MSG1pf9qMshV/UseeF729gzj1WoDpIqYOUraEYumaUOgyh
	LE49MKrK9nwEBg+jjIxSF7SGHCwZrRW6lIpA4rYgHeI3gcPaZgYwTYNK
X-Gm-Gg: Acq92OEEtUQjO3KUo6y6nZm28xK2qvDfCYHiegJNE9QBTnH/MLzlELbCNqkvT4Ejofj
	yBQBMxJj+3ldYJ359Kc0xLvIY8pUnoydse/TDeaI4gdiJSfN/FUzJDIhPD8s7fTk6Sff9XjaZdu
	e4XXxL2AQufYv2cizSniRoWjOIWwC9WXKR6ekFF17RKQtTe2rkNApSimlg5qrXPafZXMJbUIES7
	+b+S7k6dHpvtyYeGuT4+m4t07gi5w7U9KReywZlxOn2RcBXglbi2ospM4wiu9saJwBROjz9zpkX
	+K5FflKkwn7806IciSlAsVHliixzytGTeCrr3zxU0ffHvIOO4WmcmR2Qmt8XPCrpNFrNI6SghqA
	8Y1y+bLFcs8PAhUz3PXRPSDE1hkU5/RYUHF9I3CtyFo/AwE79lpLR+lKVUAu3hZGNmm0HMcONhN
	YvBLuBRDd0S8rDhLV4iXJqhDME5jEB79lRUz3eRyOGgQep5WxAtZsgYmlKXTicJXDcauq3OVaBp
	C2uiAvSWWhitD0xIv/dSUdPzYt8ftj8MjIJ1Kz7CvUsVMx4bp1xcligsA/MG17SCT0hd9JXfbbb
	Os73ZJ0wSIRrgDFMI3UuTR2HVm9/5coQekNlcREsq0Q=
X-Received: by 2002:a05:6000:986:b0:44b:7ec9:2d76 with SMTP id ffacd0b85a97d-4619f383d22mr7296064f8f.7.1781616832689;
        Tue, 16 Jun 2026 06:33:52 -0700 (PDT)
Received: from mail.gmail.com (2a01cb0889497e004325bddd753d2e35.ipv6.abo.wanadoo.fr. [2a01:cb08:8949:7e00:4325:bddd:753d:2e35])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619a041986sm20656081f8f.23.2026.06.16.06.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 06:33:51 -0700 (PDT)
Date: Tue, 16 Jun 2026 15:33:49 +0200
From: Paul Chaignon <paul.chaignon@gmail.com>
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: bpf@vger.kernel.org, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	martin.lau@linux.dev, eddyz87@gmail.com, memxor@gmail.com,
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
	hawk@kernel.org, john.fastabend@gmail.com, sdf@fomichev.me,
	toke@redhat.com, lorenzo@kernel.org
Subject: Re: [PATCH bpf v2 1/2] bpf: Fix partial copy of non-linear test_run
 output
Message-ID: <ajFQvedGURQuKqbX@mail.gmail.com>
References: <20260616093103.471444-1-sun.jian.kdev@gmail.com>
 <20260616093103.471444-2-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616093103.471444-2-sun.jian.kdev@gmail.com>

On Tue, Jun 16, 2026 at 05:31:02PM +0800, Sun Jian wrote:
> For non-linear test_run output, bpf_test_finish() derives the linear
> data copy length from copy_size - frag_size. This only matches the
> linear data length when copy_size is the full packet size.
> 
> When userspace provides a short data_out buffer, copy_size is clamped to
> that buffer size. If copy_size is smaller than frag_size, the computed
> length becomes negative and bpf_test_finish() returns -ENOSPC before
> copying the packet prefix or updating data_size_out.
> 
> Compute the linear data length from the packet layout instead, and clamp
> the linear copy length to copy_size. This preserves the expected
> partial-copy semantics: return -ENOSPC, copy the packet prefix that fits
> in data_out, and report the full packet length through data_size_out.
> 
> Fixes: 7855e0db150ad ("bpf: test_run: add xdp_shared_info pointer in bpf_test_finish signature")
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---
>  net/bpf/test_run.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
> index 2bc04feadfab..976e8fa31bc9 100644
> --- a/net/bpf/test_run.c
> +++ b/net/bpf/test_run.c
> @@ -453,19 +453,16 @@ static int bpf_test_finish(const union bpf_attr *kattr,
>  	}
>  
>  	if (data_out) {
> -		int len = sinfo ? copy_size - frag_size : copy_size;
> -
> -		if (len < 0) {
> -			err = -ENOSPC;
> -			goto out;
> -		}
> +		u32 head_len = size - frag_size;
> +		u32 len = min(copy_size, head_len);
>  
>  		if (copy_to_user(data_out, data, len))
>  			goto out;
>  
>  		if (sinfo) {
> -			int i, offset = len;
> +			u32 offset = len;
>  			u32 data_len;
> +			int i;

That doesn't look needed.

>  
>  			for (i = 0; i < sinfo->nr_frags; i++) {
>  				skb_frag_t *frag = &sinfo->frags[i];
> -- 
> 2.43.0
> 
