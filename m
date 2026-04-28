Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E3238F230
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 23:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777419212; cv=none; b=jphElf6W//Mg6Vj6qyO3BZXD9Yy7O80hqqVcTR1bgb32JAw2M2o1kCydmkvuiUFh/+2Es3ym84qRpoBTvhDDYzEBVccwYXHITCuicVPjrDa5S3qYF5jLNNTc8e0uSKfH+UgMDVl1T79/kqISZX306a+heN94qtbAdwn4t38WZVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777419212; c=relaxed/simple;
	bh=u5jNgX3aBCZeke7gIDGCVPb6JkDwECjFRBtYrME8E6o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YrI5V+uroFY+y0pD7y+8hciFShaOgoqI1C/1erIWxdk7IwQsOVp91KfihuUsMD19VVACL1flFHeV3n/R+7oVzOz4Vg7cu6Kr+ntU3ygioUf0bi6XWfUAgBzlNrEkXITnW7qn73zkDpxVtaQBfPyYEO6LB1PIfUOhjYS36p4RBgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f0EbKtvI; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f0EbKtvI"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2adef9d486bso109131235ad.2
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 16:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777419210; x=1778024010; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JywkponAAlLbpKs0ZR4pdZDQ9JhpG3xml6Pp+KH2bc4=;
        b=f0EbKtvIggskKvEMJ2/jHZ0vIccIW2mkd6vuGeStLeJ+1zsQHufB7qstKnjKkV0+xw
         +OLMAg6bbn5xX8BMUT+Mg7hU1nvjc6O2MpJB54SjYdh0C/3R1lw0mXmHlX7jitRgSgWS
         8xtI/Y+1ur0Sb3092x3a9IOlDAIOPaG5tUCYgFvisghsDsnXpvwGi/qw5DkT6I/DGY4A
         evvwqdgrYydCD6ZIrSQ9g12pDDURzQxVZ+wRmMIXWQ/4DwWCjlinIDMaSlodaYHKPRup
         UMF+A8Gb3U+KsjpU728uXkRu6wwwEPkNLB6/tBoejX1667brP0vFTctX5JQCszw1zxM8
         Lg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777419210; x=1778024010;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JywkponAAlLbpKs0ZR4pdZDQ9JhpG3xml6Pp+KH2bc4=;
        b=m2cq4JcpS7ImefA0bQAek/0wyws6gXvVXtvGuDiPKh7BLwUzROMkEvBNQMZ7EjkTIc
         mFtM2szEzhpAZHFOPdTgn09cKgXfMyIbSZA9/HHcxZsh0gNtirmyWEexZQip1m+4c5zf
         GuNaHDL32XFpG3KMYCSut8itf4D3dj4SwTY7sOqyW83I/+HQ0KXPC54/dLMyKfWevt7W
         zDudVwLAWd0lAd+zafyaYLjc2fP+Gdde/EO+aN0UiGAZa7cRE/GRmmtjkiAKTZisJY8W
         wM0SMmuv7/AchQCndbjfmP8zO8j+uLIjKvF8x5OIaE9w+X6cjvsjx7Yo7YDI0g0W2b/h
         yx9A==
X-Forwarded-Encrypted: i=1; AFNElJ+Iqj3t13wdw+IwsaHYrQepxwuPrHSE0WGrFp9/+gGCNdG2Xx7Uju2pJYrmjKuwovtSguU2eJjcpPuXUCisJtg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ4NKnedQw1xAsHIlrt5xjTU8KGEgkcE6hd/UAXx7ZanUJjaXT
	bOJCt5xjbDbfpi3dTKXapj//dZjNostMIf0w4Jp14LR5RMSwuNKj9dSraVr9ooygQe9wFEH9meI
	LkwsNjUhBOpJhbfSvc291khk8kg==
X-Received: from pgbcr2.prod.google.com ([2002:a05:6a02:4102:b0:c76:1d9:8c20])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:6a20:b0:398:8546:c3fc with SMTP id adf61e73a8af0-3a39bffeb82mr6084413637.7.1777419209934;
 Tue, 28 Apr 2026 16:33:29 -0700 (PDT)
Date: Tue, 28 Apr 2026 16:33:20 -0700
In-Reply-To: <20260428-gmem-inplace-conversion-v5-0-d8608ccfca22@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260428-gmem-inplace-conversion-v5-0-d8608ccfca22@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <cover.1777418884.git.ackerleytng@google.com>
Subject: [POC PATCH 0/6] guest_memfd in-place conversion selftests for SNP
From: Ackerley Tng <ackerleytng@google.com>
To: devnull+ackerleytng.google.com@kernel.org
Cc: ackerleytng@google.com, aik@amd.com, akpm@linux-foundation.org, 
	andrew.jones@linux.dev, aneesh.kumar@kernel.org, axelrasmussen@google.com, 
	baohua@kernel.org, bhe@redhat.com, binbin.wu@linux.intel.com, bp@alien8.de, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, chrisl@kernel.org, 
	corbet@lwn.net, dave.hansen@linux.intel.com, david@kernel.org, 
	forkloop@google.com, hpa@zytor.com, ira.weiny@intel.com, jgg@ziepe.ca, 
	jmattson@google.com, jthoughton@google.com, kas@kernel.org, 
	kasong@tencent.com, kvm@vger.kernel.org, linux-coco@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com, 
	mhiramat@kernel.org, michael.roth@amd.com, mingo@redhat.com, 
	nphamcs@gmail.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	pbonzini@redhat.com, pratyush@kernel.org, qi.zheng@linux.dev, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, seanjc@google.com, shakeel.butt@linux.dev, 
	shikemeng@huaweicloud.com, shivankg@amd.com, shuah@kernel.org, 
	skhan@linuxfoundation.org, steven.price@arm.com, suzuki.poulose@arm.com, 
	tabba@google.com, tglx@kernel.org, vannapurve@google.com, vbabka@kernel.org, 
	weixugc@google.com, willy@infradead.org, wyihan@google.com, x86@kernel.org, 
	yan.y.zhao@intel.com, youngjun.park@lge.com, yuanchu@google.com
Content-Type: text/plain; charset="UTF-8"

With these POC patches, I was able to test the set memory
attributes/conversion ioctls with SNP.

The content policies work, and PRESERVE can be used before the SNP VM
is finalized. SNP_LAUNCH_UPDATE can accept 0 for source address and
the SNP VM runs fine. :)

Ackerley Tng (6):
  KVM: selftests: Initialize guest_memfd with INIT_SHARED
  KVM: selftests: Use guest_memfd memory contents in-place for SNP
    launch update
  KVM: selftests: Make guest_code_xsave more friendly
  KVM: selftests: Allow specifying CoCo-privateness while mapping a page
  KVM: selftests: Test conversions for SNP
  KVM: selftests: Test content modes ZERO and PRESERVE for SNP

 .../selftests/kvm/include/x86/processor.h     |   2 +
 tools/testing/selftests/kvm/lib/kvm_util.c    |  12 +-
 .../testing/selftests/kvm/lib/x86/processor.c |  13 +-
 tools/testing/selftests/kvm/lib/x86/sev.c     |   9 +-
 .../selftests/kvm/x86/sev_smoke_test.c        | 255 +++++++++++++++++-
 5 files changed, 271 insertions(+), 20 deletions(-)

--
2.54.0.545.g6539524ca2-goog
