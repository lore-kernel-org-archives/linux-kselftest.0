Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794343378;
	b=hElwTZOcpcGrKJAjL3/+mN9AICVeAEVHDbvmfMKJtPTLQ2teZGwGtfAzQ+7COY1ZKs4s
	 bCaRToxYPG8YTXM+5WFT/rIkWvGS3dZGm2usvp8dQIV1mQQdr1N1sqxTyHA6b6jYdhZAs
	 XarTqyhJuy1koKZ/Utp199UNh8aPnvwkTQM0fgZ28hbnuQN7wDGy7ZsciBw1ZVpa83HNc
	 0HeopcW9PSS3Tt1baaMtNHA4vIdTJeE/8roF5M3pENKWjdSYlcM2Vo+nIxpp6Xjt5x1EV
	 +mKRf/9/dbMPrUinf4JTaPwUFdGjEKy0R7I9wLl92RNJPNx3kszhw+Q65Jo03BFLfzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794343378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=6JIpC5xmZmVh3gHvpm6TlSXy64wN88S92afzeHcQ6Bk=;
	b=zSChHmaiut58dwvANWG9aN9RIn08cPXtdrRoEz+R2nqKVMXzDJN/hWE7TMSqOu3Lii2V
	 3L1njKzVN9nJtCV+fzKwYxJ/3sJUpmOONwgJj5ni/OVsupxVFfgrmuAAkrmjbFDxZZ4/e
	 sQSG2KAL0IXv+vIMb9avbR3ZRnQJxbJ4/PzZk8Gl7JM/PgapQU1HQolu4CYglcX7QTujC
	 SfwWw2HaMFoVhj/Akha7YFSSHmuJPNQT/9VHV3w4r0WOYC4yNrszbnt7/caXZJm56T4jU
	 5JV7I+TctKayVRSZ0CkeQDQWCzsUYGxKE3ulKYmhOwT9JhNyC/W7pCU9jdaJKzGlZEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sentinelone.com;
	spf=pass smtp.mailfrom=sentinelone.com;
	dkim=pass header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=BzOrX5df;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E986606A31C
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 20:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E986606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sentinelone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sentinelone.com header.i=@sentinelone.com header.a=rsa-sha256 header.s=google header.b=BzOrX5df
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b09cc7ed1aso302758a91.2
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 12:42:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794343377; cv=none;
        d=google.com; s=arc-20260327;
        b=MW5bpOmCcCUJSP2Ktk9iOTFgds4vmruSCaSK8eN1kSocKOP44oADwiY5h1CawxQe54
         8BSfeixaj8LHJpwX85H86k+8a9WpHuq7WnOpDh0IZAsW2jl0yawYs4m85rZ2GLL1ACN1
         FVl5hUgINvzzgCaYrfBpWF7B5x7PUhghQs10VzTT2gmUzR/wlK9jFCwVv7850mp6QKdR
         8U+1p1C84S6mR0LutRWY8ULHdthWD1/pGix4HpdjRZzHQit440XKCVchWnnJvP1n0S5N
         QQFpRNm9M7B+cBowCr13HeNr0Wbi0X+2NjeP61ElrF1qQvtuuXGvCS6TwZzI1RJ9gxMz
         96Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6JIpC5xmZmVh3gHvpm6TlSXy64wN88S92afzeHcQ6Bk=;
        fh=LnJiC3eMh7EuxSIg6fH1r+MnfGJKGCMXvtfs+6aAYwU=;
        b=dJYv4H8UIJurj9vGRP0hECP6zEts/eWsWsSAht64fT/YgR5iUoWNBOmPESJbbxd/BB
         Vi/DDCNftbh3FIj7GE+4A6otpv2IBXdXra3UnM6c2iQvri44vAr8SvMdfKES7Bi9H4rD
         VIv2mkOk3acxXkgYfDSC2YaeHAR0Qj4R38MAnDZ/6eSufgGGboRT9cX3/Zt7Qh0LkyhH
         EGSYiyRKAlmpjpPUhVi91OurDfgKl3ZBXb9KKGb9j6w59km3F/stnYlrTH7DpVteLA1T
         +SKivj2kQgQApsvYjjwL6/3xtspXjB+ZVD0yFSUynEDsLFb5H2UXqqGO3Snj2R2zHds8
         NP7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sentinelone.com; s=google; t=1794343377; x=1794948177; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6JIpC5xmZmVh3gHvpm6TlSXy64wN88S92afzeHcQ6Bk=;
        b=BzOrX5dfpE+ATWGL/wdnDmqs110TVhKTlWIlwAI7dDMi72e9e0m7HPA4+FO3KKu4+D
         jjDcivdVMk6pFQQZ7tqXAm81UmXbkm0Sj0zwPWm5dNiPJIje1jHSipW0d/82pks/7gP2
         3WHAPaEwpL+zWUIS5nnUbKOHbvoNQHJIOaRvY54sQfLoC96BLA00QBwvxdr4Gtrv7GId
         Jq9lCx92m78rRmjUjEJOlaG6bdRXLRNFcS2xrkwH+t7+0yVZbQ1bkObsSQJ0Ez1IefzT
         NKBrqUOHNz1Y8Xgv4/wLJ6SmZHlCmp87DYAfN2IejsMxJKb1s3eCOwQFI/knqHBBQfrC
         25YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794343377; x=1794948177;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6JIpC5xmZmVh3gHvpm6TlSXy64wN88S92afzeHcQ6Bk=;
        b=HFeCmpvupijaEGfU5/RdbhOvTu+LGx55HJ5T+5tuEq/Nuh+LZ7fqyOABXeeazI0J1e
         Lll3oUAHIrNshLtrsTcutv77xlVJq/Bi8XRxkdT3FjL+kSaQ16wnuVgnnPg3L2jZHBmn
         8Cqao65A+ybf4zBS1s+t2zEqIZYPoBCZVcn/R49yA2bPTi/m2PqRb8uRmzzfoDuvkVzW
         +zu5EsYiNHeKVfDncCHW3YNvJ7rLK9q/JBur3zXSHqH4Uzq8P3yKREzYoUK3oxLHKdU5
         Q0uOUNRkGfxdxJRAUgFCTw0SgtFwqHZwmLtb7s078t4CwLKs7PKmNa8Au4pznh6ohehB
         9mfQ==
