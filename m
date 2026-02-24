Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E318376496
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 10:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771928049; cv=pass; b=NNA0PzEkcNdD5A47dBjdn7IlgVAUN6bOyVhPKmKb159yiEmj7uDZwfK8xeDBeiT6DIid6EIo5rXAn6UNUjS5DRBS/wF1+9OcXX1apXjhxeUbDhdZna+bRo+FrJUirCbnTVXob8Gg2xSTELvbsWw99v0GKuOQjRht3M25n2ZhC3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771928049; c=relaxed/simple;
	bh=IyKhJiJuQRzoX6JzUZnwApPT0auX0X1bnVL6krBBBGY=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nlFuly0+WAHRzk2LL2DGZy0Vjm9v2nRBxmqZBwRbpNTtwBpWWb7lDnfqQrsoZOnTc+A7o+9C8/k5XRcUKUueqAJ9ErDBB2/eGQvnOzV3s9fsPm7zeQaMqrijQdniQFcxrYu3AHqsL8uc7ssjCOaqscyyBaa4azZ2g6xTdJZQEts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xutZiDmS; arc=pass smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xutZiDmS"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5faddf6db62so3524195137.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 02:14:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771928047; cv=none;
        d=google.com; s=arc-20240605;
        b=h1lBUcA/EqxyEz+mg43QSON8MNGnjb3CKph6NJO69Qnyq5Y6pJPTSt/8LhqzbySDjp
         1omnUkWJOcGEOD0b+xoGCH7Hx98vnJ36ihZZjgwNx/F0J8LQKKX/kqDd5+iP6hMmIDsv
         kGSVfYWQrQBcWfQF/dnHeYkPVsKzKdRaF2HNgSQV6jrkwSctQzKj7qGFvYUF3h+XHB4P
         nmk8g4MEs9HbC/PQ69NhDxotckn5ugqjXVp8Y3icFaBQhv3jwVAubMskQ+wRCWYqpaC/
         BSVDJQDi4Rl/8aojpfNGfa459syMEnMctIxXBCjJ1CDD5YpB53MiUgcRGhPF+bxIanY+
         qo6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=LuhKBmL9p2A6pZ7W4MZ0PQ69Fw1Xjb7zt9bmn80iyFA=;
        fh=Z6MGcquDuUbtQp77iQHoeZfEEkQYTHT7mvNH0YyuelE=;
        b=h0DK7CHMvpEZMrn+x99zyDlwtIz20bYXjfqDojhQEyXCJNwxMfaPeI9FVABLrNXMqs
         GT2on66lo97AAZvuhIp5+evwo6AqAgVLrp8gzXN8TonH4MzJrC4kb0XHUZZudQuzKRdR
         d4HQ5SQYLzUxt3WEAjYRS/81b6QTRm/7xyavJ1bs8WuVM+zntQEbA+S3I0sufeZliAhq
         77o55/hs3fo0vZYiPGQj+j6JtkIwbzCX2gAn8eYRd3TLQzUBpWXzQOB1XfZZnGy4yfVm
         t2Xe9oHbLUKt4QbmpjH66pibqzNFWe1l15O7xcy/TQHcpVViYfI7JMmoObImPdAQjIoA
         wS/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771928047; x=1772532847; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LuhKBmL9p2A6pZ7W4MZ0PQ69Fw1Xjb7zt9bmn80iyFA=;
        b=xutZiDmSUlD/DMw9tfRVwQ9hAjtus32ia4wnAOb4AbBw7jr2Pm/Xeyu4VTDbCOhraH
         MrgT5sQiAEgdjnlWVSDG2WKes5jO3DXmb/YOByUrMxO3MXnvVegtgdeaA9+2fF3Wq1Om
         u9Sv0YWyLXsQQd+5xV6tfBcgSbDj2yKpD5aCdSGwyMZACC0ZPvJX6Q39jfIp8NrTgJjw
         kyq5c4qxILldKJznLZvhwWn3nF/DgY5oMxa84BvNp7Jnaejlif8GJxMO6NswQUUEHtsQ
         DMl5rPYwO77Zq/dJ/jbcRSeY2UsVNhd2Nte7ea3TQgG/BmmYWAzBsySDJUuwnLu+KX14
         Nv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771928047; x=1772532847;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LuhKBmL9p2A6pZ7W4MZ0PQ69Fw1Xjb7zt9bmn80iyFA=;
        b=pj2fobW66OyW3/ZtZLkNgaV7B36P8qtmuO2ChhGVcNY1LFPYZsk3yyilUMu7Yg6nrv
         Y7AjHnCZLy+BNhGY8U7gEJVtOvl/pLr0ncR0SELL4gmfYYtspdOpclzi3HC6xz+ju69x
         2WMPddef40Io+ppOoAKaew4prldUlE+PkX5G8bjvM+5Tiq3hqsKSkOlPREoFErO+X2uT
         gl9dbzuna6Alvu0k52tMUif3/JOoUQG7s83Y48h7zp+/twWUDCOerhWPhI0XvFvTYBAB
         1G3/yt+40T9djns7ZXnMVmlxv2izj2xJ7q3icownALz83D4sFZWgbP6aW+5E/DaJpjeX
         Sd2w==
