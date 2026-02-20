Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3622D6407
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 23:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771631685; cv=none; b=eno20vnuN6i/lcXxPo3ny9nGRXbuG+qVTvyl+9zgYYdA2rYTX+aJh9HAbcomVjErnOQ81zxy0kTxeAWc7zSdeOfvqxVjyTBfaSKRFNWWOjJZnNBHm4sg98tqP1vKBXsRx/+a4WTsMACaKYzGEcnnBCjPAFWKhQMsciaKlz88THA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771631685; c=relaxed/simple;
	bh=KBfwhptpQ6YGSe6wr80gC840zct4lvhIaLxF5hhTceM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=tvxKTJjho/0UYmHjf4I+NGXyDZz6f8RYH+eJo8Kl39z1IZzx1poOVnOucOYC29R1zllsIhrhgPZ3OkOntPio5T751JL02fKCh71tuvMtQRcGy6g3koGP9dDV58PrPPit6E6RoluouCd2RNeQw04iU8N6O/gjwr7koofboE6Gc44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bdj+md96; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bdj+md96"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-354490889b6so11339009a91.3
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 15:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771631683; x=1772236483; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oX6po6OlLhA6TpNB89pe3rdCVjt4izYpIUQkYe/YBf0=;
        b=Bdj+md96HabxPLZZCFczYk6h/BHaFTx5KvsJeBl1bS5uILmZwZMdUNrOo3cLIbrTcS
         df+nhy7TdKGHGwQ6Pa1KuhXMjVt20DN8RfKVzjK3n8O0ZPrjWUdaWNRaUCdanYpzshor
         RKBTjpSdNB6bleD7JJzzXetpSubv+vAA/o08I4m6gbXkkXqhbSWjD8Qq2ne71njmTNZ6
         k445Mh6MEjlIRD/7NIPduNEtJhnY+on0OVro9CvjPYTqXcs92ewk7iwlo5StDeRgrAPr
         FmG5v9i/4pDPfl3j3pn0JT/eUY8EmQFYtnDDPwVeR3h4i06ULR26OPcZQLPog7F/NuJC
         g5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771631683; x=1772236483;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oX6po6OlLhA6TpNB89pe3rdCVjt4izYpIUQkYe/YBf0=;
        b=Q29DwLzEOqkCV0YZ1l4h/Kne51Afk5xjLGeoQWAd+SWz/BTSDGllBACUzP7HA0x5q2
         PDXSI80bGOzOEMMlPHJfEpNwXELI1iJ5PfMiTHcSFkVkl0C7cZ6TbTornw6HILsdiUUp
         bEoNrhHhQg7hPFLvfib0qSRG4981vC4ffkeOIHWA9oOa6CTZZ867U8baem30AcxOTlus
         poG9+6ZlDCYbGgmlwfWbuDf/2UAJkHU9xEQX4jeAY9Adek8anZaw8PkkbJzM0PC5+Nf3
         Md/0fpGSU31w6marSose5LPw5J8VEZcQPyQ7PX496upPRnxIKP2kSqN1MJCD3U1d/ZWZ
         kqcg==
X-Forwarded-Encrypted: i=1; AJvYcCVJyTg47xEt+EajuzJ0oK1j76tZEkWUmujtrA7DdSW+VIPYlIr755bp0Xsj23i0cVE9/2tiDQj3GuZh14iY/EU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yztv1pwl1bBcARB66irOzLWBbaQG876GC5HhIk2BibZTizjqcBF
	u5yzJ1JfdCiUwvhTCsPgw3iEQdBIYdumXNDtXA4ekdFAkqPbTet4Z3ngNRc28BIQP1aHyxZrq7u
	xUYqXJZk5BZwSKFeXkTKLsEpRVg==
X-Received: from pjbbx11.prod.google.com ([2002:a17:90a:f48b:b0:356:2fe0:f5b4])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3147:b0:354:a065:ec3b with SMTP id 98e67ed59e1d1-358ae8d5edbmr1100686a91.27.1771631682655;
 Fri, 20 Feb 2026 15:54:42 -0800 (PST)
Date: Fri, 20 Feb 2026 23:54:34 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.345.g96ddfc5eaa-goog
Message-ID: <cover.1771630983.git.ackerleytng@google.com>
Subject: [PATCH v2 0/2] Test MADV_COLLAPSE on guest_memfd
From: Ackerley Tng <ackerleytng@google.com>
To: kartikey406@gmail.com, seanjc@google.com, pbonzini@redhat.com, 
	shuah@kernel.org, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: vannapurve@google.com, Liam.Howlett@oracle.com, ackerleytng@google.com, 
	akpm@linux-foundation.org, baohua@kernel.org, baolin.wang@linux.alibaba.com, 
	david@kernel.org, dev.jain@arm.com, i@maskray.me, lance.yang@linux.dev, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, lorenzo.stoakes@oracle.com, 
	npache@redhat.com, ryan.roberts@arm.com, shy828301@gmail.com, 
	stable@vger.kernel.org, syzbot+33a04338019ac7e43a44@syzkaller.appspotmail.com, 
	ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"

syzkaller identified that khugepaged, operating on guest_memfd memory,
could cause guest_memfd folios to get collapsed, leading to a WARNing
during fault [1].

Add selftest to guard against similar regressions.

Changes in v2:

+ Found get_trans_hugepagesz(), which I should have used instead of
  adding getpmdsize()
+ Extended tools/testing/selftests/kvm/include/kvm_syscalls.h to add
  kvm_madvise()
+ Removed the magic constant address and explained alignment requirements in
  comments
+ Refactored gmem_test() macro to expose __gmem_test(), which allows custom
  sized guest_memfds for tests. Sean, I didn't add the gmem_test_huge_pmd()
  since I'm guessing a test requiring a pmd_sized guest_memfd would probably be
  once-off.

PATCH v1 [3] was sent in reply to the fix [2].

[1] https://syzkaller.appspot.com/bug?extid=33a04338019ac7e43a44
[2] https://lore.kernel.org/all/20260214001535.435626-1-kartikey406@gmail.com/
[3] https://lore.kernel.org/all/20260217014402.2554832-1-ackerleytng@google.com/

Ackerley Tng (2):
  KVM: selftests: Wrap madvise() to assert success
  KVM: selftests: Test MADV_COLLAPSE on guest_memfd

 .../testing/selftests/kvm/guest_memfd_test.c  | 70 ++++++++++++++++++-
 .../selftests/kvm/include/kvm_syscalls.h      |  1 +
 2 files changed, 68 insertions(+), 3 deletions(-)


base-commit: a95f71ad3e2e224277508e006580c333d0a5fe36
prerequisite-patch-id: e001eecc9215dc0ed28546936f86a5a09e57141e
--
2.53.0.345.g96ddfc5eaa-goog
