Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C855A513D
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 19:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894380; cv=pass; b=DFo4nUFAtfgJq7w1Eab3lrNRg96wi/ZlhcmmP4EAi9Y1BA1PjKu4VQWDkFWoECd4N/s/U7En+Hv7dvpz2cO3WPm+kC3y3OnTBRJb0iPhqwIDBafEh48dmPfjBZu989wIfylrvv+MNmUrztPzJb7xq2+yR7CQwHyQ3vjo47XH/Cc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894380; c=relaxed/simple;
	bh=JxAv9A35o8tRcwxKjZO94SBS9xDo9RgjGVk4mfstMJQ=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oRn/zx4mMXSNWNZN3Sw0IIAxal/LBmVp1Piwu5QQ7t1QUygQqAm/8PgCbH2L2eukMMFTbLCHPdgSSYATB2TlplTZJ5qPqFgQt5sTwCAxDytuSOQo/skyOwhZOE2lGxJxb/9J31D+DjYflmaQDfTaGQex2PkZcxnEHSTrK+sDg74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e4qvq774; arc=pass smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e4qvq774"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-81ecf499af9so68415407b3.1
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 12:06:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788894377; cv=none;
        d=google.com; s=arc-20260327;
        b=Ttks+gc6mE3iW0PuGezFk5m5oVpaGQK4bpPPTBZpZfW/yi2fqLuA17bg/Da/j5hAXo
         iNjULJz9dTPyAamTToMET/QDaaKXFWgSxBVp8QkRk5o9sbytK9K5H61SVQurPFI2eWvL
         tmwIK4FU6OqVyejb3IfklBnuwX9rDCWcQ76VFOtfKpNeuJ3u4Nt+pGpMIyCI/fRyx3IV
         PY7i9ttJASy4D9yl8n5ld7WGHWl1nj2HVRELxxXA0ApaqWrnZswb0Ce/D7+UewOHs1QX
         zC/hAmtlZdbYaAqa69TIX5+ovh/XNZTvhANNTzck/L9EaXbaVvcRHnWpjmMwpAWDEjEw
         42LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=hhSMn73HXnZUeqqhpj5wjt1oII0fZ8bLb8+fuULddR0=;
        fh=kdLLQbRCa7bNoc/ZqCN2LJiWOu10VVx6huXxosA/iNU=;
        b=fjNXyrhdZ80Gj1vMU8WlKpsXyAhFvGJ75VIE1BReDhHsKYtn27XQgvs9kgxfmVONcj
         xny5GJ4Nm/A2KiqE4HDevq1t7jtiRCh4J0G1aEWKlGbYW+hQ4OgVQgg9gNF5pmnd/DIo
         Rde8pKZXHb14lagUhHmYct55JtGpyz2K0kw/kVEebGeZ+SXD7fmWdregCGZ/+X488muZ
         IEIyquBxSK2Gzmv2dahZuwlPP8/KdLqluFEe4pxqH19gxQxhRFJgJ9j2v98At1vCwE7Y
         kcRBJdFWJxHXfTSAbm8+xIA4XK1g3i41345/CvP+YV3vzp37X2HQjrM6sZZXwqzWbqH7
         wvmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788894377; x=1789499177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hhSMn73HXnZUeqqhpj5wjt1oII0fZ8bLb8+fuULddR0=;
        b=e4qvq774uU0mFfiqzPN+KUqIGJPp12ehtwR9uSJloZLv+bEDVZ7+ivxzvuqyplXITr
         0RjCirEpWyrqaN++MfF93TFMsF2Kepg3EvwfiXnQh+LvE521KCVam1nZz8ui6i6JrP2d
         N1tqYKhCdydNsI4bvQrTzKPlPWrQWJ1EXFpmUmCx2PFKgXkQwh2pgKj784y11Gqgc/OC
         ezydK/fsqhwYEwnNuD6y5lSlMcTvotWGnbGh9pjE/VH5HOjQIH/LT2bpXxXR5Hs1r1iz
         FNQ69TkBapOw89bcXvt+LTobPIBNzzgR0+v3ZgEELhbnObUn6nl+bR13xemkvq+sfDTT
         m+vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788894377; x=1789499177;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hhSMn73HXnZUeqqhpj5wjt1oII0fZ8bLb8+fuULddR0=;
        b=O4gylWpTEVzZ0DCdiMheIFCdM+jqHtUs1QwVGq+GMkvcixMOMhmV56JAoOhWm3p2mD
         7e0Zb8hItlmAjB75zk3LrTGGBubwIpEMy1d3ioJTmrEdXBq+Ss6/SJoZIxHmN86qRXav
         gtXhATmxuLtKdUOPAC2eBRRqGHx3YDIsq0hu3eq4p+IMIPgKaPmlZxMQxzpOUmVCQg98
         S8b0B9VEbVf5g8qmxxAiqoq/GFiuaZHPpUzatac6ktppf92mysxWC+LXNxYEUQLU8nPZ
         /V9tbTUpeI1B+CAD5aJWJx+qHpQigCZ5B6enipVFon85lSGJgYcYLsfhamE1IJEHkuOh
         r07Q==
