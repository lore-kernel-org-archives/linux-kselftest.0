Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4BD3BD243
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 14:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775227820; cv=pass; b=hCFh3RPUrOLE6Dy7VnEDJB5yR7xcDtRuYbpZEHgS2j7VMAwNqPq/AwzB0LXihjSfG1osa864TNXzVjgxbFhjxTdCw63fr84WTSak+XuIA+Fpe6ARMlj/ENQt5y3AntKW7xcuu8k7+3k1Z5dWIoP8PkPkJ1rn0s1X70pmhtGZKSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775227820; c=relaxed/simple;
	bh=I+MWzIcjsJY2NaaxS4ZYHOH26kmrsRv9LK+RJfKkIC8=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LkL3EEk8WZkjzIRwMZT+zMD/uNODGCyeJL79gT5TlegHc/kFBdFqTYJrT/+FmAZe7/FSJb8JC3EBlnPSdd4m0Yv1nRLQSMHGU1B+DvP7qeFvJADvh83XcrD8Lmqi49EVsY8SQN6SQflytBawezFRd6mHUfVGco+dJc7nXNUfJvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NGK1DH3y; arc=pass smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NGK1DH3y"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-953b8cb56f2so524096241.2
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 07:50:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775227818; cv=none;
        d=google.com; s=arc-20240605;
        b=BY9a9R5YqhYi9ap2OJoi+fy8iTXgrDA62gAkb5N20Gr9/tbwfQsGsOcZhn0wp0eJfk
         F1sQN+ytQaImLAQVwivU0ddxIlX7yP5ZmDUKjgMEPxJZMcI8dnlv/wftydeYa2Nrf4Yh
         sVcTpJrrNvHFihq7jZeoLCuFPMP/H2G/00p1RVN3pvwvm5UAoBI0IH1tzz+QhGlHEfZj
         Dm2hkutlkeFky5yrbW2mH38zcyE9Ueiz5/Hd2M29aLz3H/AjMJ/y+k3p7Km7HcTk9RjT
         /fdQHn2Ou2Lz/PkvuUSTPgps+XlX1vVFG9+4x3qiXQXFKPkT6qFrEzpjR4D+Fi4QTKtI
         2Ccg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=2nO332cdhj8pkWKcB2XgZGKk4lKtIFb9kXIiefVqdlI=;
        fh=uENQBeEQQQb1133BOm/cdcCJic4R5qrJFM63n5WKxxU=;
        b=OjTikT8hRVPEEyc7YnQV2zeyQ8JYeyA4V/fQdSgBV4MxGadU0aN/7+ffn7KObed+Om
         VYo+SjbAMz3pBDM1K//BfuIsVEgzRU98hD5c+IMUaSFgTsci5GL0gtC9CWHmyk3/ronQ
         PoeCi80aoJnHChxz6JMN49rkOFopIuLtGngKHnhroX32P5KITInfZP4GH7hPMF8ws2fV
         M/jGaJttyRrsTiWsEf4H30AYOg5hWOhbU1rGMaI9F5Vfr0wIkQluPsRsQByIS6/RBYBc
         H+HFw0X0Ds8TsCOeLS2ibQgRMe0LDxCmNXsuTHLKA0qMO0Wlgd9sSDz7pwsrAtEBEtlt
         bhGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775227818; x=1775832618; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2nO332cdhj8pkWKcB2XgZGKk4lKtIFb9kXIiefVqdlI=;
        b=NGK1DH3yyn5nUejSMB0t9cy6aOLKsbYkj6IBg4L7FqZ3yr+oMSxT420e2LtcIR0DlA
         By/DZyB05YL4mTfMOYOa6OoIIpRgTpGraEMBlr9hoDuF0EyUEibEdUK0DJG5cnSncINA
         MIpweP3nBuVSyvKHWc/S30NLstZe9iqAgnOGq2obdA5dIWj9tU7IIV/9FVhuR72yh9Xd
         TgNIFM1nZielDcKTROVl/BGJ1K7Q9N/9gQz4deGgtbn6FTiRIAd/cEIOYPDbBZD2EkPu
         3GTfomPcbI5Op/tNJ/0JjEWkVbw3eJB4+Mbrmb1YxEcdYJQWUghr/EbW+A4G0DsL78F5
         OM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775227818; x=1775832618;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2nO332cdhj8pkWKcB2XgZGKk4lKtIFb9kXIiefVqdlI=;
        b=JUpXjKQrQLXe7lpGAnjbC9e+UAGv38qZVkLtY8KEo9/SxiObN4tWkPmVCfUTTRYCrM
         3ZZosJU+UX6czV7Uefk+cE8TZc48qaeLYfLXbPLV6u+jqVhoRtOehScCyohXz9WB1Gw+
         /96O7Sx62DRGEkvCCJy8qgLdoMWyU3+WSQekesRiUvtABK1JQ6Sc7qFRNmhXMZMdGC5I
         YjN4Y+DNkXtW3M9Z7SGJn2l/3PolKkaaI4bq626It6u7mwmfwxaAA3/zeLeSV2aBNA/v
         BsDsx1tfU8WpRry+k8S2YKybErAwP8Gt1ekyqlBTAGH5X3zJp/Obl38EjAx6qFbNHRCQ
         RwMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvtmz3AE6Syco29n6Vl53mmHyaogoIKU33gL6JV/BaX3cjFsi7olz+VDJI8djNCwReZhYWe5MrnKhNB2sV58c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHa1j2XILvOvWf2Oz4snGE6uh9EO12hSuiGLQLMZwZky0gg22q
	pSv+eUG3ybNJ3zcYZ3DydRe3+70FZMrIt2zyU8ZDd1C0Q2VMexsKLADcgOfMtglAjcy05Ip0J8Q
	DuqQUZTwIngM6SVB3PmW+SrvLLm7rIyuUD4bpSGE6
