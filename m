Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CF1221DAE
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 14:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782311922; cv=pass; b=kF51PLpxL6SOU4RvhzeaQo0++wbPzHFmhKfefcVGf3m/+XEcvAlk6NC+9imnCkmnTxwzjbXd8BuxcRc44wjyGmytfMwnW2edaIbHG2KLPmuVuSb5hrSD/qm5J1G049cxyrRu/sXRi6nA/YmSEyU9SOPnV3RbsVNvS0bQ+BOpXTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782311922; c=relaxed/simple;
	bh=+a1qMWWmOM6Y8/o1eN1lz2qoObcQIVgbkHxFmUvd4Kc=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fiD/9Llv4ePg+5AHwwtaU8DLTSuogMH2qpl+9nLmGWWJEZBHa6muHHXTMvmjIJCwLilNHLm0C8nDiShfZ+SYtzbutKAoWn+WEA/eUGPMTRijpH6Wepc7CJkiTjOpLzZHQK1UpBn9Ns8CPUhAmjnIswyjYbm0CmHKLPstsfKI7oM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mNSNe9wb; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mNSNe9wb"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-139a5f4ca15so1298078c88.1
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 07:38:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782311920; cv=none;
        d=google.com; s=arc-20240605;
        b=LXtDTX8y1mqHVy3PyeI4dcA/8I0+BMlfURQRTu4jGrlRenF7zgMpOAjXWBZkheg05u
         4lK1Q7BHhyXVFPJk8wW7BMO5CMbl5zYSZJHY+ApVMbvUSPhpeWXn2p/FeGr7MfRkNnTl
         jIJQg8wrJTYY0skZZCku0lIzJJ5IRLACWMs7IKiKzHQa4Sr8Emc+rL3BXifwEdBT5BUd
         Esf+D8M7nhdCVbGMvtElSMQpdoPI2Jy0oqTgkwvTr1k1+bynxsPAHUOrrI43vubn8zmY
         nx0H1JRls7zSjkGO0UeKRQZaWT1FoT9FR2KZv1prNGLIphxfVsqKPZkT8z4x17v8pEob
         K+Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=HpVAzGtumZJ9rywOtX3ITBDfHQ1Vjgs3+apnvgsrs7k=;
        fh=4xW49dUnVnlVrAqu5k3jih3xHLNumjQIx0kar3YFGX8=;
        b=chsV+H+HGoJc6UyY081xz8ok6pgGoIPCe0b2yZjFS+4QjSNWAA6etiId01Y9YfzgI5
         gFUCA2jXiHYaQzjFCdJHoVWCX+qasSDsILTrhzMhvKJoM4Kl4lHaLoZqCJpdNh/aC51J
         bCmlW3ViNYWmPJHn0bAFv39dU32hjSL5zW4Qh+2cyeTj5BmovFEuqpvBOOKVMYoSaL0R
         Q8vYOZ0B7f+tKO5NOWz9SivZmJL5EQvVLDuuTuzSni8EuWAtgfw5rVlievD/Pvu5Zcfg
         WxEP9397oOmvWmZLsFWiWTGaY02Y7UnzU8dvOuZIiIR/tRynWGquvq0380bVtCUPCwyR
         Kfsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782311920; x=1782916720; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HpVAzGtumZJ9rywOtX3ITBDfHQ1Vjgs3+apnvgsrs7k=;
        b=mNSNe9wbTP9Ngof4VtQoFcV2uv52SUPaZgY+Tbi660cx+xZqhgJ2b3iYt44xjlEr6I
         ELCjjQ9gLffplXOTXMTE3aF0bPXSlYL7CEDv/m8Y61oFNVZwQPaSVRLm9AqiUWupNXz9
         IlLVsV72n9CO/cCbMEXwfXIzvGB7GvrX/TAQHIGJiBfQ4PUfK9rT4oDvczZ9ytL4FU0u
         OidJ8kWId23VDBoEkkY6a6NZZJ2SKgenW7G4SsyXAhUq9Zi2A+OJoDsFdVZDw2Pv5lr/
         pl3c+NsUeE8KQ0GZFGCbtsNJItUDelIt2UCx2XniStgj4PvZGXLbswTlT90kbvWoN4y4
         pdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782311920; x=1782916720;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HpVAzGtumZJ9rywOtX3ITBDfHQ1Vjgs3+apnvgsrs7k=;
        b=ahJk23v1sSWqYk1ZN3P4kfSgNFPAfJBR8dNPbNurX84bXPs+zhzJLBjmu6KxIfFcOp
         BKhdyFxb0K938lbIhISN70HBcUjHnrrRkQtiwtN9JHJGCDwd54397X29MLlAGuvkFq+Z
         wWAG6/056+LijCX9E+0p9lFmHvAI+LPUvkEFxGPGdC0ntydGAe023hxJrVfNS47i/eRU
         +RFmuHfDvO0NHtkbk2DoJafOREkv23Lrw+UgSfoN1KbLNHYcccAi1qRVbo3lc4tiwxEH
         JnhkNjrvDGI9zosDGapDvjrkAlUHa05Mw+6i22pCauNi6wYsAzKshYHL1bxsxSzmz+Om
         WCcA==
