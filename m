Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C561369D71
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 15:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787585661; cv=pass; b=JySFJK7cgHCcOLEjvervLU7kObVO1WJqPsz7KPjcdJ+rHFdpA6NWg3bekRgUi/dCbS1VRUnRvRVhPHamYELRaF3aDTgHDMv8ov3yokLmRRbOuzPnaymQVP5mKsKIVYYDgk8DAKHqXRVuZxyr4zhOp1j9zBgN6lwCmkeICL2bUFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787585661; c=relaxed/simple;
	bh=32nSNOpMGPh9qRcnMJUtAsNx+M0mEPM+1sZroO1Jats=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z+4Xm8nJaMti/qjo9vNysq/nI/HDasZ4YZq6FjL5Srmy8C48Njg0K0xUldAdVdCgbfWegQrP5UB4NtjjdWG3mJqCWYNZb9stHH8VgftCfiEWAYf9C1cr0S8TQ/TfMytl8o0b2ex46FLzm66bhUNgSBNi/8GBJhJpE7wgrLUr6H4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=IWjewU85; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="IWjewU85"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-52d590ce5cdso24872301cf.1
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 08:34:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787585658; cv=none;
        d=google.com; s=arc-20260327;
        b=I8J4llXGAany07Vc2BL8yRm1YU8+9e+kB5MrlCFA8/36ckFNW2/J4qMkOnuj6oKZ3+
         6+KrKuyT5PBlE6GKc6IGofp+DTpuz7Md0QJvC8A6Vx+WbdQV+FbzSFd0g1EcEwEXD6GG
         cbXxz9KsG5jOjNC3/Z/nZbhpJR5o94MSv/ahVxfaYnQfji/HyQYD664Kh+wVH2Y20mK1
         svoGywaR99Vie+3d8S/YMAkmuuBVyZ4XGp5cE+dwjqIifxcU2A6V6DowK2QunvHnJYwj
         JWGKXpqVkM6LHHyKvXUOa6kXN8P8alBpXfvuMfQBWxUko3e9Jh0Kkqm6mgk2CcjpEaIx
         kD3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hycNtgvpht71cjHG2+Z66QrYTBlKhoZLRVPq0RXTZRQ=;
        fh=l/bo988awTrBNkqL8eSM2jlW4P69cutDUmWCt/gzUAo=;
        b=Rau4nVNs8AogAfpkQg4Pm/lMzjMhHm7qHlP8LY+pR1KTiOirgxx4X0omQESd7AtzGY
         yvnaK0/gGrdr0oCYOT3OjB9A6j06KjgDJVTo0zTzkR9yqcKMCpg/S7NhV5SOLu1Qpmrj
         5FZbLu4IsnNJcQvBwZTkQASXCk+81nmm8r19YZt3gm53hSFGOKq2a0jyuYncfg23fSCi
         XMOpwQ0VpQPKkNVNfPXUFUqPFXEeWzBt6DzgQbSUhNrC07fg+56yeDnCj+ExtEVrHrmG
         M5UIiHww8scYThM9Syy+35IytNsM6QzxNKnIQpZA3IASJuoZDq0Gtwx9M2wc1wI7tb4m
         rRGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1787585658; x=1788190458; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hycNtgvpht71cjHG2+Z66QrYTBlKhoZLRVPq0RXTZRQ=;
        b=IWjewU85OMrCxhBusgvyvPP4tlhkM/TwU+qUUOc+yy/jrdZFgf7HU5lQ1nU+FzxwJn
         B30iThtj6xcbSsaLCAEvvqDzssgzToKwWe1u2ZI2EpEr2ZPd/AwTNp23rAxDn4Z/AlY9
         mKaOSsUDRFgmW7BFrdBs4FvrC/zEWmlPhpdUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787585658; x=1788190458;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hycNtgvpht71cjHG2+Z66QrYTBlKhoZLRVPq0RXTZRQ=;
        b=RqOoxWxAbCrRt4O+VJMFj+nYIr9q6d5eHPFTqo+KZQnGLsaGk2lCaUX5r6OOJISK/D
         1XjDWxg6rr9nlPJxRz+JIgKuj7h4JkiP7nYNnxlkva6T0z17au8u94aTDdgx+h5RXEbd
         tZvmho1ocJQzXD9ntitgyFw/9iqZlxUp2ud/xKXA6F/gfK7IleY07alctuv26emvag0D
         Dyn0nJ0111Qxbs/BzvIuDR4JylZw3Tb5LmLYw9Yc2jWJewgGWf5hensZ8TVTHnns4NVt
         tQ6mpeXFxllHky0GxSVru/kd14ptD2An/MEJ9RhED+CWAa8G7ytPuYT7zy1r4fs/KoH8
         dEkg==
