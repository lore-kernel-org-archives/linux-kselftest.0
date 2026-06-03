Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EE53B6BEC
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 15:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780499805; cv=none; b=D5OFMb/McWAP678TKL53E0e0rEY9DQRALpFvbVUxAzuywF6jEdDWpIXE8Ku8hLOEgGc5Kv3ZYr+YV0XPurezTzh+0ERYkIhnha1ECEnCO35BWx1Hi5zP5BqpYRm4a5gXmq+Dx/L42/DWjz7ebFYKLt6rbOHSVXfVK2c8lZqbKFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780499805; c=relaxed/simple;
	bh=DQ8Y/4v5YdnUPcSKspvljjFWbGO8P2IvzlOPanwUzFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TDAySmSB1EdL0Ok1XrUJxJo4CjvlO1/oP5+VK2oJNiuHHamBS7SV+k6onGvv2GKMYOZfy4GVMr2pbYeXnDjKyaBoDIbsfpEY+2qHlekl9NHZ6GT85Eo0MzOXXU3WMvcwaEELyO/m/AjvKts53VXrN6BL0QLNNb4J1pXT7duhlZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mXzeewM4; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mXzeewM4"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490af320e2aso29828275e9.2
        for <linux-kselftest@vger.kernel.org>; Wed, 03 Jun 2026 08:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780499802; x=1781104602; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MaF6lWKR8sLzmWJlJ6QvlML1zUSvU9tppAwiknuVLcA=;
        b=mXzeewM4xtOJ/gda+ryVK+ko3W2upiC98RPQcZ1apTCi3Jefj7qsrABiGdy5VvNhbN
         HrHRpIg/r/71ddsJKVJTSyyb4PSfMHNKfwdm4xx/nQvqNfe59cysg7pWB/VZXTzkyGb6
         2fhgEZO0WFgIf0q6+moq0DbXvBRbG4IPlDYX+rTDw5kYlh3PPTXfMC3nZ/v/IlBKyr1i
         KT3efVhrr3qPbvZz7ap2TeVBnyz4RyD9EBqUHRYtDjXIgJ2pC1SP2/TIEx/bkY7KhpHZ
         3IG49jqTC/WPzpU8wXNq/gOUqc6/LxHElMGbpd0J+xQ3Ek3xYOcMr5qsDseeXtKUhoI/
         JN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780499802; x=1781104602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MaF6lWKR8sLzmWJlJ6QvlML1zUSvU9tppAwiknuVLcA=;
        b=Qdnqa8jg0HuPRXflV728d4gmrIIKDGaeTJ4dwQyrpFWfuvgx3oJdZEYOwQxml/kFSl
         YpVb5o+vOQwbpk1cVlL8o0qa0LGLbcoICiVHc0/ZGOAma1/MOtv+nztlBbaeG476CJMe
         jgHUj4nDiSRgD7LaugKWYNFteS5ylrKW89ThdPTmLMCecfP40eFlnmqKCm5Al922OeXn
         xYOWPqqPpdkVFvgFrA7AQWAjvnuuo+fwx0z6cXfjfpHrEgvCi+ozf0EOBdpmDh+L+3Z+
         56r4D6xBHy3yaLbHvh9ZAS6EuyTLM1T3PnqVwvk972hy87osiLy1x6O9Mw6piWXtDvSH
         OjjA==
X-Forwarded-Encrypted: i=1; AFNElJ9MErCbgoVNh6jujS6aDj0siG55ShtQG+jALR1lDD9zymwunfRN6FeLs0PTX1XCIyiJFX1n01Eq2vdGO6jqur4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq25lyYfXtVimhAJ2GVi8UauylrXWn7yH4rwFaPvuLyBjGVMS5
	h+oUJ5m219SRVY/RlJNHErYuKMB0Kt8Pp6GRM7qHZfPMlHhz3Aax/qH1
