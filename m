Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4FF495506
	for <linux-kselftest@vger.kernel.org>; Mon,  8 Jun 2026 14:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930599; cv=none; b=eK2ms+uqEs4yo/Ab7iR6mP2VxOGPyCNs8Q7xokF6ei3DBIgIFJDGu5kGjHI+DAlainpEscn/vOllTpC4AEDkfuPsGmKmkyzNpXER06CpfR86f9+jbioGRghIFw4Uc2z79smYxU9ifTx12cf6rZpOYTw2gWkLnmpKru8rQBwjReE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930599; c=relaxed/simple;
	bh=OLvBvUjkzfMn1Cidy+KbhXvOT4PjxRs8Fx8SkFfpgFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dzmPzL6xTLq4QfkZNXTXGYP78GQe4ZNA4mzaBAlYSxTOb2sRQWNqE+QCMojMnTC7meg/0rpx7ITv9ZsP7fd9TbNqutQ2mh/e2cEFOdaQOzpxs0oUWzE/Po/yXwr0x01b9jH3WUues8A9FUbar5GJ9y2lOcGhBP0pRyaohC0WEW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Vz+OvLtn; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Vz+OvLtn"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51761d27612so52510501cf.3
        for <linux-kselftest@vger.kernel.org>; Mon, 08 Jun 2026 07:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780930591; x=1781535391; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5XaEoBFZ0wQN7RayZ7ZGkzrqQNmFAZboLFpyYk5DAFk=;
        b=Vz+OvLtnDLdBCYdORDQbcTs2rusiLhkpjeqFPNwcEwNYhHyk8d3HB1v6zbUMCJ5XRX
         OdLmxiemRs9Nq3Ze9ymf0puQVhplsbuC79pY9rYuwI+Z9phnw+j3hy/zJFBtxB13xRbv
         1rTtisvq6/5U5/IICAE/yCjNhCrY8TyiBsEm05EZw1xHhkrCYMzYiI+za5pcgONY9njS
         KToSzx3NHOQPJT0JfAgkXtwsWAqttV4Uz+plFbKfMtxysrFHaBAld+Z+Bgk9ZeY6YUfA
         8tZgX4ceZ8Mhhqm2h63FvUkzJDK7ePx9yr4qg73vB2smkNtwtJFiVO+UkFQUcTBqzJHI
         Y5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780930591; x=1781535391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5XaEoBFZ0wQN7RayZ7ZGkzrqQNmFAZboLFpyYk5DAFk=;
        b=aQxO+s0YEMtlj2xF9PHz0iiYHQz8RaGqmkVHJn4UkuyhW44aS+mTihmRn4//627t9C
         18gMLZfPorEJ8M+gJSHLKED4dY5ECd0bN0fVDzrHK1doUNw/A0mvvIiUM1mF1r1NTrpY
         bfnnIDUsWOpDTE8kkMajT45JLOb1HUiKuqjuzz/F6kPBPRMC05X9DBAvoHipjsAfl69y
         0Tas4EU7HMzI5k/p7F4qURVIwrpheIcui6ThMeSKSB0SwLdIL7GBIfL4aMeSAWBU5ky/
         l3dbrYwgXQJGdAoUsD1Gln7r0cunpZH+4YEkOjJfEeKXmUoHjBjeEps7UawygDGbmeD8
         yizQ==
X-Forwarded-Encrypted: i=1; AFNElJ9igcVSKWLE0vEQTQrz9Gw94wJVBqtzSxv8NhU5FTyhMKiCmBUbO5M8uu2v/mPeySl0J2CEe8KXnSsX1gIv9+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGbVlBCclHv7K7KMgQVvgtEkgOz/R4kONF7D+r6drz7DOBWSMl
	s25bWEdb91tLMeigGVPne4Lf93b07SltXkI6/kn67sbUSXambFfZ60ZE9c1S2gHsW60=
