Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B55596504
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 17:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889339; cv=pass; b=jG5JqySx8mn8Jhm2VA6pZ8NpwGX7oGZFP4j71+FpvQf60Ee0G/1nyBlcgUNgs08jZEpWQmlzKgzsAfGOb8jgpBMGotAMozebH1GaknyLqbajrAaaGlP2T5E8+nynFX6kLkNRCSHJ4Sm8end0f8TF6ci56Rjs8a485m8eW4z4k1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889339; c=relaxed/simple;
	bh=ZU4SkGLCQl6PTS0EDxlLzNT+Jubeap1l3JebEpwsgdo=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PNcXnWl/6xLzj1xWXgNxDnXRZ/uWXJpWR3qGvlajtc2qfgI9Jn31bxuo5cKB7/+S9zqHopw8dMrKw2ZdfmJt4lyHbyrI7UopLwQfCbgOT4Ui7v5wZCFwovKGmqYOTZT5q8qen1Jb1D6AGWc6oRfglIImtzs40kymFloMG46SQSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qn5yhEXb; arc=pass smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qn5yhEXb"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91053c27a91so23992996d6.2
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 10:42:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788889337; cv=none;
        d=google.com; s=arc-20260327;
        b=cg2iI1E9Hcj0UsMlYuua1Ukblre1GHBDUcACicKlKOb8lX1ie51KdpFi+56wJJ6BMi
         +/KtW/vWkky/Ii/KZGsz/mgfL6cLnZRgEfOiC0mTDda+gcIXVAPv3XaOzrVfZxx9NkF4
         K+OkY30V62rRPcoj6lIiXiwXSnjpQWiycoCQzrv1pASmqWqwiA932mrC1kPZbOBuo1O4
         wOXianvesPkKTXOA+7d1pyP8OuSzcMdrOXRH8tqAMAkciE07j3jEvcvEq72E+GqBeWLh
         GO3pfzO+oL0jzwmcny0HQAS/zR7KDxs58gnGBvT5X6MChF9zddh6rRuyCWdb3EKIEnrB
         xELg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=mSaZkUcDg9GHS/pD+YIma0jnXw7Vpr67nOJsqfVHzcQ=;
        fh=L6e25JT20M4eR6vVkAAhLPCzMsb4sNWf5rgV0gS/ymw=;
        b=AXJexBzwqjF/nDFUWUbwTCKqxW0t+8HdOCLbA1Ayc5oTdpk9LXiZDDdjH6Q4rmqHdo
         +HA/oxgSGRqxP6AoBTDUZOI7Yo9hYCtCBpynoHzo8JVOrD5KlBw765QaFVvlAt6+OPFR
         +vl3NkMmHIlz+jLgEH4nEPT0Fv3nJRoYNjH5mEI7zo0pIamHADpORdKlbu3/En++5XIq
         Zgb3JMwdH0o2NYe91mip1eAzEtmGLBPqFhiO44knyhkPe36I5wgFpJh751iA0mFygQRN
         f+mGjKbzxpT3YFM8wGasKo0hT+w0wDy6bqIETMkFR8gNS7RlG33vqN16M8x06gLTc6oh
         0iOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788889337; x=1789494137; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSaZkUcDg9GHS/pD+YIma0jnXw7Vpr67nOJsqfVHzcQ=;
        b=Qn5yhEXbLgsXKPNXBLdTx94KGIExW2iJH59qp155SJh599UmNCkqcs3EVoGXjqSJCQ
         lkoI1zuA/uv+e3bX6PDl3tjgbiTUIZA04KJvRYg9HuISsmERZ7geQRsZYRtjbAL6fvVE
         twyc4ELLmwPiUZ1m3I0ZNJOUA1k/3R3GeR125UTIoGDPe66Pl8M8EILsJJ4uf3N91u19
         Ua76u0poSsGkQX8339myWf/xD465Mupbzf1Gxrs+aQFx4YL9iiNtRtbnoWLhZarfM3uW
         lAVS+a+euzX45GpgGMv68Y+Z/4hM/4uOrSdrFfo4PIQdGU9UBh19tlMqKtbrgBi4PLWK
         pkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889337; x=1789494137;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mSaZkUcDg9GHS/pD+YIma0jnXw7Vpr67nOJsqfVHzcQ=;
        b=hK2YmGLiKXBMj27uh1pPY0JU53XGiIWPHP6KsvZYOSapoiLVJP6X57vDhiKMPZAMf9
         0Yik8mN2j70Ad4qrnGzL/r+aTOFN3Xj52AHCveSnEj2dMzQH5LfyGNhY4iVAq8pWuTVb
         /zsXugxslxErS/g7O4JYryEVTA8PNWB2jrL1ErozZX9ai7gyPXQEqMgSBf2xY4yIwwPE
         tmuAMxfaKNE4R6nIpGhsK9xTLx2NZ2JlA2PrSPLVCuDTRip3ks7LHY1S13VhjVmCMVL8
         662HFvBLEJubc3R2sdT9HrE/QNqmlvssTE4WFIapGEqjd5v0NLJxo7EQnEmjY9hF5qYn
         AceA==
X-Forwarded-Encrypted: i=1; AKwUvBxsH8UKhZB4iLMcdK/l25t5M7NMqEhjtEgnisbEHPldV8V+aJi8MyCuWVyDpI2i16ghOnkgaNai+EnDExsQRMQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nLORd/ze79MJ0MT+cJSXqWF0wGbxnITN3YwzB52uxudUlT8Cgr
	ZrPtQ5aNEurfJgoN9WOy621dvTG4ICezygNdYQ9+ogLaF0vpcJaJ++l+/78kHWMbA7l04c6xjhA
	OE41oWokiF9AqpYZy8+3p0PlSR3yvwL9nJWpcgYPV
