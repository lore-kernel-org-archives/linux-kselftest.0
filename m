Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793195016;
	b=is0mj8oj4h6joS7Wjor4ZSv0CGAB3Fu84fEZKOeOX7spsg8Vm20ZeQawDtFvWMbvMnEA
	 7tjQT6U+WreIHSk2Ls9V7hM2YTlcPbb31alsrcvUYbh563ZEgMds1IsFjMHBv344zjuOU
	 3qivdA5LQJHISnN33BoPfcev4nWRwqTUNRiAFmgopUtbRRAgSDLlXJ0+8rLPzIpWLffdS
	 eaQ6WDekeToDMH3wYGO6Y/+Dd/4lIJpViUJ5OpMJXZfFzZfLaXBmv2GS+E0kIYvw9PevK
	 /Q+WogOyvCb44EWht5DyXcW9UXgqTxc3wlmvaBAi8rcRfPz5A3Nrku9rV1o2CeQbZaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195016;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=6Gj9UHjLoMrPL2uz849IcayELirXOaA9Tos3l7jEBBQ=;
	b=oUGosa34kFELVoLOvZNrZalkzieQpTd59lVpNHhUb+mo66JpYuQoiBdcn+xwCtSQbJlk
	 qBa4qvvhuyE39m00WVMyxIM3QgiLB2t37x8VHybZol36XM0CH9wa4NgZ/m3lK29ekePy3
	 UiK9OgC7V0cT695zAjq2XxnpZsma9khVppGbMCqP5j3deukm4LnpmuDsvCiFuNTx1jwe+
	 Xi9D5UVQxI8n1RDSjMagTrqkZgvE94U4jvH0FxLLiG0eq3fvmfxLFGNbNya3TmAYHy74W
	 OTpCLZUkmWUhalMRZDZ/UNy0Sar2nSZUA+LABTHAPt63YVOJdav+fW0uSDXnG7Df1VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=HVVEhi73;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1B6606A31A
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 13:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA1B6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=HVVEhi73
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93f1e5d7450so81177285a.2
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 06:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1793195015; x=1793799815; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6Gj9UHjLoMrPL2uz849IcayELirXOaA9Tos3l7jEBBQ=;
        b=HVVEhi73Zw+0mogbFKg3aDGWs54ZNII4WAy8ievCls5hptFQ4pnBZSHRye+LIGmiFW
         Qbzp4V+0JHM7wHVgsogIEiuQvur3QHaIXzzJEc1T2VDZA58obWj8wsqMD2qGVPdf3JLS
         7PP9Fiyxk/HtZLX67/3kgap35UeW3d9gr+SCA/a8hISUfaDZ82tmWwZwPhcqjJ0ZVpRa
         l0Fa/gUTAYpoJATCiGnWRIKvQacWYmAyG/qZ4ha4BEYHoPusft4vGugLqwdG9vKgfmxt
         yJxcmZm7U30EQknUKcWXPRpDFAyzj3nmbrIfxT4jVuTZnT8eVsOWaoVIdMFt/Boteo+1
         tx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793195015; x=1793799815;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Gj9UHjLoMrPL2uz849IcayELirXOaA9Tos3l7jEBBQ=;
        b=dd+uxSJ8GV4UwcxBl/ZsBC5VIrGjwvOJVlMEXh8X+lWKVFmMFCy2xueOkMJ+AKIm+x
         hjFUt2LBGaahdz4JVoltYaG0ZqMn40inWuNMgGEq6viPJNihQmhX9Uaa8ELC2MH6S3mr
         BMpnIdCxOSxzFJ8zqcKTRFnP62WrmYRBk3mCV7j2zFN/JYZ8qrhfJQZ/hBUru4dgOJwb
         vD8WT9Wh88V/CpNM9zO24xLIleCF77ltdHjue5DzfaBeGHpb34gRVsWolPGLlH6ApgWi
         bpkUsbjTRFor2yKXjLETMsgtLvAS4YEcAKMJBICl7b4F8mcyMCZmJLC75ItJ91dzsB9I
         r1vQ==
