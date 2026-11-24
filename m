Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557003;
	b=0+pakhWDyLX9BzWj+hnoGsjcX45q0RgY/WQS+CULfXHLWYz9M4QA1Cd0ij+v/pCDkUhg
	 E4a408EPCuErTO3jCLlNzHnaldt4LCaInzKaflJMs4FWLW1JRO12PlRj2LLz2DSElqtLE
	 QA8rugoSX+WxM2a+knvLiUEi3D7xExYIRInFTO5bmPa3CBbBuqZ0bkUi050UWUdlGxmfa
	 B9FcLivvSP3XrIYLAViY5QAcIJ0li2V2v64Qae2pzMx+14HY12u4zDhqNQCpDNICRTVoc
	 kL8RfEeJK5VpCfneX5bRe5jbhK/34/m7Yk+E369n8X+aW50NuWxG3qk/IavBOumd+xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=70XYBogHCXCBdw3YSd/sa8Nm9h583bMMPGxQWoXbuvc=;
	b=dhTx8jRFTPq/mNHoDE+wCzh5oZkN2KvJO3k0Kn+AdBGiuVN7wGPzJpmA47kM+86mgYde
	 Tqd2gxx0TBURzNOraIBCs7D35NaNv/7RaUiyvp8hRmqgVnds1P3yUC+/D8Y/3Xr6RDLpA
	 A7AuzapcVMkh//8V5qnYqNH1whFCAUzGVKMBhF7dlgXZwwwjvcUdyu7CyBDouSOMyIGfv
	 E+JDzpb/jHtm6zni48tVx5MqDyQTC9OK2Ult2zn/HTrepcPa6C5Yk5qVHtnkbxDHDqC0j
	 Oph/S0Cxad8rhRcEWqSgW+yYPpcNDECuTItltRjJwoUp9swGG2AHgC+qmHB8UIFY4Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fp1Mhntr;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792AA606A31E
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 21:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 792AA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fp1Mhntr
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48ff6bd58b8so473742f8f.2
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 13:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557002; x=1796161802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=70XYBogHCXCBdw3YSd/sa8Nm9h583bMMPGxQWoXbuvc=;
        b=fp1MhntrLogHIUip4FbRNJKgWHj0LrTc8fZZovGtzElIDsO9y0NOAIL6mqq35lixzC
         AwmfPCM/wLJd1kp/v46CitnfBIH12MWpgZr8aJZ9uK+eZz24zYRUlwADwEaNNft/PSYD
         9Y2ieWJ9h6JfkronDg3awtzO/DkFNEG/2dQYe0sR5it+ERZ6uT+LJMmO5GbLUh93nefu
         VUlqC7eFCZ98QJQFZoO90yVKuuRukiBGyhi8yzXNZ4YJ931B5azsQqNPH7C2UEj6hM+h
         lazIEN1nFiHKmHlrjcWublPnYkeXVLNeH9Ts3DJMUTc40lD0CuzsuBG/fbJno8piySZQ
         pfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557002; x=1796161802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=70XYBogHCXCBdw3YSd/sa8Nm9h583bMMPGxQWoXbuvc=;
        b=tk9HCtQgzyjBr567Kn3VOAtI1bPTxlaxG1V+6SjTBWgMSoCrAVNumr3k8lIRTt6OqC
         cvPmTcjbaQnqrHSQUeAWUPQNQcjN//idowxtJ2u768E8O3lxUsD3mtN5H5IlIvw2RyP7
         N7gWLuB59Ss1HsDf8KG7gnOOpIH8dEEM+br2Pnvp5cEaGdNvrLP9tnmAa23I4NTja+Yg
         ZZ4UiBRO46bL7KoVg/S2Vc+dXTSKIp7zEe15cZ3EXbDv0fzZscOUn4SyPvR0rsZOIFHh
         AzCkVKh04Iy43Dv+d9qsoQ65A9vDHxpld+wkVWrY4hD9OqTU7ZNcRkOtdeth0IxmRj2a
         j/ZA==
X-Forwarded-Encrypted: i=1; AL+hErFNKUOkoocaPv7Z9zllVDdz1pSS0uuMZ5Oc8wgQ/6g8ydTGEzqNELZ/njSuif8Y/ewUEoQJaKaVnLJaR3nLU3c=@vger.kernel.org
X-Gm-Message-State: APuU4Z93iqneDVTRS9/SfX84ZoqPJcePVKkOoktYrIFfTrNSdcYUQZYh
	BWa1I7EmMPCfpiKJqiyA7tDQfJBLRLWUAIigPhtWSJbd98lMkKNoanhg
X-Gm-Gg: AZFdTZc/JyhtsdGKRZ3fGAYEJ5ea1PxP7AfXoM1/vGMepw1T+UmguNCt+7fRfOFvk+P
	LkmmCZKe7mIPJr67d+DVkhP52dld0rwbbXoM/8q/Z5ct09m+j+CoDVEYQrONh8qjc1jPqF/uwOe
	RIgMThTHYPZWpDWRSw/vK6dQpO6R+gXhTZDrA51I6uhhzWaTazim0O9+Up9SyLRCrjgjZ652TTD
	anb4vpgdGkkeiaZHOFy399SXf8uyLROcWjdB352ejVPv3DSM6dCJAW6Jh+yOY1jw6zdPdSnb5CR
	sPKPSEIO/Y9q7s9TBvdn9kLJKualqzCZQdViUYCr8U6/L7xpqbKB9bskUirk8Ml9pXFHB8K97mu
	pUdQGNPprcmGTxPDKGSxUR+18L9TqbI1w+o+ozYIAUe2thMcTnTPI0g0REkzN+ymf45677ApokH
	2cDWScyfhPXAfGk/zCPLvJdMnFrtqpJhOoiB+58znggsMhoWcIFYpPG1in/gaN4puJl5LAun7u8
	E3xrR5ufWQ+Mv/ide7wPUhDET4+25xCb1oEADBaYXRz3Tdyc0cL026NQ79hYgP1r6P6TmNLV54s
	FNfV37sxftwSPpGSXlp+yU933z5q8zWuCkKNlmGXEOYLsK2UpO5UNdFiWopAvAzBSF+VCTv01oY
	b6E4rdb2wiNh6Pkk=
X-Received: by 2002:a05:6000:2310:b0:491:2367:1dca with SMTP id ffacd0b85a97d-4b3fd477a9amr13343648f8f.3.1795557001928;
        Tue, 24 Nov 2026 13:50:01 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.4.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab5ffcad11sm29188507f8f.0.2026.11.24.13.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:50:01 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: hangbin.liu@linux.dev
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	emmaonana18@gmail.com
Subject: Re: [PATCH net-next] selftests: net: sk_connect_zero_addr: fix mislabeled connect diagnostic
Date: Tue, 24 Nov 2026 22:49:47 +0100
Message-ID: <20261124214947.13846-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123054754.GI10218@Liu-laptop>
References: <20261123054754.GI10218@Liu-laptop>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 23 Nov 2026 13:47:54 +0800 Hangbin Liu wrote:
> An "e" here?

Thanks for catching it. Fixed in v2.
https://lore.kernel.org/all/20261124214736.13398-1-emmaonana18@gmail.com/

Omokefe

