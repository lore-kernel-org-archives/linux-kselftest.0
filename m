Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018061;
	b=abgUMa5Rr07vdWMyV0QH57jWMPiPquIei1tx/yz98bR7AeXXlzK5ndMdMSxZEkoK26n7
	 SCPDUZvr18qq6FIK8Vy1zFqrhBD4MNqoU0EdO+dFkI/+89gnpcDLCXsH2azrSDRyYeQLM
	 BHYG6KyKWUz2E/U8wnN/Rwq2gQowIiWz+9ihemSN2w0/SpjjFnJJyrv7AFW+a9n5dHPMb
	 w/OOjtc/xifSzhTxo3h/BEWrkXUMtQg024i4BFkRyaBZt5/7uw/Iol2hJJir05UEuwUaZ
	 EdeOaK+2GUfPZbdB9QJ6mlxBnle6a6o1TtbJz9N7kqQA5ypJntdUVgwAzTsfH5MgpTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018061;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=ujkN+eC6Zu+/+obGmDVtyoxxt+WJSJZ0U/kWRfaBMgw=;
	b=wxwA6D7z1w9ASUTBfi2IP3ALEpVCOGcD+tt98BARdgo7loOC52AoS2I8cYMjG4pIr+OH
	 iZKNOUKOLt68mkphhR7CfceH6QvWnOeCsE/8IU3AWf30aUzDwvRx6QqA1aP4ZTZXjPvs0
	 Xy6+OsDMsg34o95YM9D6PsxIR3MzlUvk3Waw+DZyxTeIQjXSuM29wQT5a1sq8eFw6oJ6R
	 jzyHm84mjN6LS570HM8vl8DoevKJ8DYXyQUiYVbqPJvaxm/an60HzEfTZsZ4m1NiZJ4NC
	 DGFf+zFQbTgpfMJBspuWa5/XvectMBkoS6lxOePEjMjdi67kfo1sD+isLLcuFSHBwhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WW6ACKA7;
	arc=none smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80594606A337
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 16:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80594606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WW6ACKA7
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-71aea92f666so741710eaf.2
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 08:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1795018060; x=1795622860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ujkN+eC6Zu+/+obGmDVtyoxxt+WJSJZ0U/kWRfaBMgw=;
        b=WW6ACKA7UVZiX0KfAzzg+edxiER4uOGUTJowPB7yetEcRNF0o4/Kgsp9BxcVCXTdif
         Tgv4mmpcq1Wmrf7KxcoFOWJZbPQfmjFqlCYt+veaAJCLfJJpjJJ0+pe+WJbg9pSpDyX4
         hEB4mBStC6AtALo5N6bjSJ5/23Si3ahmHjbu+4GyrjanqO9Z9FQL7hr4Y+i5Dj6ojLaN
         f8kgHBRGEQ82u2/SnxNtKDHtkRKPlhx5anbGuZ15xZocj+BHbgcKoOetIUpg1RZEvvJo
         MQ27KN1ViJofCC9c5ILfBA0ZvkCbNS1QGKsj6P7llq7rDd/KfASgsSuCATFnW+exUF01
         J99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018060; x=1795622860;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ujkN+eC6Zu+/+obGmDVtyoxxt+WJSJZ0U/kWRfaBMgw=;
        b=QqYazp6QRLhndeu0u+Q9ZWxdXH4EE9O1xwRLSBUOsnHV3clZIQMlDUT3g1eSRxsOHg
         MjD2L0fR+jvBxZ5AZp7GnbBq/NMxsI5QUCJX0aEOlz1FqXvMxywoaRj3c6v1XFB6In76
         LlzsSpyt8kTSQq5lSdYn892ONZKfKNpKqY5xH9JGcVoJdiF0lu27S9dlOHX8+tPzTfqK
         dJIsEO57Tdul5yc2CeEIOAOn+QSyI48ZzYqOxeA8RN2jBDqANfEgI3BdlKm00NJCjTQx
         efwHBHdH/kbm8NTLnNbhnBDX7fYirmZxN3Cdi6oyvWALGeJnWLmMZ1K0rymyvU/EgFUi
         YNxA==
