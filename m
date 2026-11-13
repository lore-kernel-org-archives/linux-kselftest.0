Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794577664;
	b=EhUf2YWKIr1fKoVQz2yiZCqZvIPOxjp4tXNR7wRCANtLI2MDJIZ14/SywnLqMZp9JtOg
	 bl1rj3uStJmPnYJTGJWBKGaDQukY1tUVjHq08xCxkynbJxz2zguPV41d3MfbyKpPw6N7h
	 4/x+klKn3k54mZbk0COWschZORNJjI8Bi+Ez+AbybyuV6ow+Utc0mcLSBK1ayyXg7dYtH
	 RscaLVT5EZtf9ezo2JKVkANY9raioV/Hrks6lzb36UyU6fAncLzDgbd9BuibiUxvTSI+X
	 5LmxYPaFZmNVDHpmgkTg8kE/9h0uhzp/lPUfb+5csLtgvMhtVw4EDs+T5lFeWSLG8Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794577664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=58sEe0BHU5Au0xisS/lqaZE010aQzkxa4/+2f7HcCgE=;
	b=rlSYzwsAA9rkGChVqaLzHzWYm5l9mF3AORpLuCR3ufWqlaD62gkuoTp0tJqFJfbztFQ4
	 MwT9hMEX/qT5X+kf9jh4WADHCgch0m6pwmbnQpt5xEeA3fDKZ1ZWfxVE2+ESfhdjy/OKq
	 7up4Lwg+t8A0fxsZnMli3h/oq8rSimXeODvMMAV8d22wXMcZd4u7BCv0rfwC+QWkFrvrw
	 NQB8m67CmrWC2uQlfpjWUSmuyESwpy7J0uaKHQLQD7ryw6YoLuAoeBzvB3GYR3wWbQzav
	 V737vsjEY+p3xulNeoUH6XcAqUC3lhwhmrC3G2j1spP5kLhb7VaB1L8UehpXdMAsTig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l2PGJZqG;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDC4606A331
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 13:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBDC4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l2PGJZqG
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b1a6447f1fso847058a91.1
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 05:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794577663; x=1795182463; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58sEe0BHU5Au0xisS/lqaZE010aQzkxa4/+2f7HcCgE=;
        b=l2PGJZqGYxvhATo4F1i9faJA2f6ya8Kz/C8VrstCvC013HVx6eydXtIa//J+Vho4nh
         /U1Zy+Hw6O1g+GFO7bCWGTIaTkbERzE348WEtW1ubNS4ubuIyWgsZdRAxW8+wXJMjppp
         EPfKra56aTtMeQVuR9hl+pmOuw8u4GBEv8bTHQoJxciUWR693GN2hU8S58qVikYt3ZQ6
         EkPIMDumA8N/8+hDB7V4PodqLrOgfKgoScwoGaJnlC9jqeeBrdkVJ1tH9SSXoSHJCtCw
         lKQusZhKnbc5rptUoZQQN2gQS2g7unyWxW9oFOXtN1PbM/UPPeSfavdVNMA+CIRRXpDb
         s+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794577663; x=1795182463;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58sEe0BHU5Au0xisS/lqaZE010aQzkxa4/+2f7HcCgE=;
        b=aMUimPGd/dfFf0Lhlw6fOBQ703X+8KAaJKwlMVErZgkirp6Rt9FCEJG5bMFfSnVTSA
         9LA/lWyEpstLF1uYKHN1NqY+ZULtao12bc0nwwsKB2KyQN0JH4afv4+WTgmMBC7DH71V
         0Gq/FeeANoFyImhUW79nfe8gIe6lFobizKFrQzn9qlBRmbUU9n8W6StRY1y7uoY2r12c
         2X8MdoAwryNEkkHvyLrN+TF/2GMgn6laPXCJe92KcLhiG1tXT66Pb8mjpkNWqQxlWM2b
         Heb1ZaRA/SjRcvMKmrmJowHNN9q38WhAGdK2BCw0gUGG67b22xErLDfDyMGmZHPVtwOB
         lxvw==
X-Forwarded-Encrypted: i=1; AL+hErH+e6P66WnzcoK1s1ECqJjsvpVp1bSC2UpoYJE9T9/1gLUM7b/UmQx5qaJMA+b3d/tHjMumN2giPdz7wTdItBM=@vger.kernel.org
X-Gm-Message-State: APuU4Z//duWIZaPe0a3EPGgKGAgHNxJum75dpij0YxJmhHUnTxk2/jf+
	uRcPsEeoemC+03qwB4MIsWSVqpU/exD7OOhuExZgxhcMsRerPkX8vWDRFT4ExjeYtaHYQx2I38A
	Oy7mz8w==
X-Received: from pjbgg4.prod.google.com ([2002:a17:90b:a04:b0:3ac:7545:d82e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:28c7:b0:3ad:9ecf:2b88
 with SMTP id 98e67ed59e1d1-3b1b0a0b8eemr2120104a91.19.1794577663138; Fri, 13
 Nov 2026 05:47:43 -0800 (PST)
Date: Fri, 13 Nov 2026 05:46:16 -0800
In-Reply-To: <20261014200152.1365147-1-sashal@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261014200152.1365147-1-sashal@kernel.org>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <179441826288.81035.4880834403901234629.b4-ty@b4>
Subject: Re: [PATCH] KVM: selftests: Provide empty installation rules on
 unsupported ARCHs
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sasha Levin <sashal@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>
Content-Type: text/plain; charset="utf-8"

On Wed, 14 Oct 2026 16:01:52 -0400, Sasha Levin wrote:
> Unsupported architectures provide all and clean, but installation and
> runlist generation fail with missing targets. Supply empty install,
> emit_tests and run_tests targets alongside the existing empty rules.
> This represents an unsupported suite without creating dummy artifacts.

Applied to kvm-x86 fixes, thanks!

[1/1] KVM: selftests: Provide empty installation rules on unsupported ARCHs
      https://github.com/kvm-x86/linux/commit/7a2ff8e1f281

--
https://github.com/kvm-x86/linux/tree/next
