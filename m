Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71F1358399
	for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 16:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699464; cv=none; b=IHDG6Xv+Dt/O2j8BPSuNHFqUPJ92++PnXDgNmSutF2+vtCTGjrXXgrrtPwaIkXGMTaqAm3y2cOXLwQ0JLaM7Rc2/+wakIIihmAuPRZalbmjYMIjc4+5zsOcpg6LTW6dDDrXEGcYzeefOBb1tj4pH1vioc82YOp9/mnLrwUJb8/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699464; c=relaxed/simple;
	bh=pVTGW5dlSw+FAj2NlT/PbOJGDXOB4L2ia6EM3qRYftY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a/kaNL0kPgP+3tB4lsJB4E4GqmsjuGHxAk2BI/5Gx+uFrXANaGFDUnMSnxcgZBEy2t7TbRBAJZUeAXvryctGsxp1b7FpLQiCu2ygguU6HL+4zW5Bz7gAdqi4X5YZnIGu/NgIWgau9k4cANTB5MymlWgTedxIDhKu3+E8VEmOXL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=F93ajY+1; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="F93ajY+1"
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2DFD640267
	for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 16:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1790699453;
	bh=Vn3/Z2DdvynqvHJ/P+ee00azyAyRLA5sp7pyzKMdaqg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=F93ajY+17xMPVWY0RKWQEtIOTnd/V8JSALoUkpyO6X5gwggAEmXev7MUzo0Zp10gN
	 6/QwQSKfjzrbk3+YwWiUQY8ZW7P63ktVo032pBKe72V1ybUR1HNq4WRcJHcesQmqFi
	 sPoVcuoKjn3XKw9kOdzuX11BWy+hOManHW0k0Io0nfIq+s/7YEzuzKLWJtdbKiyEWo
	 BZql7t5qdeXXmPsANUJ71+dV6HON0SrG4XpBxHblyNQ1aFlwWi++BGQHoFIFyCTftl
	 0eGJ4qpMo8u+BIFp+/U9hKkiE1bN51oxOFq9TkGZWVTeQ7TnaYpIlwEfhfdav5ct/N
	 ll64Ff2vtF5YlAUbLpYEjEhg86YubTHuDEQwLJterMdkRKDyNY8kQs5sShXFHW3u+0
	 f2U4/fbK0Lr7B5ZX00Szic/5DuV5h08/FQZnJQYgZimZklfJfTMhFZGDCa2Cqja7/A
	 Wu4ANlpa/XA2piv6q3L6juOE/s6pTH/VzraMzjcrVUML4pDq9wSPw6+u8n7s1799YD
	 NrXY5dpZHAfONxh07VqvpGE6WfUHgL3CtaB1u/jV2U2naYSNF/1bY5BUlortP9PxqL
	 imLovw0bgRnUe1AZQZNGkX4+VqavKU2Y/B3DlLGTUSmswaMCBIfjEOnGSEIVOVfLuu
	 gVlws5dW/MhQnXSsi+u2/SNQ=
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49cdc4080ddso6581415e9.1
        for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 09:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699453; x=1791304253;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vn3/Z2DdvynqvHJ/P+ee00azyAyRLA5sp7pyzKMdaqg=;
        b=VHWljZaHeF+n7MHmdRBbHxfh5WTlE1Suhozvce1D4p0G6Ik6uCKDu4BBqnO1jCZOMB
         rVfBKpRwoDliTPOLGbCu/etoTP98UZgpnLr4IeG6SN840hhiYF7mFDhBeXgz4sntlh57
         JPPYwjx2nOGo+i6C9Lye9CzpqoCNEGJmHDpyxDqUeGAhz3vACDZbCuFM6cEcawKKXva1
         n5e7BZLLf2DL79gUDN+ytaHUZUAw8wgHsrUnQDg2zyMYEgWegzpZZJu9/tQdaidKUkJF
         ezFUsuFV7BNalj2noNyFFNwi5ZKzQMFvK/X8q590XRvrJIANq8TgBwyp4tA0Si2/DwyJ
         mnFQ==
X-Forwarded-Encrypted: i=1; AKwUvByYfAuXAOGhK933qZaAbq84spOu+LUoal0itiIaCt/kpqsnePCvcl8FexsPcRj749eYJDBXoIQLJk7/ui125cg=@vger.kernel.org
X-Gm-Message-State: AFuF++kHBw3dy3xUrpWOjqsqsrGs1mCXPseok6/BX/5AdL5Z/J0DtVxX
	67a+1unhTsAax7Wh+zpZRa0ati2xXjM3Z6zKk0FzlrXFIFlr1k3PbnGSPCs0Y2R7suiJHt3FFQ3
	nc7agbzUV16RRZrgWTgFLHkzIzSXkme6v0gHYlp0Q0ic/Cs9rRt+5NxoGzkLnYrxpPm2nh8w+4A
	8SODi90yupSg==
X-Gm-Gg: AYBFou0JMgavcxrv8AEgNs9SYVUP/wk1/49Q0W3l9Iq9DEsubo6WtBeja20LqoWSGBw
	L1AJedgLMosZt8g3SdyOkWHKiQRM5k1TM9WcqdX/dtm/mt/J/4j+GibS1vUGH5ZLQDXLXs8xbs1
	517HC4hWhsmRKQKS2ylrpePYyVaPWJGc8qkvuoGp/qGlf92gPHRhkWx6rbp2MxkJ/fL0z/rG+WG
	YJrOqspPfMsaDPSWFFZNueXyjEjcVN0o5LXPcmVqQxvbDsuzyTVJFRRNFfjoph4KoKjjQ5fBqxg
	1BrhT7P4buAUYJRWgnbpSE9YIX1HKFp21ehJ8JMfZV4Za3X/RhFr63y7OjRvl0Y1hwkcSNsPMu0
	iRq8mL3bkw3igYLO4LfHtryV2vNXIuc6wuWqaKB7ykoUTvcdunXYykLN/dPHgAs0AgzIdE0Ruhj
	wZggSG60f4CuDXlSOjKdMNMA==
