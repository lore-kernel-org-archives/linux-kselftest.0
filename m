Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA0C220F2A
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 01:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782868657; cv=none; b=SXYGjbUCu8q6HntyUMCCqsJI8Zl7vgC+YCkI8NGbo2G0BjLAxPKtdov10r2JV+yUjkvE/2tHWcA2oDAvnsExp56aUsbWdFoQG40UDl+8ekjg0RcHeQ4DW9iISvl745pYEc6O0n1NDw1xHjRF4elZnKwJG4Qf2IYKX0h12Qv1WXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782868657; c=relaxed/simple;
	bh=CQHsEGW6uZDOfOIxjkX8MPVwgmPkCXJJaYhoUHPiLVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQMZsqPL2lbujWLOMC5EJLbh1ZpiMiukRv4xukqVHvDuGEWNtS8QggmRKhHWxu3mgBHC1ZMJ08CNgJlkSYtf7E0m+7BUWeDJPeR754NgHYL1yWmYulKqY0sjxqoaGvP5QqIJ2EbJ1WERSBTT00gie88+vF5TLLjwTcIYFCgN/cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rdP4VqQH; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rdP4VqQH"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-139f3eaaa49so128880c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 18:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782868655; x=1783473455; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EtMWeNmrDijSuvzYdFzBzIe5+kn8Pd5DLzMwnJd/LPU=;
        b=rdP4VqQHjKzL/JPrPBncu9cZE3Dse7xDbt8zAB1IK9X2kTxYyA8acIbc+cFzR8YMLl
         wsxQXe4JPpfG5cdMvEhmz8byHpr8ZRyXeq34dhiNiD0Z3tPWx57wXYV6RObyYDPK1+S9
         Sj4vuCvV27GUbDkP8b+AFHfXwbw7nS4geuQgU8X60YUynh+d9VqxapOw83eSd6EtHPxp
         WrnpxlcqTfkexJQyHxaVVu0o+6dxGwxe3UmeX//FthYjFQqmmBdtsz/2c9iUNAa8nHis
         kD+vkVMsw0V++fOpSl0KfpG5mXL/9tNsTryX8SlmEJSPipu7ZPVNXVrmWb4wXtMrqi0M
         CWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782868655; x=1783473455;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EtMWeNmrDijSuvzYdFzBzIe5+kn8Pd5DLzMwnJd/LPU=;
        b=HR1TGCFb0p3cra5wm7rL/HHkAzRcerjxaaIceOqQuxprA6S7L7WmPJ1xrwJ7tFsoqp
         to36FKNTdH9Gy+YWXYq16u47v4anUXLwNW3waRNcIWAx8+MdWTMQwNKnVTdRzKNr+5ZY
         Xe/QS+yppr3JK8uaFWvHFGppB5S6UGpNBytAHfPjTn4VTUV90uQpJ++iKu1feX73wxLz
         EykHSyWE5k05in3sIHG2+Keo/WdjufGVwRNtIj30i31eQsmF+fO4whqQLpw9yIUqNpmp
         gg3xAP4zqMIPXY4muJVPTMftCL9awxWWOVPJO9bXT+K1BcEk0eQDBUaCMX5tguGANLB9
         G8RA==
X-Forwarded-Encrypted: i=1; AHgh+RoAvRQfAGsIwhBbkMM7xXI1Vg7Rp6Np+e1xL1TVlDPE9lz9dxvHwdQJ7dheKNt8u/veFPWKLIiOMrXexQQW1KU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrZGOQzcO1dfHpJo+wtTRiLJ1L0ysyGZbthu8xc4gIVNGinLCF
	4SGa5+cQ3XuDwsnGhX8F2+t+3Hi9Bud6NUqpsywMI7x5h4WHQp2Hzsx3
