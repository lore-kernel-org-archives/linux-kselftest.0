Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833440;
	b=5YHN6oS9be12TaN+v8722q7huKEm7dcIxqwQXp6D6O3LMAfJGQuwO/CkfLcoHYN/+PBH
	 bgH7Fgm/Xh25Z+LudpNScEP1b6SrrXsIKqBEl4wVw3BsvHhcyl05paaku5DewYPqd50U9
	 LyXIiN60Fz7GeQe8m1hWVUJoEP80xeqovw5OhDm8BLwdu6LUNxC42BhJk4gRw1m5uUlm5
	 JcF2K2sSbsofkW4ilJ2l4wsyJWmtJksCDWw7uq7GEnQToDDv46Zb29bKMCpNmU+wMnfBD
	 V4b4rr9zjXwiAIjXiNWRkSj5FE6kxWdZxP/Zc16e6qvZrgsPvhJbZN3PlCaFketIHcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=2wbReRTlQJBCUXaK1+7DHFjdOGAtQHERTJ//FRhbpjw=;
	b=Fh3HOjx26Ixo4Ijhe9FtfARAYgeXkTzqOJRSXsc7vwxR8jLsLPENZs6XnfenatzV9Nc6
	 efzabVyygzymT6SR99guSUsl7JoUHJSiuxedkuY4xlIcaHICMO6W5bBI2g30B2K8gkgZp
	 cDpz90U071eJwe9bwyfpM3vhzljNiialslPcLsQcsUgtRLFD2SsM1nW8zMZRQzMIkTdLY
	 3dpCXD1Ph5dLV/MNTSZ/sJ1j1dIKZ65qDPbXoeyfD22lSLm5PHy0flJ3H5RX8k/+nk5Eg
	 sCjGg8xxcixDy7y7v10z/8XQYjdUWT5cWtVb0i+ElKQ9mXEiNjTudPBXA6hyefUxpDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cfcSO+zW;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E35606D811
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 23:03:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1E35606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cfcSO+zW
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd5ca3840c5so1461062a12.2
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 15:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793833439; x=1794438239; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2wbReRTlQJBCUXaK1+7DHFjdOGAtQHERTJ//FRhbpjw=;
        b=cfcSO+zWhNbJhxmkGimeY3PEwRA9X69/Tgx0y7TqHxcHiVraVBh2fd265reUdqWrdv
         gHt1i1xZ7JdHt0OM8GlDeMdrTf9U3qCEy6OJ8WVX0N2nxVIzMttSryWt3QW1Q3K/32AQ
         HU/w5lNCWTBN2QHWVKnYglIMlxD77Xw8vQ65DCdlsVh2h1NclOWFNlco15jgnuKFgWc9
         EMILZ2xQVI+CIhBdy7DRuDx4XfTPz2XXqsLUXrkHPXPsSCgqEq4iOfkdq6DKjq22dt5H
         CKpDArEDLejZ/7xG/VAdmjtRKfIZb4aPuREyhvDecCNIAB7Ub+BDW2jj9aL9jQHdO/id
         CTbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833439; x=1794438239;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2wbReRTlQJBCUXaK1+7DHFjdOGAtQHERTJ//FRhbpjw=;
        b=K/a3RwtmeJOxRMyGkbFuwOvLXI3FFErrlHXhDzzIC5EDbXdlbkVDfyHk79MCXBPpWX
         ESd4SeImYMaefIBfmmZNUPde+BjaC08a//7zFEKh0L8VZq3DqMPfh5Wc9L22VSYUKG4E
         +BidgpIZwGe8H/Ew3k3q5IFjcwo4H8HtSbx/jAl20oaLyEBkxxS4E5K9VzRs9Bxh+q8g
         y4b8M2DmF4FAESXK/T2XylapdEmY38uCEfodB6lK1YCP97hAKYNvIEd2rKlTSgceQbUT
         TjWowRe2M0Dxqk6eUo4/vKbSdbZkhDRHM32m7CPgiPdqxBnK3AXRDMagx7kTdJuRGqUI
         mdkg==
X-Forwarded-Encrypted: i=1; AKwUvBxv2pbZMYFPR1kT40ddK8bXCNPWqA+pXaLLvPRqCwOU5fZTB2XBOk2SrKr6Ud6boalH2Pgpp9YoUFyyrlPEJYU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fZRY0rb11fWkzkCvv0GjddtIgkdjW8HumnYHMmEwJmdVaDHIX
	7r2x+NQWoJsGHicTiYMJfbT7A1bWwKfdfImF4uawL/8RH0atEMyX0mb1Ny8QVeEKVpFDceWh8pT
	0WlapVQ==
X-Received: from plgu4.prod.google.com ([2002:a17:902:e804:b0:2eb:3675:626c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d986:b0:2e4:b112:14d
 with SMTP id d9443c01a7336-2eb3651ef90mr147849885ad.54.1793833438788; Wed, 04
 Nov 2026 15:03:58 -0800 (PST)
Date: Wed, 4 Nov 2026 15:03:58 -0800
In-Reply-To: <20261103130131.4069212-4-sashal@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261014200152.1365147-1-sashal@kernel.org> <20261103130131.4069212-4-sashal@kernel.org>
Message-ID: <auu53k3ODfuMD_nz@google.com>
Subject: Re: [PATCH] KVM: selftests: Provide empty installation rules on
 unsupported ARCHs
From: Sean Christopherson <seanjc@google.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Nov 03, 2026, Sasha Levin wrote:
> Ping, this still applies on 7.4-rc1. On architectures the KVM
> selftests don't support, like 32-bit arm in KernelCI, installing the
> selftests still stops at the kvm suite with "No rule to make target
> 'install'".

This is on my to-grab list, I'll make sure it gets into 7.4.
