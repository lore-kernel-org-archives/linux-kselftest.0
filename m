Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD6630C179
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 00:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782260083; cv=pass; b=rnmdrwh4Uu25xJzVZeUhjZRYgdMcgvhRK9xlaSm3U7iByWWtlFd6e84NrXG9xC5EqWgovSJnhee2SmPrrwbKNyS8GxGAlT3TWaqYutOLD3ITx5q4QlCSCMer6MuK3r2S5k8ME3WqtNiKwapVb9MjJFa/nXiR3hYah+dSzwH9keE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782260083; c=relaxed/simple;
	bh=kcSIA8QoE0LN3l35tQtfo0jow3WHaPbc3lLYMPju8ik=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mR5QlFFdFG2BOtWupX4l64ah+sBY579Zsrcdym2ge/hC++gQz0L50hMrx53e4gmlfIpMoqAcHacEOEVodnwAzza8iKu/p2meM3YG3pnhALXNCxWxVgTWzIdTsEPNLWBQ21MGwcbOKG1gTQwvJjmKwbkWkFHLeMGjM0BrDIZX6bk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LLQGNMZN; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LLQGNMZN"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-13986d61b4eso901033c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 23 Jun 2026 17:14:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782260080; cv=none;
        d=google.com; s=arc-20240605;
        b=LsDiEdZaw4aBjLDHeB8S3G/s7OvWHFxSde1aJa9ga+stBr0eGLGFfcmofeCedYO+yj
         V/uJY9O06WsOI7W0lF93wdesh4rW3AbeOVmlsn15SpFRTa+cYCNgGhAiq1qt5EBG0olW
         sDJQYpQHE3rzTmvS5lGdtbVJIoCB7i/TeZgYYpsCOy/nA9fLrYvF325UalvZBQ4xOpV8
         gFeyY/QNhTkL/oYL50uykXpL6WXHht9bLnVrVkNgDMWlYr68MSd1k2kAMvyJdISdI7qx
         96GQ4Rig5KjMPUB79A1ehz5RSksd94298MKt5gL0//wjgzqHh1qRKVua8ovJCjIkRQjl
         N7gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=5cZCA67GzL1hK3vWmOV/udgJCrdJrxhZ2WqGtT4YW1w=;
        fh=wghPfy/nUHq9AT2TgpZ2Q72BffwRLjfV4me4BgHZ1SY=;
        b=ZLTokh+BWTh8k4jsgc8RqhBoTpA8dMw+qoNjAZ2/DAQiHHPi8GOjBBIpFiQ6hs2ePf
         ZCiK1nKSYrbiG8E1+w16pKTQDBAIJD6dcqQ65/JgGivdB5/z6CA7pj61PD/GFs6DKPR3
         XeVCDtgtiANaQOZuknE7byG8nnu8Qh7YMh8LyL0XVEzcDZEf13OuSPmjC5+ONdv47bCW
         nXWGeai7MnOb87AQPawQEPtcnBI8ML/Cy6lOVlJ6b7uCTEDflGIRmDp99BVjSVtVnAOJ
         nUDFUVyPV3OX+C8Be+axZaLXDzv/XinBCtoO+8OD/aumMRI+bBlZyZNfFlwzep7ulEZB
         eA+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782260080; x=1782864880; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5cZCA67GzL1hK3vWmOV/udgJCrdJrxhZ2WqGtT4YW1w=;
        b=LLQGNMZNBVde46DeOm10QrXFme7gPCLlmzfdjn1u29omu4Ul8I2WMRqAGvKGTWmeug
         p5SzL/dv2Jbb7ZxUU94M9T4VuzT5pDrNWMNqJJJQqzwPd9Evc/PLxdGdpyzdE8Zkwalc
         YSJ/2mV3x9o8WUDzo6vvCjoX6OgPDmoiVdpZ5ltMW2w+SsdnDRolaRUgug5/gZhWLI8n
         26qEZawRYF308lK36dmIOVAm0+eXufYvwMrmcumR62LukVdGOw4+U3dhIfl2YXAYS+MQ
         ZrW5i607QqoyZ1k4daJMagtAkfWdMAPjtxsMWAb2BbuI99lzK7cZviFIBLoI8+LZhjrO
         K8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782260080; x=1782864880;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5cZCA67GzL1hK3vWmOV/udgJCrdJrxhZ2WqGtT4YW1w=;
        b=qYuz6lRK/AHIjcddmAmFHz6pKmixg0Vgk1N9b2R71CLor48Is8ZqlnjA5fmmdzsHQ4
         85Nac8aJh8byVwl86BlHIk1bYRH0Vvv7RTGQKVuPWil/qAlSkKjG+sCltHqB1TI8Ky8t
         yfPp4G1nIIT/1z/FODiND9WCA9z+bqFPmSZGSuIZRsbgTe1MKLKyw/HaFPdmcDiIQixf
         b6upi/jOlFiLAoe90fA+YgVuN9do6J45t/zq0PBBU629RQTT3/N9PjO81+QIV4p0dkDr
         AQVr4751qiAdH1Eqcv1NMnV8lyO02BV2djI1rqkz1FyfpKpA9WucaioEUOdL60SGLYa6
         PfcQ==
