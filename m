Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4EE37107E
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 18:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784917592; cv=pass; b=a2667NOzMdV0U8AeiNkbulFPe5P2okC85+vA9fDEu1TFam2Qq+SLp+E5qMTZp3OOYtHe1xxBtx1tGVApHMfmIHifcX0RahG1xpSKY6H1KCqOK6RUSavpwnHBlldyCWjhBcNWQooMX3gUkzffa/DmAsj1e6SsZWwLT0WbPVopFKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784917592; c=relaxed/simple;
	bh=5rexuoMTGFGiDFyDFg1ZawKOyh2RYIxLwEsGrqQC9eg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A0qzQar3XZl4nP+3IMBykmh7kFbbZgO2ZgzgDWivDQ2MmcGtqoH/mwvcYGweGUk1XwNfrqYymFPMneyfhKsPVjBO92ln6XYvaelcJTvHFXUB44QzO003nyDbm0/tV374iF3uu0LdXuBd4N2LioYFJYey8GpFuM+1jxtnSidoKTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WALn3aSp; arc=pass smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WALn3aSp"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso623929a91.1
        for <linux-kselftest@vger.kernel.org>; Fri, 24 Jul 2026 11:26:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784917590; cv=none;
        d=google.com; s=arc-20260327;
        b=r2uvpT5gjvOzULdlBPREeE3f+sdx69K+YIcZrnzw2p+0+DGhl44IoCJBjQqT5B1ODu
         UuI7O2aOnTq1PDAeLVKMLknnOMt5v5PWY20TGaGhs5RQgSiFfiyIQ76FedPXgB05aGKM
         QsF27ul80sKM1pAAkWKOKHa36C0Z7nqmU9g0hlwhaTfLYMcX+HyEDcPTK2m8elTy7ZrE
         zHAKYE+LrNS9PMwES8bQboLfnWKTCcsxiayy7Jiy0U0VXf5ZZ3Mx3Y22Gw5yft6Gjtwk
         rMYn5d34eZsViOuNCn1dDgu7x0hsx7f/lqPJx6I8ykgH9k7/Y4btOxDX9nFoZxjY1IOD
         NC4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5rexuoMTGFGiDFyDFg1ZawKOyh2RYIxLwEsGrqQC9eg=;
        fh=ls7XFnutoFTGUPPlvf2r0aOzMmKroyKgPYyhVRthHms=;
        b=c/y45WIOli7/FCBToJOrzbrQ//z6a57QPo0RKt43+Wu06uS75NKyVVY4ThgrJ7e4Wm
         COrNYFFnvRnjze8leD9tK3Fa6NL/cPXU5K9W1M0W4ln711tbqaSm+IUUfI/wRoRnhtSY
         U9qfsgyZmckoqFcwSdhJvzvl07hiaei5IbqPLIsTYhRLyM+cu0FVh9t+ms9fI4irUiNh
         wlFaJA+1GTNXvp1zzaXglkqHygv/jqtDnbbhFW+HSwIY1HHlEAP/G2GjbHeg1DFvhfkH
         yOzMoN7WpGI0ShvQvdEI5TfQitSp2atEta/aBWBd7EcUfvZop6b1o1mXII29riD6iOBk
         8u3w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784917590; x=1785522390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5rexuoMTGFGiDFyDFg1ZawKOyh2RYIxLwEsGrqQC9eg=;
        b=WALn3aSp1/SSBTPEKpUa2lhH82Vbcfwlwn98EPNgxNbHUNXyjHmbVZBR9HRLaCAmC6
         uICCrWzYdDj+RjgjUODbpjRD62cxCQ3ukd/tVlcmMnfG9uLZkrycL0aZUKTeDipzEsIH
         E8u92V2Hvh5mcLParXCSP5H29Zl04A9j98fEGYxL/0KlXrAfoZgbgQxTJLmtFEOAsvMo
         jrgQfy3pdTwOlMhDRcOn0lsRrWAKSC5mIKFUklYHwfAjUtz8UbraBMktHZjQMBdViCXx
         mDAGBLD4/CuQ07VNG21YWtMWcuM4hznaQM99IUEXolz44OxCcNLEzjVTd+rjeuuxSw+y
         V/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784917590; x=1785522390;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5rexuoMTGFGiDFyDFg1ZawKOyh2RYIxLwEsGrqQC9eg=;
        b=GgwHTpvpxZzuyti6atj6fbVqfYV2kDwj1TnNcFdaqm730p9KeOiCrcfWBSdaojGdyj
         DGNPdttNqufrqxQy4mIHFXimzxj3SIbxrX8H9+u0VZq+598YsEP21FPEdSzamyLxbaBA
         BlHjdpFusGHcqw+ip70sayG7oyk82G5k8WdYipKglQQPVWPEx+lX6pYnl+/Q+vwPBo8c
         Kj4byWBu2cxufl8GYnnIbI+7gcdgRXTmyGodteYyGcLxWlpf+D6Ql7E7q4ZYCd0yvZWU
         Yz5OjykYajwTXLsjVe9zoxyBTzMMHljO+Yoa7/yxSq/m5/38O8UfqXSv5uJKh2RWw2u7
         /JfA==
