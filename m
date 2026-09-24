Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B494840B110
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 22:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790289092; cv=pass; b=huZG0t9gqIMz/ZfWWIp/ok6rwhJUAef1vvucfmCMbDN5Lem2qP514YogPHmIm+mvXCmaEbHskFvuPZQkMH/ya2qVlayCcm8C5wIynKWFjEJ1zuBpg6opk1BeZb2OIv3wNCdMjeaSa16chZm08zvZo/9qMFwK25oU86gDZDhkvlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790289092; c=relaxed/simple;
	bh=QyHE3recU+YgckuL/EubHuVec7rhNZz4z30xRjcK4e0=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nru0Pvn2JrDORdovFwwgJbhFSHvVrP3WM2E9BXANon8YjeKucd0FdsBD7aVr9OyKW83KXVRtYaN9jSOwOcD59Sa60Zh95PVUuiZR77zbL/p6Qo73e1ql1yOEbzq7mSKOr4f9HdJu1r/EJP0T6LCzwSJ2Rue7pWnc2c60kyEgOUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CvuOtUQB; arc=pass smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CvuOtUQB"
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-939109f067cso26960485a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 15:31:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790289090; cv=none;
        d=google.com; s=arc-20260327;
        b=KQj1hyCbpt5MOvO9/v2wwd3ty8kluINyjVDwhU7k0b3L/Ri1PU9Fi+Op98oYwOk9Pr
         ukZMo44mBBFLZGy3mJ9KOdU+rS7E9bxTUlUsqdWQcAyFHUZDE+oSjYdWY+v9x2lYXUva
         3EgvVEPmepQxHam4msYe7g9ksOcRcdt+IHxKDtVEq65D6KWrUHkfRC4JVWRjIvVcVkgT
         lpuA579E7pYYuT0B2Sd+xX+ur5/SZPDsvQyPfPagUJO+gjeFH7RbJcLG1p/lfAgFLmOb
         yQXJ6K0XBlIavVGwBZ1qCo0amSrHtSj4K6pzb6XPWvZTYk0h9VTPrGsO+jP8ObWYz4kt
         FgSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=KLxQ1V7eKFjM5hpU7Dk8oYI/it/LXUSsiWfbILSfCAs=;
        fh=jdlFNR3t1AHlFVAsIE/8LgTt/XYI5xT7Z/JtuCPonTY=;
        b=ABS3w4SfOuoyE0f6gfXDG3e3+kxzQ7kmO7mw9tI7yhrsk+ejIDc6C4+e11zKlvNNhY
         /HumJ4PHeQ5EYSvMrhlZlgWXmVh3Cdsrea4bm5p1nPegfo4Qj9GnKGOZaQDQxg820Yhd
         jsU4gfVH24Z18bkci/0iRKtCZPzvTQ8kylRSXdnVtlVZIFPSs+x3pt22nMgDdQAJXS5v
         Fz+3W1DoDSzDydEzQ2Xd+kqRlZVSQ623VuhLqyVVhu36nYeaFXpZT+jA4lwDR9/c0+Vm
         V41CqLtFni5YXb4L87Qd11Vy1PgzapUDh0YMJMoD2egU2xafExGGmJi+Z+bskjULqTWl
         94nA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790289089; x=1790893889; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KLxQ1V7eKFjM5hpU7Dk8oYI/it/LXUSsiWfbILSfCAs=;
        b=CvuOtUQB/B4NTpiIDVO0oU8xoIsonreGdXZVXw+78v7q5YrW8DRlFGYMCN/VBUc8/o
         iStJentZaoI9twayKt9xqPL4Cw0lEq6J8aWdENNeqkW5iOMhDcHPUuuz+TEP/dzXM+XD
         lOvy2Fxusw/H+NQynYSRCFYhcccPNiOXt0Dquf7WYm9YFLY9RBjgqyEI/6jCln8qG0a+
         Zesms6H6dhFYDz9REiTFRfRUEVG31ao+j/KiuNLF1UOKUsn9vGO2efLveO0xpbRX/6fG
         xoJF9lUTMvbWYpBW5X1sPYcJqRkMf5UvAzUv9NXVa998IVRHpFfx7HABfZ4TNWuvN8oB
         7q6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790289090; x=1790893890;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KLxQ1V7eKFjM5hpU7Dk8oYI/it/LXUSsiWfbILSfCAs=;
        b=w311ph4x+orWxWJF+ePyCJpcbdqz0aXpLk+90+2zlS14BGpwfdFfWDIse7r6o2ybbL
         XD89x6sIzZRc9D3bEQNmS8EuueeVogycev4mzLF7DVbl38ZuP43O7Vwlad4jvd4oYB6O
         28kmVtJ8kIN2N6pSvFMhSKY9OrAIJnU6zAJNHhzAVFn2UKKM53tPyE60Z9/qdPk/0Wue
         9nLkyzQLZP/Gpwh7NkLG4u50JnmE0D3rgqMje0h+PZEllYF0k/zMzWeLXR5clMiw3mjI
         GidX5M9rCS6+apwta/16Yc/TwqH0BYlbRnHDexk/4/dGdWG3iv+Vl5kRXzPaDRSfghlp
         em1Q==