X-Gm-Gg: Acq92OH3MBt8cvDWJSMO/OZ2Xi9sy831JxPXlL4rGxxtbGjFg6hDJ830PC3A8FCs5R8
	ZDF+ZFTqlEW9XSprVtqk+gvyEpf9clT0TfQO3Q1lkbBJ8vsiYqT5cl05GvWWTfKB0aFCCd1TvyE
	dvqZnDITtvUOtgxK+rmc/TqWyty3eqaknfsIOl7WMccunrLpOyqVVYqlN5GTRbEp8X4dmYE1nk5
	sODXAK6xeFeAuLiQnZtglo26dLityFCqULX6y4z98FJR5+AX1Qw68ajeEBMipIvmW7UxC0s9FAR
	qLM6pzh0S1nMG7Pi0BthKNLdMGQRXBqOKprlR2TKNQc+iWsia0wQziu5EvvFIcXhUexrZleFMLE
	SFS2vQTxPquLg4tOG21IY6tVJIaUNjSG8cgVJX4jv/k+bvpTckxcgfTweXmkBqCMtUtavi3clEB
	j9vum5wK3j10BfpqaTr0dPeDpjC6I0wcP+s8Sn3Fzg5bEZzRRHvWVap/N14bIgH3MvAXP1WgF/5
	3kPQ+LFQ+odyoIw0uoKzA==
X-Received: by 2002:a05:600c:8b48:b0:48f:d612:3c59 with SMTP id 5b1f17b1804b1-490b5ea6ddbmr67495725e9.9.1780499802292;
        Wed, 03 Jun 2026 08:16:42 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd1f:f500:f867:fc8a:5174:5755? ([2a01:4b00:bd1f:f500:f867:fc8a:5174:5755])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm9064550f8f.23.2026.06.03.08.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 08:16:41 -0700 (PDT)
Message-ID: <714fb4cc-2eb2-40be-9202-d82d405d82ae@gmail.com>
Date: Wed, 3 Jun 2026 16:16:41 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 1/3] bpf: Check tail zero of bpf_map_info
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
 <20260603144518.67065-2-leon.hwang@linux.dev>
Content-Language: en-US
From: Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
In-Reply-To: <20260603144518.67065-2-leon.hwang@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 6/3/26 3:45 PM, Leon Hwang wrote:
> Since there're 4 bytes padding at the end of struct bpf_map_info, they
> won't be checked by bpf_check_uarg_tail_zero().
> 
> pahole -C bpf_map_info ./vmlinux
> struct bpf_map_info {
> 	...
> 	__u64                      hash __attribute__((__aligned__(8))); /*    88     8 */
> 	__u32                      hash_size;            /*    96     4 */
> 
> 	/* size: 104, cachelines: 2, members: 18 */
> 	/* padding: 4 */
> 	/* forced alignments: 1 */
> 	/* last cacheline: 40 bytes */
> } __attribute__((__aligned__(8)));
> 
> If a future kernel extension adds a new 4-byte field, older userspace
> programs allocating this structure on the stack might inadvertently pass
> uninitialized stack garbage into the new field, permanently breaking
> backward compatibility. -- sashiko [1]
> 
> Fix it by changing sizeof(info) to
> offsetofend(struct bpf_map_info, hash_size).
> 
> [1] https://lore.kernel.org/bpf/20260513224823.6494FC19425@smtp.kernel.org/
> 
> Fixes: ea2e6467ac36 ("bpf: Return hashes of maps in BPF_OBJ_GET_INFO_BY_FD")
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---

Acked-by: Mykyta Yatsenko <yatsenko@meta.com>

>  kernel/bpf/syscall.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index 625a4366fe6d..1007fb7c87e9 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c
> @@ -5400,10 +5400,11 @@ static int bpf_map_get_info_by_fd(struct file *file,
>  {
>  	struct bpf_map_info __user *uinfo = u64_to_user_ptr(attr->info.info);
>  	struct bpf_map_info info;
> -	u32 info_len = attr->info.info_len;
> +	u32 info_len = attr->info.info_len, len;
>  	int err;
>  
> -	err = bpf_check_uarg_tail_zero(USER_BPFPTR(uinfo), sizeof(info), info_len);
> +	len = offsetofend(struct bpf_map_info, hash_size);
> +	err = bpf_check_uarg_tail_zero(USER_BPFPTR(uinfo), len, info_len);
>  	if (err)
>  		return err;
>  	info_len = min_t(u32, sizeof(info), info_len);

