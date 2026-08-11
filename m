Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2879B3403E1
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 20:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786481892; cv=pass; b=n3ePRFxIbGYOXiOkbUXCQjrxL4LNLMTaBiV8TvmLZGphBkAzpGicCNiLd2oKECEJUlZ/4H65zLZDPwBFZZiJIb5poTY2NbgvZjryH0yi4G83Cz/MVhAXg6b5Wxy/7ynZMBbM23uAlLifAH9F5nT2xBBiS1QXsIkYLG7uk72AytQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786481892; c=relaxed/simple;
	bh=2HxJNolFAmmdynxiD24QiH/b/aKUErhnmhqEKLHulNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XYGejFAAMSXukBQ447XOFWMcFlkZR5Q+OsjotGKR0ngbm6RoOT6zCXgxJ62sK0e3G1f5lJzACcy8t/U3SQtrUUgqr54PTv5/hXktRlwgCZWAHJgnya/KcwG9DIPPitvjF6qFU5OL5xOVCwj3NdxPRP6APuqzjOcQg4q+TDS4e8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NzWTvtrf; arc=pass smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NzWTvtrf"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cbedc9ec119so134747a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 13:58:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786481890; cv=none;
        d=google.com; s=arc-20260327;
        b=A2M2+e6dvjTCO0UFH+cSIWalL9F+bgSGic993RiTJwVqjLEi4xAutK3m2iVfWIwBo1
         0rCcvsvAL0x8H3OHF5bB+Z2qTU+TZsxS/ioiIiUWyrjtm/oyHSRqjlFMtKWJejYFqQvq
         Wfl2eDA25Fdu59z7kyRj/APSDTgM/QqD4ak2zQZKxWH6m+bR0ay7/ttnGeYv6itgvp5b
         J1quzw2tOPrbNAPWLeHX6y8sujvjsZX33AGQzMjCo10eFUm6i14LSSI714BDofg3aHJf
         fIGrM9tTX2/6Iim6UKx9Q9/0/9dNlAIb3EtExiVVPEAg1XPfGXZ2KeANydJ+62AXbYmh
         UuLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2HxJNolFAmmdynxiD24QiH/b/aKUErhnmhqEKLHulNk=;
        fh=MYKbgcvM1i/NTPeFFoNdvOrOuclUIEMXskdu0eCQDPY=;
        b=lzolFU65hH9IR37ZhHrwQ0HByEqI3QelXL6dWEy/qhgv1JRgsvFBFOBdbUkefDGs2s
         3WFFnUtv1D1nriPiSA4ETvPVO571CrFfA9bDY6nUzCcWQSLlUxVk8cqX7krtBf3/PdlA
         wcZtWfG/R6IGI0FzopihZTFXeLi6ASo23/MfzMtALJF9q5YQuD1bs02Wh2OQ5Ibv7Qzj
         FXyJ5HxoVWAMiMLSi3unViJ32+Z+QFS0pdDVOBP96GHi0jlXJGiBgP43KOLN5hcmOn4m
         oIuLV+Cisb7ISREv5rIV1gtj562YrmYfrdcm4wBBhe3EhMrouygDpV1FuQ//TDR7wIWh
         1DyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786481890; x=1787086690; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2HxJNolFAmmdynxiD24QiH/b/aKUErhnmhqEKLHulNk=;
        b=NzWTvtrfy96nK5Lgxq0+pRu5Bp6lmuZoZTsowLe4/X6uPmn+20M3l1aOF6OB0n434W
         840//RHdPccbuEVZrw/qhOk7p+zAdcH5mj53jXRHaYMGbR7dmPQH1YLkfE+FQY4gxyhM
         fa+oWxKlas3rTdGljqjCVY7LNy6YsaPQlRJ8P0z5q56KxDhPxKI+QUSX/KVVSg62nqXM
         JoPrlWFMlFqmI7R3W3BdXl8ZhXIHM+xVJrKGxLrcmWdSgs+6uYDbECnA31Qkh8NJ9p3T
         AeqG8fdVvcInt9/JDaigI7va1S//XlZODUMvGwu1IjIdXDiyceAGfGkKy/oiQeKgSmKR
         UcAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786481890; x=1787086690;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2HxJNolFAmmdynxiD24QiH/b/aKUErhnmhqEKLHulNk=;
        b=RIoKScDSgELCm7E/z7a7yLzLcjEvH/pgV3kkpXb1nkURKPDi578xW64HH4jvlC1/i4
         x9hKA3H4jq0Tdh3ryw8gc+1S0YY5KJq+lMksf22XHgFKYpaxyXmaxUsnRhqBKIIuU5jL
         LAAN+O1O/D48oJv0KxcsnFrbehV+ERYpac6mjD2PRJi6U6pdciB445AzMSakToBve1GJ
         kfAshmCRBaD3Kg3gruXr8II8kemrow38NbNsMHOFKXMZ85EhYTtooYh7n4QPlsl5kvhL
         Srj+p0PKv9QcBEntkXFJBK/2VVYTbuXTxvIyY9khzUKroCa7WhVQMtgQxMt0OrsmlluE
         l33A==
X-Forwarded-Encrypted: i=1; AHgh+Rq0qjsRzKWLSkO2XBQf2mATt8Pfm6t+Jf6ASmKmnqpdwaVw26adZUXhjgxS/4+5by1gY/BCYGdmBiZ4qzzxFuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLcycAGMfsF0ZlCu/DeiiHIAhz4AseujH6qM/BwMYZPxZ8cELB
	UuaPV3wIQVP0gtu1AcZlh3e+LiT8BcoPqQ9ZRdiTrlarOPZ8mO3vHrMwhoAVzX2W+PKM3xssFEv
	hJZsKXZWOKt0o03HDbO1Z7P1Clqg53WODON2Lyaw=
X-Gm-Gg: AR+sD10pPlZP9ErdhXfaIWpLlxNgtu5o9XkigAvExN71KdwqoSrfvbGvTYyCOXj1Bxr
	TeblBWvK3o1vxEDkwW+UfqgciMEsgm9m7lrB/cF0txV4/jxVGdsvPwcUaU4WMNHtcMolh4nvzBn
	IpH6I137MVyiGnXg1V9IizrCOP9N7Chgv8bGh8AeOXtujGKU+M7+zUYkuw3s9JJQnip/adAFoTo
	7EdwKaBcRME/8MJqSWG+sw5JMvUlehz3LEb5Dr8bE6yiP/MaY1clHRRKAQageX7fCULwN/8jvae
	UpO91l+1HQd2RSkx/kXhfXuwzLzSgfnZ30iLfHlPHkx2E1vQK1hIDF7Xg675CyxWerL9QXmhlc/
	oXTKZRkVSR2U2OKrjQ8mbTJKrpbTaGZZ1Prehg8bqw9AmK4A8kMyEMBFaMxziLS3hzsKiOYYM
X-Received: by 2002:a05:6a21:6014:b0:3c3:8d4c:6679 with SMTP id
 adf61e73a8af0-3cc2baf91c1mr8926509637.20.1786481889874; Tue, 11 Aug 2026
 13:58:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811204123.3198370-1-tjmercier@google.com>
In-Reply-To: <20260811204123.3198370-1-tjmercier@google.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 11 Aug 2026 13:57:57 -0700
X-Gm-Features: AUfX_myHUGWyest017h6R42yiKHyXXmXDv2AxIQm6g3i9kVslMqq8mjeEi_Jdwc
Message-ID: <CANDhNCp8TTQF4j3zCt0EaQYfvB+nGRrM73Q43aQi0jzUG+ormw@mail.gmail.com>
Subject: Re: [PATCH] kselftests: dmabuf-heaps: Open heap device files O_RDONLY
To: "T.J. Mercier" <tjmercier@google.com>
Cc: sumit.semwal@linaro.org, benjamin.gaignard@collabora.com, 
	Brian.Starkey@arm.com, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	christian.koenig@amd.com, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 1:41=E2=80=AFPM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> Write permissions on the /dev/dma_heap/* device files are not required
> to issue ioctls and allocate dmabufs. Applications should be opening
> these file as O_RDONLY. The BPF dmabuf_iter selftest already does
> this. [1]
>
> Users are pointing to these selftests as examples of how use dmabuf,
> and encountering permission errors on systems where write permissions
> are not available on /dev/dma_heap/*. Apply the principle of least
> privilege to selftests which open dmabuf heaps by removing the write
> access mode and using O_RDONLY for the open() instead.
>
> The same is true for the vgem test using /dev/dri/card.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/tools/testing/selftests/bpf/prog_tests/dmabuf_iter.c?h=3Dv7.1#n49
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>

Acked-by: John Stultz <jstultz@google.com>

thanks
-john
