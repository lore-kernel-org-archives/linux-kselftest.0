Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631500;
	b=3UpLOPf/rtXoUrFe2cxMI8jXQqdZ+yXMGieNL/4S/CwQR5w8jh0IKMPgHiZdi/HSOuAr
	 NIdBqcXswUEj2y5C1mw6ue/hZ4TJwnncLjgVBA/iVJa1L+6D8cPPD4RMGhnV8fq2vPFBB
	 QOaCJBfQpoQ/EG8oOQqh1SeU/Oi4FySTQ55GNj1zHTjkyOYr2mw7btTre0WiALHeP/AsX
	 KjrISp7ayhG+mKUWmwnDPdUxDLbDZJSSFhssYTl2svUIKJyyMjqi00KxIC2kixR36Lgxp
	 4+4vhG4h4UKt+3cSR0+o7yNHoyOT9FJpJcXMID1Gfa0Jaw1n5ZcPL5ZPRAMqcpLZYNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=p6saGje44sOd9IVlSUbpbD3i/Gf15gvuNPhaoK8DjVU=;
	b=Qi8oQsjpcgN2+b1Qhl7hcDBkqUqWfaHZLTEXiHxsCVXN+bHkWlgVobq9Csa61LIQcNI3
	 OYXs8toKVKFZZHc/t1ilNWNwmgZZgqBq7BXFJ8xBl6ODLQsbkV07CJrowWjEJ/zXmpL0h
	 2fRSnffTamfzcRqgTJHpHy83Uu4CgqN3+nLAonEgzn35P4XrXQQqb2PsqD0fWjk10IEbq
	 UXPct6gbv42cL505F18ih4AixIp1QTWy09X3w/OA4K1usZwXqXdCWNEGMP253+ydF1tMJ
	 /BUcKOX+nv3zUIZcHkjHtphb27U1z0K/zWJqpX/bZKbHD1hNVyci7vllWEdeMJ2Jg0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A7TNQmEt;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9E8606FB5D
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Nov 2026 14:58:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA9E8606FB5D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A7TNQmEt
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15ea896ddc8so5284665c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Nov 2026 06:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793631499; x=1794236299; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p6saGje44sOd9IVlSUbpbD3i/Gf15gvuNPhaoK8DjVU=;
        b=A7TNQmEtRhSGmI+/kljCE0Gf4gfBJHEXFtpbChpK1os5kr5tgYhjV+owLFr3lxH8Cl
         ccE8XMbOJoiUuY7e5Yjkc2+Dxpku9mV+tl255IkMZfvrrbw1S4XZr+GEshcP1SgVuJlX
         hxR8HudvVUygZv7ZszkctSoeyEcH1yC5lYWLIOiP5GLlYgTB90kg1Cx3PUkN1nVkhhMG
         Y/Bm72LV7J/NZyre2Nzisx0wk1LzHo2wi0DyxJE9CURZoU8cYI4W/ECQ+ZQAtofypAh9
         SNT3pEAqIVGV3ITZxyIjtB+WE2fLlhHCrd/UAKuPBIQjvdTNNGMpBbV8CGl+oECIvuV7
         ICNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793631499; x=1794236299;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p6saGje44sOd9IVlSUbpbD3i/Gf15gvuNPhaoK8DjVU=;
        b=UDkYoI8S+wrxiwXBdqVwLQ76Cw7D8Qq36Pliqg/SrETl7bSXQ1PilgS3S1YAXFisPA
         NQwxDIRi4qHURY3lY6OKGU9QgGgQ6hN+XyPCAyeZCBRN0TfU+Ghi8mm+L52vWxqJILL6
         AxG4iOO71/4UV5Bk72bOwRSi1N/umJ3K8AWyWUl8zxFV1oMEYwSIMOC+XRRQDZTAveoF
         q6cH18bCtnttnWu5a4w9AXMFxm/ro3zYgAtqKcltB4HAr4LnjUxEU2nnONg9bqSRIsCO
         0553sIneFg9s49qiJYXzdWI4Ilgw8GSe891GoFvjZj4DXVabKG+wiJD5wFyae5rzKG+M
         K6Ng==
X-Forwarded-Encrypted: i=1; AKwUvBwnu1GHgGkhNfvMhJLxlx193+z0yYKnRshc/eO+VEl9/iX4+ewaOUzpbMohivnqqfntUlhmjj0G3AeXLhHKl7c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/COwQRoKr045vDgiBQ9xEZTTvLHKRcr31kxilCGIrYSkCXyYpB
	uh7/nPxj/nm1XG9ptXSW/4+5fzcGPM5GE1xCL2G30YrnGky56YvhC+I=