X-Received: by 2002:a05:600c:8b10:b0:49f:fbad:29ae with SMTP id 5b1f17b1804b1-4a00d780b78mr58589595e9.17.1790699452743;
        Tue, 29 Sep 2026 09:30:52 -0700 (PDT)
X-Received: by 2002:a05:600c:8b10:b0:49f:fbad:29ae with SMTP id 5b1f17b1804b1-4a00d780b78mr58589205e9.17.1790699452395;
        Tue, 29 Sep 2026 09:30:52 -0700 (PDT)
Received: from ?IPV6:2a02:908:1242:30e0:769:5000:73ee:deb3? ([2a02:908:1242:30e0:769:5000:73ee:deb3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9dfdbsm130957335e9.1.2026.09.29.09.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 09:30:51 -0700 (PDT)
Message-ID: <70a3451c-db31-41d0-af9d-8c9e123557f6@canonical.com>
Date: Tue, 29 Sep 2026 18:30:49 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/11] riscv: Add B to hwcap and hwprobe
To: Radim Krcmar <rkrcmar@qti.qualcomm.com>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>,
 "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
 Peter Bergner <bergner@oss.tenstorrent.com>,
 Zihong Yao <zihong.plct@isrc.iscas.ac.cn>, Mark Harris <mark.hsj@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Conor Dooley <conor.dooley@microchip.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>,
 Guodong Xu <guodong.xu@oss.qualcomm.com>
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
 <20260920-rva23u64-hwprobe-v2-v8-1-5f14bc5c23d3@oss.qualcomm.com>
 <9d058591-466e-4c06-a820-b8ecc7d319a6@canonical.com>
 <15151b8ab012ca7444d4117e393cf999.guodong.xu@oss.qualcomm.com>
 <DLRWB8R7P6SF.1XIL0OXLZ2F23@qti.qualcomm.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <DLRWB8R7P6SF.1XIL0OXLZ2F23@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/29/26 17:12, Radim Krcmar wrote:
> 2026-09-24T06:38:17-04:00, Guodong Xu <guodong.xu@oss.qualcomm.com>:
>> On Mon, 21 Sep 2026 16:24:53 +0200, Heinrich Schuchardt wrote:
>>> On 9/20/26 09:18, Guodong Xu wrote:
>>>> [ ... ]
>>>>    	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_Q),
>>>>    	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_C, riscv_c_exts),
>>>> +	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
>>>
>>> Hello Guodong,
>>>
>>> The RISC-V Unpriviledged ISA specification has this description of
>>> extension B:
>>>
>>> "The B standard extension comprises instructions provided by the Zba,
>>> Zbb, and Zbs extensions."
>>>
>>> __RISCV_ISA_EXT_SUPERSET would imply that something else but
>>> riscv_b_exts is in B. But such an extra seems not to exist.
>>>
>>> So shouldn't __RISCV_ISA_EXT_BUNDLE be used here? Some code further
>>> change may be needed to set extension B if riscv_b_exts is fulfilled.
>>
>> Thanks for the review. Intentional, and the difference between the two
>> macros is whether the extension gets a bit of its own.
>>
>> __RISCV_ISA_EXT_BUNDLE carries RISCV_ISA_EXT_INVALID as its id: parsing
>> the name only sets the bits of its parts. That fits zk, zkn names, which
>> are shorthands with no identity of their own beyond the ISA string.
>>
>> B is different: it is a single-letter standard extension with its own
>> misa bit (in the same way as A), and AT_HWCAP on RISC-V is the bitmask
>> of exactly those single letters, so the kernel needs a bit for B itself.
>>
>> A is declared the same way; with the spec defines A in the same words as
>> B. If I can take that as a precedence.
>>
>> IMHO, "superset" in this table means "also sets these subset bits", not
>> "contains something extra".
> 
> Zba, Zbb, and Zbs are equivalent to B for our purposes.
> 
> Are we sure that B will always be listed in the ISA string when Zba,
> Zbb, and Zbs are present?
> 
> We could incorrectly lose RVA23U64 bit otherwise, and I think this was
> Heinrich's concern as well...
> 
> (The "A" extension has the same issue...)
> 
> Thanks.

If Zba, Zbb, and Zbs are present the kernel should set the B flag in 
hwprobe. This is why RISCV_ISA_EXT_SUPERSET() cannot be used to describe 
the B extension. RISCV_ISA_EXT_BUNDLE looks more appropriate but may 
lack functionality.

RVA23U64 looks like an RISCV_ISA_EXT_BUNDLE() to me, too.

Unfortunately these macros are not properly documented.

It would be helpful to first align on the meaning and usage of the 
macros and document them properly.

---

The benefit of an additional hwprobe flags for B is limited. When I want 
to check for B I can already use:

RISCV_HWPROBE_EXT_B =
RISCV_HWPROBE_EXT_ZBA | RISCV_HWPROBE_EXT_ZBB | RISCV_HWPROBE_EXT_ZBS;

if ((value & RISCV_HWPROBE_EXT_B) == RISCV_HWPROBE_EXT_B) {
	// Hurray, I have the B extension.
}

There is more utility in the RVA23U64 flag because it combines values 
from RISCV_HWPROBE_KEY_BASE_BEHAVIOR, RISCV_HWPROBE_KEY_IMA_EXT_0, and 
RISCV_HWPROBE_KEY_IMA_EXT_1.

Best regards

Heinrich
