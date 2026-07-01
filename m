Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D7625B0B3
	for <linux-kselftest@vger.kernel.org>; Wed,  1 Jul 2026 13:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782914002; cv=none; b=RVx5YVyBbTh8aXj8dGeAj2lEPmuxPke3PlXfjlq9z+YVP9Z068ME0zl4WLhdjb+84Cr7oxBOmoXDhc3IvK/Qv24lCSP3sOeJq550ulIbyhDyc9+NQDYge0Z6k04//fuCpJNT/ndcw4KIimKHGNjAVg+b8xHk23gYuahRQDqer5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782914002; c=relaxed/simple;
	bh=k6UrRFYCyc5Lzmrh2nnW7+82Ut94TI2p/klH6GO/JIw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jvWfz/sZYX929B70Uw9o3Ff+TVQ//5Zs6i/dtqDFcsTnPO8dYz51Yd+/JzioKIx6kTlpIqwzjYTrt2xEWH7CGGhQ7FO8Ang61ErQsSXWxl83XwmgCtzhFxLCtiA+HDnAIA7AMzGfL9IsfmR/kR+97XEs4siOHlrJCvrWnHfCSYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hGcnKqXu; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hGcnKqXu"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c894391f000so982005a12.1
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Jul 2026 06:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782914001; x=1783518801; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2dlvRC/ivhzraYV58bWG4aEWroXr163d0LU1VPS4Meg=;
        b=hGcnKqXuDyYBtXoz9E2s3EvKuJde3fA/I5zDuDTQCmF6lWrrXkDMU0cj8a8RKAbP2J
         /vFmnMvZyvCBxsw0bVZY0nlu3fLi+eNFRQFTgMYadZw4hFSdmS/v4cq+UYOB10mH2fKc
         Szj8jhMEgAmjeeJjbDE5B7hVFPJH5CyBa1CXPLHY7v2XvnL4ofCnHuVvdiQe+zsrf+0E
         zwBQmocxPDeUJnF8rRf28lut7Wfx6N04gQwxVdiGJfSMIt7wlS62ph7/xmfuprtT4hG1
         T3TGu0K0scVdN/7hVThvmPEt3PaNQmGmRP3JQIV1R8F6k88Im7Vfc3/qVuo7HGoLufi+
         67Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782914001; x=1783518801;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2dlvRC/ivhzraYV58bWG4aEWroXr163d0LU1VPS4Meg=;
        b=PeXrKErPuCyZjuateI2ZNunRYZSIPWffLbfZ+nhVnmkcXpmmjXw1V76x4iw1KCcVJR
         vSP9QMpli2+7VyODA7hcziioT8L6p+fEk5gy+wVF53/4F8MTgC6ZGou8/Vhugv5lavGh
         12CzuUnsTlB5i5ZuXkJP40XbCy3yBnoEm+Yv3iGCHWUUHbtSxVPzVLfPWRunGMRRuPgg
         o3kp55ngXIZGhYW2ji2Q2+QyqSBR4jFGsxomCsSPe1Jt8gM60zr7Kyr7hezogqqdDtDj
         FD0i4N2+att/HvyVTpTlLdKnORlhSjvN24MyeJV5u0I2OH1mHTgOKyhwH3kCA2ZEapPY
         xzoA==
X-Forwarded-Encrypted: i=1; AFNElJ/xPMumUW0PHNaG+yTT9ntU2tze60YmsSWUyCgQzarKH8JyfEQns7ixsDYH5nSgF0tCr3b6o/qS+09aAQ2sCpo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS8YOLk2722ipWdzsGcjAn0FS3f7qnG50KVFwViobyxMlmGj0R
	XAbTtEKrVBqIvyDqBzNjfkcD/Cu2GUwBwRtfIaP/bk5sbwf5p+ekTcVwP0aTNj8SnuPtNr48Ukp
	TGL/a8w==
X-Received: from pgam26.prod.google.com ([2002:a05:6a02:2b5a:b0:c99:aff5:707d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:6a11:b0:3bf:acb2:5d48
 with SMTP id adf61e73a8af0-3bff4227b8fmr926021637.38.1782914000204; Wed, 01
 Jul 2026 06:53:20 -0700 (PDT)
Date: Wed, 1 Jul 2026 06:53:19 -0700
In-Reply-To: <25fdb77d-20f6-4b3a-8b3a-dbba0dc47046@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-24-9d2959357853@google.com>
 <aji/2svhcc84rn5w@yzhao56-desk.sh.intel.com> <CAEvNRgHYTFnHbsLLgMTCSitmnp1_j9Pomikm9qmpGTh1w8YE5Q@mail.gmail.com>
 <ajx5Vrz9ma--hrGH@google.com> <ajyJhZcgfYFtGfS2@yzhao56-desk.sh.intel.com>
 <aj0Jf30PS2f7x1nt@yzhao56-desk.sh.intel.com> <aj087H1UWSFxbShR@google.com>
 <aj3H2sxymOYTWTnE@yzhao56-desk.sh.intel.com> <aj7NwCRwWEfLK-gQ@google.com> <25fdb77d-20f6-4b3a-8b3a-dbba0dc47046@intel.com>
Message-ID: <akUbz_kJvYulaboo@google.com>
Subject: Re: [PATCH v8 24/46] KVM: guest_memfd: Make in-place conversion the default\
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Yan Zhao <yan.y.zhao@intel.com>, Ackerley Tng <ackerleytng@google.com>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, jmattson@google.com, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, forkloop@google.com, 
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
Content-Type: text/plain; charset="us-ascii"

On Wed, Jul 01, 2026, Xiaoyao Li wrote:
> On 6/27/2026 3:06 AM, Sean Christopherson wrote:
> > On Fri, Jun 26, 2026, Yan Zhao wrote:
> > > My first impression of gmem_in_place_conversion=true was that it enforces gmem
> > > in-place conversion. However, it actually only enforces per-gmem private/shared
> > > attribute.
> > > My worry was that people might think it's a kernel bug if userspace can still
> > > have shared memory from other sources after they configured
> > > gmem_in_place_conversion=true.
> > Ah, I see where you're coming from.  FWIW, truly enforcing in-place conversion
> > is flat out impossible.  E.g. userspace can simply replace the memslot, at which
> > point the memory effectively reverts to shared.
> 
> would something like below enforce the in-place conversion?

No.

> Userspace can create a memslot without gmem fd, but that memslot can only
> serve as shared memory and cannot be converted. So it doesn't violate the
> in-place conversion.

But userspace can delete said memslot and replace it with a memslot pointing at
a guest_memfd instance that was created without INIT_SHARED, at which point
userspace has effected a shared=>private conversion.