X-Forwarded-Encrypted: i=1; AHgh+RrqudVktUPKSkcIFdYCtZ6J1BaUpI4YFlWC1SRAPf6xG/ewZQ18R0iRs10okPxaFeZiNReraNLXAqcIw79Npt0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC5681NA6vWFWgy0oFJ9MjJYyWvyifZHMQAVpKnhRSUaFrPdNn
	PSznFZNFI14WjNVNbq0WxivD6bM8U0peksR0sT9zZsQu1NpuxAzLxX/JY1McbOCo753GUUIIHsa
	VxSByzDHkaYYj0JVDgjgfFNwESsxyv2NaVzGkj7o=
X-Gm-Gg: AR+sD1120VfsSPmdVY55t13oAY1pn+f0UuS9XfXIJIImTJ8wWqlnh5jiyeJG2dA3XjH
	qXRW0dlasmYt6W5wA3nJXe1nUIfvV/NTj2M3n/N0W9NWBXjCJEbvBXj3GD2digv0kF0rNDI+PxN
	NqWjlIRRzZI+WwsEWi4+/8nBuglWgsm9cjwmJAOmFyR6GgrlCBb9TWrsWskni56fGxkiLD6BuG9
	9OsDqpsMGIrttDs+QVIBODrWZLfs6br975bIWsztIP3/cxvDI90I7MX3PoBeWhD5Tk47kzcNJMw
	0JHkVkfx15rZNL6TnwGq6E6C1DVPSrdVHSuV2csh3s9JIFVD2AlI1BfSn+QAjWUdAc3BwGuP5mg
	7VCoMF1/+/oXU2g==
X-Received: by 2002:a17:90b:3c42:b0:38e:5c6:4db9 with SMTP id
 98e67ed59e1d1-38ec64f0739mr8186435a91.11.1784917589576; Fri, 24 Jul 2026
 11:26:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710025144.2000000-1-wakel@google.com> <20260713020053.3897259-1-wakel@google.com>
In-Reply-To: <20260713020053.3897259-1-wakel@google.com>
From: John Stultz <jstultz@google.com>
Date: Fri, 24 Jul 2026 11:26:17 -0700
X-Gm-Features: AUfX_mx7H6DP_4-PWEFUdRHivEdqdvdjfPS95D7ftlN0cDz7fUqi-HalIKPDJVM
Message-ID: <CANDhNCoiXM04q2PYOFwAeupZAQJGWtHoSBTVmo-jK6Nr-OSE3A@mail.gmail.com>
Subject: Re: [PATCH v2] selftests: timers: Make sleep time in raw_skew configurable
To: Wake Liu <wakel@google.com>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Shuah Khan <shuah@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 12, 2026 at 7:00=E2=80=AFPM Wake Liu <wakel@google.com> wrote:
>
> The raw_skew test currently sleeps for 120 seconds to estimate clock
> drift. This is a very long time for a single test, and can cause
> timeouts in automated test suites or CI systems.
>
> Allow overriding the sleep time via a command line argument,
> so it can be adjusted if needed in different environments, while
> keeping the default at 120 seconds to preserve original behavior.
>
> Also add -h/--help support to document this option.
>
> Signed-off-by: Wake Liu <wakel@google.com>

Acked-by: John Stultz <jstultz@google.com>
