Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C0738330A
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 20:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782333854; cv=pass; b=mY24JF7+RrdkkXxjLcbjdvo/at70+0gIYlw5MH4q1INAhke3s2ina8B+t8eypBSyxVSRYfFSLO/dWnFJUE33F9TFzx/rtjkXYzVhVaufE69xCkTihvrqHXHQmXIsCoSZX7Z2dQDBfUgYG2FANErAc51Ype8Vvd/cOzhOLcOOf/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782333854; c=relaxed/simple;
	bh=QyhcqbadZWN+AG6WcwYfzT9ILGIvGzGDjWcEDHa8YsM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KWV17WxdfqgpZ97AH4czIV1I5j2fEGMDoBdxyYe+/f+HvjGi7wbURWW63BongHlkuFdScGnnCqFa1w82UEjLE1a4UISFo5Ac3zU+Sul85m61PpgoE3wTil1/UrKqRwxH9WviZO1lAh2peNuCwDQj/r2RpUIx4u5O4RNhwloQ7iA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JSkv1ByO; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JSkv1ByO"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-13986d61b4eso593234c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 13:44:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782333852; cv=none;
        d=google.com; s=arc-20240605;
        b=M8pLjvPls4WHDvaCkyTG1lo0T0W0maOcyITQrMLvXTsuEJljBlt230uBgtflQwxqK6
         yPSF6ljMJZ7UCG9O3ZpJlmZffiENVZ8tCfzPYYB6ZZ7ixjYTVA9VOR4OEoDnaxe+cTZW
         RSDpX8DjqUjHOyIM7Z7+Yx+mRAIbRnHkQturJCVcUp2t0pZfXi/QrWhQnhNwgO2p3/0Q
         k+B0Tdu8vpdvJA2K9Me1i/nejcBmCNANQF7lkw/mI4QF7iwjyoEbZVJ6s6RY94y8T5cw
         CqUzviyAzZpS8ZSQ3zICLUkmHsMCoOl6Mvl5bENVZ0xYyZhlMRgaWR9YWcvi5e8d/SI4
         An9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=G5/9dkbJhmiJkcsjBrae3PYSyLuk0zvc0a2KRC6LUH8=;
        fh=ZwPswycTYHUMZMupCMGfGFmm46KDSXJeEyk4Hzs59LM=;
        b=fd0ajsYQG8WuDk+WBMaP4GkxRB+GakLUPuENcMIFeIWBV77nNJI6OmeXfm0oKENd/k
         Ovo86phhQ9jkJIxvZhjUJB3SUKlERrBGriLaY9djeJag/IOUMFdjfjEHt2OE4VMVkJa/
         2DeX+n6vq7SA39HzMaW2naF3CEYRLT7F9RGqvOP/lC67enFq7GXieIWucIX+rsAFwnAI
         BtwDLKS5DBKI+5rUvfMfhAcN1F1CghJZJXknL12Yt9oc9vZOmv+IyjD9t1gptFrSkKzS
         iYEtm+zajwogeAw6jxn5kzbKFpx7pa/C01u4RXzAE3h0uKZlBMEJNsvYf6WgMSLbzubX
         3Ibg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782333852; x=1782938652; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=G5/9dkbJhmiJkcsjBrae3PYSyLuk0zvc0a2KRC6LUH8=;
        b=JSkv1ByOJCbqB3lKP23YrYbT+yH7RufFZrgmn4j/W8qw6G5kef45xY9CunSp1hBjKl
         KHgVhL5ObhUsvnwhujk91Y67/6q+5ENJ5W776GmqArB+gXTtg+DIFH3JaFJNxCbmJgx2
         xK1qHRd0fYVk0P6hcWRVYj+0lEjKw/IRQzc4/bPK98RF9CScDpgGhyhJ+aB4yD10Nn48
         x058kobRMDvgeK0FribCHSLJNszxKB2rtE0mEA2S+CpTC9JeLDOuZC5qZs737sz/P9HV
         FvvFbAnWU8Eix7XSgeUEQs3GFnal1lCF03gEvkFky91ryDTf9BXSrKyKy2IGAXpkxAmx
         c54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782333852; x=1782938652;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5/9dkbJhmiJkcsjBrae3PYSyLuk0zvc0a2KRC6LUH8=;
        b=XyQMPLBUsMSNmXHj6VA/9i3XK4Njicx4uiP0tQ8sQixsOKjmwGDQtzAiyAGkSDw+No
         83FymhQc0qWlzcCsGw2VySWm1gpq/m74wjxXd9U5pu3UoeQUxTKjFm2tYvtEY4OYMBs9
         TMywWLJ3zc3+egL6skpT9oFNpIiKjacF0FAepFreMJ+P7im2Mx9cwj3W8VI7DAX+/W/T
         99tBxpWme/fPqIa8Lr6Ozd6LLfXF0IRb4lpx+NcKT9mi8gdbYA7mRp05TJr4Axe5GESw
         xOMV7D89je9lcjsp4Wj9tQPqH8wBLhVTivD/VjBv3hfPnsgaVk731eUD+zj3LwGGdv+O
         ZxNg==
