Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795575760;
	b=fN/av4zOG+id0Q7M2070ghURD6daPDtjyEoyNHdJoezMj9mtcfWWOiwETXqwu9S8tqn4
	 46BMHjVzRM6xR+a8NacsI7Ek1LsZa8Bb9Fhamq0P+1EkGJSqfWst9ru3xzB6K/0AIw+ya
	 rWC8JYNeXI2mYymaWWZw0mkQunplgMkiPsMaYCX+8Gk9e7YzKj9UC/sHoO58c2VaNWvqb
	 TGVFosm2yKaisT7nale/0YGkBz8tgNDqkBxm0YqkM2wLb85DS7jUXVnFehDrlEeAQCelz
	 rvuqaWn31ReHQugXNrwWLU9SaEGwPXKibNaC+XXrblYvRnrLmT/Dhl6VsbRUTlk4ijQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795575760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=Mj+S0OCJmwZBCexwj1UBIiBIBoUjlZPG6A8NDn0wRDc=;
	b=4i3i920H3f33DPUXxfqY5P2zB89mOkrOcyfV/O7T2fo4n6ENmkyIGoPxqmM6mQoVP5fT
	 G+rELPDL+7SMluT2lFUBZMwmVFpSzyR6VQEdXCcO3vBiteyrvV+4n7BnkiIUduzhFhwvE
	 BrZI1cRFR8rasgAuizp8YPtnslRKIo1e0hbSxNYnl7AB6zZEyYWR8bz7L5jQDMw+aFj0N
	 buFLRu1LFSwkcRGkS3Ix6XXhnNrqc7SujFPOHauTQU0NppI+6JNZSHzzSTdIXMQ+kEsQa
	 OIberucT7Ow1qkVAx1NWrbVmLGdIql3YtHvlzmEv+ml2kOKUXQy1JDcfwS4WW2n4ryg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tCd2zNLG;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60BF606A323
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 03:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C60BF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tCd2zNLG
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso2187523a91.2
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 19:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795575759; x=1796180559; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mj+S0OCJmwZBCexwj1UBIiBIBoUjlZPG6A8NDn0wRDc=;
        b=tCd2zNLGnXe27TOvg3Nsz35+Byxb+vmFt56s3OM1ujZaghvtCNHHsRIR3YgL2f76Gt
         qRAgSe7g8RVRytFGdJzCrBNQxJ9z9387sYot4IQUEAfqw9ixE9QBj6S+YbDQ+jLlEChY
         EMCGu6AK8SSZ/uNPZB96MBlT+/8o9Yt0SzlYEs7UL4+eB2bhnPJKt4obwaYlAZO5HkEr
         F4L9ZaayyXlejIj4ERqBQ9zZatOaT68JRM5VT5r0oRY4awazV3OAZqH7i4Kb5jbNkqan
         4eP76rCcqG1qt6TMRnhsJ31kg35lPbxjP9t0zzeSpX0k0AJBn6hDJGu1BhCvexrkE1Hd
         fsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795575759; x=1796180559;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mj+S0OCJmwZBCexwj1UBIiBIBoUjlZPG6A8NDn0wRDc=;
        b=l/eQOtsc2pzGsM/CykO2NT950KGot8wSvLmgJMgR5kJ2uUS9DECi6AdbPEHwudfBYQ
         SwhX4xquONWxSPZ+d/Ejp8lWDqsQiunnqAg9vfCLWbr3at1VzAZE9oDYuHR0jknKYwWa
         KaRGt7LS5XG4Vu+LD99m2tyWWNq2pTixoVRfGl1mOEEpirVgZ61qc1b4MYuR19PfE/kR
         /lBwug/gUv03djhbyWVArYEDpiPR5KRQuc83x0TDUE5ssk1OxLgAoRuD5Mp50KrqSNUg
         VeJZwMLiH5/vGRQOU0NrEVIDUe8UuvKtUkXFRzusE4ZEpPoYEiwtgZP79tdWiaAnLkT/
         d4hw==
X-Forwarded-Encrypted: i=1; AL+hErGWUST7dhBeBdVgNJWh4MWRTjCFUwKa1v+445qKzuejVSfoR7d057SwJoAwkKSy9Ewis207r+m7KeQk0m1nhaY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Yg4vqnmbCO8fdEjDSE1AFCGoEqvQv1S/8KiRXNLrbxxp/PvT0
	utMv9raWcNshZY9CpdV21ByiQeyTZkdQlrWSEi4Sg6866IINOkyUplPM
