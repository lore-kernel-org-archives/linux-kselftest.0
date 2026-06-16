Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D803D88FE
	for <linux-kselftest@vger.kernel.org>; Tue, 16 Jun 2026 05:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781589511; cv=none; b=MRUmqJVmDLumrqxiDkW7CQmQ9An2ShTFBgDZYsfYnaYeUCQrLflU3CCs8uHH+cl70obj3Q8n82BtdFATaDibjpU7V/pCq7pXaaaAb5/btxO5+V71Yg8bU5eaI/Mg9W5vaoxxGTMd/FucjyfE5XFBJdaqVlNmszMZeO78ZfpAKOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781589511; c=relaxed/simple;
	bh=pjMEfY3K+/Xw+PmVqjvzMCI+L/T2uYNTTllsMVPPgSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rJJHj4exxbqSDkQDMggIqsDA7IOFEjNdnUYNxDlVgq0kcmiVSQ+wIL6ES78X/KbekJseb4MnGZAAVkYX8ioUY3mVuAmPSMYfRk+aTbnm4Ev8eZB5ZWCmDY/ys4JeaPU24xbM3zZrVMrh+KfCgPFqSjW1ke/vR/zQeudDfIkKsnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hd1F8ffK; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hd1F8ffK"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30bb7d20ad9so70739eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 22:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781589509; x=1782194309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9PSlzuZQ4Daz0lqLHFL3WubdgzTXoK9WA+8u5CazoU0=;
        b=Hd1F8ffK4luKmn10FBey4LNmAziM2x1JdWre5YrYI3qDbm0qTH0T2U2DTCDooEeC6K
         kjfv1HLJFQLK/H11d/csXCEOO+nWvzSAjP4hzFNSvQhlbqEbKcwIGEaqCCJ0nX2YILs+
         MzF+fOLkosX+N8nTUV7H/L55DfkX2ZVyWwhrvjg8A3cldnZR+UsU5rC31BmpL2zCwjlH
         embfY1INszhyMb5imBI+bBrasYRUCOwW3qOP97l6Gz4B3yXB60d/TngHIMCKPh9OsPvG
         ujTw0DuHQF57+grr6rYfchZKmlnXAjuqCrEPn3NSVnx3jmC2Ia/7Ek85oyaDrQSBT8pw
         03xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781589509; x=1782194309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9PSlzuZQ4Daz0lqLHFL3WubdgzTXoK9WA+8u5CazoU0=;
        b=pbxEP43kQisKnwMCmlUjC50R1b1MMPXVGIG4zkuL1N9Dmh8e5cspxt3hRL8JgiAkcP
         sMFWqmnxxtfyMdQCslD1CFUGIjbVKDrh6hkOeBnE+Os5lqPAPO5fO8NQqXGjGlUrhQtO
         WiLFrVoS/VRyL5pckxi1AxBSazPVOO7xDAesJqrpKf7pdcXtCNkwIxpslKRG6y/kex5D
         Faz7rD/Fiqp52lHjQXQUjUlsGhA7mwhCbBJ0VaMrGBxfv0ZTUuM5HC9ILPFjpqrw8nG4
         CwVUve00LsuEZ5Nb1mEqrck6crkU2ShjKMXHNBmZfqbeGwWrIn/6CST62DWoKajIdxNp
         ihqg==
X-Forwarded-Encrypted: i=1; AFNElJ9EBiiv8NTCCQvjX3luEoG9//Nm2a/qINqwYc5fvrEpJcykoLkDthB+hnl/8T/VkLse19JqRtKiFAawm3LRLaw=@vger.kernel.org
X-Gm-Message-State: AOJu0YypFD08iHB2XyZnbIWKAiLy1KNGIp+vDnBqWZRGpP+xqoGfugL/
	1GJ39wAKU+WehzglH5/zYYbG6qs5Uan5MLNKmly4Vis/mKlvagrJE13H
X-Gm-Gg: Acq92OFN94XDrAEbZJcTxMYPQTQofrOaOJi/7voJfHnUp6kQr6gFYrxSZbVf+W5c7QQ
	X6S9vKUEcoEzNm4w0ZT75BwnXl1dVxf4rInffL+Zs7wTGpZXirAkKU20ZZEpEHhh1AvH2Qg+BIk
	q377tYulI89ciZUo7FWek9XNNHD8gHOtGL+lT34iInm43kZBjvy1iRqLv7SvyJJTqKT86RvKsZh
	f9V4IxI2sAJEJAcS3Hi8DWMQPrqJ+llX8h8PK83ObjELXIiFEDFRBGTGRm/8xKJ4py3kmWanDE4
	zPLRfFtrvTCZSMj1u6I7OJQATahn7FwXYbgodNs53OmXZwJot2aDZVGb43Egh5sEBaNH/Q9BXgS
	hQBXDRRYP0ztwYg5gDdtVKvtNhleEDf9iMfyaJlZbEd9XChLfRo5WXa84QasxVpGDLLulowElLO
	dRSVWkPC4L7Ik=
X-Received: by 2002:a05:693c:63d4:b0:30b:6191:7f96 with SMTP id 5a478bee46e88-30b6191bf72mr3509252eec.30.1781589509451;
        Mon, 15 Jun 2026 22:58:29 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::92d1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e92096esm18135283eec.15.2026.06.15.22.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 22:58:28 -0700 (PDT)
Date: Mon, 15 Jun 2026 22:58:26 -0700
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
Subject: Re: [PATCH 01/16] riscv: Introduce instruction table generation
Message-ID: <ajDmAmq4_hYCDEfp@blinky>
References: <20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com>
 <20260407-riscv_insn_table-v1-1-54b4736a1e77@gmail.com>
 <878q8m1j9y.fsf@yellow.woof>
 <aioJ_5SIXdGQg55R@blinky>
 <87se6tejoe.fsf@yellow.woof>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87se6tejoe.fsf@yellow.woof>

On Thu, Jun 11, 2026 at 07:21:37AM +0200, Nam Cao wrote:
> Charlie Jenkins <thecharlesjenkins@gmail.com> writes:
> > This is a weird one. The Ziclsd extension introduces it for RV32[1]. All
> > of the data is generated from the riscv-unified-db and because it is in
> > the Ziclsd extension, c.ld is included for 32-bit in the c.ld
> > description [2]. 
> 
> Oh :( We probably should amend the base spec to mention that.
> 
> >> > +        compressed_name=${name##c.*}
> >> 	   ^^^^^^^^^^^^^^^
> >> 	   this name is misleading
> >
> > That's fair, I can rename it to be something like "compressed_inst"?
> 
> My issue is that "compressed_name" indicates that it holds the
> compressed variant of the name. But it actually is empty if the
> instruction is compressed, otherwise it is the original instruction name.
> 
> I am not sure what is a better name. Perhaps just inline this to the
> usage below.

Oh I see, I'll come up with a name that is more clear on inline it.

> 
> Nam
