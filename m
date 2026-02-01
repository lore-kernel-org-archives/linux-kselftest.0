Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424752701B1
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Feb 2026 10:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769941500; cv=pass; b=LubF9wAGI6wsBGijiDEj659/mVIc6Sg+7sZ/A+Nhni75lLfVlr0oy9Q/qIHlBqHBWtNt0f+n0bs3iKinNgiIZbJHt8jmh9r/cE2fVqIMTB8o3xvwGtCi1TIEwSRtB6GXtabw0cIg/HJz33P4QSJFKvsA9lN2eglAzEzBa3RMHNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769941500; c=relaxed/simple;
	bh=c13X9iCoqEMpER2AIG5Pt/jrhfKFm2Mm4FnRZDWIDoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NCCCu3HkSjVEpVKFXdhYTLMy0jRtI1XQPdvbZf6w5KD43rKpKnQGElX4lziHqR3s+xr76cf4+QFQf8MvQ+S/D7DDyBms/tIeVq5NiEC+pxCDvfy/ZrPJkx8MIIdbgtfs18xl5MuLCh/c4v8l4o2rN0uExy5qA274P1kkTpcQTPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MIjfYEv3; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MIjfYEv3"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-50335b926c2so30652791cf.2
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Feb 2026 02:24:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769941498; cv=none;
        d=google.com; s=arc-20240605;
        b=OLKFtaDZLNpTic6V+um2bIVBbX5etAGQrlpHMj0VBrPp1o9nzFeCqmvDuA3S2ak3qm
         WyCPew6fQ6rjSIaKt/+zIhBHtFzX2rJs2uCZaYQyNWAmgpE+l4PuQySWDPIglpb6guS7
         bxFq0fH8C2MtQ2ipP5K2kHGT9DZvK4sT+XmVTiPVbdWda7CYaUE9N7TYOR3b5aWMC+wD
         SiiMmgg9dLIGBc23CCzgfFQ6yITD31w4JM5XPqP5VQdlK3gzttdJqCD1dyldaOLN8K8/
         oxsNgvuBRqL0BHQ+7ic9XWR4dB8Isk6xDDxD5qxK5mED1JtGIr16/xoTuXPJxHi+gAKg
         55OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c13X9iCoqEMpER2AIG5Pt/jrhfKFm2Mm4FnRZDWIDoY=;
        fh=1qysDVs3ctjm8VrGNvO4SN5MHQ+Zd+BrC7h/2n4icmY=;
        b=D9fvPudsQ9h52u97Qyh7obC67jg/wo1pdS9Dc7VYU2x3WPZFynrViOTv/m+ngcUc6l
         TmRWjxb58YNduQIYMhy2h+Y6yz4+I9bGEK7SXflP+UeozCkcgSkuIAIjLIq2EjRNGm9M
         vZG7UB077FkZl3B+7l9JEgUjKiK0WeXNLpyY4qMY3SQ52GyI82e4A7cZa/v3e68ns1uZ
         O4ymGbFkHprGcvbz32mUEuv82jrSwK1bK2/wjHu2W1iRsN4yaoTz4TG1avjVoAIHtq+N
         J+PFQ+fu1m4cD19i8G4Uwd3I6mlMtN2e3J4fDkyDm8pr2xA0+5pCqoKZmPKxueUOQ3ph
         zYFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769941498; x=1770546298; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c13X9iCoqEMpER2AIG5Pt/jrhfKFm2Mm4FnRZDWIDoY=;
        b=MIjfYEv3Li6hV8HO6FS2uLcjF2ZAWGHiV2K89t/jxIh7U/LFzvM7tuO2Vr0/5fAJn7
         W1lfRwlTpWXhXqgkDo9uwtizhOwQRPz4HZdv+l/cD4zGjTfanmdcnduR+P22Hu5jZ7RI
         R/U9Zjx5A/YmVYq23CZNHb+ZCaXbCBvoHivYaqTxjcCCrz8ZCx6XpzR+TveF3oVJgxAP
         KSlevuxG50TfBx/Sb1MP1A9Cnj7QJCoMtBAKEl/rhCE8hMbQTz5NuwYkuJqx5vHQQ0hU
         RacLMLDg/KbdMT2Dz5cCfjeZF3CWGCPZVJVJJnnPi52nFe5T+rxN62m4NjSRllgAiQ+e
         rXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769941498; x=1770546298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c13X9iCoqEMpER2AIG5Pt/jrhfKFm2Mm4FnRZDWIDoY=;
        b=sE8uSx2MgGqUw858tdAqroA3MQwI/jctcsTfxz3Zy8HhApCN44uBDffBcqgH53xree
         6sUfjRdLcol8P4es5r//bZvAN07m9zHgNhvzHH1k+5YRGU62DV1DSXWZOAzRuFCaDmVT
         HpIZoXmM6HbJUxrh4i+Q3gKdAyrcpSMASKapRjBliCnGOSNaXJTMTqk9RS4nMUWbSG7e
         qwt4HDrAa4jCr4dNzXdTVpF3h3/u+Svr+F/2pfvtF01Eq0H0RLapmgtv0IngZAFyK61o
         SGxaYuGJplazl1yzVqGiaWitcepI7ub6IAe8EuXbsL9TzDjwVfqWYH2bKpQDqQhyR7xz
         sZhA==
