Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799343;
	b=q0ChG7+5odIO5Z6FbnOpkcsUWi36+IwLm2jTi+PhhSGkJ6/45XvtTLErGnPcRjvWWPn2
	 VqOmrMOE251HjjHc3pjbQWIo8ZBTWc/XeBCYnf2tzFDeHAL7dhHkmUREWGn5w/c1MPugL
	 qEggtJ03p6/dn3lOlmz9CFmPhwOimNS80tIJjVi4N4yCu0Pi1ncSuvqxV3deINANr3vHE
	 3t3peUlt7iW7vrKQRMmspBeBY9FTJR44YNcpiZlaBclq5AI89mpjj3E2bJNvqR0Oa8oE3
	 rWdq+l0uiPaHbr0Zc0bpP7uIzaJIUyvfuxdMInm+YpxJZwS3QfnKcaAbvLr9hfg5+lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HB0ZTSdDDmOkIsTidMqTBiLshJg4ThGdlzLSWF0DBNU=;
	b=njlDxzb3e9Im/kjhvrGOxeUPlXoZphxP/QZ3H1/X2P3dWoIxAUNHdF5hG4rdDBm5Q1hM
	 oLb8XKm9gLZPwfPclVRzRhtYU5HIPQhYQAxkrSQyyEYdLIw5PFJsMBF16npx5HtrL6j86
	 hmkGeYNP7UNvWhVe2YY+6bRe2XcOLDkpFyXLU/Qeyml8gNARZs/6K1LetBuHEOHNpLShw
	 Sd9+0mtDXdMrBCuC0FYnspQWLoUeEanLK8I4njO1ju2mIv6mYGw13v4+U/1p+7bgfyBqq
	 49z1xVNlldZzx780CLUea/6j0sDxNgVPTWaeY1AeXyaO9rn0u05Mhp4dHM4zTmew1lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=NpcMn18Z;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C915606A323
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 17:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C915606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=NpcMn18Z
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-949664ee41cso840115085a.3
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 09:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795799341; x=1796404141; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HB0ZTSdDDmOkIsTidMqTBiLshJg4ThGdlzLSWF0DBNU=;
        b=NpcMn18ZOcBUH/K57xXEmosR6TjqGtaHb4iOQyIq0GgNDqO6dAa3ahAGzdoMm6DK/R
         3dkns94RmQsNEaf/27kIYiOKFNzoSKhIXNccUkBguWLK26AIyGo+A089UsFFPfbNz3JT
         fRNukHbF1g5uEH+w2aeet1LpRPQxG0BgLshkGNvKg+X6WFsNVdvtlTlH7jbh0mMU3AE+
         droQd+7Wzvs1ZZv0Bm+V2UKWtzqHa4QvPeJsxPzSnXUzGeAIakkUFw1mjKjdYkbgy2S8
         Y9PJhCrLM+XiW39othsK/ZS90eIpfnqQ3cGzLWFY0EcectQslbi4vHXfem+Makltaxhy
         GuXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795799342; x=1796404142;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HB0ZTSdDDmOkIsTidMqTBiLshJg4ThGdlzLSWF0DBNU=;
        b=RMpGds9FhEB2RtXzu7kYEFQ/HsbH6yGybqN39ix9eBGBmI/2t1lS3AHsXA8797chTm
         oH/QmDx9hPNXuineKKdaVnkoW12p4l7oCvjGrgqeAst7L2Ku5wNpJG8DVw3nhv3UUvQK
         EJviBukHtpbGYL8WJtlEJnI7tP0+0jvs1cqywrjGuD20/G3vT47/qBX4XSpPsf7jVwpI
         lDtnyUkFUO/wxrv2L0FGNtnptXgG/rfyOabu8SERngLrs0HaJqIl0z1NKbBhVp0B6h6a
         sXyXP5VbjOlhTeS0VYq5teZdtfH1D5NfhNY/u8z8C3fRiRJNd5e8w+n1OXxDGQL/B3Ix
         W1JQ==
