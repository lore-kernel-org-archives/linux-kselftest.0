Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413447;
	b=JBM01kkiJL3oOEcEYOBYUVlkZr/LD9++WFRMvPOnh4+GB1iK7Givi7ZzVlx2Q3D2n622
	 5ecSg8W2f+Hp/Pe5YQzl9REfa2jg1u/x7oOPpKFasf65QTm3KfZq3XcMN/C3BEhMQWkRo
	 EoWsxuktUqJgp/lNltNEkTgKbmcBgSqyE3W7hnUlJ/vpXZymJIzK8Wp7/MlSckebOSAs5
	 S4qawplTol3ZBe/B/f2jWNyF4k4sCtAgsgRfN0G5Kb9CGNRUH/QI3nYUl3VPjdbDY2/hO
	 Qf66P/9jtk0I9sE8H79sEg8L9s2avb64HI1d0Ic9BxEGZi+AMALZNTdu4PSWYiiAn5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=/fQfvN//SsC5kV/BzNX6zgi6Mg1pRUnE62HeFEaVagc=;
	b=LVXl2NeWTsqrypD5cPq5u50U6txMx29jzSBtWn11sESpbrNzfx6/nCp2NwTPz8IYzpuK
	 2+8yjL2ozO9NzNQCL0V/KXiWuE30nMKt55/JcS3fDLKIh973utck/fPHnlA+mVLdYjdxT
	 7uJYokeg7njIh8sp088+s2L0H9gf5YbSs5T9FgYNtD98/GZecT8Fe2MCA8n/pzWUv4uvO
	 0aD0vA2KJHMHEDWnG9CVeacY0/q/kWtnVw4Tyu0Oy8BYIrEzrhRhZuXD3kRGJygpY85RQ
	 jG6piJftp2Gk39EnnAjKt/BScdo4CO1ou/fpJJRzk2nZk5kFyWGU65nugEciP0m/pcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V9OfH5IJ;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B40606A335
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 16:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63B40606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V9OfH5IJ
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b175a69ab8so1942937a91.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 08:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794413446; x=1795018246; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/fQfvN//SsC5kV/BzNX6zgi6Mg1pRUnE62HeFEaVagc=;
        b=V9OfH5IJti8IaVMsGoGROmRICksQAWzg5oySMiDPT3HFdwJeZaGbgLepEbyWICtY/z
         ASPtpqwLTqrU36T4NSMfOERJsgOYJFYH98JqtSK1vClQSq4oX1XlXhEq+XCq4cPEMwlI
         fkyCwFHqvv0gRYfSZFXY9EHnG44ZeTZBKqPPoQDDX99WL+mbTJ16idpMqrxARh8SVzN4
         IA1aUvA2GcXJKmXeZcUNBrMQSwRPD7h6dgj0fJdX2qV11cp7ZEUYpTUmUmkurs7FH/jP
         IKlpzd9jBXwPxkum5RtHQuh9di1FuRJ0Tnw4GUxuMVQCMElmKeaSU4n4282VsI9zpCq0
         vbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413446; x=1795018246;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/fQfvN//SsC5kV/BzNX6zgi6Mg1pRUnE62HeFEaVagc=;
        b=NIWnsy5w7o60BxPRd4kNnD4eQgmcnp8TTSnzwEbjIAzEWTqHTo+Y9rVvvPmJxvYrJG
         xdASCZTSFUqpapwyfuuWg8IYeYsdloXCCmfb6e9iCu/2KPoHrz5QtJxHb+YOCDA2pHRY
         VGSSKKfm7iLGSB38QiOGOHC/A3F/jCQIlNgcvBTdapfQnT9WIBQrEml3RPJSzAEruHUs
         XymV/Z2TCo7vsOexr+EfyIhqGH6K6U+WvXiJI0CxyFspVC1gXB+1Fh+KnauDbvZnHlLy
         rBwKl3BGNhXAlWJ/5magVBeLrUWsbWWrjWpPIZ7/Me9KNPWHPd49Mo49UG8QHy3lR+fC
         krUg==
