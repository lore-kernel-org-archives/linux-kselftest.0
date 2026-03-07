Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA98938F231
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Mar 2026 18:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772909795; cv=pass; b=ABx8CEUQHVspggYrjDAbvFIPqWZcZtpvHZ+iGz4AU5r1aRJvzAb9/5VjvuhQRreHZwjV01Hb1GxXPuyIVW8oM+jLPYRI+tzXeuxZx8w/AMQMdF2XNekWi4iIxnO/iCvEPA8tUFnXqkqfkjoAg/MNNkUzswP2BUldPJcBCfOHaJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772909795; c=relaxed/simple;
	bh=ipPnoEwRKGay/Kqh3e72TxDAS0WvWm5QHtGzwkgIhmk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CKfRkZXV6oS/+Uy8RjTrxUpHNCJZGe43UU6yOBVRZWuZhWl8yzi4IjoCqeEnQqK7Rjrcxwt1rR/R6WjwFp3GIgMOarOyvzlyz+KF0vxI9CpD0AT+pveqgshJxduD6jobE0Lcp8ws+T91GJKoI650NoP9T124pR1Zm9K2Lx4S0qk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net; spf=pass smtp.mailfrom=amacapital.net; dkim=pass (2048-bit key) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.b=UERqbxJK; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.b="UERqbxJK"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a10d130b37so3339945e87.0
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Mar 2026 10:56:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772909792; cv=none;
        d=google.com; s=arc-20240605;
        b=Q5I2+EGGJl1EJ+6kxTOODLy9ODGNQSaUmE2JQDBsYn5sbhW9s+4sMrzpNa0HqfT4eb
         YqqgTZUY28uAatu22G/M+ulHBfdYSEX9dh+JEERiaisKEIeThL7GwTgSdzBCdWbcfbtz
         ayBCbusutSFUGOoJezyQfNJXjGiiukiH+B+FnzaabiF/Y/uW3FCIjMWXT8zJ7MbOIGq9
         6ZNT9lPtNHgt8Cqf359kkI2rm5DOysmOpswEu+KkKsqN2Tw7KfHbH/7bWaktNdCMwT8v
         go6WR5vwM/qix4QdkbvylgRncmTKasdGxM77PTXMGs3OmJ1UHeyUeuE+79WttjcmDdWK
         1lAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pxUV6l0cXcVJnfGWc1SwZOsz+kJgjCkHV5Xd2O+xjBY=;
        fh=s8xHfuVKvQAwDTPx05uSwV/oFL53jS8yH1czDTXiTtA=;
        b=jcL0tPiL4XQ2O7gEteHUE4gdnjcj77AuroKPUdEPbU/7js+TMN+II/3aUqGVcaFXtg
         I+v1nLinB4Garg2XyQTV14FzK7eCcbbOSCaE2wm/dwLprNDwLkG8o8mb2+BxJ3XcBoL/
         OQXKWIgmzklEY3ekrZeQRT1y4XQMwpC7FGe+vLRNPHJ9ugvcoIi+uOYxhNCE/71vNJAz
         ihEuhHUO/lcWGowyzixFJrC0ygDj8TPnSV51qMYGcXkdmsVMCT1UshAz/fST+l0cwWSf
         9+v965oN0VyqSR+wRAQKFun0/VrWnvUB9tQXMGyPXHSmmzDsBR2CprEBStAgv3HxhIZF
         0CXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20230601.gappssmtp.com; s=20230601; t=1772909792; x=1773514592; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxUV6l0cXcVJnfGWc1SwZOsz+kJgjCkHV5Xd2O+xjBY=;
        b=UERqbxJKZngkPO2K4yr5YwAFzKHDjj8r0w4oJuzjCO0kMIqLOi33dFigOAK5fZJwBg
         t3vBGotLKf2C2GyPcVqTqi/0bMqWfMRpqQ5rii8Lnt1DIjrG4hklubdBbb0zBjvmrxfm
         0ACUWOD8gJuwgtD1IRPU5MEQjhc5r6adr2y3vMIGiLtTdq4ZL/+TuRATJssUP64XLQ8k
         697wEJo9Gi1YFv8vDxzYYf+i++1UCLQBSHd5HunMVb0RrP2RWyiZRuwnSv/rA/6wMP/v
         6PdybPK88LnePRQ5doBRC2ZH8V1L7CaJDdTOdndxaW4gM9uvjOm57BKxPOmZpQyF5BOo
         dHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772909792; x=1773514592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pxUV6l0cXcVJnfGWc1SwZOsz+kJgjCkHV5Xd2O+xjBY=;
        b=fMwrHOqJCHRKt6fXZoLa7T0ZF4GL+FLzeUetJi93R8BLAVXWswDutD3cImreUucJgz
         Y3cJ7hQgIWFDDGTl3DeDEcGAgvZUvZHn5dKhUOzyd7vGx90oWv9hI+ERTvMl+7a4jhhS
         L/ceRBLcFWkU/4EQKSzJQWa0sNURWLjfp4VmY+WkwPZQHpJEBBswmB5j7YqPZYkYHE1d
         sOYkR4NdJH4llEHmibNUVWUBFzletyoH+fZDumngi5Ad+Xtd3Jdnrs3PkDUf5Dl6RaFy
         JTmbasvkd03NajoKlaJpz8jzdh9Or8a5v9tI9mDL30ucY3lhg4RMt3lKUMaft/10rRUH
         QNvw==
