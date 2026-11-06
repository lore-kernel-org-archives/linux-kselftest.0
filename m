Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968053;
	b=YR/8sQRtPv82KAfYWJg7qAy/DF0xujeLYd4QxOCrrRy9qQsAkLAj5RPstHUbLfUhiRMS
	 xHXfDt/1sCx/uuymsiyQ+R5er7lu4HKzFOi/9XYOZ6W5om+QRdi5lU1X08dcwQqEOU9PR
	 qDrkxGrIeq3BPeQ9kdj/luI+4+zv2zReS/attv8bBAyTe9TAGzcar01mzgS9TTd4krVn7
	 ZsVVcGooQh24Qqvd1fdg3hUKt1sXBi95ae5lT9vADePIurK2GLC/UFnpY6nvSHE5GxXBe
	 t4+Eyr1ckY2H4fos54+Xqk/muoxFPwcVRSo105c6PUXt+x10SvcKkzAXwuvUENQPCog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hVQgj/qtamPKqZe9GjDSaLmwvkqiYswM2rlF0amjSwA=;
	b=wiqa6NJBAMpHX2TESiNs2wQlrGFO/WxR0vtb+Mns8iYQyU/PiS2A5pGAsCIL8S05ipo5
	 /amGSlU1UBZgz9f+BkiErQoIjiq6bYXlJfh3BhKN6d+qn94+OQRwEJGDSbe5q2ZCkDtEu
	 iUoRVMvO+umq8yenTa8mFi+W5IQp23U39sOINjtHmhheUhoXuvH465e3ijTnvxX8bbYK5
	 5u/9EJ+bB2j6J0yrtgDy24qtgRKXeQB+zDvNVWFH7YwQew+1j0G9Oi8S3qaSrtQSGwJd6
	 FvX60G8kqHn0YGAmlD6rAharN8gj/C+hb2B5ue7hfeV3FZqym1ugMSFhKWK5JVlYflg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=Slzp+EhU;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45453606A333
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 12:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45453606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=Slzp+EhU
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so4154265e9.2
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 04:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793968049; x=1794572849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hVQgj/qtamPKqZe9GjDSaLmwvkqiYswM2rlF0amjSwA=;
        b=Slzp+EhUlrouRtTK7cIqBLFjFKtffdW/HyvUHLYmJw7XjmBeYevm8Lj12xNdvJ+2qi
         liAcKT2C2BgvihbgNMzb8b3i69eta9Ggy22EKuffT47ojjRQQeUZUlL0+CMrIOXXRdN+
         sRLJx6nb9Q70/SrkYjnSYGmXCsN58DJZDOsQf3cuKue7biIpYuLYhoQmYvNYoUk6fl9O
         lbOnIYtMBTTw5XM6N7cJWvWgsAPf/swDvDDEU7e0iy8FWBxtte++wUHhFiZsO9OPSdTN
         CsUi1P7v2jyC3Rb5umcVVSNAGKgE5NKtIg3wR8TSSyEYwPS5r+U3dUbei/vxB4IV5Zoe
         WKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968049; x=1794572849;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hVQgj/qtamPKqZe9GjDSaLmwvkqiYswM2rlF0amjSwA=;
        b=hSf39dM7oPptEL/pC4u8S/7KT6zzHvCKHhELTgY/eUvwLmO10qKVFCcsgb1+k18/RH
         alXS4ibr2tyoAcpZUyuidybq2WQY4EQy+ZUzqGmWc+Ro/v+8eKWd92J4snz6uLNoxahD
         Xid7JBTpHGWacSbR9l3H9vO0Vicq3o5JB92+pmlPg6iyBJF22grr/cyzNmhOObVD0uZE
         TQGIWOidAZSni/yAL5vGh+gG4fwiwmsDjdc3d4Fh2WvlOlMk39FIikLQdFyyLy+NOezQ
         /iRH5iHkU+XQRCaBlI+EzEn34LRowJR46FSMcNJFfTJSPG0BQftFcZ2PgrRh6kVZcZHF
         jTmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtziHjAkgygh0KlslNhNzOvSOynEgFGuR34dubUP/LCFbgLY0qoid7qG0L1VGHDMQ1il8kY+AVcVFOW40zyAc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9V0a9+6TFVgFCMCU4AuSsQ3dYpTzKuPndSQyoJm8a3Dhl51J3D
	mkTLz0i7LCmicyDTyDYxa8eCK+JJevJLlUdK1O5pwieweaFzJx/Qd0z4ZFJIGU9AY/8=
