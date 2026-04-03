Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F964285CA8
	for <linux-kselftest@vger.kernel.org>; Fri,  3 Apr 2026 03:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775187688; cv=pass; b=irBmW2VA9zcs/gv8IPLWrL8XLOy9j/WGqq+mK7+Xanef8GYxmJOMKcCa92SBlzlST7k0pd6sipcIXYVbu/mzYoSK73dn+5RXtw+iJyumG/1cRnD+ymiekYUCe3OLEg53zWbRY9OSa4s7xYfJkbqoi/P36rPza/AdzsguUv2/u28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775187688; c=relaxed/simple;
	bh=XIkHOd1FHvl3dx9BV0ITQXHH2amJU9tNkTlkcOG9bBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ecng93lCgXKpRuUK/BgguUIDwTcSAkLOpv+OrIidkF9YQTgoxwl4WO4htYD6/jkVsSq9NTBWZU77m+Uxnhym4PDGKWQGGShnNotuv/17FqxB/OqbE1Ju57ctx4jPq4Pmd7/8pEcJoZy7vAc+3RTRPCshdBz1ju2s8vzfkVD2vf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HPCp9rf/; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HPCp9rf/"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-66b0dc690bcso3957a12.1
        for <linux-kselftest@vger.kernel.org>; Thu, 02 Apr 2026 20:41:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775187685; cv=none;
        d=google.com; s=arc-20240605;
        b=dM4lA98dpfEWSBn0GK1EMbI3kKR5QV6wTWtxSE6+KRaR6TBSU6nzajusyBUxkhRzLY
         K2A9MXD2wug63Lxfl4ctALBeOesLA7SCsLJYPwaH2OGWU8+0/M9Xcn9KJVHrLB7/3exP
         zYLhUasHoaDCwH4Y6Og3ydYmVRUd2/oXoUoUc9FWIaQusVSJC1y5qfv6UP1Kc3zf7WRY
         Xs927CG5RFbRZexcgsFtsBAPQ1XG1+yr/XYlIOqDD58HEcrbVOGEod+6asHTI3ngpbDy
         mTEwC4LMuxryFlO93sirtpGmgATMul+fbdJLSGpIfXIL8YwJp/fBynoezJYZRgTpuzvq
         Jipw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XIkHOd1FHvl3dx9BV0ITQXHH2amJU9tNkTlkcOG9bBQ=;
        fh=pRL7UgkC62pU8jWXBe4h6KgEX5eeYJxYwTLZfCrX/Vg=;
        b=O9eK7HT1A5rxC0UL82XV7wJCJZu0i7nxouXKIlqW+Bw4eA9KEw7jUc+auA2XvvXklQ
         KOYLrTwBTiNMu9nn4XRpp6ypKoawI8iJN7k+h1Im7Htq9kf30uqfWkAmyWLt+fFw42kT
         6iZCLDcUqSNH0XZ5wV3m4vaHV5Dm9aQUCda3tKX8xtqPo1EunSBX0PbvJSZk9UumOnxu
         I1/TnHt35Z+HwNNytM+o1E7URJiG4LJSLH6tuikcurn1lChm2VhkSb4aWZaP7EWiHU7y
         Y/2UpJKW5upTp9AbOAsdtQ23wX88uhW+txoHnmTUhTPqkk/49sBLg0gWYaP6zzMIfNZ3
         yALA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775187685; x=1775792485; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIkHOd1FHvl3dx9BV0ITQXHH2amJU9tNkTlkcOG9bBQ=;
        b=HPCp9rf/5y/Ao+YNYzRWMMvkhwybS2QKaN8z4UGGqoAnmVhrdn0oU2pZ7eoq/sUO3H
         f4eKKuucMyXpmgyGJs1R8XXXEM+v+6eV/WujH+vjHV8Sqfqj1NGsm6QIY0n1Qt+6P8nQ
         nsqGCY/zy5PE9lGQvOCTkfv5AZW0UyfuYLah1OWOqr0J2kVUw9865Uy29v9L9tV6EuCL
         Ngctj6DuE/Kr1adFN+i1cy3qt3/uowC77ODo5Y9JsQFRw+VbPXMdmvdux978jRR6Jm5K
         UisvfMGQ3WeSZEGclBEh6py6GHzusg5rdQ7cVSkkv7Gje4b7RfLHP7xIBCvNhnfRyv3U
         B7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775187685; x=1775792485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XIkHOd1FHvl3dx9BV0ITQXHH2amJU9tNkTlkcOG9bBQ=;
        b=CZTMc6aV3a1Bbe2h6VZpjiypbVFDOCuqJVhQBWWV2A+nxa7HzPGa/ga3vTDLvYAucB
         qM+PAqA7rUBkqi2IHFg39tX3Hr8LsdqjL+YJT6xFQdNyZxOADi07PfdBRB2u0PrWnxKD
         mswdxmSpjkCzjqYITQbV6ahvnpJ0NXadw275ZeKUAHTLUkb2bNlaAwuYIWRhl4HI4A/S
         y59eX6J1NT/GYez4GLCVc4JrDoR/rDjqSN4iWrKjEoc9hkcF9TyY4PRV7v46a0elU+Rw
         Wil8+FD0XAsmSTDcpoy8fxjijKU0n3twUB5s1fUnB5jaU2pc7ZPnzef80JgDWtim5CEy
         oYJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGQJuuafWEMyZFCznWUXvGG/56h92bRALE82dIQEAXg9iqr1I2LS8XQbr6Btw2dmMxoLxQZXzDy9lSn0cn/Os=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS8moLVET4qVnyb3+ZwAePl6F9uuDfi6TqvVcAlPWIMPRescf1
	WpvRjNvahfhDljdG1m6fRKQNuv22znwwPX8MJlHbsgODhVVPsfZ/2N0e5qAYsXp9GtwoP4dIanS
	bdgLcfbuKkpW27vHGLpfP4gX3+TEDd+hNUZ3cV51D
