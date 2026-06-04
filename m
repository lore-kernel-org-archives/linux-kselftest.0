Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E4238F92D
	for <linux-kselftest@vger.kernel.org>; Thu,  4 Jun 2026 15:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780588002; cv=none; b=uboBUMjF3sG0hmP4PU5Kw9acjnTor1frX3/+ukZWXL6WkSBBGioKdSILUU3rikJzvlY0O5MsN8SExm80RjObKrXSntofwEFq10zR50PtYv8XFCM+sxCXZH4WmygGLPpmbQHB0LaoEKHapyiM6NASM4RA7GzzpNIH3nkG2Eokjl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780588002; c=relaxed/simple;
	bh=xtmzevV8iGYnmYrZE5NtdguMWRoK/e++B5wd01JKR7M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=GBuISo3K6DkeYjmIJ3Qylkkhq0QYnLa1dtFzFu1iPOJ6/1R4RZMIJxludOh25r07iH7l+IZvYteiz/UeCzuZlPwUfU/O2r+kTd1qzSeYrS1pLqjymWlf3uneCPUONrNsMl67NWFPx+1E0aSpWCuydU4u9mSo/Hk5H8ynI4UNxKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=w+SeUnhp; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="w+SeUnhp"
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-c8583b8fd89so550252a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 04 Jun 2026 08:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1780588000; x=1781192800; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtmzevV8iGYnmYrZE5NtdguMWRoK/e++B5wd01JKR7M=;
        b=w+SeUnhp/2a4xYw+8mQf4QFmjijhDAvE2Dv9XPz+Iip7W6pNeQBfYHW8oJaZfbICCk
         MGr5lhvM42KXWdg4vZz6uVrPzX7jp5d9peCb7riCeLKmKtDxBjbyelNFN5kzkZ3aGk6X
         BMLiIurm/JFn3cPBqcPYYnhKgGVQIDrpL8xufcFj+3Iinv5oAGFkF0Cn5Oy3fvIE43Fw
         hleVSpsQoluVlJ+dzag5l+axkFQmNQYJqaC/GqX9jD0qyL91wJaeIlbh1kShIfGdvYih
         oquKjbQguF678s5uU4ENI//q1a6hXgy4mWXdcEnBujOL+OLyxjzr/LlESfR1ZlYCKXwJ
         U0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780588000; x=1781192800;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xtmzevV8iGYnmYrZE5NtdguMWRoK/e++B5wd01JKR7M=;
        b=WCLWga9kKsPNWQZPKGh43Ekk/vBoRUlUs6JO8h+eOR26a1O/cbocO7ybTjIvxFT5nR
         siOE+Is8E504MQLyqMftcyOGnA3VFQxDeL8pJ7nqAKm3e6ivbVIdFghaOhfW8wCin8i1
         IRfispYXkkFn6JRM/niNmppuCY5J3bh1TwCj+gJ+JYvnASKVNaL5jZ+dKDNodz4/AODc
         DpXVg9gaW5mwLpw9cY0HChdLfKQLN3UXrQoCuzP8hkvtX9yEBn9WDCpZLATGny69t+Ye
         bYShAnqZbukJhSMdLF4g7+SE69jDYEeS2Wx9TbcCGzqeaL+WSv73KvQkKD5ix2FkddnV
         /zVA==
X-Forwarded-Encrypted: i=1; AFNElJ/rXm3+J1merp7w6QjPaWI0/o1e1WVUQIeaR3z4e9r9E8xKO1T0HRC1zZhoCNNB9tGk1Mz4UTVPtWYton9nD7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDNOtPFkmy9cROiE0k8xScbVeSwpdxT7iIDXUyZqLbn6nqAwh7
	Kg907k/hhL+zUIegKbUrufTC9ox8rS391u9YESOPdzz6ph5h7MUrB+yOhM3a1C/i15Y=
X-Gm-Gg: Acq92OEQjqHxJREnhIovrn+hZYOdi7399LhgmykXouBrb5hEhX8G+hWnDq8oI1P4EKM
	ULCtk+cidg5Ljr5r9AmESc4zZgGXNGY9zZ8niLX2cVTLaFWA3eiwGlA/nIjQmPKDOSaHUfFP7Sl
	I0l4bemBKTWDbxA8fhPeMeC65qSZn9sxHJUHN9AJqX0FQmtx0a9VyAp8dcGIQTOMkcbj0o6Udx2
	nGEWZYZQgwTm4oDjLW8/uWr4afKfwN1JTJd2G6WwUIlzWa3CDtVlMsQE68D5w9FArhaIJFYZ6Ru
	SIrFHvJBuMh08yPyYV1MX1ySntLk/2GWx4V3er0vk4WT4IHlOq52KmnZCPSLnhsjWP9WAiDbt1p
	Ozyxx4zTm9qZHpz6hkyebYiq/bI0Ilu1wfezyzFBeDmJb9xUdpez6lB3P06MYqL+mW2qUv7IIps
	5kF1Pj9Uav4Cb76h7NrJ9jiL1ZXwWdir90+fc=
X-Received: by 2002:a05:6a21:7486:b0:3aa:c99b:aaf4 with SMTP id adf61e73a8af0-3b49763c38dmr10055917637.15.1780588000338;
        Thu, 04 Jun 2026 08:46:40 -0700 (PDT)
Received: from localhost ([2001:569:58a0:da00:a5c8:c4ce:f7c1:40c1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df034a2csm5594874a12.3.2026.06.04.08.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 08:46:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Jun 2026 11:46:39 -0400
Message-Id: <DJ0DRM980L8V.3MR51HBLAVAEP@etsalapatis.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next] selftests/bpf: Add arena direct-value
 one-past-end reject test
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Woojin Ji" <random6.xyz@gmail.com>, "Emil Tsalapatis"
 <emil@etsalapatis.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260603-arena-direct-value-v1-v1-1-7b31cc0a8cac@gmail.com>
 <DIZJ5P33U6YT.14OWBKG3T9LVD@etsalapatis.com>
 <20260604153712.199362-1-random6.xyz@gmail.com>
In-Reply-To: <20260604153712.199362-1-random6.xyz@gmail.com>

On Thu Jun 4, 2026 at 11:37 AM EDT, Woojin Ji wrote:
> Thanks for the review.
>
> I tried moving this into verifier_arena.c, but this test needs to set the
> second BPF_PSEUDO_MAP_VALUE ldimm64 immediate to arena_size exactly. The
> __arena C forms I checked materialize the arena-end offset as a separate =
ALU
> add or memory access offset instead, so they do not exercise
> arena_map_direct_value_addr() with off =3D=3D arena_size.
>
> So v2 keeps the userspace raw-instruction test and expands the commit mes=
sage
> to explain why it is needed.

This sounds like the problem is that we can't really get BPF C to be
compiled down to problematic code. Can't we still use inline assembly
in the BPF C file to do so? I don't see why not.

>
> v2: https://lore.kernel.org/all/20260605-arena-direct-value-v1-v2-1-a92cb=
281e376@gmail.com/

