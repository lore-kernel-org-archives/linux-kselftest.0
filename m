Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F1938D69B
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 16:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369141; cv=none; b=Aazngk6Rzi+aYKXNZIHoUAMPjEdtalnRRQnmadfPauuzGF21mgl4AFuA4djp44u7ujWu8gvD8x9ckTb/IljnqtRZ0/bbqTqI7EFUkWzA4wQshtywgbsxwVBz/kvB2Wj7VWnbEfSlMk6pxKz7GhL+fwD53DrdUlnRhCncwgx/Wls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369141; c=relaxed/simple;
	bh=j2vmMAgZBEIHOIcyw/exgvoqxhaoAAncNtLEhyVK7V8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Z1naIY26aTR95VLyIfddJ+EUQjZGl5115z+NmPO8U3O9K0ch+FafTeiclzI5gGXpopqm3NsIM6mmDiO4o5njCVsjsLM96FE5QHdBWyiWAt2fTR2Ut17D2Q2EYeVeJ0Srp87echpBg6bgz/ysFSVRTRm+80tuvtzUk33ApqelgJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UvWNF0wg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rUmU6YOm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UvWNF0wg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rUmU6YOm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774369139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0pLGEONAHfojUOfaOSp5cChM4XB6HpkP9CDLtETY2Zg=;
	b=UvWNF0wgSnxfP19DhIuC8JjD76fiIkslCDX4/NMpmxQjVX4QBESwrbJJDbBDYIjiZM21/w
	HtU27K8qMP0CfUO4RM7dbJrJaBEvfkSSEvjugzhh2QF09LhIyK8Aw8gQGls1GFxookIIMX
	HlEicRAq+l6D/vQK/CpMRxgdEeGD4ew=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-TN82wwAjPlCqCQkKMvu1TQ-1; Tue, 24 Mar 2026 12:18:58 -0400
X-MC-Unique: TN82wwAjPlCqCQkKMvu1TQ-1
X-Mimecast-MFC-AGG-ID: TN82wwAjPlCqCQkKMvu1TQ_1774369137
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-43b3d3d2d22so4693443f8f.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 09:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774369137; x=1774973937; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0pLGEONAHfojUOfaOSp5cChM4XB6HpkP9CDLtETY2Zg=;
        b=rUmU6YOm3ZCZMZ7EHRgBKorXwzUWJWZyvVQK2SXrCg0xIYrY28uBtwIT4j0wrCZOIq
         /GRGXn/UnVt5NfO3Mls1U1Ekx/w0M6seRDG+T4BTaurcKpQlnit7qfYnVBmmmmiJ6RDx
         MFq8Rh+CQUgHb/CBoM0XKX1WtJo/4MZjkruQBBwW65VjtlhrhwOyaFhbmpF91R7iY3oW
         SKcdCmb1T4EuAjfw0iq/pDCufgTmGFYA0Hx9fSo3VWjTx53FjxVCmuw3J/lwqQSp47kj
         RtLHSvMECkQfCmVy8+D6FFworxn8+EsTstLaureeD9XjKhLU+/Ij1ugvz1QzeJyRAscF
         h+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774369137; x=1774973937;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0pLGEONAHfojUOfaOSp5cChM4XB6HpkP9CDLtETY2Zg=;
        b=djgU5EjkpNd6pmZO/1zXdqt+SYDFcukQTkoWWpIy0CCEyby7/fDULT/IumZ8vNHlCR
         ZMtpIVArUayVgSdPgu96wlXEOh8BXRf4GjobAN6aijrwQLQpP98xVETKhRbtv4oS+mKR
         a6ZCOL5873b3DjIexl4GkU7Au6E97xLfPCX3b+mTsAT8VXJX/BFQ3HfRItKZ+9Qb2qYC
         ef7snUDEcZWUGaw+SA9Z3QtneEqbRqsxKyCsPaF5QxRGJLazKsy1yOIxmmF/00gg4YqA
         QY5/z0TytVtaeabxVeYT+1+3yA/c/3Z1OOH9iK6alCKZFYwHehK7/zA3+xtCmdpaP3jc
         JoHg==
X-Forwarded-Encrypted: i=1; AJvYcCWWQ28vRppS5Cc/g4DMc+00VOc3Gn3NiXxO+WDBY+RD2WPqHPvTXMyX+o9FHG6H5rBK3FUeDgE0c3Le/TPma8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh7AVNhtGzi/PmkvTIDYTie2cdlX7nDQwSeVIQkBFQe61JCKSv
	26vPnYXS8QMBlkNgU+e1aTS/KrhPZawHtELDvIyfrJmUyd3trRcEaJbpcySeo9VD0WZQXO1pYMd
	uz7wvS6jRcyLoALykTCQ1wUmbvV5zyRUvz6ZnDWicsHAkoRIVdRpxxsZS25pFebFwXRP12g==
