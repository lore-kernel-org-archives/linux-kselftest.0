Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.219.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794254190;
	b=mCZN+kycTFTshb1PRbZp3Hiy23jR1IlLlazkYiiBH3+S9P6EQPXPew9Tj6JC18onsUvw
	 QE4giGXYnc0hBb+GCQJqeQrmEn5WSlURXMNPTZQ3BxY/S682FYxHdcAalEWe4Im+JJmTW
	 HBzK8ipD1YlaZX6se6jHeXXLOymCv82YWI42X+mLLMijOkm1ha3EAxrwuWZ65y1d3OiVB
	 RR3S/qTpXodDSCk7Z6J9+/fTACWy0332sDN4q+jpIrC7JKp+zCYiULNk4F+VXyGSx4LYQ
	 shklqOEICfXe5McB99j1f7xMJEHPEkXV/o4gw43b7d5aQv7VckoGr4aD7GlVc/4PXHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=UQsWADyvy0RizFTfpkH5RXXR2lFPEQeFdYrL6SMlC7U=;
	b=ecfu5tdPqhKJiVyngVC6GYFSEIRMaRa9tboW2IsFawXhpwiEkrd7jrbg+rsypuKkfIYg
	 409lM+9ltcYR+Du/8bLs+qusB10GLaipJAAohuUGi0dVD9TjFHglE1oqTSBUwIGaNNi1u
	 SM9zkhfqeb+fB6IUmvWNd12j1XbT5gtu24c8psrkU6JXtp0lH+FKJBVZ4NfJohUeOZIa9
	 GCtBbAgNGn+2ivCm4kTBGKxjsbIpNawdkkAJZaLhe851mguOd53VYP49pGwtDpEdHihD7
	 Sxi74oIsVJ2Dxmg8NL/lePfM4ZfK/Mm1ktWtPAqSZDvHZNAoLrBuwe8bTaNDYjZI/2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WSBziwoS;
	arc=fail smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79696606A331
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 19:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79696606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WSBziwoS
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91eb7d1478cso13321326d6.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 11:56:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794254188; cv=none;
        d=google.com; s=arc-20260327;
        b=Uduc+hVjDHLy57trorcwCTbtajk6kVJd/Mivvg7zl6Q27/MsbmC3KH5eFJVMlSul1j
         9ABewZi98lemI2k1rM0H9e8bKKaKQPcbRr6KAgcRu7xzHxha9ck99NkRhvM9vI5U7LYm
         Nm062U2xRqNAUezZsP0USiuVnoXsSdZpG3RFSekcqovy7ArRYydl7TZeg1xDCr9VsM37
         jl1TqMH9aX7NnJWQWoEZ0ZKcrdDa9qqOe+2rcINC8MXlfim4/VO91r0PlHT8Z/bNjC6Z
         ahY2r+5vZdGabMReI5Cta4/ZWzFaxsc7fCW4FRb3tKVemXGYCpWV5LvlmwLBoHP+5Chk
         LH1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=UQsWADyvy0RizFTfpkH5RXXR2lFPEQeFdYrL6SMlC7U=;
        fh=KG5XJiMBLwetw9tAM/L5GXVTi8NwuEl7Oi2d43XOEEc=;
        b=sfyINgIFYTkDyZn1U1LC+Ah9sRUlFExWzsCxoo+3ZVIB1E/kkilLHW+4xpLzRauxcO
         +JpoGQWmDfSdZumdknDawYkqydmnzFPjWLNYewdToanqzrcrXyRUIbA5V6Z1tpMGL1Av
         S1Vx52ZRRo87a5sjDLU5VXk/AWSvL01rDrcqS5+IDfKZmtz+82QWlZ32P/z0HyzoUr4s
         OPNvoOL9eJ1IKc/1h8XTlEa0pYwv/NsdOQHDQtAkHH66CZwp5eE1rAOgaMx5seVBcTE3
         VGpJzNDnkQePvR4x0nEI7eXLuHUVGkxTucwk/1P/sODSlYHzwsn2CMFi3N09xbG1eD3x
         ZOgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794254188; x=1794858988; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQsWADyvy0RizFTfpkH5RXXR2lFPEQeFdYrL6SMlC7U=;
        b=WSBziwoS8flyI5lQi9ahqDcBfOHtzvGVIpeip6fPNlY+Ge2i9VvGHvTk0SjAmMj6WY
         oy8dx9L6dC+9n99kVoiMoAcQJkha2qzfsdf6GmScQeX4Zt6VC4fMOxh+SuUz/Oovgi4T
         gPTNsc+sseOYkbHCKfQXFAl8Z/EBKmED1IBwpfFZeIhlON5MJwgCVmw0V5UkQ00ZKlR8
         xiiuDkZs+tv2LGVT+Fo9hBVASg8xUxoubEQcuuHQRwBD+UZ7YCtWrtU7vh77QHMZz3bo
         U8OowvQTEodhREy5dxVZh7swpTiUFcsF83upkmLtzweXaVRT2ZKpTzmLNh09nL4tt/2s
         2PsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794254188; x=1794858988;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UQsWADyvy0RizFTfpkH5RXXR2lFPEQeFdYrL6SMlC7U=;
        b=TFu7x4rM0DSc2VP9z+af5MOz9fLB4AeOAvFOiLGlSFUSWYpTZDZYTvpNLCuyh/busG
         WSamw8IkYdlEbMjF+jdKLLLaqq22hre5Pe7umWNIXMuBitomDh7uc0xLPHcBDKawIyP+
         pvdxzKmAvn01+Ld9j5Z0I5VqLXGqp3CMubBWbUyqmsGeAswF+YX8XTSwr3WMKYOsm05F
         CnWFROeWr/w3+/NjTXyaErKlv9KEoJoZt3YATFghVLQD5FsUhD+2WQuU2K5V6j6jLefq
         c+aNQWwpYKfRfW64hhXnCmzfKbJRLv6xJoCdNo8nao22c/us0UHtxwJg1jXK8eDvk8gc
         Jj7A==
