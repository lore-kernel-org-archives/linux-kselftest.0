Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD103B4E8B
	for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 08:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781772377; cv=none; b=aTc0jRMmzaL0ib8ss7QiGFyj6wCIJnegxK4vHeEn86JJ+YolkqjDf15i1oLNzzI6teR8gKnBLFK6P6uaZ6PcJi3+wplx4W2qsyh83BwpykXtaVBDU1+h1MzuRyWpffJ/Yi4wydZa0KJ8+okVEug6YxbPczO9DYrennZw1X7gkz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781772377; c=relaxed/simple;
	bh=ZkO6pGqCkfZqy3u/oU51uk/j3lT62505mW0fThy9hk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNajTvYoiTd598n8DY2AEE2Hm00tioF0UgOX+O2Eq/QTSHxhvqtuwkBKaP4eMVnCXBkS8mY5bTGrDOc7Xwu2ti+pePgMwvTTpNeEeezAt2Kjl82D6CVs/WhSP2QGsFOOXsmh0n6Fjay6y0zHoI+WYwEJW/gEnpeY6Ikd7b2CkIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPQhdo49; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPQhdo49"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-463f1165e16so483681f8f.0
        for <linux-kselftest@vger.kernel.org>; Thu, 18 Jun 2026 01:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781772374; x=1782377174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3PGCTCQszIeeChHhQclIvtZO9APdlhqX7ENI5kXXs3o=;
        b=kPQhdo49O+yBje7dRhYtDtHt4mCyMKrFOBAd15Qovc/SviFiJm4TKN+LmQiRyh4JqN
         hyuCSZBO2MEUlMYVnLqBOOYzjuph6m50697h0zjDRx+qgFZB+HEp1jRfKsB+Gz9poVs9
         pzioYQiWuLcIVIHrLu6PqaUu8P3/Vk5ZYlGQOEbPqDFxQdGqV0p/vxClW3OZmZYsDQpW
         HQ49OyS9Eku0Z92Fot9TDvBC6KAy9skjsFuZx8y+eVHpF7krlHoNuc1kLNUyjVde21cc
         qXt5wzsKWTaabaEvJUjIR46xsAMvtyFJPHAjzvdq67c/s1EeqzXiucNBaTqFsrjAxU48
         9niQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781772374; x=1782377174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PGCTCQszIeeChHhQclIvtZO9APdlhqX7ENI5kXXs3o=;
        b=Q+61z8fbEoZLZuFvtjOtIrZFCXay4SN0Kx18EcQX/nzkFUbR19n6icTe9NEfX48Fuo
         obXgzlX72fK9+tNWnOp+l1EjDUuBlxml6jM3jYFsijAvqKLRMsOTE95GTkknSXahvRJg
         HN7LGKa6OJNfaqMLtK4RCK55GVCyy/8vOnWCEaUfTKxphZH9O14W6j/CerJtwNHb9VWN
         wu6rTNVdu3M48+WV9tpP84Y0tkntFfKTL06uIn2yau4CV8Jnvupe4Amh0jCWOlno5K5z
         dxf4HpqKKqGs00bVwUSdDkkqq+XrVCzeJd9a9NytAPOOVpEaOEs3Kw4Xuk73GHh43JC5
         0ScA==
X-Forwarded-Encrypted: i=1; AFNElJ8BhVlcYqGiCBT6BGq8tAngSTtWhsm4/xT4Mth2leBd3uwrSibX+Ilyoav6O8sRp4gDQYZPV5YoD9hJVrOAMqM=@vger.kernel.org
X-Gm-Message-State: AOJu0YygENJiCLJNd2aZMJLeR2ZBUAci+OqNSlw8sde1aLWTE+DNrAKe
	JRDP7cqURuZRDK9Vzfgf16jMT36waStWoT6+JGB3jrlKFojrBV1cijAb
X-Gm-Gg: Acq92OFf82QM0SFdTmOuzrfbKv1XrjyfmRWpwh3HzXnUOowJRLV7T5hc84/rAe0k8Jz
	uzdH3j1rvhyyrBnMs2o9iP37wS9OL4lxUaXH1nBrv6ZJfNmkN9yA+MB3u67xWkTjQ0pRkdmwL8C
	wg+CCcVQQw5KkPDMpWS7JZKradcwu5PRD3c2LFGYRHviHrQAB/iW/PEMS0yjuRPEjm+pxjfHDZh
	1leFcws0oWA1qS72KrfukTKHiE4KpNB2GbpRIfgoxetXPd32StV9zO7xQ8J0NbJj4AH/G293MG2
	XSVXo1aXekZkIalyETLf//WfErRPztW2mlucma6PZkAdcOBxATnUb8B9oXQTUgIW9Qvf9Vw1IzW
	WjCbl+50GGAS3EnWzNFuR+ZHHyEABpR3eegfghRTwz9HqdvOLDkc/Qkaz8Nz/lI+yrP+LUQ+3UK
	/a2EpwU/SUGlv6NZfe9NtcBZX1+NAmYrDPGlX74Acphbltig8nHwrcKRrgei7WaoMT2smMhcURZ
	Sk7aDlGm9+padJ3AFrYg02sxtjYElS/tMk4sALeiH5E9TgJBdkGroSddz0pqITogjI/6Fhn67Zs
	RHWeD8/8CYwblR1DDj8rv2dTKB1r5c8GWCJq8gtIANM=
X-Received: by 2002:a05:600c:8189:b0:492:32a0:7f92 with SMTP id 5b1f17b1804b1-492333aabe8mr126392015e9.12.1781772374045;
        Thu, 18 Jun 2026 01:46:14 -0700 (PDT)
Received: from mail.gmail.com (2a01cb0889497e006e99796483dfbc0d.ipv6.abo.wanadoo.fr. [2a01:cb08:8949:7e00:6e99:7964:83df:bc0d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa96f0esm255435305e9.12.2026.06.18.01.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 01:46:13 -0700 (PDT)
Date: Thu, 18 Jun 2026 10:46:11 +0200
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
Subject: Re: [PATCH bpf v3 1/2] bpf: Fix partial copy of non-linear test_run
 output
Message-ID: <ajOwU4ak1qWlAaYu@mail.gmail.com>
References: <20260617093557.63880-1-sun.jian.kdev@gmail.com>
 <20260617093557.63880-2-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617093557.63880-2-sun.jian.kdev@gmail.com>

On Wed, Jun 17, 2026 at 05:35:56PM +0800, Sun Jian wrote:
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
>  net/bpf/test_run.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
> index 2bc04feadfab..f15c613aaa4e 100644
> --- a/net/bpf/test_run.c
> +++ b/net/bpf/test_run.c
> @@ -453,12 +453,8 @@ static int bpf_test_finish(const union bpf_attr *kattr,
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

Acked-by: Paul Chaignon <paul.chaignon@gmail.com>

