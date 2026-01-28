Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBA1314D0F
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 21:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769636874; cv=pass; b=uqOjWOo6vuFcI2LPQq1JvDUXSCLZ08CvaJd7RIluM1dabg0Y3fy1lDSzXZGpwgvXNETkcoAo/Wd371Iy67s6BpXRoTfNroEQPLKHAbs1x42rf4IbdFkYL19OF70bvZR0/uoFWV8py0t0pEuFrvXSKSn2pPIrIlOv8EgUMoymPk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769636874; c=relaxed/simple;
	bh=YC36ImuZe9JdqUv+pVkMpluokr4Llii9CFTV9lQL1NI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ws/SDkoa1ZNAe6hK0/NuxIUajgXX5Mox3u1+yYq9oLMXXiW91GwCAW/hIQ5xiibJulPBMBz4iEVOMiMN1c1D+tII614OJuRPIG2Xopy4NUWtHv/VuSyjVu+RaFxeR9MyUin4Urgbvp2uLgJogU87pOpUWSi3AIQ2ovW4j+l2ul4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=x4/lfl4R; arc=pass smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="x4/lfl4R"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5eeff7e8bb3so255678137.1
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Jan 2026 13:47:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769636872; cv=none;
        d=google.com; s=arc-20240605;
        b=GoHO6ual2U2ihe5Oy+vd/KHFtnDrOAF9xcnmWTB3cW8QUMcq9uGcbmfjmkWGH7OWyR
         iIf5Tfb1DXyPGbSXOCCz9z68BbM19eU8gsDkzCS1YcEoHBOndzwiXF9n1Qx5IML0y9Ox
         gLGdUJMQZ0EP4/ecPdFC3qs5g5qBY03DbpkTNVn+1Jp1HgBUJ63ZAQ9M6O9tM51R2rz3
         pe3N/pMuYqXDR8aHshbZe9z3t1N/IJ76ha4qbPGKpMaEz3ZUc9AAJqVoqq4za6mvSC/5
         dU4eIQ8Ua5pCs0qd5lkQTjXn27g46FDH+2u+nSL08oH0cFkYujHrlNTBF3yfd/LJ3OZT
         PJzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=8KRtsUWTPrRQfD/St3Ag63nt0POKWslcjlDyzaxfyec=;
        fh=LGqKVGTsA22ZoJi7uszwLw4gTLq4n0rCUThwKw+duro=;
        b=DOxic6vHtHxUcpNsKlijPNSEhBRwwxEO2Li63h8suxNn9wE/tgW6ebP0B0vLsYJQ/K
         Qe8tImVO5NZWP9no/4dZZuq5JvuvHi06+OIqUtmCe9QP6c2vE96G8z3ab9NFblMz/Uht
         AM+jOJemapgXaSUHrilCd65Gmc+mgfZ7vQSASBjwFezJCgGmbtvjDiszKoQXMAfsiZ/3
         g2TxYOTo2zaRr4cp+cjlS0tSrBdoXHiYbW0MO0g+mbiPcZ3glgDX50yn2ENOl5QJlhKu
         8gMARMgU2E6SKjrY6ZHHhyXfpT479sh4kUiCSbmnEn5Rq121mErDkAvEY5cOxDWQWXUP
         mkhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769636872; x=1770241672; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8KRtsUWTPrRQfD/St3Ag63nt0POKWslcjlDyzaxfyec=;
        b=x4/lfl4RC4R6AZIvM1WTIKqANtJTykk9eIGt6qOukMOE1QRTKe0Nd4Kufq4/kTBDvg
         O4gLZ1kkXS5Wi30V8TZbW4QI2U7WSmlwAyOQseQ0Kk86PWxdg+SbVc3mEsim2I63sEvG
         auosx2itHw4eTN+FT8gJmnxpeIRAt/VFWkDpCj2LWJtWlU7MoxlQCFH8mZdrCaD5JeMn
         Eri6ZQ+0pAdOorAluQAH/B4RRioCPqJ6ECaJ0QKnEW0i5Oi8aieYvFzIVSLRMFe+CQHE
         UXxnGatvUwlrhNlh9IwMSkTcDBMYXAFS38Ys5DU1A4L/wOz5EVnX2gsj+2vKxJXrZFW5
         CbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769636872; x=1770241672;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8KRtsUWTPrRQfD/St3Ag63nt0POKWslcjlDyzaxfyec=;
        b=MCTWv6bGWd93Z91WCPzZ8T3bW6ZiPEZI9PBwKh7gnLYlkx4UUCtdY/lgCFYwPbK8af
         3P6J4Ave+hux0yeHK8K7/jdQK//bUZ/xJHkuOhBUO5dY/WPNQ88oRIqneMG8zFY4a/4X
         xuiE3W26fbmql+w++ReYb3JFi6Whum6Aie9IpXasUpIb367ze9JVwDrfnbNKZbtBQA9V
         ct4lM+o11K0QCzxZp4Tv6/44JyBjP4902eIxFyeprsAEzcwOo92frnvYOyKYBq2P6A1T
         h5pJ/tty65pp2GXm4N/+REct/LVIT9k8lBesiLUz6PGpI88P7rQeRHMK95LCj9l7qljs
         3dug==
