Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE382364055
	for <linux-kselftest@vger.kernel.org>; Fri,  8 May 2026 23:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778283406; cv=pass; b=ksnKVS6xufGsrd8T6bAQvCIg5fGyBSSEmarppOFqV+OAPhX7RtMmYMkU4hnSgB3Mi6KGDlTurQXf/EL6uRoKN7ruv4v8Fl0uCf4HaBlqLwXhI/m24l8OkhKO1KLMKIemYlSpwQse/0QQu8mCZuQh4l6TVR8Pz+ek0ua0qpWKycA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778283406; c=relaxed/simple;
	bh=qugc+0Ib7z8RHG2l2I3zLFMp2jsqIX/yclDbZ06fydk=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SIWN7o0LrOR4GZoALhSYirKBojD/kFY91beLc7dmxIcbiG22xrZBytHpl7nCg8MjrpgNtsHDwIgbVksFYw7Vd69ZGsLkg0F81jWK7dlgXt5yUlGIuY8VRtiCunaEPyutWDZ+yibJ/s7/q9DThdaEDUv2Z+1MbVVFZsLAYdC1wNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IFsr6bod; arc=pass smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IFsr6bod"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-575320e6f2aso1808842e0c.0
        for <linux-kselftest@vger.kernel.org>; Fri, 08 May 2026 16:36:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778283403; cv=none;
        d=google.com; s=arc-20240605;
        b=Im/nxQCH+Me/gJICJWDXTmVn6AKqAWNHPv1UCKvKbKVvD7eVvgUXOd4tvZL4ptidym
         eNjLCgsLnjJrdsQ4DxCIMVraH26gnvbHP4l/9mX6f95qdkYC2U6EBqTzXfpjtjj3mRQA
         NdPbfJk9YkOCtVEOeEfmNqRXwAd3LqnPw1TqcCxtTRWXwXUiyPHTK0BWwBRVwS3+9X06
         hGjLifdJegsrY0JzD7V+2PDR+FmkZk4Bbs2/q6TLqISo8XHs/suayE7frIgPLkL8QTTv
         hjDDj8ZUADtd30GOpEQD0r+aDDxf4S8BHiyUi4dxkCCvB3mhNYkPp+LxYlghkg2OjeBq
         1BHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=10imNO/dPWbMThTpLIZ3BPvS8U4RD3Gbc9CIOJSztJQ=;
        fh=Rh2UHvsyc/CEvkfDhhwo8hVig75vxWtXYd68/7AAA50=;
        b=jjbS49caXKQAnbnXUBTEbfMawPWGdX1RkWE5zxlQ05gchVqiuXcb9sNDEznWKhQdpn
         6V3h94LHOcgSaj0FY69/CYQ4xg45l1J2VwOtNYmtNiqZb58ej8zs051ihKQBmpVekhFW
         +Pzmq4RO6u9F80r7mms9nCI/w1k4Vatk6aFLEJXjIDLR1pyAgA9y/pPnsDol4A1vXUw5
         lcqbFXpb8IRmsp1XDPLNp9C0BPR9ivDI+JxPJsUGSVHU+fPXo8mqeaT/eGX+b0qIumhJ
         pDszElWmXTEysDIwTS2IQNWQScaZ6vEwVHYiZJ8TjA3ob5IN0FAYFN0Y8fzUPQ5hqTZY
         Akfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778283403; x=1778888203; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=10imNO/dPWbMThTpLIZ3BPvS8U4RD3Gbc9CIOJSztJQ=;
        b=IFsr6bodQZG7r4hxx08grgPMBlY0KlF2AhrFstCEFeDAS1u8eCladLOLiJBmxZdoPV
         emGB896Sdz9ACDVNOJnEPye4LN+Un4O8PHiwXq5G36QxAM2yxBmX1nIymV2sQNH0umBZ
         vEvopJLSR7xna833MQcq7BAAVfmlPkjRHMfzO+uOlozGPYomDIg4ZDMNsJxS/RAPgBa5
         MN9H9/t8cKIlu1V65pSIYmOHXFGV7CMdbbTdOQaBmNF8b+ouXBQipcJeyNeelskJ3G6C
         WMpaAIprt38Xirk89Q1T1BkaRK8NrIQajrraKWcNAYq2rvG3ItZWTam+SLWVw0hpVmk6
         O00A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778283403; x=1778888203;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=10imNO/dPWbMThTpLIZ3BPvS8U4RD3Gbc9CIOJSztJQ=;
        b=YhQt8klprNIBwPCvPflwQuZdibtqClXrA5ieDSQIycBYBaw8Si56HtPA4Nu7VBbL5U
         KXQRLBRkFBd7uCYKf1MmodhdOMpe1uKYgOHYfYWriuVVdQcdlY4siglPHwtNtAWSJxeu
         TtdZ2qyw0D9sPAK+UxT86vvjxBMR0yUhXngp6rPYXs4Vzp9rBON2wBp35ZmXcu2BLhV/
         j5HuQ2ByQl89fB13D7vSVa3M6s4AJkSN0JVJj9wuROsRKEv4l50itE7QyzQ9iORBbIse
         HkJBN8pOq2qC+jVbnHIWUex3YY4aMH28VesOtvzuvsiQuAvVKbEv+56h+UrHwofTUK2Z
         9mjw==
