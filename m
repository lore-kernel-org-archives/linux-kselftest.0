Return-Path: <SRS0=V/Vv=YP=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B8ACA9EA0
	for <linux-kselftest@archiver.kernel.org>; Tue, 22 Oct 2019 21:34:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2CF3D20679
	for <linux-kselftest@archiver.kernel.org>; Tue, 22 Oct 2019 21:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571780092;
	bh=jUbjg4767/wv+j5lNCFdODv+1JBsU0jaX9/eKGZSFIM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=ctysoVAM5ndnw3CA/B7Y3CwdjAQ9dcGvTLb+0RQH5QTAeMmc1AYkK1+qQ7edIsWrw
	 H4DRMDR4WhiGkOyT7BZ4b7GrCWNy6jm011Y5ZKQHQTQ9ZqzV7p5XNhi1sbBjb5rJzj
	 l1SsseCWkwvVU7eeIaoKANyY3iU6lZbBuW3b2gk8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732703AbfJVVev (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 22 Oct 2019 17:34:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:36704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731559AbfJVVev (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 22 Oct 2019 17:34:51 -0400
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EF8252054F;
        Tue, 22 Oct 2019 21:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571780091;
        bh=jUbjg4767/wv+j5lNCFdODv+1JBsU0jaX9/eKGZSFIM=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=zWqT3glZNumYk331bSdTaKzH5MY+FKnX+OGvsKMhKQV/QZVw2BTvk/oPqS1fj7Pup
         SQEr/gHWzTGULSnlVPHGkMpHX5vlWWLV05MVKyzy/iPZJfsqDFN/9kiGp2tPFlKk/p
         lbhIpifgdoIbGfIlim4hhg74ysxENvaUwCqmYuGQ=
Date:   Tue, 22 Oct 2019 14:34:50 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     Jerome Glisse <jglisse@redhat.com>,
        Keith Busch <keith.busch@intel.com>,
        LKML <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
        <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH 1/1] mm/gup_benchmark: fix MAP_HUGETLB case
Message-Id: <20191022143450.b3d9caa4f647a63c181e8311@linux-foundation.org>
In-Reply-To: <8892a2be-029b-f8c5-d984-8ff3b5c490ed@nvidia.com>
References: <20191021212435.398153-1-jhubbard@nvidia.com>
        <20191021212435.398153-2-jhubbard@nvidia.com>
        <20191022171452.GA5169@redhat.com>
        <1095fd94-1c0b-de61-7ceb-c963e29575b6@nvidia.com>
        <20191022185701.GD5169@redhat.com>
        <8892a2be-029b-f8c5-d984-8ff3b5c490ed@nvidia.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Tue, 22 Oct 2019 12:39:53 -0700 John Hubbard <jhubbard@nvidia.com> wrote:

> Admin note: this already went into mmotm, so I'm hoping Andrew will notice this
> email and add the Reviewed-by tag, please?

Always. (Well, almost ;))

