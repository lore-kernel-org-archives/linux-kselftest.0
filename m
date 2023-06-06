Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29CC3C7EE2A
	for <linux-kselftest@archiver.kernel.org>; Tue,  6 Jun 2023 18:48:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239082AbjFFSsG (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 6 Jun 2023 14:48:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238904AbjFFSsF (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 6 Jun 2023 14:48:05 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E6BEA;
        Tue,  6 Jun 2023 11:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=CLlX0vggMROMtuqvN2c1dj9w/eUmy+R/m6XCbHJiuHU=; b=q19aI4oE+OYFJEiFSUfnZCHRem
        Rg77BMJz0qwU8mdJdu5sE7SuM3oNKzVducd2u0+mrDXqcJyvZg4Km/bek/Tgdsw7nVet/kOaHjMcO
        LkVKFZpGLNqmWcm4jMCOlYQcw+Z4dEdgMQXl1bf1J7vKQ3elP7q1VVxxsuZ2UNUU/Lf3H3VkcoglP
        5g6eYrmxBScK5LD1z/9qfj+h8u+V+qbrc2qNul11Poy+qe3YkkHqPZiGOVnEyM0RzcyMZwfZXn1uL
        h9bdySazRx6xvkGc9Mz0PE54OY0bFd8EfrDt09xbrWAaANd7JaWpgg6PdFqsOdObFjG/wp8g7CM8g
        YCOTMQ8Q==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
        id 1q6bil-002oDx-1W;
        Tue, 06 Jun 2023 18:47:55 +0000
Date:   Tue, 6 Jun 2023 11:47:55 -0700
From:   Luis Chamberlain <mcgrof@kernel.org>
To:     Joel Granados <j.granados@samsung.com>
Cc:     kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
        lkp@intel.com, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 6/8] test_sysclt: Test for registering a mount point
Message-ID: <ZH9/WxPIPj2y2PkO@bombadil.infradead.org>
References: <CGME20230604144143eucas1p1ba7a3773905187be28571e973ef6e118@eucas1p1.samsung.com>
 <202306042234.f2d7beff-oliver.sang@intel.com>
 <20230606092717.uesyzrptbsbzefbq@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230606092717.uesyzrptbsbzefbq@localhost>
Sender: Luis Chamberlain <mcgrof@infradead.org>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Tue, Jun 06, 2023 at 11:27:17AM +0200, Joel Granados wrote:
> On Sun, Jun 04, 2023 at 10:41:05PM +0800, kernel test robot wrote:
> @mcgrof: Can we just ignore this 0-day report as a false positive?

Yes, thanks for highlighting it.

 Luis
