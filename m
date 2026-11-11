Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794427672;
	b=YzP4vW6e1v+6FE0iBgQOxSIa4IG/O0WpEpC3eaVfO0EYX6nPwlSMMkQuvr3o21k6P25X
	 OOubrwdxLIusbQ3KpdU5wMznnejlMP+RpglfVukmoVoKfXxfkICFjMjCUi5IazmFUeOr3
	 DC7B1dMk5zBoB90pKVH4aaCBuebeQZy39Klws+EW5X4C4PC7RcCg5U2asrDZzlFprWM55
	 rV6XLCdFTAhFhcGGLGGgHmqJDXaNZNodbRWtCZoLjSxftnal0VRMK/ZSga5rz+5Gpg3eJ
	 LO+7Jh90TVK/07QtpkuDbGPv2aZCt/7GUZESpydljHlG2tO6n5EJ+FtbsfkAQJnfPDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794427672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=5EMCD1rtKeIzP4pmI2Kq0aEOHvbQvIVCDlgtYyGqRvY=;
	b=Pd0tui6w5wNwJytk2ulzr3UUaXmjRSXELkZ+Mvv+K5+G/gzMtu4TG+BDFlFJc3fBp5Kd
	 l8nrsFeMPPJqx5qUVFgkU/ULglqwe2ZHIRlzLCFab/IOOw3P4kNiX5l2+Qje6VPXttIEv
	 5PyG4PG1XyuMjBgmUOyQ2I6ZigqtfznRBqfJd09W5728uCwIQ7Pr6FhTm1/oAENTTldx7
	 tItPiMVbNOGFan3QRwJPATPVtcFT4vZsxro/bMBEq2jRtz49Ibe7srPDY7xT3GH26x4jY
	 EvWkc1RBYsiakiy5sLzHuua/c6tBnUHmFeqRctNrrMqnNLVP1IfK0+lgdydGvDIsc9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ib994pDE;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0B4606A321
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 20:07:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF0B4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ib994pDE
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso1769578a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Nov 2026 12:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794427671; x=1795032471; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5EMCD1rtKeIzP4pmI2Kq0aEOHvbQvIVCDlgtYyGqRvY=;
        b=Ib994pDE2Q7BaLhj22bPoqfOJhpjDDRFZvrAJjF7ehEjzTVOj9cWTjN5eyCaRLx9Do
         uaS2NF2dBOoNhOHaCI9cq6B0c4DpZT44Hwg4BXixTHzx/hoKZRKbUk2vfdj9GyW29j7f
         U4BAO1G3gUuj8dyUyzwVofzhK55MVd3KDdmWW0CyJi7QEjT+RRSF0k5VKFhX7ObI7VYH
         ZihBiev0hpknq2qZjGUOhL6B6WeIU89r6TxdMuT5YsT29F1WLV/aGEEzx20tAeRGPyaL
         zxhqro5AjHVmfqcVxw1iU2Dd3YE+92tQUea9yMj1bQgdPsP8FxxF9dTN/JDZEZO6Q3mi
         hP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794427671; x=1795032471;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5EMCD1rtKeIzP4pmI2Kq0aEOHvbQvIVCDlgtYyGqRvY=;
        b=LxXgaeiYwqfehAy8JTq1dsL+1f3PfLQKPDswkYXFSfk42AHEP5PmtarlhCXWHGDiHJ
         hgNuEhRyAuPFhtyUWlBRJm45PXynPE/3W3OhQnxi7WYZwB95hp9K2DNIPaj8BU6fQSIP
         kjvHuwZRrNswIhNzX2iF/v3tUa2/8AyxXv6Bejb13kJNETq3a29xdWlXRQ7qywMz+Jay
         uJCWbCqNLcJSRLGIV77L2y7e8+xkY4VcKbMEwk5G8CDFFtPsUtn3EiJopj3WebdjEnAh
         BV46+pURSl+DUlJedXBhsIzk2DdrSdT0mU6FnfkAbLGA4ohalZSNm6cvqlZSEnsuGBd4
         VjSQ==
X-Forwarded-Encrypted: i=1; AL+hErEittiEbqbPAwRfLY9l9WEtvBp0ik8PmvV+kN4Ruy3KqqV6M4nKaksjqKOnK+BLBGFMGyrAfhMpCW60ZvkzLKA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+isP4Dy9Iff984xmx0atyzcqe/PbOyxzbabZ1PSsSulMrH7jpO
	2InvOAsiiOd8XS8Z0m6Imm9vMGeW2JyPRagzj+joI1wJVZRfHDBceLblUyjyUqISiA==
