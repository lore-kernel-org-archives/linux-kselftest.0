Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630C83FD12A
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 15:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772465679; cv=none; b=GHoiWcWRI5n9kgi2D/YC7VnT4boeYvstKTvyhk2A1bSze7RSA/beBPetOTAKBPHRkQthsj8Dyy+6pC9wPKJkXpze9X1ryz2627b/ma3rmDpmahkUBuRT9qVYmYbHOEaVGXHCdh+W2G3OwTzttGOxGnd4mtu/FUX9G5lwkoZqEVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772465679; c=relaxed/simple;
	bh=fPGkXETOivSb0gcKH1Y+G1n5wi0EOulp5r1zb1fXN+Y=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=K87cnsLh5CGwq89g6aTGH4NfIIJZsGlYQQu7Oj2SKrlPOYoPEc7Xf4ZHRbAzQWj/amWPd+O/iGfA/oU9OI1S6rW+EQKqRS9PKI0o5QeUpMf5RAPbgMHOi8NBIBTMFouKFYHpfVxyGcBdljrQas5QmGfyNYdXFxVf9WC/pXT9cI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=qAl7dqW+; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="qAl7dqW+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1772465669; x=1772724869;
	bh=qjKp1xtdK2zPDEZDm5vNbZGOafeB5XHFdlBva4zbdcw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=qAl7dqW+KfXo3toSbI4xZOhJJLnJreCUA2IENm3jE2wYVfz4U3ZbRWONDta5bn95i
	 FStUXTCeyXZu99TNSdMnf3Rjsw00b4/3ViUxNGMMC2DptoxyL5+rVEoQAr/8lrj+pr
	 r67TL7rbarGQL8EiUYgA0b3J7ZEDIMKeAacp77OqMwFPRQ/hXsVeUuzvAtfuWlhXFE
	 fNCaX5fwy+JEBpObofRnBb7+dkXSNCzRWkVM+AXMpJ+xsY/plX9f0rDVZCdllcLJec
	 9YF+sVbWXv08c1rhClyXqZ0SZQQiO0a3/4NTolgpTC4axv/wyLCvnOwyrDulAx2zkg
	 /9QGGO7k/bgCg==
Date: Mon, 02 Mar 2026 15:34:25 +0000
To: perry.yuan@amd.com, ubizjak@gmail.com, hpa@zytor.com, bp@alien8.de, xin@zytor.com, maciej.wieczor-retman@intel.com, baohua@kernel.org, houwenlong.hwl@antgroup.com, ryan.roberts@arm.com, seanjc@google.com, shuah@kernel.org, james.morse@arm.com, will@kernel.org, mingo@redhat.com, riel@surriel.com, tglx@kernel.org, peterz@infradead.org, akpm@linux-foundation.org, dave.hansen@linux.intel.com, jgross@suse.com, oleg@redhat.com, brgerst@gmail.com
From: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-kselftest@vger.kernel.org, m.wieczorretman@pm.me
Subject: [PATCH v3 0/3] x86: Simplifying LAM
Message-ID: <cover.1772465456.git.m.wieczorretman@pm.me>
Feedback-ID: 164464600:user:proton
X-Pm-Message-ID: 385951e8ae7208938b2fcdaab2b0488465a91774
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

If a usecase arises in the future, the 6-bit tags can be made available
as a debug feature and possible to enable through debugfs.

The patchset also cleans up some comments referencing LAM_U48 which was
not implemented in the kernel and the comments shouldn't imply it can be
enabled.

Patches are based on v7.0-rc2

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


