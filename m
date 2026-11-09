Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794253214;
	b=Qpa/vupbalQf3YKOlw121GyGoLqbMM18mWurhvtKQvJWcMh9qD1d4vCW3Lu2xiu3rNyJ
	 V1kVVIrTVRvctRle8OL/QNvufNc7Q7/vu1zB9EMVdwbj1drL668lqagy/oJjvF6whXMZN
	 ynfOM4FkUfGpYxY+gCMzNbpa+uWdWXO+hS4mQKvi/tzgmp6/f86UZgAm5I2Fqr2JM+/u3
	 gAJDezu0GsUgC5KXvdEmV1WSBd3Mb7fTGap/fWQrR4ZXzE/nvQVheHRFmcrAlZkiuxdzf
	 u2fWDETtVEo3vqTUJ/0QybLwP2L2G0wi+nNWgJfC44oOOugdUoxobOsIgeCU7e0YWuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=UTqecpq4mCjlHgsqGbaWqa8tI9zFEKPt/FYnQB8tTfI=;
	b=zMZ9M44AkJqHfR3f0l5lKl3Xti5fytIeytiI0bq6KUA91QAEJlQ8u7aCGJwAurW5ibC7
	 SKEN8mUaNcKBiRQKloRdOnqRzfuD2siYrQspYSm96b7tnJCv8LCn+MPd50l8YpMQXhJ+l
	 jk1HMT3G2+DJCr6dVixmPOIBVnAjlMegsHk/JhtJll9BsQbIV5pCRpZIWkoxk1Xvj0Bjs
	 dHx0FeJEHdcdfH40JC/qqzAr5owBu3+iR01vB2cKgJn3tgZG3QwPgTl0HEtk8kfQk3JvE
	 VS/O7Zbr4fP39MkRZIG4VOU/gLOLd9SnepBhxW+JdrVckmKJsivjkdRY/mkdaNwCS7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OZgOtFqT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24C4606A33A
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Nov 2026 19:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E24C4606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OZgOtFqT
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91e9309f171so11284486d6.2
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 11:40:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794253213; cv=none;
        d=google.com; s=arc-20260327;
        b=UbobpKHat5zHORh9BZgKj8jseNBvt19FWe1ngEd7ZUYA1bT3Gl7bVEnX2EtrxgASM+
         Z4YFSfXtcAiR0lLkdPj4biF36mIjqKOi9XwA+zMADBNMXh5nmhD8SsmSA2IreJ6+wdbw
         Mm7mnDy3CYwOoNCHjyprYvA9JHS2eJdlO68BxTtgqUNKCdIiZRL8rsMwwY5JhWooVom8
         LjlvrmozNbh2Jls8EOXNbRj+UmoRptk0ztmaR48/++RX523CU2r24iDGgdhXFslmrwcH
         PlWW+rVulXhR5L6449V4d2aimCYdW3cWe2RMgBUTUChFmj4j0pLbeKK5KggEFpySXBZT
         Aysw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=UTqecpq4mCjlHgsqGbaWqa8tI9zFEKPt/FYnQB8tTfI=;
        fh=fg2v//onZomsVDw/Np1IRrxgYdlJ35w8GBZDJWOLqZQ=;
        b=V5/jNDoFkBaSso86Oz8TOPmz2Hbu64sWRNXplhzZ7iKyN9W6r7LjTCjnRiymuVeqm1
         e25vS4mhsFP0MSu8tlv8l3VtOUybRLmP4bYXi3071JZxCfNy6hT3n9CPSOoe1z5zu/Ic
         7TFu+GiNXenyAIzY16HvEXOFvnu2v726raRzgrsmMPUyPcvXlqT1Dk2SqbO/N/zF6qRQ
         cNuThMx52uRFVVQWhJNKjND+702KqWY6OLeGgwgqp2lismceKerICGMKai2YXPnc9+04
         emSQ9b7u8mFG7Lo483Esw5zABadtTH+Z5Wi4XjC//1+MhU8XxcOUgT2W4bqurV6BWs6X
         /Wkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794253213; x=1794858013; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UTqecpq4mCjlHgsqGbaWqa8tI9zFEKPt/FYnQB8tTfI=;
        b=OZgOtFqTTqmNU6HzUDZ04a/TGSA38D4fixpZoEEPnUj4KhhafT25CiiDv9VDIn0ImT
         0cDtb7mJ40WUX02kyX3M9uTJYK/hWi+KE+AQxYnEPKSELhMlAFsEfyVg982+N37Ogsil
         5TWhUdm1q0b/x4tVdvupVgshnkw9azWKDnI0XbEnPcWSTqLHILPj6otmwaGVgynJrY4F
         CZbiG5Ae6S89hHcC0i13A5tRNpDtLxLKlLrWkC7eDJLbij7XpUM7kfbtZ1eHulY008fD
         hmShvcVU9R/KWfN/IdSRoCw0oGMBP0uhvZPA1AmxzWcM0ymFk+8WSS0Le3ZigH04eTQ9
         +RWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253213; x=1794858013;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UTqecpq4mCjlHgsqGbaWqa8tI9zFEKPt/FYnQB8tTfI=;
        b=wFREZyZ9Mr80vZXBym3OpqsjLQHEnAXboqCii+Fy16EaEi8U/ciIOX107avKe1DJtb
         Fgu/MjAnnzq67KeXdeLjfVHVmRIjbjwIbbgevWRu15K29akEPQiMtoIX7W/C5Dz4PZGh
         VghfY9QhkRLtmB21wOXXjSWZC1jH0jcRIWguftFTE9ZrwH3kOlJx0UTV3kd7JWYWP66j
         TQQZlVg2LxPvhc5craEGuf78qTuPs/DQ5gRbHU11tyENLj6BkrwKpZ4BfJZHMbthqkUi
         H+d0XNxfjQmtD2RAykyQsDuTpiwbTD/kfw9+RAXR5pkK7Y9Z2LBx1ff+m+quK+Y61KE0
         eUdg==
