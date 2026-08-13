Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E0E403E96
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 18:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786646452; cv=pass; b=NRcNJLQAi+zop96Zpu1DmiSSinxiM15izIfSVqKBtcZiT5nZpQLmD66Wjt7TwxTtxsaVFllCDoxunxPtbhIHZl0HS2qYX0vUmdd27kCUJKTuWPzYpFfGhmxR26dx87r4TgzEi6u6RtC30wWm1sOFvB0HqFEwpgqX9Y9t186Q00k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786646452; c=relaxed/simple;
	bh=SmuHUPl640dUfP/T8wiC16wCTI5Yqb/6dnMHylHeXNU=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wo8dJsZNV3L1t5L7Te5uPh24XGZ+SP2NHBm3+JU1OLTqIvHqcYaNeOo8J7fdPdvNdOdL3HFxr/FS35JhqIVCtn+Ju43XVRKeh6M48ibiOZzmsY8ER5vQ+0tehLDtxldAk4ydDyCxbAMXYR6uoGUzeeXORsHNtR01LFQoSDz6LuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rtH/gMxx; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rtH/gMxx"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e08baf860so155567a91.2
        for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 11:40:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786646450; cv=none;
        d=google.com; s=arc-20260327;
        b=gLAN+Lfx/W+wcbly12CvZNCbu2icdsBbD0Jar+iqxFj5P5hbdu/anwtZ17povvoKyb
         v2ZfgVPzgxRlJDx+AQhFtfPAc0Ws/Ivxh6Rxw50Pm6ZIvmZLBCiREddE29Owr9nkNuSZ
         flXj1sDXNqdxOS2ASLc+yA3kooDLz/zp5WcC3rrNTE7B/yN6p8Zc/a5Z37WxZNUwPaYp
         /HUGGpm/c4WSkqF6DlqDMnuZVqyUQRofve+WYgN7VFt5uhmwywvW6SN4pSMwjbrdBET7
         X3lJoDiAFZsJNhH0F+cTfV/MdLxozG/YT5BKyMpFZtMX3XANfcA0ql+h4DeVTq0oxmTy
         dLTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=FfCarHoh7qSi7mQScz0h/iOmFe8yy6xC72Pgonixm98=;
        fh=Bp++s35DIf1XlusqqXIRg+liYdqVMgGbq+6PqcUcGKg=;
        b=dm8aoVoqlfu9FfXWTyu+Lm3orP2w6ShP6RTxKP7uI6dXJwWJJkHq2AQlDE7rn+KXQZ
         fr3u5MEmG029181uTA5/04WTpFM0ipeg0TyFElCSjXM/QH6mUnlCa7yokOqpwqKY6qm1
         iZJ3G1a+6/FImvP89kxsMZp8b9+zvbqOZz3VgP2nn0pwatvoV2+cbc4wVhEN8UsP0uU2
         yj4O2oYjUo6ErR5r38ilQRSpcM8OMKibzi92y4qw0tV9apspe80LBTEeJD1Kd10M36yW
         HIcKVqNNQubCCxXkoWBSmPkD8Z3CSf8Fpx38IE1ittAxfSoqhQJW/9qQmXARGq3P+oA/
         nHzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786646450; x=1787251250; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FfCarHoh7qSi7mQScz0h/iOmFe8yy6xC72Pgonixm98=;
        b=rtH/gMxxvOe2cU1ddqq4AyofAT0g/9O7Nm6G9AFpyc+uZP0jsMvlRGGCAE5IBoNkZB
         0diVPyDQ1x3p14dcs1583lrDRK3j45lg1uw0+J0o8+bRphMPncXVJsOAN17QZEReqvBY
         K8eTzDaGtAHTc6Ps1tEvo41etvQTw1sTDz0fh3MmpoaGm9jPcg7HwjwoYMCEaLtwKga+
         zOfQ+5xL3qxCtUD63k7wyp7KM2uHTzjBxs+tzuphLoCYJZTogggHTYc13cMz7ERNxsPJ
         Q1MakAvGm8oZmjKTMQU2lsN1VuF0xggalJl4t6iSQxs9pMGoeUoJr4OApLPSS5tGyxX4
         /SwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786646450; x=1787251250;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FfCarHoh7qSi7mQScz0h/iOmFe8yy6xC72Pgonixm98=;
        b=dtc14lg9/1zr2LfAXpbjK8raidhMzBQh0DCj7RXipfoPFs/p1/3dSCsVuzbTKtZ1j6
         G+y70UpriqrFyZR2Fnlq0yiHonxVxwcZl8AGWVhxfcIrwSNRCVYaDurYRbMwwbNVbes5
         mJgRBKlbdV9t6jpwjPjiq+4QYCQhJ0sa1qjaNKfzI58yCfXCB/4KGvynweZ53rQ1/pkS
         Sel94MLlMXqDkJpX63dzdFjPtQrDEww9v1kxRiFz98j1aawyEwrQwDtZNa7BYrB8lGvw
         TkymfjvNqjWg8ujWab9soqr13xJ69DiYmFk8r16fwV2/jn3TwDpdOltHhsyppJay/9cN
         XF4A==
