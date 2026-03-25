Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8953939A6
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 07:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774425222; cv=none; b=Ki3glYxTmu3Dqh9vLAcYqxq7meNWz/eczG+KkPCpbLXzkRw0THnKK+Wigm0YRpcTnFfB02W58HUmmUh7Zi1viBGcwaWKdO4BFqBNOM68X1g3TwHCfK6BQ7sW3qfUeueG2noQZKcNDL/YbawVzoczrmH0F+FneLyQnD3duGfOoU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774425222; c=relaxed/simple;
	bh=vN6wBNcg/E0LachmQR04aY7jqJNSwiOry0TOcZc/IzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+MWBtnIVoNDKj/YdsQiLxxCJuzusDCysE7SxM4aWua1xVO0dzmY9YWaZPCLBDS3Ey6N0tVWv1AsD9Yte0D12P/XlHpink3PzntPljdqZM4r6DFwLtGcJ7CxSmRgPiyF2PXyoZMXoi65vudAO+psXDtV0qcIgNd0HXJ4wGknpIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dc1H2Igt; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dc1H2Igt"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439b94a19fdso4439949f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 00:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774425214; x=1775030014; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m4aJhflvosA4YHh4ObVTuB21z7sXs0KVGarenqaPCOk=;
        b=dc1H2Igts97blVG67otKMcPlM7Xav/nrcxFnNzWjy46DSlxplYgNMl5vgFVnRSWvfK
         HYN9K86QzFNUyhHCqxI14YEb26K7jREHD++kbM44/6idvSKfP/PXbdJ/Rtb39uLnW2Nf
         WIB78EiP36ka/2/Jbfnt1trbzADatAtnf0PBItqrxJDP1yGDizTu+39SqMBOSqsqrC9i
         aGwUuCvTlxucUf+5UgStghr+oMwifXX6/nYRswAwb0ok1+FRj700KOhEj1Vn3Y7bt8mO
         6PqPKlTcnxt6Uj00iNLbB7qSzto0nM1PmLmPO1WqawfiYTXv7EwJPWraFOIBJFqf7bvf
         aIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774425214; x=1775030014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m4aJhflvosA4YHh4ObVTuB21z7sXs0KVGarenqaPCOk=;
        b=NqSO4Dt/0vH6OjdemRnprRHo4aO9zY7rDk1rj/QFv+Dqt5es6EuXHu0kmLqP1Pb0Lj
         nt8kiWdgv987X2yp+orC84qYPAcIrijSjgO7rPSrgsuE7Lo4k2qlor7HW9bdPP+jjW5g
         Jg/rNZvVNikwzJiHMRs4KPo6PeopUSg4WA4YeSjnQXYFI69ywxDMnnrThhYJzrP8usei
         vPQBzd5PStRuH28gH0vzgZLtWXyYW+RwJ2LiN6Yso0fBIDiXYKxt2Blj38Nkzu5ERG3z
         96ycmcQy6sihh3+6usMICqznfxG2XxCqIqpG6e/xd77Dm8g6XknzbNC7nlDld8VImVfw
         rG/w==
X-Forwarded-Encrypted: i=1; AJvYcCXvmazkTMcu7tajxS1BnfFccPjGuog1vjNa7VQsLVY1wTzPZ7euhl5WA77jlFc6s9wd3crVZptcOgsx3H/YOqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG0GjpFF4pMRpdV75kgj2/lOUw7KR3RPA6jMuacYoIxQedACWK
	kqL2E2fDAVZXppLCYefdjPT8vyi4PxTJfKNYBfL6hS2FJ74MZG6sTGPa
