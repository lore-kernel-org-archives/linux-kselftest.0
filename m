Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C2F21FF2A
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 13:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771939288; cv=none; b=gFISsu+0D9mw2reoEwBrvg2Wq2lnftVOzzs+1O7iLuNO6YyevOJp53zDH26Q6MTLIg/X3rKqFY9y0fiXhTtjvHJGs+0fhvnOH7qwlNOQIBi+tWQbSJA+TGLifzCLTaPBEymb00u21a9fGhSThnuJ+iHwvKt8uVQhHRO1Lmv0IZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771939288; c=relaxed/simple;
	bh=rZrB3YzmXgRlShnWMhW2ZyLjV1gOyCpqIMcq7EbxZRg=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qfHseJkJVaQDQxVO+sujN6L6EyBqKIL6tJ9GTfabcP2XqUUAwsdn1/QsYE+1BwvaTgBueLfqPs1Kcpcp/80kQj/si13HNNE99M5Q6rMOhdr2y6t7TunpqjV5xm8me527hTIMNeUrKCLR7g4Pu9ttMDKJHi5pR+Xs9hUmx/yjRgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=blwgopTT; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="blwgopTT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1771939285; x=1772198485;
	bh=xDhpaxOLFGG7DNHKvY0+tTAuCqm+nHQA10/X+HHagfQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=blwgopTTtTEg8ABV0gQ1EjIwcPdTv4bvIQEqf59hKT4a8IG+ObTU0pDpCUzE4DiN9
	 xQ3laK4L5QVus8tpkTem0RjYhAQz9ZQHxJyJj2SZomtbgxO0kY5DBzBZ4W7EC5/Lfm
	 kVg7wPvoG+vTl+Q9j0x11kCWkIcp/htA2IerBhS8PMaZ4WQXZpaiCq0ZikRf4qluBY
	 lZu1b3QpfCHEl62cOT/jVbfituq9RUmIfhL5J+07BpiE3IGw2QCNvuFmfoC8XAw3P2
	 y3fgtpZKvIOYbf/bf2erTuXosUhSYG9F22giSfxhWs5cZwxkiQq7DTj2W+rhIzFydW
	 agWiG9eGy28yw==
Date: Tue, 24 Feb 2026 13:21:18 +0000
To: maciej.wieczor-retman@intel.com, xin@zytor.com, bp@alien8.de, ryan.roberts@arm.com, dave.hansen@linux.intel.com, oleg@redhat.com, riel@surriel.com, jgross@suse.com, peterz@infradead.org, mingo@redhat.com, tglx@kernel.org, baohua@kernel.org, ubizjak@gmail.com, brgerst@gmail.com, hpa@zytor.com, will@kernel.org, houwenlong.hwl@antgroup.com, shuah@kernel.org, luto@kernel.org, seanjc@google.com, akpm@linux-foundation.org
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: linux-kselftest@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, m.wieczorretman@pm.me
Subject: [PATCH v2 0/4] x86: Simplifying LAM
Message-ID: <cover.1771938156.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 70dd38cd595a8970bedff92c7e45265ae2be8eff
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

After ChkTag [1] announcement, it's worth preparing a stable x86 linear
address masking (lam) user interface. One important aspect of lam is the
tag width, and aligning it with other industry solutions can provide a
more popular, generalized interface that other technologies could
utilize.

ChkTag will use 4-bit tags and since that's the direction other memory
tagging implementations seem to be taking too (for example Arm's MTE)
it's reasonable to converge lam in linux to the same specification. Even
though x86's LAM supports 6-bit tags it is beneficial to default lam to
4 bits as ChkTag will likely be the main user of the interface and such
connection should simplify things in the future.

6-bit tags should still be available as a debug feature and possible to
enable through debugfs. Tag width can be system wide whether it's the
default 4 bits or debug 6 bits and when a process requests a specific tag
width it should get the max amount enabled globally.

Series also cleans up some comments referencing LAM_U48 which was not
implemented in the kernel and the comments shouldn't imply it can be
enabled.

Patches are based on v7.01-rc1

Changelog v2:
- Extend a char buffer in debugfs read callback to fit the format
  string.

[1] https://community.intel.com/t5/Blogs/Tech-Innovation/open-intel/ChkTag-=
x86-Memory-Safety/post/1721490

Maciej Wieczor-Retman (4):
  x86/process: Shorten the default LAM tag width
  x86/process: Add a debug interface to change LAM tag width
  x86/mm: Cleanup comments where LAM_U48 is mentioned
  selftests/lam: Add test cases for different LAM tag widths

 arch/x86/include/asm/mmu.h         |  2 +-
 arch/x86/include/asm/mmu_context.h |  3 ++
 arch/x86/include/asm/tlbflush.h    |  2 +-
 arch/x86/kernel/process_64.c       | 70 +++++++++++++++++++++---
 tools/testing/selftests/x86/lam.c  | 87 +++++++++++++++++++++++++-----
 5 files changed, 143 insertions(+), 21 deletions(-)

--=20
2.53.0