X-Forwarded-Encrypted: i=1; AFNElJ80ox7Nt96RE+91RdQntv90OcF3/8nzLUQZJDt/mzjgb/A8iAcirf3RVVSQpZEOQ7wScYRGXV4gLQo2X3Iqs58=@vger.kernel.org
X-Gm-Message-State: AOJu0YzX81jzK4aGJtObmoGKsjiS/nxtjRmwtEb7jsk668LqNrfEMfOk
	0F1LjsPBO2dIoA32CfxIT2a/VGkjFAiIPEhYPL7JfVF+2Iz2ftflgH6OQ/TCiEimDCkd9JIkcJc
	P61H9IjD45U3r12tDJRPQHk4n3kI55lNzJXxLxkgn
X-Gm-Gg: AfdE7cnc1lGrXL8ZzkJ3rBHqeom/9xHiGZKiH2LX5kh/gbtyKP3vPVGHH9s9pWmR14W
	duwajYMxRZFWm9dcdfbD2wKxD6NDHDujj8K1h23tYIRQU6aKa+3GFIewCb5oL1u0VITAZPvvELS
	jWocbGSfJNpC2zGboAnYuh9h3y04ZL0/0/sZmY1Fh1fTfaMq1S0cxU7aCAvtDWjwstkgmjh367o
	Z1x8GF149stZN/oNkgbqMIGuNfzzoLGBNpThLzVRpco45uU5+CgwlL4aHGRHvmu65/pd1Lom4yc
	HkXcKAoI0X0jgy+PeaWODzKabihl0AzzsiIcbso9VPOijJq4c6/65SGltm8=
X-Received: by 2002:a05:7022:e995:b0:137:eda3:e5a9 with SMTP id
 a92af1059eb24-139ad711637mr14297421c88.28.1782333850616; Wed, 24 Jun 2026
 13:44:10 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 13:44:09 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 13:44:09 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <2ef455c3-a3f5-4ba1-86ea-b96416d163ce@linux.intel.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-10-9d2959357853@google.com> <2ef455c3-a3f5-4ba1-86ea-b96416d163ce@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 13:44:09 -0700
X-Gm-Features: AVVi8Cc-v85YTGgbOrOpBNr09aOMCIpUVvlduJvADSpw08YaAcwUxrqW73F-Zbs
Message-ID: <CAEvNRgFYpTAi+F8iF_m3mQnP_hB+DWN1oTnhEQ5WWxduX2D5MQ@mail.gmail.com>
Subject: Re: [PATCH v8 10/46] KVM: guest_memfd: Wire up core private/shared
 attribute interfaces
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

> On 6/19/2026 8:31 AM, Ackerley Tng via B4 Relay wrote:
>
> [...]
>
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index bca912db5be6e..e0e544ef47d69 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -926,6 +926,24 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>>  EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_gmem_get_pfn);
>>
>>  #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_POPULATE
>> +static bool kvm_gmem_range_is_private(struct file *file, pgoff_t index,
>> +				      size_t nr_pages, struct kvm *kvm, gfn_t gfn)
>> +{
>> +	struct maple_tree *mt = &GMEM_I(file_inode(file))->attributes;
>> +	pgoff_t end = index + nr_pages - 1;
>> +	void *entry;
>> +
>> +	if (!gmem_in_place_conversion)
>> +		return kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + nr_pages,
>> +							  KVM_MEMORY_ATTRIBUTE_PRIVATE,
>> +							  KVM_MEMORY_ATTRIBUTE_PRIVATE);
>> +
>> +	mt_for_each(mt, entry, index, end) {
>> +		if (xa_to_value(entry) != KVM_MEMORY_ATTRIBUTE_PRIVATE)
>> +			return false;
>> +	}
>
> Patch 1 noted that "Ensuring every index is represented in the maple tree at all times".
> So I think the queried range should not be a hole in the maple tree.
> However, there is a inconsistency: in patch 1 kvm_gmem_get_attributes() explicitly
> checks for holes, but this patch does not.
>
>> +	return true;
>> +}
>>

With Sean's suggestion for patch 1, I'll update this one to default to
the "init" state if xa_to_value(entry) is NULL.

Thanks!
