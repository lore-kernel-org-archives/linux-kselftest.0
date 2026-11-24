Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795491209;
	b=TcxMTQmtL5mB0B2PUeDhBQ0aDyEhUY3o1jSrlUTxgMsDEltP+i5oMOERZWOQR5+7b+0h
	 RBu2uv/YJIm6+MjohSOzD7xe9qCKMh1oOf8+sYvG0xjx3rI1bmum+oTTWdB1+5Lc0dBvg
	 y86JK+/XNEIQ1TFzbP5YgspM0geEP7cPtgRWfMjhUy8C7jt4NH4lokJWZi4DPfBsYXtmn
	 xkoXtdkDXjS51SQl7/SYUHHS/kTTfLdynfsMYrajwo6S+gqZlwPFxFcIrxnjjoFbk9adu
	 KLhVKhAZXJaj+Px5/K0l0l42KRT6qMueexbytU2egRYAHlMDaDuVOKAzMzXHCigzPeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795491209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=HtQGXmDLK1knncRVdCTkTy3fQnI6z6mdkboXAFgFAyA=;
	b=fz+t7hirglHI6RhpWHtYigzSQrHqwzmM2LSKHHQjLT1PgPeln3vx1tFEiy3nOxCMmvGo
	 bFydVfHuU6HHWIbhrdScaXPPaZ6ghPlDMUOa5BY6atDyUGeRnJn7WggzEhjaaTxq2xD1l
	 niqC1Ud1uH/sepn8wq6lgIW3wmoHyHodorXAQGrc6UKknPWQGCohRJ4ZDzfKWSDEfdK7H
	 k2fiTbWr7UoGQe9hoP/to0ortU6WmZFjSZidSuLrfrnEe3aOAfoKAlfY9t9qv3R+flyyH
	 rP8PqGEybsu/t/ubAOPU2vOalH8SAbdKKVRl+GmNB4sop3vkhm1ESc3mMqSpBf3PsRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x7KAfRMZ;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0120606A327
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 03:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0120606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x7KAfRMZ
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3b3bbd46625so907885a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 19:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795491208; x=1796096008; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HtQGXmDLK1knncRVdCTkTy3fQnI6z6mdkboXAFgFAyA=;
        b=x7KAfRMZvLVFOXhMB2PcYGsAy4G7uaTxoKpMUzCfoSIe0xYloNEjewCI75s8aJNr63
         wb8qz19QiKmBPoFFzOGcGBcuyOmoUSj5X4HfEeMdTmFuAdFaLrFF3FQuypMadypOX+bl
         EGt5QUOnt6MWjQasSPVnZNdnFlTvc/LxIzWrR+ib7IW3mRnmKM7E0pAdT2460lUF76/V
         9C5QNSb+0nZ2D4BhU42onL/KOaDDW4dBewk2NtQO0LmdiUDuXM5JOK9HzsmCF41f9sql
         6QDlXoAa4rbCaAnSW/8JsAjEPSR3/Q+4uNw2VKp1N6RgPf+cJXZ8xEfxhmM7QbhQSyMf
         3Mrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795491208; x=1796096008;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HtQGXmDLK1knncRVdCTkTy3fQnI6z6mdkboXAFgFAyA=;
        b=YI/QU+iChZsdPwYDPOG51wU84bjxqWxlCOM38q/lnsjLMbijW197nN4k527ymsuCfY
         T7rmh05wnjKkTyPIxTvIUmrdelmrElPF8XlxOxqP7VJsJaSJDADxt/NscG8L4qOTMQO+
         LMbv5S0ISKEsBd3NVqWm6hiw4KVvmLhcMytAKUfQocEAtNRfGsiqKqG5ncX46imrGLE+
         k7hZ5wh1eFSZPpDloXagWhCgE8EOLyiWgYtL79+2kG9exZtNlDArgqKqd62RfJ9xe4Ej
         OHRdR50FMoPUMMGcsORw5LdwOytJj0EsjcFDCKGR4vTyXaXGTdb/87ZhlaWBQUJQdzHn
         c2FQ==