X-Gm-Gg: ATEYQzyzt60UTSSSIWY6CvXC94nPnmG/lSbLP2VOelXIVwCczvCCTacX2eMQk3YBiWq
	JmZRPqL6nxfHuPzEs9u8T3J2Wmpv4uIGSKADQWaPB/sM2mzVkTE4QrGxytNogRnkFYxrJw4bmvY
	FwtX5bmkfN2Lv1aKVjPp4oHoMD0cGhsQB+XIdPttJ7qwG5AtteDPXONJOAlTyfGG0MnLa8Urvfg
	rhVBlftXTk0mEWOsWBlkWAV6sIOnyvsZBkYJJ50e3AdSR6F5J4t4M36vcqCjkR60s0yC9I4Pkqu
	sH14Lm2ct4qS1+deYABIwNRyMST981PdcL6Iawr2zivgUrZhxvTuNVByhphCqalyp3AwxQqvUhP
	Dpy75uARZlelNj4Q7vgxFTdRJAOy2SJta35zTSNqDpOykD1Oq9fjYzTkfUptiWpPwLPZrUUm3zm
	BuMgPAZ67yha5NKj61kBUB7+B0cyIYyegEODf9jnS5BWMBNALBSy/syxEi122WwlFh2Xcp4pp8
X-Received: by 2002:a05:6000:18a3:b0:43b:490a:db51 with SMTP id ffacd0b85a97d-43b889c10d7mr3337506f8f.24.1774425213859;
        Wed, 25 Mar 2026 00:53:33 -0700 (PDT)
Received: from gandalf.schnuecks.de (p5b2e2f9c.dip0.t-ipconnect.de. [91.46.47.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b646b0d3dsm43087713f8f.16.2026.03.25.00.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:53:33 -0700 (PDT)
Received: by gandalf.schnuecks.de (Postfix, from userid 500)
	id EB824305DD2F; Wed, 25 Mar 2026 08:53:32 +0100 (CET)
Date: Wed, 25 Mar 2026 08:53:32 +0100
From: Simon Baatz <gmbnomis@gmail.com>
To: Wesley Atwell <atwellwea@gmail.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	David Ahern <dsahern@kernel.org>, Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 3/3] selftests: packetdrill: cover scaled
 rwnd quantization slack
Message-ID: <acOUfG2NwQOzq9zR@gandalf.schnuecks.de>
References: <20260324205301.1361608-1-atwellwea@gmail.com>
 <20260324205301.1361608-4-atwellwea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324205301.1361608-4-atwellwea@gmail.com>

Hi Wesley,

On Tue, Mar 24, 2026 at 02:53:01PM -0600, Wesley Atwell wrote:
> Add a packetdrill reproducer for the free_space-limited scaled
> no-shrink quantization case.
> 
> Grow rcv_ssthresh with in-order data, then queue tiny OOO skbs so
> receive memory drives raw free_space just below rcv_ssthresh without
> advancing rcv_nxt. The final ACK reaches the case where raw free_space
> sits just above 84 scaled units while rcv_ssthresh stays slightly
> larger.

While this may be the intended behavior, this test case does not
actually demonstrate this:

After the second in-order packet rcv_nxt == rcv_wup == 11024 and
rcv_wnd is 84*1024 (with your patch).  Even if __tcp_select_window()
returns smaller values as more and more OOO packets get queued, the
externally visible advertised window can't go below 84, as the
advertised window can't shrink (as you point out in your cover
letter).
 
> Old code rounds that final free_space value up and advertises 85. With
> the fix, the ACK stays at 84.

The old code is consistent as well, it simply uses 85 throughout:

   ...
   +0 < P. 19024:19025(1) ack 1 win 257
   * > .  1:1(0) ack 11024 win 85

// The last tiny OOO skb pushes raw free_space just below rcv_ssthresh
// without crossing the next lower scaled unit.
   +0 < P. 20024:20025(1) ack 1 win 257
   * > .  1:1(0) ack 11024 win 85

So, like the v1 version, this test demonstrates that the offered
window differs when constrained by rcv_ssthresh (old: 83, 85, 85,
... ; new: 82, 84, 84, ...).  But as this window cannot
shrink, OOO packets will not cause the peer-visible window to change
in this scenario (for either the old or the new code).
 
- Simon
-- 
Simon Baatz <gmbnomis@gmail.com>
