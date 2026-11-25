Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795636570;
	b=tSrhY9OPYH7OedOVc8jhlMrjpRObJeQMvss+FW6NDz2XWAqNW9BbacDBjOnWOWkt8LPb
	 +vbZUcb8IPk8XIn3XlHWfhJy6BKNE93yTf46zGGDktB34zcLyHkwMwmdScgSC1/wGD00k
	 ZWnYBlqOXr8Ikg1FVKyMGO29G7udg0lT2PmmyCGaxaJxIlGyvZZ+FcPi64zb4Wpetm0vr
	 VIqQHaWtTrhoW7NdoTGypbZoePoFRk8i6tWjfYY59+2suWanHCLJBpHJQTSAqAPxB22od
	 YyuIGw61KChtLDhpA8LWvbdxYZbync7Ny7+suYpEkQcRzxI9CK9n3eIBPHWzAGqBkOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=8L/FhEtu1AibEOTL3+giqF5YaBf2Hqhjfa+0JnWkQw8=;
	b=0dD6VEU3zqXWT55vfKi7u43nn0p7JTTcXjEKvjSvGmAPr8dtG1dJilfJ+3HLuQRJcea9
	 cxLtlLke0WfhZimS8UmtQuEEIWTAMxnOw/vI5pJi9IdO1y9T2rx65Xba4t8yn+9kj09RV
	 KZ3lTW5OzwATvbD9QCt54N7u8Rq04A6r9WOlhMLzwDqhbCJ3KPbSo4NK7iSaOi9/nc1Rj
	 Yqte6vkRaPiFhqanQrKwQwkUNVcrOgu9WTJNK4coLnfRepqnH7fjqvMs6xkGEmIUJcIRN
	 65VKc9FecqMb7VFYNubRRh0ZUk84F30T7pTP3DpFl+5Ls6nIbBcrrRyw47Pj4wF9Pxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=inllcyXl;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97E4606A323
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 19:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E97E4606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=inllcyXl
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8c20d68c83fso3925329b3a.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 11:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795636569; x=1796241369; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8L/FhEtu1AibEOTL3+giqF5YaBf2Hqhjfa+0JnWkQw8=;
        b=inllcyXl28y6OSvEWETty6YA1zFXFK7SM1qNH5/VjAs+tvrdn9RtwNWmL6RMO1FMg2
         sD1PX38paSWk0g8AJcdJikOXUsPUBUwVvcYXJ8MoOgIx+k2cZspOVRHXyIOjnmWLpBm/
         uNRZ6PmfTre0bIOEZQjrIwZqlMbD25myWb+KsozHSDorcntYo7PGJ5UWE/41Meb1XHpa
         3+ytCilFnkJ+nCSmEr3Rya4VGoWgfCeASfX8ifzVgK5yFzA8nwLkU/wWminodiAKpwrA
         ebJVimGXj9uqEehzoHeDoE0uDpDxMTfqfIo/V5QRqPPr0ndiV/L4bMPHlmB/cuZpIFJe
         4W8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795636569; x=1796241369;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8L/FhEtu1AibEOTL3+giqF5YaBf2Hqhjfa+0JnWkQw8=;
        b=AeFHGtaiv/v6gw4OxiPmoNDOQoVO+rhiLaaVZBUxGBOUPtR/l4Fhpq4zFjFRvBtu/A
         PGvHTqFMtzqEkx5Dwv5y/rW8BdHGkZ4Z56J4vNkE8uQ0nx3GAoTXLG8wz9mmfoICUfgu
         wnzaHruAdlHziuIx5v78gGnGgeRZLSyfHMxsFXYVqgb49/a7ifZ8+KU62MiZeEB4iTYD
         NLHPAY1G15XYY93sMixKZp3tU2Q8kF3gi8onxuQaWRzc2gFx5qaznWKqxiJiITnm8iM8
         xnIK0ws86HJvQGOtTQNw+KB8781w/jKZJPOTj3Kh0j6XJU4c3BC7giLZGlzlUkPKi6e1
         XVpw==
X-Forwarded-Encrypted: i=1; AL+hErEbkloN22cHjOhPz+JB1t/2fMhDbPCVbzIwFQH17bku3fng2dsQi3IV5y+idU8hjTgpscBy+EBn8KBa23NzVA0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/773qv9k3jsUntzq8okfJDFRg/9uMV+7+pj3slp9Va7TbgJlN4
	IM8nkiIw7d3cCNd6QWjU1K5+yziRORxmVK8zhLN58x+rC2ha5aBO5xkSH+1QX5asMQ==