X-Forwarded-Encrypted: i=1; AL+hErGoqCel0aO5EoCC3ew32qfYxENlRGPNUcDlnpPtYyFDD62VSRXyDjH7UavaoVREZQMGPV8k3nnMkepPonmpU0c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cAJRsYgyZq/U+cQ3Iy/cbKcOhIhS8C/fIcvVKJJsuugmUW4md
	sNvvJwYUoyBdihN3aIQaqr77Er7IojFvrAiFHZNAwak1Q7EoQJylRyLe
X-Gm-Gg: AZFdTZdb2a+Hc4kmfGaqXUI2CNCApbIvTS/FkM0SlLrHJPdJYR87rCbBIuMhnOPD5M+
	q2khw7YOucX+5+dIl7CKj8twU9CNp+WKq9ciIJBRiyjysKPY9kjhTz5xpXEyzuwsUE4nmy+fkR8
	e9GNi8ikXQaQsR2GpizKSJqDEbY9d7eVdArkWOjIpFybW6RwV/8hSj3ItTNwJXXad/IWVqyrCZI
	9/KDQV7jkb/O5d5ec+606RvxnRNffzfTbZvpHdyknQvZDPL9gspHZdzuBEqbbEHR4or2mBttGWf
	hHarpXWylhu/oB4Vy+KXqLCnyRN5rGU0LM99R01upeZldpfIn6BZ4OPhRD8Kmbxds/IF8SP81Cc
	Jh63qTaYexXl8PVfTdTQWHtEOeWOhwqqPbA6u0vMeaZvICAV3HH3pukTgSkgAdcl/a0slpSGZze
	yOuF8OnhHmfxv0kfoPw2+23CSULXtvH5H6FKozwI27aH0SuH09IsIjM9yGilkaEG83tOzv5jQ92
	nC69RxJkHrtTslO8RcqgR3jW1AXop9z0JAZNhN4c5uPvUXSPKTEtgwNM75JXa8Nl3+0zeKc0Eec
	x4qWVQ9C9YiIhLnB+viKsQYxpdVEeRklSXNcWxKo1g==
X-Received: by 2002:a17:90b:2247:b0:3b1:83aa:5b53 with SMTP id 98e67ed59e1d1-3b41c98a1b0mr13226363a91.58.1795491207740;
        Mon, 23 Nov 2026 19:33:27 -0800 (PST)
Received: from q-Legion-Y7000-IRX9.. ([223.86.210.47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b217a5bsm9122009a91.0.2026.11.23.19.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 19:33:26 -0800 (PST)
From: Bingyu Xian <shanbeeyoo@gmail.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	linux-kselftest@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH] KVM: selftests: riscv: Test the SBI STA shared memory lifecycle
Date: Tue, 24 Nov 2026 11:33:18 +0800
Message-Id: <20261124033318.612773-1-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <av77j8rN593sxIDh@orel>
References: <20261115085457.889873-1-shanbeeyoo@gmail.com> <av77j8rN593sxIDh@orel>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Drew,

Thanks for the review. I should have separated the scenarios and stated
what each check establishes.

The enable/disable operations are used by the Linux RISC-V guest CPU
online and CPU-down callbacks. The selftest invokes SBI directly; it
does not run Linux CPU hotplug. Hotplug motivates disabling and
re-enabling the same area, whereas active address replacement is a
separate SBI transition. I have reworked the test to cover disable,
re-enable of the same area, and direct replacement of an active
registration separately (v1 disabled the old area first and missed
active replacement).

For dirty tracking, the intended property is that KVM's writes to the
shared page are recorded in the guest RAM dirty log. I have moved this
check into the common per-vCPU test path and cleared initialization
dirty bits before checking accounting writes. main() no longer needs
the added #ifdefs; architecture hooks select any protocol-specific
lifecycle cases.

The update checks now arrange runnable contention on the same CPU with
bounded waits instead of assuming every KVM_RUN advances the sequence,
with a small prerequisite patch making get_run_delay() fail explicitly
if schedstat cannot be read. The revised test passes on RISC-V and
x86_64, and a local control omitting the STA accounting dirty mark fails
at the expected assertion.

I have also dropped the MADV_DONTNEED case, since discarding page
contents does not model migration or establish a content-preserving
backing replacement scenario.

I am posting these changes as a 2-patch v2 series.

Thanks,
Bingyu