X-Forwarded-Encrypted: i=1; AJvYcCUupLlEqjRJX3CfJNuT7T2dXpE6yZgikPB5U+f5JCCJ5BLaje1eKJc8uEQmaDuW0S8qPD0lgStUfrFGFmXuI1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YySTVuZ8fIXOsloV7drPAidsIgDDOpB4I/5+x5lID/iXXlMebVU
	KVvL08FX1sNhWx3R65IVuVVjsXHpPpHnYwAaDDBZe6MfSYwttRdFIJ2Oy08XoP99zjSpM9RHNU5
	rLb8ykujruy/96q8ds2OyZobhUNamyJWgpzTtt27y
X-Gm-Gg: AZuq6aLmeoSOW9sBx2ie04t3La8uJowgshNrPVJ5z4GlW5IQUx2e0fjs9dzIgEmQ3YD
	Z2IgVU61N/JB/ASXNvt8hWNRf2DFWAhM/Qzdgy554FyEpcgFux0KnYrsPDSV4/240zNcgZ1P7cR
	gkFKX2l376gq5OwdhIaXP/+DYxoSp2f5f+UfnkwJ1NW/y3cD4ts9glt8p+UBIa6ylqlYN/oEYCD
	eclelZX0ympDSzjHofBUu08kITeVAzQPlIT3bRUVtFbM+5bU6gdYftutmdV+g+EGD+iiDT4bCp9
	vqB6PYjc/Vfv3gdLip1Y4odRlQ==
X-Received: by 2002:a05:6102:144b:20b0:5f7:24e9:ece2 with SMTP id
 ada2fe7eead31-5f724e9edc6mr2295689137.28.1769636871290; Wed, 28 Jan 2026
 13:47:51 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Jan 2026 13:47:50 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Jan 2026 13:47:50 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <07836b1d-d0d8-40f2-8f7b-7805beca31d0@amd.com>
References: <cover.1760731772.git.ackerleytng@google.com> <071a3c6603809186e914fe5fed939edee4e11988.1760731772.git.ackerleytng@google.com>
 <07836b1d-d0d8-40f2-8f7b-7805beca31d0@amd.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 28 Jan 2026 13:47:50 -0800
X-Gm-Features: AZwV_QgPf8aOvxqDX4gr94R7SzOt27JuvroRVjSaL4ACWGO_5lJuitif3BKdULg
Message-ID: <CAEvNRgEuez=JbArRf2SApLAL0usv5-Q6q=nBPOFMHrHGaKAtMw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 05/37] KVM: guest_memfd: Wire up
 kvm_get_memory_attributes() to per-gmem attributes
