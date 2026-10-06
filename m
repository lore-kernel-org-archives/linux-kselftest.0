Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2194E3E3150;
	Tue,  6 Oct 2026 08:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791275257; cv=none; b=suPeLomukhctkYMfpkF3pO4Uk0bYdmtJad+nmT4YboSfu1Gz7251/2l0KgOgm89dZnQdKIfYnLARGsyfGqYzHI9wIGxZmAKSEi8VkldgwyJCCTM9w6SVoQmnDF051ufSAlCGpjjh+qOpiKawbz03R7FAhtBSn34hqseQE2pbcNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791275257; c=relaxed/simple;
	bh=HalsX/+XKRcqLtHGCVt1wj1ZJyeArJZGmjdo5TMZefo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mpfcRfGgbGcsuGvM1a+kVDTKVMtHbaAhtzZebH0DQOEF9bhw8TQJ+XricXKGzUMUFD0hvjSr5X0po1mkKtPJFmw9r8TyThl/T3i4n9sDfa6fXLGU3s47JcL6EC6vWeJcXPSkUMZSzFFf65FMzjk5cwuS9c8aRh13jbWqqgTcOrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oe4Sp15O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oe4Sp15O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEAFE1F000FF;
	Tue,  6 Oct 2026 08:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791275255;
	bh=ZHGdVvbiiSWvPdjWTY81JoDFJXJMRasd/xcJmp0zID0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oe4Sp15OaSgs29S8sXEHZL655OuoZsNufL8v6G7G4+ZmVRGCxJ2aV8ab9AChYSHb1
	 BF5pP8yTFXRvWLcOVD4YEbeMjoLCY/wfLEwhocvHNt0VTGgpf/oHcgzpAnRsihpr/n
	 uyAppwrvVU+uEmsUFvF6+hilf3JX7QwW2j54w24A3EA66vVkBNQ/ieZ4JbvpIU09Qp
	 qRxqfjWUD8ja2CfGLTDPoxj1PC6YT3HsZdFom39irTLXLUPxzBxmec2OtvDdCDXaOI
	 zUAkNBQhAI0Nyd1QsxZf0tGeV6w2ruE2b1emFo0reoRO06+9naPdDyaZ9gLLrzImua
	 1TlayHqGkQ1vA==
From: Kees Cook <kees@kernel.org>
To: Cong Wang <xiyou.wangcong@gmail.com>
Cc: Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	Will Drewry <wad@chromium.org>,
	Christian Brauner <brauner@kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 0/3] seccomp: opt in to restarting notifications before receipt
Date: Tue,  6 Oct 2026 01:27:28 -0700
Message-ID: <179127524847.152837.4977837981033919243.b4-ty@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924204209.477694-1-xiyou.wangcong@gmail.com>
References: <20260924204209.477694-1-xiyou.wangcong@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 24 Sep 2026 13:42:06 -0700, Cong Wang wrote:
> From: Cong Wang <cwang@multikernel.io>
> 
> Sandlock is an unprivileged Linux process sandbox that uses Landlock and
> seccomp to confine untrusted programs.
> 
> While using seccomp user notifications to enforce process limits,
> sandlock encountered intermittent shell pipeline failures: SIGCHLD can
> interrupt a pending fork notification and make fork return EINTR before
> it executes [1]. The same pre-execution interruption can leave an
> intercepted close returning EINTR with its descriptor still open.
> 
> [...]

Applied to for-next/seccomp, thanks!

[1/3] seccomp: allow restarting interrupted unreceived notifications
      https://git.kernel.org/kees/c/c63c136194e9
[2/3] selftests/seccomp: cover restart of unreceived notifications
      https://git.kernel.org/kees/c/c3597f6d03f2
[3/3] docs/seccomp: describe the SECCOMP_FILTER_FLAG_RESTART_BEFORE_RECV flag
      https://git.kernel.org/kees/c/e0eb7e155762

Take care,

-- 
Kees Cook

