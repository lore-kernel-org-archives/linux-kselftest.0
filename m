Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.224.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792679618;
	b=RKaYQy6YrmH0D/DOmREuFiU1C44ZpYz9893Tp6gb4NmQrUJyFrNyanNNo7mshGtTHInI
	 QG6fx3xSP797zCqgEhXzaBAUi/SysKe3Vp4ienU/kmHsnYuK0l2YcvOqi4S8AQwDmUNHW
	 li5UFVOhA6iRkC+IDd1uB3szsxxidxITKDcSW6qqJmUWfurjL/iCPmQ9B/H80+L89TPZq
	 CUxzFlkK/2rY6No7poBdYqtyxSdGMlSrxmEveIWvVlxr21YU1sCid5b4DLdS4fiEOQDMI
	 QxtJMzDQOCb8a0lN4lHqzM1gQVVu5CSel7h2sSBitbF51RUEu5UQgvBJdqGfFP+Fqog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792679618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:In-Reply-To:References:MIME-Version:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=y/nVz+Qmk+Tq2vmwCZBWANvE9dUy6Fp4Dxh9VLxLk90=;
	b=Vb2NclyHZUolhNkBVqzp5Td7JYov7KgWEDBMIeiOA1LZaVuDMtwSnyI2/SBzkPpes+VX
	 /XZEGKcgWVGqDmyCnjzPlbAStzW9GpujsiKEWFuwBl9GBuZ+tyLhMHC7gfZBXSRoxzdlR
	 mfIQNy3xvCKEVg6LPTU79nSoc7CUTEVkj8YyzBJkcVZfI+jtNmYkYoD8YJFvMgO8gWuR0
	 cCvntCaxtqblM1T1lNgaUzVgzc+FkQxPWWljuAUhcsJq6KXcSFAYiwo2Zqy6Ys8s4P9Cq
	 MA4wofN+63wIpvGUbDusBsXErN3lrKOR5jibHvCL1V/L5xMbUl6KdwKjBLBFA4/3IAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PRAZE+RY;
	arc=fail smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A42606A326
	for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 14:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3A42606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PRAZE+RY
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6790c2eb033so279271d50.3
        for <linux-kselftest@vger.kernel.org>; Thu, 22 Oct 2026 07:33:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792679617; cv=none;
        d=google.com; s=arc-20260327;
        b=bFYL5NbGvc6fS82qQh2qbYb/AKpDBKsqQqdbTlvwjHV4ZJF8hkx1DccTjfI1HiJ3DG
         rsJKVB4p/ihye28uD7U/wmXt4lGFSchMveEghhxJ16Yv8m/lRxxLIdl7jo2phg9f+T/O
         szy/X2KfpMV036rdbdDewazmZLEzZjSTYbt12yS1ei6IuuYIsyi6xvpTYofz/to1lYqE
         +BXPswE+gPEMEPH0UyYGj1CkXwqU2i6Ibov1m5k2liTK5k82p6hHkVSY+MuQ78uJ4tmI
         HA59/5BvQvX0wzek95sPVSmJqbPWhFtgrE3t/7aVaSEyN8shPGzkub9YXhGKG/lXQxz9
         apBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=y/nVz+Qmk+Tq2vmwCZBWANvE9dUy6Fp4Dxh9VLxLk90=;
        fh=wkOeQ8LZMG3z4lWVcP838o3Zdze3GUM1Rhdon7iU2Ek=;
        b=XgW+srTx/U5Kfve8SXOYbD7xKgcHmwhdpQCoA63DRgc7yWjb+E8jCT5S7PZ40rBfSb
         hxnwxgcPchP1LA+6elSL4Zyd9WfUapSrRTGXBKIRlh2Ph6Xzz9hzcDdCLd71c6u62mmQ
         ad79LG75itQwl46IN2oiiOyJyDYKGpcQ3neQ/w5kQiSfC9O/wu6pYp7QV9srcYAn8c2t
         TGfu9IphCgxUS8ystBd1EeWCPEiwA67oZZygv4SJ5t0TJxMLqA3uHXBuh+5I8nZ9DIvO
         +CpBFsZxZzVHgIy6oRjOhlNVJu/1r+wjf5LzeKR+Z+JMstz7AlwtQWuMu3sSJw8w4Ewk
         l3mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792679617; x=1793284417; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/nVz+Qmk+Tq2vmwCZBWANvE9dUy6Fp4Dxh9VLxLk90=;
        b=PRAZE+RYa/Hi/i7xszdGfO18YYUcERJGPuFa0TwZR0t/KCrkPe/l8S2bcMOAWdZjqn
         hDDsdq5ywxDCW1BdnWmT1Vx22odyBbS51VQ8aTxh7sVxlPj39MtKsFf9kaDZRZt6I+VS
         Awo2q4mT5v2dp3Hr8ECD5NRpuvxWXUlDcw+V0hlIOsJyWgEZj3HdmYJzoUsq1EaOzM3Y
         GnFKT0Gabxv9cGavL7y7NU3KcEKv/Ze//jDMDIzwAsmpPiE0Y8yEZRy4JpdbLEC6egvy
         0OB1FVsaeSIl/Y8D7dEWMAKxf5Thjt+K5PGVV7iuV7wyIYxknzWorZgiLk16hIoN5wAO
         u2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792679617; x=1793284417;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y/nVz+Qmk+Tq2vmwCZBWANvE9dUy6Fp4Dxh9VLxLk90=;
        b=yhtC2O42aaPNx7JSgg8fuE+PWU7KyvECS9Nz1YfaO9i4vjw7d9dsuyiMcmEfS5aTPj
         7CaZEotjzGSP5i31ywvKdc86nfAwW8HeZog7DXunvdD/cwxFBXWd16SaSHJ+Sad6kQaI
         EW6vPWAhj5Yn5xgaSJi+AUwAfGnBXX5tusnHcZ1mcvYAW00mS8FdtMPpb/KGtGFnBjsX
         3Hq5hFJmEwZlA+1SI4aMY3RG2IFOkd4ZcxOjv+pRfIjUamKoEseRi8dqfH+mKr+LFvqv
         41eo8kfZ6hdY1VWUA87CdCt2HM8+b8fkDHWqREFy3PlTYbpIIEcLd0o4XZgcLxhABif4
         4/6A==