X-Gm-Gg: AYBFou3GdDpSKw8aTFfB1HO042JctpM63MQFe3kepDBPWyI2TtlGnidC+5z1JDSw+ZQ
	FoD+e3je78xIMRy2lA71IADBYnj2yVxnLG9P64/E+etZ6i6gjcZTTFUgsDJj6K3zoa282KhkpgF
	dME3SZFF59O9KD+/iB2KqXLdBgNmgwht++J3cIQEQ0achWlDVowU4Uf80NtB//XD2uGq7W2EsHG
	D8VXXfnr9jpWHm7PGChIVJYGAIp35qRWKXalTVTmkO/fpY6GvkTT+rfXZqlz4OP5osUJIs73nz1
	A9PZr9mkrw9Is+TgeUJ9wWeUg0/SkFFukbwzpuMFuxxLAgmI8Fjw4PzMugyJqtx5/nOuF9ee0O4
	sZ6BbnhyAet9J9iUj1/0OxwH01rFnTOIEwjPWir7Yih726dw7FtiaZ3Sf2ACQleV4czRF8oKF9w
	F8M1GRmqu1+c8ErrRGWVlZ2Mm22mEo1mFZHEcoCiGzRQwm7I4Uo0IQ4Aq81/wpKv3o9A4q8IFbN
	8812NOXOWj9u7jkozs93sUatdrOfzZPL+q2Rp30suIgnA1xsh8GE7wvwPVYJsh85IApLkkXGpHY
	C3zgFWziluBfcf/cnjSRLOQSKwUB/je69FpqCG5F00V1g/HTGiQjxdk3zimv4N+0
X-Received: by 2002:a17:90b:5101:b0:3b1:64d3:f308 with SMTP id 98e67ed59e1d1-3b182f8511amr3538560a91.43.1794427669947;
        Wed, 11 Nov 2026 12:07:49 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d27cf1sm691230a91.12.2026.11.11.12.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 12:07:49 -0800 (PST)
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
Date: Wed, 11 Nov 2026 12:07:48 -0800
Message-Id: <DMSNIQJ9G6P3.2L2X6PDV6QBGA@google.com>
Cc: <kvm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <stable@vger.kernel.org>, "Abhishek
 Sahu" <abhsahu@nvidia.com>, "Raghavendra Rao Ananta" <rananta@google.com>,
 "Shuah Khan" <shuah@kernel.org>
Subject: Re: [PATCH 4/5] vfio: selftests: Add sysfs_kernel_warn_count_get()
From: "David Matlack" <dmatlack@google.com>
To: "Alex Williamson" <alex@shazbot.org>, "David Matlack"
 <dmatlack@google.com>
X-Mailer: aerc 0.21.0
References: <20261029203324.1637772-1-dmatlack@google.com>
 <20261029203324.1637772-5-dmatlack@google.com>
 <20261110103434.48709eba@shazbot.org>
In-Reply-To: <20261110103434.48709eba@shazbot.org>

On Tue Nov 10, 2026 at 9:34 AM PST, Alex Williamson wrote:
> On Thu, 29 Oct 2026 20:33:23 +0000
> David Matlack <dmatlack@google.com> wrote:
>
>> Add a helper to read /sys/kernel/warn_count, which counts the number of
>> warnings (e.g. WARN(), KASAN, and UBSAN reports) the kernel has
>> encountered since boot. Return a negative value if the file does not
>> exist, e.g. on kernels that predate it.
>>=20
>> Factor the code to read an integer from a sysfs file out of
>> sysfs_val_get_int() so that it can be shared by both helpers.
>>=20
>> This will be used in a subsequent commit to detect kernel warnings
>> triggered by tests.
>>=20
>> Signed-off-by: David Matlack <dmatlack@google.com>
>> ---
>>  .../vfio/lib/include/libvfio/sysfs.h          |  7 +++++++
>>  tools/testing/selftests/vfio/lib/sysfs.c      | 19 +++++++++++++++----
>>  2 files changed, 22 insertions(+), 4 deletions(-)
>
> I have a concern with this approach.  I run selftests in parallel as
> much as possible, using multiple devices, each targeted at specific
> tests, with other functional and performance tests running
> concurrently.  When wiring this into my harness, I initially saw a
> failure, but can't reproduce and have no log from the original event.
>
> I've updated my local CI to keep a console log so that I might have a
> chance of chasing the next instance, but I don't much like the fact
> that any warning occurring concurrently with this test can trigger a
> failure and the test doesn't provide anything to go on in the test logs
> themselves.  Thanks,

Thanks for trying this out and the report.

What do you think about keeping warn_count to detect warnings, but also
reading /dev/kmsg so the failure details are captured?

 - In setup, record warn_count and open /dev/kmsg and seek to the end.

 - In teardown, if warn_count changed, read the new /dev/kmsg records
   and print the kernel warning reports (WARNING:, BUG:, KASAN, UBSAN,
   etc.), including their call traces, into the test log before
   failing.

That way, if the check fails, the test log would show exactly what
fired and you could tell right away whether it came from VFIO or from
something else running concurrently.

To avoid breaking setups like yours that run lots of tests in
parallel, we could also make failing on warnings opt-in via an
environment variable, so by default the test only logs the reports.

Alternatively we could just say warn checking should be up to the user.