X-Gm-Gg: AYBFou3fD0omAq0KVVdgBtixSq7OK64cITVAcXN6mmeEmSMviMYu1p4l/cGHSv3LhO+
	vV1MTFGVeDuTH3flEfs3TrKcrM9bx6Uz/zeBT7GzJD3LIidXeBFBi2R/ZLd3xRJkrdRMlCsC+sX
	L4v7XI0YV5Wc59gyc/SDtJ6IXLMHIbg3tz/yHmhoe+TY+Vo+U0T+MXDoiWCo6kfPwF8om4AT/kT
	rqVpEbN+xLT1u+c8VLC5Rou1e9JRybLf9Aml4YZNXwVy6d2zkf6BEjMERuE4afRwbOFrKBMpDuz
	cLPLkEtbTjmCSA8d5Xb30dapL69IKGM/0ZRCzMNj+LB0kpakbTS0mQsPCgqPVsVHv5fG+TZ36iW
	L9TxWUjaTcRP6A1Jdw6VJRls6byrlKxVDFi8OMDuLXw==
X-Received: by 2002:a05:6214:5543:b0:90c:e762:1f86 with SMTP id
 6a1803df08f44-9103f0d3e3emr182149366d6.30.1788889335692; Tue, 08 Sep 2026
 10:42:15 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 10:42:14 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 10:42:14 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <7327b274ef823e89cf664b33d94d9c2ba99c4ca5.camel@intel.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
 <20260722-tdx-selftests-v14-2-15ad654a50db@google.com> <7327b274ef823e89cf664b33d94d9c2ba99c4ca5.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 8 Sep 2026 10:42:14 -0700
X-Gm-Features: AcwNN1WIzdwbZuZ6_C1HEL-Qh1G_nx7IFRuMDHksUPDPxufQ1MQ22MWJYpWBBLQ
Message-ID: <CAEvNRgG0v9DKgjwcswtprEwoRC0Y4w3VTYszDnJkbknWR3rvCg@mail.gmail.com>
Subject: Re: [PATCH v14 02/22] KVM: selftests: Update kvm_init_vm_address_properties()
 for TDX
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, "Aktas, Erdem" <erdemaktas@google.com>, 
	"Li, Xiaoyao" <xiaoyao.li@intel.com>, "shuah@kernel.org" <shuah@kernel.org>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "afranji@google.com" <afranji@google.com>, 
	"kas@kernel.org" <kas@kernel.org>, "binbin.wu@linux.intel.com" <binbin.wu@linux.intel.com>, 
	"ira.weiny@intel.com" <ira.weiny@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"Chatre, Reinette" <reinette.chatre@intel.com>, 
	"isaku.yamahata@intel.com" <isaku.yamahata@intel.com>, "seanjc@google.com" <seanjc@google.com>, 
	"pratikrajesh.sampat@amd.com" <pratikrajesh.sampat@amd.com>, "oupton@kernel.org" <oupton@kernel.org>, 
	"wyihan@google.com" <wyihan@google.com>, "sagis@google.com" <sagis@google.com>, "Gao, Chao" <chao.gao@intel.com>, 
	"Wang, Roger" <runanwang@google.com>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, 
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>, "Qiang, Chenyi" <chenyi.qiang@intel.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "jmcrey@google.com" <jmcrey@google.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Hunter, Adrian" <adrian.hunter@intel.com>, 
	"x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"

"Edgecombe, Rick P" <rick.p.edgecombe@intel.com> writes:

> On Wed, 2026-07-22 at 23:13 +0000, Lisa Wang wrote:
>> From: Isaku Yamahata <isaku.yamahata@intel.com>
>>
>> Initialize the TDX S-bit and the GPA tag mask in
>> kvm_init_vm_address_properties() for TDX VMs, similar to how the C-bit
>> is initialized for SEV VMs.
>>
>> The TDX S-bit is used to distinguish between shared and private guest
>> physical addresses. Its position is determined by the guest physical
>> address width, which is either 48 or 52 bits for current TDX
>> implementations.
>
> Since S-bit=1 means shared and C-bit=1 means private, we can't have a single
> bit. I'd justify why a second field is needed.

The s_bit field was introduced prior to this patch series, so I think
the patch introducing the s_bit field should have justified the addition
of this second field.

Did you mean that we should add something related to "Since S-bit=1
means shared and C-bit=1 means private, we can't have a single bit." in
the commit message to reiterate/as a refresher?

> For "untagging" GPAs we could
> have a single field, but there are other usages?
>

I think this part in __virt_pg_map() requires separate fields, are you
requesting to only retain one of the c_bit/s_bit vs gpa_tag_mask?

	if (vm_is_gpa_protected(vm, gpa))
		*pte |= PTE_C_BIT_MASK(mmu);
	else
		*pte |= PTE_S_BIT_MASK(mmu);

I think if there's any unification/simplification required among these
fields, perhaps that can be left to another series.

>>
>> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
>> Co-developed-by: Adrian Hunter <adrian.hunter@intel.com>
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
>> Co-developed-by: Sagi Shahar <sagis@google.com>
>> Signed-off-by: Sagi Shahar <sagis@google.com>
>> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
>> Signed-off-by: Lisa Wang <wyihan@google.com>
>> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
>> ---
> Nit: these are not ordered correctly. I think KVM prefers the order in:
> Documentation/process/maintainer-tip.rst
>
> But I think at least the RBs can be grouped together. Also... can't really point
> fingers here, but that is a fair amount of of patch history.

I was also involved in some earlier revision of this series, tracing
this history is not trivial...

For this series, given the long history and many handoffs, shall we help
Lisa out by explicitly requesting to be credited on specific patches?
Emailing either Lisa/Ackerley privately or on-list is fine :)