X-Gm-Gg: AeBDiesETkCdL/4ZRldKGuV/I3MPdNuHos6Y8Y1CVpQ4OnYpDT7wzg8944eXU5zp+2+
	P5FjGf0b2DlWdYNtp68uyi1XYEbqL8T+P5HwCAADfVcRQPnqiT1FepkeLD7Yar815KKh7MrXTk8
	mzvC1P0YNVW1YYP4enajJzjOdoJl4yROxhFCa1kK8M0JvVCh+Odxmr7Hxqq5iXuojnyq/ZY+Qv8
	zXms3L32r0XjKUxU0J3UbnIGp8cX757PWE3K7ZIHzP0XGOICD4t1j20YWmTD0nx87BPiq78RC6A
	5zvuEUGS95K8X7yfdKy+U9l5inWwnWshrDZS27Y=
X-Received: by 2002:aa7:c548:0:b0:664:d536:82f with SMTP id
 4fb4d7f45d1cf-66e43f21a8cmr5732a12.9.1775187684933; Thu, 02 Apr 2026 20:41:24
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402-teaming-driver-internal-v3-0-e8cfdec3b5c2@google.com> <20260402074538.205e307c@kernel.org>
In-Reply-To: <20260402074538.205e307c@kernel.org>
From: Marc Harvey <marcharvey@google.com>
Date: Thu, 2 Apr 2026 20:41:14 -0700
X-Gm-Features: AQROBzAlxZy-jqAhcgQO1cYPSAVMLl07FHUvPVYLpxT2ENVW5QTeG7yBwvTOW1Q
Message-ID: <CANkEMgkV3qAC4asCDhL7ZznK83fD4MeAD51u-7+j1+LS53pbjA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/7] Decouple receive and transmit enablement
 in team driver
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 7:45=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> Sounds like Jiri asked for changes, when you respin could you run
> shellcheck and clean up the warnings? We ignore SC2317 SC2329 FWIW
> selftests confuse the checker.

I will send v4 soon after splitting up the main functional patch, as
Jiri requested. It appears all of the shellcheck errors are from
SC2329. I see a bunch of other warnings in patch 5 (from
tools/testing/selftests/net/lib.sh), but they are unrelated to the
changes from that patch.
