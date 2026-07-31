Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BA7298CC4
	for <linux-kselftest@vger.kernel.org>; Fri, 31 Jul 2026 00:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785456075; cv=pass; b=P7ds1B1dF/6Y3iwjb6JneEQQa6av6WgQfTDEIhpiB2xXSBSRwAD4Y9pv1U2akEn1SMyUSPfkpXmMOv6injZ46l8/iKF7ho1/lw3IvMPoflkFA0NM+VixNDSaJjq6XL607rnVN2mfQPBjiYVFbPoY847HZYxyyQRn2WoJyJWWFNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785456075; c=relaxed/simple;
	bh=jkjv3zkZuKcst+AaRQDTEpkwTvvO7l2pCMgYw+titho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iZZUlS2mwMbnHTFSM8jb+UTNT5ewiAHe4dTlRqNuUg8nLMFdHnnl8jS7rlO02uHhXzaH1Z57smf5dFapxMzf6h1Ff7NizBlUEia+T9HtwqF8yDyU3vykLSJpeN/Fwge9sJt6s2WgMxXjrr0XqHJeOFQfdi6t2eOBQevHDub/eus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lk/DigPl; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lk/DigPl"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c04bf4711so2975501cf.2
        for <linux-kselftest@vger.kernel.org>; Thu, 30 Jul 2026 17:01:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785456072; cv=none;
        d=google.com; s=arc-20260327;
        b=Q3YqSqxabbSmx4/3S1RvmnW+mu6v/ikaS9yEJefAA6VAQpsZF0AUgOfU6rmdVcgy5S
         jqezYZmjYmdJKCQkqAnYuUMmm4cbQFLd9odBtQ5B+omM4gRVNfZECOxTDcBEaNF0wYay
         QADRINVV2iTWz8rDybZgGeVvDGmvfvA5HcMZ9C6bsdCODenZJO8AENHjTfC3b7Mdrvji
         J/YVLpL7DDQ2px0ONO5GNhaxv+WOxLtwXpZAovT3SglEbQ9P4mY2KRC2I255WlaxpUZ6
         NwxYj6VEXaQJQsPWHzVJr7tN5JRULYQ7bWQ4uBhi8bFqborgF61BOxaYuJLoP7fgxIAt
         GbOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jkjv3zkZuKcst+AaRQDTEpkwTvvO7l2pCMgYw+titho=;
        fh=z3efn1EvyB+VSozLaa+9mzCgpqpo4x05W1ApvkWkSjQ=;
        b=r9I9h3cqmkjDfZ7ijzKeWLwtG2uz1A4MRMYaOC577ZPfvHT7dIRumI0k1zRloPShGW
         jFIzzSDHEvcNlD6VvogPpocnXMzKmIy32QmdfmKloCm+BKK1dHSZCJ+/fpPDr4ZhXlUR
         zV8z5zOMr4Z0XVm8fuvX2loaXMYBYNLwrPg2ebYtpXdz2LsNcQZ+OjZjIdpiWmZYJjdM
         pw1E5qwztOQq0EBxkFfbL1JGbcUdqkerDi5gDcxuszKKxqiKE+oEBWri0zOnoddYnTTe
         dKt22fRpAwv0vso7xJnerbfkqXb4K4KV030skpFaLPXgQFwDBVZWLO8OUkJgti7hEnnr
         Q3Aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785456072; x=1786060872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jkjv3zkZuKcst+AaRQDTEpkwTvvO7l2pCMgYw+titho=;
        b=lk/DigPlxuCIVbt879jIb6r7+Nmnr5dRWu2ogJeOmjjYjmD3QHGH4CSuEKHKoWHdhn
         AkdVhyIiBI/9atob2UT3f3XBr+Gwe/XQr630TJhEO8Td2mvak+gSBnKOsvd7JDzA2BpU
         802CBeK1z42D9bofWzkflLi+NCEfsgwcPJc1UKLMxl36m5WuF7T4L4mzzcHfeuyeJuK9
         bcFgGVdoJvnrF2886wiECWyWlwHg9e0BOXhMICgDnf8EmkLNVlCKwPfyw6I5QEhArx2J
         SDVPl59nY1Z+PfLyQ5k11S2DmN7I7ltlCukpdmARMsRI6b57LbPsiay8XnUQ7GT7+xj7
         MSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785456072; x=1786060872;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jkjv3zkZuKcst+AaRQDTEpkwTvvO7l2pCMgYw+titho=;
        b=hIGH24ATl5UiJi4tAq37gcYb0/caVKqueCJLqtMHc9ttYOe7jFSGvppixSbtLEcMF+
         vbJ7qRxY7DqpYUKZxd13w3u7HqbmRq1UYrK1pdxzJX0lHF1YQX6rQWqj7921BM+SbeWv
         L992RoqeVl7++bHO6/USvF5Ncal+JHULebgn4G3wheSc0DhfAVPSsMjrkMmYC0Dipk25
         eL9UC5mPXQ0wetL649qy7dbfQrlPde1mg/tRIgfFblEHT/gJHZIfqZk/xYnhVbajCw63
         /s7yd58+mCVkHGuEWGD+fYr9JDYkGYQ5XRdFNnYcuq0P5oVswI5InRyyj7A+L+ZRU4X/
         L0qQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp2JuOGp2XrL3Is6nEHHmOlkD9k4S/OSr62/iXqxDW18RclLo4SJHkAAfeWnKzzL1vMq9YYaRWW4munVIjPkMg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz78H7h680kL+7fMEStQvBpWU+RihDMJ+StaoZ9zP6gxgbH+3Vp
	HwtO6L1ACJZ7XeFDVCtjzN+xXmJZBAIog29cfOd87RWC2/qmZv6dvVR3g/ITh8aWEvRhnUmm8cY
	lF4jfGb/1cmeImJco/FNbtKWXTxMcd68=