X-Forwarded-Encrypted: i=1; AHgh+RraOcQY+I46WSLWmNMgUxNN1rAWeAeN+fIzJv5Q9hzESTVGlQqs/GO7PAlCv37w7abk4WyPCHvlVQwkikbcx0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMOGgOLzy2/EBEt8c4g7fEKkvz1ooU2SovgT/5KbzNY8VzRgb2
	p1PX+WJph0em9IBg+OpiYQtyjAqVGmQ1Y95ZgOQpB0jyJONJGnkM46BOl/3atbzb+gZKljAX3e7
	g5DAWooga/w37bb71q/BKIY/Gwp0avZxaetBfQyC1
X-Gm-Gg: AR+sD12YS7+5HLm4LqTxo6SZoGUFyDPXP7bfFzP7gtZ3CiWQGnppzvDd4NWZgCdS2RP
	aa41vFRgHyAiBUf/qzvPxeHQsFUuQxLIVDZik4VhpxKsNyIbW5dQl79z6gSC2czR7lKTNdcsz5u
	BxUx4+b1wQ51z9ESTdzGEv818h/11bhhikksms9xfJW3tmHCoa6POgRdXovUkCi4mc2PqGOxV7A
	BWMs2X71IaPfFHJQoNGV3lyPr+HMnOS2QFrInrfu5QZGXPz4RnqmW5HLHLHP2IpJ7ZaYAyyd7Q7
	miHlFigDv8sRhvMIDSYXv5kl3ZpI8yEb6FyoNmNIXIYYw7pNMM9s9QFeGL+xP1QYL/tdOnOU8Gk
	u2Ft4u0WLL6FcwCmfancWYn30Y6Fh0Bs=
X-Received: by 2002:a17:90b:1c03:b0:38e:2860:253f with SMTP id
 98e67ed59e1d1-3931e25f24fmr8532991a91.12.1786646449351; Thu, 13 Aug 2026
 11:40:49 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 11:40:48 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 11:40:48 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <cc44c9d7-a6cd-40a5-9f68-4822fb9c9d0c@intel.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-7-2fc18ee6d3ba@google.com>
 <ed483d25-d908-4248-b8c7-862dd35dc6d4@kernel.org> <annnrGR1noVuBkCc@google.com>
 <cc44c9d7-a6cd-40a5-9f68-4822fb9c9d0c@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 13 Aug 2026 11:40:48 -0700
X-Gm-Features: AUfX_mwbi2KKm_8JKoJYp71B4rnhRB-DpUSQbtCK9ZlqdFzmBXno1Ngt_qJ6KFA
Message-ID: <CAEvNRgFd-6-QxR7w8SxPRa0UU+AAF7pDupLP8cPbQ9y3m=2QVw@mail.gmail.com>
Subject: Re: [PATCH v10 07/41] KVM: guest_memfd: Stub in ability to enable
 in-place shared<=>private conversion
To: Xiaoyao Li <xiaoyao.li@intel.com>, Sean Christopherson <seanjc@google.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Xiaoyao Li <xiaoyao.li@intel.com> writes:

> On 8/10/2026 11:01 PM, Sean Christopherson wrote:
>>> As mentioned in v9, the name is confusing.
>>>
>>> 	kvm_gmem_mem_is_private
>>>
>>> ?
>> Ya, +1 to kvm_gmem_mem_is_private.
>
> So kvm_gmem_mem_is_private() calls kvm_gmem_is_private_mem()
> internallly. Ummmm.

How about

  kvm_gmem_mem_is_private(kvm, gfn)
  __gmem_mem_is_private(inode, index)  <== this is a static function
                                           anyway, though it calls
                                           kvm_gmem_get_attributes(inode, entry)

or

  kvm_gmem_gfn_is_private(kvm, gfn)
  kvm_gmem_is_private_mem(inode, index)

  (rename the vm stuff with the suffix gfn_is_private())

or (current, it is actually weird)

  kvm_gmem_mem_is_private(kvm, gfn)
  kvm_gmem_is_private_mem(inode, index)

or

  kvm_gmem_mem_is_private(kvm, gfn)
  kvm_gmem_index_is_private(inode, index)
