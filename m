Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 109FAC4332F
	for <linux-kselftest@archiver.kernel.org>; Wed, 18 May 2022 16:27:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240110AbiERQ11 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 18 May 2022 12:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240130AbiERQ1X (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 18 May 2022 12:27:23 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9A5E73560;
        Wed, 18 May 2022 09:27:18 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 66E611F9B6;
        Wed, 18 May 2022 16:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1652891237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=XLTN/Tyn39JkGpccdAmra/lF39sYZV7UHDSVbCDu1pc=;
        b=nQNr7q5XIBVXWZ116vtSd5c5aic11kH5TURBVUDGlRg9dy5U/qjciTyPzRdccf2D75d6Yy
        P4inQtN7tVXPlNqL+yMiXOpRZ3JbQ+14erX3eLjbG4AQUJ8nSsTGZzK3AjI15fLP66/+pf
        pAhAb8TN+XNUM4L8TtuQXguOtzQ1cNA=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3028813A6D;
        Wed, 18 May 2022 16:27:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id UUSsCmUehWJNaAAAMHmgww
        (envelope-from <mkoutny@suse.com>); Wed, 18 May 2022 16:27:17 +0000
Date:   Wed, 18 May 2022 18:27:15 +0200
From:   Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
To:     cgroups@vger.kernel.org, linux-mm@kvack.org
Cc:     Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Shakeel Butt <shakeelb@google.com>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Richard Palethorpe <rpalethorpe@suse.de>
Subject: Re: [PATCH 0/4] memcontrol selftests fixups
Message-ID: <20220518162715.GD16096@blackbody.suse.cz>
References: <20220518154037.18819-1-mkoutny@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220518154037.18819-1-mkoutny@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Apologies for spam due to botched sending.
Please disregard this (old) series.
The replacement should come in

https://lore.kernel.org/r/20220518161859.21565-1-mkoutny@suse.com

(That one is also not 100% correct, it's missing a Subject: therefore
may not be pass through some filters.)

The 1st patch of that v2 series is at
https://lore.kernel.org/r/20220518161859.21565-2-mkoutny@suse.com/

And I copy the cover letter here to be sure (and not to spam even more).

---->----
Subject: [PATCH v2 0/5] memcontrol selftests fixups

Hello.

I'm just flushing the patches to make memcontrol selftests check the
events behavior we had consensus about (test_memcg_low fails).

(test_memcg_reclaim, test_memcg_swap_max fail for me now but it's present
even before the refactoring.)

The two bigger changes are:
- adjustment of the protected values to make tests succeed with the given
  tolerance,
- both test_memcg_low and test_memcg_min check protection of memory in
  populated cgroups (actually as per Documentation/admin-guide/cgroup-v2.rst
  memory.min should not apply to empty cgroups, which is not the case
  currently. Therefore I unified tests with the populated case in order to to
  bring more broken tests).


Thanks,
Michal

Changes from v1 (https://lore.kernel.org/r/20220513171811.730-1-mkoutny@suse.com/)
- fixed mis-rebase in compilation fix patch,
- added review, ack tags from v1,
- applied feedback from v1 (Octave script in git tree),
- added one more patch extracting common parts,
- rebased on mm-stable bbe832b9db2e.
----<----