X-Forwarded-Encrypted: i=1; AL+hErGMiBpHA/iwS61/DICVSY0HCBbZ7KMNeMQ8xJTLpRbbZ2UeJp1kn24Dg4J+rQrqf3KAwJZU6szbZuV3t+4wrHo=@vger.kernel.org
X-Gm-Message-State: APuU4Z85OUsxhDp0FdzAAzOLzj9+tzQ7EBBaij/2NSZTSiJqOo3NIlZP
	TMEEa7xzJgAzDDXIIHZXhoLD9IRLZv5aIc1EZaRNx4fijRP0bqaQEvufZDcaXkHSwZ8=
X-Gm-Gg: AZFdTZegKEjcje3Gg34YvYzDXnk5tWyPPO+ZUB+ROTh1Nx4FjHSsGi5aspe7ABLHtIn
	6VxL8buQzE/2M5qijLmbxURU9b3+HM4vJOeGVKEkq2+YExGmvfI8+qscxueUzDmTkpO8qPcKq1I
	KVDPNyAfPIHa6Pl+8zf2SvJoSnhCkdpqBwMblcaZmnnGmCnDJgOQg3bTwTyjCt0pIDITslPZKXR
	r16JZFUReA3gchqLa3MGK3wNA5tBWNIKV8vEdQfEicTpTyIbG0mwyXIg3HuPYUV7Z2wh0A0eBsU
	3kJlJRhsS60fJfWXYdXxv5PZRB+vfXVsGstCPgAQoj8CSxtRzzpuUgpZPKKcsu4x6Tzue7fszri
	A/dCwrxnAnkfN8ugNe18la8zyU7MtSCfWYzrcRFSFYoW2UjXdXht2Y/0IrgStddRvw+lfFiC9Hx
	0hd54ArOcCp78iUvbSATqE/POsRLX9O+BeWqLFxZGcEy6l6PXGhNIZFGSd+YgSsYVA0EMDmcDAn
	9UZDBFoFf/V0mpMNe3RUaZfJzO0MqJJYZVnxMPB8LEiHfZp4lzw9Dv+ZSm9AIxHbLHAKExiZH4F
	YPSgmA==
X-Received: by 2002:a05:620a:7206:b0:94a:889:5a33 with SMTP id af79cd13be357-94a08896165mr1311739085a.30.1795799341642;
        Fri, 27 Nov 2026 09:09:01 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb41a341sm1875035285a.37.2026.11.27.09.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:09:01 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWzRU-000000079ec-2Xcr;
	Fri, 27 Nov 2026 13:09:00 -0400
Date: Fri, 27 Nov 2026 13:09:00 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Pawel Chmielewski <pawel.chmielewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>, Len Brown <lenb@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RFC v3 8/8] selftest: attestation: add
 cca_guest_attestation_test selftest
Message-ID: <20261127170900.GU246011@ziepe.ca>
References: <20261127-arm_cca_mr-v3-0-df3230afce8f@arm.com>
 <20261127-arm_cca_mr-v3-8-df3230afce8f@arm.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261127-arm_cca_mr-v3-8-df3230afce8f@arm.com>

On Fri, Nov 27, 2026 at 03:33:03PM +0000, Yeoreum Yun wrote:
> Add CCA Realm Guest attestation selftest to test evidence-get, mr_read
> and mr_extend interfaces.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  tools/testing/selftests/attestation/.gitignore     |   1 +
>  tools/testing/selftests/attestation/Makefile       |   9 +-
>  .../attestation/cca_guest_attestation_test.c       | 517 +++++++++++++++++++++
>  3 files changed, 524 insertions(+), 3 deletions(-)

FWIW, I really want to have an attestation userspace project and there
is where stuff like this should end up living..

We haven't got to launching a github for it yet, but that's the plan
anyhow.

Jason
