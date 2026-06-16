Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B618C3D891B
	for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 06:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781589996; cv=none; b=RBjQL6sTWzFfDChT3keZTPolh3O7fxfG4XC6UoBn1zgY+jkKHO640mxFTKLtMvgRVEqag5e7dY3R2vEis5jW8Mh6v7FxM/Ny2pUh/2RmaRlXLIt61fisWzA7haCWcao/uPN2kFXmB1B4O2Kp7dUlNRf45QGHtGvGfnRxDDdPHz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781589996; c=relaxed/simple;
	bh=mePsKDgnT7KOddPsWmdqbXoE1a6nKcnpxg0gh2nBVl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C1w6pXht/UdDswF/FktjG9ETfRsJKlFuD3O4nOkp/no3aOusJpjVyKtv+HdZNVpHkOe8pMKrkchNcw02keKkCSEoV24olcw4RB+i/I1RBabquJTHeV1k0jA6uT5fncqHSl7mmq2feTwikZUfu28Bkr9rOE9lsCZrOvPc6SR4QZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UsRXjzhh; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UsRXjzhh"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-137ec563a95so4523572c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 23:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781589995; x=1782194795; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IYT2HIZ/TljEaPuQNyUPwKuwE+O4A3F++I0Be4tA0UM=;
        b=UsRXjzhh/OPRjISmvTo/9WfMbQdKEGrdt3absXsOCVkL+IU9aoHRe/USl0dQD1RCiW
         AhYg/uwMkg+blc9s/8JI3jwvDyfgh3zV9SraUR/NwCgPUNdumH5nJevwgpKBDdus3Qt7
         jAGQ+9rUQCBx641pyaBNpkFtqwDZlL+XXje9JET9IW35adAKfQwhGxsdldxUbUHF+X2k
         QayaiDrJdCF4/+lLViZSpatRRNy+T2sLPpLG+1tZq2vq3zSvZz5mWCvo8ByHNvvho3F/
         BeNSb3eEfXLL64YEANpULqntGFHZvUaTB0hVCCAJxnRYaYZB4FIooebNzbQSdKlqg1q9
         P3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781589995; x=1782194795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IYT2HIZ/TljEaPuQNyUPwKuwE+O4A3F++I0Be4tA0UM=;
        b=aRVvpx0e7AqxJVZCqoRaknMc8V9bh9YJbRnQMOXtKQ+J2TYuajKIYBWF/3ikSgFGDU
         DZfcT7xXKfj3OCZ4KNcu9TsLtJq+jPsjH7gZuXwn0Woah9ub1T48WPKB4ZT2AA/KrZyM
         +ZNraNekpvKHQaf9g0Q1ntrIx3tfU+X9hcRJciZFU6k8wswoVdybJGSgrM8T7P6RfXQW
         EugRmrjqDmzHWOX0cQx8Bkzb3pe6OgtmEbizZHU27vQBxq/r91us+P1tB9dGYLdVLW1J
         x6dIUosHIfuizWZsRiwZXTsCL9oYnRCpmGRarkX7vJUgIo+XKuamW3+UZuJh2usxFn8M
         nMGw==
X-Forwarded-Encrypted: i=1; AFNElJ9w9peQ3b0L+ULY1ZX8aHIpslLIepeHYUm8vS1dexW0BwNNaIAw6sYLsHCSpUzNea/N3aLRmOD7+BnbtjGPUzY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEh5FA6YLnyJP2E3F5JV74N6qoJ6WfC4zweK7UBv5XpaJPcsG/
	9axM56g5FcStUma5N+bfF371koKjkquKumBlmMyMZ3/NdTFkZQ5tgini
X-Gm-Gg: Acq92OHuDE91xpxf9IDczF9W6QRZ7w+sytA5Sl/ca7SfJm7y05Tf656ZFvBxgq45lti
	RV6egNjRzSkMXiv3XYz4Ej/lhxdabqOp88zY9PLb9nTyvCc9ycBbRkwuBvrjrza9jHHRJPgu7qa
	ZBX0ihnywcFdQucrVloqT4oSyQSHEmeRWjX32BZo3+Koz/nYhieHPU4wMLczF75KuYg6yZjXtAW
	y09lpPKKg/ObG3iJ4m5nnD6EVsKdqhxS+AHGyIblkhaIgkjbZcKKoAakSHyZUkKcX9wF5keuhmY
	9VQzNH7MxSVDXQCUbWJOe61xvtm8P5pU833tVbAgTmXY8JEL7RAwxczOkOpHq64Y2DG4JNYnf1G
	V2Zu+0KunShO0uqQp7Ag1ORpVkq0+Y1dkOtLtyvIxOhR2jenQ99srV/Ns5DXQq3Boi3UJA4OSgv
	8XbrLeZ6g7f/0=
X-Received: by 2002:a05:7022:305:b0:136:b370:64de with SMTP id a92af1059eb24-1387901e454mr5481988c88.32.1781589994812;
        Mon, 15 Jun 2026 23:06:34 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::92d1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b96d6c4sm12930812c88.9.2026.06.15.23.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 23:06:33 -0700 (PDT)
Date: Mon, 15 Jun 2026 23:06:30 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Conor Dooley <conor@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 04/16] riscv: kprobes: Use generated instruction headers
Message-ID: <ajDn5oINgUzKhELv@blinky>
References: <20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com>
 <20260407-riscv_insn_table-v1-4-54b4736a1e77@gmail.com>
 <87mrx1eh8c.fsf@yellow.woof>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mrx1eh8c.fsf@yellow.woof>

On Thu, Jun 11, 2026 at 08:14:27AM +0200, Nam Cao wrote:
> Charlie Jenkins via B4 Relay
> <devnull+thecharlesjenkins.gmail.com@kernel.org> writes:
> >  bool __kprobes simulate_c_jr(u32 opcode, unsigned long addr, struct pt_regs *regs)
> >  {
> > -	return simulate_c_jr_jalr(opcode, addr, regs, false);
> > +	unsigned long next_addr;
> > +	unsigned long *regs_ptr = (unsigned long *)regs;
> > +
> > +	next_addr = regs_ptr[riscv_insn_c_jr_extract_xs1(opcode)];
> > +	instruction_pointer_set(regs, next_addr);
> > +
> > +	regs->ra = addr + 2;
> 
> c.jr does not change ra.

Looks like my tests need some work :/

> 
> > +	return true;
> >  }
> 
> We have CONFIG_RISCV_KPROBES_KUNIT now, please try that.

I can try to extend those to cover more.

- Charlie

> 
> Nam
