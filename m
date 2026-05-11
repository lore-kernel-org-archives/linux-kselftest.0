Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01CE37AA6F
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 12:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778501157; cv=none; b=EcEQezMC9zXTpPDkyXU1TcD6U8a6iftPzpJ8OLQKH+rVyB9rGmKm3Ik/htvWRVlohSQYk5sCnBKkm4aXPWZz09RARgg3DmCq8NMXSBtrhy01m61AUxVKmW9xhxkjttdnYljmN3rFWCdciaqr/Qp6ZpNs26V+K7v+jGPnZV5TOGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778501157; c=relaxed/simple;
	bh=y4bazO79X2luP3aXo5Zu79w/2ssn3oIiVFWNhmrzfUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fxA2LAsY6eNYki0fNSd4AuA8ToSWovjXSvAF0rBVNBF49eOu19VhvjoX636CmIo2AYpRDTznn2ZLVwx/xtQjmMgDa7+sbDWt995jwLZYI992oufokKF81p1xhymgO3/vHpyXWoRlaFLEao+KMCcmehromlbWOsZtdsthDgs+4eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQ7AK+GV; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQ7AK+GV"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4670464029eso2399609b6e.2
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 05:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778501155; x=1779105955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4XcVvpH9Ox3FvY9rNYp2Al5P5pekeYZiWZMMmvoOw0=;
        b=PQ7AK+GVwCZ94XfbfgiuVnmKhUGeVxmCLix9GVJJoJHTdJrSoPqqM/UVjJoHdyG2m0
         TbgMLn6mWOz8m+hfBomf7gj/F0gl/NfXaJWYQ5mfQs1wamLYpOZ7baXP9iQBMqwri6jg
         LPTAgXxtAheE/hbQkL++PwLeSN/So0pN3sCd51PlVz+N/uacmID3OSS+6XSRU7G5wsLx
         iWWKCUPnmTN1R33DqrZ6KwyaJ+Qbn4hmlOO+Ry+0y6UQqrmU0q3j9KPbDSxCSWAZiICN
         2fndhVbZBmiI+2tYTOSWtp8BhjNprHdXfITEqGkEjAt8ubiE1AnsT73H3sB6yux2O48z
         0bRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778501155; x=1779105955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V4XcVvpH9Ox3FvY9rNYp2Al5P5pekeYZiWZMMmvoOw0=;
        b=Gc3tr5UXDwmH/qmwD0kgaZhrKWaXt/UUZqemIQJO32pHYwXKdzOQCqM4leQEVu6G4a
         RxE1S1V1NdzZUjBkeM7XIz6j3hZyFJJe0NlX5hzjmJvbqXnZ/1Ib6HhpgZYwwjRBKhXJ
         uT9GhSbNMNzEaHWb8PWGmBG1KryvNJOrMaV0HI7flsquR4avpLh08vRWRZGeJr4bWPva
         8w316j92jCNa5hPWLQe1yz+FW7Y5Ou1I3EA9ZUdb54UHD+IjvnZgeHZBtVoIdt+I0n8V
         FvzWM31v5FZ6gDt9lohai29iRJHHiBpnKlPYNjwoiEDhwnX8pFYi9ywlC3KIjYDvPAtL
         PwNA==
X-Forwarded-Encrypted: i=1; AFNElJ8S2XeOEhy4XUtvigSkUTvOmrbm0gl9qGE+/Ic+hFRcBfcLTvOY5uXpkAPJ+ZYmKaqZlsRvRwIj0TRywql+L5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrCJnUnrFBsU/wDUd4GE9VGc+C/uBt/7gsrdVAloQv4ha+8UXW
	IKZYY9hTrI4AqZMwnqLooQMUsLO76i8hiqkQg8Si2Ky1+M1HpRjHEPvq
X-Gm-Gg: Acq92OEdTpnB+CxfTZ4FVKIVFXZRv6iINH+vR7RdWWtuCqJNy6vgwdXOnYLqY1QD5Ng
	FsuKhIvaG/soFBUZ0WHjkWyZdp5WTgwRgFjqANMZNWrcSrpoplUsLuclB3g76sap8ped5Ni36UJ
	8RNhL2V0xglgtQNQFD6O9Jzh6LVlFZ/XD5Y8AaP0dqjOcyrl8rxCD8u1CZW2gjeYMaVVNGV8bH5
	KXz1rRtMdHdiz0m/qIe770DdHso+dt9Pw7RFenavnshD6wMNS/OSMSzFDzkdSB1nv4utf2Pv3YC
	z5kOS3bITEGVAOM73rQkFW7Sw9DMMYHHRGYJYXV0UlGEg8YdbsSC5g8/XZEc6Qiuh+bO4C45jmp
	lv8SdQ6kPwQcKqX/v0FbpXz8g2O7S1DJRvgl9S22XYePSXPm0FosDJmIuBM33radLqvNxrB6Lhl
	o3DccYncCrf0y1Nwc=
X-Received: by 2002:a05:6820:150d:b0:694:8b4d:5f8c with SMTP id 006d021491bc7-69998ca0697mr13574825eaf.12.1778501154591;
        Mon, 11 May 2026 05:05:54 -0700 (PDT)
Received: from houminxi ([72.244.37.221])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69b25e0e79asm5608123eaf.14.2026.05.11.05.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 05:05:54 -0700 (PDT)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v9 0/2] selftests: openvswitch: add pop_vlan test
Date: Mon, 11 May 2026 20:05:43 +0800
Message-ID: <20260511120543.390702-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260509135423.3433910-1-houminxi@gmail.com>
References: <20260509135423.3433910-1-houminxi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Found a few issues in v9 that need fixing, will respin as v10:

- Commit message for patch 1 references removing MAX_ENCAP_DEPTH,
  which was dropped in an earlier revision. Needs cleanup.

- Masked VLAN format string produces output that cannot be parsed
  back (round-trip failure for vlan key with masks).

- Negative test in patch 2 lacks a return flow for in_port(2),
  so ping fails regardless of whether pop_vlan works correctly.
  Need to add a return flow to make the negative case meaningful.

Minxi
