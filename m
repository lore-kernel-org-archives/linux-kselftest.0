Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B3448664A;
	Thu, 10 Sep 2026 15:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054873; cv=none; b=iLu/wE38PhhX2rTPoPPqAzghVjCjA8p+4M3TZeztIji3Nty47wjNo4JF9T6/IDGykql2Jm5fhco5itr7mnIvX3ELrlQKg2Y+cFHUDpzNIvbD5sP9EqgrrhWcGLLxNNolSurwoKgC9TSWVitXFgSb5avUSSYrWtjGxajhhnPo5BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054873; c=relaxed/simple;
	bh=38iNAKbKJDNm7y94oFhd+Hh2UDcpYGGHN+ODnfGKfzs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=oDWiibF8WUXGN7L2hLeE4nNtdO7Qv0hJsNPRheqVN+MQFuBp5rG4PRfhiI9+WEtn53BAo3fFk5XbFRdBPw/WFEF+f4mGYtKnbj7qWCxH1jybIQGSfY2htwt199m0gY/oAIF+854Nwe+EGHcAmwBaiJudDof8uTs0lq1m8zXhw0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZPT1gMlQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZPT1gMlQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 675981F000FF;
	Thu, 10 Sep 2026 15:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789054872;
	bh=wPcCiBBITeASDRG4XzbQSWp2WzppaOy28h2ruAqwXi8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ZPT1gMlQYCE5N332MSVM0S9U6d4FLGUsbQCPoHUb5X9ttBkjazudHOj9UQKHqJd9D
	 oCxLRURVb5tbXz224n1kpk9IHDZKYSVtYQLgyTtMMjylmSzWSojqj/lBSwJf/HCe10
	 8eK+ueByj4l9PPmFbUW99Ru6kp/Esl/vw0Jow4TK/QeBk7pNtQko/5Rzw55iFnQRCy
	 JpF435LHDVBZH2psN6u4pDeISC01VD3AFrU0Nt8kyUXTDMID7VVYLIU0mj9/Qyipnb
	 S4Y4lP/lzFr9Zd89xKt5hBEQanbRxpuXnz3U+wIwdzHcUBWviuJXTGM3h4In4P2Nn0
	 jqW8F+/u1JH4A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19B95380CEF9;
	Thu, 10 Sep 2026 15:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v3 00/10] net: fix typos and repeated words in
 comments
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <178905480977.1504082.16408401600046600222.git-patchwork-notify@kernel.org>
Date: Thu, 10 Sep 2026 15:40:09 +0000
References: <20260908052602.27497-1-hemanth.selam@gmail.com>
In-Reply-To: <20260908052602.27497-1-hemanth.selam@gmail.com>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: davem@davemloft.net, andrew+netdev@lunn.ch, bbhushan2@marvell.com,
 bcm-kernel-feedback-list@broadcom.com, chris.snook@gmail.com,
 edumazet@google.com, florian.fainelli@broadcom.com,
 GR-Linux-NIC-Dev@marvell.com, gakula@marvell.com, kuba@kernel.org,
 shenjian15@huawei.com, shaojijie@huawei.com, manishc@marvell.com,
 marcin.s.wojtas@gmail.com, pabeni@redhat.com, rahulv@marvell.com,
 rkannoth@marvell.com, linux@armlinux.org.uk, shshaikh@marvell.com,
 shuah@kernel.org, horms@kernel.org, sbhatta@marvell.com,
 skalluru@marvell.com, sgoutham@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue,  8 Sep 2026 10:55:52 +0530 you wrote:
> Fix misspellings and repeated words in comments across the networking
> code, found with scripts/checkpatch.pl using the misspelling list in
> scripts/spelling.txt.  Comments only, no code changes.
> 
> Changes since v2:
>  - v2 put 184 changes in a single patch.  Andrew Lunn asked for it to be
>    split by vendor, which comes to 54 patches, so this is the first
>    batch.  maintainer-netdev.rst asks for no more than 15 patches
>    outstanding against a tree at a time and I have five in flight
>    already, so this batch is 10.  The rest will follow as these are
>    applied.
>  - patches 1 and 2 are unchanged from v2 and carry Andrew's
>    Reviewed-by.  They are resent because the v2 series was marked
>    superseded, so they would otherwise be dropped on the floor.
>  - dropped the sfc mcdi_pcol.h patch (v2 4/6) even though Andrew had
>    reviewed it.  Edward Cree pointed out that header and the Siena copy
>    are generated from the firmware definitions, so an edit here would be
>    overwritten the next time they are regenerated; he has forwarded the
>    typos to the firmware team instead.  The sfc changes outside pcol are
>    unaffected and will come in a later batch.
>  - dropped the 8390 patch, the driver is Orphan / Obsolete in
>    MAINTAINERS.
>  - dropped one octeontx2 hunk, in otx2_pf.c, because the comment holding
>    the typo has since been rewritten upstream.  The remaining octeontx2
>    typos are still fixed in the marvell patch.
>  - dropped an "amount of times" to "number of times" change in qed_dev.c.
>    That is a wording fix rather than a misspelling, so it does not belong
>    in this series.
>  - v2 6/6 (net: usb, "Medium Mode mode") is not in this batch.  Andrew
>    asked me to check the data sheet for that one, and I will answer on
>    that thread before resending it.
>  - rebased onto net-next.
> 
> [...]

Here is the summary with links:
  - [net-next,v3,01/10] net: llc: fix repeated word 'all' in comment
    https://git.kernel.org/netdev/net-next/c/2d2c2ea6650e
  - [net-next,v3,02/10] selftests: net: fix repeated word 'use' in comment
    https://git.kernel.org/netdev/net-next/c/a2c9decb21b2
  - [net-next,v3,03/10] net: broadcom: fix typos in comments
    https://git.kernel.org/netdev/net-next/c/a08b0a9e5e5f
  - [net-next,v3,04/10] net: cavium: fix typos in comments
    https://git.kernel.org/netdev/net-next/c/405829119fdc
  - [net-next,v3,05/10] net: qlogic: fix typos in comments
    https://git.kernel.org/netdev/net-next/c/12ae2a2b298a
  - [net-next,v3,06/10] net: fddi: fix typos in comments
    https://git.kernel.org/netdev/net-next/c/ef7ed063b48f
  - [net-next,v3,07/10] net: marvell: fix typos in comments
    https://git.kernel.org/netdev/net-next/c/36ca708b7cc7
  - [net-next,v3,08/10] net: hisilicon: fix typos in comments
    https://git.kernel.org/netdev/net-next/c/1b4109e4a024
  - [net-next,v3,09/10] net: atheros: fix typos in comments
    https://git.kernel.org/netdev/net-next/c/eeea715379b2
  - [net-next,v3,10/10] net: dec: fix typos in comments
    https://git.kernel.org/netdev/net-next/c/f36cb539fd97

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


