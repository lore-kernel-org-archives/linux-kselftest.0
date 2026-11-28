Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795826288;
	b=hyOg/s82DzdDD+Qo+lTnEXiGp3bq2QNjw9GeNgHFHfgZNYBo/9yKScr5LIIFDCOLkM+u
	 dVnIcIT36ExG5IaWXQroH1XJRcG8AmD+dhmTkiKwjCMICkg6eBE2yA2VsVXXDGmxxyAFr
	 RdqwI5WbtrDIac4/vhMDBCWxjvihs54eVcbCQl1RTb54paVKkn86fAys2PfKuYlYtUIDN
	 3PVGR2wSEqMzjaiFWPWT9Y8tlKSu7/E2D8JLt8Zwf1floNrZjHOkkymKLha2oSntpaZIB
	 Bc+b/ZiVfjY6HhxUKfTS3olKyn1ehcGrN6FXtUQ6g8d+OycwBIOu0gUdJ7FW2F7cTmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795826288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=YOL0rHwI3wzAxiSlMAGGk9NJU9DJm9wEtDs3FMJdkxM=;
	b=ZcbbDUHLJO051C0LmjnAOPBJGP/3ToJAKjWjVZe822XThsVnBoNwpgyfshkItXG/ZPmx
	 vrbhvU1u0TzjUnZxH5AhmKiYAfU+MYycgwcM7lKK0NetOkJnZiyED3MiS1lzutrakheYe
	 CmDYLsp2a7NlMAVU6VJKo8pceHh/Rhp5rSqXtwXzBHe0xHVfA8QUdRa/eohR4nl99CsP/
	 puqJM/G1PxkzlYkdepgQbwHdBB0kSCsQWfbjIMUkoxLd3YSpTXyzGCOm4ab7bEKv4KBOq
	 SdMKBCflv8OE4P2uKRDxEJyPY+7GxCzVrkOzWvnMdMI6ppfdrLKCHAF+A9DVoXp2PDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZKquqcb5;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36523606A31C
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 00:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36523606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZKquqcb5
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b44bdcea8aso4985095a91.1
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 16:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795826287; x=1796431087; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YOL0rHwI3wzAxiSlMAGGk9NJU9DJm9wEtDs3FMJdkxM=;
        b=ZKquqcb553C1STK9QTgdXfRyAWUuYTT0NYDXAbFNELVbvDZVCnsYPo1TIdFhNon5XC
         kg+l1yQya+4Eu5DNiTvrPG7CssM5yQFpVMgmNj5wsreMe0dXvFPd3fe11juBaBgNB3BM
         dMyd2o7qTGDHVEem/5/uht7ZikH591ADQjGtfG9unKEU0KzXTHrcutyDa6X8I0oiJckz
         DlXPu/49ZuqhLHOPnUDJG0VHqml3u3ymKLeUBnSB2+YPsEVQY8usntbthQCTds7BmZAi
         b2E/Q7QRhBklENM9luDICJmLTN2PM0+S3OaVARAWjToxNsNm8tSKk/iUS8DFcqzubrby
         SRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795826287; x=1796431087;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YOL0rHwI3wzAxiSlMAGGk9NJU9DJm9wEtDs3FMJdkxM=;
        b=aoZy8XunDf2lPF2vRepo0V29jz4xzrnTm83pYHQKMxuu2I+ovicoF0PsUMFkvvdqsk
         8+nf1kijgIZB+xusHCjs22PYvOY+8aVQZ+dbxu9HuVNztPH1zObsshfrClS9YvLeOALq
         NgxDkFep7BEaxtNDRUCXUuvs866givG/3jGrNnFYYvN8S4JpILHPFIYaiW4qH5cSfdJV
         92vtaQPylTn6GK0LMNmBYr16zk7r7nnR5/JqlpBmF5Lypu038NI6do3oxB5xMx6i28d2
         rNfVOOsXO915rIDgfm/pMyBMLQA+nlqzv1RRwebKREzANZ2iRZrkvjwIWDDhQz3UsXtY
         3IBQ==
