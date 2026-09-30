Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA15E361DB8
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 02:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790734129; cv=pass; b=RT6mtjI1Rbak8euhZk8PSIhUp+IfTJkr8C3T6EYEqkV8pgYjwcMOqjKnV2l1DsEi6Qh0JSxag+Y9rOKE8AlYD1BfD7hM87C5MOD3WNky9hGcip5fNqODQfYyY86gpFNr5yE4rHTALm5FvlsWLiHXoUjGRsNCkgqgIcG9l5fuYDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790734129; c=relaxed/simple;
	bh=cHLQbGT9PXI0kmTGgvdCK4575npp2vblOC3chIxwSP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jj1tRPYVww7iQJmHOUEZUNAhw2nY4TTDNyn48ouUa7kgSiAzte+bkJTgNKKUGWPo1NPhkOByqr2iN4Yf3PDerrveTzz3atn2i4/DdymcIkYiVvRwFUM05tSxdDHlPGFxb00fp0yFwtlUIavJbGlQ9oJgZCY/t4H2ibFNX9j9VRg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n67kha2O; arc=pass smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n67kha2O"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a652b710a5so45613951fa.3
        for <linux-kselftest@vger.kernel.org>; Tue, 29 Sep 2026 19:08:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790734126; cv=none;
        d=google.com; s=arc-20260327;
        b=jNCcqgYEFfjnVQlnAYSO+MTnKnlNHiAljaJuTKKWnemrHIrXWBl4/KRFPPGaTvWDIe
         tSH9fphuqY1BWQYvNQQFGZrk4dHGOITFoPWx9aXaOW4CWigmgUAVAIjDUmt84zFXY7n0
         oXAL2zWQSIByxrfETnj6DT5tPtZTJLIvXaobfmB9b0v12paS2CVTezp9hAJMLSWy0J5/
         ITJZCGFZyPu1qd/uw4yenyoS40ptwUWVgi4tVfpthrvYyM0vbbtYS5mI+6Bnp+fiavuB
         h3PgWNPZzODsFJjCWOffES9rejuN5EQa8Dp0zh9hMfoI/BXnZobwySbBXSX/l//vCp2D
         6mNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/XpGo+Qr9OCMDAzBQXslhcLH2BJM+ZWKFH/nT0r3qdg=;
        fh=OgDqGc4pHTue6awYEzsAF1cW3aWxotB9Dv+fW+hMiN8=;
        b=HCFPO6SBWRsZ7RmqAFtgBi6P4WkU6zN9mrVCWJJjzBWN1pPO8NvlOVfsSIo5Yiizbd
         7qwy2YTdnISEXjZ7BVDkqH6R+O7uFlitzXtwm1i0D3edb8A6f/qJG/whoXBIMplonEID
         NjsSbDrlDYlB9scwv5EwPzPrdGFqVY89cjpBQ9QCGF319F/fY2iY8iY6nJMLZtcDNuZQ
         BXHYopCY1x3KV/pRkcMSjsrkkfznuI2CCGprcE72N+clUnUbXX5rrQnXq3mfyDRJSg2g
         ATAfPKCJQ+Y/QDwW6/lsSBKcLOAuG0x6RTtDtQ4p1c/DcbKbWVt4as6fvXXX2VvnvPf7
         NWJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790734126; x=1791338926; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/XpGo+Qr9OCMDAzBQXslhcLH2BJM+ZWKFH/nT0r3qdg=;
        b=n67kha2O3eRTAu/+9aajfOHbrfd1Pswfutj9JWRNNeH7FuRlIB4YYhJqkzkI1ee4sm
         WcApItTS+PrFM3Vf1eRBo4nGuRXMxnHOlIVIEuECOmFU28w3ImzedT1vbb6+L3oP5v2i
         7SvlJjF7iX3t6lOGk70a3mTVpguQSqnDdmdbS9YxKeZnIggBOHHr1//7CMXT5h892B85
         ouKOxmhMOEpb6HHVLV6VBss6G4YVVHUoy/IGS4Az5zvMczzVvGbZIVpTO0jDcetFxLLh
         xLkNOh0AchftufNtBDO9s+umtZvs+Kgb62TE5Jt9Gz4P9FtfJtbFX3B7NXEbWwBA+P0i
         Mo/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790734126; x=1791338926;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/XpGo+Qr9OCMDAzBQXslhcLH2BJM+ZWKFH/nT0r3qdg=;
        b=xRZnz8sbrqwnwxdE9DQPvR8r5hHSMPVi/zJK8YBY1AVtFK7kg25b4LATn1zw+9qDc+
         jfreC5pautaMsyJgrwG0lR8nNMNIR73S0dPjRREZXhjEKT71kUyDTxpr7Q1brnJ+0TSb
         MAPTxZ3ZD3NJoJNGRwhXjnw/m30taVxi42on1LJ2GUPJxkXvkMUI3ko79HRJ4sAFHyXK
         YhIhfPy9OXeFg9ulY+FkHrnQ/kyY7OlsyAqll+DvOz5Wju3Z4WOAvpqOaTvf8IoUJ9TO
         0+sP/+mhkHvN+fNeizTr0+tTECavT08cnb7Pk9lZuDAP6yIBQyaeqrJ8yzbvuAHKwDjT
         7GMQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgxvg8T1Kim80lYzAWnDCBVme+h1SLrW93IwhBTPjMtfRJRc8CR6NcevtPbvxvSl9NBBHhEomeX/IKwWLN/g8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXi2HNTwHZmQfpRNjBjI5Tcgp0iafZ7bWdqGifltKTntQ9+Xpb
	hUnOphT4gORgjl1uZ14qLre20FeYC97Lgx/BgBoGxrH/UqWaMo3Fn9N7JgprhwAliqQoJbbfOUk
	Ua/zkjs6B/OTMkaW1K0nfetsqA8PUc5Y=
