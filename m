Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4FD253958
	for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 23:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781566438; cv=none; b=CupXvyESsnJfgWHqA8kb3dxxnAD+lHgHy1gh9aeuHpc+Gl8oW52vcsBx+ilakJmRA5IIIsaxo7fd877kj9FuNky5T0mLagWzKEMcQrLVhX+PRyziLYwLL/nMG/jJ53QtpxgSN7mqMpQE4aspoZlb19whGRFn3jr33n5YWoeHo1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781566438; c=relaxed/simple;
	bh=wkWq1YyQe9HfMn5h5fwETvev7LwtmAAMc8+W6YYydmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AyJNh5KvKmZbmjunjpJ5JjUb1IZogppHVnZUjXKt+Hc5gDPQQ9IfhRBfDyJxJFCiaXGuv/t6+n+B/QlJfNmpLb1omiWF2Ru2l+0S4WBnvBldw/wL6eEJfdljf1c1KFVrokjEbKO3FOxq1qz7VK9fsT31pqDgbjq3olIExl9L1v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XAp0NZoD; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XAp0NZoD"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bf2d865383so12695ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 16:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781566436; x=1782171236; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7RZpXrhOisaz0Hy21Y75kOiIkZX6dkWHiipcMDxVBGY=;
        b=XAp0NZoD5l1PgFxMpubiNVcwO9ElOcTTqhX+narwtcVZO+DUd82mBQYyQwKMxjuwO9
         TKdw/T/3+ASzaVaG/NJi+Ghs3b9vnJYLBFoUf3VNfaZR2fT/pJ95QOOr/u/hwkFkjbgG
         H65+9hof3ziKy2GkymwmN64YsZsYQo60737v6UWaARPxI2eJHs7uvSbRFmBB34Zf1DHU
         BCofUzJ/NlGcIJppxAAYgXdRjSX3ZYu94tqD5lVMSjcqLe/shcdOD81Q06nc0wNvVcX9
         u+bO7+qaFPP31xLcum84kTqfey5p3bleLBBA2HQwrmdQsd28fBNxNU18LbjDmkSG27km
         WFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781566436; x=1782171236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7RZpXrhOisaz0Hy21Y75kOiIkZX6dkWHiipcMDxVBGY=;
        b=V8Fdg9Srf7hbzB93Jx2fbLPoB0LwHc77YfSq5I3Qztab0LOJ2XXEimn1eCl2d2WgcN
         Nc9FAUrDGdaGIzgu77RW2xP1ETvBYk3d0nxFTvrlsbKbBYwOzxDyIyi6A6sHSYoILiJY
         5xayL41ecPQoWXcWGQ+N2C8zOdc+my5gnZv3KQq6nBjkIEkeEHg1yk69fro54Zt28E02
         39jTeyWJkbW55w2+69fDfGI5qfEHiwXuCKRrLeN9ED98KPO/Bw/Y6M6WlURZnyMX5sTL
         MAikeLbkTomCLdkAEc3Y4LTK/jIF0+aGIhli/UgZvxHXO7RAfkPSjGK+t3TGR495aX8M
         Tiyw==
X-Forwarded-Encrypted: i=1; AFNElJ+90k+RioGX8VAmlRGTePPpHxxLiB+Tf7j2YDdYss84xXvX8ZHqmSUEmfwXQ/Z0gWujs0zVBQa2iu7IXIfLerg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVpuUMA1EddcfvD66FvF9fKLpuSms/io+NzrYZuHBomBoWrFSE
	AwG8+X46f5cCoIMujKI7l95wa6/hwI/HPdBnkDAAIwvrhdxGosiY+j7rkOdkyz4I0w==
X-Gm-Gg: Acq92OEOdRTiGJfVa73BTq6S6ZBblpVcWoZUShbH6Ba1nk4ktgw0E0bqjmMC78EYZJ5
	yQzqEsda64bsC/KmnEclglqcNULwrroCAtOpWpRP71tZLsK21U2jDswNTu+5NUSdP5O/Ef063RM
	ERykDOOViNY435t5edN1ERsYHQ0bW1YVwtaAJbjVILKJS93CakN0duWd9OD+wGQhuIqv9L338q+
	Ekv7b6Rs8IoRmgwHTt+JWt40L3kEdxNE7XcSPKp8K5VytydcLJ4O4PJoy/A4qkw+XMO5Auiuyl1
	FiBxBlBrQJAy4ZJLCCFBVzHKmV+PZRLBydVdgmQt0Y8sWpB6F8a1pfe1gX8cjvkkke4Elhqpj28
	TOr+eaUJU/JdnptH8aeqntNYhW29I3efz5GvzS74epfEAlny9tuXqCtrQTuR3EItrQPIV2AXJj9
	a6xkklLkRBizfOY6qO3MemOY0WkLEpaPm4c5Ujey+m7CCr8Smurq5UBBXI
X-Received: by 2002:a17:902:f541:b0:2c1:4228:3321 with SMTP id d9443c01a7336-2c69a2c4cd4mr979115ad.12.1781566435833;
        Mon, 15 Jun 2026 16:33:55 -0700 (PDT)
Received: from google.com (230.0.127.34.bc.googleusercontent.com. [34.127.0.230])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac631sm112076765ad.44.2026.06.15.16.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 16:33:55 -0700 (PDT)
Date: Mon, 15 Jun 2026 23:33:51 +0000
From: Lisa Wang <wyihan@google.com>
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Chao Gao <chao.gao@intel.com>,
	Chenyi Qiang <chenyi.qiang@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Erdem Aktas <erdemaktas@google.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Kiryl Shutsemau <kas@kernel.org>, linux-kselftest@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Roger Wang <runanwang@google.com>,
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v13 03/22] KVM: selftests: Initialize the TDX VM
Message-ID: <ajCL34gnp2nDVM0K@google.com>
References: <20260521-tdx-selftests-v13-v13-0-6983ae4c3a4d@google.com>
 <20260521-tdx-selftests-v13-v13-3-6983ae4c3a4d@google.com>
 <a58e2941-77f9-43cf-a54d-023506dd7eb0@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a58e2941-77f9-43cf-a54d-023506dd7eb0@linux.intel.com>

On Mon, Jun 08, 2026 at 01:57:24PM +0800, Binbin Wu wrote:
[...snip...]
> +	} tdx_cmd = { .c = {						\
> +		.id = (cmd),						\
> +		.flags = (u32)(_flags),				\
> > +		.data = (u64)(arg),				\
> 
> Nit:
> The two lines' backslashes are misaligned.
> 
> > +
> > +#define tdx_vm_ioctl(vm, cmd, flags, arg)				\
> > +({									\
> > +	int ret = __tdx_vm_ioctl(vm, cmd, flags, arg);			\
> 
> tdx_cmd.c.hw_error is u64 and it could be assigned to ret, which is a int,
> the upper bits could be truncated if the upper 32-bit is set.

Thanks. Will fix these in the next version.

Lisa

> > +									\
> > +	__TEST_ASSERT_VM_VCPU_IOCTL(!ret, #cmd,	ret, vm);		\
> > +})
> > +
> > +void tdx_init_vm(struct kvm_vm *vm, u64 attributes);
> > +
> >  #endif /* SELFTESTS_TDX_TDX_UTIL_H */[...]
