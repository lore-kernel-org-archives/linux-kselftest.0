Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867836;
	b=uM7CNIbgeBr5/LttXarkWqJiOqRXkdpBpMmBginZus3SltCoiNE9orEShfdPc1tQkGV7
	 Jn+hqAoHNer1XlPQnUXKbr10iFwVqrxjTvPbQYnDLlJomNBbQLLjI1bpYMflfykNRhDdM
	 gLQYerF+dBwa2gp8AI5ByqQiV9KXFQd2Iqh5dzlAhRLAZFA7rU2852+lMXy9HcbATdMmY
	 ZcEkNeNPeDmd7UfbfqOmmtSfOBWUFZ31Oc6089/MwrdV4sn4ZiSJQw/mIa7RoKTtsfvAv
	 0X90TuUxI9tNcYcwfhZlF22FSECcWZAp62hG5GB6x1IpVpeJx9g2t8IXH7lUdzFHqCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867836;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=3NU/G0xlaqrO1C6pRG/U/VFMHzB1bgOCQipgiOlTFyw=;
	b=W9wb67/CYMDq9/S4koRDV5r4U7VAbSi7IEZoFRpVXjMPr+JVU8WTCEqFzWMQqW17FkFB
	 0X8cx0UfUr2xIXdceYEEnSOfqUsODdnd6NXdNBZwgBxZK/DFPyHyuMyjBrUnY7uVE/SKr
	 KpAu1hg73aVzIonXhEceA3CWyYEjPyiZIQai1I36vh+ItovKAjD3jCgUw2W6I5bpIYfXv
	 dsECWZz7r6A9Y/riJ7Lm3jfZ+6sPXxUieffKkHPkPPSU/ZgptxX//RuQYamhetWxT2pGo
	 jHqLvlunMW2T4DKfH/PIODng/pIkciezKOA0br9v0HzWeuDIsWCjV9tfyQ+k/1U9M+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TCd7OApu;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CA7606A31B
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 08:37:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3CA7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TCd7OApu
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so16917825e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 00:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793867834; x=1794472634; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3NU/G0xlaqrO1C6pRG/U/VFMHzB1bgOCQipgiOlTFyw=;
        b=TCd7OApuoL5e3stS7D1Cly3qhe5s15objHkahbF02Otwe/HfYG0Lej3tHT+vvUg9fX
         wM7/rDK0ZKfkmIKirGxQ4lCbjDhxdGdeY3tFpTNzaQ77gZIvgCQbEVQnLYSoAtRd/F0B
         B3P1GQCvO1Ey7jnj2cNDru7e/V3p7HMD+mzycRvyeaEFiOSwlimL84H/o+T+Sa7HeYX2
         947109hybPJgL421as69RaLomQaFhr95brhMHrb/jbGJdfW/+OsFTyr4iOavfSJAjTq1
         /9RC8ylZyagig84Z8nnznPCc2Fzl/McnQn0vWxi72uOtuqDts7dZxdxnDXtW9AxgOA1e
         XQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793867834; x=1794472634;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3NU/G0xlaqrO1C6pRG/U/VFMHzB1bgOCQipgiOlTFyw=;
        b=Gj4bS7J7rY75CKP8HU52fIYXfmiA6I130R9vVhbf4CTWonVcyzCBbxN1sXBZKKdAQZ
         tGTrL9m3LMn6Z3mk4w2zh7QI7oyoyuo/kr9w73sOM6ohbh+iM2H+A0SPHLaOSubOPowN
         jQ4IaDohglKj2TpU6ahhcnwDVlRcy93Cyqh8CS/9IoKFB/eoSrBJsQp0RhlCz9ISAMRz
         VXAH6PqgT5I+QY6RYQyRpxIG/3Dlep8s2X66xl0YXFnErG5sJNZfzYPdU2x3QJykHXIn
         YryKqQ65AJXUB85HWcTUvHKZXWTd7+Fzo7K0JI3ULIYQ5vCMM2eAlDm9BBsnplaHDjia
         Qb3A==
X-Forwarded-Encrypted: i=1; AKwUvBz9GzsdV5T6IEUgckyZy23+/Rkpc7jk9Ao3bwkPJCpGFmFJsJ3I9dUqQE/iz+un6Fpn4g0l0iPxrDN8eoLyGGQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PBUETYSfeEuNtQ8UwD6Ao5a2i3iQUNJkqpoC2HSbplR8ml+ww
	Cb1ZkjvKcaPWIWvgAzNupok9a4J2scC6odCnw77HzDyNN9lMrk4uZHj0
