Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427352;
	b=ikH2+o42LXwAMAAr5MG8HaeSZz32rYoxSJADeL4hQH2U3HMs9+195J56pEJcMTnpcuTS
	 7wWUTksHR+5Ovu0UQum4pSbVM6FLmYEOUDGKvZVQVrlf31Unt5VgT9+obUIPhfv+TQlRL
	 WkiI1dtI6H37J+z0RjTjIxAbn+kGSrZ0b2ZUMImfxC+SHjwOansj8mHP/VtLskqaD0ZSN
	 /kj1Y2MmPPmJHIAR7/YWbmeg7lE2Iec8sA6fRKDNKTX1RR9Kbu7BDDCFUCBWabyDj5XIX
	 SvPD5U8VJEyJpT2sR/id22dAxvcMADZuD4aL/fWFhpelOvqmY2m8a1Z6U+tXe1o8EgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=5g6rxDcE+XSPvTO4IYmwgvIS3I7HcVTmR8Q7VnCTKgE=;
	b=OFObeDXB0qt7QDDY2OgKV0L9mti38uVUi3/nmb1fRCoKLqxbrfEzUrFDq0svoVp7Uvov
	 W4UnQyCmNmp7CQWi46BfGK+eLLGOSo+dsez7e3Gfx4rf5KNkQZjeCl3FYKzEjQZCFHhC+
	 vLHfZ6gcZaNvUypeGIqotQc7or/N5eEPpzO1rYVljSnGfip2KBYW+U32ZZpUxiulYTiYm
	 oVKl+sijUbN+0H0Z87zGvJ7rrEt62YeVkxXFbqNg1LOd35MvpdqbAQZShYFbwic8csIQy
	 6Kp3bLtcAKEqLYC+NM1S0XvXzPUF7xZtJu2wdP6Nje+yuQruEH9y6M2sNqm6OSQ7mvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--mmol.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Y+PTMQJb;
	arc=none smtp.remote-ip=209.85.218.70
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599DD606A31A
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 09:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 599DD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmol.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Y+PTMQJb
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c50681426b9so294069466b.3
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 01:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795427351; x=1796032151; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5g6rxDcE+XSPvTO4IYmwgvIS3I7HcVTmR8Q7VnCTKgE=;
        b=Y+PTMQJb2NRM0EXrjo7lt8ZaSyhMbJA8qNIirzqo3mXE6aqQ5VeSkZl0JLv2NWzIwq
         n69UfG0nqzoW1Ewaq1KEdXYUw9aHZ0jMi7Xrl7Gdca9X8xJ/xJvDYvk6CuKJ2KqHausp
         EYKkB1kwgJxi6hKiyi0DM8sAo1nNLLmqlBIsyrcFhkPzI/i6H/7+qL5mj9f9j9860DAm
         87FHPI4XSenuRV3YQ8d2VXDp5NfDC8U7bW+uwL14FSmKU/St4BOt1ZBcPQJUg/EJXNaf
         U7TzDJfHsEnFjkZEG2lrVOoKSEidQ9RbrJVApJBCZDf/d2jZkeGmpKQCiYiVO2rXP1V/
         SlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795427351; x=1796032151;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5g6rxDcE+XSPvTO4IYmwgvIS3I7HcVTmR8Q7VnCTKgE=;
        b=EpwthErWlxrSfE5KREbidPaSs0TO96G6opLElH6laetggyT+WALFlGaiV5dHYhI/e9
         1jVXYYZ7TDod9Ep8oXD4WBPL4wbXaYHSpBeZRpXoDtb7tjB5TgmH1Nqe7KqjzVVUSLnm
         RKt0ffhikAzSWyeaDYy8mR9Q1iIjRx4yXj+AxtCaj8v+agnDWEOi6FcTQtxXupU+5mZp
         3Eg4RMVM1Jdcc3Juzpmg/RzrW65iKmRA6NW5fSEmE8OwW1IMtDTWnuEhKrXWT+Hu/06P
         pWTJAF2uP6+Xuekc5JHV9u7Ak5sQtiMWcKkRbXBjefTGFXNz7cU0ajuLd2TqgtGOfua2
         iERg==
X-Forwarded-Encrypted: i=1; AL+hErH5Xi3q9hyrPUg8zH+VDUl8Fmc+hxruX3uqNV4dhJ8JtFrcmYnS4xv6AbQ2ijP2dLwtesSzUUHbpegjfKyEId4=@vger.kernel.org
X-Gm-Message-State: APuU4Z86wSPo5n3vSeIL0lLrJwGZfMC/8zoM2u2iK7IIUG90f5mKzQFP
	au6/wz0iRRiTrVrZ/bdIx0wa1bxWF0d4D1WT8jjFNXYolbEWJAC2PihJZ6+N0x/1bDaQ/uvAyw=
	=
X-Received: from edtg7.prod.google.com ([2002:aa7:c847:0:b0:6b8:98f6:dcc5])
 (user=mmol job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:46d3:b0:6b6:f429:4802
 with SMTP id 4fb4d7f45d1cf-6ba37ea3508mr5728784a12.25.1795427350480; Mon, 23
 Nov 2026 01:49:10 -0800 (PST)
Date: Mon, 23 Nov 2026 09:48:52 +0000
In-Reply-To: <20261109084854.840576-1-fuad.tabba@linux.dev>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261109084854.840576-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261123094852.2435494-1-mmol@google.com>
Subject: Re: [PATCH v2 00/19] KVM: arm64: selftests: Tests for protected VMs
From: Mihai Moldovanu <mmol@google.com>
To: fuad.tabba@linux.dev
Cc: catalin.marinas@arm.com, joey.gouly@arm.com, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org, pbonzini@redhat.com, 
	qperret@google.com, seanjc@google.com, seiden@linux.ibm.com, shuah@kernel.org, 
	suzuki.poulose@arm.com, tabba@google.com, vdonnefort@google.com, 
	will@kernel.org, yuzenghui@huawei.com, Mihai Moldovanu <mmol@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Fuad,

I have tested this series based on v7.4-rc1 in QEMU
with gic-version=3, -cpu max, pauth=off, -smp 4, -m 8G

All pkvm_* selftests pass. I confirmed that the skips you mentioned are
features that pKVM doesn't expose to protected guests.
pkvm_id_regs fails with patch 1 reverted and passes with it applied.
Each patch builds individually (tested with git rebase --exec).

Tested-by: Mihai Moldovanu <mmol@google.com>

Thanks,
Mihai
