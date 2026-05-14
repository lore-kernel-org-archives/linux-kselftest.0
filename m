Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F106E2253FC
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 01:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778723423; cv=none; b=EJ31/8WKFmLQ0iqdIZ9iojeM1rYFodkT/Q8ZWUaxdjOSBpdrMkKrSGv0Ufe55UmUEg7VmXtfuey5o5SsCiXK6rxm1vHZN3wC22wNpb9ZUK0huC71v37t8j76pWhRe53ScyfsaVkAOf6iOfre5PLJBKMVClIe7YEzdj2P/Lvfi3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778723423; c=relaxed/simple;
	bh=b1SJCsRjN4qVXBbXXcSZ8S481JDIBqIMGFIaGROaXd4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FhLLLQAsnaulluIneeUcQnizRTCWbnA01Rg+dJTIyROAPOO0M85H9bVT4Ed6854PJhAILFv/R7Xetpy0R3j/oOGHMFxfiZVtQrmOOzuZuoaDNjdRYxwARYQ5JHM67Bp3GCTLXG+/bQKqRRw/0V/XIGHU7cy/lAlubchMeOqbnT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gD2c1quL; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gD2c1quL"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-479d9b155deso2684064b6e.3
        for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 18:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778723421; x=1779328221; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWw4PA4xea3qoVC7BJte8Yrd814HYwd8HlKIssZKr8U=;
        b=gD2c1quL+OKgxFsk3OYaUEMd1mTk8yg1ysxnNKRPFfdW1V1jrvzU+flM4h77jxKeVT
         NdRqSkn1GeCavfk963iW1For5nkAcciNpSzQw0EySLG5vFypDxGIBK8bMcPan3YXo7fw
         dHL9LlsV/wR6VbisjpBdkudjl1GmxdXoIJBBQmL+KWUcRV1dBhq7lOTdDS0dE0DC9cyo
         iKxhyLgmwCAP9rUE4DkMveRgqMTn7qd6RLLHpKJAbnoen2c4I80qcDaQfncp2NqMcYj+
         F6ZrUyvTMoNtchgYVyr6fuynfnXDs+KeqYGYbun1DSsFVCZx2PSNCSOLPAg/Ubr2IjPd
         uERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778723421; x=1779328221;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bWw4PA4xea3qoVC7BJte8Yrd814HYwd8HlKIssZKr8U=;
        b=sUZnIoPkul1OSNYVAHG/meiMl5PYSZx5VMfvMMlmzwrlnDfyIynBI2CWhZJMLoJMsG
         mqSz2Zqx3ccLsqK511B7hzGKHbggUOIcYcTEtAnOmnhJwKbDcnvbgu/2gIYalybWj3rS
         LubdtpoaxJJyj90wfRLWtwax4XkfY1M8/+CmqA/FVh0uWgNrHCf5YhAfvGHyMRwfWzoU
         jeOz+kVOL2OdzWemUdawgdvsGve9KUneXBUVF+zKAWx6HcBJPvKeXObl/gjTfJosQpLU
         NqRZulYzGueZ5KE1mCG86pwDqoWEbGmQ7RvoIJE7hB6iPz1mg9QTrzqkARS5IQVuEREe
         qVnA==
X-Forwarded-Encrypted: i=1; AFNElJ/0Tt4fFmDMhx1SZzYd4rm7uqIymo+EM1GNtTFux3A2p3vsABgYxvHw2bGcsIMWfHdGyjBZLmUPYkLtA/8Y1JQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw38z16onEZMwLJ8VFVycT2Te2Ghc2pzKaTxul+7FA4Sd19r/qD
	UBgeA+WmmZjz6Dbo/DucDbG5LmEBOXsTJhmDofuqXhMRufi8ZUv1K5mQ
