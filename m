Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794271849;
	b=XHoCHfAgR6x7DsKartoRZ5DITK00tgxWbGRb2/P6BfNovl/CP9D8cQajf2x9RpH6D6Jz
	 adEmifu11WUV1xhQ8eDmvlQtj/jUCTpZXDfLO4Wm8zi+YF2a88lEAw2/P6izLK8Bg34Vn
	 Z/xWXKGxFZszWYeh6CvwDHB2QCy9UO+dfyco4jJtXWj/pAtaRiPZdzrRjy/CjCh31tbau
	 oZvCHMiGAqNdJw292jexCDwYh8ohJamOWxVrODP9vskYoG/7ZHfdErMNPgplgSLNpB1vO
	 ZLGMgTlcVppTTnWmsH6YJ7IacIANiqBmaEYLeOeUS/rKFpNn1QGo0W4AwxyPjkLp4hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794271849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=9aUmjjXy2UpFvwIaZx+Kc6emVkBoaRCWFUjyBYUuXe4=;
	b=o3DEJ1XdB/2b4lCo7v+ctgMoc+Z8XEjhtPtXhTntM8hQGfYFuhNpkjPgwuEvwyFt3mRd
	 j2JKPNeRjFWCjO00CU6Ja78MNqqt/3zr2SUgx5M86kTnPV6MyBj9c4tLkthzorR/0qo+k
	 ShbNKC2YopEcd78HkstAtvk/1cRGHspG3/o26/FNUVYsHCfBLunz8QTBCP5yt5t1dyC1P
	 QI/B3rViQozc6+P8WtpPvYk7XQgl4C9FvrZBve0lmrlQbHMu1tg4Xg9bMLctF5Hztt9zE
	 dGk8EXzApvPgCie3qv4JOc4aATG2ZC/QQe4pjQXLm3VfaVRYhktfcAQQ+9s+XyFfQnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Rxqy6ixe;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0310606A325
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 00:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0310606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Rxqy6ixe
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0a9de9c2aso1098338a91.2
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 16:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794271848; x=1794876648; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9aUmjjXy2UpFvwIaZx+Kc6emVkBoaRCWFUjyBYUuXe4=;
        b=Rxqy6ixetikDYH4GXTU6DVlNgIzULph56hr/ylPgKBEq0LAlCxBeqtn3zqJLm8xcn9
         /8L8gEpu0FFua1AhJKLHLRbGekFetzUJMpAhLvBkyd6Io4I8yVRJ1QPbOdpOumJxKtNh
         oMHHHRmbLW+xy9nfrbL3O/Y/GIENxUCBo+qprlcK5nHvk8Mf74MAkBQAagwOLqXMK0gK
         01XQLwADmqO9ZRtOrPv4jag12vYH76y4TtBVV6TFN0ri4rMmBiFegEp+AZT1vNUQOljj
         UCk05FbvXMpWSKjhnKf5Yt/0k1VwOGa3C7NyCBNMU6nsHzQkxBdxpMV8/sXi1UpwGU7s
         PIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794271848; x=1794876648;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9aUmjjXy2UpFvwIaZx+Kc6emVkBoaRCWFUjyBYUuXe4=;
        b=15DKgNJyQ9U64hqgAWWZRNSYXd/vr/KaYUgxiHxKzrK4OGd1IyKyB3mX+1JkFW4UJp
         SBEfCeIJTgghtRPAIfnnKGAPjNnBc9K8XhIR+VmM0wGLXwmVbHpmDS+v1veYoDn5dqpF
         8gImzCkjZC7zcNNqT3I6dG41WRVIaMwzI8LQ//YopoJxK6eIdwUXi+N32Vb1Hr/1KRmw
         9y1hvSfmelLKr4nOdJ5J/LN/dbs3Q/eqh26hLi5nSqoiFUxBrvVEM8csp91flGaCvxFQ
         d/0cnQbHCegWLOIBiYYwuKS8gmO01RfrYnkE8wQPKg741XoQNfFzMXVUEHx/TdLk2Dhs
         W8RA==
X-Forwarded-Encrypted: i=1; AL+hErGBIgpwn3jd2mhLijyacaoeQ7f0zSgq02vLUdmeelyecjXP7IomUwZ14Ql0OjH5HFMiKmI4QlJj1j/XpnghijM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oxbyCu1n6zeq326mBN34Sd1W69db5wpm0sm2AdzyUlrs4PWQv
	Cp1cvey6uxG7OvhpZS+yEZMGoXRE2WXyyp6x1BWqWqIOumxLblRLqyEv8+eN7//TMyPd+qZUSEZ
	ORX4oog==
X-Received: from pjdq9.prod.google.com ([2002:a17:90a:2e09:b0:3ad:32d0:ca0a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a48:b0:3ae:898e:a123
 with SMTP id 98e67ed59e1d1-3b166cd70c0mr1265220a91.14.1794271848067; Mon, 09
 Nov 2026 16:50:48 -0800 (PST)
Date: Mon, 9 Nov 2026 16:50:47 -0800
In-Reply-To: <CA+EHjTzaJx2nV_9YEExgYn7STSP1Kvhsqan8va8M7ba4WtCiqQ@mail.gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20260922071945.693714-1-fuad.tabba@linux.dev> <20261007074037.316564-1-fuad.tabba@linux.dev>
 <CA+EHjTzaJx2nV_9YEExgYn7STSP1Kvhsqan8va8M7ba4WtCiqQ@mail.gmail.com>
Message-ID: <avJqZzKX1ZVAMGr-@seanjc-mac.roam.internal>
Subject: Re: [PATCH v2 0/2] KVM: selftests: Fix incremental build dependencies
From: Sean Christopherson <seanjc@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	"Michal =?utf-8?Q?Koutn=C3=BD?=" <mkoutny@suse.com>, James Houghton <jthoughton@google.com>, Will Deacon <will@kernel.org>, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, cgroups@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Nov 09, 2026, Fuad Tabba wrote:
> Hi Sean, Paolo,
> 
> Another gentle ping on this series. Is there anything else you'd like
> to see before it goes in?

I'll grab the KVM change, but I would prefer the cgroup change go through the
cgroup tree, even though Michal already acked it. AFAICT there are no dependencies,
and it really has nothing to do with KVM.
