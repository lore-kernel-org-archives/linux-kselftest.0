Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013122931CE
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 07:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784100768; cv=none; b=Zr9ffjz/xDKYY/KSWxQX4OkNKz5W2PuUPKJMSoxJIgeAnJrPbdijoyrsBQc5uoMkd1ysSFF4Xt+Q7Df7S/7gWFikyVK8++/21I4uf9XLDvkhM8INrHpAb5wF9njFjvGEeDzPHkQJfpPFy/poF0cZs9U5zeyqxN1YjkyQ5z+oT3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784100768; c=relaxed/simple;
	bh=L9CPXAJheqWNoyOUAcILUbOdgB7KPZUbQIcXWoChaNg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LqVKj3p1eL9syYTkFs48dXNVhWxca6qMt2iPy+HfYP8PKG63BWiU80MFtINwfq4lyV9dMnNA45xfxGjLA7HSh42m+8TprOz9Uu/Nt9V+VtFKUS8b4nKg/ChT1kZxkv2cNLdE14KLKxUZlBzEgfXzE7sl09psRgQYh/vBNrHjxno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbSnKBEI; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbSnKBEI"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47dec32798aso5223087f8f.1
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 00:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784100761; x=1784705561; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P+W/6w2BHQvTPXAgvWknwKhqQxgDvHbPVAhqRj7X3rE=;
        b=jbSnKBEItn7XCZJmOc3OgjXbw0ifAQ45sX+VA0r4HWPCLolnVXlF7y75/KSgOQkIAe
         8wF2XibpOb7fbtCt/lZkwN+EDQr073u4/TD3lAQvHP3wxHH+yvmQ6vAM87UH2QnFDnly
         ZoT9B3p/l1R1ZKdJQ8TmDzapU3iifczdpsIjUkbI0ADMSSTLKHq7XsXuYNTf1RuCL6dy
         eQhpiZKzAq81h2afzH0V67SAx4PduqFoEpdRb8+BC/JiVpHk2GO9tDrbG4lqxjONY16e
         k4SXpueHLYEoCyTzSndOPzTsSA1BOIlmkXMKInGlleqF6o9+txjsfK6Hk2g6RKureBhg
         zuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784100761; x=1784705561;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=P+W/6w2BHQvTPXAgvWknwKhqQxgDvHbPVAhqRj7X3rE=;
        b=k7NzntD4UYAiyDNCQEshTuiMjKymlWkIcqZt0cErG49Xbn3oxIrdkP1PHE5jfhrfu4
         5csifAc3uElEv6MqnVjwrDmFMSxShuehlsrBEqleLgKIogBFNv3zPYgNIWeF2HVpXoWq
         3u8qEx7LI77l5sJdKthFsaTbKVXHFoKbORDZ1dRhaKtyiEmdJ3BBuwvn0VgaxYEb4iWK
         kJ3o50mY1tm9eq3+vbt6yP5f4/GXFWH7W53+zkqsW5vXlXTCMi6fXh90fJ5+s3y21aTk
         q+qigxQ9pLCI+QOVLp471Sfm2ZkFjnEp3CfBpeDaLOd2w4/X610yRDqR9lpLRdR37qlX
         4QYg==
X-Forwarded-Encrypted: i=1; AHgh+RoHgAAEjgsLq3LGrKb8EegfwAxQHE/ZZWTfn7z3Yq+qOpgtEsFtyTvwGhwlybpLccudEgdvDA/8mc5jmo0sd4c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNDmaBP2/kyWerrvqHltSLMhkb49J58ALqHz5letP9ch38JOUp
	87aTcY7cEMfxXcm2xnqqL/et1E5Yx9aEE339zjvQk54JMZ4L4PY+Q4ah