X-Forwarded-Encrypted: i=1; AL+hErG6kcyF281zPQtvBeZMjfhAB+OYmJ60ujN+23W1JBiHea0uFUdzb94EY7TxqQParVHsGZNvMRqxSKmtHfKldIs=@vger.kernel.org
X-Gm-Message-State: APuU4Z97+RQ+xPLDSjw6nljmtlHZeHK1koEt9eJSTK2jdfLA1u2dpWYj
	pwXeP5ukR/gINJCg659c/8Ln8y1cYaWn6OYv1/HkQkc6Jgqo86NEXooY
X-Gm-Gg: AZFdTZfydu2X/XHy/AsgaTjYWxWgYlYbkIIDZ9P0gaaCYTmFWn8GSFESHJZ32eJgO4Y
	IVjgB4GecYWNnwaPho2zSiju3HILMcQBBeAtnzAdUSjq70D3p9ikkY7v4xOQ58XdcNLXXepK8RR
	PA+nHGKrEU24DUzXlIWm7n+gl1Tiv2wuMZJ+BCFa7mRt6DboTNR2coPFP6O3ZgknqFUtg7W95Zo
	f04USY0rzljoAZ4wBlGMoNIS7xb9Fs7GoKEMMay6PNVT8v/jG1XJp60qYZMvWQM28b0kQzX4+F5
	wZsgpWKvYVyCKYo8suJ8PkcOGFDeaSVKzKM19X2UMWkXbRd7tVszjG5mTIBi8ygB3aanPFP6PDd
	r8prmqCnAeetEN9aP+T/BSCxEFxoynfxxiDSNPD3zih8g1ihrGWSniFaGMYOWQQ90+1aKmjJ9OX
	cP4XMxhzvEb2EmkPHImAUrjX8LJS19vhMXcCMitBgaCp7+xDIZBvNlffl4JmQArYGlWuFxoFrHJ
	bNbXFRsF/4+B8N1c09IkBXF+AEgmM4ogPv+pXnS/UbZT2btEmZwZNkgRUNiIJIOVa78spe5al92
	24iJD5VsP23rMeYFGWdbMKSQF5GOMAGSVwW1MXFhduttW5P5SHzS44bPL8cMYr8OGbq8pOVEvGj
	tp6gZmQdokC+p9vK2K5cOQBc/fXNRljTTpA==
X-Received: by 2002:a17:90b:2f8c:b0:3ac:9ed8:f301 with SMTP id 98e67ed59e1d1-3b41c93fac6mr17486167a91.30.1795826287365;
        Fri, 27 Nov 2026 16:38:07 -0800 (PST)
Received: from localhost ([153.61.198.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm42125157a91.3.2026.11.27.16.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 16:38:06 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Nov 2026 00:38:06 +0000
Message-Id: <DN6FAEWV4D25.2PLLOZNKR0L1X@gmail.com>
Cc: "Jiri Pirko" <jiri@resnulli.us>, "David S . Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Willem de
 Bruijn" <willemb@google.com>, "Simon Horman" <horms@kernel.org>, "Shuah
 Khan" <shuah@kernel.org>, <linux-kselftest@vger.kernel.org>, "Victor
 Nogueira" <victor@mojatatu.com>, <stable@vger.kernel.org>,
 <syzbot+0054fed3dc9085390f51@syzkaller.appspotmail.com>, "shaos"
 <shawnq1@163.com>
Subject: Re: [PATCH net v5 0/2] net/sched: act_gate: bound the cycle time
 and start time arithmetic
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jamal Hadi Salim" <jhs@mojatatu.com>, <netdev@vger.kernel.org>
In-Reply-To: <ACT-WEXM.v5.r0.20261127063407@mojatatu.com>
References: <ACT-WEXM.v5.r0.20261127063407@mojatatu.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fri, Nov 27, 2026 at 03:43 AM Jamal Hadi Salim <jhs@mojatatu.com> wrote:
> Patch 1 bounds both attributes at KTIME_MAX and computes the next
> boundary with ktime_add_safe(), so an unrepresentable expiry saturates in
> the far future.  Patch 2 covers the accepted upper bound and both refusals
> in tc-testing.

For the series:
Acked-by: Alexei Starovoitov <ast@kernel.org>
