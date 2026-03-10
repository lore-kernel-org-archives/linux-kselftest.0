Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DAE3D348E;
	Tue, 10 Mar 2026 18:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773166111; cv=none; b=X0uSngn2Bqi8hF3lXKIJf4MGRmKV0AgkYMUyzxMVlbcXW3Rz9HzbmOeCcPhxafkRdyCx6lrwgLJP86SGdvLQybdOzS+V1/dxUUFc/6/9G5dldJIqh6T8pjlOtzl9WLoZajGxoS4mdmNSA0KS7Dw6g+IGBF9YQmPHIPY+5O98W+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773166111; c=relaxed/simple;
	bh=iDyRelz8CGDzDT4VlHyPVr8DvQuMD+iP3RIOuf7hcZA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HrvxzICEPjSDNs9aGJQO3LZ/FxSQdtNgVQlreOzaCSL99TfW7iSNTD8+t3Jjo2h9GIboy7wMExsYqVgRxYt8I++AClOMkbyp2SgfXb/zhXcTdLEbnBdoWo8qTu3CUMWzp2XPw9/yB40S6+3BHd+yk8CtxjfMq029oitWTuaiDAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=iJbAi81R; arc=none smtp.client-ip=109.224.244.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="iJbAi81R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1773166107; x=1773425307;
	bh=/c4BcsLBw+8ZDRnuRw/+gRQyl4/fQXV5G/XEqQN1CXc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=iJbAi81Rn+6qHpXdbRZoJxFpxs+VfAgRjfVU17ABA2Va2qeBmTg5Ne7p7fMRXAHeD
	 3ICwxMtGC9HBEBV7oczDCfs0EU9fINEUwv0UPw//kctg27NL65rvYfV6x8KaGS30+A
	 ssldWC1393rorduWyMoRtGu0AiIYvyD/D5JZKuvohcey99AjwZxUlIVRXVgJA7iAiU
	 WWgGRlYE6Cr4btFDLfGzwlcIKbLFsD+y0A54mgXHorRPuIJBkc5vPA4o8CSJR3c+tA
	 eeDnfJ8lncBCUM49fwGJcxBuMreTqc89wystf+uReIGVTAcrujZX4r/ktdyS4jv0VF
	 3EC7IFyY/CENQ==
Date: Tue, 10 Mar 2026 18:08:20 +0000
To: bp@alien8.de, ryan.roberts@arm.com, hpa@zytor.com, jgross@suse.com, oleg@redhat.com, tglx@kernel.org, nathan@kernel.org, akpm@linux-foundation.org, baohua@kernel.org, seanjc@google.com, shuah@kernel.org, houwenlong.hwl@antgroup.com, perry.yuan@amd.com, xin@zytor.com, riel@surriel.com, will@kernel.org, mingo@redhat.com, morbo@google.com, peterz@infradead.org, nick.desaulniers+lkml@gmail.com, maciej.wieczor-retman@intel.com, justinstitt@google.com, dave.hansen@linux.intel.com
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: sohil.mehta@intel.com, llvm@lists.linux.dev, x86@kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, m.wieczorretman@pm.me
Subject: [PATCH v4 0/3] x86: Simplifying LAM
Message-ID: <cover.1773165953.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 3af4bcd6271730e4a8e425a194794acecf223ccc
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
though x86's LAM supports 6-bit tags it is beneficial to shorten lam to
4 bits as ChkTag will likely be the main user of the interface and such
connection should simplify things in the future.

If a usecase arises in the future, the 6-bit tags can be made available
as a debug feature and possible to enable through debugfs.

Changing the tag width has no effect on userspace programs. Due to LAM
being disabled until LASS is fully supported in the kernel there are yet
no userspace projects relying on a specific LAM tag width. One known
exception is the clang compiler and its hwasan support. It is however
not a problem since there are both no users of hwasan on x86 yet and
upon closer inspection (when working on x86 KASAN software tag-based
mode) I found it's not working correctly and needs to be patched.

The patchset also cleans up some comments referencing LAM_U48 which was
not implemented in the kernel and the comments shouldn't imply it can be
enabled.

Patches are based on v7.0-rc3

Changelog v4:
- Remove the 'default' wording from the cover letter and patch messages.
- Add a paragraph to the cover letter about userspace impact.

Changelog v3:
- Remove the debugfs part and update the rest of the code and patch
  messages accordingly.

Changelog v2:
- Extend a char buffer in debugfs read callback to fit the format
  string.

[1] https://community.intel.com/t5/Blogs/Tech-Innovation/open-intel/ChkTag-=
x86-Memory-Safety/post/1721490

Maciej Wieczor-Retman (3):
  x86/process: Shorten the default LAM tag width
  x86/mm: Cleanup comments where LAM_U48 is mentioned
  selftests/lam: Add test cases for different LAM tag widths

 arch/x86/include/asm/mmu.h        |  2 +-
 arch/x86/include/asm/tlbflush.h   |  2 +-
 arch/x86/kernel/process_64.c      |  8 +--
 tools/testing/selftests/x86/lam.c | 86 +++++++++++++++----------------
 4 files changed, 49 insertions(+), 49 deletions(-)

--=20
2.53.0


