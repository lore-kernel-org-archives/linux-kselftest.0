Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C923B2FC2
	for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 08:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785399959; cv=none; b=ZMuMiLFKal47rcpP4/IcHR+CALkqrtSXxja3xbajK1344oXdIGjuA7jQ/gTZ0zckX0wq/X0KdcKjTbOHCETYU7IFZN2CEhEjI4xCB/kffjBqwnZhyzFpSsGFmIEtSQEuV3UDBvLNfiqldlY5Bbs/iHHrBoSGSKVJkQqP5uqY0Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785399959; c=relaxed/simple;
	bh=C4Dp81+yrf8RNuNIOEBP8kLYNnF4h2mYnD9L4fn2tnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVjq4zltG9gu/Fw4qh2AvyjnYRThALC+do6ZwBs6UTY89AKdGmJDGg4OaLd0Uvf5VN+R+Yu7lZAppx+xu/kCLWzzc9L48DKT8AF0VVuJNbdjLEb8vB4eHD8/8tPaD0c36PqXvZ93gkmXP1nF0DUN4eoHXR+NAOP9nS4u8LtYCxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YyGmLfRl; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YyGmLfRl"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso12759925e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 01:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1785399956; x=1786004756; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+khihSFp8xIqvD5iaqe5AnFSih+L44scJGPk6G96Z6g=;
        b=YyGmLfRlW4B2nNd4BLXk49a7u1JpGiHkopgEEOcL9UUwm4YzJNkbcDyU6jfr2iLFy7
         o2kwSU5yTioK4mV9hDxv4Qa+or6nbBgd2E0I3jTQqt4SgdZ5BPfaqjvKkR0tbKPTFvfx
         XvU9ssaMb5r+y04cD7eL3LyC5l0GOh1gZU7F8/QrdZm8MEii/2lnTbL6PNFvYKQcm1b2
         JCDnocvX+4z1vCzbGHFcEpy3uXlQ9HUgIOk7Z9ZhIRYNt2MOkHPn5Shmg2UOZmB3PvTI
         1/qH3Ua57tBr4cQ6H7k1f24BsZOYnRqODrgWNHPZ0eptcnSHvV1qcTOw87XY2cz9K/bD
         3YNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785399956; x=1786004756;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+khihSFp8xIqvD5iaqe5AnFSih+L44scJGPk6G96Z6g=;
        b=pOmtMyUeK/AU5L7h7NViWn5J2chWUhelPSBDYqkgybt7PxHkCc+fEcP7jpoO8MJJN7
         IWdDiIdUpiARCK5cVkMrOMu5o+TGVPTG0cNnNyc6fEN+91Eg54X9l+j0Qb0gDLB/DD+Z
         cwiwzY2S6t/inFsz4izh+hA6Onn8tMNHI55B5vGCQthkdFFrQKC02H6YKSmfkbhzGIBH
         5RU18FQhuu2f4UOnzt9mK22S0H0MD3HOC7+Bi8kR4jvTCSiIGA7YjzJGRFE9zENz6MHJ
         YSTHGY33eBW+Q+UsE0VBpOM/tzSt47batK62kZ9K7e2I7GhDMMlF3g8Jc9HiVQCuZfj1
         MOlw==
X-Forwarded-Encrypted: i=1; AHgh+RpEdVV5DlNZgnTAs4KYt5PaAUuu/S6fSXrEsToYdC9EqFoYmW/rtwqqJKSDWik02XKIFi7W/pP5VbtNptJc76E=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqeg+4FtKGypSf8BisM2UHM4uVn/aXygH9sg4/23+GFSGHYrnj
	kYoPH7c5zVSmCh+bs2pp9Ow7hZ30X+AMkKqme7qmAedu4SZXh42voTMimmZhmX1K7RQ=
X-Gm-Gg: AR+sD11nYX2YtF+v0OUwAkPeEO/tSTj/SO42bW6pmxUxrUiHP4gNFYR3tEGAjCFJHLk
	S1QEMHwSUv87ZynR+jfPQV5xaY82jYNuNbEGg30hhjG3Qj422ZlpML4WabX1CGl/w7VagV22X+r
	ZMC8NX9GWvrQXhoHDv0h4mmBcvxaD9JvPDuLMMVquc2LsZGrZ9dF9lhIqeF5cykFqL/MHnNQJcs
	KUcyr/lPvwdQhiFOZrVihB0nNN/AGBuWCxvGGqfzFHMdqXSqgTqVY9xQYIk0nFwmsTD3XDpwvzt
	j6fN1Q0rNozyxKWnc+Hreeja0/JlaE0k2/eTI00WbtZswF9M+Vsi0byYgB5bNQj2oVDmU4ba5dP
	KB94NG59Rgg2/MvQpCRWIYXlaMGAJhCaif65hVvIsI8p6SPsxhSqYS8UedahU69Y1DG5mskfmL1
	rqyZJCGkH8/D1yAfnfa6kcQ8AnSyrowBADisjzRQ2iZB77cYuaiwxf7UqV6Neh3wWFjwSfNyuI/
	GweIjmhakaBqZY=
X-Received: by 2002:a05:600c:500d:b0:495:4e17:cad5 with SMTP id 5b1f17b1804b1-49800eac18amr18818185e9.26.1785399955724;
        Thu, 30 Jul 2026 01:25:55 -0700 (PDT)
Received: from u94a (61-227-70-26.dynamic-ip.hinet.net. [61.227.70.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504927a7bsm20164432eec.0.2026.07.30.01.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 01:25:54 -0700 (PDT)
Date: Thu, 30 Jul 2026 16:25:47 +0800
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: chenyy23@mails.tsinghua.edu.cn
Cc: Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Daniel Wade <danjwade95@gmail.com>, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf v4 2/4] bpf: Preserve pointer state for commuted
 arithmetic
Message-ID: <amsJ3D8P46GcsKwp@u94a>
References: <20260729-c3-035-public-bpf-v4-v4-0-8ee297e2346b@mails.tsinghua.edu.cn>
 <20260729-c3-035-public-bpf-v4-v4-2-8ee297e2346b@mails.tsinghua.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729-c3-035-public-bpf-v4-v4-2-8ee297e2346b@mails.tsinghua.edu.cn>

On Wed, Jul 29, 2026 at 03:18:28PM +0000, Yiyang Chen via B4 Relay wrote:
> From: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
> 
> When scalar += pointer is handled in adjust_ptr_min_max_vals(), the
> destination register inherits the pointer state from the source pointer.
> Copying only selected fields is fragile because pointer provenance is
> tracked by several bpf_reg_state fields.
> 
> Use the caller's temporary offset register to preserve the scalar operand
> while replacing the destination with the full pointer state. This preserves
> the frame number for PTR_TO_STACK registers and keeps parent identity
> fields consistent.
> 
> Fixes: f4d7e40a5b71 ("bpf: introduce function calls (verification)")
> Signed-off-by: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
> Tested-by: Daniel Wade <danjwade95@gmail.com>
> Signed-off-by: Eduard Zingerman <eddyz87@gmail.com>

Acked-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