X-Gm-Gg: AfdE7cmHPxjA9lx4E0PSwyioBFCmP192wD8Q8Ok39swsewaqfjrQIE/EhNFOxilQ9Ck
	CQcxuGGG3bnyBVjCg4glMOC9zxYgCkk2Jy72yEsNbtjAFQ902vHiKiiTG2oxAV1b0rJQHEUHUU3
	o3EqE6tIHY+ID3RAZuUKY0b5lavLAE56X1HvKNrCuZvaN4V23aCnBAV1LlU5F/bScqJ+dKWmTBC
	ezX4wxlqIZN0iraFCo76fWVBig8Di9CsHx390/xmhMrQfq6oA7FSt0nayEEud5X23St4IRxOenI
	rdOO/cPXwJdwbmHb5KCWjG7AXtqqCxgJsZdFJmEwTqdsBWFoIUZmsphN91sQs2vks1Zd0MtQn1z
	ovuQb9SRWJVaQG2BVbHVvxc+Ma3bKhN1t7wH+I3ohJ9lyPjzMCiE3RyNyr3wNDg==
X-Received: by 2002:adf:f012:0:b0:47f:4ba0:6950 with SMTP id ffacd0b85a97d-47f4ba0699fmr3452109f8f.2.1784100760954;
        Wed, 15 Jul 2026 00:32:40 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200::dd7e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464b7e22sm13804386f8f.25.2026.07.15.00.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 00:32:40 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 15 Jul 2026 09:32:39 +0200
To: Kuan-Ying Lee <kuan-ying.lee@canonical.com>
Cc: Kees Cook <kees@kernel.org>, Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>, Shuah Khan <shuah@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: Re: [PATCH] selftests/seccomp: Fix pointer type mismatch build error
Message-ID: <alc3lw0ubV96oaJK@krava>
References: <20260715053559.28535-1-kuan-ying.lee@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715053559.28535-1-kuan-ying.lee@canonical.com>

On Wed, Jul 15, 2026 at 01:35:52PM +0800, Kuan-Ying Lee wrote:
> We hit the following build error while running the seccomp selftests in
> our testing.
> 
> CC seccomp_bpf
> seccomp_bpf.c: In function ‘UPROBE_setup’:
> seccomp_bpf.c:5175:74: error: pointer type mismatch in conditional expression [-Wincompatible-pointer-types]
> 5175 | offset = get_uprobe_offset(variant->uretprobe ? probed_uretprobe : probed_uprobe);
> | ^
> seccomp_bpf.c:5175:57: note: first expression has type ‘int (*)(void)’
> 5175 | offset = get_uprobe_offset(variant->uretprobe ? probed_uretprobe : probed_uprobe);
> | ^~~~~~~~~~~~~~~~
> seccomp_bpf.c:5175:76: note: second expression has type ‘int (__attribute__((nocf_check)) *)(void)’
> 5175 | offset = get_uprobe_offset(variant->uretprobe ? probed_uretprobe : probed_uprobe);
> | ^~~~~~~~~~~~~
> 
> get_uprobe_offset() takes a 'const void *' argument, so cast both
> operands to 'void *'.
> 
> Fixes: 9ffc7a635c35 ("selftests/seccomp: validate uprobe syscall passes through seccomp")
> Signed-off-by: Kuan-Ying Lee <kuan-ying.lee@canonical.com>

Acked-by: Jiri Olsa <jolsa@kernel.org>

thanks,
jirka


> ---
>  tools/testing/selftests/seccomp/seccomp_bpf.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
> index 358b6c65e120..0622bc2acad4 100644
> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> @@ -5178,7 +5178,8 @@ FIXTURE_SETUP(UPROBE)
>  		ASSERT_GE(bit, 0);
>  	}
>  
> -	offset = get_uprobe_offset(variant->uretprobe ? probed_uretprobe : probed_uprobe);
> +	offset = get_uprobe_offset(variant->uretprobe ? (void *)probed_uretprobe
> +						      : (void *)probed_uprobe);
>  	ASSERT_GE(offset, 0);
>  
>  	if (variant->uretprobe)
> -- 
> 2.43.0
> 