X-Forwarded-Encrypted: i=1; AJvYcCUhmgyL+sg9Mw9+4AGstD9H5v+QAPHcCk0CSG4tZxAUNZ9fA7Vv+zORAB/oyyWnChsbiaVcS2tmSwlyuo3qsb8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys2EssAW2J0CMO2+j4/2xNdhDjDNKC6mK5azSicmfrFuorlEpu
	lUaDYgHnMFPDDU2PuGEzSjSYCFlwV/EXL/jBaLmnGXT0k1nr6ZzShWSfDxZe3em0LtOX0W0rVGf
	6fQCbeiJXoiqFOmXjvruPFADcl2Gen7esDvZnBe2B
X-Gm-Gg: ATEYQzwF7p4am3TCCsVLDzE6jSAs8cyWujsfvhXmyDR1Xn2jPUeyuMuVnXZzchsAD6b
	zBi6Qi0lVt3hctNyeQm2sh8AN1GkdWh+lWuUqLhC1fmPa0mrZMcdPmJQkvsqlk504avsqapYFVa
	938bD+RYwfzBK6LLsLom5ulJ0zk1QYX7OKBRHnGNANyxNstCBZ4zpF0SzdeALn/rEzlG0sdEiwM
	AVseXBD54a9M5lg+aMZ7rpNVc25hQ/VvImihxPmE93RNMpNUPtv6Rinbw94S0e3Y7Mx5ZyWdNE5
	SqCTDg0bwXZcyOB4WCdQgUZKUOyXabLbqW35S+n8
X-Received: by 2002:a05:6102:e11:b0:5f8:d3b4:9517 with SMTP id
 ada2fe7eead31-5feb2c4ea4amr5648164137.0.1771928046467; Tue, 24 Feb 2026
 02:14:06 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 Feb 2026 02:14:05 -0800
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 24 Feb 2026 02:14:05 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CAEvNRgFMNywpDRr+WeNsVj=MnsbhZp9H3j0QRDo_eOP+kGCNJw@mail.gmail.com>
References: <cover.1770071243.git.ackerleytng@google.com> <86ad28b767524e1e654b9c960e39ca8bfb24c114.1770071243.git.ackerleytng@google.com>
 <CAEvNRgFMNywpDRr+WeNsVj=MnsbhZp9H3j0QRDo_eOP+kGCNJw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 24 Feb 2026 02:14:05 -0800
X-Gm-Features: AaiRm51EKOaIOw7Xa64Dg1IqVEZq_6qI_aDRRZTOYQVamaSRRKhT7UeHK_oqjfM
Message-ID: <CAEvNRgFBLgvYoR_XTH-LiN1Q00R9u1HGC5URbstLPxYtedS0MA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 09/37] KVM: guest_memfd: Add support for KVM_SET_MEMORY_ATTRIBUTES2
To: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, x86@kernel.org
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	bp@alien8.de, brauner@kernel.org, chao.p.peng@intel.com, 
	chao.p.peng@linux.intel.com, chenhuacai@kernel.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, david@kernel.org, hpa@zytor.com, 
	ira.weiny@intel.com, jgg@nvidia.com, jmattson@google.com, jroedel@suse.de, 
	jthoughton@google.com, maobibo@loongson.cn, mathieu.desnoyers@efficios.com, 
	maz@kernel.org, mhiramat@kernel.org, michael.roth@amd.com, mingo@redhat.com, 
	mlevitsk@redhat.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	pbonzini@redhat.com, prsampat@amd.com, qperret@google.com, 
	ricarkol@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, seanjc@google.com, shivankg@amd.com, shuah@kernel.org, 
	steven.price@arm.com, tabba@google.com, tglx@linutronix.de, 
	vannapurve@google.com, vbabka@suse.cz, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng <ackerleytng@google.com> writes:

> Ackerley Tng <ackerleytng@google.com> writes:
>
>>
>> [...snip...]
>>
> Before this lands, Sean wants, at the very minimum, an in-principle
> agreement on guest_memfd behavior with respect to whether or not memory
> should be preserved on conversion.
>>
>> [...snip...]
>>

Here's what I've come up with, following up from last guest_memfd
biweekly.

Every KVM_SET_MEMORY_ATTRIBUTES2 request will be accompanied by an
enum set_memory_attributes_content_policy:

    enum set_memory_attributes_content_policy {
    	SET_MEMORY_ATTRIBUTES_CONTENT_ZERO,
    	SET_MEMORY_ATTRIBUTES_CONTENT_READABLE,
    	SET_MEMORY_ATTRIBUTES_CONTENT_ENCRYPTED,
    }

Within guest_memfd's KVM_SET_MEMORY_ATTRIBUTES2 handler, guest_memfd
will make an arch call

    kvm_gmem_arch_content_policy_supported(kvm, policy, gfn, nr_pages)

where every arch will get to return some error if the requested policy
is not supported for the given range.

ZERO is the simplest of the above, it means that after the conversion
the memory will be zeroed for the next reader.

+ TDX and SNP today will support ZERO since the firmware handles
  zeroing.
+ pKVM and SW_PROTECTED_VM will apply software zeroing.
+ Purpose: having this policy in the API allows userspace to be sure
  that the memory is zeroed after the conversion - there is no need to
  zero again in userspace (addresses concern that Sean pointed out)

READABLE means that after the conversion, the memory is readable by
userspace (if converting to shared) or readable by the guest (if
converting to private).

+ TDX and SNP (today) can't support this, so return -EOPNOTSUPP
+ SW_PROTECTED_VM will support this and do nothing extra on
  conversion, since there is no encryption anyway and all content
  remains readable.
+ pKVM will make use of the arch function above.

Here's where I need input: (David's questions during the call about
the full flow beginning with the guest prompted this).

Since pKVM doesn't encrypt the memory contents, there must be some way
that pKVM can say no when userspace requests to convert and retain
READABLE contents? I think pKVM's arch function can be used to check
if the guest previously made a conversion request. Fuad, to check that
the guest made a conversion request, what's other parameters are
needed other than gfn and nr_pages?

ENCRYPTED means that after the conversion, the memory contents are
retained as-is, with no decryption.

+ TDX and SNP (today) can't support this, so return -EOPNOTSUPP
+ pKVM and SW_PROTECTED_VM can do nothing, but doing nothing retains
  READABLE content, not ENCRYPTED content, hence SW_PROTECTED_VM
  should return -EOPNOTSUPP.
+ Michael, you mentioned during the call that SNP is planning to
  introduce a policy that retains the ENCRYPTED version for a special
  GHCB call. ENCRYPTED is meant for that use case. Does it work? I'm
  assuming that SNP should only support this policy given some
  conditions, so would the arch call as described above work?
+ If this policy is specified on conversion from shared to private,
  always return -EOPNOTSUPP.
+ When this first lands, ENCRYPTED will not be a valid option, but I'm
  listing it here so we have line of sight to having this support.

READABLE and ENCRYPTED defines the state after conversion clearly
(instead of DONT_CARE or similar).

DESTROY could be another policy, which means that after the
conversion, the memory is unreadable. This is the option to address
what David brought up during the call, for cases where userspace knows
it is going to free the memory already and doesn't care about the
state as long as nobody gets to read it. This will not implemented
when feature first lands, but is presented here just to show how this
can be extended in future.

Right now, I'm thinking that one of the above policies MUST be
specified (not specifying a policy will result in -EINVAL).

How does this sound?
