Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ECA3C73F6
	for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 11:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774870914; cv=none; b=HRIzsH7zck60j9VEt7/Wa2PFAgkCFvM0T2ikO06zlUUUfrmOYc8y96+2eFvY9gPQqQO5YIXEwAw6aue23J4cSjFA1aBC3sb57YJsG1fja1/kfZd0NVbIGbZUufTeea++5Gd01Ndy2p+CAiaB8ql7hWiKjy1H3KNGI1AkGP0r/f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774870914; c=relaxed/simple;
	bh=jy4JXObkxn6zs5G9yFF18bF4JPw9+ojVLYoPuhxyOMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HfGKTAdqqBcM0RxnIKrNlrAfhy4KUNk3PMZuwafxTgDXPdt7ywSSrT/z1a2EVHGa94yq9jDgBiH5zSI6OeFsgWiTRQ4uZAllSlrJDkT5mO37KA1LM7DLB1SPLgot39dByu5s25OXIq9cgJKqVWw1kbVsNphhDIp4ywkEVQhS2jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QriGvYrj; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QriGvYrj"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-126ea4b77adso5956530c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 04:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774870913; x=1775475713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8qbAM+0abt2Xsw25EiZl6rgD9G86cRKj274QNi4sMI=;
        b=QriGvYrjwcEeiOdDxdSPz/bkSiWT6RprRk+aTdrU2IXcqAPLIIhrTbv20Y+e0dhseY
         Q6r8j/TvYKLQIj64d40XvKCLikE65OUcr9lsDIbDBfzevvQmrfICTTrl1AkZ0mT3MwBy
         kk+8EQSmsb3TvDt3+bRl5Z3n+oLHVlWlkceSFdx8sDA8tbA97aPNzOE85nMfrkfdTOga
         wEGna2Z2tclWxx/xa3UKtYNaAOV0gEWT8seRD8DkFFIwERMaDsSr6X/YmTiL4xvZSWQs
         skweBd8wYRqUIIju2jZDYepRhI90NFLR+VFsZn4fEMP9zXAweOksr0VKRhoJN49x28b6
         0DFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774870913; x=1775475713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O8qbAM+0abt2Xsw25EiZl6rgD9G86cRKj274QNi4sMI=;
        b=hBrOLVs9ik1Sq6uABcri0iF3dx7Y3EU1v5CzfmVlwMC7X7Qj/70mwF6wfJ0oJ+2Cw/
         kgudhPJawc5yh3P6YGJ1CDWSO/k5sEMezEESqbqvLHO+JT31qIjetf6gCm7dFN6mNT7V
         WUA7jDPGrakdfhT/Mx4Zp+rLpFw2HOYKOgjGyZvboEEnLpCGcGbN4ekKgOp0lOP74/Cd
         v5ELtomQCpHbkghRr2T5i6d8YPkH5tx1q1oDsox4sIgLFxxQb6HH5R3jNGfmQz1YoNdM
         b2lE202FCTA+AwdkCa1nSEyWYfMvf1clfdt8eUleCoeYL/3c8NlkrKQNgikbw0N/EEIr
         CH2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXsvNBf0wi0uAtjSLYQ1LGnDoTxLvgM+FbpoAFEaBnAxiT/vSZB7TPmFSTw0msgk5kahz8fXqRcgXidmSnv3Iw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV+0+MnLxO8iaJtOug8JqK3/fENxk1Jsh6T/wYtaOSJ8mm7ehB
	Dfd5AUajDrimhIS1IsWKPY2ebB3YtWKHkYa+q7RUoGIupzjD8AB0pcHO
X-Gm-Gg: ATEYQzw89+iLLwPmL2tmalXlcOlGIDGtZ4OSj0oUWabQLO8TTMR+dxSFm3/SrvosifO
	ylCN1ctGjuGwjnfGll6Ry0rdXJ3T7ITtRmWMF+ln1Aa/utJuzBMU9pHIDduuNEUy2nZfexZ2TuH
	zAtt/dC2PkuG+mXipY8Zj6S0KwQvKDcHRiIHmwQdrVqXu/bSGuyBaAW1/PFyuxXjkTUyBSWLksU
	YdJR75xza6aW8bjVZLcORRIbaMlVmK4TrzMw6otbgA8RpyRP8Uiww5KXCjtopHHf/3434QSc/No
	GsJuG5CXFeHAlmxK3Oftg/2KOoWHW9jnDL16RkvAXYIpx7+z36k1p16cZGCFWrs75lXoyp6x486
	a7dCCgNJasgu811vsPll/TnDh4g4SeFpt1n1EZSZpWitSX9NgNl0JoqDm/rUUwVmCBcpV89DscZ
	+JEkLbtCTlsj3QL1+WO1n/NmNRLMOdVQ59NvQ=
X-Received: by 2002:a05:7022:4393:b0:128:d396:f2e2 with SMTP id a92af1059eb24-12ab2857b2emr5938952c88.8.1774870912754;
        Mon, 30 Mar 2026 04:41:52 -0700 (PDT)
Received: from localhost.localdomain ([74.48.213.230])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab97cad88sm7602987c88.1.2026.03.30.04.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:41:51 -0700 (PDT)
From: Qiliang Yuan <realwujing@gmail.com>
To: tj@kernel.org
Cc: longman@redhat.com,
	cgroups@vger.kernel.org,
	akpm@linux-foundation.org,
	anna-maria@linutronix.de,
	boqun.feng@gmail.com,
	bsegall@google.com,
	dietmar.eggemann@arm.com,
	frederic@kernel.org,
	hannes@cmpxchg.org,
	jackmanb@google.com,
	jiangshanlai@gmail.com,
	joelagnelf@nvidia.com,
	josh@joshtriplett.org,
	juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	mathieu.desnoyers@efficios.com,
	mgorman@suse.de,
	mhocko@suse.com,
	mingo@kernel.org,
	mingo@redhat.com,
	neeraj.upadhyay@kernel.org,
	paulmck@kernel.org,
	peterz@infradead.org,
	qiang.zhang@linux.dev,
	rcu@vger.kernel.org,
	realwujing@gmail.com,
	rostedt@goodmis.org,
	shuah@kernel.org,
	surenb@google.com,
	tglx@kernel.org,
	urezki@gmail.com,
	vbabka@suse.cz,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	ziy@nvidia.com
Subject: Re: [PATCH 00/15] Implementation of Dynamic Housekeeping & Enhanced Isolation (DHEI)
Date: Mon, 30 Mar 2026 19:41:21 +0800
Message-ID: <20260330114121.101232-1-realwujing@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <acQHKwGhYrpoOH1P@slm.duckdns.org>
References: <acQHKwGhYrpoOH1P@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Tejun,

On Wed, Mar 25, 2026 at 04:02:44PM +0100, Tejun Heo wrote:
> This needs to be coordinated with the existing cpuset and isolation
> infrastructures.

Thank you for pointing this out. I agree that coordination is key to avoid 
fragmentation of the isolation logic in the kernel.

In V13, I will focus on integrating this "Dynamic Housekeeping" logic 
directly with the cpuset subsystem. The idea is to allow the root cpuset 
to act as the orchestrator for both task isolation (which it already handles) 
and kernel overhead isolation (which DHEI enables).

> Also, Waiman Long should definitely be in the CC list for this.

Acknowledge. I will make sure to CC Waiman and the cgroups mailing list 
in the next iteration.