X-Forwarded-Encrypted: i=1; AKwUvBwt88sxsg1iYvRuVdj662c+7l542wHMS44NXPdyhHwJNf0QCIpSO9/66HgBn+jLl/d1SWw+XnNC0abSBXLkNMs=@vger.kernel.org
X-Gm-Message-State: AFuF++mscKx1xgU189OGrIoYNInjDVd7E97cHNWqYF+D82+bCVbaGsOB
	7fUhMEaJHFTd/X/dpx7Z33yiIIup0Q/vM0YU1DZjHjZjgl3d00WeO7Kth5E8OVZkr3b7HpcURVg
	XFBPMsSInKu8x1zkqjO1I5DJBvvQnsRr12GhSS8qP
X-Gm-Gg: AYBFou3NfcapgBetrd16IgG5bFpXxM8EML4DlXs8mdIp2pLw2CCYRXQdyL76mk+Bpt4
	ngtg9I/Y4Mi8IG+idZyyVI5/DS0aDD3HBnBhc1TF9YEnWnLajtBkgz4GnK56nW2Fq2sjZ3jafjM
	J9xvrP70ap+46A1DnbFASKH14H8w96dDi/fbvlaNpCIWWXCbbKd1ZcRwuFJqFyzXcvoNz6SSLjp
	OGPuihf+boWrkhaGjUkZrv2Gpcbqyx5OJVO1fetUEyEJcIbT4xkeLpt1CY0PZPwwU3N2UstvyFj
	JTjR/rqklpfB0TS8SIW0jA7LfrYe5akfOYkUbc/8WWuQawI5C0gCZBb/cp4QhLh9FX9tnRV5UwX
	pJYnnOSPCUDgGKbxiIdIAjIRlUfsZEeMqmI7xJr/hpA==
X-Received: by 2002:a05:690e:4143:b0:668:42d:95e5 with SMTP id
 956f58d0204a3-66fb58f1410mr10675130d50.4.1788894372039; Tue, 08 Sep 2026
 12:06:12 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 12:06:11 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Sep 2026 12:06:11 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ae783977c1eaa34d2910f76dac1437c7aad47d93.camel@intel.com>
References: <20260722-tdx-selftests-v14-0-15ad654a50db@google.com>
 <20260722-tdx-selftests-v14-4-15ad654a50db@google.com> <ae783977c1eaa34d2910f76dac1437c7aad47d93.camel@intel.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 8 Sep 2026 12:06:11 -0700
X-Gm-Features: AcwNN1XsGt_fUaARpEZcGvQCOF1lLG5Qg2IcdgK2WB2r0fv2QH8UPnIsl3MEqiA
Message-ID: <CAEvNRgHB9Vhwe4kOGYUn3piw3dw8zqSgVQX2VonoWCYPw-TaWA@mail.gmail.com>
Subject: Re: [PATCH v14 04/22] KVM: selftests: TDX: Use KVM_TDX_CAPABILITIES
 to validate TDs' attribute configuration
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
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

"Edgecombe, Rick P" <rick.p.edgecombe@intel.com> writes:

> On Wed, 2026-07-22 at 23:13 +0000, Lisa Wang wrote:
>> +static void tdx_check_attributes(struct kvm_vm *vm, u64 attributes)
>> +{
>> +	struct kvm_tdx_capabilities *tdx_cap;
>> +
>> +	tdx_cap =3D tdx_read_capabilities(vm);
>> +
>> +	/* Make sure all the attributes are reported as supported */
>> +	TEST_ASSERT_EQ(attributes & tdx_cap->supported_attrs, attributes);
>
> I think this patch actually does nothing because attributes is passed in =
as 0?
> So 0 & supported =3D=3D 0. It does exercise KVM_TDX_CAPABILITIES as claim=
ed, but so
> does tdx_filter_cpuid(). So for a minimal support, we could probably drop=
 this
> patch.
>

For more context, Isaku suggested this in [1], but after all the changes
tdx_read_capabilities() is already used in the tdx_init_vm() so I think
we're good to drop this patch.

[1] https://lore.kernel.org/all/20220901012853.GF2711697@ls.amr.corp.intel.=
com/
>> +}
>> +
>> =C2=A0void tdx_init_vm(struct kvm_vm *vm, u64 attributes)
>> =C2=A0{
>> =C2=A0	struct kvm_tdx_init_vm *init_vm;
>> @@ -112,6 +122,8 @@ void tdx_init_vm(struct kvm_vm *vm, u64 attributes)
>> =C2=A0	memcpy(&init_vm->cpuid, cpuid, kvm_cpuid2_size(cpuid->nent));
>> =C2=A0	free(cpuid);
>>
>> +	tdx_check_attributes(vm, attributes);
>> +
>> =C2=A0	init_vm->attributes =3D attributes;
>>
>> =C2=A0	tdx_vm_ioctl(vm, KVM_TDX_INIT_VM, 0, init_vm);
