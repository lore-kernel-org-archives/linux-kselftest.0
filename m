Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795588338;
	b=h+SfMWqQKGSE1En4zwOaW37z7nC8BZwHEZJyuJH91IGdRoqmiG7feZc/gOzkFhNYP/jB
	 C+OiPxY8Z5r96sYkbgYCX4BRaHuBVDs6sVVoqxO5ZdYHeQXLxC0PwmfOqEdLIVBS+gR/S
	 /Rplni/KCwHxDBvY+D/OmSeF/n/jSs6dxJk3iuPNMXIJ7+pV5HwTMTAEuErm+t0yZjoJP
	 gpMqxWN9kMY6M6xLld3/8XbQD2ZXbnRSjyKep7D8salqHKhaiCObMfGU8xmf08TeR8FWc
	 +Nn7L2VpdvEzvlBD8hXen0JFOqs60i7aZgBcrsZCVzxWv7W8TatZmZWIzuHVVcZoqyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795588338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=KHXzp+84iLQUjnjlG0As4PHmQ5NglIl63AJkWeb4QbE=;
	b=K7sy8hB2crpIdWqHFAIpMkTzzzoTOa+pUSgYDY6CIsgswANEUFZRwtinZH8TbBLOgQhJ
	 JoIW6hBivBPGAGXXYQkSomkm/Q93lyhiftTw49wqoOgaXxG47Yjo1O3/8qFBNz7FVzeH8
	 Ty3Ioq3EHJZCH8j03Cax8P02xiCe2e6JaM14uAHg7PQK1E9N65YdZ4J5pt/YzU9hSZvsv
	 w4POFWoMwgVYSWwmmERFdAWtvZayJ5auYx+g4tctIsKxsXWqDVz2dF+d3X6rNu/mw03Qz
	 uD2JhqUqjYDRgbP7jFjvYsL9ABmB2t5ox4NFSYamCR1VOqKOdEn1wskKDwiWxaUEPeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WqNWpXUL;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4B9606A33E
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 06:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD4B9606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WqNWpXUL
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f053f9631cso61935695ad.1
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 22:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795588337; x=1796193137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KHXzp+84iLQUjnjlG0As4PHmQ5NglIl63AJkWeb4QbE=;
        b=WqNWpXULC+EIH0Lll03C1uAj8+QrlYSD6zZ6l5JmPh/M1qVqVhFjKf1DAP/h0XH+KH
         cMte7N7XbzS/N9OvTXLLoC+sGA5G2xbShvF+4cJj6tEInwRWNttMVGBqz2glvCS+dMfJ
         d0q+4YWI79W4lv5g+HPVVgbHZzwo33ECEMwke6VxTFjmA2MukGUWh3u/jPuwibwGjKyU
         hwX9fyZBFP1YFHmsNAJA5jd9as88utou1zUXya0zQhjhZnPciF0hhW5RWJOUMIwnuLBq
         ppPhhUM5AMRpFaGN67H1TejRcGStauT42VkuhlENdmrQrqD19o0xkHW1r20Awb6H/Btr
         q6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795588337; x=1796193137;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KHXzp+84iLQUjnjlG0As4PHmQ5NglIl63AJkWeb4QbE=;
        b=p/3BGOxZeO6h0qTyaflNJ+rEPPzgmvS7T2CUE2vF8bdf6rDdNLfJSgXcMUU4xQnnGM
         9T19INLN8KQgEzCm5vOqEldoOxGxYf8E29UGVqRI/FdHWeCyVT5gzII/Po60Oay3sx6b
         J+sBWNTlqWMCd1Bf4Wx0F/XxsV4P0jk65ODArcY0vFzTMV4txUOJ0H7WQ1x1xDvfg2jA
         ScDETjY9QUL7u8TFG6NYevqn9lvkUwasQyL1h285C01RjchSInJek6oM4OgFGtseIGMW
         +PwhwsFIKIqSK1b4B4JnegoLGM3G4OpuMlLe1M2yK8SZJTA7aWprrd34CiV1gbmA8fgh
         gGyA==
X-Forwarded-Encrypted: i=1; AL+hErGAW05HnawhoH1FGl+PkiZZ2un/+itYoLkGf84/4yZlDy+xpyAXIyy72ZajaKMfPhSgvxV9j+2WP1E/hnHLd+4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AHxQv0PVvpes8Lz3DQV/PgH8yA/zlQ0kRc1R+60br5RUMz05/
	y9zrrIf8yPfHOo20Dlj5YuB1tXyCUIYcopbFlucxdhFj8wD+tRJtQ1TwizAwzk3WG16MdafHe0w
	72MTgSlJGe5Gfq1i/rfHa5HdScDGIfjk8tw==
X-Received: from plbms15.prod.google.com ([2002:a17:903:acf:b0:2e1:326b:da73])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:19cb:b0:2ed:2856:6442 with SMTP id d9443c01a7336-2f03f1eaa0fmr179076345ad.28.1795588336373;
 Tue, 24 Nov 2026 22:32:16 -0800 (PST)
Date: Wed, 25 Nov 2026 06:32:15 +0000
In-Reply-To: <20261125002808.GA1198022@bhelgaas>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261012-pcie-link-endpoints-v7-0-36aba9c91f10@google.com>
 <20261110002437.2376944-1-rathodpriyank@google.com> <20261124174411.4183038-1-rathodpriyank@google.com>
 <20261125002808.GA1198022@bhelgaas>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125063215.1499950-1-rathodpriyank@google.com>
Subject: Re: [PATCH v7 0/2] PCI: Add Lane Margining at the Receiver debugfs interface
From: Priyank Rathod <rathodpriyank@google.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	"=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>, Lukas Wunner <lukas@wunner.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-pci@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bjorn,

Thanks =E2=80=94 I have rebased the series onto v7.4-rc1 and just posted it=
 as v8:
https://lore.kernel.org/r/20261125-pcie-link-endpoints-v8-0-19d49c17c05f@go=
ogle.com

(There are no dependencies on anything in pci/next beyond v7.4-rc1;
drivers/pci/pcie/Kconfig just has a minor context difference in pci/next
after the PCIE_EDR cleanup.)

Thanks,
Priyank
