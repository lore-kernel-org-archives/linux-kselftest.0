Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F36A48C3F2
	for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 22:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787781657; cv=none; b=rbJoXZCqxVy+a1cl5zbe+KwYHZUg1rc51LAa5+yvAVwoNJwnCdLp75LOL6cmy3rXgzGomSL30qcQMFQcUHXcPS8WfMfRXSmCzQO5SXzJA81li7SuFHH6oPQHz+6nF/eID/c+8cj+nsgtFuc80QnYtjZ93YZBuX31beracHNGMqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787781657; c=relaxed/simple;
	bh=pSMZBCmZdwJl2+Tztwxeju0s8pHDF5EDzUK6p4kLR4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FIKQ91o1VsrjIAZb0o4GQSI7Rgz+/C2Ql0zEjcYgioHJM8OQS35OQuFmpLTRd5VABzhNQ/CDTUDmANPX6IOatUISnNfdxnex1l2wSMvpiJoLAGdV8Mk13nsCB+duLMi8vkx0JZf6n4I3iptXTy79QbRObj3G66O7rg6G+E/V7KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=eaRZT37A; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="eaRZT37A"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-90cd0e6fd80so6133166d6.0
        for <linux-kselftest@vger.kernel.org>; Wed, 26 Aug 2026 15:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1787781652; x=1788386452; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ccSJiEqmW9tfbUwLonoOgEZaq7ANVD+gHAZIRsMNs9E=;
        b=eaRZT37A6jBytfzoQposHJsFeT+uwM4hm6vGLK3ad0pF6e/5kNVd3nPQUzoCFYXNpb
         Bz+aqgzHEvmLsHPRsfMQ4jRO/HktmTNolI/I4m4iouFsRWeVHI3ULDZnRQytmvY2icwF
         gQhkEH/lJFOwiHrxavLBxpG+QgIsDr6JAF6cSYUb56sZzXSNjqyvtP7EZB9BsWMa0qWB
         uc3+4ituK5VJJ7+QnK0k3Ib5SCMgLX08GeqePxSs+5SQQuxix2586q26oHDrOwnV1mr8
         jg0CWZ9XBf4fj+SqqZBF4rG08vjnN+amjCt6dt1bwB0WA43t+8IAXZbC3TFErajjSMD9
         TxKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787781652; x=1788386452;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ccSJiEqmW9tfbUwLonoOgEZaq7ANVD+gHAZIRsMNs9E=;
        b=lbXpI174ffZCVmNlPts9uV13thgBNYfFRPoQWfoGCQuvm3Hi3nbTxHNgTRDvRX8C8m
         qaV9KIo39rQ4OUE0nMa5061zqvrZT7zgotSKF/r83uqB9WdyqA94dsfO1Vh8y7WY5HzO
         4Pc92ywZuTdg2DKBkZrj5eHRF45klMaSEw/zTwliKWS1XC3ZU9jsWUPb2ByUlsJH1QKh
         AIbcbf2WNY07Mj3SQgxzfou80u9W/gTJk6DufDJ5mGRFx/LV5xBmCPViF+Ka0E4FosKN
         b9zhAZz7TkDTIdsKG42o0nznTc4zLcJsbEVMzgHttsQ44WJcRXzCwXL7wc5BSNkcMA2O
         EveA==
X-Forwarded-Encrypted: i=1; AHgh+Rra6YzSLcFWEUy/IHzilo7LH8pfW8HxksrnDyRXGW1pAVbZJxmTgTrU83H2erf2XOE/zSPWz+Eau+Jp7CTT/As=@vger.kernel.org
X-Gm-Message-State: AFuF++lG8UB03xrRgHk3E2e85NPvd1k6Kz0H3ihs2vIHr9N1hxi6+ONi
	MoHLuZX32LGkDph+vnpfbXKwMKQ1oFaOng20l1FkR2St0a9EvJmE2erV2N0tl0X5+c7yVX2prOY
	g5szbw9k=
X-Gm-Gg: AR+sD12rUeOBQLzw6p/JZ/RTZPWX5QbG5R0i7TIid1QaGdrEnCqnF1ulfkAg/VSAJi7
	uaAqoAuJ8ENzym0Pg7FtMjXDEAFv7CmAwUhDBylI0KwvhUICmiR6lk7r1rM1+1HbF3Ajkl89Y/e
	/AbkoFFtSaBfpEj212kAQT46wMCkcclezGuD+GOvejIZL6+5BtmTsiFk0TG7l2whhNCXNInGP3B
	aRmuHwnxevNohGMkLaO2q0xVy9fOFiy42q+RK8ifKUlAimusIo0dAlNTQCGDDd7ZksV8jb1VVXu
	/EcO8R1O+wTEGzTFxN1X/gfovbSWVIytHCYVXS1ijyILIOeHGVF05IrwJoIWQfgaZNvX/bMzmu8
	9luCnNRFtbTjXs5sp9EEHfsKbngFqVqbGUI++lqKALUrTHZF0fYW50nv0+Hirsf+1+7SNgbCIbs
	bmuk+LYaggnQXitlPLLIF9UFey2SoKHkzq12Ebdpf5yBO65i/tbWDrZpWU+KrZfoIrsWypxLJmm
	dg9VpigfUoQGnPd4df1FfU/nDwfIdqIO5I8PrZ9dtmF
X-Received: by 2002:a05:6214:4606:b0:908:9c82:695e with SMTP id 6a1803df08f44-90cc77d3a9bmr140900116d6.0.1787781652321;
        Wed, 26 Aug 2026 15:00:52 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90cd70287besm991216d6.12.2026.08.26.15.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 15:00:51 -0700 (PDT)
Date: Wed, 26 Aug 2026 18:00:49 -0400
From: Gregory Price <gourry@gourry.net>
To: Christian Loehle <christian.loehle@arm.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
	Rama Krishna Katta <ramakrishna.katta@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
	Gregory Price <gourry.memverge@gmail.com>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
	Gabriel Krisman Bertazi <krisman@collabora.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] selftests/syscall_user_dispatch: Skip tests if SUD
 is unsupported
Message-ID: <ao9hq0iaN2leGrpf@gourry-fedora-PF4VCD3F>
References: <cover.1786965107.git.christian.loehle@arm.com>
 <65c35ccbc7db2de2cb600439874e585775362580.1786965107.git.christian.loehle@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65c35ccbc7db2de2cb600439874e585775362580.1786965107.git.christian.loehle@arm.com>

On Mon, Aug 17, 2026 at 12:16:10PM +0100, Christian Loehle wrote:
> Syscall User Dispatch is unavailable on architectures without generic
> syscall entry. Such architectures return -EINVAL for otherwise valid SUD
> prctl requests, causing sud_test to report failures.
> 
> This also prevents bad_prctl_param from providing useful coverage. The
> unsupported stub returns EINVAL before argument validation, so valid
> operations fail and requests expected to fail with EFAULT return EINVAL.
> 
> Probe SUD with a valid disabled configuration at the start of each test
> and skip when the kernel returns EINVAL. Preserve failures for unexpected
> errors and continue to run the full test on supported kernels.
> 

I suppose we should at least be testing for the EINVAL when not
supported, so this makes sense vs skipping the entire suite.

> Fixes: 179ef035992e ("selftests: Add kselftest for syscall user dispatch")
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