X-Forwarded-Encrypted: i=1; AJvYcCVA/u7mG7UhRjKQHsBuukNEfZj0r+Hr3MQhfkbkRnhRlmBPWkFXd/O9/eFOHXMaADz3Vu10nd2leDbklvhKoXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUsMao1/KWSGIm5+3D/Aiy+Q7LQcRnHAoOc4CeAt0fMTJBuqKo
	BWD6c0cb0US4ezxysD5Oh39ai43JuNgIaLmwyl/RAiFi/mX8lltinyBcLMVFMF4IKQP1mfZyG//
	JwclX+nCDzhALWKeHVuXjeOl+H1TjHtWhXN9IJ94V
X-Gm-Gg: ATEYQzwPwndg50nwSlyuEL3nx69FmwhrMbwXSVfrVwqloOOds9y62keeIQ00HlQp3Ik
	mimVRkqBQvhsxNvQp3B5BFr9rOzYnDK9MhQe2wUjDivq8/GPCxHmluHvuv4lB0wYJTgGlb0rl87
	/66WuQOR17huMjuAfmWogBxjIhWZ/Dz6LcXnT/PuaeTjBEBO4k+ykGGUg1eIIgOfhYRrlNZ30/2
	m5ySEgmcdv5LdWO5JTcrsY68kbQHRuYW6kO1q81V2Ua73SLlbQZZr52/iExI9V5ZBQ1OGJTsXN1
	KpW2rzkh
X-Received: by 2002:ac2:5694:0:b0:5a1:1de6:bc66 with SMTP id
 2adb3069b0e04-5a13c93d9e3mr2016793e87.18.1772909791880; Sat, 07 Mar 2026
 10:56:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260307140726.70219-1-dorjoychy111@gmail.com> <20260307140726.70219-2-dorjoychy111@gmail.com>
In-Reply-To: <20260307140726.70219-2-dorjoychy111@gmail.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Sat, 7 Mar 2026 10:56:19 -0800
X-Gm-Features: AaiRm51B7g_JMhlZIdflpWCsx5DmxAmpibsspywnWIGz_sEa1ctulidKDYlHz5s
Message-ID: <CALCETrXVBA9uGEUdQPEZ2MVdxjLwwcWi5kzhOr1NdOWSSRaROw@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] openat2: new OPENAT2_REGULAR flag support
To: Dorjoy Chowdhury <dorjoychy111@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, ceph-devel@vger.kernel.org, gfs2@lists.linux.dev, 
	linux-nfs@vger.kernel.org, linux-cifs@vger.kernel.org, v9fs@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	jack@suse.cz, jlayton@kernel.org, chuck.lever@oracle.com, 
	alex.aring@gmail.com, arnd@arndb.de, adilger@dilger.ca, mjguzik@gmail.com, 
	smfrench@gmail.com, richard.henderson@linaro.org, mattst88@gmail.com, 
	linmag7@gmail.com, tsbogend@alpha.franken.de, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, davem@davemloft.net, 
	andreas@gaisler.com, idryomov@gmail.com, amarkuze@redhat.com, 
	slava@dubeyko.com, agruenba@redhat.com, trondmy@kernel.org, anna@kernel.org, 
	sfrench@samba.org, pc@manguebit.org, ronniesahlberg@gmail.com, 
	sprasad@microsoft.com, tom@talpey.com, bharathsm@microsoft.com, 
	shuah@kernel.org, miklos@szeredi.hu, hansg@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 7, 2026 at 6:09=E2=80=AFAM Dorjoy Chowdhury <dorjoychy111@gmail=
.com> wrote:
>
> This flag indicates the path should be opened if it's a regular file.
> This is useful to write secure programs that want to avoid being
> tricked into opening device nodes with special semantics while thinking
> they operate on regular files. This is a requested feature from the
> uapi-group[1].
>

I think this needs a lot more clarification as to what "regular"
means.  If it's literally

> A corresponding error code EFTYPE has been introduced. For example, if
> openat2 is called on path /dev/null with OPENAT2_REGULAR in the flag
> param, it will return -EFTYPE. EFTYPE is already used in BSD systems
> like FreeBSD, macOS.

I think this needs more clarification as to what "regular" means,
since S_IFREG may not be sufficient.  The UAPI group page says:

Use-Case: this would be very useful to write secure programs that want
to avoid being tricked into opening device nodes with special
semantics while thinking they operate on regular files. This is
particularly relevant as many device nodes (or even FIFOs) come with
blocking I/O (or even blocking open()!) by default, which is not
expected from regular files backed by =E2=80=9Cfast=E2=80=9D disk I/O. Cons=
ider
implementation of a naive web browser which is pointed to
file://dev/zero, not expecting an endless amount of data to read.

What about procfs?  What about sysfs?  What about /proc/self/fd/17
where that fd is a memfd?  What about files backed by non-"fast" disk
I/O like something on a flaky USB stick or a network mount or FUSE?

Are we concerned about blocking open?  (open blocks as a matter of
course.)  Are we concerned about open having strange side effects?
Are we concerned about write having strange side effects?  Are we
concerned about cases where opening the file as root results in
elevated privilege beyond merely gaining the ability to write to that
specific path on an ordinary filesystem?

--Andy
