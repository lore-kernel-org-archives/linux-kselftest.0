Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9D0481AB3
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 21:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792014431; cv=pass; b=TB3xiR2PlXWTGAq2eyhHVgDGBSU+1ZoXQm1URLSZlhrEz55dQJRH+V4FfddrWEfthJNmat2PJkCOgUWS8WVCsJrAiGZgydX8jRZTFxXxwzjPFzRz95gk9RhEkbwPBza2nEulP3GPFN3EPp/++Z6DxkBdFz2FA5C3uJ38sZFR95c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792014431; c=relaxed/simple;
	bh=MCaOs6wYNSB4LFrsDrFCk/QlJZrshEPv8X72I3y+9V4=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IfEv6SFTqlVOr59mKWeUiUwxGUDF2CnNOymUD/KKuvTK/mJ/q3Ppy2LC8FXIFOgpFgZaYlZSNFAwKDcU6RuItGgPiUDhIIWy/63iGdNRY1bG0+4PHjX16yd0nV0xRsT4vcjIJzFJWaUKFximEImY875Ox+Gl/Q9SKJUWGdShd24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JSlx6hcL; arc=pass smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JSlx6hcL"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-917bab38b14so9558656d6.3
        for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 14:47:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792014428; cv=none;
        d=google.com; s=arc-20260327;
        b=ihdK88j+5Uk4nkn32UxNxbdr0pFR32lPR1Ww6OKCI/s7Xr1OAA17GLiADN+JkgZEXV
         AanhQCnXhejGZUwj/MfgTndketBYG+ptJFsb3f5QqIc9x/iUqFXsB4vpWG8Rfy7/M2QL
         6MdPugjrcLXKI7o26sVoE/ZkmJhEmUDKUIH1MFP3OmU9onCEI142PtmbFChHhcOQLyrH
         7Bw2w4asw08gdXuAUMAlvN66B+atm3YL3yaCj5ZR7ahlLqdMzLIqC4a8Xs/7aYPOhLjH
         xcNu2tlBaQSvlb0uyIMBEmo+uDpHThOcOShpJkCWxzNHV9J7+e1gexw8XFvy+By/62iO
         FJgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=OmdjCtO0BT/G+HosYDOiIQ+MFbY+P6PHIY8xmD++EWw=;
        fh=XN4YKBsxM7xx81fycX2tIaunJu2yI2ACgG67tgyecrg=;
        b=KQ7HGK4QVNXH9bzGI59g3tB6uWMOpYQ2bgtAABQBWrIf3wolZnSi8VM4jfQml99zIz
         rJwJ/11T0aQ/ZwcBwL4O91fUftoYmbrnh61fZmtM28oabMiwzrE3Ltqra2rU2ndyeR8y
         blOk0dmuHtU9nKiSdonLK0TMwFna6r0VjPs4yHtkbAKLsFIr8ORQIJ2uPivsq/gV/mAe
         i/8cKkYGwAEz85s8GIFLwC1gEqfFb1nZa24gSylYqTzZD6b93p77aRCibVGsgv3fT4n8
         pPk2/miPR3JipUqF1+LGXEBTWNEzkVcx4xoeF3ydRrgbL3aqliW2HA6yr4Chog53p+yg
         4azw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792014428; x=1792619228; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OmdjCtO0BT/G+HosYDOiIQ+MFbY+P6PHIY8xmD++EWw=;
        b=JSlx6hcLclOXuJ5rv3+BmT4OEpImG6UFCv/raPoxbZEOidM0DzSBwdQXAGriIr5Edi
         TX49nUQL9NtrVe4u+GPwa7n6xU/AhixY0AegBACIRbdRq28mgasEndHIualDvFy5LTPR
         Yd3gXeECBDYDxwABK6N/c2Y5Bd569usZ9CnVMiPRnI9BCDNLO669UbiMbWpWoG0hybMP
         Fg3j32XupqTXaDb2z4g+fRVyyR+vUo4P5ieSz11ab59S9VrUJWGyQvPd537Na+l0XY/n
         aR8oZ+YeefMeUY6gOU5UGsAW0Pf7GZUucXuC3HiPHqoHE81Qasn/aee2qAy7sGopm65T
         szew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792014428; x=1792619228;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OmdjCtO0BT/G+HosYDOiIQ+MFbY+P6PHIY8xmD++EWw=;
        b=Wu71cRamZ/CNEArhvo9o/xVhMT3NQJs7Sky2T1uMYZ9AfOJ2nZR4rmsKWg3EhVR3pI
         pPkIx8H5uI/REtt+gJMD/jdnxQ8A6wjlWcitq1maNddmm/l/cvdKdQbj+K1fIxNMhYh9
         fFCCWlayUZhe7EB7CH9NDaD9Wu13bBNilSjJvqXlgSDsRQ7V8kxnCk+n78q/VGcb8TFQ
         KloAA9c5hxRkBa2mrSN2J2nPalhNm2OMfP6xlR2CUip2LwD0qxOr1yFDP6wKiwueWozG
         RmXgU81EkBpkM9aly4sWWolAxvfwCJzEG+KOJPAKNt4WkX7F7apGZlSklSzQ4yaS2wYM
         CVGA==
