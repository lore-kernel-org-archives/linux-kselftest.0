Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D75D37DE9D
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 01:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791424311; cv=pass; b=qkjn13kmBaNc5CKthD/dc0Rc90TJ7xUpoA/FPdAqHDItA/Dn8uzSKMQf/f7DOoAMgDSLbX6zUaAYo1J8SN0sGUKJAIqM0awSZkEAos6Uc3AEqSbtUkwTW0PovxZI1h75nYdDk/IM8B5Uf/Wkd2kXJuFzfwzxA/DQCzkdQCFySnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791424311; c=relaxed/simple;
	bh=mHy1hYNfLYf8HboALp2RXqTAvR4x9VzZDrNkBtBzrj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PZ0ugL3AF/bJ5KPAa+zyRLg/WvNuR9Skyjm+h4ZMsMOef9bzLbazSxP5nDFeO332KJEfsibG+yRWVgZhEnUbv4EnoWxZ2FzS2WlzmEr9dNxHwYF3O7E6jtLlnzQnKiZjpKG4QrcNxp430mReCnRDubIu6cq/s7K/IlPuMBIZuWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpVb5+zF; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpVb5+zF"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a20dec69f9so18743451fa.3
        for <linux-kselftest@vger.kernel.org>; Wed, 07 Oct 2026 18:51:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791424308; cv=none;
        d=google.com; s=arc-20260327;
        b=R1+5O55cfMcV1RHTxCR2i4eRUZOM7rvO4zzPza5Qu+ove7cL5nfL9+T1f9vYz7VcL9
         r/WV+xfgVE/7chX0UdDizbCICutbSl2pMQrhp2y2qMJoScUSvs25uUgYxf7TlYzCkC7t
         /s8ytno1mvgrSTbZe2VFUnODPuVXodXUqdprJw0x3pk0T+g6y0tV5UHFKDCLJ3u8UJN8
         2BBvR3HwCT8WdLxOlK5YJxhV3wCZdc1BnI5AWZmnuLJXZ4aZNPLJ+MBclClk9847P4TO
         gd0PD3Fbc1LTvYzfJvbFjAwNCEHW2L2cacnFiSgUEYbDzR+KKWFAe4Ri4QuVsPOTIPZy
         sXwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=axDNfEaKpBNUafTexjltXvW8jUqInU0yDMsNDS8+aYA=;
        fh=ICexedi3KGcSSGmmzWqU6n64tUoPlPSGWFNqmk16ibM=;
        b=cjQsvYLcE1yN1QlDSJzRLjYw8RwAi37W27+HOV7A5M/g++0BDlUTsge/l0mT/tRrf/
         TDEwZ4mb2VLH21yJaWyYeS76Ga2u4bMegLQuJszmNEAoQ+3aaoF3ESUnMfCp+7kgHUJJ
         6siZ7L6jj9nSbWtaUPh5eDtVoup1eXN3ZtYlx6cE3vlCn3RrJ4sooZi1XA4uJUcLsOiH
         DfjAFg2RDFqS2f4n2bu7/qr2IVV910E88MGHLeAgbIW1vOJq8jBGC0UwtRTQyAGkP5kT
         4yXJP8gcSpAXYSnLlsLanJGfTsB+unLK9Wl27W55pedAwJmZPS4TUhelHKkT5rCby0da
         o4Mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791424308; x=1792029108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=axDNfEaKpBNUafTexjltXvW8jUqInU0yDMsNDS8+aYA=;
        b=EpVb5+zFuMnwzfKlWr9fCa6Pu/DmtTmaF8kEtx6rZi5xvVIqSHvYX4coYUu3j6EDzP
         STf1rEjbY/D4IZdQoneYf98dmi6WgsRh18xIvLOS24QkBviXjvmqy/+sLOebbm0OhP33
         7Do5bt4QHv0oO1x2mIZRTnjeI141k9PLJig1WnoUpGoMas4C5zJ+rddg0f23oRFSBEGe
         1MEQiFuyiicuzn9V1svDlnr4G0jqCMJQJKFAydaEEdA6AfJeRHM0jO74Nrv8HXl0O8gl
         +kU7061AdP03BocmIrWANDbrbxQdLhQqgapOMQEpsN9tIWpjfAj/f7tZ86BpOjIL9WQ3
         W1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791424308; x=1792029108;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=axDNfEaKpBNUafTexjltXvW8jUqInU0yDMsNDS8+aYA=;
        b=z3tQxEwUDXAK21zV5rIblSMxf5unITUZS9ulFYfFH2u66JM72hlbXqfXdxBBw03nym
         lHrehsujiKtKz90cuTx+25NZjx7cnZzZUOhzrATjNgYPV178jbFOw3irZrl+y890FYCJ
         iGnwTJoBaTilE3fGjN8f5K8Np+cy07yWy5cYDSrfIhZcy5EUK77dspVKF71tfcYXMkRK
         aObQB9suefAbyedfCzZY3pjz3DQx+JFJ+ihcrlSCw5bUIEaBlCO+Cc7330krOavWmwCD
         Sdj9C19alG9lxEOGnZYUpwlIzlvg7Y9OckY55S/OgzC6z6oNRxZIcaJzLiMEhSxeO12f
         bzuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxixJJ0CtoTrB7lLkTXkI+j4Mf1sz5g7/+jJh5Sr6NtZVkoIxf00nwe76nljBNP9mFEi2SHh83EcnekV84Re/8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKN8I3aU6usbvkQm+KV1tigXptJwSb6OglhCQvKV36FZmJmkZrb
	KHs0lM4uFE5fWU/YTaUylfrIedQHjkBnR6ARB/kA9WNJ5ma5U33kCI+N76oB2o8Ca3iAdJXlOhN
	ncIQdmm83nrtlWvJI2syrLgoP9IvUiWHvleL5asYEIAvA
