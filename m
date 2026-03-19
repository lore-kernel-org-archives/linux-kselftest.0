Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6930C3B19A2
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 11:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773918298; cv=none; b=b6yVK/fjziAWYrpiAjiOXdKLhURdkr+T0qvzJ8tDGMIODfp22/+C6osvLj3PPLQ2mUV2QSvoeG7Bs/cFFd0zPVbgd+nO3MeRK8MP0905KJVTayYs6jPOLFIDb9oAtMxV0PtVUNt9TOuno5/srGhCqy1of8bJnHkxF2dhKgVBrpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773918298; c=relaxed/simple;
	bh=1Bf8hEc28hXPuMHfJ5X9+M/T8gNJcK2S392R/vHPZnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9/jh3PVX2E9ewJ3HNNuFFKsqmB8FiPNGEIUg6ED3dBkZZ4v/KmcF17I/Pjl763qarEVx2Ifbf0zjv2huhYid4k7Xrto++e4wkpq7zoPE+O8HyES57Sy5ZkrD9qfqQSPOHvZ3BgWICqbBg4xwSPl5rWUGq+vD9TEz+GFylGQgMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=INJG7fmQ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="INJG7fmQ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so8489645e9.3
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 04:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773918296; x=1774523096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e4c37mbwDiETLi9rFX7FTGZ50jj9ijci/rDw/K+jJUg=;
        b=INJG7fmQ9XcVQ1GNpOKE+8YTOoE1uHV/MwPQw6Vw9IXFp+cYna4CIlvtQfFrO/9YdQ
         YW3OCZYeeuE3Y/457yCYbLgKy/wc1k4LR42bIt0frPSzbJUo1E2Iv7ZdSDfDQnrBWWsx
         SJO0qtMjAyiDZMFLSpaKrV05HZpQtXCYdT8e8pVWasT1sXnxs+6cw7LmzvUWxUaSYJZm
         5vKuxsJJqEBobS12jL+lZvvvEhaVjbhS50SZI9LdypTtjQ8h7GXj23g6ZFdNpPMsRGG4
         1F9n25MeMRMbISV/zEz+9tHNBFxOoaZTeON7Sf6PE1YJK7trMmdM7DRxgZLZewtI/Pbf
         ioeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773918296; x=1774523096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4c37mbwDiETLi9rFX7FTGZ50jj9ijci/rDw/K+jJUg=;
        b=Buvv+cfQiYGLpuqePMoB4php45ZbIlKVuvSRpDiFTjWDOAsjrSc0WKeqz6HYXVBdSt
         9oMNVzWnc45sWeyGZECtfwSx9n6zCzmzF7X88VjF801oP6qFCChheG8e4dqv1FC3i9KP
         8tiiS9iyOncRRRNZejEDZ7kAArrlLZ4smj1FMOXsOpcUKAcjh1yAI94euhDXiMKC/iCm
         DCx6dVlvyVYTBnN+cy1m89LFbgbxEQeMUZtexxeJJ3gRmGIw8rwCuW8HQUPYBitNOYWZ
         3ywPoUdO3IXX8zyAeLaCEJ7nBI8reXXHWI89KA+5vE/KEeOklNZegeK/MNkTRpUG9/WE
         4D0g==
X-Forwarded-Encrypted: i=1; AJvYcCXB0XZY+TZLfPk5Q70qFaz5/hUH/Mo8kN/sy4Yz+BHk5QALuBr/PxzOYNtMSpsBuGmaLyACTILIFNUpVguYuS0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJu0ZvayEwt/wS1oo1evJO7vIv661BGlBD/ovZyd5Ni56Am3Dj
	YUpI1ddlhbRhI/Zwv82jFFlK1ErK148TYJbXu9714U5qyzbz2Md8Sv27
