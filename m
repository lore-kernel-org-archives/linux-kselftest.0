Return-Path: <SRS0=cfcg=DQ=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6C3AC433E7
	for <linux-kselftest@archiver.kernel.org>; Fri,  9 Oct 2020 00:56:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BD7022254
	for <linux-kselftest@archiver.kernel.org>; Fri,  9 Oct 2020 00:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602204986;
	bh=3Geiek3bGZyHs7vQ54vLrLu+FKf5iDVmdbVNxhGi6IQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=Id7Maq9i3SarWp2nan3iUVi20bPurDe2ZlAsG5AZuLQSo9sXhmSLyWgx8rGM1aRCA
	 jbdirebCGCii4Q1h+GjOKscg+AdOJOwQWQYjD7TovYtpPtjGmJhnIyC/HsImNjpN07
	 /6LqO3MKY1re2oehYnxItzdziGpW3wpgeNyv1c2s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729598AbgJIA40 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 8 Oct 2020 20:56:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:40646 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725979AbgJIA4X (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 8 Oct 2020 20:56:23 -0400
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown [163.114.132.5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5D2B122254;
        Fri,  9 Oct 2020 00:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602204982;
        bh=3Geiek3bGZyHs7vQ54vLrLu+FKf5iDVmdbVNxhGi6IQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=m+Yav6H5w2KdvjsYIc8XPYHNZWsPRQmDyN1CjCWxj8UMDtHrWOEphomtdi0RmIqlh
         x74piA6S0cY2w4BfFLAc9ttrf4C1+tMbEPP17JpzAcEyjmNDqDnaYY8sJptCygU4oD
         55xzLEGUBoeQoTQ6w6Hp2xnh/mLAdVcrJ0CGF1Gg=
Date:   Thu, 8 Oct 2020 17:56:21 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Paolo Abeni <pabeni@redhat.com>
Cc:     Matthieu Baerts <matthieu.baerts@tessares.net>,
        Mat Martineau <mathew.j.martineau@linux.intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
        mptcp@lists.01.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: mptcp: interpret \n as a new line
Message-ID: <20201008175621.6d2f2ddd@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <c750c3256bec4ceab91a95f2725e4bc026f4b5dc.camel@redhat.com>
References: <20201006160631.3987766-1-matthieu.baerts@tessares.net>
        <c750c3256bec4ceab91a95f2725e4bc026f4b5dc.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Tue, 06 Oct 2020 18:12:45 +0200 Paolo Abeni wrote:
> On Tue, 2020-10-06 at 18:06 +0200, Matthieu Baerts wrote:
> > In case of errors, this message was printed:
> > 
> >   (...)
> >   balanced bwidth with unbalanced delay       5233 max 5005  [ fail ]
> >   client exit code 0, server 0
> >   \nnetns ns3-0-EwnkPH socket stat for 10003:
> >   (...)
> > 
> > Obviously, the idea was to add a new line before the socket stat and not
> > print "\nnetns".
> > 
> > The commit 8b974778f998 ("selftests: mptcp: interpret \n as a new line")
> > is very similar to this one. But the modification in simult_flows.sh was
> > missed because this commit above was done in parallel to one here below.
> 
> Acked-by: Paolo Abeni <pabeni@redhat.com>

Applied, thanks!
