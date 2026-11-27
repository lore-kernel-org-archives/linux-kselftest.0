Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774972;
	b=tbYfOa33XecxZ5D/napCFK7inVt/3HBdDMCtLVCNEUmbnZKuXLLJqL8eJpXYHvZnmaRW
	 AfxlvxEeIZHPjEUwsZzjJtlFg+EveR7MJ+vT9vWCD7qxYEBCRX1iNVW17x99/MuU5DH/B
	 5DC9jVKH05kFrXROkoivQkPZXwSLhsPJrnny0Mqc/1XO9CT0D1Nzy3gD4NyaGxXqHGHb0
	 eX1oAJLVTVFz/yOlJP8I2rF1h5J5hWFzLtKQA3FZcd+RFxql7UHpNQXNC8iizHzcii+Uk
	 JmCWS2yFaY5ujuq1I8VfWG+xpZC+wNmdM0w+wRpJNBQucKuY2S5woGM9PFatNYbYS3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BWTtel0JluNyW7ejmhmowgW5rxsZC1lv5NPPBs2x8Xs=;
	b=md766XaCXgXwDa/Vl2Bh1wLge7CNkBmwUN/xCU+k98LaO8aM0VOrNQqf5kK8a7d0yL3Z
	 dBmp4xaPBliKWgWAoA/OfJmf3Y0PsHxykwyDzsr9SSqmuZLQjBa64IEN/SGwy4wKAEQag
	 VdnoQe5EwNI+Lu4waulrgmrF+/d1x6iqczeFOewkOBS0geOIV0w5uePUQRzXlXS9jl+Jz
	 2foun3ntwoQqPOt9DsSJR2Te2FgQnhiTkvtjF39Krd/UZvRtbbgujgiuNICzEWyl1ATP1
	 nJe+vUtKy/CVaBUdneF36Shigqkj9lnG6rqzpJXbSCsBMKLIDiEijXvO4xVOpMkZFNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pEsMUJr6;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893CD606A6B8
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 10:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 893CD606A6B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pEsMUJr6
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d28f75d62so1289686266b.0
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 02:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774970; x=1796379770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWTtel0JluNyW7ejmhmowgW5rxsZC1lv5NPPBs2x8Xs=;
        b=pEsMUJr6wshyFZk9mSg9Q5aVI2hbLthWoh4EaFjx0AVrRXI+GMhL6cHAtiy5w3a1be
         XDFPG0+WH+n+c0BBOkCe+Vvt/F6CbykVNqo35ztzH43l3HSuKkg4xHhv2R7A/leDOkbo
         A4Smycbj8nJcb5c+Q8nNrt+zzg+CFR2dMHk8b4Ql+y/FAvNAy3oRX6OWz5aIa4uIkDMC
         xXrOtXYi+FE9kYyoNGj781TgU/DSE1Jotk282tt4reseJcYHJiLrmQ7c+2RayYIlse6/
         8JCGRCGMbQc4B/Wx7RR7nJKxdyI/i2+cNT35Zol4NyZzsw8xzXiKOvE+T3RpSbnPz3EG
         kkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774970; x=1796379770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BWTtel0JluNyW7ejmhmowgW5rxsZC1lv5NPPBs2x8Xs=;
        b=sNZGPi0UwWK/EvFOcinlDhXOzBzpYMLxLdh7jCYyMfsR16f6jHGrGSwTCUGvI+DkJW
         aKFWn1Cbat8bk8aInQtio2m/v/TR0+xOCEmkdm2qN6NhYcnlZiMGScCM5uLj7mwabSuV
         4VMCJqIvu/h2cSq6Rjk+uF3Fye4TlWi37Ipywe5pXYOaF02b1VN/48aHqxfsNVaqc5uV
         PIYIbzvfBMQIusFJ8TuCAv4t2KmMa1Rsz2gGdACv9c178dd1yKW7Y2IbVWcXD/vr7+9F
         9nHlTQ0dOTPQhS32+mL2glj8eTh+PeYxNuTgeTp9z7TrS6eN3lbyWAh+LNU1C+pJbp9b
         G44g==
X-Forwarded-Encrypted: i=1; AL+hErGXKv3JZwrt99HHJX3qtv2ke8IulnTW56ghREhgYnlt745JUpvHEa9rVi+dfYdSrGN99/iHCeNY+se7eNjOWnk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pGMR37Iq/7s82lLa4hCqoSDgTYqJrFNFT20JWkKJ21AVd3EJe
	yGVmpuqn5sJXs25Xmy0plVC0PCDE7QgbhMl9tv3boGV2P8d+ZWxAHYGJ
X-Gm-Gg: AZFdTZf+Qxj/5r60Z1q5tinpHCF74i2uOXXhHhrngSCWKvvzcQBxCECU6Pt3l4MDOPH
	kG7BrHk4g/L+VyrRvi3aSum2qnefF4jojB00MvJoOKc5+cOCzXUUC3xrE5P2BQ+PrIx/LpmKV4N
	ijvAS/nfaq6CUlJLM2HueLuxKR7wrT/RCzGki1JvYoxlPCIxHvKLWn5vMFk4q0du2qn2/jxksDh
	C/vSRqgIkvZmKw6qQYBiYiLbZYrWnNenRUr9o1NafGIeUctAA3iIo4oo8L+YHKyL3jDSsfuQa7w
	1JQ1dxfiHZmlXkWYSAnQVrPXB9OEW1o3J+hxi0+phpDUmmuatBBuvkrrob0R63K1RG09v79L38X
	wDkvX8So+T0mMplRddFqg/Y4FKvYBacKnoHr8ACZCQaOueqRbqV6BZLnyvhPEOZkoeUjLoQ/dqr
	+APOHX1+s0RhZHZ3i0St5YIYKZX+9/YV6iKzj0FI6hzJRMVro5h3NVB8m14fLAP6rp3UVbyXram
	OgiKWPOulI2I5D0pFPE3p3XABx7/QckPekX96UN2Mk47BYpgJOKJk2yfKwiJg4ynaKyAjf8LVMz
	29FnPLSAiCJmqSyK/vfTxOoOMaIj6Uccb677iCVirLCm7eY9+w==
X-Received: by 2002:a17:907:3d0c:b0:c31:c767:adfb with SMTP id a640c23a62f3a-c513a274fc2mr1819372866b.0.1795774969713;
        Fri, 27 Nov 2026 02:22:49 -0800 (PST)
Received: from Air-pasichndev ([188.163.8.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm895871166b.6.2026.11.27.02.22.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 02:22:49 -0800 (PST)
From: Andrii Pasichnyk <apasichnik9@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com,
	netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 0/2] wireguard: free queued packets on peer removal, and test it
Date: Fri, 27 Nov 2026 12:22:48 +0200
Message-ID: <20261127102248.49457-1-apasichnik9@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179568676064.3294.9567118397760540141@kernel.org>
References: <20261126094722.73025-1-apasichnik9@gmail.com> <179568676064.3294.9567118397760540141@kernel.org>
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

netdev-bot+sinfo@kernel.org wrote:
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

The leak was hit on a single-CPU MIPS router (Realtek RTL8196E) in
everyday use as a WireGuard gateway, and then reproduced with the
WireGuard selftest VM. v3 says so in the commit message of patch 1.

Thanks,
Andrii