X-Forwarded-Encrypted: i=1; AHgh+RrN4m/FqXc+ICiqFnQnwj0bJrDXMcJtU/LarQ830xrF1cqGuAeARJXrRdIJFa9vCPfPKc2PdNb4o5GlCl9Za/I=@vger.kernel.org
X-Gm-Message-State: AFuF++lsAQLhG7bFhEzJK2MpmW2xSTFdNk2d80YEw92uI4MIN4p0rveT
	42Hp6AcVkT9ZulYg4YnluQZ6DmKlL56a7RsO0ervXMN/U33g5vJ4IP/PeDF1skzc+M/Z01uGQRR
	Z+AVLeUWDgSHPCK0/OHCS/pr4/cegf16VbZDQ1rzPlQ==
X-Gm-Gg: AR+sD11pHjYeeMyyeZVD8B4AHL+PJa4v7PT42A6GtzqasWlnGdVJnSWNZCSW4Jhe1Bc
	GwFua/RyKC2yXKsHugVnD6F2fwg4r9SbmqfwAzLMNwSCcFaDlLNyzMigwxlp9xLDw7GBfRz2a1R
	XnKKjoExB5QtfuyGNNwq6d7ncFK4sNiSPMqarnnJ46TinV842Lb9nqQB+OHDJHe7CP8aZ0y18Fr
	TbgzNdIBxkwnkqTQl/wSWqkIgYcYg357sMthiWfvX3vPtLM1jI3OhWx+nluQdKd7jcqUwrAPmwQ
	yjrhNwWMNcBt6U8TQs2m0PAvupvCgjcmil29g5bjLj4WaJiYOYZFwCm/kt93RWmbQSnaxCIV9PU
	pYks7K1BPsJU2CQ==
X-Received: by 2002:a05:622a:1249:b0:528:a8c:aa00 with SMTP id
 d75a77b69052e-52df56e1163mr281535771cf.8.1787585658497; Mon, 24 Aug 2026
 08:34:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824143052.1546163-1-jamz@amazon.com> <20260824143052.1546163-2-jamz@amazon.com>
In-Reply-To: <20260824143052.1546163-2-jamz@amazon.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Mon, 24 Aug 2026 17:34:07 +0200
X-Gm-Features: AcwNN1W-VnyK638CSq8E1OwB-y-_gztBKgOlAD0RqXrRmLoimit5mhOa4dqhUzA
Message-ID: <CAJfpeguP21v1thJytdPOfs9VByFcVNdMcnCHUUYteCm+Ck3qpw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] fuse: zero the partial EOF page when extending a file
To: Jimmy Zuber <jamz@amazon.com>
Cc: shuah@kernel.org, fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, jack@suse.com, joannelkoong@gmail.com, 
	bfoster@redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Aug 2026 at 16:31, Jimmy Zuber <jamz@amazon.com> wrote:

> This unmaps the stale mappings and zeroes the partial tail of the old EOF
> folio, so a later read returns zeros.  Truncating [old EOF, write start) before
> a buffered write keeps the dropped range disjoint from the written data, so a
> write that lands inside the old EOF folio is preserved.

Applied, thanks.

Miklos