X-Gm-Gg: AYBFou1+cMKnl9qk4aGT4NA1uK26dfI/QLHuW4Xt4T1s6BycF7il5IQwhe+HxL4rezS
	7ovNF7pC3v9F0X8IsikqvVNZM0HR56FQGT2iQGmsZV9OPeFvbLOoKOZgVBZimb5ipmf6Wfh45eA
	W9zyQstcEdlpvgqm9/lFA8RhEkXZEBtxpmuxNdYrvh/36FGivteVuV8me1z5lcpDACMU+PfMLoH
	AT+9DjtEEUQ4b80twU9gaR5o3BxHSe4Y3ECfEZ+yhpZgit0FLNkil2Ps/MtG8zzzCBdCX/pXxpe
	3BJ4Hf5gLczsIU/7a52PkANawZ74OlfmUVuKcF/uhyhif3d5Rhz7AkUfCynUda+fZselfqsTOiR
	Bpxb8USVsJgkqSsU+rwIE4M7kK3DDlNs1CvRarMRrG9ZWA+e40ZX1IFlDCNVc5ImtF8RfkVeh1s
	KaN8jYxV1kL4Nj3tRI6VMEiNzTqZNHY9UqbM0conbylMISwiaiIMPt2Lvhz2L5ublBMarvvAr3b
	HHa27l1aEywny4oL3A/UpmrhcBK/r0gpJJ1gLsRng4CJgqBkqB1Hn1sLAiIr5AHV4YeRK2Td6DP
	NQJOyFTWf2ASjezRXS5Kt68BFa1Ev2CL5QSwBKyHXqiq8clcvb7JX6uUdDvfYdXr
X-Received: by 2002:a05:600c:4e88:b0:4a3:59c7:f226 with SMTP id 5b1f17b1804b1-4ac16bc4713mr417554995e9.6.1793867834333;
        Thu, 05 Nov 2026 00:37:14 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57317cae5sm75471835e9.12.2026.11.05.00.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:37:13 -0800 (PST)
Date: Thu, 5 Nov 2026 08:37:12 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko
 <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai
 <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi
 <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
 <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to
 /proc/kallsyms
Message-ID: <20261105083712.14847dcf@pumpkin>
In-Reply-To: <CAG2KctrY6GmVqsKP+fXYCsL6wDR4zp1kdRd7a7uOdCgg_JcMdQ@mail.gmail.com>
References: <20261023001603.560210-8-wusamuel@google.com>
	<20261023001603.560210-9-wusamuel@google.com>
	<20261028134012.01d52e94@pumpkin>
	<CAG2KctpGPHo-S3AEvBhK5HPUnDHfoJu6Z-r+cS1hQ4Ps=B3DmQ@mail.gmail.com>
	<20261030100215.6f8e0d4f@pumpkin>
	<CAG2KctqdPq6NmK6rB13s2bgM7kP2w4OMMy2hdp_OFMVYYhTnZA@mail.gmail.com>
	<20261104142307.431fc12f@pumpkin>
	<CAG2KctrY6GmVqsKP+fXYCsL6wDR4zp1kdRd7a7uOdCgg_JcMdQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 4 Nov 2026 16:05:52 -0800
Samuel Wu <wusamuel@google.com> wrote:

> > I think it might be more sensible (less pitfalls later on) to return
> > the symbol number - not that of the next one.  
> 
> What pitfalls were you anticipating? If the current symbol's position
> is returned, userspace needs another ioctl() call and an -ENOENT
> check, to learn that there are no more matches. Alternatively,
> returning the next position means every call pays for a look-ahead,
> which for an unfiltered query walks the module symbols even when
> userspace only wants the first match.

I was thinking more of the kernel api.
The 'position' is just an array index.
So a 'read by symbol name' would return the array index of that symbol.
A 'read by symbol name index' would return the name (uncompressed) and
do the lookup (binary search and linear scan) to find the value.

I've used a bit in the 'sorted by name array' to indicate that the
symbol is a duplicate of the previous one.
So checking an 'exact match' for being a duplicate is cheap.
But for a partial match you start needing the name buffer to be in-out
on the read-by position request.
So you start needing 'read by position' and 'read by position with
name compare'.
It is likely that the caller will need to validate the name anyway. 

An 'interesting' idea would be an ioctl that returned the value of
the nth symbol along with the name of the n+1th.
That might get confusing though.

David


> 
> Andrii, do you have a preference between the two?