X-Forwarded-Encrypted: i=1; AFNElJ+hGyZJ+7PIRJCE5pmvK5kzqzrC9kz5JBTCGIuUQI/apCJVIWsHQjIsNKavLrzWE65fqEHUBc8Y+xjVWIsKLX4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgBWHYm6FB81or4QcOaZYAhMAsEl+fb6PyTz6egBHORDDHYcYN
	ecYHaI0O90wfsOxzd+tNMzkdS93ik0cFerIbQxTNHEumJ+/dBffHBMCy8kQ2JbqB6+ZOxs9E05T
	jD13sDkr80u0ngFoOSseBLQyYwMDJq9kkw1/5e5xE
X-Gm-Gg: Acq92OFoQ6mdBUcMJd5rglsxbtYKab7WbPkjVItfPueWN4dmzq37qWkjWusZu/oCi8s
	84MZgQxHwhtLqN7K+V4cMRHYNrBEFH9+fYkX8GSziWHngd1uBT449XqBobthc47Sw82JTUv8kBg
	rNVCpaDLs1KWnV5QtfNv4KRTuDz8ATBcvNZXvA2w5q2CSqHfQCSLW1bxbuEDRRs2QzTA3NdQ9lv
	A7LW5siKjGwwwlTONdIz07+fDOunAV6hSZcYtsDjbchMGIqt+cgCK9V7BlDxiwEuu9jNzgvcvXa
	eBMAMzTnYzkOxDvTF1n41MGgIhYIJUoOO1TGaI7+Ky1ZMHMw7E/1AHs8jyuOSA0I9MYuo1rhTsN
	gC085dCUeS+G5UZk=
X-Received: by 2002:a05:6122:3208:b0:56e:e80c:bb25 with SMTP id
 71dfb90a1353d-5755963576bmr9165277e0c.13.1778283402011; Fri, 08 May 2026
 16:36:42 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 May 2026 16:36:41 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 May 2026 16:36:41 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-1-91ab5a8b19a4@google.com>
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-1-91ab5a8b19a4@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 8 May 2026 16:36:41 -0700
X-Gm-Features: AVHnY4LvPjVICPzN5-_CJPHTIx7ocT885vUY-RO5A-DcMZDUx5r_5g4UegbM0fM
Message-ID: <CAEvNRgGF-n5gmTR5G7wZqH5gBZsOp6WMR-RSws+=g9tcCkfSiA@mail.gmail.com>
Subject: Re: [PATCH v6 01/43] KVM: guest_memfd: Introduce per-gmem attributes,
 use to guard user mappings
To: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, aik@amd.com, 
	andrew.jones@linux.dev, binbin.wu@linux.intel.com, brauner@kernel.org, 
	chao.p.peng@linux.intel.com, david@kernel.org, ira.weiny@intel.com, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
writes:

>
> [...snip...]
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 69c9d6d546b28..5011d38820d0d 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -4,6 +4,7 @@
>  #include <linux/falloc.h>
>  #include <linux/fs.h>
>  #include <linux/kvm_host.h>
> +#include <linux/maple_tree.h>
>  #include <linux/mempolicy.h>
>  #include <linux/pseudo_fs.h>
>  #include <linux/pagemap.h>
> @@ -33,6 +34,13 @@ struct gmem_inode {
>  	struct list_head gmem_file_list;
>
>  	u64 flags;
> +	/*
> +	 * Every index in this inode, whether memory is populated or
> +	 * not, is tracked in attributes. The entire range of indices,
> +	 * corresponding to the size of this inode, is represented in
> +	 * this maple tree.

Concretely, if the entire guest_memfd is 2M in size, indices [0, 511] is
represented with some value, either 0 (SHARED) or
KVM_MEMORY_ATTRIBUTE_PRIVATE. [512, ULONG_MAX] is also defined in the
tree, as NULL.

Since guest_memfd uses xa_mk_value(0) to store the value 0 ("SHARED"),
that makes 0 distinct from NULL, which works for guest_memfd.


(Liam and I discussed this off-list due to a email configuration issue)

> +	 */
> +	struct maple_tree attributes;
>  };
>
>
> [...snip...]
>
