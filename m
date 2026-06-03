Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1B73B585D
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 15:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499859; cv=none; b=FAM0flh8n5Lva0IqmTuwbhsSlWRw4vGHnnJkbNnCUXchO9Y7waueirWGiFKEdp/RrRwBiSoAwLUASY7QHBfsNtatRYRY2hEluSIFe2olit3ajThRy8+TAs3Rt48I8cg38FwEN+rPmbOviWp7V2nFnwHIpIEcX3UzB8u42VHv/J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499859; c=relaxed/simple;
	bh=yKBQM/dYhJDWNF+XWCSKcsh0LWE/TAYU2zGm7ql6dk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dlapEjsoL+N0njIQ+G6KfWaYhY8JjWUQvkI/cbnLE5uUgdi7ulxFmBBydT2fKiai4q/f0VPFFeZe/MBoe3jKu0ojwOzBxNLF0g0fxRcdJ5oHJYCzY8Vv216zebG3PZPcE8ogMGTYd7UU17NwYlOHGxNrEwqH3r6QBdfmQTT0t+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PXVwvOeH; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PXVwvOeH"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45ee6d32402so3771746f8f.1
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 08:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780499857; x=1781104657; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hnkH5xFEJ6g6oqedeDPHM9btk1uLc+DnFLjyYvq9sR4=;
        b=PXVwvOeHCVsO8ZIndw/CBezw1mtKNimrhl3s9nxoxqr/czz2Nl116bwsGnoH+wLaTM
         kQMQbyG0fFmwhz5i6NNfKarEQiXRd8x/YqIrT8t9vygU3C80KmED/VRttMn2E1NtV496
         j06JToVoDde3yllo03QPh/9hYUGTVdC/UJ+QYD37x3OiplBtsPKduaTI9m2SHaFhsJrs
         DuUlEAsf2gdlxZZl/yDhqD51aHmCyyb2IoP+CSuDGKBWPn7CWKVZwSlS1pTqNeNOxnXI
         sgTuctBp0ASHD9KBfxOBSUdACFL6bIbwtOcFYjN+XIvW6JfpIW+7POBCSK2ZxXoqE1/j
         r6pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780499857; x=1781104657;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hnkH5xFEJ6g6oqedeDPHM9btk1uLc+DnFLjyYvq9sR4=;
        b=bCMFm5derQAynwsmNHb6FmdfYYUfD3Kxh7O0+058ACAb9cYXw+Meuo3Viof95XpnAp
         qx2J3D8RZkKMygufakc4tKEk4WW3OdvqHwKLseufOs5UT7CJBVvZSmmNMDS3VaToZYhw
         pRhX+EJSIdD6kCUvViuExAQRemm5Vj/g2BU7iK2/uw4nzIIAeBBSVlOpqEvWFABaBHO7
         RVc2nbHQ+ixPnQzNbvSQWk/xJ5yZ/o+h8tEN4IFjQ7Pbm7X4W6zqyLDi2IJ6U/0K08an
         JG+VUr59trUqs54itZWzTEeF1ciAA5cTELOh+UbU3EocB9Mkt7TuXQd4TXIFSY9H8yEV
         JWxg==
X-Forwarded-Encrypted: i=1; AFNElJ96+Q2c1ntm8+N+1O31tKrqCzpZ+FwKWS3Nze+HcBTa1JwjF7ZKBCSEvdH22WcuFq4qPRoso3M7aOb8j80ExgY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRnpY/yGrKGUSoPHxTcGky+WIsX6JGfPd1UTTDPG2gi0S2lWpP
	D8vgx5+hRa6+ZmfsJls8RqXgeHVPvgZplTYW0MXbGvwU5aidlobiesiz
