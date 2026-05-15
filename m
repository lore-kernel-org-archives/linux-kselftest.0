Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D713CF66A
	for <linux-kselftest@vger.kernel.org>; Fri, 15 May 2026 03:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778816928; cv=pass; b=A4xiGpe3KNiaQaT8/Ncpf6mZdQJNqMZbZcIkhttw5CPb40tTn4ib/1nMCbrvaa9GCzkpd79NXRa+1wcRysiiafraDHto0xTNfzvS8XWfFBpDCAZy/NpOJG9w2zPQUY5O4FsnqmYzIeTAtiUl215u6q/cCLSKsNmiwH+G5Jxi0xQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778816928; c=relaxed/simple;
	bh=axJimQpTH54Vk+wcEK9CMzTx0gjIcv6uLIP6tuXgnsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jdM920WTVlfJtlplPqvnqlV7a43ZAvOXku2NUQ7d+S3kkxHIEdo6Dob0OHRQTPeZ2RpebCBZLQbYhC1j6gnmtv8O2YpuGXdw71UmQODVYKmpKd1dvvZc1Vfd7DwB1pk7Xzxcl+zJ/Dkzvo+vwxPbcTjDVBmcbLiME/QWVGKtChI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=eCuJcjog; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="eCuJcjog"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c7980c060cfso4120707a12.2
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 20:48:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778816924; cv=none;
        d=google.com; s=arc-20240605;
        b=Qfct1RLhB6doQG7ck+26wiLQvRCuWVurjwL43novddQKoZXaLklJ2dUPCfleA6TaIk
         qd67ZH8LfimnEupocCMyE/4vky7jUqgTnzLL198Jtz2om68IrkhMom9Vlm5UBiRggKWX
         UBsCgEg1NSk3UDJyshqrDXk4uLLdKqzgumgQY+UMkA717uO3DUFA+j8qcRXKj+VNO3Jx
         MDYSAmlLp5JA+cNPOzWhRehrsprQfqN/sL2oaoSEe92N2Hxv+LLSZ6WYa8HswLOODZgd
         ZEWfhi7T1fjpN0Ya099B/NCWaDDXhsNz2zjLO8XAfLSs4c4GtOY79e72varwfytE0ww7
         qfyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kbAj3QkbSA9sXO8i6EDoM3LNbpdhiqhg3HK+8g7Mcbs=;
        fh=nWGPXrk5zKP31geu0gieLOyHG2MJZRpVctU70jsgheY=;
        b=cyNXUNLNTnnr88z9NW/trW8PMhlnB1bsft2IsFMBv1Zo/h01mFwsoOUCUs4NGt9lOO
         yoC+Txqxh/23S9VSJp2JlJRfZe0+PimovzxhMRX5yF/5g1U/FbQWn0RebpwzeE1LTzM/
         nCUiW7kpoomeoOJzo0j8czn+e/xnDbwA145h9/IcwjpSZFD9EYL0s9Q7QIgmdRGxqVxo
         LQ/L6nNqupIwRm049zzODiRSbTM5LTnTyqIBXyFA9KgOeI0VrbKAAjnhsZP15rX1z1DS
         uqoYkatPWLmPNzEyr02J+SnZ6kzfIxzNLlxI7DXogGU9/0bscizmLGnZkbqua+1qGPC9
         971A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1778816924; x=1779421724; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbAj3QkbSA9sXO8i6EDoM3LNbpdhiqhg3HK+8g7Mcbs=;
        b=eCuJcjogazgHx1HmwNxl9a51S3GLjs5pS4nDxe37/8LXdA5Fu20goCgJtAKS42+Cor
         mHvNYms0FnDGEwfsiM7okmTbroOVgHRULZWDAUGjSqqm2uW6r4QYOeNXDTf+xkXkOAiq
         65BxlH+Eo/WolkI1yV/IpGAP6AWP52cMtBLNwXtI5vfDmltmGae2mNMOLAlQvtbXUeLC
         j9kZnmJfUEN+Q481D79Rsui32+CMPNJhP+4XqD9nBglVufmX1xONPMSyZVa7oS0mviop
         Ic83TUblVdcReOEiWKWyt0tqysvXvQ4IJfXhQmN++N89i0is1gU0xe9EJNz/lSyzdYEK
         e1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778816924; x=1779421724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kbAj3QkbSA9sXO8i6EDoM3LNbpdhiqhg3HK+8g7Mcbs=;
        b=Otq/h4crTu5C3ogGIdRNMazxOzIbWwLcyb1Z5CgppfLyTS6+0XYzE9a0kPumfXdj8x
         YmUPUjjufEPkqs4Vct+6teJyTTO1G3ujYMR6/TCusH5vTz7AJch4t3aq+D8N+aILRXer
         kY7A8j5KRacfu3gLFk5U25GLgrFTK/FGQZ6/zJl87OOxYydABDbyXcYE9Wgn0/qSHIGP
         S0ceyooAfPE7Tg5ChUKqnpmZxUR+FpVLQDKB10Iy9dMg71u8yaI+i/LJCILpUWMA8SAJ
         pD2LZ536eBAT9bbvONlpE01+7bPlv+9dtRjrTda+kr8K+I4LPCpnjvc+48oNdUDq6sfK
         ZJGg==
