Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794087143;
	b=P0Th0o14l0/nwMnLWtmD2rGEB07/wJLsJMBAuj4v7R+gYoubg854uI0B2/J+dklvcXAC
	 OGcHYD/blrOMmTT3xVu7IBKGu282oMYP8aGRJxHwVzuTho70vDvvxcUB7KB/LVJPAkwgz
	 kzno5bPMhDw2wPd6+LQe2LU64UrXVd9OXQL+ul2r4O5Gq4DYGaw8DB3Kwt9QTM8PuoHYg
	 SIbUgD1vzAqaS5bxNpA42j1Bn7oSbHtabY4TczP5VxITJYh0kFonvfS9TrEW+xJYR5ltO
	 kMjgQm9NPbkjMAz8cySAqmckLWCAuqSRawNYUohAZTdhzjshlX1/pEjHeHBtIL2aDFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794087143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=fAClDdVa5D4N7PoudPRt5yaNj6K+a1j7ORktYRxzeHM=;
	b=KFIspxB8W6qqX5wJEN+K2Vj1CdfG9BmzJQ2aeY5I/PWJaQfvIzpyl/xp5VxA5JY8E1Xo
	 lj+rBpJDvnsutXWNyNg1pJYhfQTU+W5dWUo1Yb5weyzt4lKLyu1QZaS2/OLlsuI4TY5sY
	 ccZFu7KWx+xhW9m+/7MpKSTOsNVGD69d0E2wK0WZjKUnpQ0BRT8vrk4BEYz38tO3TBTSn
	 Z9qA5rMANxuY5eAqsqu1rhEmdEtW/ggX8c+j4mWHLsKV2UlYuw5ck3Eq6NCzKHFWedhpk
	 gtuCSzqvwcQce0+s9LFCJMtRsCQu9r+E30nDXxNriGrt4pPQoNfXenQ2sEioq8+b1sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sentinelone.com;
	spf=pass smtp.mailfrom=sentinelone.com;
	dkim=pass header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=FE4M6Z2d;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCB1606A32E
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 21:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBCB1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=FE4M6Z2d
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b0b133f64fso7759a91.3
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Nov 2026 13:32:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794087142; cv=none;
        d=google.com; s=arc-20260327;
        b=b1eoLCyiNRoDi1fflg7uyLijQjpcT3ltbQ4y6QiIBRt+069PDTKqb1gqrgTljY8pGx
         XHKLP8RJaTDDwccwJs9wsQRuXUGmjaOWEvtQCbIcqdm9GSTRn4iFnS8FMAneTrxD7xdy
         FdllfFcCnwnKG8kRKZaAx3YScESs7YXOijUwH8E+1bikASznBopV6s9+iOSVVTOegH7X
         iGUx9g/Fex7GFU28+KMbyf7ghQjTkBYyaykcoy3QZxf1pQx2jfQYVZ/4YRXZ9tM/APhG
         iUZBgV4kwdttKsjUYgcRuZ/0IfBLhs0m3T+vCG9Lc10e/WAlURS/wJDqQrIuyR2PXyzK
         W/KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fAClDdVa5D4N7PoudPRt5yaNj6K+a1j7ORktYRxzeHM=;
        fh=NBnHS70r/mherC0AUEOSy+v7f7N3mW2inJdvqMS4hX8=;
        b=fSGBcTAfoym/6eQWvcScuEKLkXxEf+2rNcyPKJy4HdU1CXvBud84a8o41uZXYHQkJh
         3dF9SdOdFL3f9lkImbWaL5R2/Ik9x8Qk96xaAeh0feyYAjDnrPAO1h0c9gSFELi67pLs
         frhI/yIw2XYISyuVFL2GDuEev6fHx6895j6uS5OyIqeHUWcKCVhI4LJQJfQoaKX0vZkC
         nqG3hYQrghH/Y+7Is900S+QN8QWh0PuCz/g22uzJboY/ghD+nbd9UR0lmFjjx5ufNWvF
         2USzQIRE7TleITF1P59g5VaAv8g3bqP4Htsg1hVPbyZ0scHGdhsq29BHyimM0dRjtf8T
         JroQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sentinelone.com; s=google; t=1794087142; x=1794691942; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fAClDdVa5D4N7PoudPRt5yaNj6K+a1j7ORktYRxzeHM=;
        b=FE4M6Z2dKnhEWsud6rEQ6kWuD+HailDfVd/JSa0GXgCdcPn/l2WszEIk9XGPSqeT0q
         GbQ8fn0qxiCAjHSNLQ8UEr47fIuqLuWD9yVjm1xLIt14/XsoVbxZC0+NWjeXjUu9SxyH
         6eQKrG1KNgkAACTm8Bcor7Ml+W5azJissuwxAA/4bqBbsvRDWR8viHkGdrYgmiJ1kzwg
         xl84zqI8urOELJQ9lWk/bskTrvjGrog+67v8Y2Mtp+BRPny0bsTNNQSG7QSZeVkfxRbI
         9oDRmImLfydYBBDo4Ndiptq+f+JzZzTM9nGBU1/WVhium6lA7JGNpiDMmPpzKWwDIurI
         iGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794087142; x=1794691942;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fAClDdVa5D4N7PoudPRt5yaNj6K+a1j7ORktYRxzeHM=;
        b=dI3eddz/Uo7io6rl+DM80LEilWm9GdODd5Xl3SqULvWe6+T4tB9PtuB7e38aNgxsUy
         CeXDq9D2lja2QF+Vg6Y3mFUkHottwZ5yWOa5rljWRVF/5DCROWaJN2W+TofvC1SeD7bl
         z2VH5W6zBcYWvnSaC/062Q3iRNHD2bs9Vkhg5n3rxv5tBuW+4wu3FoHpnp2SfVjbbtpq
         F2FLC1TJLRg+dgclcp/AzuvpplAr0aC4AURBYIue0W2ahIrppHPoZi/qMxeZ02OINkyA
         CiLlvqAOlLrSi+d1EPFhV4hPIjN+dtX5BhvmkNg2Im+FsThg+TkczIwDxYHLxCU8eEsn
         AQDw==
