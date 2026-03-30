Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441A73DA7E9
	for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 16:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774889184; cv=pass; b=Re2Q4/CSrHj2oYPqDqzQoETlL8GgquQ35N7l9csIqVemB3iyaY8UpxuPpQJXiZraSzUkLSg/dlPA+OAwE87L2KKVdNB/PAkB64r4y2wNd3ymt+8Oc5GJZ5Z24nelvCZPQ2AqfQbJXdyl9dS+L/FpzROXvroY5fUSPt1N0Z292Ik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774889184; c=relaxed/simple;
	bh=4feyuDqrUmgHeKROraJQ/+XkjdShpl24vAeEH6ljdSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KQ1v6Af+ihBYacws/mF3djP+A7mvjCMybj0gdhFGtLTmLbJv4DJ6L6Xpcy3F6MkVt4R7a/JLptCiNs3eYKTEVOamiDmpY+QfpW87fCgtZB2oQjNZSyWmqaxVOXeCOnINiMLoFIgJO/XvcOUveGLIoXgwE76SeTh3Uwjl5c0etgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qoSvMK+X; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qoSvMK+X"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-66ba9898ae8so2473882a12.1
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 09:46:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774889182; cv=none;
        d=google.com; s=arc-20240605;
        b=TflmShpKSUvD+YMLyrZP5OWpWySTK+y6KGEIZEWYEb9JVQNKvMBY/Zc+a/JPO/4fen
         mrVrBfcZd0DclLMJ69JTquQHjxNUL5ziUKazTKDnrzanfbbA9kRPX9BKZGvAXF/7ikr2
         iJW6i270dPH6W3cKHwmw+d/pZK30xceYAxvsJ5fwS+03gnLtQdpUdUJCnOa8/TCEqE7h
         Q+KO83FV6ogAmLRjqLDBtzZG62G1HecTaFLvcbW50fDTDGMt0kIX4ww4rs0ahE19JfRB
         /P3EWubx1UWtqchjKdO+W5x0EcwXUJl0+xbmvr3KQDaOMp5a4vu/lu+YCgOqXaEeM7SU
         LQZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4feyuDqrUmgHeKROraJQ/+XkjdShpl24vAeEH6ljdSo=;
        fh=66b+uhHMJnnCU9c0zdMfo+hdXC5RstXLhANX8Kt4mJo=;
        b=Mdiw4u4QbVgugoo/utgUtANu+2q0qeym23kC2AcGF52KVRy6ghPBlg7RUyAAXeIW6N
         T48M7yG4iS/Z768ncCgRDappoUqISLDucypJmHQDw2ToQmqDxYyrEA9DBWxmvjJtYtIy
         YSb4LeKSuRgy45QYOf1xf+7HQK777dqk1PpP1rr+d6IMuFop3zd+HNKTg+wEVCZ2sj9K
         mPiViOmlhjwT+RQ9YBGrqiUz26ujrXET5Moil5lSuD1fkM4UnMU/1ZeDaEGdlo+IPr++
         yL04LgaKyabEXTa7kpCcyow9ZrLiiEn2SfPBDL7cREAHGekFuUaQ3Os6HfP/KVNXFE9p
         IYnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774889182; x=1775493982; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4feyuDqrUmgHeKROraJQ/+XkjdShpl24vAeEH6ljdSo=;
        b=qoSvMK+XNKgfVyFNZd6tPDdaEAR3wx1K7boBb9miPG6p7aATYEp4D9idJtIzGMVrZS
         jm+XmqNnDcydMEoJJVyEXqlWgvNQDMbJAlTOGA5LAuzhf1ProoNDo+R8tE+lUVbyNEZo
         Jzx3KqxSrBmiCQhD6kbz0LZ10BRmFcZ0v+Dat+mcZUvxCkGwxIUAN0tToSW0+VLQvpua
         dOm9ht0CC406u0iTWBnaC7U5cBzC5S9XmQiIIhxZcVl2XE9dTYtjPmOeZN7RlxCUQj/H
         ebRTRfKIV20ZFHbpwh/25AiTt4SxDxLM9vn/mdjEAuKXchR5w1n+QbQBi+/hPdCWKoSi
         yhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774889182; x=1775493982;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4feyuDqrUmgHeKROraJQ/+XkjdShpl24vAeEH6ljdSo=;
        b=jyErNZTSbRJWUQKzhsVwwofPMWVoCjo7tPvVN1seDqWRyuhGeOr7VWLgwSy/T8yTYH
         oGupXhLfk2atMQ2GRclc0cGJEjb/NNLJNvrEuHjIdRBV/w06GPHvZbWeUCZ/tpm6p+o3
         3tgjtaMCIp/OyhSCuU29dg/hAO/fzKzChfvlwsMFCWmPreRdDE9pGZpwiZRP1h/6FJt0
         k/v8464w++6LkeyO5aclFxodsvD0ROU5HI897+fFdk9M3fp2l+Y7QvTcRS0OeGCa2R+7
         dy+naLVuJyrScHlICOa9+Hu8iEg3QjvLfQ/SIObREuRTpzuybiKvmz68844xARJ77DU1
         ESxA==
