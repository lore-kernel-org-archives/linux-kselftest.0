Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46479C433F5
	for <linux-kselftest@archiver.kernel.org>; Wed,  6 Apr 2022 05:21:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235825AbiDFFWw (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 6 Apr 2022 01:22:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1587547AbiDFAJi (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 5 Apr 2022 20:09:38 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B549DE08E;
        Tue,  5 Apr 2022 15:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=s5Rv2jt7aGLImfLJIiM/5w3K8YUbSOEx+pvCk6I5VMo=; b=rqdoUew930ZZ6zrAnlfvmOF/zf
        +YntEDiQq+lDqmtSifeD/BGDKf4g7GkHYLxudkmzdyK5cgH/wZucpnSc1cOEeqX5tzdZylyEm9uz5
        KjdjRJUUJa9gUj9572C6PlpVQLKxTlLKuASQa0lhQMLBp52OQqySbhM/BMq/qghF0J67yro+frIqg
        XoDZgXOLgGwC3tfbvt999mOTUy6LqjcaDRWq7nkQZS2B3zJXHLy8ItBQFTzk4vxBpz7SFXJ3cmjCe
        SB/I/ptIkVnavZf3lWoOGDw3MGZDfUUipM9KeUyy8WAfhHKBIIH3x+GfmL+nyBA2iw4nUlGS8cNsW
        Tu+LgHDw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nbrjU-0077Ix-P6; Tue, 05 Apr 2022 22:33:04 +0000
Date:   Tue, 5 Apr 2022 23:33:04 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Sidhartha Kumar <sidhartha.kumar@oracle.com>
Cc:     shuah@kernel.org, akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftest/vm clarify error statement in gup_test
Message-ID: <YkzDoBUAhydtvnR0@casper.infradead.org>
References: <20220405214809.3351223-1-sidhartha.kumar@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220405214809.3351223-1-sidhartha.kumar@oracle.com>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Tue, Apr 05, 2022 at 09:48:09PM +0000, Sidhartha Kumar wrote:
> -		perror("open");
> -		exit(1);
> +		switch (errno) {
> +		case EACCES:
> +			if (getuid())
> +				printf("Please run this test as root\n");

Shouldn't all these be fprintf(stderr, ...); ?