X-Forwarded-Encrypted: i=1; AL+hErHEAB0+awXacU66aTEc+JzcBCPfvVrHcnXZOSo4+f+XHUhC6msJB/DtSZdg87RRTJMIFG30Qj6Z4rc+Y5iniRE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8a7jId8+z4CW7LJnxK5npRmhutaHO+97oykB+l5I63X+2O6D7Z
	WFCUA89OpJdl9CQfclLaotJTv3kqAkxAk7Z8HQOruKMkpbekLGyzXXvW5wGCurc1k1YbBdrT3Pa
	xyAms7+uEMV4lEXXaIncIPWKvn7BDen6KT/vBbDpe
X-Gm-Gg: AYBFou2kxFfNWyv8Mh5AyZ0dDKMvrEZ2NoZ9cpbNXoz/dHJA5CFZyTpriVl193Jd/W7
	U4tqPx9REbSUTZFk4PiuetRe8NVVfQnyMxGUAyGs5HKHGKonlWN4SlUexlTV1SV9E7PsFhYf/aF
	xOFDeic+cAlbuEq+5jUb3J4nEqSSMZexlpxXPaQ7wvcz1wm0Jhi5LKNFdTPW6gyeVgiV8G6bDTI
	U+F7MDkqa0suQUfvfR97OhyQJACXdpNkfpd9BPduUmsOR4NGcFgBotKFi9+yCBJwHqNc0vmpXX/
	ucUuYnHzaxN1a74PIywZ+4EegqdtdlD77M9vzj1sQfe94rcaQKVXE+vmpF3GPL35Rq/YdZQhbdO
	VoO6MtRpMtTSBmnn5/wV6m1Z92xYAOgnGITXMUgxeCUiBscTaYtiJ6i1lEnopxjabyOf6XRfCmp
	4vaU0XqCyTak1zHfxyX0hFR08=
X-Received: by 2002:a05:6214:1d2f:b0:91e:9437:95a6 with SMTP id
 6a1803df08f44-91eef866f62mr11481566d6.47.1794253211943; Mon, 09 Nov 2026
 11:40:11 -0800 (PST)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Nov 2026 11:40:11 -0800
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261105-tdx-selftests-v16-8-2024e8fa517a@google.com>
References: <20261105-tdx-selftests-v16-0-2024e8fa517a@google.com> <20261105-tdx-selftests-v16-8-2024e8fa517a@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 9 Nov 2026 11:40:11 -0800
X-Gm-Features: AclHuK_q6pntXPEETCsk4rrzlvTAf21VT6IGAyCXiwifcwkt004hhyyHMGQSvVw
Message-ID: <CAEvNRgGL7B_5q3N0Jc1dtSj=J+ywOXaSBDx+x9OWn5odMKN5Eg@mail.gmail.com>
Subject: Re: [PATCH v16 08/20] KVM: selftests: Expose functions to get default
 sregs values
To: Lisa Wang <wyihan@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Chao Gao <chao.gao@intel.com>, 
	Chenyi Qiang <chenyi.qiang@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Ira Weiny <iweiny@kernel.org>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Kiryl Shutsemau <kas@kernel.org>, 
	linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roger Wang <runanwang@google.com>, 
	Ryan Afranji <afranji@google.com>, Sagi Shahar <sagis@google.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Oliver Upton <oupton@kernel.org>
Cc: Jeremiah McReynolds <jmcrey@google.com>, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

> From: Sagi Shahar <sagis@google.com>
>
> TDX can't set sregs values directly using KVM_SET_SREGS. Expose the
> default values of certain sregs used by TDX VMs so they can be set
> manually.
>
> Signed-off-by: Sagi Shahar <sagis@google.com>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
> Reviewed-by: Ira Weiny <ira.weiny@intel.com>
> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

> ---
>
> [...snip...]
>
