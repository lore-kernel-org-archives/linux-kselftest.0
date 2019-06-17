Return-Path: <SRS0=0pd1=UQ=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97C2C31E5D
	for <linux-kselftest@archiver.kernel.org>; Mon, 17 Jun 2019 21:31:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 718F6204FD
	for <linux-kselftest@archiver.kernel.org>; Mon, 17 Jun 2019 21:31:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="ekfJbdkb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728930AbfFQV2h (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 17 Jun 2019 17:28:37 -0400
Received: from st43p00im-zteg10071901.me.com ([17.58.63.169]:58259 "EHLO
        st43p00im-zteg10071901.me.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730252AbfFQV2h (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 17 Jun 2019 17:28:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=04042017;
        t=1560806916; bh=VgVvgLo7/NN7awKYf4il937sjMZlqMUPOlss7/oCmfQ=;
        h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To;
        b=ekfJbdkbUjunD9VTKtiKnER3Ai7pR5WcMmvWkW0Q4V+dzG5AQZjCK0oJ4WBRY+v5V
         c2fNv6M8xoY2bOi6sIkzr1mqgIzUJzwOsVewyXfLMS7dA6roe+2gkX0gQrF6EJe3Zf
         KDHi0WP8LoSSC28mXqD2xjYqgL5sc/g+NkNTI2vrw4xjJymYSQoiEaevZG40fnlO28
         QITWuvIxuqQugtLsxS/MbvAbBHh+lug1T8y2qOglXzYgp4+D1o7DhKY8vn9hAf3qjw
         dX5Z3b6LsAUdJEzfGaFumXgFIt+P9kr9jhsN/R7eTEsOELbTQhM46/ck5u26DcrMqA
         9LF6OBBXGWj3A==
Received: from [172.20.98.6] (unknown [89.246.150.90])
        by st43p00im-zteg10071901.me.com (Postfix) with ESMTPSA id C5064D8120F
        for <linux-kselftest@vger.kernel.org>; Mon, 17 Jun 2019 21:28:35 +0000 (UTC)
From:   Christian Clauss <cclauss@me.com>
Content-Type: text/plain;
        charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Fixing Python 3 syntax errors in tpm2_tests.py
Message-Id: <B021B4EF-903E-4EA2-9B2B-0B0301D28DE7@me.com>
Date:   Mon, 17 Jun 2019 23:28:34 +0200
To:     linux-kselftest@vger.kernel.org
X-Mailer: Apple Mail (2.3445.104.11)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-06-17_08:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=712 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1812120000 definitions=main-1906170187
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hello,

    As my very first contribution to the Linux Kernel, I would like to =
fix six Python 3 syntax errors in the file =
./tools/testing/selftests/tpm2/tpm2_tests.py

    All six of these errors are of the same form: except ProtocolError, =
e:  To fix the syntax errors, I propose to change the comma (,) to =
=E2=80=9Cas=E2=80=9D like:  except ProtocolError as e:

    These changes are important because the current form is compatible =
with Python 2 but is a syntax error in Python 3.  The proposed form is =
compatible with both Python 2 and Python3.  This conversion is required =
because Python 2 will reach its end of life in less than 200 days.

    The kernel contains at least five other files where I am able to =
detect Python 3 syntax errors but after studying in detail the process =
of making kernel modification, I believe that it is best to start with =
tpm2_tests.py because the changes are straightforward and =
uncontroversial =E2=80=94 all issues are of the same form, and I can =
detect no other issues (such as undefined names) to fix in that file.

   If I succeed in getting the modifications to tpm2_tests.py through =
the review process then I can try the remaining files in turn.

   I would be interested to know if this is a worthwhile effort.  Is =
there already another initiative to resolve these issue before yearend?

   Thanks for any advise that you can provide, Chris Clauss=
