Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605C23D9027
	for <linux-kselftest@vger.kernel.org>; Tue, 26 May 2026 09:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779789485; cv=pass; b=Rgv9K+9BPJ5kEU2jBmZdk/QgRY6irrXlNNUvUsYnnapJpBkeM8Tf7kkxQ6ShIGf3Y5Q24M6gi7MW91ThHSeMouf4ST60VeKF5oJj8mBvmT3JFdbL0sQi9V+kmxzkNMn7T/px+g+MuZqJQNPwavSV1z37LKolGe68fg35AwVDip4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779789485; c=relaxed/simple;
	bh=1vetR7dKAm3MyYdlRUJ8boq5FgggSoazH6IRI5TMwsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aYoWkJylCNVzYlhnMHPbHPaklgbMV4A047w0QN9X+0beyKr4Lm5Noug9tE4Ext9vXPGRGNhmZ0Pkqza1OtxNYMyTj3DIwJP1wPNVwVuMajX7R7NY3QzML0Y4Zk8yEZMOast9FNa9UpCRC1/kCrjMSFUi95SswNSs/fM1YrYSGmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wUBOx8bQ; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wUBOx8bQ"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-134fe980658so11922114c88.1
        for <linux-kselftest@vger.kernel.org>; Tue, 26 May 2026 02:58:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779789483; cv=none;
        d=google.com; s=arc-20240605;
        b=hlLvLd+M1ffe1b/mTQNN3gJCuITr3dGGUOs88NHOO0QTELhGOFK4TG09NEGtuWcjnV
         NNzVoLLBAGvoM048AAlXWLtZzUDD5b+QhdpYdq7+/XZT/8W0IjXNet5WFzmrLJV0d0CZ
         iRLt9Of4BSxy6AEBNs1FE8Y0S3idjeB7qZ5YeXY5WjKv+8f7kqlgGiREJp1DYEwl4gQb
         kzqbN7iluTH8OsQKP1A7V12f2wbc4R8leXe8EH2SZstXcuiF0h5lvH9gMmXJSpGgJ91S
         QKshmPud9DPKnT1il/rmszDW7JPxgUE9z8w7OsrZo3JsHiCvTOtWShUtnSInYGetv06j
         hGvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=m1Rkk9mnZeKWDuLA0RmMPN5sQuIWC5Co8MuqgjiDHJk=;
        fh=qwCi0ZmvEfCGJYJHPpz/jOMpa7SlMfT1pjhxrYgfhyI=;
        b=lWU0OcxsiTLercmzsWAKi9DKaG5U/Pl+uT5RkxKsz5y0h4d8V9ijlNhRgPgxW13JFc
         iIOPqFdwNBAG7dNLoNGi2dYPBkA7I6kIrJKKbxn+eNTuHI1+WMkYK9l+HdJQF11cHLgh
         cQvQuTRryCFzXnhEJzo8bzcwJL6Dk0Zg8Z0TrJ0PeYoUp913ROHm7+1HIKJikvrjQFRA
         MwhnknUK8+O+Crhm03/AeTnFX0VuB0LZjhWLzWuOxkOfrkN6+U2S8UpI2QRz5A7mAoOd
         XrJVNAiK5Xy+J1mYBDFn6pS40+fvdHvB0hpmNGxlBau5Og6Q6uoa7zzbLdRHIa0ilnzv
         D8Eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779789483; x=1780394283; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m1Rkk9mnZeKWDuLA0RmMPN5sQuIWC5Co8MuqgjiDHJk=;
        b=wUBOx8bQx7lIebq/bhhxq5S9UzNIVuCZJTg343R5CK9+k0UG52DQJ0ybc1O6ljoBNg
         zfxnV7txUTUGPLqSRTsp1gYK3eUQ8SsVpE0+o7tcpjcruZkK2dY9eieGDZRVQ5N07AEf
         kHMpLn6/nHNNkhGkLT2x1wgDpH26XlbPnlaoXd4hWtSEN/u5XOQIcLrxdbYmo7JFXgVn
         LmEpwDfERtHalSJovArs+ZHISLrYhB4f5lDLvTHnkOqhRkPsMgfsS6BFGrS2z/lYE3M0
         S4yBFtCzVsaY+MxKRDIjV6gbl4f1n1O253r0V+j5K/FJ/4AJkpXwPaIU8uLMkHMeDLEQ
         s4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779789483; x=1780394283;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m1Rkk9mnZeKWDuLA0RmMPN5sQuIWC5Co8MuqgjiDHJk=;
        b=aBVi0Cnwm56PQAg1Ur9TpHjywiDmD2V6+aRunkvClcbdYZelxkSGTRK8fJZGKwEqBQ
         paS912WOTDRVTwNQ8H3Dms87+xWZULYkdm9aNS4eeiHP1tNjofQiL92VJw/r71yhdOEO
         jXWPVwYBwm1B/zbn1hYErBi4zdSzFVaNBlsecs8kYc602GB6dnhIiuJ1cgBMUHJGYVIi
         o4kGAOv3q1w0E7MiFg1rzStsTfOTT/Iva34MYipPyYXAW9UG4vyLGru6yEm1G+SLsl2b
         aIGN6Ksrb9WKzUmNPa725vltCs1aWaNnwyXsuKsIPnKXO98FaDU+xQdEheuXIHREe/Md
         vTCw==
