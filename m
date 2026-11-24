Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542253;
	b=D3XJTKZ412f3trVWqqKIXBCWDpXV6bz2Yes0nrED34YNQSn/P3R3qlfh1Sw7WbU/SGg7
	 eAfiJWYUE/OQF7FMOzMOMILia32FxOHgExEI8AKk7tWmGHthcsM91N/cow1icWqAOcpOu
	 dV2hPE1XZxTuimO2nBxsb+0ejCEx2Cpca0rSYdfxu4xVmdgRQo56JLrHZQQxXEBbZbrs9
	 4BEJJiyPp2ORGPQi/bf72LVbFiu7eABaDTgOJv2VMyNe7PEthc9n6NIoyKW8mUg8S260o
	 0xnC7GfnalTOEykTQ9XgejyW/qGW18kAQ5L6HLGA3MvgcnwFZDqox8XcPgP82I3iAvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=AA1FxlB1wIsiVBWKGbYXdSD5iGjxbbQKg8GOAcVUoD0=;
	b=JRVLm8H/9fj0j2gk6sLGJpWg+ngi97nJ+i4kDg7lg7f2ch6wWHpw5IMBofsSD/wGKO8O
	 5VCjrp9ZUdMhWp1K4yhGLmR2PoVVStFM5JVs2NFSCkATtamIIeku7Mq2XP5HQqkOY+nb9
	 qTjlS2cTkwZJbpkHNGEIhh7SQvkJf1AqNk8XvQ3Jf8j/AdklNVyaCmHyJx57WHW+bk1Dp
	 7dHWX8aUerNDPj3jcNEOmP2FzZiITjcfE/5nZZNE9yuHrWOelGJK4GTcZo2D4yHXqA90v
	 iQHrsQpJ5jidvIvDt+nmwLl87Mqp2ZTwjrkMutFLXCYAvshQ0BPo+E+ezqpv31vevjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UiYvQjLv;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A10606A323
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 17:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09A10606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UiYvQjLv
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b4232374d6so6531315a91.2
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 09:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795542252; x=1796147052; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AA1FxlB1wIsiVBWKGbYXdSD5iGjxbbQKg8GOAcVUoD0=;
        b=UiYvQjLvg/dD1tCSWefP5QrPsFFRp5iXlT+nm9Mnl8uNBuRz5H7ahG6sNLFLOLMjgs
         ptpXWJdaq11jXMjwjGk73Pz1VBPIsypaPmqPZGuxttol6VaIKGiCCOKHYpxZ3chuCCDL
         xk/tgdYCH/6c0E5sTqI+YSzXAeUdTJikqEa5MiorGNaG7b1dH5U1Par6WamULKijHjn0
         zoDQC67gSRjBA9yBw6fb1vj0t2pLmkFnM+xRzrCsjVucuclm8xgK3TeKnhe2JN8xhi7X
         dShYp1xCRmS4dSTjLqobvWeiDh9VRsKVoHblGcTn/BC7AplTPLU9IObhuI14/chIdbRD
         TUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795542252; x=1796147052;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AA1FxlB1wIsiVBWKGbYXdSD5iGjxbbQKg8GOAcVUoD0=;
        b=DUUVUYO4VGQSUuwpXAwFpwWr53HId/TT+WOxeGqa9oJU59A4d3YPEgTPkWyqKv4aiG
         NVdvpmX5UyL44Hy8X4CqSotFld+CEYRY3ni9gT1qucIGVkPAJGPqHcJtcesDtZc12Zqk
         37yS7TzwqmDeUsVA/uRDvhnG9XY4hg7i03jA+hJd7eEOwAw+ijqDElbiRvgrf7N8OkOY
         blWpAXQD4m2Y/SF0XryCyxLNNKvqNWQFOceFdS4dFvwGJukvmk49ZIaFJE3gakToVCXw
         0zjBVTkiadzA0cP49JmEAcyq6idNV2hE0vTC7odgkqAx3Ve+jx+LQmlpVV03eDXLb8Pl
         +8fQ==
X-Forwarded-Encrypted: i=1; AL+hErEqz7L37SVwh7VjF1+ut3IDizU6sLrkoNB9dC+klKhGyYI98D3kBCTtRr9eXirVq+nZHK07Wd/VzMn7CgwmxN0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TEnx3KoLvqFfiNfW7m+sILWcVuWCJ4ae2ew5qqpdLYJn0tqxs
	vDEYJMkAigI3CdyEWi2Fpox9jNMR3a4Y+x62Co2soSLJ6GG6Mveu81iHTARwuKdG47jfViT7uDc
	oDRBuKfJTKCkm4ESBUbTAzcRg5dr4kqB73Q==
X-Received: from pjbci6.prod.google.com ([2002:a17:90a:fc86:b0:3ae:c401:753])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3c11:b0:3b4:1336:4f6b with SMTP id 98e67ed59e1d1-3b41c905a49mr14294021a91.33.1795542252059;
 Tue, 24 Nov 2026 09:44:12 -0800 (PST)
Date: Tue, 24 Nov 2026 17:44:10 +0000
In-Reply-To: <20261110002437.2376944-1-rathodpriyank@google.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261012-pcie-link-endpoints-v7-0-36aba9c91f10@google.com> <20261110002437.2376944-1-rathodpriyank@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261124174411.4183038-1-rathodpriyank@google.com>
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

Hi Bjorn, Ilpo, Lukas,

Gentle ping on this series.

Note that since pci_force_enable_link_state() and the bitmask return
value of pcie_aspm_enabled() were deferred before v7.4-rc1, v7 as posted
no longer compiles on current pci/next (and has a minor Kconfig context
conflict after PCIE_EDR).

I have rebased the series locally onto pci/next, resolved the Kconfig
conflict, and replaced those deferred ASPM calls with a small
PCI-internal, reference-counted pcie_aspm_inhibit() helper in
drivers/pci/pcie/aspm.c (leaving include/linux/pci.h, pci.c, and
pci-driver.c untouched, and preserving existing ASPM/L1SS/Clock PM
state across sessions).

Would you like me to post the rebased v8 series now, or hold until any
broader ASPM API rework settles?

Thanks,
Priyank
