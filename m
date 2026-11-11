Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794436166;
	b=e1dbJcv9f3BGtFQ5Mvk4nN2WA62ZbYNiUB2Bl4Cf1mmBA3rjzRVxTpELEFkka4B7g3wF
	 Pl0NqvZze4UdxqCtVDooOmxXK3IrJC2q57oENFyTQhg0ZN862OFZgoPZvnwGXHionyqIu
	 3ygPAvHmpjjo013a9amKf97TvXt5Quft+eU8x3H+eL4xeGFOH6mIJSd/JCXohc4QDVhmi
	 mZ3dRRm6ks6brD0IhFiXBef2XretH2RD0YohlQzPSIBtkAuzaG9jkxofh0OvJcHoCDs8m
	 L0hp8vegTpZoK4nsy2wr5AKJofLBG7tGlsBnBrfTPYMo8szcruKE/fAJpvPp856tuYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794436166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=VhufRV4BoS98pezOde2Ss8la06aT4y3vZY8jTMf1PWs=;
	b=AMjaY0qIwJBJpoqwbSkeci5+pZLO2jgMggdMDK7vtvCzQXNjiq0Qu+N7OvYWdz8SsRvM
	 4/0kyIihFBJlVAAPkYlCUb2HtvNA/w594yw9sTUtLbTKEsJN4A/eu66n2sg1UedP9cRtj
	 Bfx5NDOZFbu4naGcZiLWpBFkf9q9citkPnTDvWnbMWt6lmPucardsOZDe9VQLJ6QIktOi
	 +DWC2QqkTjTf/2h3vezrP84XniUmorQXf1qz66BgJbf8PteIwCutwe02oy51ZHVrgh+wn
	 Q/JiWEmraP42A+tVVbstmX96N5yIXwAmZGS1717VXgkuzv7YfIwGQMUWSnhMmPQo4fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=UBFkvSSO;
	arc=none smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB45606B36A
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 22:29:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BB45606B36A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=UBFkvSSO
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5eabf7d5bbeso2281633e0c.1
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 14:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794436164; x=1795040964; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VhufRV4BoS98pezOde2Ss8la06aT4y3vZY8jTMf1PWs=;
        b=UBFkvSSO181dGTbEnl6AnPlOEkQY6F/N95xQxRJhz7c5IRO+VEbXWFIAEvayCl/kd5
         XeIOKPIflSGTa0amiUI8hlmChz01GDdMJoJXIkPvK98reSRtBR1m1PN2vN7xIi0X5cRy
         k/8OwfXIJR9a+GpkSMTKBHAXotf6lbT74Dxn4nCF39EG1vsYs+l0x4yZ05dNsK2F8Rso
         OkApORfkZWbfd437HGZ97KSbMtLEJUNCYRe/Dvf6WuJILzoV5eNpOwOWh8qaO2J+8M/9
         3/QMolihpp0Pu27cTdtC1fJ2EBc+eWuuYZvgLLSTxjca8+wEb1qO0xhKn0DL2G5WLy9E
         6aXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794436164; x=1795040964;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VhufRV4BoS98pezOde2Ss8la06aT4y3vZY8jTMf1PWs=;
        b=u8ce0zL8O+n5sN9YcgJ/xiztlKX7ZrCDZiMaKobBOOfnOWTB7CzxLXYAVYhTH7X/E1
         nlJEhQkqWvEq8lvLuKxS7Abi2eNGnGZW9jpXGwl+0JrTAI7O/oAxFsuyebVaEzK3rQWA
         +zi1hxG/jzkYuSRwta5WUZZbNWhUYptU9YJf6pP+8TIA3IdDxCb4OXkyr1F79Cli1rBv
         fN5RsFQXsxv2ScM8m4Ip7SBV9xsT5uiYyad+Vg9JkthKHCbbb6biXXCXOvfZ8K28eNmu
         G9ceNV1qK4cQzTsLMFXNHIKhfwYZMa37TqxddbGn4U1fXAJtMvGZSF9qkSjM0YdXnYtq
         KqoA==