X-Gm-Gg: AfdE7cl55k3bgqaft98wTEPpY9LGTTLTZqvbYSvmA8ZtA3aU05dJDgAr0O16LSfe+al
	2zCEoXTA1FB1JAE57k0adjlmAYCacyGVqWdtds6OOYA20ZpTR3WMNP4YUZANUeyejlpfU/dJkYV
	wWJH4cXDHJcQpq3bcH90WyMgpOj7AYJao5wMAEa+DxZNqLHCS1Sf0Wm5u0r/5792B+bQSB1HKr4
	MF10enmGCkJQt+Q4bXG2JrYdZfwR2nkLmooi6tSz02BMFtC99xaXQFudmyuIyGcOaocRfaw4qm7
	QqUBFiAA1m5biXM0+ejdG0E/2VQfYnZPRtSziRkrB0KeuFA8W2IQH/d54yMJwjnmnUQ9r8zcvsw
	Cr4GDWAgTMxR7ybnilTZp6UEVqbGsTvlP/ud5EBJqKhrWLiiI3j9sgZwKAmmVrDwQZjfVzoLOax
	HiL9BLRpPXXwgx+akY38nGwwqVCPQfBbahOqg/+Vfte3c=
X-Received: by 2002:a05:7300:fd13:b0:30c:9f31:b62a with SMTP id 5a478bee46e88-30ef084fd6bmr2062142eec.10.1782868654974;
        Tue, 30 Jun 2026 18:17:34 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30efaadc5bfsm940139eec.28.2026.06.30.18.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 18:17:34 -0700 (PDT)
Date: Tue, 30 Jun 2026 18:17:31 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Nam Cao <namcao@linutronix.de>, Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Conor Dooley <conor@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 01/16] riscv: Introduce instruction table generation
Message-ID: <akRqqxVMmzCJUpxp@blinky>
References: <20260621-riscv_insn_table-v2-0-7f0810ee2274@gmail.com>
 <20260621-riscv_insn_table-v2-1-7f0810ee2274@gmail.com>
 <DJMJB4B8Q57Y.34SUOKB6MD8IE@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DJMJB4B8Q57Y.34SUOKB6MD8IE@oss.qualcomm.com>

On Tue, Jun 30, 2026 at 06:45:51PM +0200, Radim Krčmář wrote:
> 2026-06-21T21:01:19-07:00, Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>:
> > From: Charlie Jenkins <thecharlesjenkins@gmail.com>
> >
> > Eliminate the need to hand-write riscv instructions by using a shell
> > script to autogenerate a header from an instruction table. This is modeled
> > after the syscall table infrastructure.
> >
> > The table is generated externally by riscv-unified-db [1], but is
> > in a simple format to make it possible to use other tools or modify
> > manually.
> >
> > [1] https://github.com/riscv-software-src/riscv-unified-db
> >
> > Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> >
> > ---
> > diff --git a/arch/riscv/tools/insn.tbl b/arch/riscv/tools/insn.tbl
> > @@ -0,0 +1,1392 @@
> > +# SPDX-License-Identifier: BSD-3-Clause-Clear
> > +#
> > +# GENERATED WITH https://github.com/riscv-software-src/riscv-unified-db
> > +# "./bin/generate inst-table -o test_table.txt"
> 
> I checked out the repo, ran the command, and got a different table:
> 
> > +andn common 0100000<25|111<12|0110011<0 xs2=24-20 xs1=19-15 xd=11-7
>    andn common 0100000<31|111<14|0110011<7 xs2=24-20 xs1=19-15 xd=11-7
> 
> I assume there were some recent changes in the output format...
> 
> I think it would be nice to use their latest format and also note the
> UDB commit that was used, so it's easier to reproduce our file.
> Hopefully there won't be breaking changes too often. :)

I have a PR open to fix this bug that I missed when it got merged, once
that gets merged I can link the hash and there will no longer be this
mismatch.

> 
> Thanks.
> 
> ---
> Sashiko seems to have noticed a plenty of other issues, so I didn't
> review more...

Oh thanks, I'll check that out.

- Charlie

