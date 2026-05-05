Received: from mail-vs1-f100.google.com (mail-vs1-f100.google.com [209.85.217.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB24D4A3414
	for <linux-kselftest@vger.kernel.org>; Tue,  5 May 2026 18:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005385; cv=none; b=DrIJlj5xmaB/Ty00c2Us6GHLIWua+yBYWrnwA73cE45IujM7I9wHrFsmOPiwlbrqm7SRyduNRynV0xrrFdlV21EuPRTmHFH4BjA+E69HHQJiNObWJIGo/d/CpvGQptzkiuNObaiCeBPKHme4wCHeg2qzxYZC2l8ODOnxgz++yOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005385; c=relaxed/simple;
	bh=GgkkRdICe7DfLGShMiCKE1jBH4nLY83u4kIozlYXyIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ByJ30zyweugXJ7XcuL9WtiGR0FszsawDNutSACI+i/YYzmzBcEkmK3EughHJPJVJrpsNqDMH31R6pL0cPXsgtDO8WyvuuPK2bkza8Hf6/7oU4vYLcH5yynzcSwBZCqS9SR6g1pSMyvewB27l/HGmpFz+fG1LWcmLtOksJtyI25Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=fOTiD8/g; arc=none smtp.client-ip=209.85.217.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="fOTiD8/g"
Received: by mail-vs1-f100.google.com with SMTP id ada2fe7eead31-630f4c42abcso20908137.0
        for <linux-kselftest@vger.kernel.org>; Tue, 05 May 2026 11:23:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005383; x=1778610183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0TctQ/QPTybZnX6Hj/EaRyQr5V49De/CNOWCLe2wy8Y=;
        b=XyXmZ4bfNX81JKI+3kRg5gkhMZcM3JO+fpf2bhdXTMQtGTTMgl8IgG1vp9lpvdJCJs
         G0rcQLYmp38vEERYetAAjwZQioBpQU2EgMwKCC5rs8KI1+ZRQO+xMDff1Ob5OzVyw+iw
         AT+86TOTd7nSSVpG/nw7J0sxfU2p68+mzSAmuugJZG+JWa3Vsn1OjNF6nG8CQf8Ake4H
         HRpkE4BZUur8GmJIWyu/0OWLp03IQJalgeup9c2dXE7TxM3bZiuMTxbePF16E48Gk1S6
         I96eLmF5O7Zs5wiaX8as5quBJZL75vfTn84b00VmGADTJqnL5iUSJvvndASHYaiFfG7V
         TGZw==
X-Forwarded-Encrypted: i=1; AFNElJ9BMRMkkaLr1aYHz7tA/jcus7V5ioXjTKKs3g7gVaz6Ae2LIexXYJ0Dq//ONzkQzqWdCAXfFeRzbBv6dzTZV+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLXFEzVT07eCS1S4EP4ob6yqqrP2i0jpENnYDl9P+dOi8RQPXb
	NRuROEi2xSUEL7uLDjaUrPEtjPU7tA82zF+2rAYlHPktGBrcj0PeYk3lL032Q1DGpMp5tL2Vis1
	a6Yfoto5An0IRq1ZuOHQstsmZvdl3QHYoYonnxI8rLBLjL/TE9zZuzOZPdipk1NlcDCLN29NqzS
	rqNLl61WmQjql4bTI9sDTyKr5WLYxf2WbECyo75xwUALtTNCggTqXMNsfg42HWGJjWXOY0KVgtA
	drjjdxa6zMroHC1DeiPIq27cxM=
X-Gm-Gg: AeBDiev2Am9hFhcJiovfCI/uxmUzbjYMNbUZlRL1qLcorfZzDRBRq97+/El/2E3SQw5
	93oycCg3imjUZ1FJxvO+I/+JOc2EZ+xAJP4f20zLQClsra62MC0XTJOXL6wfn3ZmJGStWnXsMmy
	94NmvPSwxUDM3XDOyelQbi7HSoGsP8mvhkxPrQiHkqCQXX9+KzlPVXNZIGDjmS8y3SzJDshvBK8
	N5EYWvr1Scpka924zdbgHyy+m8vj36V9pc8TiQZXhKQ1EmwOWJylceuZcbsDnfFqvfa0aW6140l
	MT3O34qPInVCBTYR3QWmOwZzpjp5oXmMyiYS1KT0ZnMF60jk7C5SgA97Tcn7Mp9iPt/cmsnt9PH
	TeLNQt5dSaMtOARrJLHP4m7z699MTl0kGk4QCuDQdmmHCy/Uvgpm6hzgyy7sk1uwzGcv6CLr4IC
	s/8TfYsGaDDo4AKZaAkDf66KRlW2Nb5FIYCbe3Pu6fL6D5fXbTdJxsWBvOHnbJTsJ18sqKHzA=
X-Received: by 2002:a05:6102:1259:b0:62f:fed:d334 with SMTP id ada2fe7eead31-62f0fedd3b9mr1964435137.4.1778005382599;
        Tue, 05 May 2026 11:23:02 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-62bfc18c2e4sm1056771137.12.2026.05.05.11.23.01
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 May 2026 11:23:02 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2c156660643so1154555eec.1
        for <linux-kselftest@vger.kernel.org>; Tue, 05 May 2026 11:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1778005380; x=1778610180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TctQ/QPTybZnX6Hj/EaRyQr5V49De/CNOWCLe2wy8Y=;
        b=fOTiD8/gvF5VMRj3RaMOr3DSGhe+/YPS04HzkjdWckC0r4ooyvbURIIESLkKUinUKR
         CRplkPLEcfxFIClzK0KCCo78gOISbZ5IaK3VfmYTswYEvauEbJfhhmUO2KaVsmbh+S8V
         tIeIecMSasACPKMFtntha8o3p0Nh0CeCh9IbQ=
X-Forwarded-Encrypted: i=1; AFNElJ8MB274+QyxxcLJUrkMDS1/+WS2ZAB7YskoANtIGSzE+QMx7BaQXHuXSXty6Rg+MGUovHeSFkJRup+3QulP8ew=@vger.kernel.org
X-Received: by 2002:a05:7022:68a6:b0:12b:f899:7178 with SMTP id a92af1059eb24-1318eb48053mr80661c88.7.1778005380611;
        Tue, 05 May 2026 11:23:00 -0700 (PDT)
X-Received: by 2002:a05:7022:68a6:b0:12b:f899:7178 with SMTP id a92af1059eb24-1318eb48053mr80643c88.7.1778005379959;
        Tue, 05 May 2026 11:22:59 -0700 (PDT)
Received: from photon-d7fac424c0d3 ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df8424ef1sm27629462c88.9.2026.05.05.11.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:22:59 -0700 (PDT)
From: Ankit Jain <ankit-aj.jain@broadcom.com>
To: edumazet@google.com
Cc: kuba@kernel.org,
	netdev@vger.kernel.org,
	davem@davemloft.net,
	pabeni@redhat.com,
	ncardwell@google.com,
	kuniyu@google.com,
	horms@kernel.org,
	shuah@kernel.org,
	quic_subashab@quicinc.com,
	quic_stranche@quicinc.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	karen.badiryan@broadcom.com,
	ajay.kaher@broadcom.com,
	alexey.makhalov@broadcom.com,
	vamsi-krishna.brahmajosyula@broadcom.com,
	yin.ding@broadcom.com,
	tapas.kundu@broadcom.com
Subject: Re: [PATCH net v2 1/2] tcp: protect locked SO_RCVBUF from Silly Window Syndrome
Date: Tue,  5 May 2026 18:19:19 +0000
Message-ID: <20260505181919.15308-1-ankit-aj.jain@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CANn89iKcaOK6rrY=m0SVfXdx3jTRXCE3T+jNQpw434UZ8oxtpw@mail.gmail.com>
References: <CANn89iKcaOK6rrY=m0SVfXdx3jTRXCE3T+jNQpw434UZ8oxtpw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Hi Eric,

Thanks for the review and suggestion.

> Testing tp->advmss is not doing what you want I think.
> 
> A remote peer can send GRO packets with tiny segments, regardless of
> tp->advmss
> 
> If GRO is what you are looking for, why not testing (skb->len > len) ?

I tested your suggested `skb->len > len` logic on our reproduction
setup. It works perfectly and the 504 timeouts are completely resolved.

Thanks,
Ankit
