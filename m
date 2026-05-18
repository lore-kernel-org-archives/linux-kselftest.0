Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55DB3385AC
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 11:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779103845; cv=none; b=MoCI+lwfaqk1kvJOTCzwx/WukxXwAwWOpPtmPNpR4BXpDOsUYhfY8giFBiJ27Gfm8Lo5PXziEbB98U5GKNxw2w72PKQqXpM4BGfXZdhiEv+FFn7+yi8jw1A9ngHY4rZgWQ0blrfHOHMT/Yg7PN1RyMlND4nSE72bbW7RlK05s+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779103845; c=relaxed/simple;
	bh=a8pMTZrbCVo8ggCBj+04CNraHKq2UJhbdckV3vw1Iug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BnwOjuI5fuOd/l23wjAI5dXyYH3v6bHT7GYOLmPaBTs+VW+mDbUiPHX1Jny3cBmA3AdMP31vp8iDcVBBNIjqUHrZdXYM300WZQ90TcOnJGN4C48cz++6k/g5rTq4yaQMees987xXaDE1chevgfQ4pGYztIxhEwOyRWk4BuL+Ruk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/w7ML8J; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/w7ML8J"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d73422431so1385637f8f.2
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 04:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779103840; x=1779708640; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cq2IndJkk2Z/xx3Cj2HaRpHci4EMlQjTZVq9ezC+9Ls=;
        b=j/w7ML8J73W63tCtdkT/b7bwilbqX+p9hoDdVfWb0P9dzWJmRSjZoWLM41bZjAbowc
         FY3zaxdMtKx7ma7DJY+nxCbYsolsV3+uahYbCNTaEi9v2JaoVnSj73UGf8imubNP062/
         R/gOtWyWQSO4Zkla0Tet3ldXO+xVEuxbJlRPs719to5ccOIamfykCcPtBVWk9wb7JZ6W
         /87XySZcz2mhBiFrMzI4fLvPswOLi/Q3ijCbjZ0TYsAdDpCaPyC7ujKXc0YY8cSC6Vxn
         9IeXdMNKall1KQ9t6vBfgulrE6SSWFLbY0jpquojWA2Zh8zI/LX4E41rnQPva9zQu0Dz
         hlNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779103840; x=1779708640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cq2IndJkk2Z/xx3Cj2HaRpHci4EMlQjTZVq9ezC+9Ls=;
        b=esAteGautp2b7q/sdzxg42Uk9o8kXOMNqFE3+XFjWXmEcvF+RDzYKZ6ypI/rd2jiAr
         nyBe7bJsdoe1vgOif7r2GgB0S/LnydwHpgfwXGv2L9NKYrsRQ3kBPz2aCqu1CrbqJ5f6
         dAE7gbv5Qz7JQdpvNeUngwZBkKj5e8gLaKYB+ThGMQFDgekAECRHG0LMqf/t8Ramg8px
         HNDxcFX/FtrVi2T/4BFL4WOZ9l2ELHfjzLaZJ+KZcUmcU/tctJkj32OlVWl7YQoSieIo
         ykMreJvImez3run2ecnip/1bx902N82uRlLrY68FaKqCN1OP7BLqB0TzpqIuKdvSqPk3
         ZgNA==
X-Forwarded-Encrypted: i=1; AFNElJ+DpBvWvCPmtigWksvixiZj3gt+EYO2OfzsCkuJBxWtcF9sZY+767x5oToUQ1u0XCeuNmAc/m17g7IAfNIhClE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxddLq4AdnnpNp2YQyGIlOOh/WzXAu2Q7KcNwl3fmchfZQp8t89
	UYRkoxkFFHwYIpSLoQCGee25tAZlTF6PzSF11LJeVI6SVPVbaWxj4SIW