X-Forwarded-Encrypted: i=1; AKwUvBywYl93sanwNmluVJ9AM4mZbJqfrpPUnH3P8hjl7LJh30c46xx/gGjzQEoUqkk7bXiu8FfFW2m2w/x3Nassf6c=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAW842fSUhM/n6DECWlcjlsKGLfLdk9JUuxc7nlD42w+cZX7Rq
	IUdLBJYNcwwNJWtmoCjc7AhGBqY/2pWXAx47YIsyjjGPkUjVhosZoEcR+Wkpvdjag181xINDQSb
	7F2UQdxEhGDmPRYTbtM+I4UFfiH9V2Ns=
X-Gm-Gg: AYBFou1Xhn2LHhlyXwYT1xh7wGIv3FgMEPg4K1ojmowWnwkvqA9i6ttVhKgVZwI1pbK
	68kK6yCYAz3rfr4eXAWbj8oEh/2OBmP7MATuwuStOVUC460dcLlS2z+6C4aKV36Ucl64WjoZQfu
	Pa/ht9k2qiaNCEPoW0Do7klRpDPwIkuXYDbqYkkwydRS4NksXaX5aH8eNQ4TmdProcZspAoq1eW
	g5lHLFvzadQ+PWHOH1g8e2OOG8QJCi1cyb8ki46Ykgd11oM9p0M/w//UO+w/Hy4+jWI0lf64ZBG
	i0/rctSHCIw3JpTl2zIgQ5P5IFuUL2Fb8QV/rlHYzUz6kyGuSAzBCNS+IxMoTTUaoettr5sLnup
	Dj4g2zPnhP+FeX9k5au+ufmQOHRoAL4k73VM=
X-Received: by 2002:a05:690e:4504:20b0:679:9e25:316c with SMTP id
 956f58d0204a3-67a0e4f7118mr3858513d50.5.1792679616649; Thu, 22 Oct 2026
 07:33:36 -0700 (PDT)
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 22 Oct 2026 07:33:35 -0700
Received: from 95991385052 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 22 Oct 2026 07:33:35 -0700
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20261022021820.1789083-1-odys.yuan@gmail.com>
References: <20261019-bug-word-at-a-time-zeropad-kasan-v1-0-f21a3ed6a477@gmail.com>
 <20261019-bug-word-at-a-time-zeropad-kasan-v1-1-f21a3ed6a477@gmail.com>
 <CAPAsAGyrH1quaLuyui6Qm5sokid8=yjNbAM3cOunynfPNQtfgg@mail.gmail.com> <20261022021820.1789083-1-odys.yuan@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 22 Oct 2026 07:33:35 -0700
X-Gm-Features: AclHuK9KZnLcDmcb3UzjebEw_JXnOgl4qhgoWZHIOId6L7KU5VJDln5TqsxLBMU
Message-ID: <CAPAsAGyA=WG=z6a==N3O6oan6WVmZS-VrxEA7SrxRQs5d+Dsfg@mail.gmail.com>
Subject: Re: [PATCH 1/2] word-at-a-time: check the first byte in load_unaligned_zeropad()
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Marco Elver <elver@google.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, 
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, Peter Collingbourne <peter@pcc.me.uk>
Content-Type: text/plain; charset="UTF-8"

Qiliang Yuan <odys.yuan@gmail.com> writes:

> On Tue, 20 Oct 2026 12:58:54 -0400, Andrey Ryabinin wrote:
>>> +	/* open-coded instrument_read(addr, 1), as in read_word_at_a_time() */
>>
>> Why it's open-coded ?
>
> For the same reason as read_word_at_a_time(): commit ece69af2ede1
> ("rwonce: handle KCSAN like KASAN in read_word_at_a_time()") open-coded
> it "to avoid having to pull the entire instrumented.h header into
> rwonce.h". I kept the six asm/word-at-a-time.h headers to the same two
> small headers, kasan-checks.h and kcsan-checks.h, rather than pulling in
> instrumented.h with linux/bug.h and kmsan-checks.h.
>

That concern is specific to rwonce.h being included from very low-level header
like compiler.h It doesn't cary over to word-at-a-time.h

> Thanks,
> Qiliang
