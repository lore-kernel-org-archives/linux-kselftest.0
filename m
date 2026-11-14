Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794674999;
	b=CwQ5kkYFa4E4ohvVfAZJip7eqMuWAuS7IKmnq5wdLZ2QqtoThid9WXbVNq07iERhpRPz
	 N0sEa/5YGdu1U1zoNn+tCSqFShKsTPsUrSf0lD6VjrVpQ2Wbn/Uqt8dLcNBdJFJPAQ7PS
	 KWteR1twtOBhKNGDHkInCJGVVbXfJeoneeGWtSWsxt1J4WNIwD4tJsKAIlzeZLyz+pPAx
	 WpygbjS7FUYhdDKID0TZVxzlWyGZ1Xtzzmuw65ZY0S+F3zWQlsB1nF3t2UKeEH3n2IqMl
	 ofJqemUSo7zn2Ea4HxdZg9xMed1feapfJ7nQkEhF0Xn4JnDYGMofy+BCKoLhYhAkNQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GUFPtUc78Ff2nzctbKPfIz/d8+p1b1chHezhK1s1XBg=;
	b=TLwWxwWKDA3dWS0aAxPJ+iZkbmi/hYR9oGaxgzN9A7D36q5xGnWbQkmOn/TokJ0ng9Qy
	 gg78nN/ildoiokhrLKO7YQrDb6Nds1n2Mo1rF/oW0ZDwO0VbE9oJL+K3Gjym4U2fnf7HI
	 V+lV1OD6JKN2j6kMkecTlVLOaXB06Un8aFycYXI5Af/sh7GYyyoF4G9WntQhQAaCNtUYb
	 kHwfYVVNtPCVBtoBcEnFMl05/p4JmzWRNzguHRIo0yuy6RzWhajDTj7fKRcJ22Z2BCE2J
	 BXWy2a7rAAL+N1VLBndy1noDtoK+XTd9FGlOGafE1hNVtYZn7NnXr2trNsDcSiq+uww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QT1ksmBZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F54606A323
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 16:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45F54606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QT1ksmBZ
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-37198ed3727so3493914eec.0
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 08:49:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794674998; cv=none;
        d=google.com; s=arc-20260327;
        b=WzTmpa9+YpBRkkV+LRccEE2HKDTiEWs8Oi2sRiln4C2TXifhMB6bSPHS+E4r6V2oEE
         pVi0U59AstoukXXBZ8iImwh4GVJSpHqRB9Kw9Tub9dEES5+KKh1lh2IZpBCy9DFPjlXU
         2s9jFPopfb1KZjK6yjfRDVCmcQ4jt30h3df5mtpxZITPg760OGL3fBe5yXm35OLlM4sy
         +sI/XrvqUVFaJ+cDf+W3NiOF+uZ2KJurmAvz+dPpfiQvp+pNAmDNgS0XdKLo8cJrJ8zo
         bCoQB0kduj/TWkMDq52qYKs2sYnuB6duvPWo0fOO1EFTUBYCgjL95SkoP6Im3HG9Gnsp
         iwgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GUFPtUc78Ff2nzctbKPfIz/d8+p1b1chHezhK1s1XBg=;
        fh=VhBsTgr6Pi3jplLNmemsafhAO4DKOVJP5cEBc1+bSuo=;
        b=eJqPYdw/ETeRWR6WK+uoRaEsuGnMsnCRY/R9cy1w2QohiAvNhg+3DhtdbHs/a5XuQb
         1HQPrkmfvjgxVKJGBJ1SgKf3R7bxVsHans83TwKJTPzgUQp7Frg3lziuHwJVgXs065q5
         /+gQAdI56MIBhUf7CtdvfFn82lFzIWM5DDTePBKmelgXt6/ocehEafw05GoLSf9oPyCL
         ZAZAjP8mzQRugXuCFZfyZaC5S9I+fEFeeont6dKlV4d3DszyGqtRLWEkdb1LAnwQbmXD
         aY5OY2ns5Al8RlDLQzuhLWa581tTcm9Vhy+/EpZfm49gv9T4SGyGVeQooeWGYO0nRrza
         +YPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794674998; x=1795279798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GUFPtUc78Ff2nzctbKPfIz/d8+p1b1chHezhK1s1XBg=;
        b=QT1ksmBZYJTHxX9VIlJwOkYoAstbMSNvCaFil6h6hB7coI8Hw0/trYb8/BMFP8L3fX
         VQ0d4Q5KMWznywYHFZYnXNMwytK/r7aSnoBfBAdgPTXmUg3decfIcPro1HNYaTmxGDfQ
         XH4FayJY8UfjC2uS1WGGz3AqQcrezsGeq/dq48l/RA/ITDWvOiKJU1CmXJ9fKeaieLOk
         8NdEcmr9lMQCGiFdEAdk4vxnGuGB5epLM8Xx03pOaJBMTvLnPmle54txUURtXFHl3juz
         61QIeBAEt2A22ZWotJwrWFktgzUwDphy1KtsGoj/B87AAJKWW8EL647xaEu5Ps1++/N/
         W/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794674998; x=1795279798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GUFPtUc78Ff2nzctbKPfIz/d8+p1b1chHezhK1s1XBg=;
        b=2LjuLkO1qyLz/jMgp9W56Wu5w/E/uMPLAAyLQ8UqabMHVDg500LPnqo4jN9pvsEGrF
         LWZ5SKZtgRhqsKYk5u3bpu69p4v8ASp2Vb9zh0dIUp0sxlC8cUPX9uVXLTkSw9O1x737
         aYjhRTeOlxklvQtzFi1ENXAw7mMcjwl83FuS2PS/oHG+HMPJEHq5h3SUX+TbIyK5MuvH
         IaBOlCyniN2oz3OTfeejocM8yscOnuQlOKrLsx8v/u96KNSleWC94RKDUHe0GzK4GzxW
         wlD/ykVhY7Nr4zOJDxHQZaKmnFOey3N4wpzps2ocdiHlI5VLdBthJ2SprG6EZkqga7G6
         o5oQ==