X-Gm-Gg: AR+sD11FVBk9fUFfoLQKA/de/t5BLB2Y56LauBvcYMhnHxwOfwYyGB0LbvA1bpJ2Gjn
	3aAKsFcfwwwJaXqTCpU8ePpsOfOxPXsyAqtPlcrB8xpeyyWSl7cgIe6vtxMZGiUGz7OECTzUdcF
	9fSXvKrdV2vCeLP2MzHV3Zo4QYqa5Np87crlL2RQA43Nbxq7zMhaEhVch1G1C3ftMO3ft5CrpIp
	ZO2/AGYIUZxgkPeCBX3CJR44SpYQxu4Xyhb4i2lwz3/ffKcOkOHJ/7alWFpZkO+evdfp6eSU0nn
	7EOvta0iO6s2VPgtHjBUE1LM65aBMeCEEX9n/f3jhS51UW3KKr/6WSot85HZ8AJlcbjV/iYl/d0
	=
X-Received: by 2002:ac8:7d0c:0:b0:519:e3e8:85bc with SMTP id
 d75a77b69052e-52b4b005354mr130221cf.37.1785456071885; Thu, 30 Jul 2026
 17:01:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730234533.1912709-1-dwindsor@gmail.com> <20260730234533.1912709-4-dwindsor@gmail.com>
 <CAHC9VhT=m-GtOZx2AHym7uN1CNx94arKBiXeVC7LTEJ-b=1EVQ@mail.gmail.com>
In-Reply-To: <CAHC9VhT=m-GtOZx2AHym7uN1CNx94arKBiXeVC7LTEJ-b=1EVQ@mail.gmail.com>
From: David Windsor <dwindsor@gmail.com>
Date: Thu, 30 Jul 2026 20:01:00 -0400
X-Gm-Features: AUfX_mzzLAETGk0-GNkiDsgUNvOmEZOv-UFFgDdgdht4DdfS7DnllTiGk_VUitE
Message-ID: <CAEXv5_iiNspub=qE1YW-01sV_bxxFUrrcAR4KV4Ec5i_mePtHw@mail.gmail.com>
Subject: Re: [PATCH v6 bpf-next 3/4] bpf: add bpf_init_inode_xattr kfunc for
 atomic inode labeling
To: Paul Moore <paul@paul-moore.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Matt Bobrowski <mattbobrowski@google.com>, James Morris <jmorris@namei.org>, 
	"Serge E . Hallyn" <serge@hallyn.com>, Casey Schaufler <casey@schaufler-ca.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>, 
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Eric Snowberg <eric.snowberg@oracle.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-integrity@vger.kernel.org, selinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 7:53=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
>
> Based on our discussion in the v5 patchset, I was expecting to see
> this under security/; did something happen, or was there some
> confusion?
>

Nothing happened, perhaps some confusion. I was basing the placement
off of Kumar's comment in v5:

> I don't think we should do that in v6 though. What you're describing affe=
cts all
other xattr kfuncs. That's a broader discussion we should have separately w=
hen
folks are back from vacation, and more importantly involve FS folks where t=
he
code currently lives. As you say yourself, the lines are blurry, xattrs are=
 as
much a filesystem concept.

My take on this was, leave it in fs/ for now and then litigate the
placement of all of the fs-related kfuncs after bpf_init_inode_xattr
lands.

Happy to place this in security/ in v7, if that's preferred. Apologies
if I misread the thread.

-David
> --
> paul-moore.com