X-Gm-Gg: Acq92OEKW2/NJvy9APmoRr8cugWHp+V4Gvzvc2AVLDEKvzubW8nRJ6rG0hX77LICcIC
	haqZNH72e+7PSSKO57tUVulk2+TrXzIEn/UA1erl3VmRmwiGSJ65iw26aPIym820FiEBXmef6Lx
	wYDOVJ2f60FinsI9fwmnjrBFpFnxg+jP1RFNc+WA8ouRr7CgpwgQ25WmKQPBci+O2PxwsBTc36q
	DVRDQBugHH88Qx7cKjaYoJIngINJiSGIhyVQgc2EfkE98VoRFmK3bD9UTy7xReZETmWBYkBrbfM
	NdDgiZgxJMNZ/qtrbTnYXX4T+QWXop2kPBVDLjcLkXRZi0Dno6PPBDtKwD46uX8A4EmYDDtOewm
	Gu7cnd13rYVs9s4+iPjQ4RigpVHuitJsprFtZZQNtBGT1Jq0Uyd7uC8VDHJsWEKMnhH0tFo+vsZ
	P0lTne9XC+V/kSuYuAFnjDtba7fHeuFSJ41vLkFJ+8O3Hg+SUwXGBGe2x18Dwua5pRS599RQK2w
	3C0w8dWFoYc8M0ZDugU5LMua6edzA+9w+06LtT8Ss/TsPfs00HdusTI1W9yluf2tuc5HumeK/d6
	SobD4WgqJoZYvkEQ5FCI2R7JZI08H+Yo5GTxZywuOWc=
X-Received: by 2002:a05:6000:2dc2:b0:45d:4c20:7285 with SMTP id ffacd0b85a97d-45e5c5bbe46mr24159481f8f.6.1779103840151;
        Mon, 18 May 2026 04:30:40 -0700 (PDT)
Received: from mail.gmail.com (2a01cb0889497e003b74b873959997d2.ipv6.abo.wanadoo.fr. [2a01:cb08:8949:7e00:3b74:b873:9599:97d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe13b4sm37171571f8f.28.2026.05.18.04.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 04:30:38 -0700 (PDT)
Date: Mon, 18 May 2026 13:30:36 +0200
From: Paul Chaignon <paul.chaignon@gmail.com>
To: Roman Kvasnytskyi <roman@kvasnytskyi.net>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>,
	KP Singh <kpsingh@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf] selftests/bpf: Reject unsupported -k option in
 vmtest.sh
Message-ID: <agr4XGcThPFTMRzb@mail.gmail.com>
References: <20260516120625.80839-1-roman@kvasnytskyi.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516120625.80839-1-roman@kvasnytskyi.net>

On Sat, May 16, 2026 at 02:06:25PM +0200, Roman Kvasnytskyi wrote:
> vmtest.sh does not document a -k option and does not handle it in the
> getopts case statement. However, the getopts optstring includes k, which
> causes the script to accept -k silently instead of reporting it as an
> invalid option.
> 
> Remove k from the optstring so unsupported options are rejected through
> the existing invalid-option path.
> 
> Fixes: c9709f52386d ("bpf: Helper script for running BPF presubmit tests")
> Signed-off-by: Roman Kvasnytskyi <roman@kvasnytskyi.net>

I'm unsure this needs to go through the bpf tree, but it currently
applies cleanly to both bpf-next and bpf anyway.

Acked-by: Paul Chaignon <paul.chaignon@gmail.com>

> ---
>  tools/testing/selftests/bpf/vmtest.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/bpf/vmtest.sh b/tools/testing/selftests/bpf/vmtest.sh
> index 2f869daf8a06..9ca802285393 100755
> --- a/tools/testing/selftests/bpf/vmtest.sh
> +++ b/tools/testing/selftests/bpf/vmtest.sh
> @@ -382,7 +382,7 @@ main()
>  	local exit_command="poweroff -f"
>  	local debug_shell="no"
>  
> -	while getopts ':hskl:id:j:' opt; do
> +	while getopts ':hsl:id:j:' opt; do
>  		case ${opt} in
>  		l)
>  			LOCAL_ROOTFS_IMAGE="$OPTARG"
> 
> base-commit: a828abbb897657451d96ad7bf20f1893ac983bb9
> -- 
> 2.54.0
> 
> 