X-Forwarded-Encrypted: i=1; AKwUvBy91xYCvVAmPGe4kgcuHqsp/qH7+sZLe2EbGhu06/79M01uzfcQtTrg2PirjKaHIURzxztIeQVfJHD4tRpMWZo=@vger.kernel.org
X-Gm-Message-State: AFuF++kT5/5Nt9ojGGqiF+46jdP5grdXQe9Xa5hVb92LnMcJyLztpgV2
	wZwP26qjPf9R2nd7zOB5476xlY+H4tqgX8/cbxcLKeCNCrNNW+MPrMATdc64lx4Q1qLCSpGsuMN
	Z1EPJkdZ2Zm0gupkQ8/gDb9gfHpp5R1QD6Z52ByuY
X-Gm-Gg: AYBFou1f4V2GW86+r+OJUbkKXedd3PERujGrxL691MWsxmKxeI5EAIKEmNfP/guhyxf
	4lDrrwPyhtMu2dlx3t4oAshxvIzSmdGWUYV1ZGQ80VsYnkWmGhbYkWszBY7SSrXl34w+bmZEjIS
	4ahA6eKil85szzPShkg4Aslw7NJCEBB7Y4p8eRnAr6ZP3K8v/5Kn/0WNHendTpSuJ1c6ODk1t+y
	gj4UbPuBHkwFzD29rC7afy+gj/DV/NIaOuwfuRD757VfRlHUHjppPOLTReY31+H86QEFQfxlBCL
	uRDk0kzMpM4JTnBFX3sTOg3NqvAWnYfpV7XUTwvKux1KgQVQTzQfEgYOZv/3+qUdoWq24nvee3M
	3hptp6VgP5VXfDGlKtkrPDDSve0LhSPf4JgK/0LRAQA==
X-Received: by 2002:a05:620a:2b93:b0:936:eeab:307e with SMTP id
 af79cd13be357-93c43cc5676mr141474285a.9.1790289088659; Thu, 24 Sep 2026
 15:31:28 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 15:31:27 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Sep 2026 15:31:27 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <179028368162.2007072.12117327378679658047.b4-ty@b4>
References: <20260910-gmem-inplace-conversion-v13-0-dd6fbf94f4e1@google.com> <179028368162.2007072.12117327378679658047.b4-ty@b4>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 24 Sep 2026 15:31:27 -0700
X-Gm-Features: AclHuK8DxWsVWtzA-dbMsis8Esd8BT_dOvi97JucFF4AgqprHJknTuuePlOITb0
Message-ID: <CAEvNRgFpMwduvHPGJ5fLoVPr_iGn=ELzY4AcMGHESC6CkMyeTw@mail.gmail.com>
Subject: Re: [PATCH v13 00/44] guest_memfd: In-place conversion support
To: Sean Christopherson <seanjc@google.com>, aik@amd.com, andrew.jones@linux.dev, 
	binbin.wu@linux.intel.com, brauner@kernel.org, chao.p.peng@linux.intel.com, 
	david@kernel.org, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Randy Dunlap <rdunlap@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Fuad Tabba <fuad.tabba@linux.dev>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev, Xiaoyao Li <xiaoyao.li@intel.com>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Thu, 10 Sep 2026 16:55:26 -0700, Ackerley Tng wrote:
>> Here's v13. Thanks everyone for the comments and fast responses!
>> We're now at ~3 weeks to soft-close at 7.3-rc5.
>>
>> v13 is based on 7.3-rc2 and:
>>
>> + Hugh's patch to export lru_cache_drain_for_folio()
>> + Another series [1], which makes kvm_gmem_get_pfn() NOT return a
>>   refcounted page to KVM.
>>
>> [...]
>
> Applied to kvm-x86 coco.  A *huge* thanks to everyone who helped with this!
>

Thank you so much everyone!

>
> [...snip...]
>
