Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804854;
	b=0CJRSkAnjS/8vjtwEuLYg/I1n1wEhfxGJIm7WaByC8UswQwo+8kPMABKS33rb4jiDUZ4
	 d1DcKU73d8u8it0FmZZ2fotGSPaBUEjPhnZh8Ci3IFOAiSP9Auhol2cuJp4Y6ncjlMz4/
	 5JwYTvUKkbtdcrnLj6CtUP0P+pgLm6AOWrDGO5/511Zv/8nouvVPlyJQPo9ofbsDou6tR
	 vmsHe91rM1Lqz69VK5yINMx0umvBPB6T0xX5fj8TQ0rh47qNTU1rsBzCDDgofphQ6WxRP
	 TJRMJbYt5PYCpPjZtAS3Otw1k1lg5wZd7X4MZLNtpmVqdbj2XDPi6Cur0vHjp74wQAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804854;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=52M0Mx3QqLQFvHEpAisibJWPHYozvMJfANyGg7k/AzQ=;
	b=UGs994rdRoV9p4O8qq2NKVSlDt/uIvtk28xxV5/hcEeYCcA5ambABG4902gyo74hYMix
	 MzAmoLFzrMQ1cZtRWeyEzvZWXu2WRno0lCuJugoH/+DrQtVcaR1gG8jdJKnbnqQQLzWiq
	 ZcrRnE1PvuF9qfH0Yh4Kv07hJ65s2oBL4q7qPB4EVeMY5m0QKBtjvp8eUTDLHnngVckRk
	 sv3Hyv2l7jCfZOVYmu186T02CIcR6sp2CZf/a1/FC8D6vVhEO3pnc1ywTuqWAZzhpA8/l
	 tMtn6mojQyujN8u81pRuUL9IQJbdN/gzgEnkMqu5fO4EvDkRg33UFfB6lO9LkE0eFnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KOx9SHdU;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837BD606A326
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 15:07:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 837BD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KOx9SHdU
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-704597ef1d8so328309eaf.3
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 07:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793804852; x=1794409652; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52M0Mx3QqLQFvHEpAisibJWPHYozvMJfANyGg7k/AzQ=;
        b=KOx9SHdUEll96Op2QsIzCBrIWWCmZ2+ruKEdyzkwfLr2LjnDrSJIV4Ay9x00LI/xDj
         eAB4pYrp3HN1ACvtIv8hAR7KIr3wdGmByYgXxUn0nrT2Zz5Hv9gxFWGrNl4ryqg9U/Dh
         5cQC77vJkN3xKzbs9h2/y2/o9Tnddr3FsL86inDGwNQSzTPfE76upOHgw7mzAc2GXfGS
         GWQyCmRGzR7/y0LupP7NQalHleWahuN6h/3rtQZeDG6dLNO2mPcziU2U0xTUb4NjL+80
         yVEtPauJFpSjvnaRpCLFcWS1f3bwVu64DfY5zzrTSTAqKvNzcLFIL7hJF1lJWwv5Lauo
         hFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804852; x=1794409652;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52M0Mx3QqLQFvHEpAisibJWPHYozvMJfANyGg7k/AzQ=;
        b=dJqSFGBgMasK8Fr4j/GFQxFIdYdQCZO80up4UoPSE2N05bPm/jrGhIPC22rDMPpnqK
         A4hgWN5Uf3koJIznfFoRq4qY5u6NObWVYr8ZNmqIQsUHGioiO5tYnWDVash1RfDFSdFQ
         Gha+EosViF09d3GyIYfSz7HNbuvxvOdrL9PKV4TMk3m9LQU/YjsUZ57jyP5jY4Pw4AHm
         1clF5QjzIylWfI1I30eFKfXG8U3SRFzC5idix/ZMI8BTMmgGUzHhhOm93cT4SZXXC8NB
         UhtNhRFxGyIoFesQELjTw6Nmw3DIWX9ynnp76xabyGODoxMoSdWm/WQWjBqH/eeekc6o
         lOFQ==
