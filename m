Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A7837C930
	for <linux-kselftest@vger.kernel.org>; Wed,  3 Jun 2026 06:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780467491; cv=pass; b=vBrVYzZVGtvNVHjvuLZPsCLKXEnxEw0ID0UW0tqjZoZcCEgyWoR7Fzdz3tjiynnk6x60ppG6vvSnlmz96agRgNX53EvLXw/36TWg5aAm1V0wHHjfaysj+gtp4ml6f0QH87RS/v0YeKl23lWK3rIDjh7V+212722jvzVZlojOzdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780467491; c=relaxed/simple;
	bh=bL5WjJCjXJvF9xFt3r4cbl3N1UtZ8aJ6ft3GZi2hgzY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q5zVQvMkH6eDLS5oc6QTiItyR0mv5Kmq+VRtcaXpzvqMVjchZFHvkKa6NCOVKOcox6dB+5agR0A2/fhhBdk68MU6wyT1hU6GiWqbrI5K2/62UTCnC/5GjnJ45zXNsf3YyG62z77e6bJtsCut50dtycEnGMg2JsfcIq1hMKhus8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fXqNaG9u; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fXqNaG9u"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-842358aaf36so1380256b3a.2
        for <linux-kselftest@vger.kernel.org>; Tue, 02 Jun 2026 23:18:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780467489; cv=none;
        d=google.com; s=arc-20240605;
        b=RjCaxIBm2nfghYbpY2AcLjfwfPkcpC6B+ncXr+ASGq4/5PpGW9ayZrXZy6NGyRIOsI
         epR/kLPa/kdIkyzlJdKF75H23BHHJIIEV8dtb0mFL87oFkO8hvC7eMV6lTbdfwyEGf12
         23V7ngeikyz2AAalAnJkSVyKpoGIbfesTeKSWFZHkuVCStRuyCKpaM0g8Ln8m3i1sdNx
         kI5imgbBkE3xq3H8fA4Y9bsqZBG8AJ7GuIJnxqSNnombEKPVWAN+WvdATuv3Lz8T3Mf2
         9188qs8DPEcAwraWtp/kDDO8+AyAATzzJUU1yi6L8jFDLYdVhOfAgA/KSRpmCf9ANb/S
         BBpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oBLLrxW2wDW4ZLzKns+3i+smVKO9Ms/w2gXaYYvz5uY=;
        fh=fyM6F3CYt45i8BaQ62EAq1nklDA6efgsbEch3XVbzeo=;
        b=hJgYL0tFjj/HuaOCiZTfvQUUR8HOwlkt0xxKrBTcb8X+o3bMVSapJPr7frX0gPReaQ
         sqDeK14nDTHnrogrmf0dJNg3IeNT5W0jP3mlrszTN5tSzcI+hPUrvsaJoX/Q62q3ChJk
         02MpngThZWBKItPtFR2Gkmp9DLprhICCTQog7/FoqvrnGMW1MOS2QswdeqV/5U0fpeFE
         jTR99P9xUcB+8nnfGY6Zkv3S1DbIj5VqyH2s2qW+wZrz3HNbsUUu+cCj7535LnBiRmhs
         kL6cihssG1VryF123C8chtgYJwW7ZrIKyB/gcV+1wxZQ8fuLfW10a9LYdMWuoXVpyBqr
         IkHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780467489; x=1781072289; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oBLLrxW2wDW4ZLzKns+3i+smVKO9Ms/w2gXaYYvz5uY=;
        b=fXqNaG9u3tQZcm8Kzz2NocSfrdOnp70C7kQvaPjoqD7+y3tO7R9g0+IttnQ2cdYBLO
         J9eIypE71EiNYjxu744TAJVuRlaneNWKVbSoM52C4kj675KHHSoOLehhQp1pf60sVTU3
         uuclUFU75wu8Dbz3X9ELS7NcAaiMT5lXtmH14MPuN5GgU5kfuhpLAVM/YaUNDPa+im/g
         SUwLDHLfwEx0Ld7uzKk/AscVOK+GdeLN67EKWcqkW8j8/rhlfqcE1Yw948lHrLIpByh+
         yB1wbXyTd+Eb5AsljP6B8wNAKFzlJiiSCGzLOnxZjlqm/xz6pHnrHYQP5mDy/1W54Mbr
         U0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780467489; x=1781072289;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oBLLrxW2wDW4ZLzKns+3i+smVKO9Ms/w2gXaYYvz5uY=;
        b=nb5FSaVWjlZ5neGAAh/lN2l/Y6LvMq/CK0S6KNbNEzU0vzeDmeoBasf8xqDfdVeTIO
         3VYHKW/QHpVCzDPsS1IYzJ9z2VK7HL2LPps2SAya1q1WxAaKEhmzsTRTOVUw+m6iaSb9
         HJ+dHjGzVSVeC9Ri0Vd0W4RKdD+K82RVEhadzcNKB6U54GO6Lfn3h9o9uo1NiO6dqB7P
         qeoFxYJLEcgh1spvZNrT32duqWEWGXFRrf69pVGhDL1ym5I4CBkLf7XExzP718CJIh8b
         7BkWAW8UjkZRbop1m4I1KakYcCcHiE1nFrGymLkhbUIzXa8Wt9y+9LgaeR4YsbRDF88E
         1tYw==
X-Forwarded-Encrypted: i=1; AFNElJ+F5SvtB4pezuQZDUxw9aWUWBJRh80yh1UkZ/gsibqIsEmau/LPRhB3KzWJKreOtdBl0TIth31LV5MeklDfsO0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqN/xUKRsFDsg03nm89r7esAh1tslMgj16G2DC/I6Q2rgyNJFx
	bZyEcmY7+6XBiDQTUUHY8uNavMLTJskMCCw143nCNPIdssbYmLEhPLt5+5W8wt2OhzQ/p5vQsde
	uf/iHXgHMyX4GBmf8EvuhWJddhQktYNLpvVX6zWoz
X-Gm-Gg: Acq92OGuNNH9tDPHjcNjNwNBkuiY91f5Yse+5zj7jZODhnBLtwvz5APVC7EONrmMDd1
	IvpG6XiKfGdJl68InqH2xKMRGUL5Wq5Sa2XX7aDsA/w2Tsf0DjgysTgrG3elkv1cADGruu1Pa9f
	c7PiyF3tsUPza474JgRSEKKrBrn6mY7zMs85pLnylfrjsDacPmspPSBfWShkxEvjLV/IfUcwfeS
	e+uMyAHp0PBDR0rjqeQ/BmBDI0eAstK00pbx/Vk70h3Gm1B4C29Y5NZbdZvkigHOqDoxNv11HEG
	Ik/nI7dn1Z6fvF0W0fvaJFyCNhyfgPXa/tcTV9OkPP04mQT/
X-Received: by 2002:a05:6a00:32cb:b0:82f:559d:ece3 with SMTP id
 d2e1a72fcca58-84284e83f69mr2124809b3a.15.1780467488736; Tue, 02 Jun 2026
 23:18:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601065126.3623867-1-wakel@google.com> <20260601082406.GJ3102624@noisy.programming.kicks-ass.net>
In-Reply-To: <20260601082406.GJ3102624@noisy.programming.kicks-ass.net>
From: Wake Liu <wakel@google.com>
Date: Wed, 3 Jun 2026 14:17:31 +0800
X-Gm-Features: AVHnY4LLdXISSVFHpy2BmKLsbqoYtMlHB_d8f8JNdOLhORfljecW5ic_WnNpXqU
Message-ID: <CAOcRiAHSz8GkSQq-p+rAkLMXYEkOY63sQqGb4bBStayxveMBsg@mail.gmail.com>
Subject: Re: [PATCH 0/7] selftests/futex: Migrate requeue, NUMA and robust
 list tests to harness
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	linux-kselftest@vger.kernel.org, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Carlos Llamas <cmllamas@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 01, 2026 at 08:24:06AM +0000, Peter Zijlstra wrote:
> Does this affect being able to build tools/testing/selftests/futex/
> without having to do the ludicrous batshit 'make headers' thing?

No, this series does not affect the ability to build the futex selftests
without 'make headers'.

The refactoring only touches the test logic and assertions to use the
kselftest harness, and does not introduce any new UAPI header dependencies.
All recent futex/prctl UAPI definitions (like futex_waitv, FUTEX2_* flags,
and PR_FUTEX_HASH) are already guarded with fallback defines in futextest.h,
futex2test.h, and the test files themselves.

It compiles fine in a virgin tree using the host's system headers,
exactly as it did before.

> If I cannot build the futex selftests in a virgin tree, then they're
> broken. The selftests maintainers have time and time again shown their
> incompetence and I'm sick of it.



-- 
Best Regards,
Wake Liu