X-Gm-Gg: AYBFou0VCxLohXy73vQ5Ww2mYn4WVTBDFIFkq1om0VWAP73T4wz3MLO5UnotNJJvwrO
	LYZYhCoMTP9IrKDG+r7Wo/3fLd8iZFEKqX5JTZLxg/+gcjOB1FazrA9XOedzbulVQ8Bx7G4hXI+
	/rBWrbUEQHf0TYbyOXSuYB96df6CTD+wseQhg+SEGr19fIJapUmguurpFTAqyLeXZ4nyIjnshdK
	NGeJdM/tmeQMhLFC/C7kzPnjQ+xOLW0ZGbJ+JOuihSsKoDAoo/hBSWqtdj8Lk8x+gA7qRkZulN4
	gk8SbZRdpv3K9aOxsKr5YrixCPKvJBh4/MDKPw/QnpPFwrfEV+Q9tIwDhYVkaaNH2tsALiOUWiA
	IEL+VLwTk8jLnNVLBVEo70j7iYLBZKT3dsy9tMSpAh3yFmDv/a2/wljkL4wEUhP2EYX0KhKNoOC
	/iSse4pY3TtAhewyQewRb9LF42q0cFX3lSOqUJoFeijDlX/y/UkOweM/hqknr1qGUy6OTY4bulU
	OMptRHbYBaC4Oxjg63+062lBugsOE/fNERcae5jcsKYSG+H1YTMdSdJkLKZFBXfD//HBNcuenmq
	Y3iGa5A62Ro4QwKGKTnFFpDi6oSrnpSP7Sv7Nr8xj0gGypOHEgmR3puSpLC6/Pk2
X-Received: by 2002:a05:7300:fe41:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-36a42401960mr16137115eec.7.1793631498925;
        Mon, 02 Nov 2026 06:58:18 -0800 (PST)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm42424368eec.29.2026.11.02.06.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:58:17 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 11:58:11 -0300
Message-Id: <DMKTARY7GF4B.27HUM6XMDTQNV@gmail.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Burak Emir" <burak.emir@gmail.com>, "Rae Moar"
 <raemoar63@gmail.com>, "Tamir Duberstein" <tamird@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Yury Norov" <yury.norov@gmail.com>,
 <kunit-dev@googlegroups.com>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] rust: kunit: add #[should_panic] support
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: <nico.antinori.7@gmail.com>, "Alice Ryhl" <aliceryhl@google.com>, "Benno
 Lossin" <lossin@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Brendan
 Higgins" <brendan.higgins@linux.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Gow" <david@davidgow.net>, "Gary Guo" <gary@garyguo.net>, "Miguel
 Ojeda" <ojeda@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: aerc 0.20.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
 <20261029-rust_kunit_v6_send-v2-1-5ce551efc48e@gmail.com>
In-Reply-To: <20261029-rust_kunit_v6_send-v2-1-5ce551efc48e@gmail.com>

On Thu Oct 29, 2026 at 1:59 PM -03, Nicol=C3=A1s Antinori via B4 Relay wrot=
e:
> From: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
>
> KUnit tests in Rust are written using user-space like syntax. This patch
> adds support for the `#[should_panic]` attribute, enabling the user to
> test conditions that are expected to cause a panic and report the test
> as successful.
>
> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>

Hello, Sashiko found two issues [1] with this patch:

> [Severity: High]
> Will these new selftests crash the kernel or hang when
> CONFIG_RUST_KUNIT_SELFTEST is enabled under CONFIG_UML=3Dy,
> CONFIG_PANIC_ON_OOPS=3Dy, or CONFIG_BUG=3Dn?

This is true, I tested this with:

./tools/testing/kunit/kunit.py run \
	--make_options LLVM=3D1 \
	--kconfig_add CONFIG_RUST=3Dy \
	--kconfig_add CONFIG_RUST_KUNIT_TESTS=3Dy \
	--kconfig_add CONFIG_KUNIT=3Dy \
	--kconfig_add CONFIG_UML=3Dy \
	--arch=3Dum rust_kernel_kunit

./tools/testing/kunit/kunit.py run \
	--make_options LLVM=3D1 \
	--kconfig_add CONFIG_RUST=3Dy \
	--kconfig_add CONFIG_RUST_KUNIT_TESTS=3Dy \
	--kconfig_add CONFIG_KUNIT=3Dy \
	--kconfig_add CONFIG_PANIC_ON_OOPS=3Dy \
	--arch=3Dx86_64 rust_kernel_kunit

And some other configs using the configs causing problems.

To solve this I created a new config "RUST_KUNIT_SHOULD_PANIC_ATTRIBUTE"
that depends on !UML && !PANIC_ON_OOPS && BUG. If the test is annotated
with `#[should_panic]` and CONFIG_RUST_KUNIT_SHOULD_PANIC_ATTRIBUTE=3Dn,
the test won't run and won't show up in the summary.

> [Severity: Medium]
> Does defining macro_rules! assert and macro_rules! assert_eq at module sc=
ope
> in kunit_tests() leak the preceding test's #should_panic value into helpe=
r
> functions or impl blocks defined later in the module?

This is also true, the solution was redefining the `assert!` and
`assert_eq!` macros inside the function's body (as Sashiko suggested).

I'll wait a bit in case there are any feedback on the current series and
send a v3 with these changes.=20

Best Regards,
Nicol=C3=A1s=20

[1] https://sashiko.dev/#/patchset/20261029-rust_kunit_v6_send-v2-0-5ce551e=
fc48e@gmail.com?part=3D1
