Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485C635DA61
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 04:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785127021; cv=none; b=QlPpIPAcNMsSck/uffgPRGIggSUhOq2J8mlavGxNl6lK8aF/85MwKqt3vQ21mLGbKs8B2lOx9PXjcf92S7DDfnlN4u+TWoKG0iQFvfYesj99soBt/nyjQ86MNti+lFBFjVZE16IjN0c2hd6CYkcmmP8TpHQ5GA8x5AcKZEMuqz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785127021; c=relaxed/simple;
	bh=x3CMmikYyScJCif71CpM74tv4qZCOikvVwnqpqw8/TQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sVln/Lth4kV/+OEoCstsaWg3yisMgFA5GADPMKc2k6TMy3HW2irYhSo7v5sPxTI9A0QhJh3teR0CBf52WF5/RrQwlbltgeTUTOIWtewQOGjBkTWCBofcuIRJO+77B+8IqScj2+Olo+ti6JrJsrfuZ3z1CgYSKSrSqc97+PG1BZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CsAjs16M; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CsAjs16M"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cacb8416a1so20523885ad.1
        for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 21:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785127020; x=1785731820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D72PoV+31aRv0SZZwCv/46Mi1LQWMPnWSHyMaofDuXg=;
        b=CsAjs16MdpiOubyNc0VKgEqyjbP6WOLxWSYvUhefgU6tWAmdpHLpIDtGa8W0nE3erI
         qTOjbEckXZ1t0ybtYP8L/GsJeWUycP+NlKyJAe+xXqEsmVvdFwXcAYwP0yhKd816dwoo
         nROhoaBy44r3y33M+oC/v+f3REYP5MPhCGeK2FPF/8WL7zDMacLFCfKN0U2dReJf1Pt5
         6gUnHkw3KJ4avLTlgiNKw1srtFF7eaDVPJYMXL/v8i8furW7VpD2dIj0J1wyWG3Xd+aW
         5txCRZKcswJR+FfR23LnBcwsWMubOzdgoj+F+mvDquEPLARDTCIZ/WuuC7HirkutdtS7
         MqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785127020; x=1785731820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D72PoV+31aRv0SZZwCv/46Mi1LQWMPnWSHyMaofDuXg=;
        b=MhJmGq9wPdUdk8DaepS6aE0311zy8dg1NWQ/Vnealhi9EhUVVF/cVR/s0dGPnBROMq
         Ict2oMZlfYQ/mNdPc8uGuXnvgik1oGYYuvEVVYC3WrB1bA+q/pUiZp7kLjzmUWM08Akh
         324+SOg4OT1kGDlHX2CyqBkZLl6l7Hua2KGo6XUpRkVD2JxTQnxNfn5LQPJQatx6vTF8
         rnvEutQtqAecJUcZsEdwRWbgo+W120bQ6wpzjVfe8hZycxkYfonSjxtYtf30qOkblxQ1
         wPQQwVTSKKyPbc/cWP1CXQbz5qkUEoGeQbHqe5XS8hJ0ZkGBeULgql7LIAq4mX4pkG+8
         vBBg==
X-Gm-Message-State: AOJu0YyFY2Fn9GubbjRJOG42tqvUgf5mDze826Os8TAyZMKLa8nwe3CO
	Q+X5+idvX2riOJWGbIeTDkWWFz1dv2qNqZibOdsVi2bi1vkmMNVvJqZO
X-Gm-Gg: AR+sD12cjqjpHaOTZhuTQAzR9fQ9QEiv0YwvjmQZu+LBCGmSTTqtbbhi6oT3w4+6WNy
	7gzSOxs7BtyTxRKYl++spieqxhv8vkxOaWsb8TKhON+FyUY8fSRUuMmcCxgZAl4jWa0fT12wkfN
	ccmUgRJ/5gTPuSDPszrPn/BrrWaHdcXA391wO2YGfManxuUaG8tcPovoZyPiuTC8cQ6htf4fOWs
	VG+UCXdgaSqEDN1+gyTemAl+DAL+BbDiNn1NB5l/4YSFfDbPhnS4kanNMqKReIfGyUvkltEVOf2
	CunI7bAZghRFl1ENrkSUOb6/GKBApcGYrbltYcd6ExQL8DSvu95kXqSK9XIlTiBWSouxvaO91SC
	Y+tstkoXaK7pY3+KHFA4chV6BD19PR4n4l6Da8Y8uCG6QbfiXyxUSwOE3qLgQjMuDhZzHY2mkXR
	hwCa8=
X-Received: by 2002:a17:902:d2d2:b0:2c9:aae1:a61c with SMTP id d9443c01a7336-2cfde7af8b3mr63097895ad.20.1785127019581;
        Sun, 26 Jul 2026 21:36:59 -0700 (PDT)
Received: from marceloPC ([2804:1b3:a8c2:99cf:6381:2414:ebe3:a179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc4164ddsm26249985eec.9.2026.07.26.21.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 21:36:59 -0700 (PDT)
From: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
X-Google-Original-From: Marcelo Mendes Spessoto Junior <marcelospe@proton.me>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	Marcelo Mendes Spessoto Junior <marcelospe@proton.me>
Subject: [PATCH net-next 0/4] net: selftests: adjustments to ipv6_flowlabel_mgr
Date: Mon, 27 Jul 2026 01:25:06 -0300
Message-ID: <20260727043516.93101-1-marcelospe@proton.me>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ipv6_flowlabel_mgr test file was lacking coverage for the IPV6_FL_A_RENEW
action, and the IPV6_FL_F_REMOTE and IPV6_FL_F_REFLECT flags. The first
three patches from this set aim to add a proper test case for each.

The fourth patch proposes the adoption of "kselftest_harness.h" helpers,
improving code readability and conforming to the implementation of the most
recent selftests.

Marcelo Mendes Spessoto Junior (4):
  selftests: net: test IPV6_FL_A_RENEW
  selftests: net: test IPV6_FL_F_REMOTE
  selftests: net: test IPV6_FL_F_REFLECT
  selftests: net: adopt harness for flow label mgr

 .../selftests/net/ipv6_flowlabel_mgr.c        | 450 +++++++++++++-----
 1 file changed, 330 insertions(+), 120 deletions(-)

-- 
2.55.0

