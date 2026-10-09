Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CC213A258;
	Fri,  9 Oct 2026 20:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791576611; cv=none; b=jVftPSZPBioCrVbIcXfknHFrsbi/dIaJi03IlyJFv9XZNzM8my2dS6B8WAhU3lOFsaO0Ma2rAPwsiIbHdJKfDkY8RYQfdFBNvIF0Ln1gjaoxUWMR0cU31X8TZLWQZ92mcryIfFKBSslaxZ9c5HndaU068RA+JLM93obrY5YyyDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791576611; c=relaxed/simple;
	bh=fdXBHBKBGOWZYHxGmnNehDYrYDgodaAYcpW8x1x9m4M=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=f2u/9bMESyAM/oy8wygSOPHO4Yhwkc0pGXpL1+lBfeG/4zNjHfcC1+MgOolNtiNPO0AhVGA0o17RGPFBOyz6ax9v4xxinM0TfxkIASnDr6GuVktbPzmVdKhFlutqrlcUtREPtcSskxHR89UouMKydsMnhOFOf8vczgO60a+lcLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KuW/M6N/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KuW/M6N/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 823791F000FF;
	Fri,  9 Oct 2026 20:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791576609;
	bh=yAtT7Kz/cfBbECexhY2+7vMzFYjycFt1jV6uHWCe2qk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=KuW/M6N/Jv+w8fSTI5MzC+c9uyJsMxvbGXsObHMBwAHcv9THa/zJNw6bKJbAShw+b
	 vo4r+Bin+QhP33tm/lxugoPH+tlrxXLdYq2PXG7LEpA8Rm9PbrObKEo3J/22umLOmX
	 J6pW9AV0n+1Rxc3sdTw6eUmSMMhezq88f+/bVbtCbHU/q8rg1HMrSuZtly5bTfvCrJ
	 pzuTkS+Nrg7nULbEPCcKpx2psI1+uWR2olv7EEwBAOUR5dHGgbiJfCwi+Dye3uNTnl
	 3VNLX/ZtnUsgaetwYGolyY055wcRD0nTv6z49gmPJl4Lm2lABU1cDz45QS71EshN6x
	 G/tZjYSKsz6Tg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7742D392627A;
	Fri,  9 Oct 2026 20:10:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v8 00/11] riscv: hwprobe: Expose RVA23U64 base behavior
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179157660809.984023.2184718764665109991.git-patchwork-notify@kernel.org>
Date: Fri, 09 Oct 2026 20:10:08 +0000
References: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
In-Reply-To: <20260920-rva23u64-hwprobe-v2-v8-0-5f14bc5c23d3@oss.qualcomm.com>
To: Guodong Xu <guodong.xu@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, corbet@lwn.net,
 skhan@linuxfoundation.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dlan@kernel.org, chen.wang@linux.dev,
 inochiama@gmail.com, rdunlap@infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, conor@kernel.org,
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, sophgo@lists.linux.dev,
 linux-kselftest@vger.kernel.org, tchiu@tenstorrent.com, fweimer@redhat.com,
 bergner@oss.tenstorrent.com, zihong.plct@isrc.iscas.ac.cn,
 mark.hsj@gmail.com, aurelien@aurel32.net, andrew.jones@oss.qualcomm.com,
 conor.dooley@microchip.com, qingwei.hu@bytedance.com

Hello:

This series was applied to riscv/linux.git (for-next)
by Paul Walmsley <pjw@kernel.org>:

On Sun, 20 Sep 2026 03:18:20 -0400 you wrote:
> This series builds on Andrew Jones's earlier RFC [1]. It lets userspace
> check for RVA23U64 conformance in one call, instead of walking hwprobe +
> prctl across every mandatory extension.
> 
> The series adds a small framework that resolves profile-class bases (IMA
> and RVA23U64) from the kernel's ISA extension bitmap at init time, and
> surfaces the result through both /proc/cpuinfo and hwprobe. Later patches
> can add RVA23S64, and backward RVA22 / RVA20 detection, to
> riscv_set_isa_bases() without changes to the surrounding code.
> 
> [...]

Here is the summary with links:
  - [v8,01/11] riscv: Add B to hwcap and hwprobe
    https://git.kernel.org/riscv/c/fbab8abaac8f
  - [v8,02/11] dt-bindings: riscv: Require block-size for Zicbom, Zicbop, and Zicboz
    https://git.kernel.org/riscv/c/40623184c6f0
  - [v8,03/11] dt-bindings: riscv: Add Zic64b extension description
    https://git.kernel.org/riscv/c/3776fb1a1b6c
  - [v8,04/11] riscv: Add Zic64b to cpufeature and hwprobe
    https://git.kernel.org/riscv/c/7493567982b0
  - [v8,05/11] riscv: dts: spacemit: k3: Add Zic64b ISA extension
    https://git.kernel.org/riscv/c/7c4752c60f99
  - [v8,06/11] riscv: dts: spacemit: k1: Add Zic64b ISA extension
    https://git.kernel.org/riscv/c/1fc72ff0d3fc
  - [v8,07/11] riscv: dts: sophgo: sg2044: Add Zic64b ISA extension
    https://git.kernel.org/riscv/c/ca0c312bdf6a
  - [v8,08/11] riscv: Add a getter for user PMLEN support
    https://git.kernel.org/riscv/c/55458c7347a3
  - [v8,09/11] riscv: cpufeature: Introduce ISA bases bitmap and rva23u64 detection
    (no matching commit)
  - [v8,10/11] riscv: cpu: Output isa bases lines in cpuinfo
    (no matching commit)
  - [v8,11/11] riscv: hwprobe: Introduce rva23u64 base behavior
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


