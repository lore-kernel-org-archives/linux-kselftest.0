Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F691C7112B
	for <linux-kselftest@archiver.kernel.org>; Fri, 18 Aug 2023 08:57:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358797AbjHRI43 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 18 Aug 2023 04:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358793AbjHRIz4 (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 18 Aug 2023 04:55:56 -0400
X-Greylist: delayed 1202 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 18 Aug 2023 01:55:55 PDT
Received: from mail.leachkin.pl (mail.leachkin.pl [217.61.97.203])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C22E3A94
        for <linux-kselftest@vger.kernel.org>; Fri, 18 Aug 2023 01:55:55 -0700 (PDT)
Received: by mail.leachkin.pl (Postfix, from userid 1001)
        id 0DEE48480C; Fri, 18 Aug 2023 09:16:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leachkin.pl; s=mail;
        t=1692346632; bh=elHzctRz/z3PfTIhGYJKd0TeBTmca98Y+JNgX4gfsPI=;
        h=Date:From:To:Subject:From;
        b=T7YhCyEej6Vl7zrvGLJd02AJPsCmnDz+ogX2BUaKjjHSyTgs1y05S4LMdiDYn3bnZ
         nSy5RfGZw6hYjqfqOXsxLKrIMDU54yjEFKMrhyEDhZqdNTAohdB3zu75Q2HdLdDUYw
         9juzipxcRgtb5tNx1oPSkdpDh44QhR+HGKvryhCMKMxPDWC3Ufq83w7gly+7d6i77S
         E7caMUHbZcw3X3MMTh1Pe0NTL1jBHfL2ZGCvJ2TMIAdN54cKfwq1sJYbQWj5ThjYI5
         Ht/yEkj+noFl0Lj4bCf96iVsUxGap6I2x/kXX342X3/bHfclXSdImyJPwLXrTmo1L8
         ANEgs1VvI4uJw==
Received: by mail.leachkin.pl for <linux-kselftest@vger.kernel.org>; Fri, 18 Aug 2023 08:15:51 GMT
Message-ID: <20230818074501-0.1.4u.cuoa.0.07rq4ew5sl@leachkin.pl>
Date:   Fri, 18 Aug 2023 08:15:51 GMT
From:   "Jakub Lemczak" <jakub.lemczak@leachkin.pl>
To:     <linux-kselftest@vger.kernel.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d?=
X-Mailer: mail.leachkin.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Dzie=C5=84 dobry,

Czy interesuje Pa=C5=84stwa rozwi=C4=85zanie umo=C5=BCliwiaj=C4=85ce moni=
torowanie samochod=C3=B3w firmowych oraz optymalizacj=C4=99 koszt=C3=B3w =
ich utrzymania?=20


Pozdrawiam,
Jakub Lemczak
