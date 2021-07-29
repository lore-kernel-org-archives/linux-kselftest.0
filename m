Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2158C4338F
	for <linux-kselftest@archiver.kernel.org>; Thu, 29 Jul 2021 05:55:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A44C61059
	for <linux-kselftest@archiver.kernel.org>; Thu, 29 Jul 2021 05:55:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbhG2Fza (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 29 Jul 2021 01:55:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:59712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233899AbhG2Fza (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 29 Jul 2021 01:55:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0051061053;
        Thu, 29 Jul 2021 05:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627538127;
        bh=ObnkQ2ekSkknguegUJ7oExEOcolBoewZBGjOauRDd3I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lh1TFgzO8hSkhAVPKwCAi4BlEo6JyDRjaF3INXNV0sbrenyNlfF+oMRuMyYpj0CDK
         EKWd9LZ0ZdyQCX1WVCkf6SH0fQiZcWiAK4y9OemniNcWgeLYVRnKEuZesGhXuG0BN5
         ZLB83ZvZJ8r5mqWp18L9iihqVZCNghZMGDKDbaqE=
Date:   Thu, 29 Jul 2021 07:55:22 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Bart Van Assche <bvanassche@acm.org>
Cc:     Christoph Hellwig <hch@lst.de>, Joel Becker <jlbec@evilplan.org>,
        linux-kernel@vger.kernel.org,
        Brendan Higgins <brendanhiggins@google.com>,
        David Gow <davidgow@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        Bodo Stroesser <bostroesser@gmail.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Yanko Kaneti <yaneti@declera.com>
Subject: Re: [PATCH v2 2/3] kunit: Add support for suite initialization and
 cleanup
Message-ID: <YQJCyigNroTl8J/l@kroah.com>
References: <20210729044125.7435-1-bvanassche@acm.org>
 <20210729044125.7435-3-bvanassche@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210729044125.7435-3-bvanassche@acm.org>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, Jul 28, 2021 at 09:41:24PM -0700, Bart Van Assche wrote:
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> Cc: David Gow <davidgow@google.com>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: kunit-dev@googlegroups.com
> Cc: linux-kselftest@vger.kernel.org
> Cc: Bodo Stroesser <bostroesser@gmail.com>
> Cc: Martin K. Petersen <martin.petersen@oracle.com>
> Cc: Yanko Kaneti <yaneti@declera.com>
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---

I know I do not take patches without any changelog text.  Maybe other
maintainers are more lax :(