X-Gm-Gg: AZFdTZfPn414AxTCS1ZfMBk+2gz98l0SJ9m2nvhIRUWqubWNge21NHr1yNHcCP+nZiQ
	WvR5HmLSp4uoMQwITEMkVFtlxt1s9cPmxvoD+corm6suOf8hwrQ5xtmYknxsk5yBWtKaOq9GfVM
	JTkU9cgvzlsHRf+296ms7pEL8yxpNYPdSWh1GkFYYXxzuzQG6Hoaka+jSE1pHlbNiiBO9uagWvo
	OQeazJl2wwz6HR2t3q5U4ZRwdkONMZo7odToIABbBCxexyklAJrYSqU2wkUE1ZzgxQR0mRQTuHs
	3Z7rnBwnypmkw5O9HjGCqW5rc6V3EH0+RyJeLn5GThjB+GBqZJDcO3M0ygMA1wYWuxAICm71Ynd
	6QyEI7hJ5GVP13qFgkNtns/hJqbJPLdvYWVbqLHA1RqRsQOjBeHiCQpSaGu5f0DnTADNROWi9XS
	qRTFR77cVrzGan7Un4GcqxW1ZuqHiiZYUDGh+YdaBRUoqI9OJInobsY/439/6oRAm+8pQs9cC+6
	qb9Oz/5qLLrVV9vMY/FNl1kcunAvmp46if005LV0PJQ65khjpDDMbuZlcOB86y/XyK+MO1foiHb
	B9sKqkYKRdF4g2NONZSUUYSKCxSTfpJarMjvkPQhWd3dlbFoWxOf2ivM4fPaU0NA5uLqQ0w8PQb
	3jqAbvLGfkQ==
X-Received: by 2002:a05:6a20:2d24:b0:3fb:2086:9051 with SMTP id adf61e73a8af0-4014ed47929mr12701525637.41.1795636568487;
        Wed, 25 Nov 2026 11:56:08 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cbe173453dsm6295218b3a.25.2026.11.25.11.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 11:56:07 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 11:56:07 -0800
Message-Id: <DN4K1F1Z8M9L.25VB33PVA6VDO@google.com>
Cc: <alex@shazbot.org>, <dmatlack@google.com>, <jgg@nvidia.com>, "Kees Cook"
 <kees@kernel.org>, "Andy Lutomirski" <luto@amacapital.net>, "Will Drewry"
 <wad@chromium.org>, "Shuah Khan" <shuah@kernel.org>,
 <linux-kselftest@vger.kernel.org>, "Sean Christopherson"
 <seanjc@google.com>
Subject: Re: [PATCH v4 5/5] vfio: selftests: Allow a size for
 vfio_dma_mapping_perf_test
From: "David Matlack" <dmatlack@google.com>
To: "Aaron Lewis" <aaronlewis@google.com>, <kvm@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20261114132200.113697-1-aaronlewis@google.com>
 <20261114132200.113697-6-aaronlewis@google.com>
In-Reply-To: <20261114132200.113697-6-aaronlewis@google.com>

On Sat Nov 14, 2026 at 5:22 AM PST, Aaron Lewis wrote:
> +/*
> + * Parses "[0-9]+[kmgt]?".
> + */
> +static u64 parse_size(const char *size)

+Sean

This is a copy of parse_size() from KVM selftests
(tools/testing/selftests/kvm/lib/test_util.c), which points to a broader
problem: VFIO and KVM selftests keep growing duplicate copies of the
same basic helpers. Besides parse_size(), this series adds
timer_get()/timer_elapsed_ns(), which overlap with KVM's
timespec_elapsed()/timespec_to_ns(), and VFIO selftests have their own
VFIO_ASSERT*() macros that serve the same purpose as KVM's
TEST_ASSERT().

This isn't just about the tests themselves, it's also about the
libraries. libvfio uses VFIO_ASSERT*() internally and gets linked into
KVM selftests, so a KVM test that uses libvfio (e.g. irq_test) ends up
with two different assert implementations depending on which library
the failure came from. And libvfio can't use any of KVM's helpers, since
VFIO selftests don't link against libkvm. We need to figure out a common
place for these helpers that both libvfio and libkvm (and probably other
selftests too) can use.

That doesn't need to block this series though.

[...]

>  TEST_F(vfio_dma_mapping_perf_test, dma_map_unmap)
>  {
> -	const u64 size =3D SZ_1G;
> +	const u64 page_size =3D variant->page_size ?: getpagesize();
> +	const u64 size =3D test_params.size;
>  	const int flags =3D variant->mmap_flags;
>  	struct dma_region region;
> =20
> -	ksft_print_msg("mmap size =3D %lluG\n", (unsigned long long)(size / SZ_=
1G));
> +	if (!IS_ALIGNED(size, page_size))
> +		SKIP(return, "Size 0x%llx is not aligned to page size 0x%llx",
> +		     (unsigned long long)size, (unsigned long long)page_size);
> +
> +	ksft_print_msg("mmap size =3D %s\n", test_params.size_str);

The page size calculation, alignment check, and ksft_print_msg() are
all duplicated in dma_map_unmap_from_file(). How about:

 - Print the size once in main(), since it's the same for every test.

 - Move the alignment check into a helper and call it at the top of
   both FIXTURE_SETUP()s. Roughly:

	static bool skip_if_size_unaligned(struct __test_metadata *_metadata,
					   u64 page_size)
	{
		page_size =3D page_size ?: getpagesize();
		if (IS_ALIGNED(test_params.size, page_size))
			return false;

		SKIP(return true, "Size 0x%llx is not aligned to page size 0x%llx",
		     (unsigned long long)test_params.size,
		     (unsigned long long)page_size);
	}

	FIXTURE_SETUP(vfio_dma_mapping_perf_test)
	{
		if (skip_if_size_unaligned(_metadata, variant->page_size))
			return;

		...
	}

   The harness won't run the test if setup skips (see
   vfio_dma_mapping_mmio_test.c for an example), and doing the check
   first avoids setting up the IOMMU and device for tests that are going
   to be skipped anyway.

With that,

Reviewed-by: David Matlack <dmatlack@google.com>
