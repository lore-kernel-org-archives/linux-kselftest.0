Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795740641;
	b=iF7yRMnS3zmK3fr1MCFV3TWlYtm6LOMsDqBQ1vp8qACRFw4xHpsGsSOL9qa+t9CjpOhb
	 h8c/8qI43c+uaaW8UamBT10gZBXgRiViNUHnmhU+aOUrJoVEaYkzMLnjHMYhDah0nqCTq
	 hRlq/qJHhXgqV6Y454mX2bxnsac/iIDGlBX3/34fPmGAGv62f85E6XSN5VDRMZVAoBGY+
	 liM6XZerrZhmtcHbxAgg8EI+5XDgOg2HG2LwG7NCSUIHzalnvcRUkfzUaD036LSoKHQVj
	 ptofQf4BJ6HCtDqMxr/W6N3z+djnO/+lis2jopPj822jv4mpLnVGt4EX3hsV3QWnClA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795740641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References;
	bh=x0Mp5Txn9dhWnd7kNaeyrGhDTXOo7utFqS5hhFOq2io=;
	b=RRUUqzOcRbMU9pwlGbB2Jc4qdGuF0qBV44hwVZE6bqWPnhgZlt8RfDdFz+T2x9nxphRL
	 Ez1GWe38W7q2zGmNRhyM7umyI1bXv5ujVJwiVWtfepQk7JETHXtkjUadQdeowpgdC+C+l
	 tte2KcI+edGGyoMwiKEp3Fd88B2z7g3tiNmHqfN0QGmaHHRlF/l8f/JASMJZyo8GSFag/
	 om2YiOOep5AcICPPq06sa1o+avbIt3lsNZzeDF0r/VzAV0AuJuWPApS+pJjGmpXgvE0vr
	 vRGEBAYaUfUfmABzSxtLSeHNjZq+Ld6sVqlDwaepnJRKGTq+EF1I//MM3fTNZ8M4sSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K1tEEi0C;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45336606A31C
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 00:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45336606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K1tEEi0C
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91f0274f88cso98924006d6.0
        for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 16:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795740640; x=1796345440; darn=vger.kernel.org;
        h=references:in-reply-to:subject:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=x0Mp5Txn9dhWnd7kNaeyrGhDTXOo7utFqS5hhFOq2io=;
        b=K1tEEi0CKdL//6rYPHcqQGCm7O0J2ly60eWlW+M9HTfuVDK6FL91RNDcDxOxAxtiTp
         oI7sUzz6QMfcVvFq4csJ6S083G2fdGSO+96r+9wFfux6cu46po3ovanEv6MSYhrNRPuh
         IQRkruV5OXzzvS8TSq91jU/dMUZz4WKqyxCeQSHwpqqP2n004NI2x8HjUvKRpMdohSJp
         LKJFj1bPEwjjKwdlmGJ5cwFR20a2FvFJ29hffy5GBV619FNLpZmc+rU9hunaxkLwu96q
         tJfPopPK/Hbxyq1qO4pmcgcT6uFv67XSRGyn7viNKf9DaddfZHEz+68SomD6h69VsuMX
         axBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795740640; x=1796345440;
        h=references:in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0Mp5Txn9dhWnd7kNaeyrGhDTXOo7utFqS5hhFOq2io=;
        b=n8YSZfPktdXq5lzAFIKz75br22/6QcXo2dLb/SXv+GlFq1dEH0qNxZuVWDh0VXawnF
         xSttoJVIikY6LO0m3UewIkEh8wMAInAK0NWgAcZZvbVw/Sdu6/MZxOqWjFLjT6ncSJHk
         FpIebyx3bL6OIazqLKPA+IhZmgnPLGlSkzjD/qGL/3BMaPp2knbfJpTfR1gw1xc3L6+M
         AjhgbTmCc92vogmUC4r+SrgbcFVjsMp4FOSKJViPmSuaOIDfB5an3/7/OugM7EIwYnin
         u+aZgdU20vWCVlvPElPUdyl1+8NkvDdTGME0Fk5sJsn3qHy2rtyakzVF8izdh1eDMzBg
         tc9g==
X-Forwarded-Encrypted: i=1; AL+hErExsGYudVLWp8ta0r9Elb8X2gZlQZi6IKZjNHhzgXs2PvobFzqqyXR8jb92CLRPkZjzz9j7OpB4+TA0DcS38Is=@vger.kernel.org
X-Gm-Message-State: APuU4Z/z5moDJvFsCYyUrB7b8lUK40Q63ZVHr8hBKdvhvKXYbP3LEroy
	lnSUd5mSyumDoKHx+LC8zPi5QAHuqtLx0wM4G9Vt0KDRpkvEwMtta0N2
X-Gm-Gg: AZFdTZcbYssZxSZX79XhSp+8ymM6woakeWQjQLzJd7nX2niUbYBePlKwVDq2t/yrtdP
	NhfpGwFZEEVy8DlWy8D2Sxa8B6GCKPBfHU2WgKl22W/UaBXSFALJQj3Cas32PqDWUgE2j58d3kG
	ecuFTpK5ViBMSlax9WIVSYpE+XdIwaLj+oNSgaMYk4YgUb4JSZ8b0vbHbWa88628p/lnzS/p1KN
	1Jqlk9T43hmlY2Fz71cpC3Hb5ga/eejFj+jPKDh6rd0d+HudyObwJ63kiElEQ7XZXFvMmGqCysf
	VVRnA/3TWASRF+vXxlgrluhUigfhP51TqI9VkQ2rOyegoyDKZRiIqW7zQKbjQEZMJD3pPh3PCsD
	MCKBIkUnXr5MAAbqP3fb29E20TkoKZEWQDJrBCliIa4lBTSXQ1oiCh6yA/2v4o0aZJ2fL/zW7s/
	5MqRFaBCWCeYzRVVPCOa2MvOB4b/2r6WsxCZwu65QY1qWzge5VqsdovnkNnoDdHoDBrcZIRxfBi
	O2zU7mGpdOTg46A/nTJYb4FsLBEjgSHUBTMuvgGKq12fOkBY+RqPk4fA1fi2Frl3RStra+J3zvR
	gDIPSblC+sjyQHuVV1TiWOFqLEuH+2nintUJnHOqQ5uHCkSmWUg1yFhiKWGhXT3uUlo9xTbiPEG
	NcStAD5yH9IxgutZHhmJ0x5HCnw==
X-Received: by 2002:a05:620a:2907:b0:949:72c3:dee6 with SMTP id af79cd13be357-949ba99cbf7mr4043850085a.19.1795740640134;
        Thu, 26 Nov 2026 16:50:40 -0800 (PST)
Received: from localhost ([138.197.109.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac11sm1703987985a.14.2026.11.26.16.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 16:50:39 -0800 (PST)
Date: Fri, 27 Nov 2026 03:50:37 +0300
Message-ID: <a424da14ad9f0fcda6988f558432d10e.ndokutovich@gmail.com>
From: Nikolai Dokutovich <ndokutovich@gmail.com>
To: linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org,
 dm-devel@lists.linux.dev
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH] fs: tolerate an unfrozen superblock in the
 block-layer thaw
In-Reply-To: <20261127003902.48-1-ndokutovich@gmail.com>
References: <20261127003902.48-1-ndokutovich@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list

Please disregard this patch.  The same issue is already fixed by the
"super: fixes for freezing, reconfiguration and error reporting" series
([PATCH 09/15] fs: don't keep a device frozen when its freeze is already
gone), which I missed when preparing this.  Sorry for the noise.

Thanks,
Nikolai Dokutovich
