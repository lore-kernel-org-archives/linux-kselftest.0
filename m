Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5DD3446BE
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 12:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771591589; cv=none; b=hD6qjzIOvSkzCK+qsLjCUMK2qOUsfdRiQ/zpa6Z0FiKyZ/UAb4CpqWdvuGm5sQrE2A7M1k7K2x+ofVIpEaOKksQv6hI/Rlnnr81S7yDn/74IugP7OSU0f2UdTRT8jcsOLo+hYPAEng7DlBscY6YJdY4Ic0q51ev1P6BkvApyrMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771591589; c=relaxed/simple;
	bh=Toz60nEa83FfbTNF1AEG1Wl00nNwecs0XITQOpr+TGQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qtfY+RXOL6OlM/0jS3hcDGya8HJleO64pZOHxvtt6ZAmXsw77l5gQSvT9kqZ5zrUctxn29SK5jpuv1EdFPFOAELoeZ6lCmg/rI+aV78dZz4/EvKIBdZUQtlc0cLj8kvWrkpAwmU2uhmyrH1fynI788dRK0a/Hq56leIm83AeS1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=bFnj9pP6; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="bFnj9pP6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1771591579; x=1771850779;
	bh=7Cr0NBVV8P3aHEos1LL3oc1vpw95cebEjJU/560c+DU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=bFnj9pP6quCWnKpCr8PxQyXoes9dAaj5/+KXHdPINEeoM3Gaf0p96npVqwrVOXnKB
	 /uV4K7kUJCbPynp5NeIg8EGtMtu9B17mj4/NgtiC/7DySy5J3/nVzJdwawqoH7tvFA
	 2kaL60wt3fqrx+osTG91PULg8sw4BGBASMbejpL2ZjeYruiZeg52lt8KsEvjvSx5V4
	 pJSmmFOkm0pdSVK449WnwzYshIOj/oQTiQkiMefPyYQyKbX2cJlAlJiNUadlruf5GL
	 V9U2S8rQ2D7GfNwiHPxCmBESJwj7A1Zu4ytz+yb2LzMwoHNiEYD3/2U46/OMngvpom
	 jiqPM8TMg51MQ==
Date: Fri, 20 Feb 2026 12:46:13 +0000
To: peterz@infradead.org, will@kernel.org, oleg@redhat.com, xin@zytor.com, maciej.wieczor-retman@intel.com, dave.hansen@linux.intel.com, tglx@kernel.org, james.morse@arm.com, akpm@linux-foundation.org, seanjc@google.com, ryan.roberts@arm.com, riel@surriel.com, mingo@redhat.com, shuah@kernel.org, hpa@zytor.com, brgerst@gmail.com, bp@alien8.de, luto@kernel.org, baohua@kernel.org, ubizjak@gmail.com
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, m.wieczorretman@pm.me
Subject: [PATCH v1 0/4] x86: Simplifying LAM
Message-ID: <cover.1771589807.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 8eed6428654a2b18c313259e4b104eb5ead944ca
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

Patches are based on v6.19.

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
 arch/x86/kernel/process_64.c       | 71 +++++++++++++++++++++---
 tools/testing/selftests/x86/lam.c  | 87 +++++++++++++++++++++++++-----
 5 files changed, 144 insertions(+), 21 deletions(-)

--=20
2.53.0


