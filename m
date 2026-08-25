Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFB83CD8BD
	for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 09:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787650362; cv=pass; b=fYTy09B4WDEV91umIwyEXcqJEttC0h71y2A9PCDFcsWdpGFH8SrXStuSTcazNeO69VEyQVzMBqytVtHKOtfnDa7ey77DTyH8i5L/BNb7ClBHQCJ0s6PwyVYnjo9E8DKcZJvGMzE4YGMCo3RApUAq3gQUJu57Y648DYBBOEhGGak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787650362; c=relaxed/simple;
	bh=JmR/CB4xNI+jcLTEmH96suuAwtFrH/css1uIDKyeEDE=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dE6OEoVeqVWg4hHvr/3NvEgqfMr5kuenpF9rerPQ0p9mHkBcl5RjA+ycHSEP499OM5ghHTM+iCW1l5qK1Vo8QJtISFmASdNufC8xtDeOt/z1HF474djKWhZ+ZPTOyezPISveXP6ARBfjbVDqcksskgsEf72XEtd8ESgYkE+Fv90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=COhK4qYv; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="COhK4qYv"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51c928bf172so33354031cf.3
        for <linux-kselftest@vger.kernel.org>; Tue, 25 Aug 2026 02:32:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787650360; cv=none;
        d=google.com; s=arc-20260327;
        b=nlbXByC3QU+diTc/8mOOuRFPCx7JwOCqn+vXD65qCmfYqKMBtGdsGjz+kxi2ZSao8i
         fRruMx5EL7kB414iMzqGH9mxwF9QI9v7PphyMjBfloqnxB8WJNXuMx+0l9F4m55qVDcs
         0xy3fTQB/B9Tz2PvllOISLjVwIjtCfIpc3dTagz7cbiIfCZFSig2662DVrqsmpD4IvdW
         EkPo/Z9hsyUpqNyFHwZ7xPnFAbdcaIl44uOjRrDx/3wcvIRWXZk7T1/9V0HLzj66FILP
         LghivZ7cVtmYmxlmF0UoeEwbclYSXHpSUj7Vq00yJPGfyxM1Eh7Q8SGna9nNP55mvErT
         xS/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=uGYcelPQ9NcToBmCcA1Af+U2AVoIV7KPe08HWX7sjzg=;
        fh=UWoqVcvXw7Nn/a4oWSK6oxfjqVBDfh4Co0QcFiHtPfU=;
        b=l1H4PtkB54o7RJmlsEcSRxPIYdAwNnBFgYYHi2LQofSTDfVzuMuwKcPRKKfBYfrJWS
         T2sMgxEOPqUZa2ZcwDSD0P83xXr4pcDR6PwuyLHgWNlZ5KCjCwXydVtw+SGzcX4078rH
         g3rIKi0FT5mosCP9IOeV6zFt7AP2M+PUuTuwVWl1T/Q6Qu/XPS+uzxAlXV4KXXIjNpSk
         CusEbktRHYPI1jjfz/hl3gLQi2YXmgRRlf6t83HpfgKaqxumNSpR21q4I9vABQWTRK+R
         s7O/aGpOKN1qE/eo3b20/6VbHqEvNezucrXvXxsT8NRr6hBFr+U0Awqkh7TFq5trUdUI
         GdHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787650360; x=1788255160; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uGYcelPQ9NcToBmCcA1Af+U2AVoIV7KPe08HWX7sjzg=;
        b=COhK4qYvOoJJr+D43V/gT5xoxYixhbuEW3sQWFOSU/YW0eMfUsn7zourAB5zEVeqU4
         0Z+t6WDhX1//5aq5h0a//I/JnlYDqcQSDi1bKpFWXYtKmMuCMMiOCvWm5LDq/Oxlf25r
         ZzNOAZyfhlRKJEan2HpB3IaWqkW52eWyIopB7wRfq9X6476P7foLCSa6fJOK+0VuKbpd
         vUbIsefHSCFqqq3++sDiLAKYscX/2UWlR712PtWS5O/PaQbqx7z0uNmkyw/E9QcvhuBV
         cEJZj0GWoUq+wO8//74+Kk1TD8EkZMoU6TI5qJIDroligGGwhyYEruhOX9xUkiRJSIrv
         UYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787650360; x=1788255160;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uGYcelPQ9NcToBmCcA1Af+U2AVoIV7KPe08HWX7sjzg=;
        b=m6WotRkNH2cqRYri+rok1WUBm7wV7NGCVMkFLwyvGb7kG7fC8twU6+UGvH3rk/Qs7U
         zwfHOeIoHaBb8VHtTXILcL0+hoXksy4gF0ODDlyhCfxaZWImKhuhNuEW3cKzDav4YnFk
         FGBZkWKqDUNU4D3zPJNDwUOCV9vmdyDOFBrWRO+Q0NzZsg6NztTRbYxtqoy0gwBpU/lS
         JN3t/SI8OSpyny6Ea/c/ZWWVgEh6XPEswlh4SDgaGvkWkhnhmmtB3D891YE/K9MoJfMn
         r/8lENqitw4hqpCE/mwa8Sebdm53YM+7Qh7FybzpXMguyyD5JmI4oFLAIjXB1MveGPsR
         UvnA==
