Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF7338C2C3
	for <linux-kselftest@vger.kernel.org>; Fri,  5 Jun 2026 17:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780682333; cv=none; b=Pzr4ngUOT5hP00oiX1LvKUoRErXdON4gV2W2KIz3VWtRLHaJPwxeNPlf2q/8M4LQCHx8p5qNnNK0tWsWOYdXamPHXmQh/xvNBK5SDBMvdRfw4OUjwpJG7DbVQIl7GYQOSXCWc90wJ+07PLBJm3qBtaMCH8UJWVscITJrx36s+JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780682333; c=relaxed/simple;
	bh=x86P0hCaA9P2MALnrduYKxx4y20a23f8MWvegFcyK1Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZgSHwegJ0P9OHtXmPN4Pv3WLna21QQxu215iqQ8XJYBEdHPmECMX8hXHu2coCdRi809vsstyHx6bgI3kj/a6qTbLkLXCtGlpz+7AULq+6Gi2lNF3FvLaNNyAN784nt4tktlzy8WYnNs9UWmoF5gzkWKCRjB3qm45cmRYZlt10LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SjXt0Ayj; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SjXt0Ayj"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c85a2ed88c8so2444007a12.3
        for <linux-kselftest@vger.kernel.org>; Fri, 05 Jun 2026 10:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780682331; x=1781287131; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nb5QFbdIl+gNz2ph7qrt8I6eQo3B9HFVcNOaGdwtT/U=;
        b=SjXt0AyjWGKWqtyI4NOfT+Ek+tSVuop3jMYI2Uo/fIhTZmi5SLFuiNEmoYMnNjaUMV
         S4nm5gHWqeMA0ScZNyT822jJ55cnVebyiIL/Wol0fA1ky9CbZoq3OdCYnTaQdvAVW/1/
         2muuPkTqLB+rUhJI2J5FuLQ/nSIVeMc563rnSzBC8areCz1/bt8m+o6Ohu8YX4aCtTHv
         yLdOwxvceJau7kikUCtJNaDfTQHi1Zsik8eu13Raai6sqpbztdvIyiHMYwaW8tOzlePZ
         03uBQfKs4lj/69fDezr9VxVCjkmMhwtn6bTR8/gca5BaXPU6q/xsAMzrjIjbDTj1j6mR
         uj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780682331; x=1781287131;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nb5QFbdIl+gNz2ph7qrt8I6eQo3B9HFVcNOaGdwtT/U=;
        b=UeDkAotc6OtFpZUSvhOpxAFdY4bc/lX8apoq33csvwRIEiVQsKKYtr97SnseIgphv8
         W4iYyywaj8R8F2oNEmpaBJ9i1e8bOtl2G0K5blDVOk6O1oPKOrnbcH7gejZ8CYTUl5Kd
         6pSrxdwKYGj9wjDTk6I3j2Gy5Df05ry7TonMl8WPuy08UeiAHIsPI0uPfsUk1YMJI0wz
         an/Ugoq8MKxQ1mXnuG6CmLK8znJU9b8sogUsEr6dDhwSOmZxUdxGhxjWNxofv5tg2sLD
         JZ9yAEwh/m6zi0GmHlFjSwdj7yONOGMudYtkz3zTzMgbu+HGIJgdnC/DaHHX/pIOjVCG
         MZgQ==
X-Forwarded-Encrypted: i=1; AFNElJ/gXUlqquZrR+LxelzcYCoRUkSQHOW+4mG752Xl5FPY/lyBsdqqdpxcQSsUdvWVtAnYrnMlsOfR4wqWKiUtAec=@vger.kernel.org
X-Gm-Message-State: AOJu0YylmWvgcd6c2lOaoQ2lXpShpoVPj6+Dd8GdZUpNpyUZ76OA1TOm
	yyQ/NW1iYqtZMXxzSk0M6EeHdyXfrkXBh15QgGx2Vyi34C4hVsIVAWIsPV/smH9QvO8jQJcNFEs
	zynUmbg==
X-Received: from pggg6.prod.google.com ([2002:a63:2006:0:b0:c82:798f:628b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9089:b0:3b4:8b89:9fac
 with SMTP id adf61e73a8af0-3b4cd0109f6mr6075295637.23.1780682330882; Fri, 05
 Jun 2026 10:58:50 -0700 (PDT)
Date: Fri, 5 Jun 2026 10:58:50 -0700
In-Reply-To: <CAEvNRgHEq-hHcTivUw8TYBeMu-RpS=Ho4DXaNXKQKLPL_biTgg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
 <20260521-tdx-selftests-v13-v13-19-6983ae4c3a4d@google.com> <CAEvNRgHEq-hHcTivUw8TYBeMu-RpS=Ho4DXaNXKQKLPL_biTgg@mail.gmail.com>
Message-ID: <aiMOWkiVBqoQDAPd@google.com>
Subject: Re: [PATCH v13 19/22] KVM: selftests: Finalize TD memory as part of kvm_arch_vm_finalize_vcpus
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, Shuah Khan <shuah@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Jun 05, 2026, Ackerley Tng wrote:
> Lisa Wang <wyihan@google.com> writes:
> 
> > From: Sagi Shahar <sagis@google.com>
> >
> > Finalize TDX VM after creation to make it runnable.
> >
> > Signed-off-by: Sagi Shahar <sagis@google.com>
> > Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> > Signed-off-by: Lisa Wang <wyihan@google.com>
> > ---
> >  tools/testing/selftests/kvm/lib/x86/processor.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
> > index d84c629a1945..842cac168e99 100644
> > --- a/tools/testing/selftests/kvm/lib/x86/processor.c
> > +++ b/tools/testing/selftests/kvm/lib/x86/processor.c
> > @@ -1479,6 +1479,12 @@ bool kvm_arch_has_default_irqchip(void)
> >  	return true;
> >  }
> >
> > +void kvm_arch_vm_finalize_vcpus(struct kvm_vm *vm)
> > +{
> > +	if (is_tdx_vm(vm))
> > +		tdx_vm_finalize(vm);
> > +}
> > +
> 
> This doesn't necessarily block this series, we could (re)move this
> later: I'm not sure if kvm_arch_vm_finalize_vcpus() is the correct place
> to be finalizing the VM.
>
> Was kvm_arch_vm_finalize_vcpus() supposed to be for finalizing vCPUs
> instead?
> 
> The awkward part is that kvm_arch_vm_finalize_vcpus() is called from
> __vm_create_with_vcpus().
> 
> While building this POC to test conversions [1] I only wanted to create
> the vm and vcpus and didn't want to finalize yet, since I still needed
> to do more mappings in the guest (and I needed the vm pointer to do
> mappings in the guest).

Hmm, I would argue this is a flaw in the selftests infrastructure.  IMO, as a
developer, it's quite surprising that the current value of a global variable
doesn't show up in the VM automagically.  I totally understand why selftests
work that way, but it's certainly odd and annoying.  If _that_ were solved, then
the kludginess of what you're doing goes away.

The other way this could be solved is by adding support for annotating globals
with a __shared flag, a la the kernel's __bss_decrypted, so that loading memory
into the VM can automatically mark the associated globals' pages as shared.

> Would calling tdx_vm_finalize() from within vcpu_run(), just once, be
> too magical?

Yes.

> It's also possible to have some kvm_vm_finalize() call that can be
> explicitly and manually invoked from selftests just for CoCo selftests.

Why bother?  It's obviously possible to all kvm_arch_vm_finalize_vcpus() directly.