To: Alexey Kardashevskiy <aik@amd.com>, cgroups@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org, x86@kernel.org
Cc: akpm@linux-foundation.org, binbin.wu@linux.intel.com, bp@alien8.de, 
	brauner@kernel.org, chao.p.peng@intel.com, chenhuacai@kernel.org, 
	corbet@lwn.net, dave.hansen@intel.com, dave.hansen@linux.intel.com, 
	david@redhat.com, dmatlack@google.com, erdemaktas@google.com, 
	fan.du@intel.com, fvdl@google.com, haibo1.xu@intel.com, hannes@cmpxchg.org, 
	hch@infradead.org, hpa@zytor.com, hughd@google.com, ira.weiny@intel.com, 
	isaku.yamahata@intel.com, jack@suse.cz, james.morse@arm.com, 
	jarkko@kernel.org, jgg@ziepe.ca, jgowans@amazon.com, jhubbard@nvidia.com, 
	jroedel@suse.de, jthoughton@google.com, jun.miao@intel.com, 
	kai.huang@intel.com, keirf@google.com, kent.overstreet@linux.dev, 
	liam.merwick@oracle.com, maciej.wieczor-retman@intel.com, 
	mail@maciej.szmigiero.name, maobibo@loongson.cn, 
	mathieu.desnoyers@efficios.com, maz@kernel.org, mhiramat@kernel.org, 
	mhocko@kernel.org, mic@digikod.net, michael.roth@amd.com, mingo@redhat.com, 
	mlevitsk@redhat.com, mpe@ellerman.id.au, muchun.song@linux.dev, 
	nikunj@amd.com, nsaenz@amazon.es, oliver.upton@linux.dev, palmer@dabbelt.com, 
	pankaj.gupta@amd.com, paul.walmsley@sifive.com, pbonzini@redhat.com, 
	peterx@redhat.com, pgonda@google.com, prsampat@amd.com, pvorel@suse.cz, 
	qperret@google.com, richard.weiyang@gmail.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, rostedt@goodmis.org, roypat@amazon.co.uk, 
	rppt@kernel.org, seanjc@google.com, shakeel.butt@linux.dev, shuah@kernel.org, 
	steven.price@arm.com, steven.sistare@oracle.com, suzuki.poulose@arm.com, 
	tabba@google.com, tglx@linutronix.de, thomas.lendacky@amd.com, 
	vannapurve@google.com, vbabka@suse.cz, viro@zeniv.linux.org.uk, 
	vkuznets@redhat.com, wei.w.wang@intel.com, will@kernel.org, 
	willy@infradead.org, wyihan@google.com, xiaoyao.li@intel.com, 
	yan.y.zhao@intel.com, yilun.xu@intel.com, yuzenghui@huawei.com, 
	zhiquan1.li@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alexey Kardashevskiy <aik@amd.com> writes:

>
> [...snip...]
>
>

Thanks for bringing this up!

> I am trying to make it work with TEE-IO where fd of VFIO MMIO is a dmabuf=
 fd while the rest (guest RAM) is gmemfd. The above suggests that if there =
is gmemfd - then the memory attributes are handled by gmemfd which is... ex=
pected?
>

I think this is not expected.

IIUC MMIO guest physical addresses don't have an associated memslot, but
if you managed to get to that line in kvm_gmem_get_memory_attributes(),
then there is an associated memslot (slot !=3D NULL)?

Either way, guest_memfd shouldn't store attributes for guest physical
addresses that don't belong to some guest_memfd memslot.

I think we need a broader discussion for this on where to store memory
attributes for MMIO addresses.

I think we should at least have line of sight to storing memory
attributes for MMIO addresses, in case we want to design something else,
since we're putting vm_memory_attributes on a deprecation path with this
series.

Sean, what do you think?

Alexey, shall we discuss this at either the upcoming PUCK or guest_memfd
biweekly session?

> The problem at hand is that kvm_mmu_faultin_pfn() fails at "if (fault->is=
_private !=3D kvm_mem_is_private(kvm, fault->gfn))" and marking MMIO as pri=
vate using kvm_vm_ioctl_set_mem_attributes() does not work as kvm_gmem_get_=
memory_attributes() fails on dmabuf fds.
>
> I worked around this like below but wonder what is the proper way? Thanks=
,
>
>
> @@ -768,13 +768,13 @@ unsigned long kvm_gmem_get_memory_attributes(struct=
 kvm *kvm, gfn_t gfn)
>   	 */
>   	if (!slot)
>   		return 0;
>
>   	CLASS(gmem_get_file, file)(slot);
>   	if (!file)
> -		return false;
> +		return kvm_get_vm_memory_attributes(kvm, gfn);
>
>   	/*
>   	 * Don't take the filemap invalidation lock, as temporarily acquiring
>   	 * that lock wouldn't provide any meaningful protection.  The caller
>   	 * _must_ protect consumption of private vs. shared by checking
>   	 * mmu_invalidate_retry_gfn() under mmu_lock.
>
>
>
> --
> Alexey
