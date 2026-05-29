Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A766285CB6;
	Fri, 29 May 2026 03:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780024497; cv=none; b=WguKH0jE2XOlckVyI4sQwUAo4Mlu7/7eMeJYV3QkR+TDMWrkDMYlZbc0JD97tRF4UcS4N/7ygPTyJUn00FgxxXpjFL10PRUAIEQ0uhXP7kOiu8oOjZ7ZU6llCr4ETRLIOZNOQZ+XuPX1fpRajGIJDdGJsxi7J8kqAd54mbKZwuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780024497; c=relaxed/simple;
	bh=P159uH2GnHpx1f/K6RIp2Ng/JOidNMBccUc3c8UJwe8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r7Ubi9uySkaoe1pjvWwDFv706vFZxCOpw5dse9JCiVaTIKlJeonuqZJliGTCxlReQ8UXOBSxujZ2kJxRnCfTHamDG6OiaWJNzNX1vHU+ESIBwDG/TnuVcf2srz+r0yaNji0yPGdriGAd3qhquOgnWXuyxcYEldg68CTBCAcI9GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=hSygT6wp; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="hSygT6wp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1780024439;
	bh=CU69WStLtGAWmV5p5leKWoSrd8qZoQFw5WIljhNTZh0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=hSygT6wphI3wHyqn2S439qQWo8bidGk5lgSBf81Q+ScAh8Aki8SQDpY49m7swqhEY
	 CPP2ODlBkppIECSuWgON5aDMWCDN65Tzhcbe1sYxm3otYaWxg1YYHw9jPYYsSJ3lXt
	 rMvEfbe4IdiNcEhDHmF+u69nzvbV+fpa7H9Lf1rE=
X-QQ-mid: zesmtpsz4t1780024428t02c7e8c4
X-QQ-Originating-IP: QkKCqQClWI3qa0TeV9Rf59jWGZpwIZjpbR9H8YeNnRY=
Received: from PEN1097 ( [61.183.83.60])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 29 May 2026 11:13:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15054842607548688614
EX-QQ-RecipientCnt: 8
From: Cheng Nie <niecheng1@uniontech.com>
To: sj@kernel.org
Cc: damon@lists.linux.dev,
	kernel@uniontech.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	niecheng1@uniontech.com,
	shuah@kernel.org
Subject: Re: [PATCH 1/2] selftests/damon: fix DamosFilter memcg_path assignment
Date: Fri, 29 May 2026 11:13:45 +0800
Message-ID: <26BC7B013363FF9E+20260529031345.1560812-1-niecheng1@uniontech.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260528141718.153376-1-sj@kernel.org>
References: <20260528141718.153376-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: OTaQrRjuGKLtqc26YYXlCWeHHJsRFoYs/0zz9UziTbwRPwFDTnbN423Y
	qw2PULOGw04SIdsw0ouoK1RbQqYKPhq1GuHkUL2VyDzBKcCEexP5AVxgb5WTiRyL9jAkdEm
	Z/ZxnOdUvGXFS6UqA2SYv8j5UmHyXScHkMgAHZTkJNeIv1LxdUnVPI8Ynm+k50CIq9RKoB6
	8n7y2HA6xwW+BJ+CfVudFcPaFiB8n9HSogy0LIJF0aohuZCD+LH7Oa1BYv41AJx4l77geoh
	08DgCG/D7ICXnyWgZMQ7YasGQDKPxiDLZgfH/VrsaJOXjISiaz613fYSeYLmBecQe/DLoA+
	y4ixdjGh4ykf5zQofyOQQc8wiKakOoO3kMS3qRBWRoiOHbvhVbnoaErkxOPIYpEzKdaAVtR
	QnrHJF888+GIhVC5Y9KqbJD0fDTIzQ1C6dDeaO0UxFV2AleH6hkoYCQRYjT5DhcZ4zQDN3p
	jzzq3QobW/nnB3ZPb9scHrUzja5c7mkMBXnFWSQd6dWLKuqmAvvii+yvt9OqNc57oSD30Si
	PeNdHAP+E5zS+43d4uaHnSJd3uHbWX3URnSJcN4IgL5fhIu4vi6SZQZDLQjM6j59OcE5i37
	5VvK3DJFDxPuiIGoAUTztBsfFQd5u+fo7KQ5hXDdtBdvEcqyP3aaXeAwExV33blpqD11aPf
	a01Wm4oFCP0fiWleJikmzMkCvvcaw1nlV11cG3Sf/9NaUmvrELDeL8gSvfdz9mRi19w1iyj
	XU+DKDFY09VXJEXmvbj1re2iuLIA+4pClTpPV7FipJkE1y2KkiCiPLBDnZtOx6nJ6vpZBua
	ootFcF20rM2ZOT+oapxZQkmAO5QoNAtWVtNcNnqCk4l/89EWfvVlBT3lJKyx9hZEp/Hn5qi
	OMke4sPimc4/IbAL/0sm3keu2PbM2xfGyqzRWRCoN2CHbDOc+fN9ryjyJbXFh64TFmcq70x
	8guY0DoDUBMsHQEYYm+0zNBfRUz3ssnNpyyWVIMvdEd1qb4uZ0jlmPnBpVPKrt/WE033rTi
	IkUZnSr7vx5pxsrLop2b2yZoVtajM=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

On Thu, 28 May 2026 07:17:17 -0700 SeongJae Park wrote:

> Could you please update the subject to 'selftets/ddamon/_damon_sysfs.py'?

Will do in v2.

> From the git log, I found it seems you also use 'Cheng Nie' as your name.
> Are you intentionally use 'niecheng' as your identity?  We disallow
> anonymous but allow using known identity, so I'm just checking if this
> is an unintended mistake.  Some of us (mm community) prefer real name,
> though.

Sorry for the confusion.  In China we usually write names with the family
name first (Nie Cheng), while the Western order is Cheng Nie.  I had
also used "niecheng" as a compact form from my email username, which
was not ideal for upstream.  I will use Cheng Nie consistently from
v2 onward.

> The change looks good!

Thank you!

Thanks,
Cheng Nie