X-Forwarded-Encrypted: i=1; AL+hErH7hRhAuVXH1KUDcdsalhAwKzi5yj3ZlOvNZUBHbKDV/xRzw4PuL7JgaklqHA0eYZU4aQQCuEnchJPyoNwnqu8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IF62UY3wm2xsDA/uHlSnXVNpYkr1npLkovzj23AYmCv2GJFlM
	42F5HsvtXdJYABQkDfIZKAtz9jdDwEpuAZCl83lgzNUY9ECfyEb52bazju+6BojuzDk=
X-Gm-Gg: AYBFou0m5cwI0WaFxInhXS+pVV/4zynhwWnnJ052Novbt85Z4tV9zI7H+1fKclO1nI5
	T7XUpgVWJcK/NXAzu7EDpmTHEpU7x+RUoOR7XI0ZPEouCr4Xml0uM8IBhV+OjRIRKC6APE5/kly
	RhxQiCbRIL2ukYD4JjqIHAa9Nnh89lIQJNUS8o/f81a7yGhqei6p4aW6JzoAOkzVPkogr6KVSbf
	r3aT/yU+wIM0ljMDdXd4Qv+XgkiUd4OKpXSrCCpYH7eEYFlvjdDlR2ri9Z29noIudWpziEkBk5+
	CRyw+5Nr+lX6yjfOG/f/knCqLz1H2Yz5aM1NLGZRG3zJZ2Fe6688CqM28qdd+eeqhOqxNspKsS0
	xr19P5czXOyEkppJo92hrkUVD8DevbeHBGdXJaZFDgjuZuKnBjrhNM7K8dQjapLpnGsZgT6+y88
	y/N9NXbDX8OgLMMG7NEX/mUOpQVQYo0NzjC0dauSKRvB19xA7GBAhDVsz4QWJ+0kB0D3b0cHjuv
	1NjsJFDmb6UuW6UywEETkJPxwtiPN36jRxUnRuUKY+UWw+ULq7adz/cRwRQDE7vzX3LTG4vfv3y
	pULKjRw9wEawJEPPuCuUCv/mKc3Hp5jh6Oot4P7FjDRQgYliwmy/6AEG9tF4yScBhNOi9iMogYY
	xnnFRX1cdcymztvNsNdq0uWD6cU6c8wLq7yd2mNbgrlwQ
X-Received: by 2002:a05:6122:4210:b0:5ec:d84e:3833 with SMTP id 71dfb90a1353d-5ee1c453cbdmr1849715e0c.14.1794436164290;
        Wed, 11 Nov 2026 14:29:24 -0800 (PST)
Received: from soleen.c.googlers.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee0c58ee8csm4508834e0c.6.2026.11.11.14.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:29:23 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/9] kho: Reclaim the metadata page left reserved after
 kexec
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Chris Down <chris@chrisdown.name>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
 Breno Leitao <leitao@debian.org>, Alexander Graf <graf@amazon.com>, 
 Baoquan He <baoquan.he@linux.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kernel-team@meta.com
In-Reply-To: <63ca64c004b296a998a3e531f8c0c4964916b70c.1794383544.git.chris@chrisdown.name>
References: <cover.1794383544.git.chris@chrisdown.name>
 <63ca64c004b296a998a3e531f8c0c4964916b70c.1794383544.git.chris@chrisdown.name>