X-Gm-Gg: AYBFou3rqqYe0Ul3hCwG71dLGxoJJXvP8/wmS7XgSULM1mNcsWpJX6gFXvM3Nx+Um8D
	bZ3uic7b86sVEudmfM0r42xNBoQC7cPiGpYucgooHoG5m0rinEbCSStRJIk2f49XUULyY7O9C3D
	iVWFVW0Mo59nnTnzz5GI3Wpt6Dl/lNwTFPPmxhRV9tXVpOTkWh/Qex5jfZ3JVEPz00RcdeS53GL
	dxOjEu1aYCANnV/z4uxyEleNBHKPsLuNAf/Zk7HiU53kEajUNYpg67193uFDGc/CMeNB0uKVDM6
	wgoStLbBwy9Hdp2MPuPc09XKgdwNfaFBALIIqqw2yrqoj82ZS9cHqE1Hy08dIZHdc4ztTDM=
X-Received: by 2002:a05:651c:a212:10b0:3a9:9f8b:7911 with SMTP id
 38308e7fff4ca-3a9a2d30c3bmr6229221fa.28.1791424307884; Wed, 07 Oct 2026
 18:51:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929064742.576651-1-liushike123@gmail.com>
 <179066487225.31693.13001631968601791232@kernel.org> <CAL9mPHsf_10zX4Z_2WFHNJob7Tkfnaw6sp03q2+ujnTygn1Ucg@mail.gmail.com>
 <CAL9mPHuyOrK4WN4ZSWRFSYWpeTQBGjqXLDiy_Wr9AtEahL9KYw@mail.gmail.com>
