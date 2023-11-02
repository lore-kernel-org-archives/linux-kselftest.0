Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8125EC4167D
	for <linux-kselftest@archiver.kernel.org>; Thu,  2 Nov 2023 06:00:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232327AbjKBGA2 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 2 Nov 2023 02:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231673AbjKBGA1 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 2 Nov 2023 02:00:27 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76D7B13A;
        Wed,  1 Nov 2023 23:00:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07157C433C7;
        Thu,  2 Nov 2023 06:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698904825;
        bh=jZrUndBvrEv3u0YCdJU/c6eAxBp8Q3jwTAt94lIXALU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Fs/XNKMMhI0XrZwGL3tvs7KG1yCxqK6r4iFL2tMX0O7f0EifJavA4IZUjtoTD6DZ5
         vWEZuc4m+VMd2DEjRHlYJ0HNfO0Cs9QM0Vdmek5+1wvQRlPNEzt11++N4W/SNpsc7w
         VDZHKRs05Ui8yv7BIMZwGEEjL7X2eN49FqG/V12DujuzPlsXhL9g/wUnXvGvhxBhlT
         oB7rufhpdBNTlI5F4QbfMAk7W2zaCblz/QYK9aWvBJViP4ZVriASLOW5jYmtJQ2vg/
         raT2dEBHH+pdIJjl+3TKx0wdfPOZIRTYCNZ2Y40niaCiuP2npS6MhiN8OQ/0El4wSz
         i56fNwrMba6rw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E2268C4316B;
        Thu,  2 Nov 2023 06:00:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf v3 0/2] bpf: Fix incorrect immediate spill
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169890482492.9002.15567040644206875649.git-patchwork-notify@kernel.org>
Date:   Thu, 02 Nov 2023 06:00:24 +0000
References: <20231101-fix-check-stack-write-v3-0-f05c2b1473d5@gmail.com>
In-Reply-To: <20231101-fix-check-stack-write-v3-0-f05c2b1473d5@gmail.com>
To:     Hao Sun <sunhao.th@gmail.com>
Cc:     ast@kernel.org, daniel@iogearbox.net, john.fastabend@gmail.com,
        andrii@kernel.org, martin.lau@linux.dev, song@kernel.org,
        yonghong.song@linux.dev, kpsingh@kernel.org, sdf@google.com,
        haoluo@google.com, jolsa@kernel.org, mykolal@fb.com,
        shuah@kernel.org, eddyz87@gmail.com, shung-hsi.yu@suse.com,
        bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, stable@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hello:

This series was applied to bpf/bpf.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Wed, 01 Nov 2023 13:33:50 +0100 you wrote:
> Immediate is incorrectly cast to u32 before being spilled, losing sign
> information. The range information is incorrect after load again. Fix
> immediate spill by remove the cast. The second patch add a test case
> for this.
> 
> Signed-off-by: Hao Sun <sunhao.th@gmail.com>
> 
> [...]

Here is the summary with links:
  - [bpf,v3,1/2] bpf: Fix check_stack_write_fixed_off() to correctly spill imm
    https://git.kernel.org/bpf/bpf/c/811c363645b3
  - [bpf,v3,2/2] selftests/bpf: Add test for immediate spilled to stack
    https://git.kernel.org/bpf/bpf/c/85eb035e6cfd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


