Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810FA2D5A19
	for <linux-kselftest@vger.kernel.org>; Tue,  5 May 2026 18:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005645; cv=none; b=uamXRoEtzxQTAJ5Zm7MsIkRvywyjwAcGwWQ/EufJ1BeY1PHYGeuqiMhD9hs+LcHKrV/pr27NN2uFx/d95O8tCVgUgE1LXSWOr73JQuegghTFmKb4ZUPQnVik5KZFZ7HwCYTwhLhO8cEBIF3uhfHirLUTCQZNsq3Aw4nwhgtk9Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005645; c=relaxed/simple;
	bh=h2AlK+8MmYvPuW3IDG1cxyc7bUV8nvXUFzn2jnDpp6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nNvJKpMW0v2TrPe3DhUKFtKmduF5Mua/0+as9xMCTyumyqn6yh9NiYRI50Zcw0kQ+iW6I5iWkd9HuzIRa/8+ARaamItRbwpnWSPaDvV/pK9rIEdYDvHxAxZls0pHzVj5eC05IuvxU6vUpkaKCcNKG8cTr7dfOSZbSHRr95aMdi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=TWlmJD/f; arc=none smtp.client-ip=209.85.215.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="TWlmJD/f"
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-c8006f8ab97so110949a12.3
        for <linux-kselftest@vger.kernel.org>; Tue, 05 May 2026 11:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005644; x=1778610444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nGNm7c854bmsEYSmmRpo3hBYxzAKRiuBt/6viyvE9RM=;
        b=eSg9sda+Y0kBOad80eISMUYu3YDpeOJ5Ldsydh9LMWEgMsSCtyG24+KgANZJH9PYPR
         dAHSBir+sUUSvJxfN8iqC4Mf43dBESpDWQ7LEmB9QP3EONci6nfC61Ms39G/+H8OSY1f
         Wn1iUUZXmerY3oBkZbmkQnFCQ59ZJu0TULu3ryDXsNI4hBajY5EnItL5ZwUE0bD9SipF
         LVJ7+4bzOeiBsdJDJihgydEYatmKF3+Qgc1OWN1fEngsUZ6QlzAS65t+DKDJcD1t1zoV
         ZL1KSSmc6zisVX1CUp8PVYd1l4oSmvsjNu+INGT/Va5x7V1KOiHk9jozvFOcLtnQSc41
         UNfw==
X-Forwarded-Encrypted: i=1; AFNElJ+XN0V50BtJ419Rodjds40gsbL6Vuygv3R8F1rJdlLjPZ0sG90c/QVTL3yxn5+yXTv5euZYUf0/TF3ORmNyjJU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8H3B0RoIe7y+iSXuC/VrZg11j1zzxVN5146cteYN6zJCD8o+X
	p9fSaR/bmSqvQrNPkQqKoprjV0wO9QNOE3vqJ3glIDPOl8AsTZWow6smznU9zSz/sCOY9V1M321
	QSKWRzL3xK4CcH7zLrRIN9/w6JQkSg3hR0HyemTDYiuCXE2/7EJ+FnDsxq0h+7ZmH8SP9i4wQrn
	ymCUMMUPxFbw2or5QOC5EHDinCrMQEr909j8jE8CqHduww7Ktwc6zrDc2M4ncfuifgAO1bsLcKO
	aaWMveI7YkmdZsYG6vFQfiatxQ=
