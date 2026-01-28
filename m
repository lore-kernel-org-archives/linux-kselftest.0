Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE55B25783A
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 17:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769622650; cv=pass; b=DqlupUp3pcGbUJyx+qcdfUCsXUT4ZCEY3qdA56s8S9sZThIEaJXkzcsYD5w+cLGSnJZUelw15VehVLGCvKz8qCVeAqporNeLXOyQ77UOm0XM05egw8h486FS/TrtsfNGaHaPAfR6JmB84Du2g3IzpUWhVIXKhTfBtWfIZBeAJJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769622650; c=relaxed/simple;
	bh=CNqWkOyueD1v7WuaKUDdc+x4jRQ5s6ulmoL4RqUerEM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uDn5tv+6NurGcqU1EOqvYb7QTSZTlN7/3JrLOQIWsDYqF2tQEi9X1PYKUCEZIBv8bnO717L2SkkNqdX8RGqIE/lnWCaJ8y/NuwbKNbDIatkhAZ8cbTKh9dTNliBUmTYrN+REw/z7+VbM90K0Wfsil+tz/1UaJVjHSdg9pp+jB4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bHT6jDVr; arc=pass smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bHT6jDVr"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5f530da3a07so95823137.1
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 09:50:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769622648; cv=none;
        d=google.com; s=arc-20240605;
        b=WZFIG1mGQtsdqog6Cz4tCc/gLuG2xt0GBCg18xBeYggJfO7Z+wcAJsb8yhkAaHG58A
         wKkXZgGEtPy5rTXeTqFJ2pncpXnZUNzeoA6HaT1oQa36n6IS6wyffgelevYHJNlUOhzi
         Ch3150Tj29OF2JeybFxPXZeXdSlAvmpoPc68THbvALC71yHBc6Nr6P/l3XK5uKBCozaN
         yLku6pIRtWZy09qQKjWRw/RsxylBLz4XF0qaiL22wpE0A/4DNkacNp0OOtR2Gj9kbIKP
         havuHwo8+NxzZ3Q7gNoVz1uHzCdEp6J0OQaxjD2WdU3z0pE356rS08+OursfhYecf1f+
         S9eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=CNqWkOyueD1v7WuaKUDdc+x4jRQ5s6ulmoL4RqUerEM=;
        fh=aCOveTu2WYYS1aUCnNJosPp7oLosThp66BjoUxGbTNs=;
        b=EbF5iwjyZT4z1bnx7tE0nn9rdxY8L69fpe4ZrtWI2muPj0IZx2PE2yYdSG3mLNdOoS
         7C2C1lRnSGe2MDzNp4TElaRSY38EvOxNZf6Qpj9lrfe+N6ZvS++dQZiVd8YbBid08vwd
         YoQTZ5KxBDqu4UVP6pEVIeLtRjYasPBber924x8HqmJXu1Wmx1YnEuzphoiMfEJuuyum
         cvFCgn0zs3dPADus0usBpeiL35oCeBkM4s/VYrOQcWin/DllNq2KaQD4VnlCIuLtf4It
         uLy1SHo5Q2PXW7+PDRtpHFpFgMBlNnv2YB8bFEtvkyZtwvawAIj+oPGSyZEgt1UQ50hc
         lfWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769622648; x=1770227448; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=CNqWkOyueD1v7WuaKUDdc+x4jRQ5s6ulmoL4RqUerEM=;
        b=bHT6jDVrWJ3mgE3zOdEbPbOXVylCYhJBKidSCHid9ahabufnkQjUDopdWEfUqt8bcF
         lg0R+SYljdK33OM6QbmD4IhWOpcBNORKLrkG/r3rwpBjibP+7XSbTyhpPWf/Fn5tZoXG
         8iXgSC9hofYXikgaLaloBdRIqBSk7PoXv8JMfHLccDyPyNZL1MmlvTj9jVtKoXD1qDdr
         wGJ+WPgGFHT1cBh2DDqw7vc9Y6e98IyTzsVBo90UqQBLxExjeR3YeBxx4KvuntNjJPy/
         oooOPZS5Ffb5yQ3ok1gMnfZO5miSxDmK11nKDNg0N79NN8NPBkqtA39yLQ4KYC7ZycF7
         5tOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769622648; x=1770227448;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CNqWkOyueD1v7WuaKUDdc+x4jRQ5s6ulmoL4RqUerEM=;
        b=jdIDdT2rJSErs7ymZMC7EfWB4/rX/GejCYsHohBEUFvprGSIQQ3ByFBRIIiKORskmt
         5pUsxXtbxLR+Eu/R0rckfJG3VMO0p3dloTOfEPCP8jm7xAv/zmeGnxIdcX7RG/lUvOeV
         9uFWgd92CPjVwzfncCUd5vwXWg3LlCQXlo64ETjTfm8g/83QBj3Ek7g+gsyJ6avrge+W
         RN4UwC26HM117cA7G0889YCdM+Ohp0Z9GFe85S6V8PTLBFvDlR9gX1Kt6C1ESS+ytm3E
         pjjbBudwT1cfFhdluCz6FHYAcg4dWCJkBdrU2pmcygBsrAOX5nazOBv1EYjf0vIeSlKU
         epKg==
