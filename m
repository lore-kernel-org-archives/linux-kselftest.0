Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3708A3C0607
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 06:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791440815; cv=pass; b=BrvG1z+MoDf14A7P7KkFpMZE9H0ZkHB0q+/pw7BkAKwNFt3++30K498KwixAeCUHWCOH9v3jNjCvMIjU7Xw3GVKiwvmSUVpTYNXA/hGKbvjuvNWlz6O+9eSUNCHnbe+EMzbl6yTVIkG+mDGGvz1ks5aQhnk9xYr2qItsiDqFi9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791440815; c=relaxed/simple;
	bh=8vVAdJqYOL+ADapkFtSl2CCafn56786jZvzqU7pet3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d3Whl79MniU0iAp6Uil176uiwuW2FGjbVqZrUvJlekuY+r9v5iWENHWiKzsB6V/H5cunVJLdvAipRQ2I2YCmeKTYgp/Dw4MEtUuZOG6DQoRcNo6yxb3l1wzN1W4v7QgtYb3hhuLMDeCDOE1kw5WtGNMr49gkTK8IEijtTFq0gpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YCsH55qG; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YCsH55qG"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33c2520ad38so6194041eec.1
        for <linux-kselftest@vger.kernel.org>; Wed, 07 Oct 2026 23:26:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791440813; cv=none;
        d=google.com; s=arc-20260327;
        b=s9MoYKEiPSvxNNBn5QdoKtxs5XdVkjioQ49PL85ekGCKvcZHeuz1J4DTRZ02xumRlx
         uGdFycS6K2iLsSKiyrzt5T3+SNI2JFntdBcujNLVEzpThueeXoGczf1PC+y5pcPsdDbK
         sdEByDxgNifXjAQ+GjnNzs9nikprykgQYwNz2VhhHDu6lxDpb6geCm1Ahs0hk/WfeLF3
         VfF6YJ9Ol7kIgZtYHAPmcdM5rslbH9TbUL44T/c/7mZPPBE53fL/BwUJVebbsMLbxwWR
         oLPX8DXdM9/prj8uk6jY71pSG4qaURqFGOtyn++Z6qHJ1q/o6avIgcpIN1NDiI6VcyFo
         7E/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8vVAdJqYOL+ADapkFtSl2CCafn56786jZvzqU7pet3w=;
        fh=gb+P0w8E5rL3lpk3wha7JeZ0MMgH+W+Ao4N0sdGSUmQ=;
        b=VDRc0Ah0ZWaSu+za+PbjnzyWvLoVLMqyWSFY6HN2OZWXfX+zzyQFeSJ1TT1uvY/ZA5
         xx5mnjZ88zWshvSe6Mm8hgdqP6HdRwExeiA2fakpiaORbAQhbGB7mW6r5w+JS3cL7xbl
         Q/wsuyW3Qfas4tN5c9Pa0+PaSIBxnxFSROv9jlDES2hWVV4o0zEIbRXY7TDmi60xnwQB
         1aR3vvxovZv41kBAFF+RLZTf4tZbTioTVqeEhgTmi39yXBidX3+coOTWYrb5DixLdO4e
         z7zxtE7XuyV5rTvSyFIco+rzME2tHGdHLFWZcVhKKnAjDxKCfSwHNld0C/I0ulRs8Z5F
         DC+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791440813; x=1792045613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8vVAdJqYOL+ADapkFtSl2CCafn56786jZvzqU7pet3w=;
        b=YCsH55qG+7e6u3aqcScSLsz6pbqmJnUckEVNfedK6TgfU8Z9f7KUJ0NIQTa8Kpztzb
         nDedMeOSpp6HTXQLIsa/l+IgllCY4xIYv8La1s+bS1tbBnJ3F6NsiWE7DCACX6pnL0jA
         4fu1e/+9gsLRlmK3k+f+KjxvsHgtU37M5o/Yw1XlNoLfaUXMMhGEogOb8Ee2l3rpSIAg
         avzXKSnXLd7yLnKfXFmVLQDX1c7SCBdb246RkqgCZ013IMUtMLkBbRNvUTTCE673nn/8
         c3UIgeAA7qbmgybdsH267DETJ6vT05H1CFODipWU62BdJHwEbMI9DsVZfuhe4ysHXfsF
         +0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791440813; x=1792045613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8vVAdJqYOL+ADapkFtSl2CCafn56786jZvzqU7pet3w=;
        b=jr7UuGdLRHL21fTU7E4i8aEWQHyecpICQ+2YfLu5JCEpeIu9iXC0xthDQ7rZOk9Az7
         0hAum+wEFDcAcpJkN3k3jCUkv6jTe11v2uzqhCOMqisG3Cj4P3HZUz5wGvgAiX99HeuC
         sqBeszXv2Sfcn27V1VRrNciB0g7MqCAj3w2nVm8L47cwxXHmLZuJz4nxcHaqt59EyEn5
         LJYRMaveWn0iLGZ8c91DHN9R4zHsCEOnqRA8HrBfka0Ykx6jBurWMem1LuktBT2dK7ad
         k1H7SOGymFTncvqNudxBbMjFd9jmmQOXGjK4q2GedxqbTaxvaPzZMx0YO96lPculK9fG
         YhnQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/fkWGWx11hX4RWlQNWEVLZXJ+GjUUJnrW+EgTaNWMoSNhzU27edtTjxVdnUzNXqxG2mzuINZI5Ytl+pvc+wk=@vger.kernel.org
