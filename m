Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B35345CBD
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 20:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779310391; cv=pass; b=i/I7PXU6ibjzK8Um7aO9yuK9W2+LLC2UGXTsrmQYVrBx80OpCtvp0x38ZHQJZsf+a73dDhHXezNdW91BjJVQ9d5riKITdU33LTcV+c1ydq+s4kmxM35VxT5RXfrMDWYOHf19GDm28XhrAqLm9faq5rIGBSVgKaOU4EX0D2zHE1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779310391; c=relaxed/simple;
	bh=epPRNW+DTeChnt2vYOd2BtSWp2xcqq/u4GOdfh4R0AM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iyzLRYyh/BxlQTS/GUfGxaICr1Aj/rYPAHEk/qMWBb+LaOkWbfqpyS7+6xcgoeICqPsXS7k/kv45B8Bz3YIAe+ALUsy7zvpliUrGlCD/kBxQER7i2Ta0lph1kULfNDEA28kVSrGvYflAZ23PR054/BgwTxW/acKNsRHNTCNACLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VNwymQTy; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VNwymQTy"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bd8d0e4e341so684063966b.0
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 13:53:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779310389; cv=none;
        d=google.com; s=arc-20240605;
        b=D7d3gfQ8WV+tFjcqfrYgj32yJNDRA/8kSf5syHjWWZQy7uIrPYkagokMq+eDyd5o/p
         OQ355+MNLjNU6NfBb2JwivKWKnwGJZIxChPYr1nQzH3aYlCZl1XKfNdoIGjZFHG/lzXk
         fchX4iI1Q+eUqDsgXHLbOqNUMTQO9U4kve4KHu0DhwfGO7Jsq9suKY8arGMr5210coUA
         JTX/zqWC1GvN0iKeXG0YyZMXdYx0SJufknv9/wWUgXBoxWB89Qt1rVjJaXvve7sRHcsn
         C9K93LEru1ky/nf0jReZEYFcLjBhWsd3aXRyu580KgUkXt0XBIRmQbh4JYiCpM6eRCos
         +UnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AgrHWFxpEFUsmkWDSh9F3ht6uMtkuODwzZ9hpGxEM4k=;
        fh=Q35zCvHJKfS+LB/Ipw3Uo+/LmySAlWk0akFVcn1/C58=;
        b=bCgQ9ot3ns6QMp1X9e8imJX2ZEKIded9tFBqbefBtNwv9hJySIbVTQGt/ExvNm9MAh
         7W5PJsUco6hibXonqfB0+wMqjEyhT20uRDXUtJRvVyirsZnhLdok4P5q9UDxVTu355vM
         m/YAYAzgrl4AFYmOVtwPL7l4mG1SYokUJbqgNmA8PLp0FRKkRGoPd5jDFHaC7c5FDYMd
         /UyobqNddG1FMMPop5Tz0j3+S6lGi70rHdVc9T662EMxtyR9evWHN2JCTeWTnAqtoB6S
         yONr97X+YBUPSqD8GiaNA1K9c4TuLEcKH5Z1VfSksqo+KdGrlFxnD6662cYTXD3wT9X8
         QFsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779310389; x=1779915189; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AgrHWFxpEFUsmkWDSh9F3ht6uMtkuODwzZ9hpGxEM4k=;
        b=VNwymQTyJ9ygqXbsFITzfaBZhuQ40mkz9QfgY0DPribKSO4MhKQNIBJtBSYFNt2KWg
         v6ml4TxGzChodOPpCbEUhCaaBOLjnzmtbjuRZzeEbfWwY3azeK8vydOhDI4ZThKdmW1G
         6mRgxk9YC54690i1w3hi7iQqTHHWMFLuq8ru6QxGwWORtwTa4FG5rDbH4Dwgc7Jscvxr
         8uma9JCsmiAq/bPFO/RBT2W2ARB66K3kGmTTZ/9313TezEMun9VaR/roFjSQMFIEKGms
         lxFJsLcliNbiqmhKeou3UBPQ13qYyzhQyCeHvtfFy+3ooOSJS9YFnO2OK0ts9zaEJO0K
         bQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779310389; x=1779915189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AgrHWFxpEFUsmkWDSh9F3ht6uMtkuODwzZ9hpGxEM4k=;
        b=WFp+482WO/NdaA8Wmq6FnsZoFmo/qy9vI3m1WICm+eGuaNRbOtIWWFJn4Iyp885yXs
         UufIxVyB3XO1Y63bGZ0jXckUoJ0zp46LJ/dHHSoj/MdrINm7Ct5M32dHMLbfKc1oA0Ly
         BvGuJObj2X8dhzCDKpbPTzakG5ZqGzhW47oh1vdA4u2cw1igo4vtPadm2g/o5hGGtaRG
         grtoytLQXHRchO+Y2HaHuo3WoVWZ/ipHQN2mrzvLpxiDch/xOPt3mCRhhNIISQIBy5+7
         UNnZsP1zsq24V34ybPGovGp50g3IdD699KI8PozB82EkBKRYgf4ZjqIBWFloKGz/cFV8
         1/ow==
X-Forwarded-Encrypted: i=1; AFNElJ/iAoXorhYHmgZuJvC6g1SrFNGh98UKGzl1yZp5WlrveYoGpHkv6/K4y/NNGL8y/nVwth4zYwK0r4IM617j8eo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD64fyf5/xhEKtqfFo7TTODp14aO5vuUQUT/ctMIsU/F3yPyxZ
	M1C8dZyZXS8OK0xfpNb6Hn/u3Z5GYA28AOQJIrLuldY5D+2NVA4E5PN/30mogNhMY3FlVmrFg2p
	50FPDgwTUPfbY2/Qecwvylg5Iky3zzSM=
X-Gm-Gg: Acq92OEOqu15NiEwG49JO49s/5KjWDyluCOed5GdzUMJanhR05ZLmWc5prmZEz+sfOR
	8oJ49foVVuASh3xkrrehf8LxhKzUJXNHF9zClJGnJrdJxefsZwUadiWxFJxJABh6x5Uvxe4hpoS
	xuTzd/KGaANSyBreprWCWrUULlp3hRFoLcBbNNYNJ+UwBA7+LSdoQpRWv6jXP64a+MiVLi92eP9
	PhDkznGqTKo1x1990tErmnTRyRaEQYPRvsex6jliMfJy//Gbvz0Y0iZQaC/3Sa6Ny2b8DrBtYte
	M4Nbkod391M4HBWr8lBis6Mp5W1vlLk1cGzoVfZB4EvRPZ64EGBH
X-Received: by 2002:a17:907:a68b:b0:bda:2928:ff9a with SMTP id
 a640c23a62f3a-bda292920a3mr427430366b.39.1779310388764; Wed, 20 May 2026
 13:53:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520203318.31939-1-meatuni001@gmail.com>
In-Reply-To: <20260520203318.31939-1-meatuni001@gmail.com>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Wed, 20 May 2026 21:52:57 +0100
X-Gm-Features: AVHnY4LU9xhe_WiCvwDW3nY1nWmi2hDUZU0Ao5i8OnvITc6c-64a6IJubqmavh8
Message-ID: <CANk7y0jzV9RSa0KwM0xuyPc0egSrMFD+CaG1j_6NY4NZn1waJg@mail.gmail.com>
Subject: Re: [PATCH bpf-next] selftests/bpf: Fix zero batch_hash on CPU 0
 after batch_gen wraparound
To: Muhammad Bilal <meatuni001@gmail.com>
Cc: bpf@vger.kernel.org, ast@kernel.org, andrii@kernel.org, 
	daniel@iogearbox.net, martin.lau@kernel.org, eddyz87@gmail.com, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 9:34=E2=80=AFPM Muhammad Bilal <meatuni001@gmail.co=
m> wrote:
>
> commit fa747e9f843b ("selftests/bpf: Fix cold_lru producing zero
> batch_hash in XDP LB benchmark") claims the addition ensures the
> multiplier input is "always >=3D 1". This invariant does not hold after
> wraparound.
> batch_gen is __u32. After 2^32 increments it wraps to 0. On CPU 0,
> bpf_get_smp_processor_id() returns 0:
>
>     batch_gen =3D 0  (after u32 wraparound)
>     batch_hash =3D (0 + 0) * KNUTH_HASH_MULT =3D 0
>     *saddr ^=3D 0  ->  no-op, cold_lru miss counter stays 0
>
> Setting bit 0 before multiplying guarantees a non-zero odd result for
> all possible values of batch_gen and cpu_id, including after wraparound:
>
>     (any_value | 1) >=3D 1  always, since bit 0 is always set

You say - batch_gen is __u32. After 2^32 increments it wraps to 0

A single batch runs for 10ms, and batch_gen is incremented for every
batch, so for it to wrap we need to run the benchmark for 1000+ years
with a single producer.

and even if we want to benchmark for 1000 years and want to fix this,
then doing " | 1 " is not the correct way because:

On CPU 0, consecutive batches with | 1:
  batch_gen=3D2:  (2 + 0) | 1 =3D 3,  batch_hash =3D 3 * KNUTH
  batch_gen=3D3:  (3 + 0) | 1 =3D 3,  batch_hash =3D 3 * KNUTH
  batch_gen=3D4:  (4 + 0) | 1 =3D 5,  batch_hash =3D 5 * KNUTH
  batch_gen=3D5:  (5 + 0) | 1 =3D 5,  batch_hash =3D 5 * KNUTH

Each even/odd pair of batch_gen values collapses to the same
batch_hash, so half the batches reuse the previous batch's cold
address which is already warm in the LRU.