X-Gm-Gg: AeBDiet7lvPFiuqfY8XQENGxKDH7oXmA4xij/NY0u3DV3449TAWm2TfeV2A17kjVBBW
	QgCv0r/ZNF8mDsPy3Zk6z295dw8bnMh41d7KIpo9Se95VFPakWbdU84lU2G7hxDHAgFeR5oVMjC
	2LU78jAawab02drUuUZubLWrlSJ9VieHrDMR+swTS7zHHyqF7gI8QOm8uEXWI9WQXfAbQcqjVNL
	AXwllSnz3bThbgOERIbuj3kbsyPU0Y6m1V61BUK7nlaiRTrDJS4Fprth3EsRRYS7OR0w0I8l44Y
	Aluf18tr2DnsnlUi+7ks+EcOaNvQHpbp1T5B5g==
X-Received: by 2002:a05:6102:5a92:b0:605:8280:5e68 with SMTP id
 ada2fe7eead31-605a50e2a2bmr1113935137.16.1775227817848; Fri, 03 Apr 2026
 07:50:17 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Apr 2026 07:50:17 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Apr 2026 07:50:16 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <CAEvNRgGm9icDK8sK5ZfqHEOEqSbvjwtihE4p9d3vpBq-NfVjmw@mail.gmail.com>
References: <20260326-gmem-inplace-conversion-v4-0-e202fe950ffd@google.com>
 <20260326-gmem-inplace-conversion-v4-10-e202fe950ffd@google.com>
 <2r4mmfiuisw26qymahnbh2oxqkkrywqev477kc4rlkcyx7tels@c7ple7kdgpo3>
 <CAEvNRgFkusZeKxGctUpTTbYjdi7nZL1ZZar-gT7XRUOCZ2xtpw@mail.gmail.com> <CAEvNRgGm9icDK8sK5ZfqHEOEqSbvjwtihE4p9d3vpBq-NfVjmw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 3 Apr 2026 07:50:16 -0700