X-Forwarded-Encrypted: i=1; AKwUvByz+0S3buLBv3Mx7FefVlj0K9umv+HqK4dBcJbSY3soEGJI/2waokYqS7WG96JJbR5m3Tv8ip/kQ9Jahpc48Z8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ43mFQZ/PuAGL2E81s/qAE1k3FIE4aThl9pV6jqsAzWusjhCVN
	/E4dSDEac7hKqwfdwy/JoGtPY9qcWE6pKlyjfvfm8RA7Q/KhkDI8XnOx3xL637oJDxM=
X-Gm-Gg: AYBFou214XaN0R8B3T9sGX5T51xBLHwS8LHV8PVVbBYdYNMcGmFKlT3jCIkhciVRAX5
	sjs1eVzxwgqIwDgaCYILDtV5UjRaejSgsts5goyL4gTLox9VaTIqICuMAX9souq1qxRgBJpamCr
	A5Tg0phewbmZRG0cO8Q/WDwqkTnwkquCSWQE8xu1DKfcDaUTqWk+kFwZ7AtEMBB484wst/7q8rq
	Rzo7BFNdkyoxjvbcg4higjKyS8MhSFikhvv0JYeh+p+DmM35DIfBb/wiSxRadr6tyOEufKGEwDE
	cp7DyyaYx54UFQRdXc3Lid9jiHsswYIYk0bJZibk7/4IKS+mcGY4bXCzvNeQuIA6obcDKztPujv
	ihrUb2g5mKiUB/6r0jx73b8ssBDY52pKQ7+/tJj7oggdEH5SK44R3JCGUuP9optr+HZy3VwdRRT
	FRyXX2S/QcUEc5cqvocrygfbrASsG6BqNCJBVnrRYzMzbpZta7kEK/Hr+xI10EA4BgDP3DhI2kd
	NvzRAoaBNAJzL/XMoODI+CwQjVQG7sM0H1fdpow3ShowsgsrPfzlVR5znz3EhpooW/bZl4DiUzA
	ibOOSYAvtwKHp1GnA9YecNit7VxxWZnDztMvz0PNR8KL4VxyBlMUcPybLS+KZYeQh4QqTMgHkMR
	S
X-Received: by 2002:a05:620a:4044:b0:940:f53d:5eb with SMTP id af79cd13be357-94408ccad65mr342537085a.35.1793195014674;
        Wed, 28 Oct 2026 06:43:34 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47a6bff7sm131382856d6.5.2026.10.28.06.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:43:34 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 1/7] selftests/mm: add MADV_COLD and MADV_PAGEOUT
 contract tests
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Sarthak Sharma <sarthak.sharma@arm.com>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, 
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
 mhocko@suse.com, shuah@kernel.org
In-Reply-To: <726ac203-7ee1-41d1-a9f3-7322c7528971@arm.com>
References: <20261019171206.3331374-1-gourry@gourry.net>
 <20261019171206.3331374-2-gourry@gourry.net>
 <726ac203-7ee1-41d1-a9f3-7322c7528971@arm.com>
Date: Wed, 28 Oct 2026 09:43:33 -0400
Message-Id: <179319501336.2032926.1556159871121015337.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-28 16:52 +0530, Sarthak Sharma wrote:
> 
> > v3: Dropped Sarthak's Reviewed-by from v2 1/8 and 2/8, which are folded
> > here, since this patch now adds main() with the CPU pinning and the
> > one-time reclaim check, and the swapped-page tests fail rather than skip.
> Thanks for changing the name of the selftest. Adding the swap check once
> in main() also looks good.
> 
> Reviewed-by: Sarthak Sharma <sarthak.sharma@arm.com>
> 

Thank you for the reviews!

-- 
~Gregory

