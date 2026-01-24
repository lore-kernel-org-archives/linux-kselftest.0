Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C7F13B5AE
	for <linux-kselftest@vger.kernel.org>; Sat, 24 Jan 2026 08:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769243769; cv=pass; b=nQMbevKXD2SvGRrqud3pl8UYQ6ugWX4KHMrohC/ppQkNbVM0zYS10rCdBaV2hdRjeeRbNgvObP5M1E9j7toOubO/Q9CM7zmucAgmHK4xaHf8tVjNLH+VHo0pLK6mP0o7IMMk1S6nYHTBT8Gc11nOsJB7HUXQhBzv3rx+KIwx4rE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769243769; c=relaxed/simple;
	bh=MLt6bQqDMGJm2ueBTrriOTca8kUR+hoP3hpn5JBC/8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B7xg/HOCgIxPKoeLvreDFvmyOKAyaX6gqggnBpTYjR1iJHKiqgy1DvlvuYL93nDyK95qn1MCO2qR023epNPSa8aP1cGHtKGUpjPEIZCgRvPCPVbsrXaXQ8msy5el6eUiiSeeF2ZZDAlnEPZEpQUwTbvq8WU5c6wDO0+jaQXL2R8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aaLUe36D; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aaLUe36D"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-385b9be0759so25895991fa.3
        for <linux-kselftest@vger.kernel.org>; Sat, 24 Jan 2026 00:36:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769243767; cv=none;
        d=google.com; s=arc-20240605;
        b=jfv1Tgv64QCzuJ7iafRSV1FjX6ZwVS6SpNIot01D+VGt4Cyc2ZdmzpO4A+nEqrYZhB
         T+Kg1iKhzSIdkrrx9u+Lh++0Cjfwgx3WQ7uOhEntwWa1PwxT/8khhGqh5/CFTaqp42Pt
         ZkL4paaI979JmsXLCV0auk9QqdAmFbeDp70Uo3aPPcnH5/NgvjSmXdbk15g3qRJKhOwp
         d/I5JOz5c+4zQi0eRpyq49k4k+/ILPAeCG0nL6/Znf6QdseQQm4s+rd8W2s5oWlDi8NO
         KB/iL7VOLz4L1F0UoSamwjR2hZsWgbssxcy8z6m0+VlPsgcyKBi/1lQHHEPwJ29cQjIw
         cOpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L0Yvi8KKr2tGeabM9tjvJ69j9ESj62Gs009Amzq+1dU=;
        fh=jneOFHjStxMUVqS3wyh67POQS5jF6Gq2F06JGIqmBfw=;
        b=EfnuZ1E0x1py9K7CAgMqdWeCggR/IOsoXlaPUTCGYDk9zmtRcojbZ0mduMq4niwkiU
         hCQg9QXlNXJWChYUOr0dyzuQuD5b17XvFsp6RuKEeETWHk9s+8EcWsFtzi8dC8CRNm7/
         KB9eVmVdpr9C1sdmn7VV4Bj81qH9nMBxZKTKKuR/iWdM9+DkppRpH3tPP7FxD5K9SYEL
         mvJzQrxLZrK/IZuvQ696M7XMtgP3EN62xH+j6y/9e2a28GjPA91wY5c35WtboicB3lnM
         gaqTg92oLNN343dA/nLBez4ir/HJIPKm6+9YctUoC2qBLdWK5Avx6G09fKe41zLv6+TA
         RVag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769243767; x=1769848567; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L0Yvi8KKr2tGeabM9tjvJ69j9ESj62Gs009Amzq+1dU=;
        b=aaLUe36Dm/yPEY1xhhKIDGKMy9j5B5+LWz40HP1hLPf8g7GdS31j1aL63VKB5TvuUN
         hE/9sVJTgK6SvvrJtMt8aEEPXXDJrIk/JbDJ6oJdk7ByYjd0u2DSb2xPxGNAwDSsmMPo
         RyrIqCqsO5F0JB1kraaFWyTU8UXRMyebD2/c4v1NvBcRav7ZgkHmXQTMM400c1sX/ydO
         EBMM4lEWAmMKCm1uscooir0AXBz9bErj4+h8oW2w7eZRQW7pRfxVmx8eFFctMFHWBfot
         dFT95IjJGLrBLPN8sSrRqCs6trnseBK+WM/KotS/woYEF7Sg7JKmnNDw4i/EFNEFG5YN
         GdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769243767; x=1769848567;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0Yvi8KKr2tGeabM9tjvJ69j9ESj62Gs009Amzq+1dU=;
        b=OFWAx+n6CAaNYKh1IzLCQ6yR2+cCrBWeW+/CMGFlHGOgpD62nqsxjPpJMilFQDcQ+R
         aD697AhOs70y7vSTrEe3QCVlb7ZZlK728dCNZ0h3QItTsHvVe4VAMLJcKZSVneMm/j5+
         ZtjB57jTcfH6htade5FD4JdGprmi674CT5wiDUZpfBc4IavvY/WURw0i4kO9r/XN4kZm
         IQO37Yr0spwwmtPEMfKUq15jR8gr80XCyHO8mKr9vGH/QBl03g1JFC2Scs7c/WtWgG79
         Ds3OGnuS9jZhUqz6J+cft5cmOGvovDS/ICjKkGOo84Pyri1nO6CL9mHIXVwwOUpcAtrE
         4JBw==