X-Forwarded-Encrypted: i=1; AL+hErHYDmFsjSOgjirFLjvJoU/ny5JwFtFnaWjsopM9ypX//zCHWpvszbtIUgNKfMo4F6rdu4GmOvAYsDhnRZgL94w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZBdkzl4h1kXM0H9961koCHgO4pKxJ3iP48O69HyywrfdWq81k
	kPYjSeuWZov/b5o3zJiwcSmfMnswCIHn9CDak6VRfJiPUHzoaQjDwWpAo6NMxOGBG2+W+dJJE3X
	DMQR9IA==
X-Received: from pjbkn15.prod.google.com ([2002:a17:90b:480f:b0:3ae:b67:263])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2f86:b0:39e:6c68:c77a
 with SMTP id 98e67ed59e1d1-3b182f2699emr2883420a91.48.1794413445538; Wed, 11
 Nov 2026 08:10:45 -0800 (PST)
Date: Wed, 11 Nov 2026 08:10:44 -0800
In-Reply-To: <833af78b-60b9-4031-88e0-555363f8dd0b@intel.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com>
 <20261105-tdx-selftests-v16-12-2024e8fa517a@google.com> <833af78b-60b9-4031-88e0-555363f8dd0b@intel.com>
Message-ID: <avSThO-PZPrIfT5g@seanjc-mac.roam.internal>
Subject: Re: [PATCH v16 12/20] KVM: selftests: Call KVM_TDX_INIT_VCPU when
 creating a new TDX vcpu
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Ackerley Tng <ackerleytng@google.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Chao Gao <chao.gao@intel.com>, Chenyi Qiang <chenyi.qiang@intel.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Erdem Aktas <erdemaktas@google.com>, 
	Ira Weiny <iweiny@kernel.org>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, "Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, 
	Reinette Chatre <reinette.chatre@intel.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Roger Wang <runanwang@google.com>, Ryan Afranji <afranji@google.com>, 
	Sagi Shahar <sagis@google.com>, Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Nov 11, 2026, Xiaoyao Li wrote:
> On 11/6/2026 7:46 AM, Lisa Wang wrote:
> > diff --git a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
> > index 4330290d29e9..9d951f67b3b5 100644
> > --- a/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
> > +++ b/tools/testing/selftests/kvm/include/x86/tdx/tdx_util.h
> > @@ -46,9 +46,31 @@ static inline bool is_tdx_vm(struct kvm_vm *vm)
> >  		    #cmd, ret, errno, strerror(errno), hw_error);	\
> >  })
> >  
> > +#define __tdx_vcpu_ioctl(vcpu, cmd, _flags, arg)			\
> > +({									\
> > +	union {								\
> > +		struct kvm_tdx_cmd c;					\
> > +		unsigned long raw;					\
> > +	} tdx_cmd = { .c = {						\
> > +		.id = (cmd),						\
> > +		.flags = (u32)(_flags),					\
> > +		.data = (u64)(arg),					\
> > +	} };								\
> > +									\
> > +	__vcpu_ioctl(vcpu, KVM_MEMORY_ENCRYPT_OP, &tdx_cmd.raw);	\
> > +})
> > +
> > +#define tdx_vcpu_ioctl(vcpu, cmd, flags, arg)				\
> > +({									\
> > +	int ret = __tdx_vcpu_ioctl(vcpu, cmd, flags, arg);		\
> > +									\
> > +	TEST_ASSERT(!ret, "%s failed, rc: %i errno: %i (%s)",		\
> 
> Nit: tdx_vm_ioctl() uses %d for ret, while it uses %i for ret. It's better to
> make them consitent.

Ugh, KVM is anything but consistent.  I didn't even realize half the macros use
%i instead of %d.

I chose to "fix" tdx_vm_ioctl() purely because it has the completely unnecessary
PRIx64:

	TEST_ASSERT(!ret,						\
		    "%s failed, rc: %i errno: %i (%s) hw_error: 0x%lx",	\
		    #cmd, ret, errno, strerror(errno), hw_error);	\
