Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAE24CB8AB;
	Wed, 30 Sep 2026 13:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775636; cv=none; b=AzxdTmPqw9DytqBcm4Dze7ouVSATD+Dslk1QS9cEttRC/pMDMhv4kol23zRG4kRHCGDO6KOnHJUNB6NDGvdpHsEwEg60dHUDAhO0pEKnysjDueKZbtdui4anrmsV6zeXfARJI31Kf0VWSESeJ8/eKVTgv1kJiIDha17WDc87kQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775636; c=relaxed/simple;
	bh=uzHGM/3maVkIGwCJuKvC/PNaFcYXYyU6EAt9CwiwkGY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kljH8SepuIueXoJyaVYI47jm/xyuxAC+ERzGbuYaP2IVqaCVmq/RXoYxL0egxZDPVJUFWZG1TF9+xK59TMPeEqRvPnazTWgSrXodaIMGNbfw5A0vatd6BRuy460dkJEaWEjMTXSG1FArC4UBgF/pHTfF1jm36h8J6fQUkHuV9V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XKtt4/A5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XKtt4/A5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607161F000FF;
	Wed, 30 Sep 2026 13:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790775620;
	bh=zbkUDNwMgnqGHrbog0cra0S8SRCtAdGfYKEuqQ54rHU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=XKtt4/A5r/NkfGSvjGsvCW5EFKALT4VUt/RHVBjfHu+gJmFaF8/SWNcnrhlmbywAS
	 ifcqRGWYrmSjygRyyrsTfwOoN2bR2RY4k37nRTO86Fe/6ZQMJmouyYQepITjzW/tLt
	 an92bB88qaT5hqoqilJyvJmu9fzkThXkvwq+yIw2k0S/X/1iXOxZ7uRrI2+wOdRlWG
	 gg5IBr0eTLWXVU78MxgA3y+//L0MbFHibkUIsEBDi1XKQOlJjPlbCAIAprCWNyzfu2
	 N4dBImdVO92xInyLowtE5Vy0a5O3aWxh1xfY0cTW7PyFmz5QQNqBm+piNDE9yfYwhg
	 ZZSNukz9/nwOQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Luis Augenstein <luis.augenstein@tngtech.com>, 
 Maximilian Huber <maximilian.huber@tngtech.com>, 
 Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>, 
 Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Askar Safin <safinaskar@gmail.com>, linux-doc@vger.kernel.org, 
 kexec@lists.infradead.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
In-Reply-To: <20260928-move-gen_init_cpio-to-scripts-v4-0-f437a33c40ac@kernel.org>
References: <20260928-move-gen_init_cpio-to-scripts-v4-0-f437a33c40ac@kernel.org>
Subject: Re: [PATCH v4 0/2] Move tool for generating initramfs cpio to
 scripts/
Message-Id: <179077560598.3184845.8880862675609960141.b4-ty@b4>
Date: Wed, 30 Sep 2026 15:40:05 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1195; i=nathan@kernel.org;
 h=from:subject:message-id; bh=uzHGM/3maVkIGwCJuKvC/PNaFcYXYyU6EAt9CwiwkGY=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFl7BS33Hd+UGvve0kZKZXb3b+nkhL8/ZL9esLiXa6xya
 v0x49U3O0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEPioy/NNPOlPA9cZP+FZm
 WdDsvrtCQplpXb/C83d5LD07//GadGVGhqs7v7rem/Z96nyOPVe/fK5Nf7Jo0d+HUju3xd+vdmE
 8H8wIAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

On Mon, 28 Sep 2026 19:26:56 +0200, Nicolas Schier wrote:
> Move tool for generating initramfs cpio to scripts/
> 
> initramfs cpio tools had been subject of several recent discussions on
> linux-kbuild.  Let's get two minor steps forward by enabling a
> top-level target for building gen_init_cpio w/o the need of a valid
> kbuild configuration [1] and move the tools for generating the built-in
> initramfs from usr/ to scripts/ [2].
> 
> [...]

Applied to

  https://git.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git kbuild-next-unstable

Thanks!

[1/2] kbuild: Mark usr_gen_init_cpio as no-dot-config-target
      https://git.kernel.org/kbuild/c/14e2c1f5431a0
[2/2] kbuild: Move gen_init_cpio and gen_initramfs.sh to scripts/
      https://git.kernel.org/kbuild/c/33bef82263082

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped or
reverted. Patches applied to an "unstable" branch are accepted pending
wider testing in -next and any post-commit review; they will generally
be moved to the main branch in a week if no issues are found.

Best regards,
-- 
Cheers,
Nathan


