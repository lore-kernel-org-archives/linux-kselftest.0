Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795300927;
	b=PNB4PIE9v5pkifxbeLtJldVDeHkIELRUY252r5Ny6mXjSlPakVnnyQDrAjCdhFT6LZx/
	 cgtRJQdt69HF+FCA3kDqG9/mH0NmgqmttfOlH1YYUIJwyHkiQQLssU7NF2scwMZkScXFF
	 zVEh7rbjjFNmOVSfUSPhR1UgOa/Q1eEBLUNbmBu8NOULoUenHi/Wjc7/LIOMZHKzigXUf
	 ZRw0xZLNHf1C+i/oEBcdpH4xEIQymtJqMN6wM0MuDgtaNM2B3/deqKVHYGfyw2B8V5dH0
	 RsPMsIRJ1CQb2mwyJ23WCIDTPcxIf2WeGj4hxSJgjYqcULsle3QEYoKuLxdGpdR4I4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795300927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D2UwN6uj+eBii3DP4gkFy2CXb9ETeRwrQjxMZhSvZ98=;
	b=bNlIygPXEh3VKODER5JCBvUkxtc9uB1qANSA/p8N12nzZsym70BQftwBjrUhosBc++DD
	 BisZXg8UP42gbQbEDFYKthB0xmW7OXtcO9y5VCfh88dWLvQY6LTeDdpqJmarpYYbAi7T6
	 8MXElZVjz6rK8YKmhS4NQ4bY7pbn9lL3zdhQIr30hKmQEGBgH4/nEwemaHK0eoPd6D296
	 oruIFUQ7twwFfSb5nFZYcCLJvEva1sKyTshtppunCNFVSVt1CUBdY9PPWY2MYBzVu7CtX
	 nTpIGwNpYSqRe6UNAozRQ+Y4fEl6ts96fVYmHUDp0js6YarEGvqSaI3FsxDsEq2q3aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0axLW/PH";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693C4606A320
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 22:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 693C4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0axLW/PH
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a7a3b29c11so1914245e9.0
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 14:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795300926; x=1795905726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D2UwN6uj+eBii3DP4gkFy2CXb9ETeRwrQjxMZhSvZ98=;
        b=0axLW/PHnotmGnAGvriUDC4zPVypUAFY7tABZ8TS4udy4Rp3gesnKf544GmlWlkSvq
         Dz0WU94DJEvJZAHvyDnh/FwYRdIQnMhzUYH5xXDSX7Et035M7FWb6nSBqjZ/YmeBBAWw
         LWlHWZKotM24upMg5sRrNLLpTrOg6pZDIFOE8DO9mnyDYjhKI8wUJzqiQlVRK7/2sgqE
         FhtsFRgAtArM/jmmbb0bhrs0U9kRRYzs0uHpInCW7Vjjw+kmF/iXFo/huHD1Y08DCSrB
         GAeijSHYKnDzfR6CRpF7UJFF0EGuufD7ohLNuTq6xWtMqsf2EeShpUbuZqfSMaq4wJHX
         b4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795300926; x=1795905726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D2UwN6uj+eBii3DP4gkFy2CXb9ETeRwrQjxMZhSvZ98=;
        b=oMbg5NFblebIl+v4y/EEj3U0cWwE/PrCy5ziL+D7lN1WGM1BT18eV9Wivtx5kA9sf7
         Zz94Ay+MQk8/Jd1/Vj2ELESIZHgGscqv2i3fV+vnc2akJH5oGA3OcTYwRZDMaiBb1Rej
         Zb/yfyQZWgJGJ82QJtp3D9HQ1p70a8LEGA3jpKAROk00kQeS+bJLOb7myjrPzer9H7Sc
         kF6ZKuOY496BzR0CpruXpD3g5KD3NmavETGHKeNa/Dmwg1MUh5SaN6dYkfxRvRK+qqGb
         Ghhw9lPCp6+Q8f2VZ9wdGR7T0XdmbH+WcgsWsEvwszCQ9wCecU6mxjrtRKczZxoOsltb
         29mA==
