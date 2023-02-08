Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D57C636CC
	for <linux-kselftest@archiver.kernel.org>; Wed,  8 Feb 2023 02:50:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbjBHCuj (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 7 Feb 2023 21:50:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbjBHCui (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 7 Feb 2023 21:50:38 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72CD53A5B9;
        Tue,  7 Feb 2023 18:50:37 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3297FB81B9F;
        Wed,  8 Feb 2023 02:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53E1BC433EF;
        Wed,  8 Feb 2023 02:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675824634;
        bh=EsdUvUnsKmMemMZaNXIPL1IYgfWB0RQmumAxlECKXB0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z35xZbNhlRT32hTqjlK5S+QStn/nB26MIvW4Va4fuYoNkvAah172xz1q/vwYUpL81
         nU43MgvG8+LQ08m9HFaPlSgN0BOkbLBpuaz6+EgftBpk1rIU27R0qX1itntKSAJuxR
         ebvpsm8eoNEs3lOGDAVL13qV7RfFqCEzfTmeReM6MUcSnP/iXfpda5YV/1FzLkfcyE
         tKCAN024zLvxNKSTKkH986RgJ41Pzvu/3a+qWV6kxQQbzt0MBefrU3ljDZLLbjeNZr
         7UUJ/ijhs1VT8po5SPukfcx8mtUNp2DfOluV33+hAnkwRr1vQdSsBZd5qXPwAeZbAH
         7YhVxauYjVE6g==
Date:   Wed, 8 Feb 2023 04:50:29 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Tzung-Bi Shih <tzungbi@kernel.org>
Cc:     shuah@kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: tpm2: remove redundant ord()
Message-ID: <Y+MN9eoCsEPo/oVK@kernel.org>
References: <20230203101430.901476-1-tzungbi@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203101430.901476-1-tzungbi@kernel.org>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Fri, Feb 03, 2023 at 06:14:30PM +0800, Tzung-Bi Shih wrote:
> When testing with FLAG_DEBUG enabled client, it emits the following
> error messages:
> 
> File "/root/tpm2/tpm2.py", line 347, in hex_dump
>     d = [format(ord(x), '02x') for x in d]
> File "/root/tpm2/tpm2.py", line 347, in <listcomp>
>     d = [format(ord(x), '02x') for x in d]
> TypeError: ord() expected string of length 1, but int found
> 
> The input of hex_dump() should be packed binary data.  Remove the
> ord().
> 
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
>  tools/testing/selftests/tpm2/tpm2.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/tpm2/tpm2.py b/tools/testing/selftests/tpm2/tpm2.py
> index c7363c6764fc..bba8cb54548e 100644
> --- a/tools/testing/selftests/tpm2/tpm2.py
> +++ b/tools/testing/selftests/tpm2/tpm2.py
> @@ -344,7 +344,7 @@ def get_algorithm(name):
>  
>  
>  def hex_dump(d):
> -    d = [format(ord(x), '02x') for x in d]
> +    d = [format(x, '02x') for x in d]
>      d = [d[i: i + 16] for i in range(0, len(d), 16)]
>      d = [' '.join(x) for x in d]
>      d = os.linesep.join(d)
> -- 
> 2.39.1.519.gcb327c4b5f-goog
> 

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko
