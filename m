Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01562594BD
	for <linux-kselftest@vger.kernel.org>; Tue, 19 May 2026 00:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779151392; cv=none; b=TEOxn1aOPYxHjAue3We+cd7RwsDU6o6waTV9qulaWHAMWscB7c9Ny4iUSr9NoOvER1yqULNfYeg/bAb4vKHUVHCyojRlKKrEOpAncg8biVThHDjyTQkriVB8EVhoeZwmFCZQiAc7U3JbFimcLfIriErwPTdu5EzVH/wWPnfcbn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779151392; c=relaxed/simple;
	bh=hRpkoofSCNkgz9QWWxdhKmOg5On0J15eE0yAgzNdzec=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YxDcfSDTUs6yeUsh6/ipgErlq0b0mZ/sBFKZ5imR68qEcN1clDciS0oRmCUde6fJyuqsPUOG0f0xGGSFa0ffrBx8iLYYa0GkEi+iGTaajolc/+ASpSTlCVChHGCIpRgALePiVhzyRTalJ53LBUH5039fmwjJ4QPC+oSjFKQMlg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eNUM5Ju7; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eNUM5Ju7"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-83565161a6eso1376245b3a.1
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 17:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779151390; x=1779756190; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=65ZWZmlMjQXH6rRW2s3lL81WVV8X9kVkZMvPYyumS5g=;
        b=eNUM5Ju7LMnbEA4sPtpS/Csix67zAz/696B43jNtijQlkO/vV1NLVnB0tu/F9249kk
         ipNO8MXuxPEtp8uGx6YvGRCaq2IF5fkmiwk2NlRugnX4P7wyEBDdEHAkQOvNK00gfb6z
         DshJwXTylhxIBK+4ijG4ViEAxyKz8FP9xwEQSz7wbJDyizdxCTEGHuUAimYILlCJLRkC
         HAoIa0PS2hu8UcNcolZQ2jsKefKGcmX/0bAsglmka53zLOOkPaqzdMONoaN+2leO3Rke
         Hq/NeRqjWrCjObOGMIXZ7SI+LfrsNvmo3fI7pCkKeT+awHx/aMx45XywK4aZG3DY7rxt
         Y2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779151390; x=1779756190;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=65ZWZmlMjQXH6rRW2s3lL81WVV8X9kVkZMvPYyumS5g=;
        b=GEXQ0cz7EEPbs97CelxAVFFH75Qj5UuEzyFPXqwwFiClhFoWUnLIDXRM9FndhhKNxf
         /cPRetBqYY1K90pcuLhUpoQZ8pMxqKlmNK1hnyFC46zQgCL22FgTsCAdhO1Emi7qt2mI
         T75qm39KQW2D1y7K4Lbisc4BMCV+MJ12Xsu2ZpqY84WFckw2XP2FI3Bp2En97AGFFrrM
         Y2muuS9TDBQN2YT0rnWdTgUXMyLmW0JyNmEzT4u/XOqnctolIdKkQnMRtTQt0TDldHnk
         pT3qR3KGpESg5RRlR1Xq2WFRqAGKj68AQNAKUPlh5RQOJuOLWt5bW1c7N73Eqd2juXuE
         ksTA==
X-Forwarded-Encrypted: i=1; AFNElJ+O4syzldBdXxY983YlHGbS4duXihb28p9u0dU/GNwfzDUSlj8ps5p3faD3gmt5/apoqsLbRpfr7hrJQ1Jr7nU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeYqa/p8SZKIUEUAbU24sNFSpgvDcLvKUZXWY19IsLQskG6l5n
	PHSSZ+CtzrXl7t/h/NuXEwM8DF6eF9bSeoJTubX6I3GJOODQsaDTR9WUqgf4LqmCvXHxYv51BdN
	UGbju+w==
X-Received: from pfbg7.prod.google.com ([2002:a05:6a00:ae07:b0:837:c09c:9cce])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:27a2:b0:827:33cb:c7a3
 with SMTP id d2e1a72fcca58-83f18d8a106mr14551657b3a.10.1779151389833; Mon, 18
 May 2026 17:43:09 -0700 (PDT)
Date: Mon, 18 May 2026 17:40:54 -0700
In-Reply-To: <20260407144914.2621843-1-mayuresh.chitale@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260407144914.2621843-1-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <177915061790.2225898.7317274073067106040.b4-ty@google.com>
Subject: Re: [PATCH v2] KVM: selftests: memslot_perf_test: make host wait
 timeout configurable
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, 07 Apr 2026 20:19:12 +0530, Mayuresh Chitale wrote:
> When memslot_perf_test is run on the Qemu Risc-V Virt machine,
> sometimes the RW subtest fails due to sigalarm, indicating that the
> guest sync did not finish within the expected duration of 10 seconds.
> Since the current timeout value is itself a bump up from the original
> 2s, making the host timeout value configurable via a new command line
> parameter. The test can be invoked with '-t' option to set a suitable
> timeout value for the host.
> 
> [...]

Applied to kvm-x86 selftests, thanks!

[1/1] KVM: selftests: memslot_perf_test: make host wait timeout configurable
      https://github.com/kvm-x86/linux/commit/41d37c42e0c6

--
https://github.com/kvm-x86/linux/tree/next