X-Forwarded-Encrypted: i=1; AFNElJ/MdcATCDX+g5u+Pr1C8K/5Fjl1SnryNgH1FuTBbCk4hGUGMgVuY1VSEgJ3GIydVN/bCLEguaZiFYhzBQjw/D4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjxNfQs+A4rwKVe+1yHb74oFZX28BBOfEbkLXQIF5IlUEfqD4O
	IWJtMluhFYAR0fW3h/7fqIbOUlJ0aunJGGEbfrUK9OEx4YutKnwUpxP3kl4AP0dOw9CznOyTL9O
	SBa7pyGRHgoa4Vuy67B/SlOSWZG1C1gv975wKhgLpP/zN8BtRNzu7LGIx
X-Gm-Gg: Acq92OGXImiqooj+txDQAlc9cQFADWT0afmZ2o/Eck6bVeBKGTUO1n9bdGbCSWkHWYz
	CS0LRi7so/N1ssV0RFDt+/8CmCy6jouBOi7hn8Eg64icq1/ozjUbjInfcVOjjDXNqVSsHL6lRc2
	7utBdx9yi1smIG7VvaxpQS/aGs8cmXAOylLaQUQCugeNt34P2JwJIE9PV5L0cnrnq77jhxZ3VHW
	xOWZKlGb5lYG6zcKV+/XFW7c7CTVn1Zxz8BFd6/riBDseXp2nvtiFAFfa5Erol2QDqA61sbxU/f
	/EhdSNeD58fGRihiZAntyfwUZNXaDNjn1MSME5fE/bKewwtchXhoPqZHIuKD
X-Received: by 2002:a05:7022:2212:b0:12c:44a5:fb4f with SMTP id
 a92af1059eb24-1365f6fc55fmr6316521c88.10.1779789482744; Tue, 26 May 2026
 02:58:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524170209.37874-1-eva.kurchatova@virtuozzo.com>
In-Reply-To: <20260524170209.37874-1-eva.kurchatova@virtuozzo.com>
From: Marco Elver <elver@google.com>
Date: Tue, 26 May 2026 11:57:25 +0200
X-Gm-Features: AVHnY4JCYMwvf7Cbmd81wg_CSeDZqluQjY382Br4J9nzpgYJCtCTGJUz74YeYPo
Message-ID: <CANpmjNPhyQP8-f03y710Fbrg_B3xaguiUCb6nninEgZ3S9mWqg@mail.gmail.com>
Subject: Re: [PATCH 0/2] selftests/perf_events: fix test fail with optimizations
To: Eva Kurchatova <eva.kurchatova@virtuozzo.com>
Cc: shuah@kernel.org, brauner@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 24 May 2026 at 19:02, Eva Kurchatova
<eva.kurchatova@virtuozzo.com> wrote:
>
> This patchset fixes incorrect atomics and volatile usage, which caused
> test failures when compiler optimizations were enabled previously.
>
> Eva Kurchatova (2):
>   selftests/perf_events: fix sigtrap_threads tests fail with -O2
>   selftests/perf_events: replace volatile with READ_ONCE/WRITE_ONCE
>
>  .../selftests/perf_events/sigtrap_threads.c   | 42 ++++++++++---------
>  1 file changed, 23 insertions(+), 19 deletions(-)

Reviewed-by: Marco Elver <elver@google.com>

Thanks for the fix.