X-Gm-Features: AQROBzCC-hVilK2nAfJ3eE8zmQqqNa0fWthx2SZG4jgOFPeFQ_7rmzXurA8c2f4
Message-ID: <CAEvNRgEtigp7+PVDkyu_DH947CUqDt312d+P+hWjjd2fHONiag@mail.gmail.com>
Subject: Re: [PATCH RFC v4 10/44] KVM: guest_memfd: Add support for KVM_SET_MEMORY_ATTRIBUTES2
To: Michael Roth <michael.roth@amd.com>
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, tabba@google.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Ackerley Tng <ackerleytng@google.com> writes:

>
> [...snip...]
>
> guest_memfd's populate will first check that the memory is shared, then
> also set the memory to private after the populate.
>
> [...snip...]
>
Looking at this again, the above basically means that the entire
conversion process needs to be performed within populate.

In addition to setting the attributes in guest_memfd as private, for
consistency, populate will also have to do all the associated
operations, especially unmapping from the host, checking refcounts,
and the list of work in conversion will only increase in future with
direct map removal/restoration and huge page merging.

The complexity of conversion also means possible errors (EAGAIN for
elevated refcounts and ENOMEM when we're out of memory), and error
information like the offset where the elevated refcount was.

It doesn't look like there's room for this information to be plumbed out
through the platform-specific ioctls, and even if we make space, it
seems odd to have conversion-related error information returned through
the platform-specific call.


I agree with the goal of not having KVM touch private memory contents as
tracked by guest_memfd, so I'd like to propose that we distinguish:

1. private as tracked by KVM (guest_memfd/vm_memory_attributes)
2. private as tracked by trusted entity


Currently, in TDX's populate flow, KVM doesn't do any copying, it only
instructs TDX to do the copying.

"TDH.MEM.PAGE.ADD Operands Information Definition" in the TDX module
ABI spec says the source is accessed as shared, the destination is
accessed as private, and in the case that source and destination are
the same, the "In-Place Add" section says the source will be converted
to private.

In SNP's populate flow, SNP-specific code in KVM does the copying from
shared memory into the destination, then makes the destination address
private in the RMP table before telling the firmware to do the
in-place encryption.


I think we should think of the populate ioctls as being
platform-specific ioctls that, when called, accept

+ destination address: private (as tracked by guest_memfd)
+ source address: shared (as tracked by guest_memfd) or NULL

KVM doesn't touch private memory contents, even in this case, because
it's really a platform-specific ioctl that handles loading, and the
platform does expect the destination is private for both TDX and SNP
at the firmware boundary.

Since SNP (platform-specific) only allows in-place launch update, and
KVM had to provide an interface that allows a different source address
for support before in-place conversion, then SNP has to continue
supporting the to-be-deprecated path by doing the copying within
platform-specific code.

For consistency, guest_memfd can continue to check that it tracks the
destination address as private, and sev_gmem_populate will then hide
the copying code away just to support the legacy case.


The flow before in-place conversion is

1. Load memory (shared or non-guest_memfd memory)
2. KVM_SEV_SNP_LAUNCH_UPDATE or KVM_TDX_INIT_MEM_REGION (destination:
   gfn for separate private memory, source: shared memory)

The proposed flow for in-place conversion is

1. INIT_SHARED or convert to shared
2. Load memory while it is shared
3. Convert to private (PRESERVE, or new flag?)
4. KVM_SEV_SNP_LAUNCH_UPDATE or KVM_TDX_INIT_MEM_REGION (destination:
   gfn for converted private memory, source: NULL)


TLDR:

+ Think of populate ioctls not as KVM touching memory, but platform
  handling population.
+ KVM code (kvm_gmem_populate) still doesn't touch memory contents
+ post_populate is platform-specific code that handles loading into
  private destination memory just to support legacy non-in-place
  conversion.
+ Don't complicate populate ioctls by doing conversion just to support
  legacy use-cases where platform-specific code has to do copying on
  the host.

>>>
>>> [...snip...]
>>>