In-Reply-To: <CAL9mPHuyOrK4WN4ZSWRFSYWpeTQBGjqXLDiy_Wr9AtEahL9KYw@mail.gmail.com>
From: shike liu <liushike123@gmail.com>
Date: Thu, 8 Oct 2026 09:51:36 +0800
X-Gm-Features: AclHuK8_27azU1CeyvfqOiVJ6y7v9RzdtGB-k40TFQNVY_vcIlwqkH_ABsVJ3XM
Message-ID: <CAL9mPHut_XjQMQpq0L8tuTs6D2oZwbgDE3VkFbY1fXG_n8H5qw@mail.gmail.com>
Subject: Re: [RFC net-next 0/2] tipc: notify pending connects of peer node loss
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, jmaloy@redhat.com, tung.quang.nguyen@est.tech, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, shuah@kernel.org, tipc-discussion@lists.sourceforge.net, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

  I would like to clarify the next step for this RFC series.

  The issue was observed on actual network devices operating in a
  cluster. I have provided the discovery background in this thread.
  The same selftest produced 8 passes and 10 failures on the unmodified
  base, and all 18 tests passed with the series applied.

  I have not received technical feedback on the approach yet. Since
  this fixes an observed connection setup failure, would net be the
  preferred target rather than net-next?

  I have not yet reliably identified the original introducing commit
  for a Fixes tag. I would appreciate guidance on that point and on
  whether to proceed with a non-RFC submission.

  Regards,
  liushike

shike liu <liushike123@gmail.com> =E4=BA=8E2026=E5=B9=B49=E6=9C=8830=E6=97=
=A5=E5=91=A8=E4=B8=89 10:08=E5=86=99=E9=81=93=EF=BC=9A
>
> The issue was first observed on actual network devices operating in a
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
> shike liu <liushike123@gmail.com> =E4=BA=8E2026=E5=B9=B49=E6=9C=8830=E6=
=97=A5=E5=91=A8=E4=B8=89 10:01=E5=86=99=E9=81=93=EF=BC=9A
> >
> > Hi,
> >
> >   > - How the issue was discovered, e.g. hit in production, hit during
> >   >   development, syzbot report, manual code inspection, LLM or static
> >   >   analysis tool scan.
> >
> >   The issue was first observed on actual network devices operating in a
> >   cluster. The client was waiting in connect() for the server to accept=
 the
> >   connection. When contact with the peer node was lost, the pending
> >   connect did not return promptly and instead continued waiting for its
> >   connection timeout.
> >
> >   I subsequently investigated the TIPC connection setup and node-loss
> >   paths with LLM assistance. The analysis showed that pending connects
> >   were not registered in the peer node's conn_sks list, so
> >   node_lost_contact() did not notify them. The initial report came from
> >   the observed device failure, rather than an LLM or static-analysis sc=
an.
> >
> >   I then reproduced the behavior using the same final selftest on the
> >   unmodified base kernel and on that base with this series applied, in
> >   x86_64 QEMU/KVM guests. The tests use two network namespaces connecte=
d
> >   by veth pairs and disable TIPC Ethernet bearers to simulate loss of
> >   connectivity.
> >
> >   On the unmodified kernel, 8 tests passed and 10 failed. With the seri=
es
> >   applied, all 18 tests passed, covering SOCK_STREAM and SOCK_SEQPACKET=
.
> >   The node-loss cases check completion within two seconds and the
> >   expected EHOSTUNREACH error.
> >
> >   I will include this discovery background in the commit message if a
> >   revised series is needed. I am not reposting the series solely for th=
is
> >   clarification.
> >
> >   Regards,
> >   liushike
> >
> > <netdev-bot+sinfo@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8829=E6=97=
=A5=E5=91=A8=E4=BA=8C 14:54=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >> Hi!
> >>
> >> This is an automated message. This series looks like a fix, but its
> >> commit messages seem to be missing some information:
> >>
> >>  - How the issue was discovered, e.g. hit in production, hit during
> >>    development, syzbot report, manual code inspection, LLM or static
> >>    analysis tool scan.
> >>
> >> Please do not repost the series just to address the above. Instead,
> >> reply to this email with the missing information, so that reviewers
> >> can take it into account. If the series needs another revision for
> >> other reasons, please include the information in the commit messages
> >> then.
> >>
> >> The evaluation is done by an LLM so it may be wrong, if you think
> >> that is the case please reply and explain.