X-Forwarded-Encrypted: i=1; AFNElJ+wwyMRTL/h9yc0XpbhONtp4jdiYa6LZiKbXUCYgc+nWaWfm8uGFAo3/t3U7e8NDN2XxYFi7ML+EOczYYATsK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaqUc0YaVh98+/9c7rT3U4x1JH6rVfBq7DVdGeAqfa7XdRqHUB
	Nwi+f1y6Q6Rq2CEnme707v4x5OSXUdIpxGCvRkOQkCYYmENpJY4dma1bYa3ZmwY91+VaQnXP39O
	91Y15a+tFu+jeMUlFKb3WC5VujUzrue3HgEthMCTv
X-Gm-Gg: AfdE7cl7PNghAxHSEQL7FerRqG6e+Yy3qj5+haJwJt544RZRPLLY4PofJBkBrTzYpNT
	7Umj5NldfBv02uzrQMQGHW9PFHkPJOfvTBd1S0MzNnD5eyLDRmT/IFK/c01z4rmE+nEKcG1uBev
	TGVWGVQb5y3hfxPyLMlVfVhZt+u7bN9B0ds5VobBHKP/HI7VK5Dz+6WRXH5lOHyPL/15ensTuOJ
	vEdxTGZNXjUj9P0g+bDIVkA4l0uapHOrOLfUcdtbcUEeCIIPqfiW+xEDn/kcDlkI6UftX93q52j
	/Cy+Y78k2iQzIGEPZHp+4FjU2LoV
X-Received: by 2002:a05:7022:6612:b0:133:3bb1:8d40 with SMTP id
 a92af1059eb24-139d0c24496mr2539007c88.15.1782311919284; Wed, 24 Jun 2026
 07:38:39 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 07:38:38 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 07:38:38 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <1b59fec2-a464-4429-8532-880394912af5@linux.intel.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-9-9d2959357853@google.com> <1b59fec2-a464-4429-8532-880394912af5@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 07:38:38 -0700
X-Gm-Features: AVVi8CeozOwjsDHz095RESzI1L73Y_-_c-08wJAGuPOXvsS0FIpnjscm-5zrczA
Message-ID: <CAEvNRgG-WDzHp-15Mig4hiU5Dag0pFCu70-R-9b=PkD69W=ZMg@mail.gmail.com>
Subject: Re: [PATCH v8 09/46] KVM: guest_memfd: Introduce function to check
 GFN private/shared status
To: Binbin Wu <binbin.wu@linux.intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
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

Binbin Wu <binbin.wu@linux.intel.com> writes:

>
> [...snip...]
>
>> +bool kvm_gmem_is_private(struct kvm *kvm, gfn_t gfn)
>> +{
>> +	struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
>> +	struct inode *inode;
>> +
>> +	/*
>> +	 * If this gfn has no associated memslot, there's no chance of the gfn
>> +	 * being backed by private memory, since guest_memfd must be used for
>> +	 * private memory,
>
> "guest_memfd must be used for private memory" is a bit confusing to me.
>

Hmm good point. Is the source of confusion that guest_memfd can be used
for both shared and private memory?

Perhaps this can be rephrased as:

guest_memfd is the only provider of private memory and guest_memfd must
be used with a memslot, hence if there's no associated memslot, there's
no chance of this gfn being private.

>> and guest_memfd must be associated with some memslot.
>> +	 */
>> +	if (!slot)
>> +		return 0;
>> +
>>
>> [...snip...]
>>