X-Forwarded-Encrypted: i=1; AL+hErENI7iZXhe48gtsxFW5Vh07CPaQNsczQ2oyedDU2MyiDkQWzPOitFqERxYNPI00hOWdaE6KIx70pmFWxCOmliM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/plR0Amsob5Ht68jbDrmxNYY/vWqVcbdXkk2xQewcU76MHe/RD
	vbatUwScwxwl5zVvsvhGWOUMrI0ooZI2nySO69a7Sw7RSUdTNu1arNylRw4/r0cRbRs=
X-Gm-Gg: AYBFou2I78P3mEQYpJZO/aRk9ej7BEwvyneJgiZSIxB9koJaX/sF5U797nL5+eWojpT
	S5IwRSs00aDlB0jajKlioKJ7qAF5yh3swEECV5B5QUSrEufKLTsmG4eO3DsHu1wTh8DQXOASSek
	cfn/AGexC0NZjF+h9h3P9SFseEdsAbSgEO8a8XdyrUGARLyxPLFg9u3Xv/yQunaLzcGMvPQkMRI
	1R8i5qanBFPMmaC+eM8vSnlM0mfxQeiWAe5jxG8NB2ob9NqbKXmprSbp8Pg7I/2Tag7BuCdFigq
	7Cdv5E3LDsZ6WQRKuHwCviW9X18LHtPr97A1egQfDAp9KMP9Oz+kfaWcFnH+bJltDf/r468xNN7
	C/HfxmqaokKuGmp8vCVufLuW5DnLkCisxDFCf3nuPMfRrzGIWW6FfnQfYTLiEM04Rpdt0uI2gWX
	cex3PLJGA1eXJlXRZi2Yb2b2x3J6mkIUzI8NmvPlB9N/BCcUKb0v20CPTJUHljVyoYTz5YGD37o
	tBV0IK0whFK2egomUOSRhI2HiNQdWBSRk19ct4lXv5KNV+/rHHA8nZkm5Nk+TTBWYTorGhfBKRd
	qBtizg9b+epnALHbndRceWyurTS6fb7gAl/ExvIvnQijbvGDEBcO+5goZv7CLuCuDJmQGOeYID7
	FRYT0JnTdPheYSmZpBa7tS+VsCw0ULHbH/R24mdfRYsdOAFhAExZ8V/C9Mb065mRrjo+1owgB
X-Received: by 2002:a05:6820:807:b0:71a:fa06:4dd7 with SMTP id 006d021491bc7-71b18454b50mr2463359eaf.28.1795018060423;
        Wed, 18 Nov 2026 08:07:40 -0800 (PST)
Received: from [192.168.11.112] ([96.43.243.130])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b743721fe9sm2624231fac.6.2026.11.18.08.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:07:39 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: tom.leiming@gmail.com, shuah@kernel.org, linux-block@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, shao.mingyin@zte.com.cn
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <202611112257529855AMDZLzg8ZmFDQ3fBstbi@zte.com.cn>
References: <202611112257529855AMDZLzg8ZmFDQ3fBstbi@zte.com.cn>
Subject: Re: [PATCH 0/4] ublk: report recovery test failures and fix the
 exposed defects
Message-Id: <179501805884.17649.3891543607346842206.b4-ty@b4>
Date: Wed, 18 Nov 2026 09:07:38 -0700
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 11 Nov 2026 22:57:52 +0800, shao.mingyin@zte.com.cn wrote:
> The four patches make the ublk recovery tests report failures from their
> workers, and then fix the two defects that the stricter tests exposed.
> They are one series because the later work came out of the earlier
> patches: patch 2 applies on top of patch 1, and patches 3 and 4 are the
> two independent fixes that patch 2's testing uncovered.
> 
> Patch 1 waits for the recorded recovery worker PIDs and reports their
> status from the parent, so a failed worker no longer ends in PASS.  It is
> a v2 of the patch posted separately on 11-09; the only change is the
> simplified wait loop Ming Lei asked for, and his Reviewed-by is kept.
> 
> [...]

Applied, thanks!

[1/4] selftests: ublk: propagate recovery worker failures
      commit: 6f3393515ee6526cf66175a85f3327899db765e3
[2/4] selftests: ublk: propagate stress worker failures
      commit: 01fe9c1894fc4cce7b04cdae5522c86519ba835e
[3/4] ublk: cancel commits arriving after the quiesce scan
      commit: b79225a8965f80b448dcdd236da2e1ca0690238e
[4/4] selftests: ublk: clear reused batch SQE command flags
      commit: 73f6a1d93040ac8cbdb03b3702a66e6a14773d02

Best regards,
-- 
Jens Axboe