X-Gm-Gg: AYBFou3fricWRHIAMSTkft0xf4W5CofRmcGS2mFYQ9FtmpzQAoB5UBVHwYM+dwp1XWz
	cayugWKGF7w73ZBvsD/wtGC0xv1nXSs7JR6sKSd61T5WAkGWSYjsqwTbNtc/IUlaqgoAJjs+87A
	tJ2hL+LB0QRoMhOubl+3+qe35v12GioUO9H8ysePfLJv40Z5yMGOJe3zzu4DpGwGzglzHu7N/8Q
	/O+aNxVrIoCoGzW+4D9c6I62v0WpGrGTnQrdPoJLENtyQ0AQ1BKN8H3fg9Rv6ES7xWDSjIGHAFh
	qRfwbCHLmGKoed9lDohIWXMUrRwOEoNg+OzJyEMO27dzlenjXP/Z/T5YusjNEsktH/mSiL0Zw26
	BpmMe94A=
X-Received: by 2002:a05:651c:b12:b0:3a3:749e:31a1 with SMTP id
 38308e7fff4ca-3a77924b77amr186021fa.21.1790734125697; Tue, 29 Sep 2026
 19:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929064742.576651-1-liushike123@gmail.com>
 <179066487225.31693.13001631968601791232@kernel.org> <CAL9mPHsf_10zX4Z_2WFHNJob7Tkfnaw6sp03q2+ujnTygn1Ucg@mail.gmail.com>