X-Forwarded-Encrypted: i=1; AL+hErFkUyJsK6yrXyXy8GFRuz8ggSt0ilj0XeNUbTxLJasaqYK2MGKRiCeHipIiCKf/VLGgJw6u+eLp2At8k5WT2hs=@vger.kernel.org
X-Gm-Message-State: APuU4Z99WW6EnPsKKDkP90wQVk7TK4/LY2OaMy+6HD2jfW/ncPuhtqJs
	KHty7tt3jEKujzkQob5Sl3MzzYhX8ifXulj4G/i3cMxM7tDq5+DEOd8Y
X-Gm-Gg: AZFdTZdpX4Q3jkH5tEa9yusMs3fin4fFIwVbm3EbdotIXy7H6E+9/8T07xo7gVsp0tF
	dC45ZkNtNyGpW4skSyS1O14oxgys/1Gv6xVr48XsVi5Lfsqxxj/oS7An/yusFJ0gYLYQ/T3hSkF
	89qDgVPue3c9U6OtxGWamS4O/YJvo9ZzQFxeR4U/3qaIn3AfD9qaloUMSVcGxgSBVnxUyufnWF1
	dd1BUCVGDHZr+JXLKeUBOFxGFbiMoi154ca9HKJxr3uBuEUXt0G2OBKEB0TBlAo27iBG9OMrJsR
	26HNPcmvAdd9UHXg0oAl8qiiwbr2bGnU2f+kJQpUGvuWx/a/xO+l9/uLtVktT88dgL40G69E/3K
	/QTbmhlhrAO/ElXQVsfIgW4OK8FMSDhjZzenXXuSoWgW861tQNdDf3t2V8PoGgAw6X3Rrsku549
	1T7isJYWGqxcp4Y057+wqwIIqC/vM7DfgaHf/3KOhJpj7NdpxhnHHaNykoPoRLa8iVrIVmF/8o4
	6ZXrnO1XqnH6FPnPtzbamHO/SiD1M44ZOc8W4SNbEWcr5PhEMWm21KkY4Cmx9iM0wyU8WIcB2ul
	H4YVrAD8cC6RJXQ+M/MgzF7rq34Xo52n+GUMnReZDF8UFefhsh2YdtfYooVgoLxlEjedHQ==
X-Received: by 2002:a05:600c:154c:b0:4ad:5ec2:d3b3 with SMTP id 5b1f17b1804b1-4bb887f43d8mr151053725e9.1.1795300925668;
        Sat, 21 Nov 2026 14:42:05 -0800 (PST)
Received: from Nuel20.localdomain ([102.90.87.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm56649275e9.4.2026.11.21.14.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 14:42:05 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: tianyi@cloudflare.com,
	hangbin.liu@linux.dev
Cc: ast@kernel.org,
	bpf@vger.kernel.org,
	daniel@iogearbox.net,
	davem@davemloft.net,
	edumazet@kernel.org,
	emmaonana18@gmail.com,
	hawk@kernel.org,
	horms@kernel.org,
	john.fastabend@gmail.com,
	kernel-team@cloudflare.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	sdf@fomichev.me,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	tianyi.gao@linux.dev
Subject: Re: [PATCH net v4 0/3] selftests: net: veth: propagate check failures to exit status
Date: Sat, 21 Nov 2026 23:41:05 +0100
Message-ID: <20261121224105.6288-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119012940.32838-1-tianyi@cloudflare.com>
References: <20261119012940.32838-1-tianyi@cloudflare.com>
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

On Thu, 19 Nov 2026 01:29:40 +0000 Tianyi Gao wrote:
> 1. Patch 3 lost its subject prefix. It went out as "[PATCH]
>    selftests: net: veth: derive invalid-tx test value from kernel
>    max", so patchwork put it in a series of its own [1].
>
> 2. Patch 3 should come first. Patch 1 makes a chk_channels()
>    failure fail the script, and from then on the nproc + 1 check
>    can fail on a correct kernel. With the fix first, no commit in
>    the series reports a false failure.
>
> 3. v4 was posted as a reply to my review of v3. A new version
>    should start a new thread, and its change log should link the
>    previous postings [2].

Thank you for the thorough review, I appreciate it. All
three are addressed in v5:
https://lore.kernel.org/all/20261121182217.4609-1-emmaonana18@gmail.com/