X-Forwarded-Encrypted: i=1; AL+hErECIAnhbllDHEgdi/Y6BVuqQhMPbecniSCLmtl2+LOL4xLqwHK2JwEaC6xznqiazKswjme3thfCe2Yfuq5MDl4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/z0Q7/rInOK2UJJuJZbnzQE/ADRyXNSHJOXNY46TVHwcjbYVHa
	eZnVIfVir74h398tFxwkp5+38khqqfQeVb/0qAak02xjht/xeBToSQ2y1QwI+eab/J+Wtvm5M84
	4jExlHCsaXJ+REptbJ0vqPof13w2mqyoURK0ghIK0lg==
X-Gm-Gg: AYBFou3DF6nhTilXENtakmEt3eUx1eI1k9jxhhLu+PZIdUufGRHD8kM8hsQt34z0UYC
	Z5+Q4wuLN7OvDGSiIkGkSTiqNc9ofj6ux5Fzn+qBdn4pDNbqVL9F9bxaZjQEQGUzgGrz79hX30a
	VizG7NmMt1qfZ7ux2cT5+YyMLUFXmln2ZbdCjIGC7yJ0AJ7xlSf7dg/tNDlP2iaT/NeBFollGTU
	h+3HGGbjOqJ0TcHnk+6cMh5W7kWPBN+2kKi4xj7EHYN51kRxzB8oE79Dbn7fXP4bHrkrvFQcBx7
	3JOdTLXX+1UR3Pg8aq56FrMV3mlX0A4Q/LRHr1mRNAI3GURQNqzKHLEzh+y0nkiA1nPCA9RP+1U
	ukJ3pzwKkMZAaeK0EqSlFfpBybG26EGdQtyQdCXDcVAuEI0r1GTrqjNQj
X-Received: by 2002:a17:90b:540b:b0:3b0:975b:2256 with SMTP id
 98e67ed59e1d1-3b182f9b9d4mr203359a91.4.1794343377444; Tue, 10 Nov 2026
 12:42:57 -0800 (PST)
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
 <CAEf4Bza0XDMTxxZeukwRXjvoOOruY49q66xBXnYnuncbeo_Oiw@mail.gmail.com> <95e07cae-85ee-4f14-b5f3-070803ee567e@linux.dev>
In-Reply-To: <95e07cae-85ee-4f14-b5f3-070803ee567e@linux.dev>
From: Mike Bazov <mikeba@sentinelone.com>
Date: Tue, 10 Nov 2026 22:43:02 +0200
X-Gm-Features: AclHuK-KEMNOlfWD0UWl6ryn4dajINfOogjLWWr7jApapLp0YR3rK8ycXvkFphk
Message-ID: <CAPnbwjqw=uxd8UyhEgNjSrpK1DhbB+dex0mGVW=dwuoygqgRHA@mail.gmail.com>
Subject: Re: [EXT.MSG] Re: [PATCH RFC bpf-next 0/2] bpf: Do not let preemption
 cause false recursion drops in trampoline progs
To: "JP Kobryn (CrowdStrike)" <jp.kobryn@linux.dev>
Cc: Andrii Nakryiko <andrii.nakryiko@gmail.com>, 
	Alexei Starovoitov <alexei.starovoitov@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	martin.kelly@crowdstrike.com, andrey.grodzovsky@crowdstrike.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 9, 2026 at 4:12 PM JP Kobryn wrote:
> Before moving away from an in-kernel solution, can we consider the
> direction this patch below takes?

I haven't proposed moving away from an in-kernel solution. Your patch
is the same design I proposed earlier in this thread ("This is what I
have in mind for v2") with Andrii's bpf_ctx suggestion folded in, and
it's what I've been putting together for v2 (unless someone comes up
with a better direction), which is nearly ready to
post, so let's avoid duplicating the work.

beyond trampoline progs, v2 also covers raw_tp, tp_btf, syscall
tracepoints, and BPF_PROG_TEST_RUN, and disables the per-CPU private
stack for preemptible tracing progs since two tasks can now run the
same prog concurrently on one CPU.

a couple of notes on your patch:

- Passing prog to bpf_set_run_ctx() churns all callers that don't do
  recursion checks, and doesn't fit bpf_prog_run_array_sleepable(),
  which reuses one bpf_run_ctx across all progs in the array. In v2,
  bpf_set_run_ctx() keeps its signature and initializes prog to NULL,
  and bpf_prog_enter_recur_ctx() sets it after the walk succeeds.
- bpf_io_uring_submit_sqes() calls bpf_set_run_ctx(NULL), so
  dereferencing new_ctx unconditionally will NULL-deref there.
- Cross-task synchronization isn't needed: a task only ever walks its
  own current->bpf_ctx chain (and any IRQ/NMI on top of it runs on the
  same CPU and walks the same chain), so compiler barriers around
  linking and unlinking the frame are sufficient.

I'll Cc you on v2 once I post it (probably by tomorrow evening UTC).
testing and review there would be appreciated.

Mike