X-Forwarded-Encrypted: i=1; AFNElJ+UvEXklTUE27+wXELBSUm4BciUjkRiKANsgNPE4ZkbsvHSsc9CYvbAVtxaVLKoIgFxm4kJOoQX3NClCi4M+AE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3AfdA7iPovfVnOlhAwB1sXY9JJR962uk9pQBguSwPj9I1ORQz
	EsjD5DAo/P4JP0eUQ8dMjQ6haHK7CC5Qy2wjgBXvkA72TASBLgiENhyUuSFNblYiYjlyuSNSu0n
	iHyAo/9vWj/LjSOWArRPVYWMUnL0CDmrt4HRK1dsr
X-Gm-Gg: AfdE7clpCJ70FjPtzZLBLze4dtuK8hQlRhJSBqaW8C3jIFWcbkJZfLPWjiCVQkwN7K7
	akkyw8MupBTijhfAAW3g+w4QVb/Ut7Ab4X7aWQ2ohOwsxgjGoCHsenhMn75F3Ea5zmSL4o5Em2J
	jQ5xpuTgSEUoJJ4oiwtJThl1ZvOFG/b40b19BUPuVlIVWFOeDZd7SiiHs3Myk65mvkz9i4esaup
	NWMpOZxGKh2ujY6GMHyv46+e1Jp7RNcIddilhVXVNp4cPkJjPtK+kAOQ2foyshg9grqCqNeHypY
	V9+NkQUFWMP3HWSZmhMRmp8kDEAFodUiNrXR7Q9eEOfKVtoZpfvbHmgMya8=
X-Received: by 2002:a05:7022:7a4:b0:136:5e4c:7aba with SMTP id
 a92af1059eb24-139ad6ac8ccmr13781633c88.16.1782260078995; Tue, 23 Jun 2026
 17:14:38 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 17:14:38 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 17:14:38 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ajnQVkLvFl_lMuGB@google.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-5-9d2959357853@google.com>
 <8e53844c-f2f8-4a4b-bf72-f3140c170d43@gmail.com> <ajnQVkLvFl_lMuGB@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 23 Jun 2026 17:14:38 -0700
X-Gm-Features: AVVi8CcXn2j2iTyhoMEqe261E6HKS7rSa97Iz0Ayq-UgAfPllC9cKLpff9jWWSE
Message-ID: <CAEvNRgGhWL-tWfu8EHf-zsU4C127xKT2wyV7wMBnLKs8g=pEmg@mail.gmail.com>
Subject: Re: [PATCH v8 05/46] KVM: Make CONFIG_KVM_VM_MEMORY_ATTRIBUTES selectable
To: Sean Christopherson <seanjc@google.com>, Julian Braha <julianbraha@gmail.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Fri, Jun 19, 2026, Julian Braha wrote:
>> Hi Ackerley,
>>
>> On 6/19/26 01:31, Ackerley Tng via B4 Relay wrote:
>>
>> >  config KVM_VM_MEMORY_ATTRIBUTES
>> > -	bool
>> > +	depends on KVM_SW_PROTECTED_VM || KVM_INTEL_TDX || KVM_AMD_SEV
>> > +	bool "Enable per-VM PRIVATE vs. SHARED attributes (for CoCo VMs)"
>>
>> Sorry for the style nitpick, but could you keep the type and prompt as
>> the first attribute in the Kconfig option definition (like the other
>> options do)?
>
> No need to be sorry, I've no idea why I put the "depends" first.  I don't even
> know if that qualifies as a nit :-)
>
> Ackerley, if you can provide your SoB (for Fuad's feedback), I can fixup when
> applying (assuming nothing else necessitates v9).

Thanks, didn't notice this when consolidating this revision.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
