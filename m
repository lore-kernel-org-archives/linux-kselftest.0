Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0C8282F38
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 21:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779310831; cv=none; b=BtGO2l+vCVpx/EaSzLaDApviLVHjHwqcDU1ZKqoR2IF2S2asF8yBbloUIa1IE0H6dh/kWCODUb80KifyHaOoWCmeNSwVvtRgNnSrpwIctM+i34lMIvPpJh/sMaVnYStDRMPYZX3kn7VVvGg36HdW0QyUQN8/EZaduXvSlKiS8bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779310831; c=relaxed/simple;
	bh=ZGOU1vQ/drVWDurk8croKUjP74FWpTfm1pbAYUn2Okw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sN4UMWwVa31faUUCXQiXB6HjZGQYfQDA/ASSvEKy9hklk0HkeoI2cOoDrbEzPQdGv0dT5OBUNuLojwL8OgcWCqfYwaY3iiAVq9vzsaDUAKxD0VZrshJ34kfnA3ja7Rcghc7ELjw4pyfnOfb6xfHtKbQktxVCzS3s7dmXn8qhht4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCT7yubU; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCT7yubU"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2bd2c147abaso31879795ad.3
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 14:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779310829; x=1779915629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+w/6O06al13m4KjZS8ZlckD5KFM3OymOCn+QhhhktM=;
        b=hCT7yubU14sisJ8ogDAqTxUyrQ9e2zndSFKIS0xuKgCruYqiywnrssVmgtV0AQSdD0
         Lf1sgF3Scj/68MgpcqeVxr91muuQJ3EvoABzRgMrYwtjd3solPZnpuvfz4cIgi+7hgeS
         FG/KPnvqVAIYloJxMD9bY6wupwzYyXSr/MrAaYyHI3QTkTonj+7IfC7PPHK3o99WEbve
         J004zRRHbf0f491Wds58n8QqC+FiSU4uR5FxxuQLE0+Iwcvon+BK9PN4D1IFsn1Q0WEc
         2rA6Gjt2HhGXMuBRIDr1FbSTe4bPZkqVX0ruORqebzyAZWzQg0t1Ci5hfB3jdu25vPBa
         /DiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779310829; x=1779915629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0+w/6O06al13m4KjZS8ZlckD5KFM3OymOCn+QhhhktM=;
        b=j0iP35yFhkPtESywwXg0Jze70hrlmpEwL+a0GgLE+QCsgbqINShnWYtMB/swNSnh46
         /reX/9y0t/Jsag8borM4qN+gVhR+uZ2iKuYwGsIM2xME0WzKUjR98m0y6zN9DYOddaIt
         t9fjbVIMGRP8zPa7kVRL0zQxPPIwxVYoZ7XnOKmVUo1DXzeLVKYjUIIbRvpm1OSIqCst
         CNdxnTIJIqLEZagXSwr9aowiLyJMhejFYUr1g+0ZrSlmaGr+pudqzwsDhMnqxikM9uQ0
         OfFRs4s+8O9HJmsobma+xZl3LQ9QLJOovl86uhOdRXjIkvSz7eK71nb6wvpKZUT3XiE8
         EUqw==
X-Forwarded-Encrypted: i=1; AFNElJ/iYkWyEhzKAaQG/KHllEPS60kHK77WQAeTwL2d/Qc8sgzZ0B8Hj0qY89ReTyS3tf93D3De4iqFLLlOZzxLpzk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi+7HoBm1DSvqbmlDp77bWSWIEgse4FI/rPjSueFlH6BtWyajZ
	TGCEYC6UhgWtPf4CsFWKDE0QGaz45cgNRW1P05wwbSNxh6tTtBthEmYz
X-Gm-Gg: Acq92OH/ca4/1VZzfEa51uVZcfhFlv5K0DztDb+U9KGp4MNhVne8/O2pQqYWJtowdOL
	O+QYyjOksDNSPOd5cges57FgN+mjGplorD8Tel4dT1eDqCGb3XdeoSIbR7R0JoyGINv1Thpne0t
	kg7b6bFHxRaXRi3svMl25BAe1a3dLP+6ahPqP1mkLoVacs+khG5RdxGvhJ737deOQz2NLiXFMo8
	fJCIHLUGy7pNVvRehkJB8CQDg7q7JoWL1BV1RNvMVCjEo74rLjEJIrvx5n15mr0D0QB5oAibdRw
	C9hexv3uhtT4k61JUYx7jRAdrxLViDYpwNLfOEf+dAuiocOYOqYA+j7Re8HUwNvQhHOB15blQ90
	DLOycFaYy0bd5YMGRBHKccYGfsR+bL5+OB8F3PeRj6mm0XZx/EkQ6gkmHWHVx4kCEyHp2K5lXRb
	/3nlre091mzIkJbAdQ9UwvA7ArYvZDbkhMMjAqfEKHHgOc+/kzZ6d55IT0E7hs0080Cic7mBY+r
	Mc71mk9KqEyFjjf5JDb7DpCkUtLVF8/yRFcBYRNX8Nyglk4dYTPegU1MdKxrV/qGnkwu9BOnPFg
	b9MNoW3bQ5D+vws=
X-Received: by 2002:a17:903:3c30:b0:2bd:7ff4:ab0b with SMTP id d9443c01a7336-2bd7ff4b216mr270260545ad.39.1779310829236;
        Wed, 20 May 2026 14:00:29 -0700 (PDT)
Received: from codespaces-78f0a7.2t4prynt4dlezbzls5ze3dxsqg.rx.internal.cloudapp.net ([4.240.18.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fc47sm222229175ad.10.2026.05.20.14.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 14:00:28 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: puranjay12@gmail.com
Cc: bpf@vger.kernel.org,
	ast@kernel.org,
	andrii@kernel.org,
	daniel@iogearbox.net,
	martin.lau@kernel.org,
	eddyz87@gmail.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf-next] selftests/bpf: Fix zero batch_hash on CPU 0 after batch_gen wraparound
Date: Wed, 20 May 2026 21:00:14 +0000
Message-ID: <20260520210014.43330-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CANk7y0jzV9RSa0KwM0xuyPc0egSrMFD+CaG1j_6NY4NZn1waJg@mail.gmail.com>
References: <CANk7y0jzV9RSa0KwM0xuyPc0egSrMFD+CaG1j_6NY4NZn1waJg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, May 20, 2026 at 4:53 PM Puranjay Mohan <puranjay@kernel.org> wrote:
> A single batch runs for 10ms, and batch_gen is incremented for every
> batch, so for it to wrap we need to run the benchmark for 1000+ years
> with a single producer.

You're right, the wraparound argument is not practically relevant here.

> On CPU 0, consecutive batches with | 1:
>   batch_gen=2:  (2 + 0) | 1 = 3,  batch_hash = 3 * KNUTH
>   batch_gen=3:  (3 + 0) | 1 = 3,  batch_hash = 3 * KNUTH

This is a valid issue. The proposed change introduces unwanted
collisions between consecutive batch_gen values on CPU 0, which is
worse than the current behavior.

I'll drop this patch.

Thanks for the review.

Muhammad Bilal