X-Forwarded-Encrypted: i=1; AKwUvBxxpeNeC3guatNLr3H0ax01sRJlA8LuEx9v6NGcqtw7bN4XJdlhYcYG5dfqJ4GZbOv9vYkrnX4odmmN+hc2R1A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXw1hlJ5dNf/QX/q+Sg5GsqcZb16GbhNGjJGNoKXmiN8QMo0Mm
	sJSC2i2pBs1aK6Izk/G/3O+fcJmKyTh+1zVR3ghnp9MOC8NkiaL5jUaQbOUgSGi7FcEMkNRsVe6
	w5f/R2dJp13nQ4QVVhPVay1kGcjbh12yvkZITU4JV
X-Gm-Gg: AYBFou0001yuRX7JIT/UOQHiQa7odVWlwm1EhDuK6+QI7Zem8hUSFno5SE+m4MLV12K
	Pvw4UpyeGU0p5r0RMvCcuBc5Jf6u5dlMLNS28ju6E4Rf/BsZAFly0+leJaf47Ul76Up1oV5e41Y
	m22UZWbzQnbBdztHBHpE3NN3xYflSITuUuQe0hCd8YGwthvMHAo1kWQakJfDLTwL8MBftgccOBm
	9Ka+7NwJLp6fAlq0aM6cRzRs7QAibopK/RUOtk4PeEHqG+yAty8nplC/f4/YeYNZlY3UbZlRSLe
	EpxiQdfHdi5x0yBMZOljU3gCHET6MSDjPXnknQ2mi8EETTObWPkfcXpeSM7M2haB2FYcytsvhlU
	H2sbIn8Ae/A8pGE2GXATaJEG/tyACd4zc5FtULwAQy7qE7fK3Mr3p
X-Received: by 2002:a05:6214:43c1:b0:91b:8e06:73f5 with SMTP id
 6a1803df08f44-91b8e0680ffmr139578016d6.15.1792014427625; Wed, 14 Oct 2026
 14:47:07 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 14:47:06 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 14:47:06 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261014095702.39676-1-griffoul@gmail.com>
References: <20260720111259.122911-1-dwmw2@infradead.org> <20261006183235.16576-1-griffoul@gmail.com>
 <CAEvNRgEseLO+LbkwXrEit0H2LH5Wx-srSvHEMpt0=upPL3tF=g@mail.gmail.com> <20261014095702.39676-1-griffoul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 14 Oct 2026 14:47:06 -0700
X-Gm-Features: AclHuK_bDoENPFsEJnePb9piUrHFuROo5b9vCnTZ7F3PMjuUH-N1Jl6pvQGbDQg
Message-ID: <CAEvNRgHtB8j6=9r=txjsKvQM0F85nRN4KW5sdnuv_-Og=cWEfg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/9] mm: Memory providers for guest_memfd and iommufd
To: Fred Griffoul <griffoul@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>
Cc: David Woodhouse <dwmw2@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Fred Griffoul <griffoul@gmail.com> writes:

> Ackerley Tng <ackerleytng@google.com> writes:
>
>> When the provider wants to revoke the page, the notifications/function
>> calls flow this way, the last [ENTITY] in the chain actually does the
>> zapping.
>>
>> + [PROVIDER] -> [KVM]
>> + [PROVIDER] -> [DMABUF] -> [IOMMU]
>> + [PROVIDER] -> [GUEST_MEMFD] -> [USERSPACE] (AFAICT this was not
>>   implemented in the RFC.)
>
> Thanks for going through it. I have just posted v2:
>
>   https://lore.kernel.org/all/20261014093733.90312-1-griffoul@gmail.com/
>
> It changes two of these chains. dma-buf is gone: iommufd attaches to
> the provider file itself, through a small interface in mm. And
> guest_memfd now maps the file into userspace from the provider's
> frames, so a revoke also zaps the VMM's mapping:
>
>   [PROVIDER] -> [GUEST_MEMFD] -> [KVM], [USERSPACE]
>   [PROVIDER] -> [IOMMU]
>

Thanks :)

>> IIUC guest_memfd conversions was not illustrated in the RFC: what
>> happens on a shared -> private conversion?
>
> There are none yet. Only VMs of type KVM_X86_DEFAULT_VM can use a
> provider, so all their memory is shared.
>

To borrow David's words, the part about this that makes me itch is
conversion. We have to support conversions. Even if it doesn't merge in
the first patch series, we have to have line of sight to how conversions
would work.

Conversion requests originate from the guest and then the host handles
the guest request by making calling an ioctl on guest_memfd. Hopefully
this part doesn't change with alternative provider support.

Suppose guest_memfd still gets the conversion request first, in RFCv2,
to reach all the mappings in various page tables, it would have to be

+ [GUEST_MEMFD] -> [KVM], [USERSPACE]
+ [GUEST_MEMFD] -> [PROVIDER] -> [IOMMU]

since guest_memfd must ensure no IOMMU mappings to guest private pages?
There's that extra step through the [PROVIDER]...

>> Does your provider need to know if some memory was transitioned between
>> shared/private states? The provider can be notified too, if
>> necessary. If not, then isn't guest_memfd doing all the coordination
>> better than going via the provider?
>
> Our provider does not need to know, and I agree: once there is private
> memory, guest_memfd converts the pages, so it should tell the others
> what to zap.
>
> I think the two models meet there, and the v2 cover letter now says so.
> The iommufd side of v2 does not pin and keeps no references: it asks for
> the frame behind each page, treats a page with no frame as a hole, and
> maps again on a revoke. guest_memfd can offer that for its own file:
> shared pages return their frames, private pages are holes, and
> guest_memfd revokes a range whenever it converts it, in either
> direction. That is your [GUEST_MEMFD] -> [IOMMU], and it should work for
> folio-backed guest_memfd without memfd_pin_folios() or refcounts, as
> long as guest_memfd also revokes a range before it frees its folios.
>

This part makes sense, if I'm understanding you correctly.

> The one difference is that v2 also lets iommufd map a provider file
> directly. Going through guest_memfd would add nothing without private
> memory: it would only pass each revoke on. And memory that only devices
> use, such as MMIO, does not go through guest_memfd at all. Both paths
> would use the same iommufd code.
>
>> Does the revocation model work for you? If it helps, I can rebuild the
>> sample provider to illustrate how the revocation can be done.
>
> Yes, the revocation model works for us. v2 replaces David's sample
> with one that moves, donates and makes pages read-only, and a selftest
> that checks the guest, the device and the VMM's mapping after each
> change. It may be a good base if you want to try guest_memfd as the
> provider for iommufd on top of it.
>

Thanks, I will prototype what I have in mind too to make sure things
work as I think they will :)

>> 4. [DIRECTMAP] Kernel direct map.
>
> Agreed, that is separate. The memory we have in mind is a range hidden
> from the host with memmap=, so it is not in the direct map.
>
> Thanks,
> Fred
