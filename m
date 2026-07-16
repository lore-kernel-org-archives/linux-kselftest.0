Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674E4400964
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 13:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784209794; cv=none; b=kD2jPki4aEduoUpdK+tkhw61J250o4EMb6vvbqfyOzXaGAjXKYSp5xRhrjBcNaMcsUVPdUbhxcWejfwCc5hQBhADpua3FxnRLxMlOd2U/TJFEnrVjMdXcoB4rmKIdDYshWc8vbw7uRr/5BOf1pE28LPHKfcKmi8kIg9SCMbJFjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784209794; c=relaxed/simple;
	bh=vScYG2QJnyI+tkgxpycMRmSCEQ8DczUpqBlvkLv6eJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lzSBp6+BdPDR5/fDWHFczKN6IsrH+F6QmKhfEI2DzyEeddhwCJ3hh+1K1A8jl5JlkZJVHYMCo9oOCN03rdyJO3dMk5IBgc/FE/LN8RkgL5BrGgsT/2NtJIAFlDzgf+XBCpvSVzaTMzBnqGTyf3eFSEqkOTTgWvA3mU40CZh0Q/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPfl7OH6; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPfl7OH6"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-383adaa461fso2393369a91.3
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Jul 2026 06:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784209788; x=1784814588; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vScYG2QJnyI+tkgxpycMRmSCEQ8DczUpqBlvkLv6eJ0=;
        b=NPfl7OH6X1N6hIWeoP7RtQ5ojCBnKu2yn5bJMyVSFIUO7EVBJQNoGxVRkT3T7VHMJH
         3KHPTuMEbvxdMDoFHU4EguZqUEMWJf0mrsh3ZRO85Fep4uVafwD6sUrd9mmnLn0iJOfL
         J/SY8h0ZUeu+aaHBANGltSbz7gZFPj6KLkd0FzNKWH7IVaCdBO8Sv2f+U1f8FTzxNooH
         ctDFWu0PnPL8Q2BqnK2RCyxpHsy/EQoZD6KVrRChvOnLJlmRsqRRHCVeGV0oe9bGde9J
         PZ+z6fTuqq7tZfVswXxalADcbtL8XvHAKUnR9K6nnGYQTmGr9xiWALfSIemXx2qnZ/Dm
         a4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784209788; x=1784814588;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vScYG2QJnyI+tkgxpycMRmSCEQ8DczUpqBlvkLv6eJ0=;
        b=kK1/PfZCj/HaGmpK7Z4sVZJfse0gVfpy1BExzi0UXTeiGAyTe4qiqqAOYb/aZr3obg
         vnSX4qbMvwoPFzaaSCiQMAR3BowxDPoScSFG+YKI/gK5l9FYC6aljvNgYrd9ZUXDNpT6
         syw7TygCmysuITNZe0zUDjSBTGU7tew4tVu35d0daM5tldwyXN6o5Ir4qy2eTXRMLr0M
         pPV95yqMtEdXViaqnj7zJOh9iqaSp6VYJZEg2M9rTTfVLiFSfwdoaLccGlusLdUUZlJW
         ADLs39vWpXUQtXcWm81qMXkmr/E/uEJAJcSA0GOKHRB3kJXoVoZ79iJNPcqoAg+UbZtE
         sc6w==
X-Forwarded-Encrypted: i=1; AHgh+RqVnnWogl+p2C7MOJWLjWsiSXMwQkUxAM0hEGaLllbLKZQy5xgsOoZ8ioA9qTS0TqAJPGGOA7RdkUPPPStRk4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPeNb529jX7bT8qrNvjfXZyVBqueWPfRo4b03Df/BPz2XMRO7n
	tYOJASHtdb9p5/AUT00mM/cqhoNTtKuhMKgg7mRh9pI3dlZdzmohMPmCix8z6gOC
X-Gm-Gg: AfdE7cmnBodj3ck4jnjT+TFleH+vlwbrN+ZkYjgleXj2zpy/4oDGv1SvUYFkv3QTFh0
	RNqP1JXpj5+4G9rbKIrazjTJ82knbcOGI2YkqKTWyhfnc/uNEcGjozmoQ9xC4S8gGBYR4sHvoEv
	EFJ9gcw9XVcvSvx5gvVWO/cyQQt6v+RZs9X3yrn8jw0tCztdkfdc9pbkw/ecT41JnSx2HWzYY6A
	VIjyGG7HJcl5R1jFtHmcAJhuraXczkGsyKF9+msAhIjFXK0b32Qq8/dIl6lDvQ/uXZ1j3bN1iPn
	rY5jtPdyR3RgnlySZ1Zbh49O0N+YFAhXNcu7ktEFpZ3PALBgLmG85FaCCCHt+E7Qbcy/ykrc48g
	WRa1q7xdwrecXNaCP4KREMvEvS7V508kuU57k8MPp5+ZaPlYrJ3PvKVa2g6L67vw9Pq7IwQK7Xi
	mvzsVEX4nYHao4KIvYBY6tO9kQ5ICFdt1gAQD+U44KBwzkzHDz95k=
X-Received: by 2002:a17:90b:5744:b0:37f:9cdf:f03c with SMTP id 98e67ed59e1d1-38dc7b8dd32mr18772730a91.31.1784209787718;
        Thu, 16 Jul 2026 06:49:47 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:90:2db1:9c31:f107:8086:4204])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6a5174sm12776550eec.15.2026.07.16.06.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 06:49:46 -0700 (PDT)
Sender: Deepak Rao Gaikwad <deepaksraog@gmail.com>
From: deepakroag <gaikwad.dcg@gmail.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] feat: scale vmpressure window with machine size
Date: Thu, 16 Jul 2026 19:19:38 +0530
Message-ID: <20260716134938.42495-1-gaikwad.dcg@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aljYxLusTzZkTfnH@lucifer>
References: <aljYxLusTzZkTfnH@lucifer>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Lorenzo,

Thank you for the review. I withdraw the entire [PATCH v2 0/3] series.

You are right that the vmpressure change closely follows Benjamin Lee
McQueen's earlier rejected thread without proper attribution or an RFC.
That was a serious mistake on my part, and I am sorry for the confusion
and for wasting your time.

I will not resubmit the vmpressure or vrealloc changes. I also
understand that bundling unrelated mm, selftest, and vmalloc work in one
series, using non-kernel subject prefixes, and sending v2 without a
proper v1 review cycle were process errors on my side.

Going forward I will stick to small, original fixes, search lore before
proposing mm changes, and follow the normal RFC/review process for
anything touching vmpressure or vmalloc.

Thank you,
Deepak Rao Gaikwad
