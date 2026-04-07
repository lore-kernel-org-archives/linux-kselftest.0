Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92273AA4F2
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 17:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775583935; cv=none; b=bSBSKF6nGtK/O95kYfCVFE7D7kH0gf1MBoyTJTOY5SKjT+OHp5K0e9sKyl1o6pV386Rgy4fCYrvz0KBP3KfQn+6wyq5dtsrtuwYvEBTqfCqzSgEV2bdIInWq7/eHZkP4fNPNCj8Lonq332t5lxSZZONw9as0j3//ywyTgMhdywk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775583935; c=relaxed/simple;
	bh=2aFp4KoN8743mT3bQxoTmNhOZBtqUkx/s92zq3Svr5Y=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=P2GVrCinPGy8V55bmPzL+fi0KL4lwzy5jbqU/iU6DjDFr8snk2S30ow1QN95695UMf5NzvdfgiSNaW8FeBrZY0U9M9TbernUHFsfvQ2nfn7Q1Mgg5MDsBsSjG4xj73IsivtabmK+ndKoJyD/YS/hLQKBrT78yBRaX72pcdHylLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=BH0u24Oh; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="BH0u24Oh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775583919; x=1775843119;
	bh=xszVRi126LHAKU1hMfewjsGA++zvfLT/QY6bM+ivMq4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=BH0u24OhiVmu4gv0nQpN3Iv6YcwJPSQNefQpovhaWIb9Gg/jNOJhSLlPY2cXZdfL6
	 JeNXcqIhOmJw4Nl/EPg6+u2im0dccxUGVvRMEymKMoAzrx5jTXr97Mm1QpcPADwQsw
	 VSb1x/fIe8o/MgJ+VuZzxCZ4WKz3xhi7x40ULknnXc00VwsPKfgGwhJ0CNvmI2CrN0
	 S2Uq5Vmz1btAfBTi7OWUCxwqrPjI0ROn5oVmZH9uDFHWbuwHWGIDQoAf0T+5mTmhjS
	 9RQhmvZdrvcmYnYsNxCcTKRarxSp2lQPnKAuvbAR7VCpVNFIrEBn1gDoNwOTQeydJS
	 HqkhQAhGA4wpw==
Date: Tue, 07 Apr 2026 17:45:12 +0000
To: houwenlong.hwl@antgroup.com, dave.hansen@linux.intel.com, ryan.roberts@arm.com, nick.desaulniers+lkml@gmail.com, bp@alien8.de, will@kernel.org, maciej.wieczor-retman@intel.com, david@kernel.org, nathan@kernel.org, justinstitt@google.com, seanjc@google.com, perry.yuan@amd.com, oleg@redhat.com, tglx@kernel.org, hpa@zytor.com, james.morse@arm.com, mingo@redhat.com, akpm@linux-foundation.org, jgross@suse.com, peterz@infradead.org, morbo@google.com, ilpo.jarvinen@linux.intel.com, xin@zytor.com, shuah@kernel.org
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: x86@kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, m.wieczorretman@pm.me
Subject: [PATCH v5 0/3] x86: Simplifying LAM
Message-ID: <cover.1775581451.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 3be82768e7ebdb3c007e9dac95753b86a48ec022
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

Patches are based on v7.0-rc7

Changelog v5:
- Rebase onto v7.0-rc7.

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


