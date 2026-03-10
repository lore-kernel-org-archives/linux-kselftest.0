Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D444368944
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 08:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773130678; cv=none; b=Sp22/GPyp1hylkfZO2MJ64P5Oq+jePjRYmX7B+Ck+mqVdhWMfDIZrOHPvjbu3D7WkE9aPz0rKAkhXd//4SSSoN6hJAiH5les4rbSQasE2q9x3D+L9/idUdLAyqYspGZIZwaTJVKar045GNO2SDy4K+cMHYGybFaPSpozskTzMFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773130678; c=relaxed/simple;
	bh=YjbCLYKxIgLG4H1rEPcYNeJtnFYaZe6aQavV8w1OugE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lO1Reu+SuXFpmlQC9XnKDBxPY/gVjpUM+MQqNtJ/MUlJ3sXw6qpjM+aiCC6isTg9xB2xk8ZeDaOTkPGD9Gm+ZC6S3ywekAGIkBwgzP0rnxZLEFXWHOCBtEeBt1+gV4KR1O/FGuoDGymyIhqjXjxjXHQmvmKvktfvNL0fPTldKgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iD3DLgB2; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iD3DLgB2"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-483487335c2so104844375e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 01:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773130674; x=1773735474; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MO3msijVzQef0Ud33m7vixv95BaMpuOqd6DBMK2avXw=;
        b=iD3DLgB2G3Hv9usoaY4MxTkJVrP5XYaSa380+Yiqnf0WdlVIZ/Yxz5JGjGKtT7d5tz
         Nyp6I9scOxIlteWhBdwhAvfkAUDJyDveps8HRkrFm2WdvHmeol0OMvgJelhi6/lqAPQI
         l/AO/N1izzvGLEBhGXsaa/Rdb/oeUoexosLD7qCxNFd666eE7XKxx3aKBtaOUkN3vkbb
         /+jRoSkGwz6fvPsWNPDp4qIvM+oiVnatwX2T3QzFs6g+R2ybtAZ3coFNnsch84lVV8DX
         sIlcpHF5qAwIPRJ/ehbYRumaDUzX/UmLaaed/B2Dzf/mk3R1jVa7pBkH6oqprlpNpGkH
         PqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773130674; x=1773735474;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MO3msijVzQef0Ud33m7vixv95BaMpuOqd6DBMK2avXw=;
        b=VWyb54INqhhsbiGgaigXEl9IUaiis8I8984FPSNex7T5wqYxikIPR1Lstqe7YGNkOU
         9M+LFSx/Hb62HAcfgxKLR4MN+F3rHxXR4WCmzYAfpb5itB08+1aUpHCD+2MOYBHqrHd/
         hOn570W2uzxdNkAW0mXnb1Hyyh6BlfVB1UCKA87gP461g0wn5oheImCvd7ZxC0L1EDbO
         ropmC8EP4Qp3TJoGxElvEdavPMVqQ/nUS9wJSLmDfJYyR1odOOSWGnuDUyAN0Xm/jNmY
         IlXSi/RC+UgbXbuPzU02VLikfl0T7L4tNX//pEaaZZTnKG4mxpQoTQ7AkVj3T9cC50vZ
         bnng==
X-Forwarded-Encrypted: i=1; AJvYcCVSOopJQLH9ApPErHy+5G4238afYaMNxHtUh3l98g4Z4oIBrLKN1JrLHqBounCodRrE9WMRUV3xSpxzMpxOKp0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuzrIhpp7VwnuhvBOPLU94L1HYai7RmUB7DG7lP29VQCqcXeSe
	mcPKECAP7vixH/NlRKwFpi4QyPAVGD40LbbCtgmUnaX6gYhUCVYPhonl
X-Gm-Gg: ATEYQzxgo3b0UTbLBDEZBcFXLpf974U0fc36xGYKkrfp1k5wRKvBATlzy/HTHxucv4g
	p0cqZTuYxxxaTpLAtaD1gGdD+HnfgFuwDmEHmyY0xgSwDEgT1aNNl0Wq372ddy/QLmP5VGFYKGN
	kFsuiGgOShpso+wiC56/CHqt+vXgZH4YZxh/JV6wyLk8HVNSi97/LIDK0IIrJt6lXIrzsm6BOS9
	5R45JHLOHkYk5e0ShMvOV3X7zAc6wRljqGiAQzkovWctduDKfon6HZJR/apoPNagkzcfC1j4STV
	tkXHlyr2rID5f+F4f9fA5c7o0g1hZQLOTk49jO3og6IamkIWDdXQyY4eYd77AAzxAaAGjdhP/+x
	M+QQALs/Rs9peyvTK6jnhkBfYyP5LKVt96rYdgOcK5m/YSYZh4x+G9838gr7LTsnG756My5nbCW
	AR+oZk0N8uZ4wNJtFv
X-Received: by 2002:a05:600c:c107:b0:485:3eba:ab96 with SMTP id 5b1f17b1804b1-4853ebab021mr60513855e9.3.1773130673962;
        Tue, 10 Mar 2026 01:17:53 -0700 (PDT)
Received: from curiosity ([80.211.22.60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853588758fsm109596125e9.4.2026.03.10.01.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 01:17:53 -0700 (PDT)
Date: Tue, 10 Mar 2026 11:17:50 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: thecharlesjenkins@gmail.com
Cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andybnac@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>, linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] selftests: riscv: Add braces around EXPECT_EQ()
Message-ID: <aa_Trj0T53wMjKfk@curiosity>
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
 <20260309-fix_selftests-v2-2-9d5a553a531e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260309-fix_selftests-v2-2-9d5a553a531e@gmail.com>

On Mon, Mar 09, 2026 at 06:52:11PM -0700, Charlie Jenkins via B4 Relay wrote:
> From: Charlie Jenkins <thecharlesjenkins@gmail.com>
> 
> EXPECT_EQ() expands to multiple lines, breaking up one-line if
> statements. This issue was not present in the patch on the mailing list
> but was instead introduced by the maintainer when attempting to fix up
> checkpatch warnings. Add braces around EXPECT_EQ() to avoid the error
> even though checkpatch suggests them to be removed:
> 
> validate_v_ptrace.c:626:17: error: ‘else’ without a previous ‘if’
> 
> Fixes: 3789d5eecd5a ("selftests: riscv: verify syscalls discard vector context")
> Fixes: 30eb191c895b ("selftests: riscv: verify ptrace rejects invalid vector csr inputs")
> Fixes: 849f05ae1ea6 ("selftests: riscv: verify ptrace accepts valid vector csr values")
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> ---
>  tools/testing/selftests/riscv/vector/validate_v_ptrace.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)

Reviewed-and-Tested-by: Sergey Matyukevich <geomatsi@gmail.com>

Thanks,
Sergey
