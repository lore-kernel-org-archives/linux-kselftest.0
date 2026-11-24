Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795555027;
	b=sQsI89cUEWiK/xKSUxpDKiRrn/VW5whEsaZx5CkDwh+AJ5JU6myv/sbnK/uAmtkhiixm
	 3wCat6g8kpSGOmWa6F7IqiCPxn2bcD9+iZoalq6og8wtMCTRvszKy6COzwptEagsVVTVj
	 Eq6XjO9Oxg4I+pFPs2OHTJXminUgSDLUID7n6kPSW+QhnFOljeQedCAEXF+Y9iaTnYX9+
	 /HLXvQCzhsQO804hZi4juQ8uW5VGYlX8ySDPjqtAQVyMLEpMFM9LxoCGNZ2TlW6ozJrbz
	 YjwGgHtKpW17AMF4PKr3h2lYNYaccjBhHvdtImfGR26iZlGFpvrMz/+jrWwVBgkKdtg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=woptNqYegtlAA/3EhXiqmTlLN2r1UfDWEk1Rf7o05To=;
	b=QHdJiInjW3/kvDFcOd78npIqmEf6VJJe3ko71MNNFIdcJ59SeK76Bs2KujCkJmu+eH02
	 +YK0PbO7lELPR+qZjJoNybLmaIx5EdUA0c4RT42wFX48ujm+PdxfFdF2jdyL4JnT8H/SA
	 mx1AzGcXFjNSGDr37+v9OupCiU6ezFGNQIS7uCg0cO6rs4jcu6Kiw1oPpI9qPXroSAZZe
	 FLplhQOnvQl4KEXyZuXvmVmBrvtp3PNapEOwe6btT/OGm5CpMkV6NUrfHU8M5rK+oKZao
	 d15ceIh6Nu6x/un5GlD+uQJpMtGLLKbQNfp7JzTEimfYgCxTEDKe6Z2JfjjJPyy6ddQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TQhgSyDV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CD5606A6BB
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 21:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41CD5606A6BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TQhgSyDV
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb6860f867so198175e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 13:16:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795555018; cv=none;
        d=google.com; s=arc-20260327;
        b=p/HHU3Xf7gGga/MD+7w22bJSJmxW7N2n+D5Ko+d1GhZKNDIPhAsK0nVZyaof8pjZyw
         UoX9SSdDkmfjJLmWCzioZe8bIc9NjSAQSqZjGaZpbeOQHfaIgWSYhKJWzND9zEOarVCM
         fARASChm6NZ2utiCwXn8ECGiJhVg2hnzr7QaiU5l/I8WwsAOMZb5uy+9rha27oZ4OldD
         HZwwubRRO/BG7OmJ8/iiHDdKulXNbsRRqQ7mu14hR0UGn1/hAZ3AcEUzDkuUBdnnvnM/
         vYboAnVd0eyjZmjcK2KwWCXeY2hbCx0EFF+vabX4Wz1BhFNcsdSU1ppPAaDfIVbQEr2L
         DQTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=woptNqYegtlAA/3EhXiqmTlLN2r1UfDWEk1Rf7o05To=;
        fh=/6jHNysX6EMnrjtV7aVkOSQKKqKL49SUVAYAkSnbDXY=;
        b=BOToQfpzbXBbeZQnYmW8LB1cB9Q7GOvM480V6ujRV2MGqJH5ZDj5AmbhQi4aRhRHMJ
         cfHedwl7BBBLClZJxkVm9IiD2ZzzPWmqLfVToqy8sWO2ejDv9ecLyTJYAWiphxk91z9z
         0cd8nj3OqdX03WwfqWp5fJ6KcCkub4DY5lPPyBMT+iCxRbbXrUvRSVpNUWq+w+uLd2Zj
         IchLMTWcawwuEzzYndC9+3X3UvcQKomWkO6jIZ1NhbB1IbW1kEdmY2m9R20IB9Sxk9P6
         pubGHJML0KYz7MZcdTBy8+HOcpFAK0DIYxg3oM1RM8PhuZCmUOUk+L93ps8twRX1+fRs
         1D+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795555018; x=1796159818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=woptNqYegtlAA/3EhXiqmTlLN2r1UfDWEk1Rf7o05To=;
        b=TQhgSyDV+NfG6glfQUDCTMoOuZ6OKtX78DSuH8Rhnr+CLtw9RqtV9Y4NlPJJFv/Cre
         xg+idm3UnqnDfuBfL2E9gKZVZRS7ngeDNTgRLr/NnXLO2kzm+ubYPILPDhvrCFW6D/yV
         03wfVw0ngiXojP7CgIP/4Wa9M2Nrtq8jE3pZeuTBxQAhhYRmcrwiOzNnUltyq1O5q858
         9UO0M2++a4542fkXe5QVPGHIyhBubRCxxR3WxG+tovHFoaiccBtPTEwc0btZUUvrSMXn
         t0oMUenXda2R8UubtyEN0X14pPzD+zEKtCSU4AihkXNA52n4N2zbXws7bqEJfbhuiXi9
         NDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555018; x=1796159818;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=woptNqYegtlAA/3EhXiqmTlLN2r1UfDWEk1Rf7o05To=;
        b=bvyITqzwXWff+bC4LAlFV3Rt9r+WH6YkqHSEYMTYzN4f1xteTMG1+Rss8vuAXBFVZK
         O+0hjAzC8ojnBAPwDa44zfgkzXGtJ0jEwcBqLmBIeDtfU+sa5Edzh91et0iYCJ2ytvvo
         bktBIeCcIMI+Q3Jgxweg8NJlJ8hDmQkTro/bfDE+oaGYNHw4wWKypCBMDelPmUM0rRQX
         uQ56zGKBj3Ol3TQxJbZweXcDRPwL2+I1oKzTvL3sTk2pfi4JEl9HaXxxNK7+Kk8sXvr+
         Fb8hqdv9G4j5LdXaYqrhMFqm7q0gV9tkSbcdu2erBmUadCSOE39etejk5dUOromNk5u6
         ndeQ==