X-Forwarded-Encrypted: i=1; AJvYcCV8RPzvB4o7uQXLhVWImuXx0g2NaiMDHfCFyPni0ISJDIofNcCdji0ubPsVKpefbCJg3bF30NlNdjZU/SKOZS0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyyG7lehN5AOwD/hA5MJIXb885n//rhbcBsjnKxyKOqkl39Y4L
	r1AMb6bERh/WQ+oAZA27HisMFWVI3K/txdpNfV7O1iuA6WjS2yLeA3rwt7zFafOcX/Uo0mQQG/U
	CqnNsygvI0MzFeTqaqHohqfk8ZSvPPitjTUYe9KeI
X-Gm-Gg: AZuq6aJjWlBTBvfjaBXbF4Opg+wsuH0ELWW/IHrZJmjfa9rpbzEIDXXjG2M+HHLRarN
	rkUO7PIGmb2A/HM0b+CtlIV9+pNGp0g9JarId+WNbWbIHgpSvpY3xURTxdGyasCIyFiNYEJU1LW
	RiH+LUf4z68gdqCW+RCp9dN+AAXxHLnZvxHpODGvGLSdSqX6zV4bbOgmtjPnBc/Whrtrp6aiSlN
	yxLFmyOjFH897+lqWH09VIbC3yD+rtAyS2y6fgFrrb1PMjtS4qseDpHaZQtyEEGZzq+TiE=
X-Received: by 2002:a05:622a:510:b0:503:36ba:1315 with SMTP id
 d75a77b69052e-505d212dc92mr105121131cf.17.1769941497854; Sun, 01 Feb 2026
 02:24:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260131222515.8485-1-chia-yu.chang@nokia-bell-labs.com> <20260131222515.8485-13-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260131222515.8485-13-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Sun, 1 Feb 2026 11:24:46 +0100
X-Gm-Features: AZwV_Qje-4lGonBagy2Li1XCvjDteYMc2SXNllbyqn7JUJVP33Ro8aW2ZhSaRR4
Message-ID: <CANn89i+8vG=DiXrd9tbv2PCH_ALpDYUKsj5jm4Jk+G7Qp+2EPQ@mail.gmail.com>
Subject: Re: [PATCH v13 net-next 12/15] tcp: accecn: detect loss ACK w/ AccECN
 option and add TCP_ACCECN_OPTION_PERSIST
To: chia-yu.chang@nokia-bell-labs.com
Cc: pabeni@redhat.com, parav@nvidia.com, linux-doc@vger.kernel.org, 
	corbet@lwn.net, horms@kernel.org, dsahern@kernel.org, kuniyu@google.com, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, dave.taht@gmail.com, 
	jhs@mojatatu.com, kuba@kernel.org, stephen@networkplumber.org, 
	xiyou.wangcong@gmail.com, jiri@resnulli.us, davem@davemloft.net, 
	andrew+netdev@lunn.ch, donald.hunter@gmail.com, ast@fiberby.net, 
	liuhangbin@gmail.com, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	ij@kernel.org, ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com, 
	g.white@cablelabs.com, ingemar.s.johansson@ericsson.com, 
	mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at, 
	Jason_Livingood@comcast.com, vidhi_goel@apple.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 31, 2026 at 11:26=E2=80=AFPM <chia-yu.chang@nokia-bell-labs.com=
> wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> Detect spurious retransmission of a previously sent ACK carrying the
> AccECN option after the second retransmission. Since this might be caused
> by the middlebox dropping ACK with options it does not recognize, disable
> the sending of the AccECN option in all subsequent ACKs. This patch
> follows Section 3.2.3.2.2 of AccECN spec (RFC9768), and a new field
> (accecn_opt_sent_w_dsack) is added to indicate that an AccECN option was
> sent with duplicate SACK info.
>
> Also, a new AccECN option sending mode is added to tcp_ecn_option sysctl:
> (TCP_ECN_OPTION_PERSIST), which ignores the AccECN fallback policy and
> persistently sends AccECN option once it fits into TCP option space.
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Acked-by: Paolo Abeni <pabeni@redhat.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>
