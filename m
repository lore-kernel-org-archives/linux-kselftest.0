Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 056F2C6FD1D
	for <linux-kselftest@archiver.kernel.org>; Tue, 14 Mar 2023 13:14:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231561AbjCNNOb (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 14 Mar 2023 09:14:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232242AbjCNNOI (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 14 Mar 2023 09:14:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A41002412B;
        Tue, 14 Mar 2023 06:10:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 83C9D61765;
        Tue, 14 Mar 2023 13:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC1B2C433D2;
        Tue, 14 Mar 2023 13:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678799403;
        bh=y+Mm4syiQyk9+ReFkQ85/jas9rM1bCuG+6K2YWtPQMM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eTpwhRtXO16cDj92+tDLDQSut2EbFbpjfAW7yKtUm9/EdIQjwnHpamaKp7urItELz
         bqoGYcDEPNv7CQVGJmPIQuUI8KQFqT/4zQR8ruFhDtWRsloWNdInqYIhCnls4SzX1z
         ZTILLZeJJTNDsJki8gCtYSA/nGuDAEmxmjeRSepi9SPCOy6diJIJw2rxUtOhRm77r+
         V8BI3cPdgwyAdLyD4kfrILWRgbUu/+YAlukrirPUHmvu98OF/OG+dBxqDg+UpJU1kg
         ZcH5IWclu6f5gUcj5Uuj9GikxdEiXf2/h2tuLCHlncckLNelTekpu/YLjEir4sYaEp
         xxr8/npfmedUg==
Date:   Tue, 14 Mar 2023 14:09:59 +0100
From:   Christian Brauner <brauner@kernel.org>
To:     Tobias Klauser <tklauser@distanz.ch>
Cc:     Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests/clone3: fix number of tests in ksft_set_plan
Message-ID: <20230314130959.7gfuagxta6k423kf@wittgenstein>
References: <20230314115352.20623-1-tklauser@distanz.ch>
 <20230314123414.26907-1-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230314123414.26907-1-tklauser@distanz.ch>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Tue, Mar 14, 2023 at 01:34:14PM +0100, Tobias Klauser wrote:
> Commit 515bddf0ec41 ("selftests/clone3: test clone3 with CLONE_NEWTIME")
> added an additional test, so the number passed to ksft_set_plan needs to
> be bumped accordingly.
> 
> Also use ksft_finished() to print results and exit. This will catch future
> mismatches between ksft_set_plan() and the number of tests being run.
> 
> Fixes: 515bddf0ec41 ("selftests/clone3: test clone3 with CLONE_NEWTIME")
> Cc: Christian Brauner <brauner@kernel.org>
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> ---

Looks good. Thanks for fixing this,
Reviewed-by: Christian Brauner <brauner@kernel.org>

Feel free to take this through the selftests tree, Shuah.
