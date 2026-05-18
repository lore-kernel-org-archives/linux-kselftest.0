Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4822040C5A0
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 16:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779120874; cv=none; b=um0VmoziN6Emzp/c/r28WADewyJbRgtp/8pff+t1Ql9/uA76oYbeDD5x+yUtmDQM3+3MZwdGsd6xri+WL8Frxsj+15uTFGAUY64vXpkJF2miclcdb3C8MNQEtzBQf5XuIbz8HWtDW33Vz/NDHWTSjk3VM/g9yQZqGRJitvf0iF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779120874; c=relaxed/simple;
	bh=KBmaIFHON2EYfGmxVZYjIH/WtRx0RWqToQinmPzD7i4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HcldkkH4bEpiPZVN5C/g7S3+n9N4cspersQUPZAQOjvJ3Uv4TTzoFrIfceIdcCFUOgOY2DFgYbzWIj7HefBlNbbq0pyLVZibQpGUnapOFq/XvHdUUaEfSu8WboLrug4fcagF/ahxwLC1xndlWLpLamhbIj0t6i48xjPq+indBXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pf4q7KQD; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pf4q7KQD"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48e82c23840so19326715e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 09:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779120859; x=1779725659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SDQc/Hmcg4wkxrkpnM69XNZHAqGS6wrj96XS3N9o/CM=;
        b=pf4q7KQDIX4aYUNO5qTK8noUwHH4b4C7thwJpFBsfYrHz8JTcLB1azrAubTvOYJ42y
         xblz69Rxvq1D2fs4AXfoxpo06u3Yq9kNyDXL37GBREMWim8ZSmZEH0EulOQbfPk4LwQw
         o4LNbK/XFb6wbJPShfpG4oVTVog7ETwHP8YB2H92v8kbpWifzEQ6E23H7atM8629+WRp
         8rccpBjzg5x6LLaONtL0W3hRhrSASlhWvn3pwMAbCtiyRbXzPuqVj/hgI+2PkrhTtjL7
         c4tkZ9QWz4a6TwkJLhvEUL3nLoUgttWrhof1RVX9+tndGVC+SF507D2Ojde4fy4oGWH/
         UsSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779120859; x=1779725659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDQc/Hmcg4wkxrkpnM69XNZHAqGS6wrj96XS3N9o/CM=;
        b=otMG8q/s08HtebelTajtqfSxnOoBtRLNV80HpDvjjhmX7IzTqCOqmgYtpasTCmsGYT
         NIZ1IkCe8XwN1ZjUA9S2C1D6blndy7wYhUPTt6WQtEGTp781ZpYx1u+mBgsayF4Fx5jF
         cZHXv+u7/XiZAll99cT4EIQrjAJUtQc5nH4NxuYbpqnfCF9mSRklx5pPItu6RmTAXbxK
         tiYIzFdj6qybHrpN4blqBTPPACdIM9Bfk+OutoctCFcYFSE+VgSMv5bpf0zf5B9Vqg0O
         a7/Pq1vxBw8ObYM8rY4iWrmxC2ZLRUpl8Jmc8F3QKp79rZ+muZ8m5dCdUYkG0CRGmXvd
         bO+A==
X-Forwarded-Encrypted: i=1; AFNElJ+fDlxyV6f7VpKrAHVzG4J5Hab/8cdajgVjP5GDFLsj1MR4Go0noVfK1bCoaRJp2acCYml4GKFNDtyiSjFVbWc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJgaw8SMPXrLNNZCw07lsxpSHBdB9Fld/LQrz1Tw25cL7NSGEW
	mzZFEUXg2IxEsQ4S1yOkfYob6rFh41+IGjZeMgPQWMB7nsgCywMnnRmO
X-Gm-Gg: Acq92OG4Euz8zNcI/qa7bFgkRrVTqOOvlsVqj6pbe2am3OsUufGRjxuqOxOKKySFKp7
	ZZz+rKlKngn1Hv/QCWBwkRpYACDVrXNPx2v9SbGLhk5cq4vSVQsBEScXxZiU96Yu/jzZkECPl6x
	ITJ9WL92jTYtCXABss2Y1+6Y8kke0H761hMmj3fKIada8G+et+e3rCqzJZokuyUxPFLySPAdZ+M
	sGSmSM+zAzaN0Sa3elBn6bzcWY2qKQ5BUu+ka6iXtaw8DUENvpLFGF+RGLZCmk59wjuO1CGct3Z
	JLk3m75zcBa7+tuTd0Y61P3wREuuvaBe317OrOlyDqvRaOOnJmDgb1Z30zNOCphkjYTrPte+3M2
	FOvUbmlf8KVCNroLdpkUmPUUM46JC0Ms3kY+tpxIo/pKnHg2SdDU4bUoISXp4agwG4U2LZOfmAh
	rkIu1KUpNS79q0vZAPCpXVxU0VIvq5NND+rTEmDnGY/t9QlAYEGxjviWAuZIubGgCUEJCdfDo=
X-Received: by 2002:a05:600c:1d0d:b0:48f:da34:ec4e with SMTP id 5b1f17b1804b1-48fe632343dmr227408525e9.19.1779120858659;
        Mon, 18 May 2026 09:14:18 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:1178:9251:cb12:6150? ([2620:10d:c092:500::5:5e25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4900c16c62dsm72201115e9.11.2026.05.18.09.14.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 09:14:17 -0700 (PDT)
Message-ID: <e86e1075-f62c-4167-86df-158841952940@gmail.com>
Date: Mon, 18 May 2026 17:14:16 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 1/5] bpf: Check tail zero of bpf_common_attr
 using offsetofend
To: Leon Hwang <leon.hwang@linux.dev>, bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kernel-patches-bot@fb.com
References: <20260518145446.6794-1-leon.hwang@linux.dev>
 <20260518145446.6794-2-leon.hwang@linux.dev>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20260518145446.6794-2-leon.hwang@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/18/26 3:54 PM, Leon Hwang wrote:
> Because of the 8-byte alignment, the compiler will pad struct
> bpf_common_attr to 24 bytes. That said, sizeof(attr_common) is 24 instead
> of 20.
> 
> When check tail zero using sizeof(attr_common) in
> bpf_check_uarg_tail_zero(), there will be 4 bytes that won't be checked.
> 
> To also check the padding 4 bytes, replace sizeof(attr_common) with
> offsetofend(struct bpf_common_attr, log_true_size).
> 
> Fixes: f28771c0691b ("bpf: Extend BPF syscall with common attributes support")
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---
>  kernel/bpf/syscall.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index 6600e126fbfb..83de8fb9b9aa 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -6278,7 +6278,9 @@ static int __sys_bpf(enum bpf_cmd cmd, bpfptr_t uattr, unsigned int size,
>  
>  	memset(&attr_common, 0, sizeof(attr_common));
>  	if (cmd & BPF_COMMON_ATTRS) {
> -		err = bpf_check_uarg_tail_zero(uattr_common, sizeof(attr_common), size_common);
> +		err = bpf_check_uarg_tail_zero(uattr_common,
> +					       offsetofend(struct bpf_common_attr, log_true_size),
> +					       size_common);

The change looks correct.

It looks like similar behavior exists in 2 other places of this file:
bpf_map_get_info_by_fd()
bpf_prog_get_info_by_fd()

Does it make sense to fix those too, just to make sure agents follow the
pattern correctly next time?

>  		if (err)
>  			return err;
>  