X-Gm-Message-State: AOJu0Yz2n+rSwtFGqtX/2qW7tGHkCRbUkKYyOPLtb7HIlrFPjC6A4B0N
	9pWcJ8o8Ku9nVAgpWPGLzIOOfQVMmR3PCwSUNlpI3eHk28zBKN1pHDpNVtnPXlv+EPbQzRpkORJ
	PCh4vONTZfqLibVY5pxmyodxycn3PsrBIQHYK36M=
X-Gm-Gg: AZuq6aItM+Beb/7E/MflUtIxiz8Lzoa9lGjjrVpw2uonTHuerFT2ZzbVxxc1zz5D8ID
	dhgB+QH3PzynWBF9FXMxmeLe2L8O5i+pELnO5cuxwsTiB3xgJfTrzobRDltujRr0vLhkDZvVv0W
	CLr9yaRJMjLOQiSIisiIRMT7gZQSEzOUR1uJ+cXNZY3eewhfX1be87r0G673nT9JM4U02U7Qi23
	RGE7qkOVwgqiXqgdmRQ8s36WcrzYFL/5T453ESInrRTkqQ2EEKUOQlTWJs4Y8BQsJmghipKaczW
	0lcwWugi
X-Received: by 2002:a05:651c:325c:b0:37f:c5ca:a6d4 with SMTP id
 38308e7fff4ca-385d9ed6a0cmr19258761fa.6.1769243766418; Sat, 24 Jan 2026
 00:36:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119112120.83592-1-jouyeol8739@gmail.com> <264104b5-ac21-415b-9021-76d4d9b79a55@kernel.org>
In-Reply-To: <264104b5-ac21-415b-9021-76d4d9b79a55@kernel.org>
From: =?UTF-8?B?7KGw7Jqw7Je0?= <jouyeol8739@gmail.com>
Date: Sat, 24 Jan 2026 17:35:53 +0900
X-Gm-Features: AZwV_QiO4Ai9tEjzj8GqqslvzdI7NJxzlEc6kaniy5dPatrOJLbZtTJYqq_9xV0
Message-ID: <CALAjK2ipX33hHDWZVhd_WUKYyD-JvCL67YgOeQDhPUuP2ovM1g@mail.gmail.com>
Subject: Re: [PATCH] selftests/ipc: skip msgque test if MSG_COPY is not supported
To: Shuah <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	richard.weiyang@gmail.com, akpm@linux-foundation.org, sef1548@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Shuah,

Thank you for your feedback.

I have verified the behavior on kernel 6.19.0-rc1+ by testing both
kernel configurations (with and without CONFIG_CHECKPOINT_RESTORE).

Regarding the MSG_COPY handling in ipc/msg.c (between lines 1098-1262),
my analysis of do_msgrcv() shows the following execution flow:

1. Early Return (Lines 1112-1118):
   While the check 'if (msgflg & MSG_COPY)' is indeed outside the
   #ifdef blocks for validation, it immediately calls prepare_copy().
   Since prepare_copy() is stubbed to return ERR_PTR(-ENOSYS) when
   CONFIG_CHECKPOINT_RESTORE is disabled (line 1066), the system call
   fails and returns early at line 1118.

2. Unreachable Logic (Lines 1158-1161):
   The subsequent logic that calls copy_msg() is only reached if
   prepare_copy() succeeds. Without the config, this entire path
   becomes unreachable "dead code" in practice.

This confirms that while the flag handling is visible in the source,
the actual functionality is strictly dependent on the configuration.

To demonstrate the necessity of this patch, I ran the mainline test
in both environments:

1. With CONFIG_CHECKPOINT_RESTORE=y:
   # ./msgque
   # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:0 error:0
   ok 1 selftests: ipc: msgque
   (Note: 'pass:0' is normal for this test as msgque.c does not
   explicitly call ksft_test_result_pass() for individual steps.)

2. With CONFIG_CHECKPOINT_RESTORE disabled (Mainline behavior):
   # ./msgque
   not ok 1 Failed to copy IPC message: Function not implemented (38)
   not ok 2 Failed to dump queue: -38
   # Totals: pass:0 fail:2 xfail:0 xpass:0 skip:0 error:0

Current mainline reports a "FAIL" for what is essentially a missing
kernel feature. My patch changes this to a "SKIP", which aligns
with kselftest standards.

With the patch applied, the result correctly becomes:
1..0 # SKIP MSG_COPY not supported

Best regards,
UYeol Jo
