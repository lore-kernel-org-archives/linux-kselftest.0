Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22BE4183CC
	for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 17:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781544670; cv=pass; b=BVDV40Sh1AZ1bx4IDcMp+usoS3guci1wayFBghlFmThLupk1FEGiGNv3ERMAFi/8Qh8lHIaRtFwDNUIyE7XojR+DU6yx2/rlhvQE+086kJ4ysKxxbGjIHTVTJ4HHhmACanW/J2rf7oHmZ2/upXIPLkx25lCvTw289SaI3J5qhTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781544670; c=relaxed/simple;
	bh=ctVpq5sTwVZL2rCaoYy4Pgvqt7gs6cBr12JV8vrMxZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G/044DHE41bjwFXc29C11kXAG4fzSiR4UlDFQWsxwj+E1Ko60bBQqjt9wYqoWkXqxWxpR86L4JYN3+64q+m//RY1BclQ9iv+B0iS71dqNnZ4ns2BDLfwbF3A8zSP9IqHTc5TaUDCATzPZclAw0tuSqQswsAX3L0A3yYSMqnHdUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGwaSvDz; arc=pass smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGwaSvDz"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36da151a152so2574628a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 15 Jun 2026 10:31:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781544668; cv=none;
        d=google.com; s=arc-20240605;
        b=WtHK9+3n8GLVppj75Zh9Ge7I57NJArbdGtwFsSZIaq0TsiwPe+nHDW8o4b/SP/U4Gc
         riaSnJwTI6IRJQywRyMdkbvukK3KRE5SrPuZXTNqE3bMU3OpJ4ssbUoVDWH6aQ46MSR4
         1LRZDcEqvoAm47hoVXTf8XV8xwCfZK7xnXYqgkcWwQKBR+yTFaXQKc5YN9PMAVGIPv8h
         2Jg126gSqepYUaiL+zoMZor5ucXoh9sR19SpLtQcT352piw/B80AorLUpxc6xOQ+gNqi
         CL6j1AR+yS6fuF9UzpXPTOgsSoy1DdN3fz0vFVxXPyhnkirlCgpA4Vzh4R8vG5aeajGb
         8xQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ctVpq5sTwVZL2rCaoYy4Pgvqt7gs6cBr12JV8vrMxZs=;
        fh=VMdOuKtB5HndmQU93lAbPW6hL/lu9wDtz7w1Wu1g4LE=;
        b=hq2Y1smqaMk46SeJYaUCSkaT+tgF9fOAUqAPuWSK3FaMQxZRZnCJl6Ws6eg/zQuRgS
         ++iNKZ07ABONEPrU+smsmWjdrIzHVoLS/6DCBCgDjop98Jy1tlZXTH26vFAsWwqdfJeg
         kLx0im5wwosXnvyK+W/CID5NmgEOyws2/+wZzM0Bv/VRADDWJVV6984cVo3uBFmSwkvC
         LjfKUYvK7L7Ynq3B7WOmhEWZJPABvPFLSmPa4EVorkgTp7iiE/bBLXgoI0LFTESBdOfE
         QU4pt3DKF+jwY/JMnsBd5Ct7S1ZeymiaEpkeOT9Mh5qdab7clrHxheNJsU1iFwxCNHTg
         h2gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781544668; x=1782149468; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctVpq5sTwVZL2rCaoYy4Pgvqt7gs6cBr12JV8vrMxZs=;
        b=KGwaSvDz8wfv+TpL1jXgEflU3iCJQ9Mv+Lqgz0ShoaZhfRfcjgDg+90veUHTBkJth5
         pCBtYGiSpryFanNHWW8gQPvRKoqCQjCgS5kGqZP5UsQSIN7x9D5csSl14GzaKVFci4jj
         nDPo+t4rHSdEIsL5hcI3qb1a2/9etPGiiiCbwmfv5Rzl6+T+ATh8OperAF4hokJPyci+
         0kZFWX+MURw5yZawWUHDatGtU9kpLcuEDhKRFlE/Ucv9u8GvOLcw2ojJuJYHDdOhzwtP
         +EWa26hqkfUvb5IgMX9xHC3fgKXrnKHN/zffrChOwMX4x7xF5IjY7RFzep/rTVPulxwG
         KX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781544668; x=1782149468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ctVpq5sTwVZL2rCaoYy4Pgvqt7gs6cBr12JV8vrMxZs=;
        b=s7Nf/J77HFGu08b7JzOOPQMwGCXZExIxKLgFiFvnw2NkFnUa0h55Zrv17fCzgm5foy
         Ujpl3rMlxJmt7cuskY4GhrA9EOrbXnu8oW5mAwylI1yfz/PF59mo9E2+P+lKVWSl0Nby
         pSVKzAS7ZP2oo07RqXSy7xbOEQIeL4+FWWMRL0OrITTQVImP6huAm6HmOPheUmR00xa3
         XNKLglJSkQkHbV7iVsfwdZUlBM17zxt1LMfAggamJzjttmSGyP3WsHKWjqVYkeZ1SF9r
         MJtJhu+hQ0k7fLeGXw0fWe9FycowDrM5qqSdzULg4CUQxmHNRqwOt4rgKbWObWXN7IIn
         VbXw==
