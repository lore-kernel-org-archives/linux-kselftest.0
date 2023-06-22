Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FB9EB64D8
	for <linux-kselftest@archiver.kernel.org>; Thu, 22 Jun 2023 05:51:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231138AbjFVFvt (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 22 Jun 2023 01:51:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230506AbjFVFvo (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 22 Jun 2023 01:51:44 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E8F1FCE;
        Wed, 21 Jun 2023 22:51:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C9804616CB;
        Thu, 22 Jun 2023 05:51:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB517C433C0;
        Thu, 22 Jun 2023 05:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687413100;
        bh=NTX7VWfLGARQLJisvkuE+QEyr+YuxA7almFhy0ABrCo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=qDcVXhCvSdfvn0Wr5RULHFSTqbKzV7odP/DcQtdYc10orLyvIyfNmL/DlTaFFA5OT
         Y8ovDN/Q+wEfXae+H8Rm7UbEK/HUk7T4CATn1+0Wuql2CSdY/IbD8rd6jtpz/DwgfQ
         HmMmlWjW1O8EytfJUZkZADOpRY5G1KlF3FBE6z6SnelHQQYSy6paQqz5/JOo9urFT/
         VUJX1EBhovNz9kDUhhHpvQCt7CJJp2uaWpnK9kHxzs+I8Aj3NbXhlUBxnw5O9yEVY6
         oqhuV9JGcSHY6Qu4syQnDYapDqUAqCfR2VEGxsyXl6fwrelDvmQbI1nD0G8yciIFJA
         Z9eltykgdREwA==
Date:   Wed, 21 Jun 2023 22:51:38 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Matthieu Baerts <matthieu.baerts@tessares.net>
Cc:     mptcp@lists.linux.dev, Mat Martineau <martineau@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 5/9] mptcp: introduce MPTCP_FULL_INFO
 getsockopt
Message-ID: <20230621225138.320b01f1@kernel.org>
In-Reply-To: <20230620-upstream-net-next-20230620-mptcp-expose-more-info-and-misc-v1-5-62b9444bfd48@tessares.net>
References: <20230620-upstream-net-next-20230620-mptcp-expose-more-info-and-misc-v1-0-62b9444bfd48@tessares.net>
        <20230620-upstream-net-next-20230620-mptcp-expose-more-info-and-misc-v1-5-62b9444bfd48@tessares.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Tue, 20 Jun 2023 18:30:18 +0200 Matthieu Baerts wrote:
> information all-at-once (everything, everywhere...)

;]
