Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C415F3E1205
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Mar 2026 17:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772731177; cv=none; b=ZrZ93qqYlJV0IDkPQUue9a8C/kuBufR9YMUQv8hTsdrS+7al/N9A2pv5kq/coTUgVqCmKBIv9/D0Y7QSDj3IMZ3shk6UDSPfU9xIpfLkqa60kpRgiRMheAqGgUiuqnKx4TI8c6HnNMb5gAPTDBfoI0EQ5/qeEdpxlYnItuZNcHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772731177; c=relaxed/simple;
	bh=44DsyPZjR3+ZY9GszCDwqZ3g/HaaKmi7IKLakzXhb6E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u0J7V227nH5Gd6gAG26Dv9W7BecOQ73/9Xypn2ZcFLFmxWgEa8dO6cadbfFfxy+7BtiHPmZhUEPsftC5u11cdmjSI3ypF2Toy2t32ypqk2GVXbyX4OdC+4kYbls/nFbxcnpxVrn50fZYZ08Wr4GZ8Wjh0KalVzcRFIl+H0XtGHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GCMhfHi0; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GCMhfHi0"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-824af3c6c0cso3550426b3a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 09:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772731176; x=1773335976; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jvL7QI7vtAV/elV7wuwJjb0ouQ5MS/0W571Ri2ejdh8=;
        b=GCMhfHi039z0xYJI1g53I6vSeQvWegx9IdH6BuHB9ae1dJye7XciAjY25sZ+R7h03a
         +8xOBbjkbQoXMXG2cuGv+Y2veFW/RDj1y5hIQ9arJaumsbt+DD7s9fQ+Fxo5EtQ6D/9Y
         lZrJBwy5awiuOgDpLGBPR+qIV+c1a0WI30zX5FlKfodjoW4dwpf7FyC3VVQYUhHFRJQK
         CyAfo0+LLQxxp5Cw2s0jPVWcxoohsAGoZyFLsp+ZycJHUleAdsbezYwtecTBDmRC+rzE
         RtcKuYsOKaNzN3NiWSZryIC3JA6h4NJD2Fxpdc4//BsRKlClUn+3qC9Gh5EdT5inx4Pu
         G25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772731176; x=1773335976;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jvL7QI7vtAV/elV7wuwJjb0ouQ5MS/0W571Ri2ejdh8=;
        b=rVrBQx2p7/VGpj+AdRXRvrsLnfNAH9TJq2ryXJUlH46RTLtI6+h6lGy3qHQiL0QM1o
         r9E4+VHpXbuqHjF1ZPDOwCOAns3CBoXCrW364io/HvszNZdpBO59pvxnSQ9S9ZQUOugT
         YOfWNQAUiSmLWPyEUFgaU5yGvLemeOFJLoDHJ+SWPXGOY+WsRyEPHPzcthKK1OWVbZgw
         J452QtnCP86l/d4dpqsboYgYQIaCS8ZuE9louCG9+I1Tu4MNpoR2LNcqTVWe6KTOG8qq
         BNgzaP9DrQvcFMK0VfZnMWLELR+VwzVwDvU5UR2w3Ov7G4CQ4+znTFIP2TG7jvZXDR1h
         2o0w==
X-Forwarded-Encrypted: i=1; AJvYcCXts5Qv8Q1v/M0Cyt7aCuZIUsReq2Q/uYmxNiz1+RzdhxuN4WFeMzUbhd+eXYWdJHc8ccGZoOVV6x7jZnCTiNs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWCq9kJvZF+ZJnDDnLNKyddsa9LxdPqHm8NuYar7IlG5c2On6z
	t5cYXliPEYLpEgrVB9jjdhMorR0obN73xY4PoU+LnaQ0hexvN+bDN/ZWb+XXCYTtuJURWNMZWEs
	/KL7C3g==
X-Received: from pfcp25.prod.google.com ([2002:a05:6a00:a259:b0:829:808f:cb8d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4295:b0:81b:d5d9:a83a
 with SMTP id d2e1a72fcca58-8299ae60809mr419972b3a.61.1772731175885; Thu, 05
 Mar 2026 09:19:35 -0800 (PST)
Date: Thu, 5 Mar 2026 09:19:34 -0800
In-Reply-To: <20260220004223.4168331-5-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260220004223.4168331-1-dmatlack@google.com> <20260220004223.4168331-5-dmatlack@google.com>
Message-ID: <aam7JsCyQ5Oacvl5@google.com>
Subject: Re: [PATCH v2 04/10] KVM: selftests: Use u64 instead of uint64_t
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Bibo Mao <maobibo@loongson.cn>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Colin Ian King <colin.i.king@gmail.com>, David Hildenbrand <david@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Houghton <jthoughton@google.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lisa Wang <wyihan@google.com>, loongarch@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Oliver Upton <oupton@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Pratik R. Sampat" <prsampat@amd.com>, Rahul Kumar <rk0006818@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Wu Fei <wu.fei9@sanechips.com.cn>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, Feb 20, 2026, David Matlack wrote:
> -static uint64_t pread_uint64(int fd, const char *filename, uint64_t index)
> +static u64 pread_uint64(int fd, const char *filename, u64 index)

I think it's also worth converting the function to pread_u64().

>  {
> -	uint64_t value;
> +	u64 value;
>  	off_t offset = index * sizeof(value);
>  
>  	TEST_ASSERT(pread(fd, &value, sizeof(value), offset) == sizeof(value),