X-Gm-Gg: Acq92OEwnd1VvMq32lbnwA8NH/+a8sKi2HqU+7MH2dyRnzV/185FOtxRuH15jfP3CXe
	OmPxrbXHDXFtcAoAHjMjzTCAu/56o+472k1xMSN3IhJdqS287ZmRjVC8xm8xLM/qEn+FjKBZOG3
	12bmJOWczfXO3zK0zoONDaeDkq1x1b5Es014Of7UJ0byVS+r/bRzeC73gGbs3xyXWtYaYrdnQl/
	fetYkGGQVH2NVyd3Kq299UfRA9Cl7CPw95DcSDQ0DoP3yG5kW/Er7QmgJ+96gKmRADEcHhUJyoT
	jRc2ZfoluAKAxjQQHeue44Ap8QmN/gFgdwLZo6HrtdNDqphAWcg8m0idWhIPhfm3zVUTB6eS0ZO
	ch/2O2QCaF5eRnHk0AX3RuryLRdCBnG8w417Osc2L3Tszih+1G2JONZUryavev1a7B01GijOR50
	/T5zAlPhty3x4IAsnvJMJakWhGyRibAPL2yNxZJDYwtTuPGxHx3rMxIrvxpmY1Bxtah7l+2DaPY
	K3Xm3U8m4502hi7XpZxyjoLkL6CTXHh
X-Received: by 2002:a5d:5989:0:b0:45e:e44b:313e with SMTP id ffacd0b85a97d-4602181fac2mr5917728f8f.19.1780499856561;
        Wed, 03 Jun 2026 08:17:36 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd1f:f500:f867:fc8a:5174:5755? ([2a01:4b00:bd1f:f500:f867:fc8a:5174:5755])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f0a43e9sm8398676f8f.0.2026.06.03.08.17.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 08:17:36 -0700 (PDT)
Message-ID: <f1f18841-005c-4450-b289-2a052f5f3fb2@gmail.com>
Date: Wed, 3 Jun 2026 16:17:35 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 2/3] bpf: Check tail zero of bpf_prog_info
To: Leon Hwang <leon.hwang@linux.dev>, bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Yuyang Huang <yuyanghuang@google.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kernel-patches-bot@fb.com
References: <20260603144518.67065-1-leon.hwang@linux.dev>
 <20260603144518.67065-3-leon.hwang@linux.dev>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20260603144518.67065-3-leon.hwang@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/3/26 3:45 PM, Leon Hwang wrote:
> Since there're 4 bytes padding at the end of struct bpf_prog_info, they
> won't be checked by bpf_check_uarg_tail_zero().
> 
> pahole -C bpf_prog_info ./vmlinux
> struct bpf_prog_info {
> 	...
> 	__u32                      attach_btf_obj_id;    /*   220     4 */
> 	__u32                      attach_btf_id;        /*   224     4 */
> 
> 	/* size: 232, cachelines: 4, members: 38 */
> 	/* sum members: 224 */
> 	/* sum bitfield members: 1 bits, bit holes: 1, sum bit holes: 31 bits */
> 	/* padding: 4 */
> 	/* forced alignments: 9 */
> 	/* last cacheline: 40 bytes */
> } __attribute__((__aligned__(8)));
> 
> If a future kernel extension adds a new 4-byte field, older userspace
> programs allocating this structure on the stack might inadvertently pass
> uninitialized stack garbage into the new field, permanently breaking
> backward compatibility. -- sashiko [1]
> 
> Fix it by changing sizeof(info) to
> offsetofend(struct bpf_prog_info, attach_btf_id).
> 
> [1] https://lore.kernel.org/bpf/20260513224823.6494FC19425@smtp.kernel.org/
> 
> Fixes: b79c9fc9551b ("bpf: implement BPF_PROG_QUERY for BPF_LSM_CGROUP")
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---

Acked-by: Mykyta Yatsenko <yatsenko@meta.com>

>  kernel/bpf/syscall.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index 1007fb7c87e9..0c86a70d31c1 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -5115,10 +5115,11 @@ static int bpf_prog_get_info_by_fd(struct file *file,
>  	u32 info_len = attr->info.info_len;
>  	struct bpf_prog_kstats stats;
>  	char __user *uinsns;
> -	u32 ulen;
> +	u32 ulen, len;
>  	int err;
>  
> -	err = bpf_check_uarg_tail_zero(USER_BPFPTR(uinfo), sizeof(info), info_len);
> +	len = offsetofend(struct bpf_prog_info, attach_btf_id);
> +	err = bpf_check_uarg_tail_zero(USER_BPFPTR(uinfo), len, info_len);
>  	if (err)
>  		return err;
>  	info_len = min_t(u32, sizeof(info), info_len);