X-Gm-Gg: AZFdTZcYf2hSxNl/lVVjlWzJAac/8UKodtRUxEbtUVaIVuOMSU+/D5t5R612eJ2jvUV
	VzIztfYXu7SNOOxhKO2sSoQz4kkivgLlJ+5uqEVxd5eJ61+Dg6uJYNo5fH0pBp8zgLviCJDjleg
	JalpU+QU01Op7F24A6YptaMGu7CKOIjpPkH2ocf4vTq0OWjql4zh8Frhl5RNcKG/uyUpU2a2HWt
	wVrnk6RBDQuzws5AbudNEfLTWqlvwv+CaaJtCiE6HqG1/wtUeJHlO3hj4shFwHMst5lwJM4WUZa
	oK7yINGaCrvpPR8YVgqkQe4Kd6LfSG6QdganZw6Bex9pe+J30sY7Ne1mFF69Q/23IqfAgQoeE+h
	JysVUubg/xwJQRenRwJLa2IW4osLiUH24Ejl859m73uD5OhqQ2KokjWj1J0IRvxbq4dVE8HGwCZ
	Y+9Hx47Vyorhk+w+OTPsdMtsvY4z+jKJj3k79n6LL/MOKvs6wIMMmmOgbd19ESHAb0qerB3gxpH
	yieftiSIWdxXiVXlDezlkmX0YwaEbZO4QIDW/s23xSv3Pzly5BqYK0FMAve3hiSIuDqGs9YIlqV
	R0aaHx08tAxkSxSN6ybxqFned/R+pM+LB/piV5XeNT0f849n5/d2CHRbqHrbSbPiQM3bjZJ8Fe0
	qUSwqqKsVHhXLhhoJiplfZZDH8LWHUQp8VAL6ogcADB0PBUW/sXlZcnU=
X-Received: by 2002:a17:90b:4ad0:b0:3b3:cae0:2b68 with SMTP id 98e67ed59e1d1-3b41c95e7cbmr16230428a91.48.1795575758907;
        Tue, 24 Nov 2026 19:02:38 -0800 (PST)
Received: from localhost ([153.61.198.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41aab4729sm24999098a91.0.2026.11.24.19.02.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 19:02:38 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Nov 2026 03:02:37 +0000
Message-Id: <DN3YHFL4G7NM.36YOROLVGCSN3@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] selftests/bpf: Fix kallsyms parsing with long Rust
 symbols
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: =?utf-8?b?UmljYXJkbyBCLiBNYXJsacOocmUgKFNVU0Up?= <ricardo@marliere.net>,
 "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan"
 <shuah@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>
In-Reply-To: <20261124-selftests-bpf-rust_sym-v1-1-32c450d0c4ee@marliere.net>
References: <20261124-selftests-bpf-rust_sym-v1-1-32c450d0c4ee@marliere.net>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, Nov 24, 2026 at 03:33 PM Ricardo B. Marlière (SUSE) <ricardo@marliere.net> wrote:
> -	char func[256], buf[256];
> +	char func[512], buf[1024];

can we drop buf ?

diff --git a/tools/testing/selftests/bpf/trace_helpers.c b/tools/testing/selftests/bpf/trace_helpers.c
index e871a26..06f6553 100644
--- a/tools/testing/selftests/bpf/trace_helpers.c
+++ b/tools/testing/selftests/bpf/trace_helpers.c
@@ -64,7 +64,7 @@ void free_kallsyms_local(struct ksyms *ksyms)
 static struct ksyms *load_kallsyms_local_common(ksym_cmp_t cmp_cb)
 {
 	FILE *f;
-	char func[256], buf[256];
+	char func[512];
 	char symbol;
 	void *addr;
 	int ret;
@@ -80,9 +80,7 @@ static struct ksyms *load_kallsyms_local_common(ksym_cmp_t cmp_cb)
 		return NULL;
 	}
 
-	while (fgets(buf, sizeof(buf), f)) {
-		if (sscanf(buf, "%p %c %s", &addr, &symbol, func) != 3)
-			break;
+	while (fscanf(f, "%p %c %511s%*[^\n]\n", &addr, &symbol, func) == 3) {
 		if (!addr)
 			continue;
 

pw-bot: cr
