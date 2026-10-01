Received: from mail-qk2-f38.google.com (mail-qk2-f38.google.com [74.125.230.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0548F481246
	for <linux-kselftest@vger.kernel.org>; Thu,  1 Oct 2026 15:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867142; cv=none; b=mEKVdgGerwGue/peHHgHZJvHsipFZQtqKpvh6w5h3Nt9DkHMPS9D5w7wkur5j8y1FWKLeGYy72cxnin7q7F+lIIlKRFJF1NYMqvbaWBY1tnemVSptXq/QdXIANbBy9JqRhVvhSVSeUFRbaFwNiwqwOi3C8n+/crYXda2+ygGGYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867142; c=relaxed/simple;
	bh=maQ6x8roJBA2WylzBMepkb9jK3msk3HJQIscDYF+HeY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=XvQee5EQHFborng0h4AKSZyFEH8q1fIdv5tEddcnKXFYbDaj8VNCm4zQsdniYMvryqYs4N9oAgzrjmGzn8rF5o1qDOpw/MP6B5VGy521nBW+mB83Pq69kmvsaDTJiESslTTLgoslIeHdJef4nsPuz7YyYKc+Zy5wAZhMDC32HPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJlQ8wck; arc=none smtp.client-ip=74.125.230.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJlQ8wck"
Received: by mail-qk2-f38.google.com with SMTP id d75a77b69052e-5333b3bf8c2so15811461cf.1
        for <linux-kselftest@vger.kernel.org>; Thu, 01 Oct 2026 08:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790867140; x=1791471940; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TyPP9Ut3OTHXWr3R5HRJam87Qzk1xhJA+fOjlXaYcmc=;
        b=hJlQ8wckOAIPUWKWWsjwecAUnMJ134rjtY3eqLZLXVO4FNsbmUTLfXT4ECPGhawE6B
         +pklE6waAORORV1ovjj6OKi+YDbmtS4tlRllp1PZuuxtnH9kSVKzmZyzOrzQHacilSTa
         seWTx8JBcO0fZAP3YiA+LK2BreBzhXJZUR0s1bOLlnoZv2bxh3LZC1x7Up7ngyTq1u3+
         7ZRkk19z4wYteOtIWVZmSJhXzMVUGpVLyaEBc1lRjUJDS6kBbIxH27p+EGSSAwL4s+zT
         w9F5rOxNlCUFJsWp3Go/hGUyX0r3VhYxDS/LSI4DUE1Dy+AM406zxyGMYadMiRaIWexY
         lecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867140; x=1791471940;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TyPP9Ut3OTHXWr3R5HRJam87Qzk1xhJA+fOjlXaYcmc=;
        b=bsOlbrP1Pz2oPdRw1eb5KiFeQD8S7Q/1cEEaWtGjMIgzdnRaqRJ0vQyLnyae9YR+Hj
         iRbmNboPgIeKTdH5g/+ZD4zx/1J57K+e7lSZAyFVYHFAWifNx7CoGYdYqqepC5wAZj1e
         3Q7GRxB7ENaKoZA50WztRXdLXRVZs6vq5Yukqe4TQYOrD+qNVYVUvxZBI5D6Z8TKK3Ma
         d8ElolrBEBnezWHB3yBGZhQvYiw8uI/2vpRwpMYTiyPTw7jE6eKHzlKVEXRddLbjQDS4
         1HX7wigH7TEZztA/rWov9lY61y28peyfJpAcAZeT/P9qj1aVbIX8nl57A394xaX4Dr6k
         FL3A==
X-Forwarded-Encrypted: i=1; AKwUvBzb1VhPQvz3ozRLn24w+Mcl4ysPpWZP5SRBHrGq5OCbWgA5j/y8+Uo4NSfM+ikGtzbF35KzWL82x/JBowWSVIo=@vger.kernel.org
X-Gm-Message-State: AFuF++lAruCoJylllERpCXa4QaHz9h1U/2/l2KzqaDg4JgyWmNfv9XP/
	L3SZlLUi3vZPWxvKgusTonirAWSH+E/nf92xECA8KhW6P4+MeDXmoBg5
X-Gm-Gg: AYBFou031DqYB8UdxSIem5hx0xoeJKaAjxcsO0AulxJbSqT1wMejEaPeKFvH9YB4NSR
	Hy4e4hNArWc/Aey9YGvIvGf6HyE3qsw+ajeftOWP5JL9ychYCqCfP9uPaiPH+43lqPi8xP17ZXV
	1YStxwCgH5FGfhd7RtIzvsGL1+P3RqmbRRR6PmBksGca6uq7YzS4jbCbV39GKez49vcIKzODov2
	7QIfx2zMeiZCcTJGzkul/x7VEGGV0dFMfjlU26rGVxmM8gbDV9eyDLKpIPVFBmSlcISxIX+PcPy
	YV5yO5NW/pKgDCqQnaEbfK1cztzA7LGdfnWZ4Fo8zWYnHyBoiWyzfUvCkXigUcRGWaVk68JWue6
	BHyqBXPDC49qcnaDQ03OxU2GP9pQz+KIZVppzmIm80I5v+YV674j2CgrrSS579Salz6xL2M6Xyl
	lOkUh+H2Qm29qmaj0a6znox0ok0sZBl1YUDIRKxIa/S5HOcJQ+e2WEvXZrAw==
X-Received: by 2002:a05:622a:681b:20b0:533:3d41:b04b with SMTP id d75a77b69052e-5338307d732mr47618591cf.9.1790867138465;
        Thu, 01 Oct 2026 08:05:38 -0700 (PDT)
Received: from localhost ([2620:10d:c091:500::4:fd94])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53398d122a4sm106011cf.23.2026.10.01.08.05.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 08:05:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 11:05:36 -0400
Message-Id: <DLTLF0VWT5UY.2WUPQRDZJQO3W@gmail.com>
Cc: "Andrew Lunn" <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Shuah
 Khan" <shuah@kernel.org>, "Willem de Bruijn"
 <willemdebruijn.kernel@gmail.com>, "Simon Horman" <horms@kernel.org>,
 "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Randy Dunlap" <rdunlap@infradead.org>,
 "Kuniyuki Iwashima" <kuniyu@google.com>, "Willem de Bruijn"
 <willemb@google.com>, <netdev@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH net-next v2 0/4] net: psp: require an established
 connection for association setup
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sinfo@kernel.org>, "Daniel Zahka" <daniel.zahka@gmail.com>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20260930-psp-defeat-v2-0-f266e7447129@gmail.com>
 <179081213582.31693.9587233196664838966@kernel.org>
In-Reply-To: <179081213582.31693.9587233196664838966@kernel.org>

On Wed Sep 30, 2026 at 7:48 PM EDT, netdev-bot+sinfo wrote:
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

This patch could be taken as a fix with:
Fixes: 6b46ca260e22 ("net: psp: add socket security association code")

The main caveat is that the premise of defeaturing PSP listen sockets
relies on two net-next commits:
commit 8cc3aef0cb19 ("tcp: Do not allow buggy transitions between ehash and=
 lhash2.")
commit 404381b4f105 ("tcp: Set unhashed_state in inet_twsk_hashdance_schedu=
le().")

without the above commits, the part of the commit message about
defeaturing listen sockets is not true. I considered having just this
patch go into net without the promise of defeaturing PSP on listen
sockets, but I thought that would be suspect, because a reviewer could
point out that we are jumping through hoops to restrict to establishd,
but the socket could then be disconnected and transitioned to listen.