X-Forwarded-Encrypted: i=1; AL+hErFBlnQKjXJdrpws0Vak6rLOFkioJxC0pnlKk7dWn5TmBRBdrI+Vpph9FzglOBCAtKhixg1jItTlD86ajgP4vzs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ow9Bwf/ENi27k70jgq6lSGbVgWEbEjHpS2HbSAoP01DhNoGBn
	25FWtUtJcO4a4O9qETgyCufGKP++U7PBHzZ5AwYB/ZCJd5mzJsRWaKHtjEn/aw639+xm7HP6/6l
	OuWkJ2e/pzj6uJEiY9FC33RthoyMLnnjDcmpUXG1K
X-Gm-Gg: AYBFou2P+qRdsRtmNLnRC/fvhmTm/xYOH+PB3l/+Cm5dv0wsMxmwUZ3x7EblMsWMzYT
	GpCjSNAEdl+xDPYSTn+6+kbDqJn4r1KW0VNT4MNLwVy2vXij2K1Qp5qv8hy6MBx94LJLqwq2ZG9
	U58+h/nhLrO7SeFHX5wWyUsCSj1FV+2G1K/Kg2jAW/f05Y7uBmjn76oNLxnok/SEFvjHN3SkQ9T
	nnpX6YdPLPK18zEV2cFLzDIqiiUMp2eLSmfz13nZEffM4Rut6xGG+LguuYIyVQXLguA/MGHpZ7g
	65S63cA6WiHcK/9TTzTfdlfUr9EVRvy9l8c13jROXVjSYkzGWWPEuPi84zUMl7ZtmPp0Dgde1CN
	0MLfahQWlXFLn5E6adD1jWAE4m66q+l9U8LvFW3IANMgX2dbrvzMaRxn0Mdo38YTgP6zJZ3erfe
	4QzVfG5a7VQxu5AT5tYDExHpMgFoyBIyVP/nPwmtfys8FzNbOcgX5ii8U8eKhppBCSDikqhuFgF
	hqDJ/grZA==
X-Received: by 2002:a05:7022:3c0f:b0:143:808b:b178 with SMTP id
 a92af1059eb24-1b4f5f93ca2mr6484146c88.26.1794674997531; Sat, 14 Nov 2026
 08:49:57 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114162632.16346-1-sidchintamaneni@gmail.com> <20261114162632.16346-3-sidchintamaneni@gmail.com>
In-Reply-To: <20261114162632.16346-3-sidchintamaneni@gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sat, 14 Nov 2026 08:49:45 -0800
X-Gm-Features: AclHuK8e2NpHhPJrGzHc56g3dEpZLqRfkrJ7tU89mCr43OpsTZY4kmX_0Ds9uN4
Message-ID: <CAAVpQUBxBDe6kwE_0nKcjnNyfH8_DgYXC99xP5-UATpGn36Vhw@mail.gmail.com>
Subject: Re: [PATCH net v3 2/2] selftest: af_unix: Test scm_fds on dgram disconnect.
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Kirill Tkhai <tkhai@ya.ru>, apais@microsoft.com, 
	hargar@linux.microsoft.com, rlmenge@gmail.com, egoriluk@gmail.com, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 8:26=E2=80=AFAM Siddharth Chintamaneni
<sidchintamaneni@gmail.com> wrote:
>
> Add dgram_disconnect_fdinfo in scm_rights.c verifying that scm_fds in
> /proc/self/fdinfo/<fd> returns to 0 when a connected SOCK_DGRAM socket
> with queued SCM_RIGHTS datagrams disconnects via connect(AF_UNSPEC) or
> observes a dead peer in send().
>
> Signed-off-by: Siddharth Chintamaneni <sidchintamaneni@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