Date: Wed, 11 Nov 2026 17:29:20 -0500
Message-Id: <179443616043.2329176.17166425351392983946.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2439;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=jGQo4CvboZX/j4iYyskgIcnUkGUfctp7MromfOrLaYc=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq9OxDl5eSqxBhOZE5p1XG7yi8PQ1rOiwUmOTWN
 tSoxjgP6WuJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCavTsQwAKCRC7dyhM23N6
 3uNSD/0Wo/iIWR2aXRe5YzNSrRfo/731JlX1MXOtpy+A5vTlCNvhVm398rzpLHqepWduInwcdRK
 4tex7caWuDlEdOt+RIVRYZ9mDjBo4xRQ0pvDBu9TWfu/8iU6zATD9T2YuP0IZnK23JCBq2LZdNL
 Pd1ZB7+If5y2zy1PJcSHbWDjJR9cu52ZsvA6Ni0FgTTyy3SdqMWwntgGPXP/LkzxuTKVIxTCew/
 zAi8DC6COcIzjFKPckc3lqS4x+o2s5Zwpfgfa/yAKCJIXNcdgmZhS/bqjRG1k30OiLRzjm1AUH0
 +/Wzasj+qb7r0d0gsdRO44Q3LUAgYoBNNtbFLy+xdLMwqLcDpWFCNFIsuQoxoTLzbNi/ldIvWM7
 Bhe1ME5c/vfVxRfgVtSpaG6iwt7oCEesTRczv6SaBP0L2VXQcphd+4/BXqpxAX3OQlRgygYDjh2
 1FlvPx3aw7hsvLSA1SpUCaE1/h4TboRhZXeYpX7Qjfo5WJMt9pwdUSkpQoQ/IZ0H7DlnI3dcKAJ
 LKGf5Y3yLsfxcsbOghJ6yLAHz8Qa5p2lyNP/Jke0X30ny06+HzRS9+hTk2lJkxIc+bfFW/kZkt1
 l4/OofVK10BUEKi4onJaayj27ChYPFFdnwt9J1sO+PHCisIKLgi9L8aR/AUtsyOX7ZBzKO2lVH8
 P8fa89xifqHqa4w==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

> After a KHO kexec, the new kernel keeps the page holding the previous
> kernel's kexec metadata reserved for as long as it runs. It only needs
> the page once, since kho_in_kexec_metadata() copies the previous release
> and the kexec count out of it at boot, and nothing reads it again.
> 
> Free it with kho_restore_free() once copying is complete.
> 
> Fixes: 76aa46b9e404 ("kho: kexec-metadata: track previous kernel chain")

Do we really need to apply this to stable? It behaves correctly, and 
your patch performs a minor optimization by releasing a single page back 
to the system.

> Signed-off-by: Chris Down <chris@chrisdown.name>
>
> diff --git a/Documentation/admin-guide/mm/kho.rst b/Documentation/admin-guide/mm/kho.rst
> index 902d171a780a..f9d2cc5999ee 100644
> --- a/Documentation/admin-guide/mm/kho.rst
> +++ b/Documentation/admin-guide/mm/kho.rst
> @@ -120,4 +120,6 @@ stabilized.
>  
>  ``/sys/kernel/debug/kho/in/sub_fdts/``
>      Similar to ``kho/out/sub_fdts/``, but contains sub blobs
> -    of KHO producers passed from the old kernel.
> +    of KHO producers passed from the old kernel. A blob disappears
> +    once the kernel has read and freed it, as ``kexec-metadata`` does
> +    during boot.
> diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
> index 6f1f55fe3181..8a07783326a4 100644
> --- a/kernel/liveupdate/kexec_handover.c
> +++ b/kernel/liveupdate/kexec_handover.c
> @@ -1782,6 +1782,9 @@ static void __init kho_in_kexec_metadata(void)
>  
>  	pr_info("exec from: %s (count %u)\n",
>  		kho_in.previous_release, kho_in.kexec_count);
> +
> +	kho_debugfs_blob_remove(&kho_in.dbg, metadata);
> +	kho_restore_free(metadata);
>  }
>  
>  /*
> @@ -1859,14 +1862,15 @@ static __init int kho_init(void)
>  	if (err)
>  		goto err_free_fdt;
>  
> +	if (fdt)
> +		kho_in_debugfs_init(&kho_in.dbg, fdt);
> +

so add debugfs node here.

>  	err = kho_kexec_metadata_init(fdt);

Remove the kexec metadata node here. While this is somewhat unintuitive, 
I do not see a better alternative.

>  	if (err)
>  		goto err_free_fdt;
>  
> -	if (fdt) {
> -		kho_in_debugfs_init(&kho_in.dbg, fdt);
> +	if (fdt)
>  		return 0;
> -	}
>  
>  	for (int i = 0; i < kho_bootmem_cnt; i++) {
>  		unsigned long base_pfn = PHYS_PFN(kho_bootmem[i].addr);

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha

