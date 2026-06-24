Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8734A373BEC
	for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 22:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782340216; cv=pass; b=CGeCUeIVrzUVcIbQdUeD83sThtkUxwsgT08n/9KhiO83tiN2st7mrcdI0fNLcZJu1DfT2oqK21Oxsss8zIfU9c4SdQO915qtn0In3NbAfrubDYZ1LHIYMh4+jMBMAQJSGtvt2aN1XoEtEQk2z7G9v7DOTaqsCNqCQPn4M3Uvu1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782340216; c=relaxed/simple;
	bh=Cryz59YAm4hKcZvNvNbTkH+hut/Wk5VenNHAj/cSfOQ=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QGmnrhA1Loq9oWbF25uMNUMsevtPOZybPtqKPXMFRp1p0uk0PYizDmFottzwQL62Vw/Q5nz/06Dp8oliDJbqWZsCSXsEr27FeJwNk7PepGRrTS4uKIZ+4zPO4mlfdXZAludRhVhzBAcneRfZQZGJXumIesGCK+SDJkxqkr4WfZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mt+d5S8C; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mt+d5S8C"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-13981833e13so1991143c88.1
        for <linux-kselftest@vger.kernel.org>; Wed, 24 Jun 2026 15:30:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782340214; cv=none;
        d=google.com; s=arc-20240605;
        b=K43NajBGm4Z0BAaVxxuf10K3gxgcBCMcXrlIxkbyI/ToPRxdqXlhGSiZP7oaGVdke4
         3XUi1i3ksByQqKdYBfq6boKvmCZWAcx1E7LvyOT7eTzf+DNCTjlQcVZz4EPEQNKKYr62
         MRv+ujuMhBjZ6DZacwBhHzWBAawund7vMkhgEYd2BZnmgN/HWJ0IkvJi3dEd4MEmFcXV
         hZ5ta4dOx9v4jXrS1JRnrtVK1jG+OH+bGK/FVQ6mvm9VidHlhLVGx8hf8xd0HYYFRdCi
         NB/gUgiZdyvuTodkyBjHxjHAcEGLv/OCBgwWxCjxNIG45lzM6Ac8W6ZriFhrhziNPIXj
         SXFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=oVosxF/7uHKl1pdZQ4oI0wtR65vPmKvzzWf+IZ9YyQw=;
        fh=fqDzmWAAuc7VL7sXn1pB5wnHSB6zov8H/2J9RGBIHZY=;
        b=KIlMK31ggNpjdCBi8oZHUnOlvmtwrkKL+zN9Z6N0/Op2wvgjz6uhYTQrmg32MOi7aC
         F1LQXFyvAznNFq98rNwSyld7vHpzpcKJp2zXEKuYI5eN+gmBhOx0ob7xwIUl0XrbZlEg
         LFx/95FcjmkQp2zkw2AL5DNeVrKA9/rwECUKVXKZH/PwlWr/RE0WeAn1Lm35B5GsOeFb
         ubRooYCa3Qu/Fg614ULlcL6MsqtOuDINJuzYYnIqWXUsdXVZzqotNcssMYtklwNxQtS0
         ivk1nOdfinkUapLjK5RvEZmPamGE1YjjKEAGpZFt4alsF6Xuyq4YGnzsiwOjnqjEw349
         e58Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782340214; x=1782945014; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oVosxF/7uHKl1pdZQ4oI0wtR65vPmKvzzWf+IZ9YyQw=;
        b=Mt+d5S8CeVyF2uzGbd/9JRs3fsdMoDQplep/243tDeeCK/0viIoreyIvZcomm9oFbc
         osynA3dqv1S/DHst+neAr2nnckPTMGSsR9x/VWNduGgtd3hbI0IfDb0tvdIIRFXegKHc
         F9+5XdmXGx4YFP5WMZU+iCNLYnXl3s5oXgwyZFLzkcQqd8L0W7aRV/+ooPtJ1n58PieV
         ntjs2EoS/iHYsL1LDjxKZj24m+kHe8Ztctu93X6yp0krBWnoiRVrb2A8yEv75Zb2B0jh
         Ze/glsnOlcOHOoI1SgAH6AYIMaGlaWoLyLmhkHDQjfQQ+iEr8XfE/a9xE3hKqQPNtJci
         TZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782340214; x=1782945014;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oVosxF/7uHKl1pdZQ4oI0wtR65vPmKvzzWf+IZ9YyQw=;
        b=nyapimk753T61KDniv2UU1sAAl1NMVsZ+ChTzO9E1N8Xewq8stlNK1P1xm44hQx+xb
         nzpVWC8NxfY32q9vHV3wQzH/90/pnq8Ce4H0pOA4O1wm9/oSd21KoOoSi72sxwyqZjjv
         s6gRoNvuJDZDsr9U1qKenAdK0aomWlk57cJCunCnsWaNBAt8x3KcKDNmel7XCltjoY3Y
         CPa21AxCilUmSzyFu7EEIqDTR7knW1YPpQB+ooqwxVyy2HKb584L44PBQmcY/6KPe/Gy
         Hg02INILCIOKLFAaayNU0GJJP+S1aGbAo0rZQVYVgtYXl8WKOFkF+6vT1tre6kN6TKRr
         eZ1A==
X-Forwarded-Encrypted: i=1; AFNElJ8048fXJ+Vf3ZDkUxfWvjF/fDa3gV/vcZCiOBSd6p/6eeZzee8fpugsBuSq4Q0Fwcc/a+jEpEp4RKc6hJExjbM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd4OjSj4AmpJP/3quqNHaL3+51rKZOrelvrfqWdthp4nBotMaI
	NiEHteeZGnRPJ50GQCM2kabAo+gfPdOu6YE07kzxb8SmMVq4UPtolL7ES6XuvDHWwQ5j0jrWh+D
	ro6aLv64Sl5QlUPygry86H5myJmZkOM3p9hFw/uWw
X-Gm-Gg: AfdE7ckhC5W3fwep5T3PqLR6TUr1Cludgvmtom6b7eSLylzLzNIkmJB0pr5bgUQ2l6P
	Y+mjMUJzrFlKQDPPmQ+64YfcZjchKeJUnPwh33NxA3w3KkY96ziQ7943ckzf3IWSK4c8CIdhr2y
	8nX7Rnp1kU9u3+8uF+5lr6w5c5326arocR6yVZ3QvSh9mi0yn1DexgwXMjEgXrPu2/ED8SFQh54
	+TTdqXxjl9/qEqFnn0AkyGqyQnC4I4Rotg4d/8ju0PC47PEYJCd/SsR/oBIG9zZ96izZwNZ6FtR
	zyQQeckq5kvnR/fdbW1PczPTdKSQ7Be5QrAPfbAy1rAdYk7A9xjE8lX0QMs=
X-Received: by 2002:a05:7022:fe06:b0:132:5d42:55ba with SMTP id
 a92af1059eb24-139c5d0503fmr6919345c88.16.1782340212554; Wed, 24 Jun 2026
 15:30:12 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 15:30:11 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 24 Jun 2026 15:30:11 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ajpKK/SyRh8LExrY@yzhao56-desk.sh.intel.com>
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com>
 <20260618-gmem-inplace-conversion-v8-21-9d2959357853@google.com> <ajpKK/SyRh8LExrY@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 24 Jun 2026 15:30:11 -0700
X-Gm-Features: AVVi8CdqNo4bRyAdjZ4VoxTkK6AK5USFMYju6TEGtZz_v5HiC3fCw0ntlVpZrZ8
Message-ID: <CAEvNRgE=-cdbiToHEu-FCks2XSh3inVDdW3r+h9VYYbE4REttw@mail.gmail.com>
Subject: Re: [PATCH v8 21/46] KVM: guest_memfd: Zero page while getting pfn
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
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

Yan Zhao <yan.y.zhao@intel.com> writes:

> On Thu, Jun 18, 2026 at 05:31:58PM -0700, Ackerley Tng via B4 Relay wrote:
>> From: Ackerley Tng <ackerleytng@google.com>
>>
>> Move the folio initialization logic from kvm_gmem_get_pfn() into
>> __kvm_gmem_get_pfn() to also zero pages if the page is to be used in
>> kvm_gmem_populate().
>>
>> With in-place conversion, the existing data in a guest_memfd page can be
>> populated into guest memory through platform-specific ioctls.
>>
>> Without first zeroing the page obtained using __kvm_gmem_get_pfn(), it
>> might contain uninitialized host memory, which would leak to the guest if
>> the populate completes.
>>
>> guest_memfd pages are zeroed at most once in the page's entire lifetime
>> with guest_memfd, and that is tracked using the uptodate flag.
>>
>> Zeroing the page in __kvm_gmem_get_pfn() is chosen over zeroing in
>> kvm_gmem_get_folio() since other flows, such as a future write() syscall,
>> can get a page, write to the page and then set page uptodate without
>> zeroing.
>>
>> This aligns with the concept of zeroing before first use - the other place
>> where zeroing happens is in kvm_gmem_fault_user_mapping().
>>
>> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
>> ---
>>  virt/kvm/guest_memfd.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
>> index 90bc1a26512b6..86c9f5b0863cb 100644
>> --- a/virt/kvm/guest_memfd.c
>> +++ b/virt/kvm/guest_memfd.c
>> @@ -1137,6 +1137,11 @@ static struct folio *__kvm_gmem_get_pfn(struct file *file,
>>  		return ERR_PTR(-EHWPOISON);
>>  	}
>>
>> +	if (!folio_test_uptodate(folio)) {
>> +		clear_highpage(folio_page(folio, 0));
>> +		folio_mark_uptodate(folio);
>> +	}
> Note:
> In the __kvm_gmem_populate() path, this folio_mark_uptodate() call makes the
> later one after post_populate() pointless.
>
> __kvm_gmem_populate
>     |1.__kvm_gmem_get_pfn
>     |     |->folio = kvm_gmem_get_folio()
>     |     |  if (!folio_test_uptodate(folio))
>     |     |     folio_mark_uptodate(folio);
>     |2. ret = post_populate()
>     |3. if (!ret)
>     |       folio_mark_uptodate(folio);
>

Good point! I'll remove the folio_mark_uptodate() in the populate path
then. Thanks!

>>
>> [...snip...]
>>