X-Gm-Gg: AYBFou2loK5SpUayua+oHnfjEAE79J6g9XxqCakJphcwmUVeVgz3PvqzZsvR0KjY0W8
	bS5grevyfKG2LxQfV91u2DyPxwYeT7CuFMGgsgXEeFxf+Gkdg2icPXzilfR3FJI6LmLCy2jSD8o
	Fal/rr6uwClN+YUliQnaXoKrADWX7/vwvryDZGmdcFrubwwz6SufXQnREKnr+jfd4AKwSIM+iTe
	ZkNBbfMOEguTU8IwcoLNHVRCxKEaTZyv6LubjPC7gzpMV3bHZjlxp0wzwh84ZLU4Hx3MQKPuFDX
	a4GA/NSJiSD1+jf1F/31QX2MymnyrgfZm9JJfvmglM/wLnq4DmFwWi5rNjc3cKmBNkK2k2bHCSr
	/T5tMi6kgjVTCy1H1cFbzKSBeUgMuRaQG+o0XZeCh2UKNzzol8Iy3ZyeNGKuEjZ0GzJDjzQ5qph
	o6rwHEJ7zFBCSRNMdWYpNODr50NQNiq5bA8OZ0mEDwlZHpEoemTYa3fraTzvpFffy26aspU2ywY
	OjTkBEaFULauhLIf0dwqsH+dsbZSK5N4R1Y7dBhdrbVKs0zRLaSaVD7Gu5yXXE4GfFN+prfu29k
	IkXJPLiIHRlAzpbCCTGnLiXMfZkBjqJQRb0p
X-Received: by 2002:a05:600c:4454:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4b6dfba8640mr38712955e9.23.1793968049321;
        Fri, 06 Nov 2026 04:27:29 -0800 (PST)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6e1b5d745sm51444055e9.6.2026.11.06.04.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:27:28 -0800 (PST)
Date: Fri, 6 Nov 2026 13:27:24 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Petr Oros <poros@redhat.com>
Cc: netdev@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Jani Nikula <jani.nikula@intel.com>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, 
	Ivan Vecera <ivecera@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 00/14] dpll: add a simulated DPLL device
 driver
Message-ID: <au3HhHt5LD5scvn1@FV6GYCPJ69>
References: <20261105151852.1844305-1-poros@redhat.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105151852.1844305-1-poros@redhat.com>

Thu, Nov 05, 2026 at 04:18:38PM +0100, poros@redhat.com wrote:
>The DPLL subsystem has no in-tree driver that can run without real
>hardware, so core changes and userspace tooling are hard to exercise in
>CI, and the pin-on-pin and reference sync paths see almost no coverage
>outside the vendors' labs. This series adds dpllsim, a simulated DPLL
>device driver, together with selftests that run against it.
>
>The driver is controlled through configfs, following gpio-sim. Writing a
>clock ID into a device directory and setting "live" to 1 registers a
>DPLL device with the core. Pins are directories under pins/ with their
>type, frequency, direction and priority as attributes, and all of them
>are registered when the device goes live. The split between creating
>the configuration and going live keeps the register and unregister
>paths reachable from userspace, so they can be exercised repeatedly
>without reloading the module. Nothing in the simulator is a stable ABI.
>
>The patches follow the shape of the zl3073x introduction. The
>driver starts with the device alone, then gains pins and the static pin
>operations one at a time (state, priority, frequency, phase adjustment),
>and every feature patch is followed by the selftest that covers it. The
>last two patches add concurrency stress tests and reference tracker
>leak tests for the lifecycle paths.
>
>The simulation loop (lock state machine, phase and frequency
>measurements, monitoring features), the topology features (MUX pin
>hierarchies, reference sync, media failure injection), netdevsim
>integration and device mode setting follow in two further series once
>this one is in, to stay within the 15 patch limit.
>
>The driver and the selftests were developed with an LLM coding
>assistant (Claude Code) working under my direction. I chose the
>configfs design, the split into one feature per patch and the test
>scenarios, and I reviewed every line. The assistant wrote most of the
>code and the first drafts of the changelogs, and it found and fixed
>bugs by running the suite on the lab host. The series then went
>through several rounds of an LLM based patch reviewer whose findings
>were fixed, and through a mutation test in which deliberately broken
>driver and core code was caught by the tests.
>
>The selftests live in tools/testing/selftests/drivers/net/dpll and run
>with "make -C tools/testing/selftests TARGETS=drivers/net/dpll
>run_tests". By default they create dpllsim devices; with
>DPLL_DEV_ID=<id> the basic and feature scripts run against an existing
>device instead, so the same suite exercises real hardware. The whole
>suite was run through the kselftest runner on an ice E810 host with
>CONFIG_KASAN, CONFIG_PROVE_LOCKING and CONFIG_DPLL_REFCNT_TRACKER
>enabled, against the simulator and, with DPLL_DEV_ID, against the ice
>DPLL, where the tests that need a simulator skip and the pin state and
>priorities of the hardware are left as they were. All pass with no
>warnings in dmesg.
>

set-
Acked-by: Jiri Pirko <jiri@nvidia.com>
