Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792D4C77B75
	for <linux-kselftest@archiver.kernel.org>; Tue, 18 Apr 2023 01:29:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjDRB3W (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 17 Apr 2023 21:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbjDRB3W (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 17 Apr 2023 21:29:22 -0400
Received: from ubuntu20 (unknown [193.203.214.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1669B5B97;
        Mon, 17 Apr 2023 18:29:11 -0700 (PDT)
Received: by ubuntu20 (Postfix, from userid 1003)
        id 666C0E1AB8; Tue, 18 Apr 2023 01:29:10 +0000 (UTC)
From:   Yang Yang <yang.yang29@zte.com.cn>
To:     willemdebruijn.kernel@gmail.com
Cc:     davem@davemloft.net, edumazet@google.com, jiang.xuexin@zte.com.cn,
        kuba@kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
        pabeni@redhat.com, shuah@kernel.org, xu.xin16@zte.com.cn,
        yang.yang29@zte.com.cn, zhang.yunkai@zte.com.cn
Subject: RE: [PATCH linux-next 1/3] selftests: net: udpgso_bench_rx: Fix verifty exceptions
Date:   Tue, 18 Apr 2023 09:29:10 +0800
Message-Id: <20230418012910.194745-1-yang.yang29@zte.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <643d62b28e413_29adc929416@willemb.c.googlers.com.notmuch>
References: <643d62b28e413_29adc929416@willemb.c.googlers.com.notmuch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

> Why are you running two senders concurrently? The test is not intended
> to handle that case.

Sorry for the inaccuracy of the description here, these two commands,
i.e. with or without GSO, cause the problem. The same goes for patch 2/3.
The problem is easily reproducible in the latest kernel, QEMU environment, E1000.

bash# udpgso_bench_tx -l 4 -4 -D "$DST" 
udpgso_bench_tx: write: Connection refused
bash# udpgso_bench_rx -4 -G -S 1472 -v
udpgso_bench_rx: data[1472]: len 17664, a(97) != q(113)

bash# udpgso_bench_tx -l 4 -4 -D "$DST" -S 0
udpgso_bench_tx: sendmsg: Connection refused
bash# udpgso_bench_rx -4 -G -S 1472 -v
udpgso_bench_rx: data[61824]: len 64768, a(97) != w(119)

In one test, the verification data is printed as follows:
abcd...xyz
...
abcd...xyz
abcd...opabcd...xyz

This is because the sender intercepts from the buf at a certain length,
which is not aligned according to 26 bytes, and multiple packets are
merged. The verification of the receiving end needs to be performed
after splitting.