X-Forwarded-Encrypted: i=1; AL+hErEplgVNt1HKdtyfYmD9QQcCAkw2Z1uSIfegxlcKOtWYyUIyZVB+Cf9VmDnLscxL9jwhHDwBd4mqY2fuBdkCVJA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cQZ5KhylrgA8S+6JQ6ETSwbIAwF7LmuT/U+U0CbeH8jvUl1hk
	14nw7im3A1c2QuR8ujA6z/axmyTK9QbLqfrH/udzWaeJKLukW5K1j0Ui3KCLF2b/qkOT+5VT+1w
	ncK1wWK9oonBSog6xi6anVw67bn54vGtyWPBf8Wg8Mg==
X-Gm-Gg: AYBFou1zXYr/4duKFo10ge23lFoq5RIDNQGCsWsjNGRTc2OjHeq5ugZV3028gCOqX7y
	h2wXoszDrbPoc6fCMJxkGGM6cMhvRvhXNhEWEy+elusudAe+MfEHmHkx/8nezHhKeWmrsCLVxGH
	VPJUKwmxXjPRJxhVmJEuFKQ5hyygBK1rrqnYGHiM0tggxKOsgI6BWq8Q1NDehskHXqV4s7LrD2s
	q7CLrnYQC3pbiNe73etrgU6ZN2+lnOID24Loks5apcxARoDxlYPeom202a9O4TPexzcmrjFXkRH
	4hMtbRLBHb+pqL1RQp93pvHMkgfsGF3czm8E6uAYfg3YlVyPrRrLHPF+zK6iYkfdDD4iQeNLqJs
	I820KJCvxTlNsf75PNeaN3rR0Y1AQMg1MUA==
X-Received: by 2002:a17:90b:388d:b0:3a8:9db2:a59 with SMTP id
 98e67ed59e1d1-3b0db013fbamr10127781a91.0.1794087141883; Sat, 07 Nov 2026
 13:32:21 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-b4-bpf-trampoline-preempt-v1-0-198dcdc0c6ac@sentinelone.com>
 <DMIIV9CE0PN4.309YUGIXQUZNF@gmail.com> <e3f63654-0f7c-462b-b58d-05f3164fe340@linux.dev>
 <DMM2G9OX9ACV.231CHJEPK0OHU@gmail.com> <CAPnbwjpQBR-KHwOMG2bo1uhdp22ZW_O5sUj3=vjazVu=Rdnb7A@mail.gmail.com>
 <DMN0RC27TJRM.3KUSPS9QTBV4G@gmail.com> <CAPnbwjrX-ywbcgNQSZKE2jiggEOSVCRVw9OLfaksihiVSCoqvw@mail.gmail.com>
 <CAEf4Bza0XDMTxxZeukwRXjvoOOruY49q66xBXnYnuncbeo_Oiw@mail.gmail.com>
In-Reply-To: <CAEf4Bza0XDMTxxZeukwRXjvoOOruY49q66xBXnYnuncbeo_Oiw@mail.gmail.com>
From: Mike Bazov <mikeba@sentinelone.com>
Date: Sat, 7 Nov 2026 23:32:27 +0200
X-Gm-Features: AclHuK8VaELpN_xVEw5v6aYLhDqxLEvH5z7CzGWzlbUdtSKDEKr2aOOzYpF-uoo
Message-ID: <CAPnbwjpZRmzJFXDa=thc188ZNru2xCBrCsc1WO5mNDzRRQZJBg@mail.gmail.com>
Subject: Re: [EXT.MSG] Re: [PATCH RFC bpf-next 0/2] bpf: Do not let preemption
 cause false recursion drops in trampoline progs
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, JP Kobryn <jp.kobryn@linux.dev>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 6, 2026 at 2:08 PM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
> hm, funny how AI figured out run_ctx, but didn't figure out that we
> already chain them and we do have that pointer in current->bpf_ctx...

right, good point, v2 would walk the existing current->bpf_ctx chain instead of
adding a new task_struct pointer

> That's all to say that I don't think there is a need to keep
> guarantees. If per-cpu map is used naively today it works ok most of
> the time, but not all of the time.

Alexei was concerned about existing progs relying on it.

> Perhaps we should just get rid of that whole per-program recursion
> protection and just make sure that a) BPF program can protect itself,
> if necessary

If we drop the recursion check and go with a), protection is up to
each bpf program author, so wouldn't a careless one be able to panic the
kernel? A prog as simple as this one triggers itself:

struct {
      __uint(type, BPF_MAP_TYPE_HASH);
      __uint(max_entries, 1);
      __type(key, int);
      __type(value, long);
} m SEC(".maps");

SEC("fentry/htab_map_delete_elem")
int on_delete(__u64 *ctx)
{
      int k = 0;

      if ((void *)ctx[0] == (void *)&m)
              bpf_map_delete_elem(&m, &k);
      return 0;
}

Without the check it would keep going until the stack overflows

Mike