X-Gm-Message-State: AFuF++mULxlF7QT77mHhsRza+JRBUeGGh2TNHjJmKAOTel4BV9mbM6JT
	/O5hVbEDhhxLeKaAk47CHOaBRMs/bk6+hwuYojtObFe7cdZ1+W5hICsGDOiM+p2oLfR/TeZzvbU
	L/18abWo7Y2hYP0iBzkdi0IqnyI7usjjKzOvBcGkE
X-Gm-Gg: AYBFou2fLfZVnYeGD6TGOkPgLSzSFvb0IsX7LvQ6+ehEEVhCmaO7wTdG48kNt98+0Zt
	wruejpy6YusLWCgIL8lPZEy+Q4vWXkG2oS7HN1Q41oXVGmVZ5hVML2Qu4QwXKS2dfQlG0Kn49+v
	PkkpgheSOgJuQ+12d0s6LZN54f/xf80QoEt5KNytwEmVNZSvUs+AZ2pWsE5R2ma1oJX3+j7H8E2
	9VmnGY+IRRmoXGTPEYxm5l/9bqXow8LDnkfZ9mNMOOmwHeG/DsSJ+vA+NLokgPnaZLO5oZnIB/U
	n0DBYgOZLcxjzcRjHemoz5YLAP4jvYSXobYOcz/TiDQUpxrkGjKZsIac6Y7oQGrZtZX6WL+1lsC
	D/6xAIf9fFTFFFJB2UYz0xjdDyDM4buQUtCSaKRH6bRITLBzhIrscXmkpwe05NH7evoY0ZLtOSO
	P3fKG5wEOgs68E0pdkJqECshL/
X-Received: by 2002:a05:701b:241a:b0:14b:2ef:9821 with SMTP id
 a92af1059eb24-161fdbee28amr5081076c88.3.1791440812346; Wed, 07 Oct 2026
 23:26:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008055233.3413445-1-sahaj123.sc@gmail.com>
In-Reply-To: <20261008055233.3413445-1-sahaj123.sc@gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 7 Oct 2026 23:26:39 -0700
X-Gm-Features: AclHuK_6KN2ZkAkZI5-CoJRDyPSkt1Y9b6vXV5rGVVGfwb6qixN0dbXfsSvTFvw
Message-ID: <CAAVpQUAFcwCefyELhccLvKutz3ZhNYv8fyh7ezyQRoVDZzWTRA@mail.gmail.com>
Subject: Re: [RFC net-next] selftests: af_unix: test zero-length MSG_PEEK with
 OOB data
To: Sahaj Chaudhari <sahaj123.sc@gmail.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 10:51=E2=80=AFPM Sahaj Chaudhari <sahaj123.sc@gmail.=
com> wrote:
>
> A zero-length MSG_PEEK on an AF_UNIX stream socket can busy-loop when
> an OOB skb is queued. Add a regression test that sends MSG_OOB and
> checks that recv(..., 0, MSG_PEEK) returns promptly in a child process.

This is covered in msg_oob.c.

---
pw-bot: rejected