X-Gm-Gg: Acq92OHJBgBxZc6jwhsHuCxavQ6E3vDNWdEqYKwc8J6jaTk4ygJflwGdE+fTiEszJW7
	xyz5zSH/dC33yz82hGf50F9fVKE7ipNTylKvC1BRZ/pi35H+AF0yXCZhtrPRibayjKUvz12D/G0
	1FsPW7vh3terM/5HQFFvY8eKgHLUT2qusRDvUpFWpenPqhSzvZeQ2djbknJY7ybbDBxM5AbR5aG
	TUfciT5YBid5dv7mY1KK6T8mtAVHJVejfEqCCvQyXVFfkK5YHKiVvhoHyWFUM7rQ9IoiJywG+zj
	uh/iOqq9M7s0l9drlrX9Kf7Kx+OpFXIrT0rMygNATAoWJnwt9aWrcGLXeyIknH+0HZivyY/9C5U
	hgqAD6jJlWLadZSEjQkljPSc60WQcHzOLxkZuxGWeKQ6QA8TijFaX2NdPvclodq1IKB6bfSyXEO
	GpDWe6a0HQoi9/AsQJHcWHxf0s+aV7G2iDGWCrZpjRaomL/maXunGbiie7xUNfVg==
X-Received: by 2002:a05:622a:1648:b0:517:6d75:a2cf with SMTP id d75a77b69052e-51795c5a18fmr245549391cf.43.1780930590664;
        Mon, 08 Jun 2026 07:56:30 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775dbd2c9sm158664971cf.23.2026.06.08.07.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:56:30 -0700 (PDT)
Date: Mon, 8 Jun 2026 14:56:28 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	linux-kselftest@vger.kernel.org, shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org, jasonmiu@google.com, 
	linux-kernel@vger.kernel.org, corbet@lwn.net, ran.xiaokai@zte.com.cn, 
	kexec@lists.infradead.org, pratyush@kernel.org, graf@amazon.com
Subject: Re: [RFC v1 1/9] kho: split out radix tree tracker into kho_radix.c
Message-ID: <aibX8oS4toOVaCqm@plex>
References: <20260605033235.717351-1-pasha.tatashin@soleen.com>
 <20260605033235.717351-2-pasha.tatashin@soleen.com>
 <178083348873.1648214.11020626647820932506.b4-review@b4>
 <aiWYZhoSOAruIIM3@plex>
 <178085518028.1648214.13339471022594901667.b4-reply@b4>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178085518028.1648214.13339471022594901667.b4-reply@b4>

On 06-07 20:59, Mike Rapoport wrote:
> On 2026-06-07 16:20:50+00:00, Pasha Tatashin wrote:
> > On 06-07 14:58, Mike Rapoport wrote:
> > 
> > > On Fri, 05 Jun 2026 03:32:27 +0000, Pasha Tatashin <pasha.tatashin@soleen.com> wrote:
> > > 
> > > It's radix tree data structure implementation, kho memory tracker is it's
> > > user. Please rephrase to keep the semantics clear.
> > 
> > Yeap, I will update it.
> > 
> > > I don't see much value in moving kexec_handover.o to a separate line,
> > > btw, the same is true for luo_core.o, but it's not important enough to
> > > change.
> > 
> > This is purely for consistency. I wanted to use the exact same style in 
> > the Makefile instead of having two different ways of declaring the 
> > object lists.
> > 
> > This:
> >     luo-y :=                                \
> >             luo_core.o                      \
> >             luo_file.o                      \
> >             luo_flb.o                       \
> >             luo_session.o
> > 
> >     kho-y :=                                \
> >             kexec_handover.o                \
> >             kho_radix.o                     \
> >             kho_block.o                     \
> >             kho_vmalloc.o
>  
> I mean this:
> 
> luo-y := luo_core.o		\
> 	luo_file.o		\
> 	luo_flb.o		\
> 	luo_session.o
>  
> kho-y := kexec_handover.o	\
> 	kho_radix.o		\
> 	kho_block.o		\
> 	kho_vmalloc.o

Got it, I thought you were against making the consistent :-)

> 
> 