X-Forwarded-Encrypted: i=1; AKwUvByA/HBHKgrR2A5CeQuxjedrI10bt/ZlPBHiW8aE5EkSpudz1vC2ab2pDeU5wv9d6Ri9f7QVaQtfm/MGXXORwx0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6X4COxS0ny80rw+fKgpTSKygJFD9MHQxVcauRph358cGWYYbk
	b2J/RwZB+3LuA/Ez9lgICU8fAzFCelJUJTpt9mL3gWRGQcEpsAi/2RTI+Yghhf6VhJs=
X-Gm-Gg: AYBFou35WIWLugbu1vg5ZTq3QBfRaNrylw+esWLHexJsPRRwmQU4Rd7CK3zstrqu2Jk
	2wgNwaJ4sUqslwNJFysjRNojUDnVYk9b4JEbhAQT3T6iH0g1wg1/tq+mn+0DKfZ3wTtyZ9XIIRx
	3Zh6r6afXqW8VMNUMHg14A4lQSbdH+Kxi4+Ao+Sow8sdYynWqbx8XWTl232GLSu9DVcgFvatv0V
	z96QfekzKAPjYCrhcPeYGwpswojCi/BbRQA94ExdBa76rGeumXsh0crHUQlER53+Piz4qmqn6r4
	+eoblpV8J+dLNivASebDdV1PvT6oss28CdsHoui3nvqvfqJBqnDi9tBYX1/M5urzCm1ex37Zymg
	csEXlrIA4WfmnVvXteHYCxAJdzL2p4BFRqIesxkMB+oIBZ+Ge036rqUAjxoQGKmP4W/Vzc8Ftb+
	xdgCk1bZdwnbDyNRNUYu+zUHvfl6hUgPKuWy5OoLtrGcruqgMyoKw93G6ntnNpCeco3kRyNMAge
	WjScpD2b0dPXgRRWmcgZ1UC/yJjuMKTrNDx4OjmOLQlNUtt3pQ1NCsYaWnLj9HZrQ1vpwZmQB1b
	gvcWliY8aT7+1QHJVrje6tnevy6u6c+2Lxa/GKtkOnvLZcW3I9WqjogA+LBWU7kiRWt2wSrmxw7
	KRGVGWi+cFg==
X-Received: by 2002:a05:6820:a284:20b0:6f6:61c5:d929 with SMTP id 006d021491bc7-714f29beb3emr6788172eaf.38.1793804852411;
        Wed, 04 Nov 2026 07:07:32 -0800 (PST)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c0cdb22dsm1886033eaf.0.2026.11.04.07.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:07:31 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Sasha Levin <sashal@kernel.org>
Cc: Pavel Begunkov <asml.silence@gmail.com>, 
 Breno Leitao <leitao@debian.org>, io-uring@vger.kernel.org, 
 Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261104144623.3803717-1-sashal@kernel.org>
References: <20261104144623.3803717-1-sashal@kernel.org>
Subject: Re: [PATCH v2] selftests/io_uring: cast optval through uintptr_t
 in mini_liburing.h
Message-Id: <179380485099.4021488.15926225621505501263.b4-ty@b4>
Date: Wed, 04 Nov 2026 08:07:30 -0700
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
X-Mailer: b4 0.15.2


On Wed, 04 Nov 2026 09:46:23 -0500, Sasha Levin wrote:
> io_uring_prep_cmd() puts the optval pointer into the 64-bit optval field
> of the SQE with a plain cast, which warns on 32-bit architectures:
> 
>   mini_liburing.h:272:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
> 
> Cast through uintptr_t, and include <stdint.h> for it.
> 
> [...]

Applied, thanks!

[1/1] selftests/io_uring: cast optval through uintptr_t in mini_liburing.h
      commit: 699e7ba5915c8b2c76e257e157464f2bfe7ab8bb

Best regards,
-- 
Jens Axboe