X-Forwarded-Encrypted: i=1; AJvYcCX3GXKW8X+d//2wFsOVPGMMHIzbUfzGJCX/JU5OwVv/WncSTNZXSX3bU0nG12LlVGP6lEW/AVTYgf+RnOj2Wno=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDYXJWSuCi97PVTuMlCTfBVmvIenv90EWiB+oqMugFC7Xxtqxs
	m2CM/2NL/O7p6I822EzrTIqcnVMVsnWR5SeFEsOBTPc26LPDAn+CZoqbGr1/3Y5e0nOhMDSCWqz
	qOKd5A50O/gAQsfNfkYM4puP6cH9rt0Q=
X-Gm-Gg: ATEYQzxDH/giZMsGoTsruPCVqKD/amvPnCk4KyWzLo/t1qjXPpX109LEvlrci2aw5XD
	lrNW06qZalFRNvme59iuCzL0+dTxBTg9h5qxRPNCV1LdX3ABr+nKi95xuE36eROZXVVnCKCqoo/
	WG6HRbcgFJI3V6YgpT/cun8PncP/6mspHvjy1juh+WhbrgNB2pAp5R3doizr8Su90sJJbrnO1LK
	ide8cQwGJOgZGkptF+IumiUA9MTD59bngytoo6CVfv1CKqZftAgEM3W+19DmRRBxmmgT96pMEQI
	Wnwb6r9dv/QqwHp8q+EQTC6YU/KxOxWfBz+Nfq0=
X-Received: by 2002:a17:907:1b09:b0:b8f:d2a0:c283 with SMTP id
 a640c23a62f3a-b9be835abb3mr17283666b.1.1774889181445; Mon, 30 Mar 2026
 09:46:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327141616.1961457-1-hayatake396@gmail.com>
 <20260327141616.1961457-2-hayatake396@gmail.com> <CAADnVQLh76CWYJCJXgOst43FcJOrPP2Y0wcwGPX71QqmiD+7pA@mail.gmail.com>
 <CADFiAcLvdjE7zwqf-hpH01jnbxtnWQNoj4+zBwK0+RU80-k9bg@mail.gmail.com>
 <CAADnVQLR6Y94wKo1G_4w0-xTPdR8ws38oGu3xfHOXxNKcqjyWA@mail.gmail.com>
 <CADFiAcJtjVHYVQeYJ_znVsjiJkEBmLfOafp5srY0HQMGwVtiQQ@mail.gmail.com>
 <CAADnVQ+0EwaJXgS1WSDf12+Ds2Uxbh9KMpDcyq+gyZjcQ_6+dw@mail.gmail.com>
 <CADFiAcJFy-n5Zz+Wj1dWEH0WcK+PhKXi7cbvdsLnPhMXRcVktg@mail.gmail.com>
 <CAADnVQJmqKVZC1gkvAaAmO9V=cnYPO0UYB6Wyp6Shko4tZeUQg@mail.gmail.com>
 <CADFiAcJCrS0wjkPcGU9sCYQukEoegeZG7JMkqhGDYq5C43nfXA@mail.gmail.com> <4b0e7341-f2e2-4ad2-8c9e-b482a1b1cbfb@linux.dev>
In-Reply-To: <4b0e7341-f2e2-4ad2-8c9e-b482a1b1cbfb@linux.dev>
From: Takeru Hayasaka <hayatake396@gmail.com>
Date: Tue, 31 Mar 2026 01:46:10 +0900
X-Gm-Features: AQROBzCbYsF_0cVVV3z8GVQf9gn5AjGulzxIUzgv5Xjg0GCGvjjDqN_6nyl63fg
Message-ID: <CADFiAc+4hKQGSEo9XRvrNuTTK4LXwCfAqPMR3AMxiNBtZTc4mw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf, x86: patch tail-call fentry slot on
 non-IBT JITs
To: Leon Hwang <leon.hwang@linux.dev>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, bpf <bpf@vger.kernel.org>, 
	X86 ML <x86@kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

> Sounds like you are developing/maintaining an XDP project.
>
> If so, and the kernel carries the patches in
> https://lore.kernel.org/all/20230912150442.2009-1-hffilwlqm@gmail.com/,
> recommend modifying the XDP project using dispatcher like libxdp [1].
> Then, you are able to trace the subprogs which aim to run tail calls;
> meanwhile, you are able to filter packets using pcap-filter, and to
> output packets using bpf_xdp_output() helper.
>
> [1]
> https://github.com/xdp-project/xdp-tools/blob/main/lib/libxdp/xdp-dispatcher.c.in

Thank you very much for your wonderful comment, Leon.
This was the first time I learned that such a mechanism exists.

It is a very interesting ecosystem.
If I understand correctly, the idea is to invoke a component that
dumps pcap data as one of the tail-called components, right?
Thank you very much for sharing this idea with me.
If I have a chance to write a new XDP program in the future, I would
definitely like to try it.

On the other hand, I feel that it is somewhat difficult to apply this
idea directly to existing codebases, or to cases where the code is
written in Go using something like cilium/ebpf.
Also, when it comes to code running in production environments, making
changes itself can be difficult.

For that reason, I prototyped a tool like this.
It is something like a middle ground between xdpdump and xdpcap.
I built it so that only packets matched by cbpf are sent up through
perf, and while testing it, I noticed that it does not work well for
targets invoked via tail call.
This is what motivated me to send the patch.

https://github.com/takehaya/xdp-ninja

Once again, thank you for sharing the idea.
Takeru