X-Forwarded-Encrypted: i=1; AL+hErHOlzOxAe2D0w6K5rGn8p4nKVWnvDkgz7sa3GROXrVV2Y7aIspmjLU3cPEyRaR1G5C5d4Xk/osVYFrej0ta8h4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Oagkq255Okl+MzhDo0gJhyrDKZTCuzreuaBtEvBbKOE0VdHzr
	hcrblrLzbaHMTLKs0SdTp0JTexdC4TAaOnKAfpmpGzZKUTo2P8Y1D5TgBIEdzOURzr1A1+7xREP
	fPeBWY4jt5ouguDUJsTUJi8dOZ4H7aolsngmP7QUF
X-Gm-Gg: AYBFou3pZ4gV+cky9FJGwTmMC7N3TXraCD6fxsJMiYMMtMbewsNmF5nr1M6LwaYsH9W
	HZR9e3l8QYtv8QdoN/tuZRjt0/cVpkJv0vs6+OGp4fkAZLDVxzuS6l2Ym/eqERYjxihwnVKA1FB
	zXNNLhzh9nrHmShQzW2N42X/qg7wLeLZZreF3whVMMkqa4YDMewyFNZAUB3fOY16E0C2NzlSacH
	ei/Hb6EeSj2aDAvrylySzBPYGIYo7S0qlgMjfNBo00ojAzYpTbaSCVGHjTVTGL6EEdrA4okRSev
	eOWfrR1XOd4nl3EEF0IDpq9UBBmPXgPSVEMkv1aQ/SH2nZO9S4d928xkdmI6YZhoDzrlN5MKBPY
	t5CwmyIco84ZttvhZqNmGAb/kTY5OiuSaxYHf68IU5ceDB/1ZWzysV8dvzUAaelGyXJsjXxuBy3
	Tbrx+hzeCq1+6RqwKu6fGmyWEvFJi7lE9QCeRSHnRwr59u
X-Received: by 2002:a05:6214:1d21:b0:91e:9664:4e2b with SMTP id
 6a1803df08f44-91eef7a3c83mr11733606d6.7.1794254187357; Mon, 09 Nov 2026
 11:56:27 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Nov 2026 11:56:26 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261105-tdx-selftests-v16-11-2024e8fa517a@google.com>
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com> <20261105-tdx-selftests-v16-11-2024e8fa517a@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 9 Nov 2026 11:56:26 -0800
X-Gm-Features: AclHuK-1WjXMX68h1oPEz4A9GDozdAxxlHkeQ9giBYSNuXqnEZTuJ6BoJAHDbqQ
Message-ID: <CAEvNRgFTor8fZzRRMMv5cXvxu7NCiKEOpbh77HSHGEdRRbt9EA@mail.gmail.com>
Subject: Re: [PATCH v16 11/20] KVM: selftests: Require guest_memfd for TDX VMs
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

> Force guest_memfd for TDX VMs.
>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
>  tools/testing/selftests/kvm/lib/kvm_util.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
> index d42e201eba76..b73a7bfe8531 100644
> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
> @@ -494,7 +494,7 @@ void kvm_set_files_rlimit(u32 nr_vcpus)
>  static bool is_guest_memfd_required(struct vm_shape shape)
>  {
>  #ifdef __x86_64__
> -	return shape.type == KVM_X86_SNP_VM;
> +	return shape.type == KVM_X86_SNP_VM || shape.type == KVM_X86_TDX_VM;
>  #else
>  	return false;
>  #endif
>
> --
> 2.56.0.455.g6c5a503b38-goog

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