X-Gm-Gg: ATEYQzycgFSPIiVnZ/+5zw2rox7UsoSAEHZmFlX88Y3F7eZ+EhxAbvmRHLk4BCIVPi+
	qnFO7LjfuE9lwfOYQ9O6Xh245xMz8zjkUMhRhxX6pBuUXA0Bf6AcZF3lVmp9ENdiesfmYkvlQdw
	ZKcGROGcwVtWZj4yO+/+/SaAIptfxUoGbfSfzpwkeEHpI0+oj8s+vtPEEd3yQBqpP0CMngNxqhT
	SNPseXOmtidHdvWWJIwUgXHpUrIzW0/vOYPURrJmOrdr7VQQRXtY4ybbgXYU8H+YaxuQD33MW0K
	nYqWV+m+y1GZHtt/ld9p1SXsDPqKOhqe2eb3v5S/qlasSFhA1mfsLi99w9+NjDu6skmRrL0K+dg
	QfIkNV3Su1BKWVR35t79kZYZ7rV03DNWFIvmKGJQo5INdZoF/g0Rex3fVyGbC/X8MnQGE67zxY/
	j+bFWWx3hFxpOA2OzyYHJuG7udw+jljQlX+fmIyxDXyumrWek4auYNTVDlAs8MPLni47sM95djb
	WyhrovuKR/CFnjI0xmTz3BTO0vFpEJFE4grxsyKGODGBc//dsPHzJDxMt1Qd7zXOUWErBE2XQ==
X-Received: by 2002:a05:600c:4685:b0:485:40c6:f507 with SMTP id 5b1f17b1804b1-486f456feb6mr116918225e9.30.1773918295491;
        Thu, 19 Mar 2026 04:04:55 -0700 (PDT)
Received: from mail.gmail.com (lfbn-ren-1-685-61.w81-53.abo.wanadoo.fr. [81.53.253.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fb59678csm16217465e9.0.2026.03.19.04.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 04:04:54 -0700 (PDT)
Date: Thu, 19 Mar 2026 12:04:52 +0100
From: Paul Chaignon <paul.chaignon@gmail.com>
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	shuah@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com,
	song@kernel.org, yonghong.song@linux.dev, john.fastabend@gmail.com,
	kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com,
	jolsa@kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests/bpf: move trampoline_count to dedicated
 bpf_testmod target
Message-ID: <abvYVE-CJcmRypCR@mail.gmail.com>
References: <20260319031227.330505-1-sun.jian.kdev@gmail.com>
 <20260319040337.366375-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319040337.366375-1-sun.jian.kdev@gmail.com>

On Thu, Mar 19, 2026 at 12:03:37PM +0800, Sun Jian wrote:
> trampoline_count fills all trampoline attachment slots for a single
> target function and verifies that one extra attach fails with -E2BIG.
> 
> It currently targets bpf_modify_return_test, which is also used by
> other selftests such as modify_return, get_func_ip_test, and
> get_func_args_test. When such tests run in parallel, they can contend
> for the same per-function trampoline quota and cause unexpected attach
> failures. This issue is currently masked by harness serialization.
> 
> Move trampoline_count to a dedicated bpf_testmod target and register it
> for fmod_ret attachment. This keeps the test semantics unchanged while
> isolating it from other selftests, so it no longer needs to run in
> serial mode. Remove the TODO comment as well.
> 
> Tested:
>   ./test_progs -t trampoline_count -vv
>   ./test_progs -t modify_return -vv
>   ./test_progs -t get_func_ip_test -vv
>   ./test_progs -t get_func_args_test -vv
>   ./test_progs -j$(nproc) -t trampoline_count -vv
>   ./test_progs -j$(nproc) -t
>     trampoline_count,modify_return,get_func_ip_test,get_func_args_test,\
> kprobe_multi_test -vv
>   20 runs of:
>     ./test_progs -j$(nproc) -t
>     trampoline_count,modify_return,get_func_ip_test,get_func_args_test,\
> kprobe_multi_test
> 
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
> ---
> 
> v2:
> - rewrite the subject to describe the change
> - resend with the correct patch content

Please increment the version number when making these changes. Otherwise
it can be quite confusing to everyone. I believe this is the third
variant of your v2 on the mailing list.

> - resend as a reply to v1

That can also be a bit confusing as it will fold the email into existing
conversations. You can instead link to the previous version from the
changelogs.

[...]

Paul
