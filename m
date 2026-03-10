Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A3A36A01F
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 08:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130725; cv=none; b=f0fcSgQmVZYXoDmcaEYsnbAbwUfskRp6kNO+mY11abGoBUKf46wwo22WBVPzDOZRaICtrLZC7CPsFnDJ+tLCN1n4QyUVujNOtLiMEw58w53AJVbaJBHV6Ojq4Z/bMsncJY6qCNguSha17nJy9S7hj60V8RbecG5q2gOx7+OqT70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130725; c=relaxed/simple;
	bh=xCl1rnaMhAH9z7bHXYuVhFnExh+PVy67RyhDSXdt8rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hCquWe8BvWBO5M6or1ipoDpfeyWYn6bXWml55SO/aE/TYg0/DBZs1h2UrJPinLIbVWKCVPKNn7eRHHtbKiMhqlNv6ja3ly8edI/e9L0+mfcj7r+eThmguH7jmFTxIcvYtMt5Im8JinxrzichwPN6H9BiWARoKscgDNzR3kJm/n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nDG35nE6; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nDG35nE6"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439afc58ac7so9853550f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 01:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773130723; x=1773735523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dycVTiQonYLmHwRlbFRJNUne42yx8K6NA3MzPE8Q6Fk=;
        b=nDG35nE68Av39/rf0dvGe79OqMlptF7mNThFbHqvEtJ0qcrkp94ooc7QrbAau3RwYm
         Ti7QR7q5lWbzgYYgZGNDTkSaxw2CGDhXdPTfW/SSCNsDZ1QV2wf19hCQRleu04B7Uu06
         GmtrH7WGawgKkQgHJbx5k++xztzo5dI0kV8OS+agpuNzmzQMOEMvRQn/2SGjcwJkE0kF
         8SHrjlcqPBNxWpHenSvdO8HPseFeRw/bEI+hX2kwuIyqCcnYcOL3aMnuqC5a7ihrOYq1
         gfovMxgyn20OjSfEnG+mkZUGuLOrOiRvZiMUzj8k1yWsyYWYergcanFQfiIuyB/jr+Lk
         347w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773130723; x=1773735523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dycVTiQonYLmHwRlbFRJNUne42yx8K6NA3MzPE8Q6Fk=;
        b=eno2OKW6K0E/nwj5cfKBIZoFkkV6TqoVzQCbKni2UjFKR561USVBA5O2E8j0XiP5cb
         2anikrTyb+SixZwuBkQjucpSG05LgsyBXhvj85PJE2phrXcDsbWLbkHFuiFVPKOc6IO0
         bbTggUyIHdjUOpsTzuEpKhGJ8/F2EkgMMQLsw2237PL7YGgg1oQ1giTHmNcNaiSQkmhS
         t5qysraSK/G/JAO3xtkVAsvAr0HvZb+DGjeu+6Sw0/649vM8HQ5GKqwKL7NU5/9Rmq0T
         F+ganJL02HHqndiuZBmsmqf4NVqmxGcDV6/ICNKhjtvLeSBv7FKkoNas0AiFZ+jE7j0i
         jHwA==
X-Forwarded-Encrypted: i=1; AJvYcCUs+hynDZ4KmP6wSM5f9QjLzDtOeznljFjd+94DgMOUJ1Yvs0wEPSvld4Br3jUje6tMFfoP8XvajGFmq6CXl3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfcgBStK4OxQrI1OSxcSh7IC7hJszf0oLUUkDH+OKUZstXQuNX
	14As8f0/SHeHLzjcXp2bBIYYdBT21X94tLmO+5/MyW8imoIb26cf0cDe
X-Gm-Gg: ATEYQzy6gIPNrPpQgt9PMUFkhg65mfaylcv61g22YEQTo0M6/Bb4Qo5j8vvfxlemFcg
	NrwG9hyG2j8lKku6BN2791rGXAIkTFWRhuYUWdtXXBXW79VSSESHLapjKpHP0slJGWMXoeG60gX
	UfRCrRo4F8FUVT7YyMFrD5sAGAU9h6yfDrl8QWcpUUzI0DgFhBc43QogULskPzF6qZsgn5cZNdS
	U9G2UmACD/4eI2uFleyB2JtQdOQuD31SkXfNNJh3Co1f9QFaltCwfi5LJbayzijCGJoSxQnMbQu
	pPYs4tr1B1IsuHSsKYdnPvB/BBzaEZcLTLJCq19j11vh2QHD/oEsS0KgfzNyDApwzA4AaaHqtb3
	wtYsDyKzrttCzQG4UQv2DWBuM6oNSlxbVSMRyPcaTA69+kfus0Au7IOGbATeWOdNJbvRNV2M6hZ
	j+MTcmu1+9WOLbvdkP
X-Received: by 2002:a05:6000:2012:b0:439:ac6b:dd64 with SMTP id ffacd0b85a97d-439da892019mr25524607f8f.45.1773130722588;
        Tue, 10 Mar 2026 01:18:42 -0700 (PDT)
Received: from curiosity ([80.211.22.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8da01sm35110976f8f.1.2026.03.10.01.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 01:18:42 -0700 (PDT)
Date: Tue, 10 Mar 2026 11:18:39 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: thecharlesjenkins@gmail.com
Cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>, linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] selftests: riscv: Add definition of BIT() macro
Message-ID: <aa_T3_IySAj4_Xwo@curiosity>
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
 <20260309-fix_selftests-v2-1-9d5a553a531e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-fix_selftests-v2-1-9d5a553a531e@gmail.com>

On Mon, Mar 09, 2026 at 06:52:10PM -0700, Charlie Jenkins via B4 Relay wrote:
> From: Charlie Jenkins <thecharlesjenkins@gmail.com>
> 
> The BIT() macros is used by the validate_v_ptrace() test case, but not
> defined. Include linux/bits.h to pull in this definition. To ensure that
> the header in the kernel source is used, add tools/include to the header
> search path.
> 
> Fixes: 30eb191c895b ("selftests: riscv: verify ptrace rejects invalid vector csr inputs")
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> ---
>  tools/testing/selftests/riscv/vector/Makefile            | 7 +++++--
>  tools/testing/selftests/riscv/vector/validate_v_ptrace.c | 1 +
>  2 files changed, 6 insertions(+), 2 deletions(-)
 
Reviewed-and-Tested-by: Sergey Matyukevich <geomatsi@gmail.com>

Thanks,
Sergey