X-Forwarded-Encrypted: i=1; AFNElJ8zP2KDzVd50SqlyeBnmK/0A+0ovcaAgwDATmUMoS774V45MEyWK4m600zPjaYaJczmeC5oJ2B6iwpF7+kKtAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxY4ozsw00ZRMCoqlc/kLfvd8dT4cJqJ4zH/9dn3bJLepKpkNvB
	KakLB7mL2zmb0IZVfCk/ORVWFBpBYpEkpeRWb5gfBqkSxxWzt/lw8spa7mIoAgXI1qJNvxSDri1
	+Qhj7zWaPNMybA3ZyqnStUBefy6s1xyy4HqxLH8W6
X-Gm-Gg: Acq92OF/Ag1iHo7h+UK7n8p+WsJKSCtLj8gImWPPbhrEZVc4OXb1ECxMPK25Kvwk3al
	I5YNq24aDY/tUxTPf+OoW4irAtv2HMmlr4eVOQsCVE+C0uSvVPGwUXUG0dJSgvuHZIQdwQu6VLm
	rTVh1B4H/w9p/zgsCWTb/O0lRhqpQP1WD4jrCoxsV8uvCZe97LRicq3GUwqSQi12Sbacf+DJFU6
	J879vT5hOiBxJGthUKBxpXonVxRcXX3eO6+1xQHpRRSEh2XmNyqJ5ynnWqkHmnztY7Aq0BCiccY
	jpl/CYM=
X-Received: by 2002:a17:903:1b4c:b0:2ba:7610:3f21 with SMTP id
 d9443c01a7336-2bd7e802964mr23892325ad.5.1778816924539; Thu, 14 May 2026
 20:48:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507070547.2268452-1-sashal@kernel.org>
In-Reply-To: <20260507070547.2268452-1-sashal@kernel.org>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 14 May 2026 23:48:32 -0400
X-Gm-Features: AVHnY4IFjeygqhvOWHf7nnff2hcSoElhRffZjECjs-fQ1g-cwaO4KY2xNXWLrHM
Message-ID: <CAHC9VhTwDt2Bx8n0io9Qge_fUEnrHsxrFAQY+KaemKWqJqBQxw@mail.gmail.com>
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation primitive
To: Sasha Levin <sashal@kernel.org>
Cc: corbet@lwn.net, akpm@linux-foundation.org, skhan@linuxfoundation.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, gregkh@linuxfoundation.org, 
	linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 7, 2026 at 3:05=E2=80=AFAM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> When a (security) issue goes public, fleets stay exposed until a patched =
kernel
> is built, distributed, and rebooted into.
>
> For many such issues the simplest mitigation is to stop calling the buggy
> function. Killswitch provides that. An admin writes:
>
>     echo "engage af_alg_sendmsg -1" \
>         > /sys/kernel/security/killswitch/control
>
> After this, af_alg_sendmsg() returns -EPERM on every call without
> running its body. The mitigation takes effect immediately, and is dropped=
 on
> the next reboot.
>
> A lot of recent kernel issues sit in code paths most installs only have e=
nabled
> to support a relative minority of users: AF_ALG, ksmbd, nf_tables, vsock,=
 ax25,
> and friends.
>
> For most users, the cost of "this socket family stops working for the day=
" is
> much smaller than the cost of running a known vulnerable kernel until the=
 fix
> land.
>
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  Documentation/admin-guide/index.rst           |   1 +
>  Documentation/admin-guide/killswitch.rst      | 159 ++++
>  Documentation/admin-guide/tainted-kernels.rst |   8 +
>  MAINTAINERS                                   |  11 +
>  include/linux/killswitch.h                    |  19 +
>  include/linux/panic.h                         |   3 +-
>  init/Kconfig                                  |   2 +
>  kernel/Kconfig.killswitch                     |  31 +
>  kernel/Makefile                               |   1 +
>  kernel/killswitch.c                           | 798 ++++++++++++++++++
>  kernel/panic.c                                |   1 +
>  lib/Kconfig.debug                             |  13 +
>  lib/Makefile                                  |   1 +
>  lib/test_killswitch.c                         |  85 ++
>  tools/testing/selftests/Makefile              |   1 +
>  tools/testing/selftests/killswitch/.gitignore |   1 +
>  tools/testing/selftests/killswitch/Makefile   |   8 +
>  .../selftests/killswitch/cve_31431_test.c     | 162 ++++
>  .../selftests/killswitch/killswitch_test.sh   | 147 ++++
>  19 files changed, 1451 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/admin-guide/killswitch.rst
>  create mode 100644 include/linux/killswitch.h
>  create mode 100644 kernel/Kconfig.killswitch
>  create mode 100644 kernel/killswitch.c
>  create mode 100644 lib/test_killswitch.c
>  create mode 100644 tools/testing/selftests/killswitch/.gitignore
>  create mode 100644 tools/testing/selftests/killswitch/Makefile
>  create mode 100644 tools/testing/selftests/killswitch/cve_31431_test.c
>  create mode 100755 tools/testing/selftests/killswitch/killswitch_test.sh

If we made Lockdown an LSM, we should probably also make killswitch an LSM.

For the LSM crowd who might be seeing this for the first time, the
original thread can be found on lore via the link below:
https://lore.kernel.org/all/20260507070547.2268452-1-sashal@kernel.org

--=20
paul-moore.com