X-Gm-Gg: AeBDietqZmjr/5HplGvQarr8L7cQFRK8Onk1p8+86U8gPg3Iv/5kSE5h4HDFlAw/NT7
	Y6DxmzIiaJplvMyfgZtGHtBMyk9p2ALBAQj84HROrkgQqExxdpACO7c3elchJxfLpd31dysn8nd
	7IWvCpDhAuiSwTOKuZ7W/P1CYDlnwJN22uQPuCPGMqiiIZDeZNS8GLleGP6PcckDnK5fvhAsWdq
	/U70bPvQX/ZICvpxAXUBurpM3buu4aMd0JCq+hjpxb9QdJVulCRomJdE8h6gdy5BcM66IP+pY83
	dFpZGCcium+fVu4tSrGs7d8Rykn3lTTXgOlSwsRZsnfHCevDqku0GRuCvH/wd7wTJO9faAEkseR
	+ifl/Lom4wisOGnzikqcwwv6jxodmh9Nwf35x49ZFId4uMTev41IqZfVWi6pzUbX+eyV6EBXna1
	Xs0PeJ0iqfQAV8Az2I72P2JksbyTn30EelfkBhCj3eOjpzyu9ukoMfpkvAegbO3FD7iy0M
X-Received: by 2002:a17:903:3ba4:b0:2b2:48a5:45c3 with SMTP id d9443c01a7336-2ba78b1fcf6mr682245ad.1.1778005643831;
        Tue, 05 May 2026 11:27:23 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2b9ca9c6b45sm9106925ad.13.2026.05.05.11.27.23
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 May 2026 11:27:23 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8b3fecf1e02so6891306d6.3
        for <linux-kselftest@vger.kernel.org>; Tue, 05 May 2026 11:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1778005642; x=1778610442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGNm7c854bmsEYSmmRpo3hBYxzAKRiuBt/6viyvE9RM=;
        b=TWlmJD/fcJT1MZPj75aqWVeWnzjzrf6PsNjZmvGHMuhHCGMgQ0Ul72gJK4GuNMb9DX
         MiHzWxZIhfZ+UHr/XNXZ7eHEz9WcT0Wk2H9YTlNUi5AWfJ1HgYHQTUgI8IB4A/3Gz/gM
         +VFic31X8XOafKkvaXvkgq41i04VvcC3gWWMo=
X-Forwarded-Encrypted: i=1; AFNElJ/WTm81pxxEQmRFFCMqwBdHvipDht5oe9FLRKXhW3ntFsJjE/+oKoxTDh/lF7JELrhH2aalCF5R3Zd9d17ofGU=@vger.kernel.org
X-Received: by 2002:ad4:5d4d:0:b0:8ac:afca:a68f with SMTP id 6a1803df08f44-8baf24a16a3mr45786796d6.1.1778005642411;
        Tue, 05 May 2026 11:27:22 -0700 (PDT)
X-Received: by 2002:ad4:5d4d:0:b0:8ac:afca:a68f with SMTP id 6a1803df08f44-8baf24a16a3mr45786396d6.1.1778005641958;
        Tue, 05 May 2026 11:27:21 -0700 (PDT)
Received: from photon-d7fac424c0d3 ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c6b688csm170263516d6.33.2026.05.05.11.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:27:21 -0700 (PDT)
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
Subject: Re: [PATCH net v2 2/2] selftests/net: add packetdrill test for locked SO_RCVBUF SWS
Date: Tue,  5 May 2026 18:23:29 +0000
Message-ID: <20260505182329.15353-1-ankit-aj.jain@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CANn89iK_SrGx4UuN-_h8LY0DFBwf8+hStba7vdjFnEogvo=N7A@mail.gmail.com>
References: <CANn89iK_SrGx4UuN-_h8LY0DFBwf8+hStba7vdjFnEogvo=N7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Thanks for the review.

> I do not see the SWS effect you want to avoid in the first place.
> 
> This test is an ad-hoc test about your change, but I still do not see
> why recomputing tp->ratio every time the rcvmss is increased is an
> issue on loopback interface.

For the packetdrill script, it is taking more time. To actually show
the window dropping to 0, I have to write a long script with many
packets and application reads. This is because TCP does not shrink the
right edge of an already open window.

Since the C-code fix in Patch 1 is tested and working fine, should I
send v3 with just the code fix first? I can work on the packetdrill
script and send it later in a separate patch. Or should I wait and
send both together?

Kindly suggest how I should proceed.

Thanks,
Ankit