X-Forwarded-Encrypted: i=1; AJvYcCVNsRXHlPbBBoTI1p2JUA1nRBwNKzCekrNAaMTWFv1oPgA3hg6xFKCAfCTcwhtT8AzDdKpT+p5PuAIJFY9YQcU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgJS04FX50lEKStYqsDQL9zwQV5jye0RDbiUoX+uLLhh17HSma
	qSjh9Vfs1Xc2p5MBIXF+KnPsD9m9fQj0jV0Oq978wZyYx53hecSYK830Xqe/3f/hvxD8krQTGOO
	9BBMVi/gGJAY3w5K2n9HE3jL1hZHVD3PLOs7CBu8n
X-Gm-Gg: AZuq6aI6thXimspeE/TFN84ttYr0uMMSOMn3+N9ntbv2l5Zm8v3cf/1l5aNHzlA411y
	VkPwds5fAwVNm7mjp8iqIZhgceH8bg9LSUiSnAbBU0XMceyh+pHhzw3mNd/2r1DBa28gnM0NbRR
	BuQi3FEx/FRt6V9HF+k9YPYvcY/nk2LLNgflwP5MI5JRsgMZOK09pm+y4Uf7kme5UUjr6Glcz32
	TLFhy9UiuCsTEgPswx9L+96jPiIOs/Rk2SYmfnP9qi7kKlniYHdc5zg727I3mXVWf0ZKnA/MzQc
	mxvumyIUsLTmTncjSx4O7Mpzgg==
X-Received: by 2002:a05:6102:390c:b0:5db:e2c2:81a1 with SMTP id
 ada2fe7eead31-5f723765badmr2717805137.14.1769622647325; Wed, 28 Jan 2026
 09:50:47 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Jan 2026 09:50:46 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Jan 2026 09:50:46 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aW3kOgKL7TjpW4AT@yzhao56-desk.sh.intel.com>
References: <cover.1760731772.git.ackerleytng@google.com> <638600e19c6e23959bad60cf61582f387dff6445.1760731772.git.ackerleytng@google.com>
 <aW3kOgKL7TjpW4AT@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 28 Jan 2026 09:50:46 -0800
X-Gm-Features: AZwV_QifG6FXcq-qNYCcE_MoQgt6DAo9uPq6fzN3xKHneI_AD0mm_Yxu6BjCe84
Message-ID: <CAEvNRgEjo5idG7OtMqHt+kCRCQnWjzWzQN7nwNGDExwmf4fyvA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 01/37] KVM: guest_memfd: Introduce per-gmem
 attributes, use to guard user mappings
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: cgroups@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, x86@kernel.org, akpm@linux-foundation.org, 
	binbin.wu@linux.intel.com, bp@alien8.de, brauner@kernel.org, 
	chao.p.peng@intel.com, chenhuacai@kernel.org, corbet@lwn.net, 
	dave.hansen@intel.com, dave.hansen@linux.intel.com, david@redhat.com, 
	dmatlack@google.com, erdemaktas@google.com, fan.du@intel.com, fvdl@google.com, 
	haibo1.xu@intel.com, hannes@cmpxchg.org, hch@infradead.org, hpa@zytor.com, 
	hughd@google.com, ira.weiny@intel.com, isaku.yamahata@intel.com, jack@suse.cz, 
	james.morse@arm.com, jarkko@kernel.org, jgg@ziepe.ca, jgowans@amazon.com, 
	jhubbard@nvidia.com, jroedel@suse.de, jthoughton@google.com, 
	jun.miao@intel.com, kai.huang@intel.com, keirf@google.com, 
	kent.overstreet@linux.dev, liam.merwick@oracle.com, 
	maciej.wieczor-retman@intel.com, mail@maciej.szmigiero.name, 
	maobibo@loongson.cn, mathieu.desnoyers@efficios.com, maz@kernel.org, 
	mhiramat@kernel.org, mhocko@kernel.org, mic@digikod.net, michael.roth@amd.com, 
	mingo@redhat.com, mlevitsk@redhat.com, mpe@ellerman.id.au, 
	muchun.song@linux.dev, nikunj@amd.com, nsaenz@amazon.es, 
	oliver.upton@linux.dev, palmer@dabbelt.com, pankaj.gupta@amd.com, 
	paul.walmsley@sifive.com, pbonzini@redhat.com, peterx@redhat.com, 
	pgonda@google.com, prsampat@amd.com, pvorel@suse.cz, qperret@google.com, 
	richard.weiyang@gmail.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, roypat@amazon.co.uk, rppt@kernel.org, seanjc@google.com, 
	shakeel.butt@linux.dev, shuah@kernel.org, steven.price@arm.com, 
	steven.sistare@oracle.com, suzuki.poulose@arm.com, tabba@google.com, 
	tglx@linutronix.de, thomas.lendacky@amd.com, vannapurve@google.com, 
	vbabka@suse.cz, viro@zeniv.linux.org.uk, vkuznets@redhat.com, 
	wei.w.wang@intel.com, will@kernel.org, willy@infradead.org, wyihan@google.com, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, yuzenghui@huawei.com, 
	zhiquan1.li@intel.com
Content-Type: text/plain; charset="UTF-8"

Yan Zhao <yan.y.zhao@intel.com> writes:

>
> [...snip...]
>
>
> So, it's possible for kvm_mem_is_private() to access invalid mtree data and hit
> the WARN_ON_ONCE() in kvm_gmem_get_attributes().
>
> I reported a similar error in [*].
>
> [*] https://lore.kernel.org/all/aIwD5kGbMibV7ksk@yzhao56-desk.sh.intel.com
>

Will add locking in the next revision. Thanks!