In-Reply-To: <CAL9mPHsf_10zX4Z_2WFHNJob7Tkfnaw6sp03q2+ujnTygn1Ucg@mail.gmail.com>
From: shike liu <liushike123@gmail.com>
Date: Wed, 30 Sep 2026 10:08:34 +0800
X-Gm-Features: AclHuK-Qp4hFCJIT-_w2B4gFyJoXlAvyzEx2aVeUJ5RKp0h3YBXE-WkFgycO1fk
Message-ID: <CAL9mPHuyOrK4WN4ZSWRFSYWpeTQBGjqXLDiy_Wr9AtEahL9KYw@mail.gmail.com>
Subject: Re: [RFC net-next 0/2] tipc: notify pending connects of peer node loss
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, jmaloy@redhat.com, tung.quang.nguyen@est.tech, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, shuah@kernel.org, tipc-discussion@lists.sourceforge.net, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The issue was first observed on actual network devices operating in a
  cluster. The client was waiting in connect() for the server to accept the
  connection. When contact with the peer node was lost, the pending
  connect did not return promptly and instead continued waiting for its
  connection timeout.

  I subsequently investigated the TIPC connection setup and node-loss
  paths with LLM assistance. The analysis showed that pending connects
  were not registered in the peer node's conn_sks list, so
  node_lost_contact() did not notify them. The initial report came from
  the observed device failure, rather than an LLM or static-analysis scan.

  I then reproduced the behavior using the same final selftest on the
  unmodified base kernel and on that base with this series applied, in
  x86_64 QEMU/KVM guests. The tests use two network namespaces connected
  by veth pairs and disable TIPC Ethernet bearers to simulate loss of
  connectivity.

  On the unmodified kernel, 8 tests passed and 10 failed. With the series
  applied, all 18 tests passed, covering SOCK_STREAM and SOCK_SEQPACKET.
  The node-loss cases check completion within two seconds and the
  expected EHOSTUNREACH error.

  I will include this discovery background in the commit message if a
  revised series is needed. I am not reposting the series solely for this
  clarification.

  Regards,
  liushike

shike liu <liushike123@gmail.com> =E4=BA=8E2026=E5=B9=B49=E6=9C=8830=E6=97=
=A5=E5=91=A8=E4=B8=89 10:01=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
>   > - How the issue was discovered, e.g. hit in production, hit during
>   >   development, syzbot report, manual code inspection, LLM or static
>   >   analysis tool scan.
>
>   The issue was first observed on actual network devices operating in a
>   cluster. The client was waiting in connect() for the server to accept t=
he
>   connection. When contact with the peer node was lost, the pending
>   connect did not return promptly and instead continued waiting for its
>   connection timeout.
>
>   I subsequently investigated the TIPC connection setup and node-loss
>   paths with LLM assistance. The analysis showed that pending connects
>   were not registered in the peer node's conn_sks list, so
>   node_lost_contact() did not notify them. The initial report came from
>   the observed device failure, rather than an LLM or static-analysis scan=
.
>
>   I then reproduced the behavior using the same final selftest on the
>   unmodified base kernel and on that base with this series applied, in
>   x86_64 QEMU/KVM guests. The tests use two network namespaces connected
>   by veth pairs and disable TIPC Ethernet bearers to simulate loss of
>   connectivity.
>
>   On the unmodified kernel, 8 tests passed and 10 failed. With the series
>   applied, all 18 tests passed, covering SOCK_STREAM and SOCK_SEQPACKET.
>   The node-loss cases check completion within two seconds and the
>   expected EHOSTUNREACH error.
>
>   I will include this discovery background in the commit message if a
>   revised series is needed. I am not reposting the series solely for this
>   clarification.
>
>   Regards,
>   liushike
>
> <netdev-bot+sinfo@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8829=E6=97=A5=
=E5=91=A8=E4=BA=8C 14:54=E5=86=99=E9=81=93=EF=BC=9A
>>
>> Hi!
>>
>> This is an automated message. This series looks like a fix, but its
>> commit messages seem to be missing some information:
>>
>>  - How the issue was discovered, e.g. hit in production, hit during
>>    development, syzbot report, manual code inspection, LLM or static
>>    analysis tool scan.
>>
>> Please do not repost the series just to address the above. Instead,
>> reply to this email with the missing information, so that reviewers
>> can take it into account. If the series needs another revision for
>> other reasons, please include the information in the commit messages
>> then.
>>
>> The evaluation is done by an LLM so it may be wrong, if you think
>> that is the case please reply and explain.