X-Gm-Gg: Acq92OE8SKC6r2ikyRl17Bmt/zWQsb+HmL6qdq7tQkh/xp9kUU+tR4XQ09bmBjVWhz/
	pj3OtChTEtK+l2KKG5NQzvpbKjvf9pKmOa68TzWr11/x7Hthd2prbg6+dsutI69myea8gYM1qUy
	2ep97SNphjEfeioHCoLAE9e/5Fos7cC4KpUrXlGMt/jLm/SbT4ngGQmwwrq84cRi19r6IonsMyp
	SdD8D8P7YRgvkz5kjEl3wE44Cbt/FB/lrJDCsct8GO1tsTHVDk0aDiVS4HZRqC/WFcORHHMj2LN
	kt+9mG5If48+evHyctXMczKOpa0CUtsSoeflPKSWKl0FQYieVyoNBaz+fVgXr8pkh1UNk3SD7Tm
	tAIlDTnKLMHNk768O3N04WeSmiYS3HmiOEUIAg3hDo+hA0LA2V/HexSEwnGStD536+42mkZk8t/
	K68UClqZGRiW7qjGCAYO28VdyZD65zD89Xtc/gQMYjNPQHvWvO21cjKLNlMUQZO8KaJe5wUzNFg
	aWH4trXh9DpcBBPog==
X-Received: by 2002:a05:6808:1492:b0:46c:cdf4:1be4 with SMTP id 5614622812f47-482b2a5c978mr3483177b6e.10.1778723420780;
        Wed, 13 May 2026 18:50:20 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:50::])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-482d3d4a8d1sm417604b6e.15.2026.05.13.18.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 18:50:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 May 2026 18:50:17 -0700
Message-Id: <DII0TT9LXYCX.2GMM6QA4Q9BPZ@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <vmalik@redhat.com>,
 <linux-kselftest@vger.kernel.org>, <martin.lau@kernel.org>, <clm@meta.com>,
 <ihor.solodrai@linux.dev>
Subject: Re: [PATCH RESEND bpf-next v10 2/8] bpf: clear list node owner and
 unlink before drop
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Eduard Zingerman" <eddyz87@gmail.com>, <bot+bpf-ci@kernel.org>,
 <kaitao.cheng@linux.dev>, <ast@kernel.org>, <corbet@lwn.net>,
 <martin.lau@linux.dev>, <daniel@iogearbox.net>, <andrii@kernel.org>,
 <song@kernel.org>, <yonghong.song@linux.dev>, <john.fastabend@gmail.com>,
 <kpsingh@kernel.org>, <sdf@fomichev.me>, <haoluo@google.com>,
 <jolsa@kernel.org>, <shuah@kernel.org>, <chengkaitao@kylinos.cn>,
 <skhan@linuxfoundation.org>, <memxor@gmail.com>
X-Mailer: aerc
References: <20260512055919.95716-3-kaitao.cheng@linux.dev>
 <da95f45b43d94d17796b19abc4c555e35daafab7d5e1cdca3714fe0f54ab8cce@mail.kernel.org> <e141699dab70282d811ec30bbf2aa8279706817b.camel@gmail.com>
In-Reply-To: <e141699dab70282d811ec30bbf2aa8279706817b.camel@gmail.com>

On Wed May 13, 2026 at 3:53 PM PDT, Eduard Zingerman wrote:
> On Tue, 2026-05-12 at 06:41 +0000, bot+bpf-ci@kernel.org wrote:
>
> [...]
>
>> When a BPF program holds an owning or refcount-acquired reference to
>> one of these nodes (node X), which is structurally supported because
>> __bpf_obj_drop_impl() uses refcount_dec_and_test() and only frees at
>> refcount 0, a concurrent push to a DIFFERENT bpf_list_head becomes a
>> corruption:
>>=20
>> CPU 0 (bpf_list_head_free, lock released)  CPU 1 (BPF prog, refcount X)
>> -----------------------------------------   ----------------------------
>> (owner of X =3D=3D NULL, X linked in drain)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bpf_list_push_back(other, X)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0__bpf_list_add: spin_=
lock()
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cmpxchg(X->owner, NUL=
L,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0POISON) -> OK
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0list_add_tail(&X->lis=
t_head,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0other_head)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-> overwr=
ites X->next,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0X->prev, corrupts
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0other_head's chain
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0because X is still
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0stitched into drain
>> pos =3D drain.next;      (may be X or neighbor using X's stale next)
>> list_del_init(pos);    reads X->next/prev now pointing into other_head,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0corrupts =
other_head's list and/or drain
>
>
> Kaitao, this scenario seem plausible, could you please comment on it?

I think bot is correct.
This patch looks buggy.
It seems to me an optimization that breaks the concurrent logic.
May be just drop this patch and reorder the other one, so that bot
sees nonown suffix logic first.