X-Forwarded-Encrypted: i=1; AHgh+Roh5aWiPptuWIzvmYi4uh/edPo64fJcgJbtCKiA1u7l2o5a2z/ELiYYTPRg39jPjberdMp6r4nLviYqykV1rY0=@vger.kernel.org
X-Gm-Message-State: AFuF++ljZ1OBhua1Fo6ON4Q90nGEcGxmyt5ofRGqjnc/bQU30G6n586w
	U0HWGwNfhO1pU4aEzB+wxk8SYm/UvJjeL0aRqnycSs4h+p64phdWOZoLtJ0oty2e2+YOfB75lL/
	pecsflEM9sfhbOzwBU0m725k4yUTMLA8CKCampmtR
X-Gm-Gg: AR+sD12EvB5PProtDJXf0Yju+Kp3FFuvYQgtwHroZTj2ZShXPg0dGt/vIxoet0GSmxr
	8kfGXh0nJ/MOpYPnBbWNao9IyfBQMDDIQL7MH7tj2DpqrEKsNemCMEGVzqNgnMfNAREn207wuI8
	v7fhMd11xegHRPAoEi6nWsSuol8w+1GQCK2Olm3IDZo1bhk+6von9K5JFmBCBqKntArOkTrZYQK
	o/IjvhA+p6w5Lv10JwFZjyUtRgPyJw1XjLr32dyP9s0sQpj9af7ktfUYOMoaykYoqhPfgGd1CTX
	/1IHnDxe9m6cZ7al+YMm3CY/mBqygjcq7xKJF/9IYGnmXX3ax6DfqhZrhW5lkQHyXCZh/y+nH74
	Zm/OhGwrq5cEGvDyPAcPyycA8dJHKE48=
X-Received: by 2002:ac8:5a8f:0:b0:51c:1eef:4fb6 with SMTP id
 d75a77b69052e-52df572d04fmr316920051cf.10.1787650359267; Tue, 25 Aug 2026
 02:32:39 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Aug 2026 02:32:38 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Aug 2026 02:32:38 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <aohEz_1JFVDtlSnE@google.com>
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com>
 <20260807-gmem-inplace-conversion-v10-40-2fc18ee6d3ba@google.com>
 <fe1c6359-7371-4ccd-9807-1d81c160d12b@intel.com> <aohEz_1JFVDtlSnE@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 25 Aug 2026 02:32:38 -0700
X-Gm-Features: AcwNN1WsNauanv_gwVuUewgYIPtJyz0xA7nijfgKendDL3I7JaxAnreMY2X_gzc
Message-ID: <CAEvNRgF8XE2Xsn-g3qzPxcdfLdvJEc1FZw9LQ+deeXsFpdZsOg@mail.gmail.com>
Subject: Re: [PATCH v10 40/41] KVM: selftests: Update private_mem_conversions_test
 to mmap() guest_memfd
To: Sean Christopherson <seanjc@google.com>, Xiaoyao Li <xiaoyao.li@intel.com>
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
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

> On Fri, Aug 21, 2026, Xiaoyao Li wrote:
>> On 8/8/2026 5:53 AM, Ackerley Tng via B4 Relay wrote:
>> > From: Ackerley Tng<ackerleytng@google.com>
>> >
>> > Update the private memory conversions selftest to also test conversions
>> > that are done "in-place" via per-guest_memfd memory attributes. In-place
>> > conversions require the host to be able to mmap() the guest_memfd so that
>> > the host and guest can share the same backing physical memory.
>> >
>> > This includes several updates, that are conditioned on the system
>> > supporting per-guest_memfd attributes (kvm_has_gmem_attributes):
>> >
>> > 1. Set up guest_memfd requesting MMAP and INIT_SHARED.
>>
>> If I understand correctly, even with in-place gmem, the model that shared
>> memory comes from the userspace_addr and private memory comes from gmem can
>> still work without passing GUEST_MEMFD_FLAG_MMAP flag.
>>
>> Since this model is not prohibited by KVM. I think we should keep the
>> testcase for this model to ensure test coverage?
>
> +1.  Deprecated doesn't mean unsupported.

The original test case was for non-in-place conversion, which wasn't
removed, it still passes.

Is the ask to also test, under kvm_has_gmem_attributes aka
gmem_in_place_conversion, to have guest_memfd used as purely for private
memory and have shared memory taken from somewhere else completely?

I can rephrase the changelog and change the code to clarify that this
patch is meant to specifically test in-place conversion with MMAP, the
intended usage of in-place conversions.

The ask to test gmem for private and something else for shared seems
like a different test that can be added separately, perhaps in a
follow-up series?