X-Forwarded-Encrypted: i=1; AL+hErFHFbuASvkdPET5PEQ0/sG4iYCnWlE+ccgAXJ/DvPUQ7+lqTLSdvic1R8nUUy6QqW94k5v8+4Qvz2F/CgWvElQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qK83Whqm1Lw33f1wCsstIKCqU+kmCU71NBPzsEAHYY3P8UdEQ
	yUPCuaW9XqlWKAGRv9+PDA0Rft892xKS+26jyRJtbO5BfR1VCi9q8ki2rvRrUC2LRN0w+qqPjbS
	7mVW3GaGEr3qI20ouQCzW5Yw9ZiMgzEsL1Brsu/Zj
X-Gm-Gg: AZFdTZd4GqT0cLzFXTASl2w5DPS5bogVmOZbwZHwByjZOMZ3OCL9O9sqo4K1s+2LIIF
	r/LVqhZ8CuntrYoO0rYswH0WeXPjuy0xc+BpPUhOWyBAVAGMtqaFHIdhVvmkFOleBELzXASTDim
	cpaxT9hwbsToNg5g0Q6OkqoTadkPNoKcFnkHoVYfuSGOFPhMTGgfsAW1wWsS1/I/djSGwEF+nz5
	sufEbZnrzO26Jt0L1i1eu8NuzQ0C/dzdCMHeiBecxCF7HOhiFnQZZkIdM7B0OVoupHHPCJMWbt/
	6/Z/7O+P7fqH49Etg6HAYOsyf2TBDz24hwRCrSnfytIAKUbxRpHFe6fBknspjWEU/8mLNiazjVP
	RrDLX3XjCDm4fdfNLniwdtCyQwMpkrPYr/xJ9qMCmQzsNGiO66h0gRyrNHeVOqgP+L/+vj7nEG2
	fz0EWMAbNzGoQiVREanGkl5Q==
X-Received: by 2002:a05:600c:4f0d:b0:4a1:a48c:17eb with SMTP id
 5b1f17b1804b1-4bb916369c4mr5002655e9.11.1795555017146; Tue, 24 Nov 2026
 13:16:57 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-feat-udmabuf-huge-pfnmap-v2-0-3254f801fc36@linux.dev> <20261123-feat-udmabuf-huge-pfnmap-v2-1-3254f801fc36@linux.dev>
In-Reply-To: <20261123-feat-udmabuf-huge-pfnmap-v2-1-3254f801fc36@linux.dev>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 24 Nov 2026 13:16:45 -0800
X-Gm-Features: Aa3M54o_hbLVSlOG7JsmOAd1qF2KuaOISZwlNoGrfoGShDk7KQSGd0nh9FrptyA
Message-ID: <CABdmKX3_4=HiNZnurUAHcrY5hkFLPrLer-q6cV76FvmJkikmYw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dma-buf: align large mappings to PMD boundaries
To: Qiliang Yuan <qiliang.yuan@linux.dev>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Philipp Stanner <phasta@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Philip Yang <Philip.Yang@amd.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Natalie Vock <nat@pixelcluster.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 6:45=E2=80=AFPM Qiliang Yuan <qiliang.yuan@linux.de=
v> wrote:
>
> A dma-buf exporter whose buffer is backed by physically contiguous memory
> can map it with PMDs from a ->huge_fault() handler, which only works wher=
e
> the user address and the buffer offset are aligned alike to PMD_SIZE.
>
> dma_buf_fops has no ->get_unmapped_area(), so mmap() places a dma-buf at
> whatever page aligned address the default allocator returns. A 4 GiB
> udmabuf, for one, lands 616 KiB past a 2 MiB boundary, and then none of
> its PMD-sized ranges can be mapped with a PMD.
>
> Use thp_get_unmapped_area(), as filesystems that support huge mappings
> do. It aligns a mapping that covers at least one whole PMD to the buffer
> offset and leaves smaller mappings where they would be placed anyway.
>
> Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
