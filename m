Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE1338A73A
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 09:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775814934; cv=none; b=Tcbf8yqrsv+U4LPUGyLsnL5L8nCH56bq1gt7HokyWuY/EKJRpxOjZL8dzi+UC62/lfBgrBhT7fXUs0pGeekbXqcHyVqPzuIEncwBSScmhuOBAXax7hVAsmi9SxtGXZpiFVywsIK3rUwV/8uE2iREgqEc7joCggNhnzERtj54KA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775814934; c=relaxed/simple;
	bh=5B6kQ0eNONQ0vKFLrZkgSIkTwQ3ULHzzu4BiJhdsFoU=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=h0b4qHlwbr6Eyh7XbH0otMUu7fya0GXKwKGjU0Jzag6JJ9skxiICV5BG6EZZRkqDh57BkX35hHJxOd0PEr9+rxbVmwWu8tFdTfawp+7gruRw8mzkYxmJaGKoTZjb0MDo/xMnXOyRjDZVtMxHhIHiT4uU0iqY0/OlYwijnFWmAak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=mzehQlae; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="mzehQlae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775814922; x=1776074122;
	bh=dqSlRuqCc3tGzZkZGoD4bgnEZGc7L10HooG+3oLotk8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=mzehQlaeNkETcPK7kflXRdWigjM7S66NWZEgKCFb+QxFyBDTdJwOSD9G5xW7xHnM9
	 aVW1Y0uVe9Qvlh8qdQBnllAbkJxWUc+0uSjN1ZKLGyBy73W7oKVI5SUIw2GaCsGIXE
	 LCXhgztUlF04NxWcvzddD8dgJdDEdR526I+PZofzEbdmg7lpmVnyTG2gukRoqLR7yq
	 qeJhcViAyg8gP0DxSC69nKrcz3mc7AqbeoEh31/Kr1ntgqnwW85V+x7KQIYDOQWFwF
	 pk1GMZjwxM95Ipwq4gJoZgHGKsLFdHogl1NzQuYspK2n7WrDFqbQo/4A3stPt9S13x
	 mfH5cXKqGziGQ==
Date: Fri, 10 Apr 2026 09:55:17 +0000
To: peterz@infradead.org, ryan.roberts@arm.com, ilpo.jarvinen@linux.intel.com, maciej.wieczor-retman@intel.com, jgross@suse.com, morbo@google.com, mingo@redhat.com, ljs@kernel.org, nathan@kernel.org, shuah@kernel.org, akpm@linux-foundation.org, james.morse@arm.com, oleg@redhat.com, houwenlong.hwl@antgroup.com, xin@zytor.com, justinstitt@google.com, seanjc@google.com, hpa@zytor.com, perry.yuan@amd.com, bp@alien8.de, dave.hansen@linux.intel.com, sohil.mehta@intel.com, tglx@kernel.org, nick.desaulniers+lkml@gmail.com
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, x86@kernel.org, m.wieczorretman@pm.me
Subject: [PATCH v6 0/3] x86: Simplifying LAM
Message-ID: <cover.1775813245.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 3bcc0e963dac299f1175314314caf9f938397d67
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

After ChkTag [1] announcement, it's worth preparing a stable x86 linear add=
ress
masking (lam) user interface. One important aspect of lam is the tag width,=
 and
aligning it with other industry solutions can provide a more popular,
generalized interface that other technologies could utilize.

ChkTag will use 4-bit tags and since that's the direction other memory tagg=
ing
implementations seem to be taking too (for example Arm's MTE) it's reasonab=
le to
converge lam in linux to the same specification. Even though x86's LAM supp=
orts
6-bit tags it is beneficial to shorten lam to 4 bits as ChkTag will likely =
be
the main user of the interface and such connection should simplify things i=
n the
long run.

If a usecase arises in the future, the 6-bit tags can be made available as =
a
debug feature and possible to enable through debugfs.

Changing the tag width at the moment has no effect on userspace programs. D=
ue to
LAM being disabled until LASS is fully supported in the kernel there are ye=
t no
userspace projects relying on a specific LAM tag width. One known exception=
 is
the clang compiler and its hwasan support. It is however not a problem sinc=
e
there are both no users of hwasan on x86 yet and upon closer inspection (wh=
en
working on x86 KASAN software tag-based mode) I found it's not working corr=
ectly
and needs to be patched.

The patchset also cleans up some comments referencing LAM_U48 which was not
implemented in the kernel and the comments shouldn't imply it can be enable=
d.

Patches are based on v7.0-rc7

Changelog v6:
- 1/3
=09- Change define names so they match the arch_prctl() cases for
=09  LAM.
=09- Add more defines so they build into the GENMASK() more
=09  properly.
- 2/3
=09- Add one reviewed-by.
- 3/3
=09- Update the patch subject after removing additional test cases
=09  during v3.
=09- Change bit width and untag mask defines so they match the
=09  kernel ones in name and add GENMASK() to x86 selftests so
=09  they match the kernel in form. Update the patch description.

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
  selftests/lam: Update LAM tag width and cleanup names

 arch/x86/include/asm/mmu.h        |  2 +-
 arch/x86/include/asm/tlbflush.h   |  2 +-
 arch/x86/kernel/process_64.c      | 11 ++--
 tools/testing/selftests/x86/lam.c | 94 ++++++++++++++++---------------
 4 files changed, 58 insertions(+), 51 deletions(-)

--=20
2.53.0