X-Gm-Gg: ATEYQzyeCVH2fl7SGAFxOzfLFHh1fhW4bzpGJD6DsMbRR4u6dxxonou5z1E/PMEA1Oa
	58MrlRo6Idv6JMJPyFw/kFVgeHAvHaq9bVHzJj3oiZ4a8ILpqhJvEDrMhDuPb8XrWDSbfP6e7JC
	N0h4c75EAh9e92gDftfU3n+tahEYQHYyZN2X2FpA77HGqRulgpZO3tNMByY8fLjQaErvx0WtuCd
	AQRWjFJKsv+BCwsSVzJpON2QOceamZA+cDgLk+1meZRSiE2+oVGpjgZouSbe1AuMLmMBpYzT9sW
	z3CFIa92JlvX4Mmq4jGZpRlVKMqtuLf9PzXCiGoQ9A/3gla65w3SLCe4Y6uCMA8DsdNSlylD0ye
	mzUb7hwZchNwVGAMRT67keNJ/duOx4/Jnn0HwfHRnQmvoohJU
X-Received: by 2002:a05:6000:2509:b0:43b:4920:56bb with SMTP id ffacd0b85a97d-43b88a0cfc1mr107786f8f.52.1774369136492;
        Tue, 24 Mar 2026 09:18:56 -0700 (PDT)
X-Received: by 2002:a05:6000:2509:b0:43b:4920:56bb with SMTP id ffacd0b85a97d-43b88a0cfc1mr107724f8f.52.1774369135946;
        Tue, 24 Mar 2026 09:18:55 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk (alrua-x1.borgediget.toke.dk. [2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64717e97sm41173985f8f.35.2026.03.24.09.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 09:18:55 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 24AE35A470F; Tue, 24 Mar 2026 17:18:54 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Leon Hwang <leon.hwang@linux.dev>, bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, Andrii
 Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong
 Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, Stanislav
 Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard
 Brouer <hawk@kernel.org>, Leon Hwang <leon.hwang@linux.dev>, Lorenzo
 Bianconi <lorenzo@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
 kernel-patches-bot@fb.com
Subject: Re: [PATCH bpf-next 1/3] bpf: Disallow freplace on XDP with
 mismatched xdp_has_frags values
In-Reply-To: <20260324150444.68166-2-leon.hwang@linux.dev>
References: <20260324150444.68166-1-leon.hwang@linux.dev>
 <20260324150444.68166-2-leon.hwang@linux.dev>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 24 Mar 2026 17:18:54 +0100
Message-ID: <87ecl9mc9d.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Leon Hwang <leon.hwang@linux.dev> writes:

> xdp_has_frags was introduced by the commit
> c2f2cdbeffda ("bpf: introduce BPF_F_XDP_HAS_FRAGS flag in prog_flags loading the ebpf program").
>
> The commit f45d5b6ce2e8 ("bpf: generalise tail call map compatibility check")
> was to ensure backwards compatibility against tail calls. However, it
> missed that XDP progs can be extended by freplace progs, which could break
> the backwards compatibility, e.g. xdp_has_frags=true freplace progs are
> allowed to attach to xdp_has_frags=false XDP progs.
>
> To avoid breaking the backwards compatibility via freplace, disallow
> freplace on XDP programs with different xdp_has_frags values.

The problem you describe is not actually a problem, though? A
frags-aware program can run on a non-frags interface just fine.

You're messing with long-standing behaviour (since 5.18!) to solve a
non-existent problem. In a way that completely breaks the frags handling
in libxdp[0]:

    Running tests from ./test-libxdp.sh
     [test_link_so]                PASS
     [test_link_a]                 PASS
     [test_old_dispatcher]         PASS
     [test_xdp_devbound]           PASS
     [test_xdp_frags]              FAIL
          Kernel supports XDP programs with frags
          check_load_frags:	FAILED
          check_load_nofrags_success:	PASSED
          check_load_nofrags_fail:	PASSED
          check_load_frags_multi:	FAILED
          check_load_mix_big:	FAILED
          check_load_mix_small:	FAILED
          Test test_xdp_frags exited with return code: 1


Please don't do that.

-Toke

[0] Run 'make test' here: https://github.com/xdp-project/xdp-tools