X-Forwarded-Encrypted: i=1; AFNElJ9KH9ePKH8oi2utHvsdEKfSn1h5TZNEA03Gne3kqCYw6jCtU0KHk7zy89eDKq7Hl2aQZau6W3sLq3D+B9jbqcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjoCbZXhU3bD/wi7X6TolykPZNEajDj0vtjTa+gx0j2H35l4UN
	vb1YzZeanJeGIWgUhQoTK/BjTG2T8XmmcWyCm67DG0wEFls/UuPmzKvCx1kg2eU47STwZ1woni0
	CacR8ctTSoxT8cSAnqrkO9wuNOOnpNR4=
X-Gm-Gg: Acq92OE+fOtWvrNdW6FblLPwpQPfbwba8aGvtLztilLZ6vQY3PzFbfiN3XL2UrLJyIw
	M1IziETjfctyhH/kLBrSBPocm+dWBcyKNr8Mntpz7RdUMfnKicKMUq/9p4Mn2ja6kthN4sXCuVW
	+n+o1W56vdqLTNtIXhqtYL50Dyhq2WCWZFQPpVDVlj7r9c3Wrei8Xt0VlHFDjsQyfMrT/tTPVRC
	3RM7T4V/zV2a/Up0sachKQIjP0imYxWAJxh1QhDPyTVgHSITwg350U7rmm1uiW8RwCjdlGPmP5W
	l76PEx9YcY0qykh+URB7iI/1X3tcts24YBZkZZeT2Tv6qFoO2HYPN65n7zLJvs9vWUimoFbWIEd
	Oxcw6AtzP48Mu4wWdSbrLgBjb
X-Received: by 2002:a17:90b:4fcc:b0:36c:e254:4d5 with SMTP id
 98e67ed59e1d1-37c2bc5d111mr11614247a91.4.1781544668224; Mon, 15 Jun 2026
 10:31:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DJ9QS5OUJTSG.1DSRYHG6GAG3H@gmail.com> <20260615164610.764567-1-chenyy23@mails.tsinghua.edu.cn>
In-Reply-To: <20260615164610.764567-1-chenyy23@mails.tsinghua.edu.cn>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 15 Jun 2026 10:30:55 -0700
X-Gm-Features: AVVi8CdKR-687xMo5ITzY_tF1_yfrRENYRdsqwBNp2gRQiYZARa3ws8uVTzf-ts
Message-ID: <CAADnVQ+aV-Pom8xDU8Dcnapv=mUWr8xy-r=5pp2Re29xEkiOkA@mail.gmail.com>
Subject: Re: [PATCH bpf v3 1/2] bpf: Fix packet pointer invalidation for skb
 dynptr writes
To: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
Cc: Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>, bpf <bpf@vger.kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Eduard <eddyz87@gmail.com>, 
	Emil Tsalapatis <emil@etsalapatis.com>, John Fastabend <john.fastabend@gmail.com>, 
	Jiri Olsa <jolsa@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Shuah Khan <shuah@kernel.org>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 9:46=E2=80=AFAM Yiyang Chen
<chenyy23@mails.tsinghua.edu.cn> wrote:
>
> Thanks, agreed that the previous version used bpf_is_kfunc_pkt_changing()
> incorrectly. I will rework the fix.

Pls don't. There is nothing to fix.
